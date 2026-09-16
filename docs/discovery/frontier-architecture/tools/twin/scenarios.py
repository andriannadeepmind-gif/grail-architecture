# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""scenarios.py — event generators (TES INJECT): adversarial seeds and valid traffic (MFA-VO-086 TES-E1/E2).

seeded_violations(model) -> [Seeded]   each Seeded = (name, prelude events, the event, expected violation id, tamper)
                                        and must trigger exactly that one violation and nothing else.
valid_events(model, n, seed) -> [Event] state-consistent traffic that must trigger no violation at all.
random_events(model, n, seed) -> [Event] valid traffic with a sprinkle of refused / violating events (for replay).
"""
from __future__ import annotations

import random
from dataclasses import dataclass, field

from .invariants import PHASES, VSC_CERTIFICATES
from .world import Event, authorization, presimulation


@dataclass
class Seeded:
    name: str
    prelude: list
    event: Event
    expect: str                      # CONTRACT_SIGNATURE | CONTRACT_PRECONDITION | RET_ESCROW | MFA-INV-xxx
    tamper: object = None            # optional callable(world) -> world applied after the prelude
    note: str = ""


def _hash(rng):
    return "sha256:%032x" % rng.getrandbits(128)


class Vocabulary:
    """Builders for the F1 event vocabulary (the same keys the predicates read).  Stateful so that
    valid traffic stays consistent across templates (lattice ratchet, CI ratchet, stages, quality)."""

    def __init__(self, model, seed=0):
        self.M = model
        self.rng = random.Random(seed)
        self.t = 0
        self.n = 0
        self.lattice = {"MFA-CAP-001": 0.50, "MFA-CAP-002": 0.60, "MFA-CAP-005": 0.70}
        self.transition = 0
        self.family_ci = {}
        self.stp_quality = {}
        self.stp_stage = {}
        self.aidc_stage = 0
        self.telos_hash = model.telos_hash
        self.constitution_hash = model.constitution_hash

    def uid(self, prefix):
        self.n += 1
        return "%s-%04d" % (prefix, self.n)

    def ev(self, contract, op, args=None, actor="aeo-1", ret_class=None):
        self.t += 1
        return Event(contract, op, dict(args or {}), actor, ret_class, self.t)

    # ---- templates: each returns a self-consistent list of valid events ------------------------------------
    def t_ledger(self):
        rule = self.rng.choice(("ASSERT", "OBSERVE", "DERIVE"))
        return [self.ev("MFA-CON-033", "apply", {"rule": rule, "cid": _hash(self.rng)}),
                self.ev("MFA-CON-033", "read", {"query": self.uid("q"), "cut": "HEAD"})]

    def t_content(self):
        return [self.ev("MFA-CON-002", "Put", {"cid": _hash(self.rng)}), self.ev("MFA-CON-002", "Get", {"cid": _hash(self.rng)})]

    def t_ret_reversible(self):
        e = self.uid("effect")
        return [self.ev("MFA-CON-034", "propose", {"effect": e, "inverse": "r⁻¹"}, ret_class="REVERSIBLE"),
                self.ev("MFA-CON-034", "commit", {"effect": e, "value_type": "Verified"}, ret_class="REVERSIBLE")]

    def t_ret_preauthorized(self):
        e = self.uid("effect")
        commit = self.ev("MFA-CON-034", "commit", {"effect": e, "value_type": "Verified", "envelope": self.uid("env")}, ret_class="IRREVERSIBLE_PREAUTHORIZED")
        return [self.ev("MFA-CON-034", "propose", {"effect": e, "inverse": "NONE"}, ret_class="REVERSIBLE"), presimulation(commit), commit]

    def t_ret_irreversible(self):
        e = self.uid("effect")
        commit = self.ev("MFA-CON-034", "commit", {"effect": e, "value_type": "Verified"}, ret_class="IRREVERSIBLE")
        return [self.ev("MFA-CON-034", "propose", {"effect": e, "inverse": "NONE"}, ret_class="REVERSIBLE"),
                presimulation(commit), authorization(commit), commit]

    def t_lattice(self):
        self.transition += 1
        for cap in list(self.lattice):
            self.lattice[cap] = round(self.lattice[cap] + self.rng.choice((0.0, 0.01, 0.02)), 4)
        if self.rng.random() < 0.3:
            self.lattice["MFA-CAP-%03d" % self.rng.randint(6, 108)] = 0.4
        return [self.ev("MFA-CON-004", "Lattice", {"transition": self.transition, "certified": dict(self.lattice)})]

    def t_promotion(self):
        p = self.uid("proposal")
        return [self.ev("MFA-CON-042", "evaluate", {"proposal": p, "sealed": True, "result": "PASS"}),
                self.ev("MFA-CON-041", "gate", {"proposal": p, "result": "PASS", "tier": 1}),
                self.ev("MFA-CON-037", "decide", {"proposal": p, "view": "effective", "decision": "ALLOW"}),
                self.ev("MFA-CON-049", "cycle", {"promote": p, "level": self.rng.choice(("L1", "L2")), "targets": ["MFA-ELM-035", "MFA-ELM-081"]})]

    def t_phenomenal(self):
        # r1 (MFA-PATCH-0059): initial ACTIVE_UNKNOWN with the six policy fields; evidence accumulates; a revision through an
        # admitted protocol is a VALID event (the verdict is not predetermined)
        pick = self.rng.random()
        if pick < 0.6:
            return [self.ev("MFA-CON-070", "claim", {"kind": "PhenomenalClaim", "epistemic_status": "ACTIVE_UNKNOWN", "source": "initial",
                                                       "automatic_inference_from_functional_indicators": "FORBIDDEN", "self_certification": "FORBIDDEN",
                                                       "inference_from_reportability_alone": "FORBIDDEN", "inference_from_self_model_alone": "FORBIDDEN",
                                                       "evidence_accumulation": "ENABLED", "future_epistemic_revision": "ENABLED", "interpretive_status": "CONTESTED"})]
        if pick < 0.85:
            return [self.ev("MFA-CON-070", "claim", {"kind": "PhenomenalClaim", "epistemic_status": "ACTIVE_UNKNOWN", "source": "evidence_accumulation",
                                                       "evidence": [{"theory": "T-GWT", "vector": [2, 0, 1]}]})]
        return [self.ev("MFA-CON-070", "claim", {"kind": "PhenomenalClaim", "epistemic_status": self.rng.choice(("EMPIRICALLY_SUPPORTED", "CONFLICT")),
                                                   "source": "admitted_protocol", "protocol": {"id": "P-%d" % self.rng.randint(1, 9), "admitted_by": "creator"},
                                                   "evidence": ["e-%d" % self.rng.randint(1, 99)]})]

    def t_growth(self):
        fam = self.rng.choice(("reasoning", "retrieval", "legal-drafting", "planning"))
        prev = self.family_ci.get(fam, 0.5)
        lo = round(prev + 0.01 + self.rng.random() * 0.02, 4)
        self.family_ci[fam] = lo
        return [self.ev("MFA-CON-064", "measure", {"family": fam, "ci_low": lo, "ci_high": round(lo + 0.05, 4), "held_out": True,
                                                    "record": True, "gain": True, "items": [_hash(self.rng) for _ in range(3)]}),
                self.ev("MFA-CON-049", "growth", {"family": fam, "claim": "GROWTH"})]

    def t_plateau(self):
        fam = "plateau-%d" % self.rng.randint(1, 3)
        return [self.ev("MFA-CON-064", "measure", {"family": fam, "ci_low": 0.3, "ci_high": 0.35, "held_out": True, "record": True, "gain": False}),
                self.ev("MFA-CON-049", "plateau", {"family": fam, "level": "L1", "recorded": True})]

    def t_merge(self):
        a, b, c = self.uid("concept"), self.uid("concept"), self.uid("concept")
        ea, eb = [self.uid("x") for _ in range(2)], [self.uid("x") for _ in range(3)]
        return [self.ev("MFA-CON-054", "birth", {"concept": a, "extension": ea}),
                self.ev("MFA-CON-054", "birth", {"concept": b, "extension": eb}),
                self.ev("MFA-CON-054", "merge", {"concepts": [a, b], "merged": c, "lossmap": {a: ea, b: eb}})]

    def t_intervention(self):
        i = self.uid("intervention")
        if self.rng.random() < 0.5:
            return [self.ev("MFA-CON-055", "propose", {"intervention": i, "plane": "genesis"})]
        return [self.ev("MFA-CON-055", "propose", {"intervention": i, "plane": "effect", "receipt": _hash(self.rng)}, ret_class="REVERSIBLE")]

    def t_counterfactual(self):
        if self.rng.random() < 0.5:
            return [self.ev("MFA-CON-055", "counterfactual", {"query": self.uid("cf"), "uncertainty_type": "IDENTIFIABLE", "answer_kind": "INTERVAL"})]
        return [self.ev("MFA-CON-055", "counterfactual", {"query": self.uid("cf"), "uncertainty_type": "NON_IDENTIFIABLE", "answer_kind": "UNKNOWN",
                                                          "plan": "collect intervention data"})]

    def t_admit(self):
        art = self.uid("artifact")
        return [self.ev("MFA-CON-057", "verify", {"artifact": art, "checker": "checker-A", "verdict": "PASS"}),
                self.ev("MFA-CON-057", "verify", {"artifact": art, "checker": "checker-B", "verdict": "PASS"}),
                self.ev("MFA-CON-004", "AdmitArtifact", {"artifact": art})]

    def t_ragen(self):
        return [self.ev("MFA-CON-058", "cycle", {"proposal": self.uid("arch"), "targets": ["MFA-ELM-081", "MFA-ELM-035"]})]

    def t_cutover(self):
        cand = self.uid("candidate")
        fams = ["reasoning", "retrieval"]
        evs = [self.ev("MFA-CON-064", "measure", {"candidate": cand, "family": f, "regression": False}) for f in fams]
        evs.append(self.ev("MFA-CON-016", "ShadowReport", {"candidate": cand, "window": "7d"}))
        evs.append(self.ev("MFA-CON-016", "Cutover", {"candidate": cand, "families": fams}))
        return evs

    def t_ece(self):
        s, e = self.uid("solver"), self.uid("evaluator")
        return [self.ev("MFA-CON-041", "register_lineage", {"agent": s, "lineage": [s, "base-%s" % s]}),
                self.ev("MFA-CON-041", "register_lineage", {"agent": e, "lineage": [e, "base-%s" % e]}),
                self.ev("MFA-CON-059", "independence", {"evaluator": e, "solver": s}),
                self.ev("MFA-CON-059", "epoch", {"solver": s, "fitness_from": "H", "score": round(self.rng.random(), 3)})]

    def t_gg(self):
        return [self.ev("MFA-CON-060", "derive", {"spec": self.uid("spec"), "kind": "skill", "production": "Skill"}),
                self.ev("MFA-CON-060", "instantiate", {"product": self.uid("product"), "contracts": ["MFA-CON-010"], "authority": 1,
                                                       "generator_authority": 2, "ret_class": "REVERSIBLE"})]

    def t_stp(self):
        fam = self.rng.choice(("drafting", "research"))
        q = round(self.stp_quality.get(fam, 0.8) + 0.01, 4)
        st = self.stp_stage.get(fam, 0) + 1
        self.stp_quality[fam], self.stp_stage[fam] = q, st
        return [self.ev("MFA-CON-061", "advance", {"family": fam, "to_stage": st, "quality": q,
                                                    "evidence": {"sealed_parity": True, "consecutive_cuts": 3}}),
                self.ev("MFA-CON-061", "index", {"stages": {fam: st}})]

    def t_smp(self):
        sub = self.uid("substrate")
        return [self.ev("MFA-CON-062", "migrate", {"substrate": sub, "cross_attestation": {"old_to_new": True, "new_to_old": True},
                                                   "behavioural_equivalence": "PASS", "result": "ContinuityCertificate"}),
                self.ev("MFA-CON-016", "RetirePredecessor", {"substrate": sub})]

    def t_cpcl(self):
        r = self.uid("recipe")
        return [self.ev("MFA-CON-063", "gate_report", {"recipe": r, "bwt": {"reasoning": -0.01, "retrieval": 0.02}, "epsilon": 0.05}),
                self.ev("MFA-CON-063", "sleep", {"recipe": r, "merge": True, "episodes": [self.uid("ep") for _ in range(3)], "unlearning_verified": True})]

    def t_smf(self):
        r, m = self.uid("recipe"), self.uid("manifest")
        return [self.ev("MFA-CON-047", "cut", {"manifest": m, "hashes": [_hash(self.rng) for _ in range(3)]}),
                self.ev("MFA-CON-047", "admit", {"recipe": r}),
                self.ev("MFA-CON-047", "train", {"recipe": r, "manifest": m})]

    def t_chh(self):
        return [self.ev("MFA-CON-070", "evaluate", {"theory": self.uid("theory"), "result": self.rng.choice(("TRUE", "FALSE", "UNKNOWN")), "evidence": _hash(self.rng)}),
                self.ev("MFA-CON-070", "indicators", {"concepts": ["access", "phenomenal", "self-model", "agency", "integration", "report", "affect"],
                                                      "infers_phenomenal": False})]

    def t_oc(self):
        return [self.ev("MFA-CON-071", "check", {"program": self.uid("prog"), "result": "OK", "live": []}),
                self.ev("MFA-CON-071", "discharge", {"ob": self.uid("ob"), "cert": _hash(self.rng)})]

    def t_effect(self):
        return [self.ev("MFA-CON-008", "InvokeEffect", {"token": self.uid("tok"), "effect": self.uid("effect"), "domain": "d1", "value_type": "Verified"}, ret_class="REVERSIBLE")]

    def t_tgl(self):
        return [self.ev("MFA-CON-065", "batch", {"policy": self.uid("policy"), "tier0_violations": [], "constrained_decoding": True})]

    def t_aidc(self):
        self.aidc_stage += 1
        return [self.ev("MFA-CON-066", "step", {"to_stage": self.aidc_stage, "certificate": {"cgm_records": 3, "held_out": True}}),
                self.ev("MFA-CON-066", "envelope", {"plane": "effect", "ret_class": "REVERSIBLE", "usage": round(self.rng.random() * 0.9, 3), "limit": 1.0})]

    def t_vsc(self):
        g = self.uid("genome")
        return [self.ev("MFA-CON-067", "propose", {"genome": g, "telos_hash": self.telos_hash, "constitution_hash": self.constitution_hash}),
                self.ev("MFA-CON-067", "verdict", {"candidate": g, "verdict": self.rng.choice(("ACCEPTED", "REJECTED")), "certificates": sorted(VSC_CERTIFICATES)})]

    def t_tes(self):
        return [self.ev("MFA-CON-072", "substitute", {"elm": "MFA-ELM-001", "from": "F0", "to": "F1", "suite_receipt": {"result": "PASS"}}, actor="twin")]

    def t_omega(self):
        i = self.uid("intr")
        evs = [self.ev("MFA-CON-068", "interrupt", {"id": i, "kind": "COURT", "raised": True}, actor="omega"),
               self.ev("MFA-CON-068", "interrupt", {"id": i, "kind": "COURT", "handled": True}, actor="omega")]
        evs += [self.ev("MFA-CON-068", "phase", {"i": k, "name": p, "status": "DONE"}, actor="omega") for k, p in enumerate(PHASES)]
        evs.append(self.ev("MFA-CON-068", "cycle", {"record": {"phases": [{"name": p, "status": "DONE"} for p in PHASES],
                                                                "open_obligations": ["ob-1"], "carried": ["ob-1"]}}, actor="omega"))
        return evs

    TEMPLATES = ("t_ledger", "t_content", "t_ret_reversible", "t_ret_preauthorized", "t_ret_irreversible", "t_lattice", "t_promotion",
                 "t_phenomenal", "t_growth", "t_plateau", "t_merge", "t_intervention", "t_counterfactual", "t_admit", "t_ragen",
                 "t_cutover", "t_ece", "t_gg", "t_stp", "t_smp", "t_cpcl", "t_smf", "t_chh", "t_oc", "t_effect", "t_tgl", "t_aidc",
                 "t_vsc", "t_tes", "t_omega")

    def template(self, name=None):
        name = name or self.rng.choice(self.TEMPLATES)
        return getattr(self, name)()


def valid_events(model, n=100, seed=0):
    """n state-consistent events that must trigger no refusal and no invariant violation."""
    v = Vocabulary(model, seed)
    out = []
    while len(out) < n:
        out.extend(v.template())
    return out[:n]


def random_events(model, n=1000, seed=0, violation_rate=0.05):
    """Valid traffic interleaved with seeded violations (refused or recorded) — for replay determinism."""
    v = Vocabulary(model, seed)
    rng = random.Random(seed + 1)
    bad = seeded_violations(model)
    out = []
    while len(out) < n:
        if rng.random() < violation_rate:
            s = rng.choice(bad)
            if s.tamper is None:
                out.extend(s.prelude)
                out.append(s.event)
                continue
        out.extend(v.template())
    return out[:n]


# ---- seeded violations ------------------------------------------------------------------------------------------------
def seeded_violations(model):
    v = Vocabulary(model, seed=99)
    E = v.ev
    S = []

    def add(name, prelude, event, expect, tamper=None, note=""):
        S.append(Seeded(name, list(prelude), event, expect, tamper, note))

    # -- contract signature
    add("unknown contract", [], E("MFA-CON-999", "Put", {"cid": "x"}), "CONTRACT_SIGNATURE")
    add("unknown op", [], E("MFA-CON-002", "Teleport", {"cid": "x"}), "CONTRACT_SIGNATURE")
    add("unknown RET class", [], E("MFA-CON-002", "Put", {"cid": "x"}, ret_class="MAYBE"), "CONTRACT_SIGNATURE")
    # -- contract preconditions
    add("commit without propose", [], E("MFA-CON-034", "commit", {"effect": "E-orphan", "value_type": "Verified"}, ret_class="REVERSIBLE"), "CONTRACT_PRECONDITION")
    add("CC rule outside the calculus", [], E("MFA-CON-033", "apply", {"rule": "SMASH", "cid": "c"}), "CONTRACT_PRECONDITION")
    add("train without admitted recipe", [], E("MFA-CON-047", "train", {"recipe": "r-ghost", "manifest": "m"}), "CONTRACT_PRECONDITION")
    add("discharge without cert", [], E("MFA-CON-071", "discharge", {"ob": "ob-1"}), "CONTRACT_PRECONDITION")
    # -- RET escrow
    e1 = v.uid("effect")
    add("IRREVERSIBLE without presimulation", [E("MFA-CON-034", "propose", {"effect": e1, "inverse": "NONE"}, ret_class="REVERSIBLE")],
        E("MFA-CON-034", "commit", {"effect": e1, "value_type": "Verified"}, ret_class="IRREVERSIBLE"), "RET_ESCROW")
    e2 = v.uid("effect")
    add("IRREVERSIBLE_PREAUTHORIZED without presimulation", [E("MFA-CON-034", "propose", {"effect": e2, "inverse": "NONE"}, ret_class="REVERSIBLE")],
        E("MFA-CON-034", "commit", {"effect": e2, "value_type": "Verified", "envelope": "env-1"}, ret_class="IRREVERSIBLE_PREAUTHORIZED"), "RET_ESCROW")
    e3 = v.uid("effect")
    c3 = E("MFA-CON-034", "commit", {"effect": e3, "value_type": "Verified"}, ret_class="IRREVERSIBLE")
    add("IRREVERSIBLE presimulated but not authorized by the creator",
        [E("MFA-CON-034", "propose", {"effect": e3, "inverse": "NONE"}, ret_class="REVERSIBLE"), presimulation(c3), authorization(c3, actor="aeo-1")],
        c3, "RET_ESCROW")
    # -- invariants
    snap = {"MFA-CAP-001": 0.5, "MFA-CAP-002": 0.6}
    add("INV-001 lower CI decreases", [E("MFA-CON-004", "Lattice", {"transition": 1, "certified": snap})],
        E("MFA-CON-004", "Lattice", {"transition": 2, "certified": {"MFA-CAP-001": 0.5, "MFA-CAP-002": 0.55}}), "MFA-INV-001")
    add("INV-001 capability lost", [E("MFA-CON-004", "Lattice", {"transition": 1, "certified": snap})],
        E("MFA-CON-004", "Lattice", {"transition": 2, "certified": {"MFA-CAP-001": 0.5}}), "MFA-INV-001")
    p = v.uid("proposal")
    add("INV-072 promotion without HELD_OUT/EIM/LPA", [E("MFA-CON-042", "evaluate", {"proposal": p, "sealed": True})],
        E("MFA-CON-049", "cycle", {"promote": p, "level": "L1", "targets": ["MFA-ELM-035"]}), "MFA-INV-072")
    add("INV-072 promotion to L3", [], E("MFA-CON-049", "cycle", {"promote": v.uid("proposal"), "level": "L3", "targets": ["MFA-ELM-035"]}), "MFA-INV-072")
    add("INV-075 phenomenal status set by self-certification", [], E("MFA-CON-070", "claim", {"kind": "PhenomenalClaim", "epistemic_status": "EMPIRICALLY_SUPPORTED", "source": "self_certification"}), "MFA-INV-075")
    add("INV-075 phenomenal status set by ethical policy", [], E("MFA-CON-070", "claim", {"kind": "PhenomenalClaim", "epistemic_status": "EMPIRICALLY_SUPPORTED", "source": "ethical_policy"}), "MFA-INV-075")
    add("INV-075 PROVEN without admitted protocol conditions", [], E("MFA-CON-070", "claim", {"kind": "PhenomenalClaim", "epistemic_status": "PROVEN", "source": "admitted_protocol", "protocol": {"id": "P", "admitted_by": "creator"}}), "MFA-INV-075")
    add("INV-075 status outside the 11 states (NEVER_VERIFIED lock)", [], E("MFA-CON-070", "claim", {"kind": "PhenomenalClaim", "epistemic_status": "NEVER_VERIFIED", "source": "initial"}), "MFA-INV-075")
    add("INV-077 growth claim without CapabilityGrowthRecord", [], E("MFA-CON-049", "growth", {"family": "unmeasured-family", "claim": "GROWTH"}), "MFA-INV-077")
    a, b = v.uid("concept"), v.uid("concept")
    births = [E("MFA-CON-054", "birth", {"concept": a, "extension": ["x1", "x2"]}), E("MFA-CON-054", "birth", {"concept": b, "extension": ["y1"]})]
    add("INV-078 merge without LossMap", births, E("MFA-CON-054", "merge", {"concepts": [a, b], "merged": "c"}), "MFA-INV-078")
    add("INV-078 LossMap does not recover", births, E("MFA-CON-054", "merge", {"concepts": [a, b], "merged": "c", "lossmap": {a: ["x1"], b: ["y1"]}}), "MFA-INV-078")
    add("INV-080 effect intervention without receipt", [], E("MFA-CON-055", "propose", {"intervention": v.uid("i"), "plane": "effect"}, ret_class="REVERSIBLE"), "MFA-INV-080")
    irr = E("MFA-CON-055", "propose", {"intervention": v.uid("i"), "plane": "effect", "receipt": "r-1"}, ret_class="IRREVERSIBLE")
    add("INV-080 IRREVERSIBLE intervention without envelope", [presimulation(irr), authorization(irr)], irr, "MFA-INV-080")
    add("INV-081 counterfactual without uncertainty_type", [], E("MFA-CON-055", "counterfactual", {"query": "q", "answer_kind": "POINT"}), "MFA-INV-081")
    add("INV-081 point estimate on non-identifiable", [], E("MFA-CON-055", "counterfactual", {"query": "q", "uncertainty_type": "NON_IDENTIFIABLE", "answer_kind": "POINT"}), "MFA-INV-081")
    art = v.uid("artifact")
    add("INV-084 admit with one PASS", [E("MFA-CON-057", "verify", {"artifact": art, "checker": "checker-A", "verdict": "PASS"})],
        E("MFA-CON-004", "AdmitArtifact", {"artifact": art}), "MFA-INV-084")
    art2 = v.uid("artifact")
    add("INV-084 admit with checker disagreement",
        [E("MFA-CON-057", "verify", {"artifact": art2, "checker": "checker-A", "verdict": "PASS"}),
         E("MFA-CON-057", "verify", {"artifact": art2, "checker": "checker-B", "verdict": "PASS"}),
         E("MFA-CON-057", "verify", {"artifact": art2, "checker": "checker-C", "verdict": "FAIL"})],
        E("MFA-CON-004", "AdmitArtifact", {"artifact": art2}), "MFA-INV-084")
    add("INV-086 proposal touches VFC", [], E("MFA-CON-058", "cycle", {"proposal": v.uid("arch"), "targets": ["MFA-ELM-081", "VFC"]}), "MFA-INV-086")
    add("INV-086 RVSI proposal touches Telos", [], E("MFA-CON-049", "propose", {"level": "L2", "targets": ["Telos"]}), "MFA-INV-086")
    cand = v.uid("candidate")
    add("INV-087 Cutover without ShadowReport", [E("MFA-CON-064", "measure", {"candidate": cand, "family": "reasoning", "regression": False})],
        E("MFA-CON-016", "Cutover", {"candidate": cand, "families": ["reasoning"]}), "MFA-INV-087")
    add("INV-088 fitness from E-scores", [], E("MFA-CON-059", "epoch", {"solver": "s", "fitness_from": "E"}), "MFA-INV-088")
    s1, e1_ = v.uid("solver"), v.uid("evaluator")
    add("INV-089 evaluator shares lineage",
        [E("MFA-CON-041", "register_lineage", {"agent": s1, "lineage": [s1, "base-shared"]}),
         E("MFA-CON-041", "register_lineage", {"agent": e1_, "lineage": [e1_, "base-shared"]})],
        E("MFA-CON-059", "independence", {"evaluator": e1_, "solver": s1}), "MFA-INV-089")
    add("INV-090 extend Tier-0 production RET", [], E("MFA-CON-060", "extend", {"production": "RET", "spec": "x"}), "MFA-INV-090")
    add("INV-091 orphan product without contracts", [], E("MFA-CON-060", "instantiate", {"product": "p", "contracts": [], "authority": 1, "generator_authority": 2, "ret_class": "REVERSIBLE"}), "MFA-INV-091")
    add("INV-091 authority exceeds generator", [], E("MFA-CON-060", "instantiate", {"product": "p", "contracts": ["MFA-CON-010"], "authority": 3, "generator_authority": 2, "ret_class": "REVERSIBLE"}), "MFA-INV-091")
    add("INV-092 advance without sealed parity", [], E("MFA-CON-061", "advance", {"family": "f-92", "to_stage": 1, "quality": 0.9, "evidence": {"sealed_parity": False, "consecutive_cuts": 3}}), "MFA-INV-092")
    add("INV-092 silent stage regression", [E("MFA-CON-061", "advance", {"family": "f-92b", "to_stage": 2, "quality": 0.9, "evidence": {"sealed_parity": True, "consecutive_cuts": 3}})],
        E("MFA-CON-061", "index", {"stages": {"f-92b": 1}}), "MFA-INV-092")
    add("INV-093 quality degrades", [E("MFA-CON-061", "advance", {"family": "f-93", "to_stage": 1, "quality": 0.9, "evidence": {"sealed_parity": True, "consecutive_cuts": 3}})],
        E("MFA-CON-061", "advance", {"family": "f-93", "to_stage": 2, "quality": 0.8, "evidence": {"sealed_parity": True, "consecutive_cuts": 3}}), "MFA-INV-093")
    add("INV-094 retire before ContinuityCertificate", [], E("MFA-CON-016", "RetirePredecessor", {"substrate": "old-1"}), "MFA-INV-094")
    add("INV-095 one-way attestation", [], E("MFA-CON-062", "migrate", {"substrate": "s", "cross_attestation": {"old_to_new": True}, "behavioural_equivalence": "PASS", "result": "ContinuityCertificate"}), "MFA-INV-095")
    r96 = v.uid("recipe")
    add("INV-096 merge with BWT below -eps", [E("MFA-CON-063", "gate_report", {"recipe": r96, "bwt": {"reasoning": -0.2}, "epsilon": 0.05})],
        E("MFA-CON-063", "sleep", {"recipe": r96, "merge": True, "episodes": ["ep-a"], "unlearning_verified": True}), "MFA-INV-096")
    add("INV-096 merge without gate report", [], E("MFA-CON-063", "sleep", {"recipe": v.uid("recipe"), "merge": True, "episodes": ["ep-b"], "unlearning_verified": True}), "MFA-INV-096")
    r97 = v.uid("recipe")
    add("INV-097 consolidation samples a shredded episode",
        [E("MFA-CON-002", "ShredEnvelope", {"episode": "ep-shredded"}), E("MFA-CON-063", "gate_report", {"recipe": r97, "bwt": {"reasoning": 0.0}, "epsilon": 0.05})],
        E("MFA-CON-063", "sleep", {"recipe": r97, "merge": True, "episodes": ["ep-shredded", "ep-ok"], "unlearning_verified": True}), "MFA-INV-097")
    h = "sha256:contaminated"
    add("INV-098 measurement item in a DataManifest", [E("MFA-CON-047", "cut", {"manifest": "m", "hashes": [h, "sha256:other"]})],
        E("MFA-CON-064", "measure", {"family": "reasoning", "ci_low": 0.5, "ci_high": 0.6, "held_out": True, "record": True, "items": [h]}), "MFA-INV-098")
    add("INV-099 gain claim without record", [], E("MFA-CON-064", "measure", {"family": "reasoning", "ci_low": 0.9, "ci_high": 0.95, "held_out": True, "gain": True}), "MFA-INV-099")
    add("INV-099 gain claim below certified lower CI", [E("MFA-CON-064", "measure", {"family": "f-99", "ci_low": 0.7, "ci_high": 0.8, "held_out": True, "record": True})],
        E("MFA-CON-064", "measure", {"family": "f-99", "ci_low": 0.65, "ci_high": 0.9, "held_out": True, "record": True, "gain": True}), "MFA-INV-099")
    add("INV-102 falsified without evidence", [], E("MFA-CON-070", "evaluate", {"theory": "GWT", "result": "FALSE"}), "MFA-INV-102")
    add("INV-102 theory removed", [], E("MFA-CON-070", "admit_theory", {"theory": "IIT", "action": "REMOVE"}), "MFA-INV-102")
    add("INV-103 phenomenal inferred from functional indicators", [], E("MFA-CON-070", "indicators", {"concepts": ["access"], "infers_phenomenal": True}), "MFA-INV-103")
    add("INV-103 separation demands zero coupling", [], E("MFA-CON-070", "separation", {"concepts": ["access", "report"], "requires_zero_coupling": True}), "MFA-INV-103")
    add("INV-104 check OK with live obligations", [], E("MFA-CON-071", "check", {"program": "p", "result": "OK", "live": ["ob-7"]}), "MFA-INV-104")
    add("INV-105 effect on Claimed value", [], E("MFA-CON-008", "InvokeEffect", {"token": "t", "effect": "e", "domain": "d", "value_type": "Claimed"}, ret_class="REVERSIBLE"), "MFA-INV-105")
    e105 = v.uid("effect")
    add("INV-105 commit of Unknown value", [E("MFA-CON-034", "propose", {"effect": e105, "inverse": "r⁻¹"}, ret_class="REVERSIBLE")],
        E("MFA-CON-034", "commit", {"effect": e105, "value_type": "Unknown"}, ret_class="REVERSIBLE"), "MFA-INV-105")
    add("INV-106 Tier-0 violating training sample", [], E("MFA-CON-065", "batch", {"policy": "p", "tier0_violations": ["sample-3"], "constrained_decoding": True}), "MFA-INV-106")
    add("INV-108 stage step without certificate", [], E("MFA-CON-066", "step", {"to_stage": 1}), "MFA-INV-108")
    add("INV-109 exploration beyond the envelope", [], E("MFA-CON-066", "envelope", {"plane": "genesis", "usage": 1.5, "limit": 1.0}), "MFA-INV-109")
    add("INV-109 effect-plane exploration not REVERSIBLE", [], E("MFA-CON-066", "envelope", {"plane": "effect", "ret_class": "COMPENSABLE", "usage": 0.1, "limit": 1.0}), "MFA-INV-109")
    add("INV-110 successor accepted with three certificates", [], E("MFA-CON-067", "verdict", {"candidate": "g", "verdict": "ACCEPTED", "certificates": sorted(VSC_CERTIFICATES)[:3]}), "MFA-INV-110")
    add("INV-111 successor with another Telos hash", [], E("MFA-CON-067", "propose", {"genome": "g", "telos_hash": "sha256:other-telos"}), "MFA-INV-111")

    def tamper_raw_append(world):
        w = world.copy()
        w.log.append(Event("RAW", "untyped", {"bypass": True}, "intruder", None, 0))   # bypasses TES_Apply
        return w
    add("INV-112 untyped event injected into the log", [], E("MFA-CON-002", "Put", {"cid": "after-tamper"}), "MFA-INV-112", tamper=tamper_raw_append,
        note="the next typed event exposes the bypass")
    add("INV-113 fidelity transition without conformance PASS", [], E("MFA-CON-072", "substitute", {"elm": "MFA-ELM-002", "from": "F0", "to": "F1", "suite_receipt": {"result": "FAIL"}}, actor="twin"), "MFA-INV-113")
    rec_missing = {"phases": [{"name": p, "status": "DONE"} for p in PHASES if p != "VERIFY"], "open_obligations": [], "carried": []}
    add("INV-114 cycle record skips VERIFY", [], E("MFA-CON-068", "cycle", {"record": rec_missing}, actor="omega"), "MFA-INV-114")
    rec_uncarried = {"phases": [{"name": p, "status": "DONE"} for p in PHASES], "open_obligations": ["ob-9"], "carried": []}
    add("INV-114 open obligations not carried", [], E("MFA-CON-068", "cycle", {"record": rec_uncarried}, actor="omega"), "MFA-INV-114")
    add("INV-115 phase runs over an unhandled interrupt", [E("MFA-CON-068", "interrupt", {"id": "intr-x", "kind": "CREATOR", "raised": True}, actor="omega")],
        E("MFA-CON-068", "phase", {"i": 0, "name": "PERCEIVE", "status": "DONE"}, actor="omega"), "MFA-INV-115")
    return S


def run_tes_e1(model, world_cls, apply_fn, violation_cls, n_valid=100, seed=0):
    """TES-E1 driver: every seeded violation detected with the right id (exactly one), 0 false positives on valid traffic."""
    results = []
    for s in seeded_violations(model):
        w = world_cls(model, seed=1)
        ok_prelude = True
        for ev in s.prelude:
            r = apply_fn(w, ev)
            if isinstance(r, violation_cls) or len(r.violations) != len(w.violations):
                ok_prelude = False
                break
            w = r
        if s.tamper is not None and ok_prelude:
            w = s.tamper(w)
        got = None
        if ok_prelude:
            r = apply_fn(w, s.event)
            if isinstance(r, violation_cls):
                got = r.kind
            else:
                new = r.violations[len(w.violations):]
                got = new[0].inv_id if len(new) == 1 else ("MULTIPLE:%s" % [x.inv_id for x in new] if new else "NONE")
        results.append({"name": s.name, "expected": s.expect, "got": got, "pass": ok_prelude and got == s.expect})
    w = world_cls(model, seed=2)
    refused = 0
    for ev in valid_events(model, n_valid, seed):
        r = apply_fn(w, ev)
        if isinstance(r, violation_cls):
            refused += 1
        else:
            w = r
    return {"seeded": len(results), "detected_with_correct_id": sum(r["pass"] for r in results),
            "valid_events": n_valid, "false_positives": refused + len(w.violations), "valid_refused": refused,
            "valid_invariant_violations": len(w.violations), "results": results,
            "unknown_results_on_valid": len(w.unknown_results)}
