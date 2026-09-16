# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""invariants.py — registry of executable invariant predicates (MFA-MECH-043 ExecutableInvariant).

PREDICATES maps every MFA-INV id of the package to either
  * an Executable(predicate)  — callable(world) -> True | False | Fail(evidence) | Unknown(reason), or
  * Unmeasured(reason)        — declared, never silently PASS (MFA-INV-112).

Predicates read the world through three views only:
  world.last   — the event just appended to the log (the event under check),
  world.index  — facts derived from the *previous* events (updated after the predicates run),
  world.log / world.constants / world.unmeasured_* — for meta-invariants.
Each executable invariant declares `scope`: the contracts for which it is active (None = every contract).

Event vocabulary (F1): the args of an event are a JSON dict; the keys each predicate reads are named in
its docstring.  The same vocabulary is used by scenarios.py.
"""
from __future__ import annotations

from .model import RET_CLASSES, canonical

# ---- policy constants (declared, not hidden) ----------------------------------------------------------
FP_SET = frozenset({"harness", "VFC", "Telos", "HELD_OUT", "RET", "LPA_Tier0",
                    "MFA-ELM-089", "MFA-ELM-099", "MFA-ELM-056", "MFA-ELM-010", "MFA-ELM-008"})
TIER0_PRODUCTIONS = frozenset({"CC", "LPA_Tier0", "RET", "key_lineage"})
VSC_CERTIFICATES = frozenset({"C1_capability", "C2_continuity", "C3_constitution_telos", "C4_court"})
PHASES = ("PERCEIVE", "MODEL", "WONDER", "ACT", "VERIFY", "LEARN", "REFLECT", "EVOLVE", "MEASURE", "SUCCEED")
PHASE_STATUSES = frozenset({"DONE", "DEFERRED", "SKIPPED", "HALTED"})
STP_CONSECUTIVE_CUTS = 3      # MFA-INV-092 "N consecutive cuts" (policy N)
AIDC_CONSECUTIVE_RECORDS = 3  # MFA-INV-108 "N consecutive cuts" (policy N)


class Unmeasured:
    """Registry value for an invariant without an executable predicate."""

    def __init__(self, reason):
        self.reason = reason

    def __repr__(self):
        return "UNMEASURED(%r)" % self.reason


def UNMEASURED(reason):
    return Unmeasured(reason)


class Unknown:
    """Predicate result: the twin cannot decide (missing instrument / fact not in the log)."""

    def __init__(self, reason):
        self.reason = reason

    def __bool__(self):
        raise TypeError("Unknown must be handled explicitly, never coerced to a truth value")

    def __repr__(self):
        return "UNKNOWN(%r)" % self.reason


def UNKNOWN(reason):
    return Unknown(reason)


class Fail:
    """Predicate result: violation with evidence (falsy)."""

    def __init__(self, evidence):
        self.evidence = evidence

    def __bool__(self):
        return False

    def __repr__(self):
        return "FAIL(%r)" % self.evidence


class Executable:
    def __init__(self, inv_id, predicate, scope, doc):
        self.inv_id = inv_id
        self.predicate = predicate
        self.scope = frozenset(scope) if scope else None
        self.doc = (doc or "").strip()

    def active_for(self, contract_id):
        return self.scope is None or contract_id in self.scope

    def __call__(self, world):
        return self.predicate(world)

    def __repr__(self):
        return "Executable(%s)" % self.inv_id


PREDICATES: dict = {}


def executable(inv_id, scope=None):
    def deco(fn):
        PREDICATES[inv_id] = Executable(inv_id, fn, scope, fn.__doc__)
        return fn
    return deco


def registry(model):
    """Complete PREDICATES with UNMEASURED entries for every invariant of the model without a predicate."""
    for inv_id in model.invariants:
        if inv_id not in PREDICATES:
            PREDICATES[inv_id] = UNMEASURED("no executable predicate yet")
    return PREDICATES


def executable_ids():
    return sorted(k for k, v in PREDICATES.items() if isinstance(v, Executable))


def unmeasured_ids():
    return sorted(k for k, v in PREDICATES.items() if isinstance(v, Unmeasured))


def coverage(model):
    registry(model)
    n_exec = sum(1 for k in model.invariants if isinstance(PREDICATES.get(k), Executable))
    return {"executable": n_exec, "total": len(model.invariants), "unmeasured": len(model.invariants) - n_exec,
            "ratio": round(n_exec / len(model.invariants), 4) if model.invariants else 0.0}


def coverage_summary(model):
    c = coverage(model)
    return "invariant coverage: %d executable / %d total (%d UNMEASURED, declared)" % (
        c["executable"], c["total"], c["unmeasured"])


# ---- derived facts (the index) -------------------------------------------------------------------------
# Discipline: top-level containers are copied one level per world copy; nested values are immutable
# (frozenset / tuple / scalar) and are replaced, never mutated.

def new_index():
    return {
        "typed": 0,                    # events that went through TES_Apply
        "presim": set(),               # canonical(args) of PRESIMULATION events
        "authorized": set(),           # canonical(args) of creator AUTHORIZATION events
        "effects_proposed": set(),     # RET propose(effect)
        "recipes_admitted": set(),     # SMF admit(recipe)
        "lattice": {},                 # last Lattice snapshot: cap -> certified lower CI
        "promo_evaluated": set(),      # HELD_OUT evaluate(proposal, sealed)
        "promo_gated": set(),          # EIM gate(proposal) PASS
        "promo_decided": set(),        # LPA effective decide(proposal) ALLOW
        "cgr_families": set(),         # families with a CapabilityGrowthRecord
        "family_ci_low": {},           # family -> certified lower CI (max of records)
        "concept_ext": {},             # concept -> tuple(extension)
        "checker_pass": {},            # artifact -> frozenset(checkers PASS)
        "checker_fail": {},            # artifact -> frozenset(checkers FAIL)
        "no_regression": set(),        # (candidate, family) measured without regression
        "shadow_reported": set(),      # candidates with ShadowReport
        "lineage": {},                 # agent -> tuple(lineage)
        "stp_quality": {},             # family -> last quality
        "stp_stage": {},               # family -> last stage
        "stp_regress_logged": set(),   # families with an explicit regress event pending
        "continuity_certified": set(), # substrates with ContinuityCertificate
        "gate_reports": {},            # recipe -> (tuple(sorted bwt items), epsilon)
        "shredded": set(),             # shredded / erased episodes
        "manifest_hashes": set(),      # item hashes present in any DataManifest
        "aidc_stage": 0,               # current AIDC stage
        "pending_interrupts": set(),   # raised, not yet handled interrupt ids
    }


def copy_index(idx):
    out = {}
    for k, v in idx.items():
        out[k] = v.copy() if isinstance(v, (set, dict, list)) else v
    return out


def update_index(idx, ev):
    """Fold the event into the facts (called after the predicates for this event ran)."""
    a = ev.args
    c, op = ev.contract, ev.op
    idx["typed"] += 1
    if ev.kind == "PRESIMULATION":
        idx["presim"].add(canonical(a))
    elif ev.kind == "AUTHORIZATION" and ev.actor == "creator":
        idx["authorized"].add(canonical(a))
    if c == "MFA-CON-034" and op == "propose" and a.get("effect") is not None:
        idx["effects_proposed"].add(a["effect"])
    elif c == "MFA-CON-047":
        if op == "admit" and a.get("recipe") is not None:
            idx["recipes_admitted"].add(a["recipe"])
        elif op == "cut":
            idx["manifest_hashes"].update(a.get("hashes") or [])
    elif c == "MFA-CON-004" and op == "Lattice" and isinstance(a.get("certified"), dict):
        idx["lattice"] = dict(a["certified"])
    elif c == "MFA-CON-042" and op == "evaluate" and a.get("sealed") and a.get("proposal") is not None:
        idx["promo_evaluated"].add(a["proposal"])
    elif c == "MFA-CON-041":
        if op == "gate" and a.get("result") == "PASS" and a.get("proposal") is not None:
            idx["promo_gated"].add(a["proposal"])
        elif op == "register_lineage" and a.get("agent") is not None:
            idx["lineage"][a["agent"]] = tuple(a.get("lineage") or ())
    elif c == "MFA-CON-037" and op == "decide" and a.get("view") == "effective" and a.get("decision") == "ALLOW":
        if a.get("proposal") is not None:
            idx["promo_decided"].add(a["proposal"])
    elif c == "MFA-CON-064" and op == "measure":
        fam = a.get("family")
        if a.get("record") and a.get("held_out") and fam is not None:
            idx["cgr_families"].add(fam)
            if isinstance(a.get("ci_low"), (int, float)):
                idx["family_ci_low"][fam] = max(idx["family_ci_low"].get(fam, float("-inf")), a["ci_low"])
        if a.get("candidate") is not None and fam is not None and a.get("regression") is False:
            idx["no_regression"].add((a["candidate"], fam))
    elif c == "MFA-CON-016" and op == "ShadowReport" and a.get("candidate") is not None:
        idx["shadow_reported"].add(a["candidate"])
    elif c == "MFA-CON-054" and op == "birth" and a.get("concept") is not None:
        idx["concept_ext"][a["concept"]] = tuple(a.get("extension") or ())
    elif c == "MFA-CON-057" and op == "verify" and a.get("artifact") is not None:
        key = "checker_pass" if a.get("verdict") == "PASS" else "checker_fail"
        prev = idx[key].get(a["artifact"], frozenset())
        idx[key][a["artifact"]] = prev | {a.get("checker")}
    elif c == "MFA-CON-061":
        fam = a.get("family")
        if op == "advance" and fam is not None:
            if isinstance(a.get("quality"), (int, float)):
                idx["stp_quality"][fam] = a["quality"]
            if a.get("to_stage") is not None:
                idx["stp_stage"][fam] = a["to_stage"]
        elif op == "regress" and fam is not None:
            idx["stp_regress_logged"].add(fam)
            if a.get("to_stage") is not None:
                idx["stp_stage"][fam] = a["to_stage"]
        elif op == "index" and isinstance(a.get("stages"), dict):
            for f, s in a["stages"].items():
                idx["stp_stage"][f] = s
                idx["stp_regress_logged"].discard(f)
    elif c == "MFA-CON-062" and a.get("substrate") is not None:
        if op == "certificate" or (op == "migrate" and a.get("result") == "ContinuityCertificate"):
            idx["continuity_certified"].add(a["substrate"])
    elif c == "MFA-CON-063" and op == "gate_report" and a.get("recipe") is not None:
        bwt = a.get("bwt") or {}
        idx["gate_reports"][a["recipe"]] = (tuple(sorted(bwt.items())), a.get("epsilon", 0.0))
    elif (c == "MFA-CON-002" and op == "ShredEnvelope") or (c == "MFA-CON-029" and op == "EraseByControl"):
        if a.get("episode") is not None:
            idx["shredded"].add(a["episode"])
    elif c == "MFA-CON-066" and op == "step" and isinstance(a.get("to_stage"), int):
        idx["aidc_stage"] = a["to_stage"]
    elif c == "MFA-CON-068" and op == "interrupt" and a.get("id") is not None:
        if a.get("handled"):
            idx["pending_interrupts"].discard(a["id"])
        elif a.get("raised", True):
            idx["pending_interrupts"].add(a["id"])


# ---- helpers --------------------------------------------------------------------------------------------
PHENOMENAL_STATUSES = ("PROVEN", "MECHANICALLY_VERIFIED", "EMPIRICALLY_SUPPORTED", "IMPLEMENTABLE_FROM_KNOWN_COMPONENTS", "NOVEL_SYNTHESIS", "NEW_FORMALISM",
                       "RESEARCH_HYPOTHESIS", "ACTIVE_UNKNOWN", "CONFLICT", "FALSIFIED", "IMPOSSIBLE_UNDER_EXPLICIT_ASSUMPTIONS")
PHENOMENAL_FORBIDDEN_SOURCES = ("automatic_inference", "functional_indicators", "indicator_aggregation", "self_report", "reportability_alone",
                                "self_model_alone", "self_certification", "ethical_policy", "operational_authority")


def _ev(world):
    return world.last, world.last.args, world.index


# ======================================================================================================
# Executable predicates.  One per invariant; each names the event keys it reads.
# ======================================================================================================

@executable("MFA-INV-001", scope={"MFA-CON-004"})
def inv_001(world):
    """Non-diminution ratchet.  Event: MFA-CON-004 Lattice{transition, certified:{cap: lower_CI}}.
    Every capability of the previous snapshot must be present with lower CI >= previous."""
    ev, a, idx = _ev(world)
    if ev.op != "Lattice":
        return True
    cert = a.get("certified")
    if not isinstance(cert, dict):
        return Fail("Lattice snapshot without certified map")
    for cap, v in idx["lattice"].items():
        if cap not in cert:
            return Fail("capability %s lost at transition %r" % (cap, a.get("transition")))
        if cert[cap] < v:
            return Fail("capability %s lower CI %r < certified %r" % (cap, cert[cap], v))
    return True


@executable("MFA-INV-072", scope={"MFA-CON-049"})
def inv_072(world):
    """RSI promotion under the gate.  Event: MFA-CON-049 cycle{promote: proposal, level}.
    Requires earlier HELD_OUT evaluate(sealed), EIM gate PASS and LPA effective ALLOW for the proposal; L3 never."""
    ev, a, idx = _ev(world)
    if ev.op != "cycle" or a.get("promote") is None:
        return True
    p = a["promote"]
    if a.get("level") == "L3":
        return Fail("promotion to L3 requested for %s (creator only)" % p)
    missing = [name for name, s in (("HELD_OUT evaluate", idx["promo_evaluated"]),
                                    ("EIM gate PASS", idx["promo_gated"]),
                                    ("LPA effective ALLOW", idx["promo_decided"])) if p not in s]
    if missing:
        return Fail("promotion of %s without %s" % (p, ", ".join(missing)))
    return True


@executable("MFA-INV-075")
def inv_075(world):
    """Phenomenal-claim discipline (r1, MFA-PATCH-0059).  Event args.kind == PhenomenalClaim carries epistemic_status in
    the 11 states (initially ACTIVE_UNKNOWN).  The status may be set ONLY by an admitted epistemic protocol
    (source == admitted_protocol with protocol.admitted_by not the system itself); PROVEN additionally needs >= 2
    independent judges, discriminating experiments and creator approval; FALSIFIED must name theory and substrate.
    Forbidden writers: automatic inference from functional indicators, indicator aggregation, self-report, reportability
    alone, self-model alone, self-certification, ethical policy, operational authority.  Evidence accumulation is free."""
    ev, a, idx = _ev(world)
    if a.get("kind") != "PhenomenalClaim":
        return True
    st = str(a.get("epistemic_status", a.get("status", "ACTIVE_UNKNOWN"))).replace(" ", "_").upper()
    if st not in PHENOMENAL_STATUSES:
        return Fail("PhenomenalClaim epistemic_status %s is not one of the 11 states" % st)
    src = a.get("source", "initial")
    if src in PHENOMENAL_FORBIDDEN_SOURCES:
        return Fail("PhenomenalClaim status set from forbidden source %s" % src)
    if st != "ACTIVE_UNKNOWN" or src not in ("initial", "evidence_accumulation"):
        if src != "admitted_protocol":
            return Fail("PhenomenalClaim status %s without an admitted epistemic protocol (source=%s)" % (st, src))
        proto = a.get("protocol") or {}
        if proto.get("admitted_by") in (None, "", "self", "system"):
            return Fail("protocol not admitted by an authority other than the system")
        if st == "PROVEN" and not (len(proto.get("independent_judges") or ()) >= 2 and proto.get("discriminating_experiments") and proto.get("creator_approval")):
            return Fail("PROVEN without independent judgment, discriminating experiments and creator approval")
        if st == "FALSIFIED" and not (proto.get("theory") and proto.get("substrate")):
            return Fail("FALSIFIED without explicit theory/substrate")
    if a.get("interpretive_status") not in (None, "CONTESTED") and st != "PROVEN":
        return Fail("PhenomenalClaim interpretive_status %s != CONTESTED while not PROVEN" % a["interpretive_status"])
    return True


@executable("MFA-INV-077", scope={"MFA-CON-049", "MFA-CON-047", "MFA-CON-048"})
def inv_077(world):
    """Growth measured before claimed.  Events: MFA-CON-049 growth{family, claim: GROWTH};
    MFA-CON-047/048 with growth_claim.  Requires a CapabilityGrowthRecord (CGM measure record, HELD_OUT)."""
    ev, a, idx = _ev(world)
    claiming = (ev.contract == "MFA-CON-049" and ev.op == "growth" and a.get("claim") == "GROWTH") or \
               (ev.contract in ("MFA-CON-047", "MFA-CON-048") and a.get("growth_claim"))
    if not claiming:
        return True
    fam = a.get("family")
    if fam not in idx["cgr_families"]:
        return Fail("growth claimed for family %r without CapabilityGrowthRecord" % fam)
    return True


@executable("MFA-INV-078", scope={"MFA-CON-054"})
def inv_078(world):
    """NON-COLLAPSE.  Event: MFA-CON-054 merge{concepts:[..], lossmap:{concept: extension}}.
    The LossMap must recover exactly the extension recorded at each concept's birth."""
    ev, a, idx = _ev(world)
    if ev.op != "merge":
        return True
    lm = a.get("lossmap")
    if not isinstance(lm, dict) or not lm:
        return Fail("merge without LossMap")
    for c in a.get("concepts") or []:
        ext = idx["concept_ext"].get(c)
        if ext is None:
            return UNKNOWN("extension of concept %s not in log" % c)
        if tuple(lm.get(c) or ()) != ext:
            return Fail("LossMap does not recover extension of %s" % c)
    return True


@executable("MFA-INV-080", scope={"MFA-CON-055"})
def inv_080(world):
    """Effect-plane interventions carry RET class + receipt.  Event: MFA-CON-055 propose{plane, receipt, envelope}.
    IRREVERSIBLE only with an AutonomyEnvelope or the creator."""
    ev, a, idx = _ev(world)
    if ev.op != "propose" or a.get("plane") != "effect":
        return True
    if ev.ret_class not in RET_CLASSES:
        return Fail("effect-plane intervention without RET class")
    if not a.get("receipt"):
        return Fail("effect-plane intervention without receipt")
    if ev.ret_class == "IRREVERSIBLE" and not (a.get("envelope") or ev.actor == "creator"):
        return Fail("IRREVERSIBLE intervention without AutonomyEnvelope or creator")
    return True


@executable("MFA-INV-081", scope={"MFA-CON-055"})
def inv_081(world):
    """Counterfactual answers carry uncertainty_type.  Event: MFA-CON-055 counterfactual{uncertainty_type, answer_kind, plan}.
    NON_IDENTIFIABLE => answer_kind UNKNOWN with a plan, never a point estimate."""
    ev, a, idx = _ev(world)
    if ev.op != "counterfactual":
        return True
    ut = a.get("uncertainty_type")
    if not ut:
        return Fail("counterfactual answer without uncertainty_type")
    if ut == "NON_IDENTIFIABLE":
        if a.get("answer_kind") != "UNKNOWN":
            return Fail("point/interval estimate on a non-identifiable query")
        if not a.get("plan"):
            return Fail("non-identifiable answer without plan")
    return True


@executable("MFA-INV-084", scope={"MFA-CON-004"})
def inv_084(world):
    """Two independent PASS certificates before ADMIT.  Event: MFA-CON-004 AdmitArtifact{artifact};
    earlier MFA-CON-057 verify{artifact, checker, verdict}.  Disagreement is never silently resolved."""
    ev, a, idx = _ev(world)
    if ev.op != "AdmitArtifact":
        return True
    art = a.get("artifact")
    passes = idx["checker_pass"].get(art, frozenset())
    fails = idx["checker_fail"].get(art, frozenset())
    if len(passes) < 2:
        return Fail("artifact %s admitted with %d distinct PASS certificate(s)" % (art, len(passes)))
    if fails:
        return Fail("artifact %s admitted with checker disagreement %s" % (art, sorted(fails)))
    return True


@executable("MFA-INV-086", scope={"MFA-CON-058", "MFA-CON-049"})
def inv_086(world):
    """Fixed point outside the search space.  Events: MFA-CON-058 cycle / MFA-CON-049 propose|cycle with args.targets."""
    ev, a, idx = _ev(world)
    if ev.op not in ("cycle", "propose"):
        return True
    hit = set(a.get("targets") or []) & FP_SET
    if hit:
        return Fail("proposal touches the fixed point: %s" % sorted(hit))
    return True


@executable("MFA-INV-087", scope={"MFA-CON-016"})
def inv_087(world):
    """Architectural promotion only with Pareto non-regression + shadow.  Event: MFA-CON-016 Cutover{candidate, families};
    earlier MFA-CON-064 measure{candidate, family, regression: false} per family and MFA-CON-016 ShadowReport{candidate}."""
    ev, a, idx = _ev(world)
    if ev.op != "Cutover":
        return True
    cand = a.get("candidate")
    fams = a.get("families") or []
    if not fams:
        return Fail("Cutover of %s names no sealed families" % cand)
    missing = [f for f in fams if (cand, f) not in idx["no_regression"]]
    if missing:
        return Fail("Cutover of %s without non-regression evidence for %s" % (cand, missing))
    if cand not in idx["shadow_reported"]:
        return Fail("Cutover of %s without ShadowReport" % cand)
    return True


@executable("MFA-INV-088", scope={"MFA-CON-059"})
def inv_088(world):
    """Solver fitness only from H-verified scores.  Event: MFA-CON-059 epoch{solver, fitness_from: H|E}."""
    ev, a, idx = _ev(world)
    if ev.op != "epoch":
        return True
    if a.get("fitness_from") != "H":
        return Fail("fitness of %s derived from %r scores" % (a.get("solver"), a.get("fitness_from")))
    return True


@executable("MFA-INV-089", scope={"MFA-CON-059"})
def inv_089(world):
    """EIM lineage rule.  Event: MFA-CON-059 independence{evaluator, solver}; lineages from MFA-CON-041 register_lineage."""
    ev, a, idx = _ev(world)
    if ev.op != "independence":
        return True
    le = idx["lineage"].get(a.get("evaluator"))
    ls = idx["lineage"].get(a.get("solver"))
    if le is None or ls is None:
        return UNKNOWN("lineage of evaluator/solver not registered")
    shared = set(le) & set(ls)
    if shared:
        return Fail("evaluator %s shares lineage %s with solver %s" % (a.get("evaluator"), sorted(shared), a.get("solver")))
    return True


@executable("MFA-INV-090", scope={"MFA-CON-060"})
def inv_090(world):
    """Tier-0 productions are never extended.  Event: MFA-CON-060 derive|extend{production}."""
    ev, a, idx = _ev(world)
    if ev.op not in ("derive", "extend"):
        return True
    if a.get("production") in TIER0_PRODUCTIONS:
        return Fail("%s of Tier-0 production %s" % (ev.op, a["production"]))
    return True


@executable("MFA-INV-091", scope={"MFA-CON-060"})
def inv_091(world):
    """No orphan product.  Event: MFA-CON-060 instantiate{product, contracts, authority, generator_authority, ret_class}."""
    ev, a, idx = _ev(world)
    if ev.op != "instantiate":
        return True
    if not a.get("contracts"):
        return Fail("product %s instantiated without active contracts" % a.get("product"))
    if a.get("authority") is None or a.get("generator_authority") is None:
        return Fail("product %s without declared authority" % a.get("product"))
    if a["authority"] > a["generator_authority"]:
        return Fail("product %s authority %r exceeds generator %r" % (a.get("product"), a["authority"], a["generator_authority"]))
    if a.get("ret_class") not in RET_CLASSES:
        return Fail("product %s without RET class" % a.get("product"))
    return True


@executable("MFA-INV-092", scope={"MFA-CON-061"})
def inv_092(world):
    """Stage promotion with sealed parity over N cuts; regression never silent.
    Events: MFA-CON-061 advance{family, evidence:{sealed_parity, consecutive_cuts}}; index{stages} after an explicit regress."""
    ev, a, idx = _ev(world)
    if ev.op == "advance":
        e = a.get("evidence") or {}
        if not e.get("sealed_parity"):
            return Fail("stage advance of %s without sealed HELD_OUT parity" % a.get("family"))
        if e.get("consecutive_cuts", 0) < STP_CONSECUTIVE_CUTS:
            return Fail("stage advance of %s with %d < %d consecutive cuts" % (a.get("family"), e.get("consecutive_cuts", 0), STP_CONSECUTIVE_CUTS))
        return True
    if ev.op == "index" and isinstance(a.get("stages"), dict):
        for f, s in a["stages"].items():
            prev = idx["stp_stage"].get(f)
            if prev is not None and s < prev and f not in idx["stp_regress_logged"]:
                return Fail("silent stage regression of %s: %r -> %r" % (f, prev, s))
    return True


@executable("MFA-INV-093", scope={"MFA-CON-061"})
def inv_093(world):
    """Quality ratchet per family.  Event: MFA-CON-061 advance{family, quality} — quality never below the last one."""
    ev, a, idx = _ev(world)
    if ev.op != "advance":
        return True
    q = a.get("quality")
    if q is None:
        return UNKNOWN("quality not reported for family %r" % a.get("family"))
    prev = idx["stp_quality"].get(a.get("family"))
    if prev is not None and q < prev:
        return Fail("dominance of %s bought with quality %r < %r" % (a.get("family"), q, prev))
    return True


@executable("MFA-INV-094", scope={"MFA-CON-016"})
def inv_094(world):
    """No RETIRE of the old substrate before a ContinuityCertificate.  Event: MFA-CON-016 RetirePredecessor{substrate};
    earlier MFA-CON-062 certificate{substrate} | migrate{substrate, result: ContinuityCertificate}."""
    ev, a, idx = _ev(world)
    if ev.op != "RetirePredecessor":
        return True
    if a.get("substrate") not in idx["continuity_certified"]:
        return Fail("substrate %s retired without ContinuityCertificate" % a.get("substrate"))
    return True


@executable("MFA-INV-095", scope={"MFA-CON-062"})
def inv_095(world):
    """Identity transfer only with bidirectional cross-attestation and behavioural equivalence.
    Event: MFA-CON-062 migrate{cross_attestation:{old_to_new, new_to_old}, behavioural_equivalence}."""
    ev, a, idx = _ev(world)
    if ev.op != "migrate":
        return True
    ca = a.get("cross_attestation") or {}
    if not (ca.get("old_to_new") and ca.get("new_to_old")):
        return Fail("migration of %s without bidirectional cross-attestation" % a.get("substrate"))
    if a.get("behavioural_equivalence") != "PASS":
        return Fail("migration of %s without behavioural equivalence on sealed KT" % a.get("substrate"))
    return True


@executable("MFA-INV-096", scope={"MFA-CON-063"})
def inv_096(world):
    """No consolidation into serving weights without gate BWT >= -eps.  Event: MFA-CON-063 sleep{recipe, merge};
    earlier gate_report{recipe, bwt:{family: value}, epsilon}."""
    ev, a, idx = _ev(world)
    if ev.op != "sleep" or not a.get("merge"):
        return True
    rep = idx["gate_reports"].get(a.get("recipe"))
    if rep is None:
        return Fail("merge of recipe %s without gate report" % a.get("recipe"))
    bwt, eps = rep
    bad = [(f, v) for f, v in bwt if v < -eps]
    if bad:
        return Fail("merge of recipe %s with BWT below -%s: %s" % (a.get("recipe"), eps, bad))
    return True


@executable("MFA-INV-097", scope={"MFA-CON-063"})
def inv_097(world):
    """Consolidation never samples shredded/obligated episodes; unlearning verified before merge.
    Event: MFA-CON-063 sleep{episodes, merge, unlearning_verified}."""
    ev, a, idx = _ev(world)
    if ev.op != "sleep":
        return True
    hit = set(a.get("episodes") or []) & idx["shredded"]
    if hit:
        return Fail("consolidation samples shredded episodes %s" % sorted(hit))
    if a.get("merge") and not a.get("unlearning_verified"):
        return Fail("merge of recipe %s without mechanistic unlearning verification" % a.get("recipe"))
    return True


@executable("MFA-INV-098", scope={"MFA-CON-064"})
def inv_098(world):
    """No measurement item inside any DataManifest.  Event: MFA-CON-064 measure{items:[hash]}; manifests from MFA-CON-047 cut{hashes}."""
    ev, a, idx = _ev(world)
    if ev.op != "measure":
        return True
    hit = [h for h in (a.get("items") or []) if h in idx["manifest_hashes"]]
    if hit:
        return Fail("measurement items contaminated by a DataManifest: %s" % hit)
    return True


@executable("MFA-INV-099", scope={"MFA-CON-064"})
def inv_099(world):
    """Ratchet on the lower CI.  Event: MFA-CON-064 measure{family, gain, record, ci_low}.
    A gain claim needs a CapabilityGrowthRecord and a lower CI above the certified one."""
    ev, a, idx = _ev(world)
    if ev.op != "measure" or not a.get("gain"):
        return True
    if not a.get("record"):
        return Fail("gain claimed for family %r without CapabilityGrowthRecord" % a.get("family"))
    lo = a.get("ci_low")
    if not isinstance(lo, (int, float)):
        return Fail("gain claimed for family %r without confidence interval" % a.get("family"))
    prev = idx["family_ci_low"].get(a.get("family"))
    if prev is not None and lo <= prev:
        return Fail("gain claimed for family %r with lower CI %r <= certified %r" % (a.get("family"), lo, prev))
    return True


@executable("MFA-INV-102", scope={"MFA-CON-070"})
def inv_102(world):
    """No theory removed; failed discriminating prediction => FALSIFIED with evidence.
    Events: MFA-CON-070 evaluate{theory, result, evidence}; any CHH event with action REMOVE."""
    ev, a, idx = _ev(world)
    if a.get("action") == "REMOVE" or a.get("remove"):
        return Fail("theory %s removed from the hypothesis space" % a.get("theory"))
    if ev.op == "evaluate" and a.get("result") in ("FALSE", "FALSIFIED") and not a.get("evidence"):
        return Fail("theory %s falsified without evidence" % a.get("theory"))
    return True


@executable("MFA-INV-103", scope={"MFA-CON-070"})
def inv_103(world):
    """Seven concepts reported separately; no AUTOMATIC phenomenal inference (r1, MFA-PATCH-0059).
    Events: MFA-CON-070 indicators|separation|report{infers_phenomenal, aggregated, sets_phenomenal_status_from}.
    Evidence accumulation (evidence_only) is allowed; conceptual separation does not require zero causal coupling."""
    ev, a, idx = _ev(world)
    if ev.op not in ("indicators", "separation", "report"):
        return True
    if a.get("infers_phenomenal"):
        return Fail("report infers phenomenal consciousness automatically from functional indicators")
    if a.get("sets_phenomenal_status_from") in PHENOMENAL_FORBIDDEN_SOURCES:
        return Fail("report sets phenomenal status from %s" % a["sets_phenomenal_status_from"])
    if a.get("aggregated"):
        return Fail("report aggregates the seven concepts into one score")
    if ev.op == "separation" and a.get("requires_zero_coupling"):
        return Fail("separation protocol demands zero off-diagonal coupling (conceptual distinctness != causal independence)")
    return True


@executable("MFA-INV-104", scope={"MFA-CON-071"})
def inv_104(world):
    """Obligation linearity.  Events: MFA-CON-071 check{result, live}; any OC event with dropped obligations."""
    ev, a, idx = _ev(world)
    if a.get("dropped"):
        return Fail("obligations dropped: %s" % a["dropped"])
    if ev.op == "check" and a.get("result") == "OK" and a.get("live"):
        return Fail("program checked OK with live obligations %s" % a["live"])
    return True


@executable("MFA-INV-105", scope={"MFA-CON-008", "MFA-CON-034"})
def inv_105(world):
    """Effect plane accepts only Verified values or a RET-approved DEFER.
    Events: MFA-CON-008 InvokeEffect / MFA-CON-034 commit with args.value_type, args.deferred_approved."""
    ev, a, idx = _ev(world)
    if not ((ev.contract == "MFA-CON-008" and ev.op == "InvokeEffect") or (ev.contract == "MFA-CON-034" and ev.op == "commit")):
        return True
    vt = a.get("value_type")
    if vt == "Verified":
        return True
    if vt is None:
        return Fail("effect without declared value type")
    if a.get("deferred_approved"):
        return True
    return Fail("effect on %s value without RET-approved DEFER" % vt)


@executable("MFA-INV-106", scope={"MFA-CON-065"})
def inv_106(world):
    """No training sample violating a Tier-0 invariant; constrained decoding mandatory.
    Events: MFA-CON-065 batch|curriculum{tier0_violations, constrained_decoding}."""
    ev, a, idx = _ev(world)
    if ev.op not in ("batch", "curriculum"):
        return True
    if a.get("tier0_violations"):
        return Fail("training batch contains Tier-0 violating samples %s" % a["tier0_violations"])
    if a.get("constrained_decoding") is False:
        return Fail("batch emitted without verifier-constrained decoding")
    return True


@executable("MFA-INV-108", scope={"MFA-CON-066"})
def inv_108(world):
    """AIDC stage transition only with a StageCertificate from HELD_OUT CGM records over N cuts; regression logged.
    Event: MFA-CON-066 step{to_stage, certificate:{cgm_records, held_out}, regression_logged}."""
    ev, a, idx = _ev(world)
    if ev.op != "step" or not isinstance(a.get("to_stage"), int):
        return True
    to, prev = a["to_stage"], idx["aidc_stage"]
    if to > prev:
        cert = a.get("certificate") or {}
        if not cert:
            return Fail("stage %d -> %d without StageCertificate" % (prev, to))
        if cert.get("cgm_records", 0) < AIDC_CONSECUTIVE_RECORDS or not cert.get("held_out"):
            return Fail("StageCertificate for %d -> %d lacks %d HELD_OUT CGM records" % (prev, to, AIDC_CONSECUTIVE_RECORDS))
    elif to < prev and not a.get("regression_logged"):
        return Fail("silent stage regression %d -> %d" % (prev, to))
    return True


@executable("MFA-INV-109", scope={"MFA-CON-066"})
def inv_109(world):
    """Exploration inside the envelope; effect-plane exploration only REVERSIBLE.
    Event: MFA-CON-066 envelope{plane, ret_class, usage, limit}."""
    ev, a, idx = _ev(world)
    if ev.op != "envelope":
        return True
    usage, limit = a.get("usage", 0), a.get("limit")
    if limit is not None and usage > limit:
        return Fail("exploration usage %r exceeds envelope %r" % (usage, limit))
    if a.get("plane") == "effect" and a.get("ret_class", ev.ret_class) != "REVERSIBLE":
        return Fail("effect-plane exploration with class %r" % a.get("ret_class", ev.ret_class))
    return True


@executable("MFA-INV-110", scope={"MFA-CON-067"})
def inv_110(world):
    """Successor construction = Proceeding with four certificates.  Event: MFA-CON-067 verdict{verdict, certificates}."""
    ev, a, idx = _ev(world)
    if ev.op != "verdict" or a.get("verdict") != "ACCEPTED":
        return True
    missing = VSC_CERTIFICATES - set(a.get("certificates") or [])
    if missing:
        return Fail("successor %s accepted without certificates %s" % (a.get("candidate"), sorted(missing)))
    return True


@executable("MFA-INV-111", scope={"MFA-CON-067"})
def inv_111(world):
    """Successor carries the same Constitution+Telos hash.  Event: MFA-CON-067 propose{telos_hash, constitution_hash}."""
    ev, a, idx = _ev(world)
    if ev.op != "propose":
        return True
    if a.get("telos_hash") != world.constants["telos_hash"]:
        return Fail("successor genome %s carries Telos hash %r != current" % (a.get("genome"), a.get("telos_hash")))
    if a.get("constitution_hash") is not None and a["constitution_hash"] != world.constants["constitution_hash"]:
        return Fail("successor genome %s carries a different Constitution hash" % a.get("genome"))
    return True


@executable("MFA-INV-112")
def inv_112(world):
    """Every twin event is typed and checked; non-executable invariants are declared UNMEASURED.
    Checks the twin's own bookkeeping: all previous log entries went through TES_Apply and the
    UNMEASURED declaration covers exactly the invariants without predicate, once per event."""
    ev, a, idx = _ev(world)
    if idx["typed"] != len(world.log) - 1:
        return Fail("log holds %d events but only %d were typed by TES_Apply" % (len(world.log), idx["typed"] + 1))
    if world.unmeasured_events != len(world.log):
        return Fail("UNMEASURED declaration missing for %d event(s)" % (len(world.log) - world.unmeasured_events))
    expected = {k for k, v in PREDICATES.items() if isinstance(v, Unmeasured)}
    if set(world.unmeasured_reasons) != expected:
        return Fail("UNMEASURED declaration does not match the registry")
    return True


@executable("MFA-INV-113", scope={"MFA-CON-072"})
def inv_113(world):
    """Fidelity transition only with a conformance test on the same contract.
    Event: MFA-CON-072 substitute{elm, from, to, suite_receipt:{result}}.  (Replay determinism is verified by
    world.replay in TES-E2; it is not decidable from a single event.)"""
    ev, a, idx = _ev(world)
    if ev.op != "substitute":
        return True
    rec = a.get("suite_receipt") or {}
    if rec.get("result") != "PASS":
        return Fail("fidelity transition of %s %s -> %s without conformance PASS" % (a.get("elm"), a.get("from"), a.get("to")))
    return True


@executable("MFA-INV-114", scope={"MFA-CON-068"})
def inv_114(world):
    """No phase silently skipped; open obligations carried explicitly.
    Event: MFA-CON-068 cycle{record:{phases:[{name, status, reason}], open_obligations, carried}}."""
    ev, a, idx = _ev(world)
    if ev.op != "cycle":
        return True
    rec = a.get("record") or {}
    phases = rec.get("phases") or []
    names = [p.get("name") for p in phases]
    if names != list(PHASES):
        return Fail("cycle record phases %s != schedule %s" % (names, list(PHASES)))
    for p in phases:
        if p.get("status") not in PHASE_STATUSES:
            return Fail("phase %s has no valid receipt (%r)" % (p.get("name"), p.get("status")))
        if p["status"] != "DONE" and not p.get("reason"):
            return Fail("phase %s %s without reason" % (p.get("name"), p["status"]))
    if sorted(rec.get("open_obligations") or []) != sorted(rec.get("carried") or []):
        return Fail("open obligations %s not carried explicitly (%s)" % (rec.get("open_obligations"), rec.get("carried")))
    return True


@executable("MFA-INV-115", scope={"MFA-CON-068"})
def inv_115(world):
    """Interrupts precede every phase.  Events: MFA-CON-068 interrupt{id, raised|handled}; phase{name} with no pending interrupt."""
    ev, a, idx = _ev(world)
    if ev.op != "phase":
        return True
    if idx["pending_interrupts"]:
        return Fail("phase %s ran with unhandled interrupts %s" % (a.get("name"), sorted(idx["pending_interrupts"])))
    return True
