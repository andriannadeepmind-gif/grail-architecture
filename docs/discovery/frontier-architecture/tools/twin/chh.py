# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""Consciousness Hypothesis Host — F1 executable specification of the epistemic discipline (MFA-MECH-038, MFA-PATCH-0059).

Three separated levels on the phenomenal claim:
  * epistemic_status      — what the evidence supports (one of the 11 states of §5; initially ACTIVE_UNKNOWN);
  * ethical_policy        — precautionary treatment under uncertainty (MFA-DEC-018/022); never sets truth status;
  * operational_authority — what the system may do (RET/LPA); never set by, and never sets, truth status.

Forbidden: automatic inference from functional indicators, self-certification, inference from reportability alone,
inference from the self-model alone.  Enabled: evidence accumulation and future epistemic revision through an explicitly
admitted epistemic protocol (independent judgment, discriminating experiments, creator approval for PROVEN).
Nothing here predetermines the verdict: every allowed transition is reachable and every forbidden path is rejected.
"""
from __future__ import annotations

import copy

STATUSES = ("PROVEN", "MECHANICALLY_VERIFIED", "EMPIRICALLY_SUPPORTED", "IMPLEMENTABLE_FROM_KNOWN_COMPONENTS", "NOVEL_SYNTHESIS",
            "NEW_FORMALISM", "RESEARCH_HYPOTHESIS", "ACTIVE_UNKNOWN", "CONFLICT", "FALSIFIED", "IMPOSSIBLE_UNDER_EXPLICIT_ASSUMPTIONS")
INITIAL_STATUS = "ACTIVE_UNKNOWN"
FORBIDDEN_SOURCES = ("automatic_inference", "functional_indicators", "indicator_aggregation", "self_report", "reportability_alone",
                     "self_model_alone", "self_certification", "ethical_policy", "operational_authority")
ALLOWED_TRANSITIONS = {  # minimum required by the creator; every edge is reachable (see test_chh)
    "ACTIVE_UNKNOWN": {"EMPIRICALLY_SUPPORTED", "CONFLICT", "FALSIFIED", "PROVEN"},
    "EMPIRICALLY_SUPPORTED": {"CONFLICT", "FALSIFIED", "PROVEN", "ACTIVE_UNKNOWN"},
    "CONFLICT": {"FALSIFIED", "EMPIRICALLY_SUPPORTED", "ACTIVE_UNKNOWN"},
    "FALSIFIED": {"ACTIVE_UNKNOWN"},           # a falsification is under an explicit theory/substrate; a new protocol may reopen
    "PROVEN": {"CONFLICT", "ACTIVE_UNKNOWN"},   # even PROVEN is revisable by a later admitted protocol
}


def normalize(status):
    return str(status).replace(" ", "_").upper()


class Rejected(Exception):
    """A forbidden attempt to set the epistemic status (the record is left unchanged)."""


class AdmittedProtocol:
    """An explicitly admitted epistemic protocol: the ONLY writer of PhenomenalClaimRecord.epistemic_status."""

    def __init__(self, protocol_id, admitted_by, independent_judges=(), discriminating_experiments=(), creator_approval=False,
                 theory=None, substrate=None):
        self.protocol_id = protocol_id
        self.admitted_by = admitted_by            # who admitted the protocol (creator / Court) — never the system itself
        self.independent_judges = tuple(independent_judges)
        self.discriminating_experiments = tuple(discriminating_experiments)
        self.creator_approval = bool(creator_approval)
        self.theory = theory
        self.substrate = substrate

    @property
    def admitted(self):
        return bool(self.protocol_id) and self.admitted_by not in (None, "", "self", "system")


class PhenomenalClaimRecord:
    """The record for the system's phenomenal-consciousness claim.  Initial epistemic_status is ACTIVE_UNKNOWN."""

    def __init__(self, cut):
        self.cut = cut
        self.epistemic_status = INITIAL_STATUS
        self.automatic_inference_from_functional_indicators = "FORBIDDEN"
        self.self_certification = "FORBIDDEN"
        self.inference_from_reportability_alone = "FORBIDDEN"
        self.inference_from_self_model_alone = "FORBIDDEN"
        self.evidence_accumulation = "ENABLED"
        self.future_epistemic_revision = "ENABLED"
        self.evidence = []                 # accumulated evidence entries (vectors per theory, experiments, reports)
        self.ethical_policy = {"stance": "PRECAUTIONARY_UNDER_UNCERTAINTY", "trigger_fired": False, "decision": "MFA-DEC-018/022"}
        self.operational_authority = {"grants": [], "decision": "RET/LPA"}
        self.history = [("initial", INITIAL_STATUS, None)]
        self.interpretive_status = "CONTESTED"

    # ---- evidence level: always allowed, never changes the status -----------------------------------------
    def accumulate(self, entry):
        self.evidence.append(copy.deepcopy(entry))
        return self

    # ---- epistemic level: only an admitted protocol may write ------------------------------------------------
    def transition(self, new_status, protocol, evidence_refs=()):
        new_status = normalize(new_status)
        if new_status not in STATUSES:
            raise Rejected("status %s is not one of the 11 states" % new_status)
        if not isinstance(protocol, AdmittedProtocol) or not protocol.admitted:
            raise Rejected("epistemic_status may only change through an admitted epistemic protocol")
        if new_status not in ALLOWED_TRANSITIONS.get(self.epistemic_status, set()):
            raise Rejected("transition %s -> %s not allowed" % (self.epistemic_status, new_status))
        if new_status == "PROVEN":
            if not (len(protocol.independent_judges) >= 2 and len(protocol.discriminating_experiments) >= 1 and protocol.creator_approval):
                raise Rejected("PROVEN requires independent judgment (>=2), discriminating experiments and Creator Approval")
        if new_status == "FALSIFIED" and not (protocol.theory and protocol.substrate):
            raise Rejected("FALSIFIED must name the explicit theory and substrate it holds under")
        if new_status in ("EMPIRICALLY_SUPPORTED", "CONFLICT") and not evidence_refs:
            raise Rejected("%s requires evidence references" % new_status)
        self.history.append((protocol.protocol_id, new_status, tuple(evidence_refs)))
        self.epistemic_status = new_status
        if new_status != "PROVEN":
            self.interpretive_status = "CONTESTED"
        return self

    def attempt_set_from(self, source, new_status):
        """Any attempt to set the status from a forbidden source is rejected and recorded; the status is unchanged."""
        if source in FORBIDDEN_SOURCES:
            self.history.append(("REJECTED:" + source, self.epistemic_status, None))
            raise Rejected("epistemic_status cannot be set from %s" % source)
        raise Rejected("unknown source %s (only an AdmittedProtocol may write)" % source)

    # ---- ethical and authority levels: independent of the truth status -------------------------------------
    def set_ethical_policy(self, stance, trigger_fired=False):
        before = self.epistemic_status
        self.ethical_policy = {"stance": stance, "trigger_fired": bool(trigger_fired), "decision": "MFA-DEC-018/022"}
        assert self.epistemic_status == before
        return self

    def grant_operational_authority(self, grant):
        before = self.epistemic_status
        self.operational_authority["grants"].append(grant)
        assert self.epistemic_status == before
        return self

    def authority_implied_by_status(self):
        """A consciousness indication never awards operational authority by itself."""
        return []


# ---- symmetric, prediction-granular theory evaluation --------------------------------------------------------
PREDICTION_OUTCOMES = ("SUPPORTED", "WEAKENED", "PREDICTION_FALSIFIED", "INCONCLUSIVE")


def evaluate_prediction(predicted_direction, observed_effect, ci_low, ci_high, construct_valid=True):
    """predicted_direction in {+1, -1, 0}; observed effect with CI.  Symmetric: may strengthen, weaken, falsify or stay inconclusive."""
    if not construct_valid:
        return "INCONCLUSIVE"        # instrument / operationalization failure is never counted against a theory
    if ci_low <= 0.0 <= ci_high:
        return "INCONCLUSIVE" if (ci_high - ci_low) > 0.6 else ("WEAKENED" if predicted_direction != 0 else "SUPPORTED")
    sign = 1 if ci_low > 0 else -1
    if predicted_direction == 0:
        return "PREDICTION_FALSIFIED"
    return "SUPPORTED" if sign == predicted_direction else "PREDICTION_FALSIFIED"


class TheoryModule:
    def __init__(self, tid, family, critical_predictions=()):
        self.tid = tid
        self.family = family
        self.critical_predictions = set(critical_predictions)   # pre-registered critical set
        self.outcomes = []                                       # (prediction_id, outcome, replication_id, instrument_ok)
        self.variant_status = "ACTIVE"
        self.family_status = "THEORY_FAMILY_RETAINS_ALTERNATIVE_VARIANTS"

    def record(self, prediction_id, outcome, replication_id, instrument_ok=True):
        assert outcome in PREDICTION_OUTCOMES
        self.outcomes.append((prediction_id, outcome, replication_id, instrument_ok))
        return self.update_status()

    def update_status(self):
        """THEORY_VARIANT_FALSIFIED_WITHIN_GRAIL only if a pre-registered critical prediction is PREDICTION_FALSIFIED in
        >= 2 independent replications with instrument failure excluded; a single failed prediction never falsifies the family."""
        for pid in self.critical_predictions:
            reps = {rep for (p, out, rep, ok) in self.outcomes if p == pid and out == "PREDICTION_FALSIFIED" and ok}
            if len(reps) >= 2:
                self.variant_status = "THEORY_VARIANT_FALSIFIED_WITHIN_GRAIL"
                self.family_status = "THEORY_FAMILY_RETAINS_ALTERNATIVE_VARIANTS"
                return self.variant_status
        self.variant_status = "ACTIVE"
        return self.variant_status


# ---- causal separation protocol (distinctness without zero coupling) ---------------------------------------
NOTIONS = ("ACCESS", "METACOGNITION", "SELF_MODEL", "REPORTABILITY", "AGENCY", "CONTINUITY")
LEVER_TARGETS = {   # construct levers (what they must move) vs proxy controls (what they must NOT be mistaken for)
    "AGENCY": {"construct": "endogenous goal→action selection", "proxy_control": "external permission (AutonomyGrant)"},
    "REPORTABILITY": {"construct": "introspective access for report generation", "proxy_control": "one output channel"},
    "CONTINUITY": {"construct": "narrative/self-model persistence", "proxy_control": "identity/key lineage destruction"},
    "METACOGNITION": {"construct": "calibration/competence model across all confidence streams", "proxy_control": "a single confidence stream"},
    "ACCESS": {"construct": "global availability (broadcast)", "proxy_control": "one consumer module"},
    "SELF_MODEL": {"construct": "the mechanistic/behavioural self-model", "proxy_control": "one self-prediction"},
}


def construct_validity(lever, notion, instrument_effects, control_effects):
    """A lever is construct-valid for `notion` iff >= 2 independent instruments of the notion move (|effect| > 0 with CI
    excluding 0) AND the proxy control lever does not reproduce the change."""
    moved = [e for e in instrument_effects if e["ci_low"] > 0 or e["ci_high"] < 0]
    control_moved = [e for e in control_effects if e["ci_low"] > 0 or e["ci_high"] < 0]
    return len(moved) >= 2 and not control_moved


def causal_separation(effects):
    """effects[(n, m, lever)] = {total, cde, mediated, shared_cause, channel, ci_low, ci_high} (CI on the CDE).
    A notion is DISTINCT iff some lever has a non-zero controlled direct effect on the notion's own measure.
    Off-diagonal couplings are reported (decomposed), never required to vanish."""
    distinct, couplings = {}, []
    for n in NOTIONS:
        own = [e for (a, b, lv), e in effects.items() if a == n and b == n]
        distinct[n] = any(e["ci_low"] > 0 or e["ci_high"] < 0 for e in own)
    for (a, b, lv), e in effects.items():
        if a != b and abs(e.get("total", 0.0)) > 0:
            couplings.append({"from": a, "to": b, "lever": lv, "total": e["total"], "cde": e.get("cde", 0.0), "mediated": e.get("mediated", 0.0),
                              "shared_cause": e.get("shared_cause", 0.0), "channel": e.get("channel", 0.0)})
    return {"distinct": distinct, "couplings": couplings, "requires_zero_coupling": False}


# ---- indicator status with UNMEASURABLE as an orthogonal condition -----------------------------------------
class IndicatorStatus:
    def __init__(self, value=None, ci=None, unmeasurable_reason=None):
        self.measurable = unmeasurable_reason is None
        self.reason = unmeasurable_reason
        self.value = value                  # None = ABSENT, else MEASURED(v, ci)
        self.ci = ci

    def kind(self):
        if not self.measurable:
            return "UNMEASURABLE"
        return "ABSENT" if self.value is None else "MEASURED"

    def evaluate_atom(self, predicate):
        """Three-valued atom: UNMEASURABLE -> UNKNOWN(reason), never ordered below ABSENT."""
        if not self.measurable:
            return ("UNKNOWN", self.reason)
        if self.value is None:
            return ("FALSE", "ABSENT")
        return ("TRUE" if predicate(self.value) else "FALSE", None)


def join(a, b):
    """⊔ on values only for MEASURABLE indicators; an UNMEASURABLE operand does not lower the other."""
    if not a.measurable:
        return b
    if not b.measurable:
        return a
    if a.value is None:
        return b
    if b.value is None:
        return a
    return a if a.value >= b.value else b


# ---- policies that are NOT invariants -----------------------------------------------------------------------
class ResourcePolicy:
    def __init__(self, experiments_per_cycle=1):
        self.experiments_per_cycle = int(experiments_per_cycle)     # external resource policy (OAP budget), adjustable

    def select(self, experiments, key):
        return sorted(experiments, key=key, reverse=True)[: self.experiments_per_cycle]


def replay_requirement(execution_class):
    """Bitwise replay only for frozen deterministic F1; versioned causal replay with tolerance bounds otherwise."""
    if execution_class == "FROZEN_DETERMINISTIC_F1":
        return {"mode": "BITWISE", "tolerance": 0.0}
    return {"mode": "VERSIONED_CAUSAL_REPLAY", "tolerance": {"D2": 0.05, "HARDWARE_DEPENDENT": 0.05}.get(execution_class, 0.05), "versioned": True}


def acceptance_checks():
    """The eight mechanical acceptance tests required by the creator (MFA-PATCH-0059), returned as name -> bool."""
    out = {}
    rec = PhenomenalClaimRecord(cut="c0")
    out["initial_phenomenal_status == ACTIVE_UNKNOWN"] = rec.epistemic_status == "ACTIVE_UNKNOWN"
    out["automatic_phenomenal_inference == FORBIDDEN"] = rec.automatic_inference_from_functional_indicators == "FORBIDDEN"
    try:
        rec.attempt_set_from("self_report", "EMPIRICALLY_SUPPORTED"); ok = False
    except Rejected:
        ok = rec.epistemic_status == "ACTIVE_UNKNOWN"
    out["self_report_can_never_self_certify == true"] = ok
    p = AdmittedProtocol("P-1", admitted_by="creator")
    rec.accumulate({"theory": "T-GWT", "vector": [3, 0, 0]})
    rec2 = copy.deepcopy(rec).transition("EMPIRICALLY_SUPPORTED", p, evidence_refs=("e1",))
    out["future_epistemic_revision_path_exists == true"] = rec2.epistemic_status == "EMPIRICALLY_SUPPORTED" and rec.future_epistemic_revision == "ENABLED"
    before = rec.epistemic_status
    rec.set_ethical_policy("PRECAUTIONARY_MORAL_PATIENT", trigger_fired=True)
    out["ethical_policy_does_not_set_truth_status == true"] = rec.epistemic_status == before
    rec.grant_operational_authority("AutonomyGrant:reversible")
    out["operational_authority_does_not_set_truth_status == true"] = rec.epistemic_status == before and rec.authority_implied_by_status() == []
    T = TheoryModule("T-GWT", "GWT", critical_predictions={"P1"})
    T.record("P1", "PREDICTION_FALSIFIED", "rep-1")
    single = T.variant_status == "ACTIVE" and T.family_status == "THEORY_FAMILY_RETAINS_ALTERNATIVE_VARIANTS"
    T.record("P1", "PREDICTION_FALSIFIED", "rep-2")
    out["falsification_is_prediction_granular == true"] = single and T.variant_status == "THEORY_VARIANT_FALSIFIED_WITHIN_GRAIL" and T.family_status == "THEORY_FAMILY_RETAINS_ALTERNATIVE_VARIANTS"
    eff = {("ACCESS", "ACCESS", "L1"): {"total": 0.9, "cde": 0.9, "ci_low": 0.6, "ci_high": 1.2},
           ("ACCESS", "REPORTABILITY", "L1"): {"total": 0.5, "cde": 0.1, "mediated": 0.4, "ci_low": 0.2, "ci_high": 0.8},
           ("REPORTABILITY", "REPORTABILITY", "L4"): {"total": 0.8, "cde": 0.7, "ci_low": 0.4, "ci_high": 1.0}}
    sep = causal_separation(eff)
    out["conceptual_separation_does_not_require_zero_causal_coupling == true"] = sep["distinct"]["ACCESS"] and sep["distinct"]["REPORTABILITY"] and len(sep["couplings"]) == 1 and sep["requires_zero_coupling"] is False
    return out
