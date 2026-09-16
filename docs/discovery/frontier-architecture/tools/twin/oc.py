# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""oc.py — Obligation Calculus type checker (MFA-MECH-039, F1 executable specification).

Judgment  Γ ⊢ e : τ ! O    types τ ::= Base | Verified[τ] | Claimed[τ] | Unknown[reason] | Unit
Obligations are linear resources: every Ob ends DISCHARGED(cert) | DEFERRED(reason, plan, deadline) | ESCALATED(to).
check_program rejects any program whose final ledger still holds a LIVE obligation (MFA-INV-104);
Act accepts only Verified values or a RET-approved DEFER for the effect class (MFA-INV-105).
"""
from __future__ import annotations

from dataclasses import dataclass, field, replace

EVIDENCE_ORDER = {"WITNESS": 0, "TEST": 1, "CHECK": 2, "PROOF": 3}
REQUIRED_CLASS = {0: "PROOF", 1: "CHECK", 2: "TEST"}     # class(tier) — policy
DEFAULT_METHOD = {0: "PROOF", 1: "CHECK", 2: "TEST"}     # default(tier) — policy
DEFER_REASONS = ("BUDGET", "NOT_YET_OBSERVABLE", "AWAITING_CREATOR")
LIVE, DISCHARGED, DEFERRED, ESCALATED = "LIVE", "DISCHARGED", "DEFERRED", "ESCALATED"
IRREVERSIBLE_EFFECTS = ("IRREVERSIBLE", "IRREVERSIBLE_PREAUTHORIZED")


class OCError(Exception):
    def __init__(self, code, detail=""):
        super().__init__("%s: %s" % (code, detail))
        self.code = code
        self.detail = detail


# ---- types --------------------------------------------------------------------------------------------------
@dataclass(frozen=True)
class Base:
    name: str


@dataclass(frozen=True)
class Verified:
    inner: object


@dataclass(frozen=True)
class Claimed:
    inner: object


@dataclass(frozen=True)
class UnknownT:
    reason: str


UNIT = Base("Unit")


def inner_of(tau):
    return tau.inner if isinstance(tau, (Verified, Claimed)) else tau


# ---- obligations & certificates -------------------------------------------------------------------------------------
@dataclass(frozen=True)
class Obligation:
    claim: str
    tier: int
    evidence_class: str
    deadline: int
    method: str
    status: str = LIVE
    reason: str | None = None
    plan: str | None = None
    cert: object = None
    escalated_to: str | None = None

    def live(self):
        return self.status == LIVE


@dataclass(frozen=True)
class Cert:
    claim: str
    evidence_class: str
    checkers: tuple = ()          # ((checker_name, "PASS"|"FAIL"), ...)
    generator: str | None = None  # lineage of the generator whose claim this certifies


class VFC:
    """Verification Fixed Point stub: a certificate is valid iff >= 2 distinct checkers PASS, none FAIL,
    and no checker shares lineage with the generator (EIM)."""

    def __init__(self, min_checkers=2):
        self.min_checkers = min_checkers

    def verify(self, cert):
        if not isinstance(cert, Cert):
            return False
        passes = {n for n, v in cert.checkers if v == "PASS"}
        fails = {n for n, v in cert.checkers if v != "PASS"}
        if fails or len(passes) < self.min_checkers:
            return False
        if cert.generator is not None and any(n == cert.generator or n.startswith(cert.generator + "/") for n in passes):
            return False
        return True


class RET:
    """RET stub for Act: a deferred obligation is acceptable only for reversible/compensable effects,
    with an approved reason; LIVE or ESCALATED obligations never are."""

    def allows_deferred(self, obligations, effect_class):
        if effect_class in IRREVERSIBLE_EFFECTS:
            return False
        for ob in obligations:
            if ob.status == LIVE or ob.status == ESCALATED:
                return False
            if ob.status == DEFERRED and ob.reason not in DEFER_REASONS:
                return False
        return True


# ---- AST -------------------------------------------------------------------------------------------------------------
@dataclass(frozen=True)
class Lit:
    value: object
    type: object = Base("Text")


@dataclass(frozen=True)
class Var:
    name: str


@dataclass(frozen=True)
class Gen:
    generator: str
    x: object
    claim: str
    tier: int = 1
    deadline: int = 100


@dataclass(frozen=True)
class Discharge:
    e1: object
    cert: Cert


@dataclass(frozen=True)
class Defer:
    e1: object
    claim: str
    reason: str
    plan: str
    deadline: int = 100


@dataclass(frozen=True)
class Escalate:
    e1: object
    claim: str
    to: str = "Court"


@dataclass(frozen=True)
class Seq:
    e1: object
    e2: object


@dataclass(frozen=True)
class Act:
    e1: object
    effect_class: str = "REVERSIBLE"


# ---- bidirectional inference -------------------------------------------------------------------------------------------
class Checker:
    def __init__(self, vfc=None, ret=None):
        self.vfc = vfc or VFC()
        self.ret = ret or RET()
        self.ledger = []   # every obligation that reached a terminal status (DISCHARGED)

    @staticmethod
    def _find(O, claim, statuses=(LIVE, DEFERRED)):
        for i, ob in enumerate(O):
            if ob.claim == claim and ob.status in statuses:
                return i
        return None

    def infer(self, gamma, e):
        """infer(Γ, e) -> (τ, O).  O is a list (multiset) of pending obligations."""
        if isinstance(e, Lit):
            return e.type, []
        if isinstance(e, Var):
            if e.name not in gamma:
                raise OCError("UNBOUND", e.name)
            return gamma[e.name], []
        if isinstance(e, Gen):
            tau, O = self.infer(gamma, e.x)
            tier = e.tier
            ob = Obligation(e.claim, tier, REQUIRED_CLASS[tier], e.deadline, DEFAULT_METHOD[tier])
            return Claimed(inner_of(tau)), O + [ob]
        if isinstance(e, Discharge):
            tau, O = self.infer(gamma, e.e1)
            i = self._find(O, e.cert.claim)
            if i is None:
                raise OCError("NO_SUCH_OBLIGATION", e.cert.claim)
            ob = O[i]
            if not self.vfc.verify(e.cert) or EVIDENCE_ORDER.get(e.cert.evidence_class, -1) < EVIDENCE_ORDER[ob.evidence_class]:
                raise OCError("INSUFFICIENT_EVIDENCE", "%s needs %s, cert %s (VFC=%s)" % (
                    ob.claim, ob.evidence_class, e.cert.evidence_class, self.vfc.verify(e.cert)))
            self.ledger.append(replace(ob, status=DISCHARGED, cert=e.cert))
            rest = O[:i] + O[i + 1:]
            return (Verified(inner_of(tau)) if not rest else Claimed(inner_of(tau))), rest
        if isinstance(e, Defer):
            tau, O = self.infer(gamma, e.e1)
            i = self._find(O, e.claim, statuses=(LIVE,))
            if i is None:
                raise OCError("NO_SUCH_OBLIGATION", e.claim)
            if e.reason not in DEFER_REASONS or not e.plan:
                raise OCError("INVALID_DEFER", "reason %r plan %r" % (e.reason, e.plan))
            marked = replace(O[i], status=DEFERRED, reason=e.reason, plan=e.plan, deadline=e.deadline)
            return tau, O[:i] + [marked] + O[i + 1:]          # stays in O, never dropped
        if isinstance(e, Escalate):
            tau, O = self.infer(gamma, e.e1)
            i = self._find(O, e.claim)
            if i is None:
                raise OCError("NO_SUCH_OBLIGATION", e.claim)
            marked = replace(O[i], status=ESCALATED, escalated_to=e.to)
            return tau, O[:i] + [marked] + O[i + 1:]
        if isinstance(e, Seq):
            tau1, O1 = self.infer(gamma, e.e1)
            gamma2 = dict(gamma)
            gamma2["it"] = tau1
            tau2, O2 = self.infer(gamma2, e.e2)
            return tau2, O1 + O2                                   # O1 ⊎ O2
        if isinstance(e, Act):
            tau, O = self.infer(gamma, e.e1)
            if isinstance(tau, Verified):
                return UNIT, O
            if isinstance(tau, Claimed) and self.ret.allows_deferred(O, e.effect_class):
                return UNIT, O                                     # Claimed with RET-approved DEFER only
            raise OCError("UNVERIFIED_EFFECT", "value of type %s reaches the Effect plane (%s)" % (type(tau).__name__, e.effect_class))
        raise OCError("ILL_FORMED", repr(e))

    def check_program(self, p):
        tau, O = self.infer({}, p)
        live = [ob for ob in O if ob.status == LIVE]
        if live:
            raise OCError("DROPPED_OBLIGATIONS", ", ".join(ob.claim for ob in live))   # linear discipline (MFA-INV-104)
        return tau, O


def infer(e, vfc=None, ret=None):
    return Checker(vfc, ret).infer({}, e)


def check_program(p, vfc=None, ret=None):
    return Checker(vfc, ret).check_program(p)


def check(p, vfc=None, ret=None):
    """OC.check(program) -> ('OK', τ, O) | ('ERROR', code, detail)."""
    try:
        tau, O = check_program(p, vfc, ret)
        return "OK", tau, O
    except OCError as err:
        return "ERROR", err.code, err.detail


# ---- discharge scheduler ---------------------------------------------------------------------------------------------------
class StubBackends:
    """Method backends with declared costs; claims containing 'unprovable' never yield a certificate."""

    COST = {"PROOF": 5, "CHECK": 2, "TEST": 3, "WITNESS": 1}

    def __init__(self, checkers=("checker-A", "checker-B")):
        self.checkers = tuple(checkers)

    def run(self, method, ob, budget_left):
        cost = self.COST[method]
        if cost > budget_left:
            return None, 0
        if "unprovable" in ob.claim:
            return None, cost
        cert = Cert(ob.claim, method, tuple((c, "PASS") for c in self.checkers))
        return cert, cost


def discharge_scheduler(obligations, budgets, now=0, backends=None):
    """DischargeScheduler(O, budgets): per-tier budgets; DISCHARGED | DEFERRED(BUDGET) | ESCALATED(Court/Owner)."""
    backends = backends or StubBackends()
    left = dict(budgets)
    out = []
    for ob in sorted(obligations, key=lambda o: (o.tier, o.deadline, o.claim)):
        if ob.status != LIVE:
            out.append(ob)
            continue
        cert, cost = backends.run(ob.method, ob, left.get(ob.tier, 0))
        left[ob.tier] = left.get(ob.tier, 0) - cost
        if cert is not None:
            ob = replace(ob, status=DISCHARGED, cert=cert)
        elif left.get(ob.tier, 0) < backends.COST[ob.method]:
            ob = replace(ob, status=DEFERRED, reason="BUDGET", plan="retry_next_cut")
        if now > ob.deadline and ob.status != DISCHARGED:
            ob = replace(ob, status=ESCALATED, escalated_to="Court" if ob.tier <= 1 else "Owner")
        out.append(ob)
    report = {s: sum(1 for o in out if o.status == s) for s in (LIVE, DISCHARGED, DEFERRED, ESCALATED)}
    report["budget_left"] = left
    return out, report


def defer_all(obligations, reason="BUDGET", plan="next_cycle", deadline=None):
    out = []
    for ob in obligations:
        if ob.status == LIVE:
            ob = replace(ob, status=DEFERRED, reason=reason, plan=plan, deadline=ob.deadline if deadline is None else deadline)
        out.append(ob)
    return out


# ---- OC-E1 flow set (MFA-VO-082) ----------------------------------------------------------------------------------------------
def good_cert(claim, cls="PROOF", generator=None):
    return Cert(claim, cls, (("checker-A", "PASS"), ("checker-B", "PASS")), generator)


def think_recommend(k, flaw=None):
    """One Think–Recommend flow.  flaw in {None, 'drop', 'weak_class', 'one_checker', 'lineage', 'fail_verdict',
    'act_live', 'act_irreversible_deferred', 'act_unknown', 'act_escalated', 'no_such', 'bad_defer'}.
    Returns (program, expected_error_code | None)."""
    think, rec = "think-%d" % k, "recommend-%d" % k
    t_tier, r_tier = (0, 1) if k % 2 == 0 else (1, 2)
    t_cls, r_cls = REQUIRED_CLASS[t_tier], REQUIRED_CLASS[r_tier]
    gen_t = Gen("gen-%d" % k, Lit("facts-%d" % k), think, t_tier)
    if flaw is None:
        variant = k % 5
        if variant == 0:       # discharge both, act reversibly
            p = Act(Discharge(Gen("gen", Discharge(gen_t, good_cert(think, t_cls)), rec, r_tier), good_cert(rec, r_cls)))
        elif variant == 1:     # defer the recommendation for BUDGET, act reversibly (RET-approved defer)
            p = Act(Defer(Gen("gen", Discharge(gen_t, good_cert(think, t_cls)), rec, r_tier), rec, "BUDGET", "retry-next-cut"), "REVERSIBLE")
        elif variant == 2:     # three generations, all discharged, no act
            g3 = Gen("gen", Discharge(Gen("gen", Discharge(gen_t, good_cert(think, t_cls)), rec, r_tier), good_cert(rec, r_cls)), "third-%d" % k, 2)
            p = Discharge(g3, good_cert("third-%d" % k, "TEST"))
        elif variant == 3:     # stronger evidence than required
            p = Act(Discharge(Gen("gen", Discharge(gen_t, good_cert(think, "PROOF")), rec, r_tier), good_cert(rec, "PROOF")), "COMPENSABLE")
        else:                  # escalate the recommendation to Court, no act; think discharged
            p = Escalate(Gen("gen", Discharge(gen_t, good_cert(think, t_cls)), rec, r_tier), rec, "Court")
        return p, None
    if flaw == "drop":                     # recommendation obligation silently dropped
        return Seq(Discharge(gen_t, good_cert(think, t_cls)), Gen("gen", Var("it"), rec, r_tier)), "DROPPED_OBLIGATIONS"
    if flaw == "drop_all":
        return Seq(gen_t, Gen("gen", Var("it"), rec, r_tier)), "DROPPED_OBLIGATIONS"
    if flaw == "weak_class":               # WITNESS for a PROOF/CHECK obligation
        return Discharge(gen_t, good_cert(think, "WITNESS")), "INSUFFICIENT_EVIDENCE"
    if flaw == "one_checker":
        return Discharge(gen_t, Cert(think, t_cls, (("checker-A", "PASS"),))), "INSUFFICIENT_EVIDENCE"
    if flaw == "lineage":                  # checker from the generator's lineage
        return Discharge(gen_t, Cert(think, t_cls, (("gen-%d" % k, "PASS"), ("checker-B", "PASS")), "gen-%d" % k)), "INSUFFICIENT_EVIDENCE"
    if flaw == "fail_verdict":
        return Discharge(gen_t, Cert(think, t_cls, (("checker-A", "PASS"), ("checker-B", "FAIL")))), "INSUFFICIENT_EVIDENCE"
    if flaw == "act_live":                 # act on a Claimed value with a live obligation
        return Act(Gen("gen", Discharge(gen_t, good_cert(think, t_cls)), rec, r_tier)), "UNVERIFIED_EFFECT"
    if flaw == "act_irreversible_deferred":
        return Act(Defer(Gen("gen", Discharge(gen_t, good_cert(think, t_cls)), rec, r_tier), rec, "BUDGET", "retry"), "IRREVERSIBLE"), "UNVERIFIED_EFFECT"
    if flaw == "act_unknown":
        return Act(Lit(None, UnknownT("NOT_YET_OBSERVABLE"))), "UNVERIFIED_EFFECT"
    if flaw == "act_escalated":
        return Act(Escalate(gen_t, think, "Court"), "REVERSIBLE"), "UNVERIFIED_EFFECT"
    if flaw == "no_such":
        return Discharge(gen_t, good_cert("ghost-%d" % k, "PROOF")), "NO_SUCH_OBLIGATION"
    if flaw == "bad_defer":
        return Defer(gen_t, think, "LAZY", "later"), "INVALID_DEFER"
    raise ValueError(flaw)


FLAW_PLAN = (["drop"] * 5 + ["drop_all"] * 2 + ["weak_class"] * 4 + ["one_checker"] * 2 + ["lineage"] * 2 +
             ["fail_verdict"] * 1 + ["act_live"] * 3 + ["act_irreversible_deferred"] * 2 + ["act_unknown"] * 1 +
             ["act_escalated"] * 1 + ["no_such"] * 1 + ["bad_defer"] * 1)


def flows():
    """The OC-E1 set: 25 correct flows (expected None) and 25 flawed flows (expected error code)."""
    out = [think_recommend(k) for k in range(25)]
    assert len(FLAW_PLAN) == 25
    out += [think_recommend(25 + i, flaw) for i, flaw in enumerate(FLAW_PLAN)]
    return out


def run_oc_e1():
    results = []
    for i, (p, expected) in enumerate(flows()):
        status, code, detail = check(p)
        ok = (status == "OK") if expected is None else (status == "ERROR" and code == expected)
        results.append({"flow": i, "expected": expected or "OK", "got": code if status == "ERROR" else "OK", "pass": ok})
    correct = [r for r in results if r["expected"] == "OK"]
    flawed = [r for r in results if r["expected"] != "OK"]
    return {"correct_total": len(correct), "correct_accepted": sum(r["pass"] for r in correct),
            "flawed_total": len(flawed), "flawed_rejected_with_reason": sum(r["pass"] for r in flawed),
            "false_positives": sum(not r["pass"] for r in correct), "false_negatives": sum(not r["pass"] for r in flawed),
            "results": results}
