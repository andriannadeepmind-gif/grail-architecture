# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""world.py — TES_Apply / TES_Replay / TES_Substitute over the loaded model (MFA-MECH-043, F1).

World w = <M cut, sigma: ELM -> (fidelity, state), log, seeds, clock, violations, unmeasured, constants>.
Event ev = <contract, op, args, actor, ret_class, time, kind> must satisfy signature(contract).
apply(world, event) -> World | Violation   (the input world is never mutated)
fork(world, seed) -> World                  (same state, fresh rng)
replay(world0, log, seeds) -> World         (bitwise identical state hash, D1)
substitute(world, elm, F_to) -> (status, receipt, world)   (fidelity transition under a conformance suite)
"""
from __future__ import annotations

import enum
import random
from dataclasses import dataclass, field

from . import invariants as INV
from .model import ESCROW_CLASSES, RET_CLASSES, canonical, sha256

EVENT_KINDS = ("OP", "PRESIMULATION", "AUTHORIZATION")


class Fidelity(str, enum.Enum):
    F0 = "F0"  # mock: the element appends the typed event to its state log
    F1 = "F1"  # executable specification (this package; per-element specs registered in IMPLS)
    F2 = "F2"  # deterministic simulation (DST) implementation
    F3 = "F3"  # shadow of the real component
    F4 = "F4"  # real component (only under DisclosureGrant / PDP — never from the twin)


@dataclass(frozen=True)
class Event:
    contract: str
    op: str
    args: dict = field(default_factory=dict)
    actor: str = "twin"
    ret_class: str | None = None
    time: int = 0
    kind: str = "OP"

    def to_dict(self):
        return {"contract": self.contract, "op": self.op, "args": self.args, "actor": self.actor,
                "ret_class": self.ret_class, "time": self.time, "kind": self.kind}

    def label(self):
        return "%s.%s[%s]" % (self.contract, self.op, self.kind if self.kind != "OP" else self.actor)


@dataclass(frozen=True)
class Violation:
    """Refusal of an event: the event is NOT applied (contract signature / precondition / RET escrow)."""
    kind: str
    event: Event
    evidence: str

    def to_dict(self):
        return {"kind": self.kind, "event": self.event.to_dict(), "evidence": self.evidence}


@dataclass(frozen=True)
class ViolationRecord:
    """An executable invariant returned False after the event was applied (the world continues)."""
    inv_id: str
    event: Event
    evidence: str
    at: int  # index of the event in the log

    def to_dict(self):
        return {"inv_id": self.inv_id, "at": self.at, "event": self.event.to_dict(), "evidence": self.evidence}


class TwinError(Exception):
    pass


# ---- fidelity implementations -----------------------------------------------------------------------------
class Impl:
    """An element implementation at one fidelity: initial state, step(elm, state, event, rng), observe(state)."""

    def __init__(self, name, initial, step, observe):
        self.name = name
        self.initial = initial
        self.step = step
        self.observe = observe


def _mock_initial():
    return []


def _mock_step(elm, state, ev, rng):
    return state + [{"op": ev.op, "t": ev.time, "nonce": rng.getrandbits(32)}]


def _mock_observe(state):
    return {"n": len(state), "ops": [r["op"] for r in state]}


MOCK = Impl("F0-mock", _mock_initial, _mock_step, _mock_observe)


def _cs_initial():
    return {"journal": [], "head": sha256("genesis")}


def _cs_step(elm, state, ev, rng):
    """F1 spec of the Commitment Store (MFA-ELM-001): append-only journal with a chained content id."""
    cid = sha256({"prev": state["head"], "event": ev.to_dict()})
    return {"journal": state["journal"] + [{"op": ev.op, "cid": cid}], "head": cid}


def _cs_observe(state):
    return {"n": len(state["journal"]), "ops": [r["op"] for r in state["journal"]]}


COMMITMENT_STORE_F1 = Impl("F1-commitment-store", _cs_initial, _cs_step, _cs_observe)

IMPLS: dict = {("MFA-ELM-001", "F1"): COMMITMENT_STORE_F1}
TOLERANCE = {"F0": "exact", "F1": "exact", "F2": "count", "F3": "count", "F4": "count"}


def register_impl(elm, fidelity, impl):
    IMPLS[(elm, str(getattr(fidelity, "value", fidelity)))] = impl


def impl_for(elm, fidelity):
    f = str(getattr(fidelity, "value", fidelity))
    if f == "F0":
        return MOCK
    impl = IMPLS.get((elm, f))
    if impl is None:
        raise TwinError("no %s implementation registered for %s" % (f, elm))
    return impl


# ---- contract preconditions (registry; default True) --------------------------------------------------------
CC_RULES = ("ASSERT", "OBSERVE", "DERIVE", "DELEGATE", "CONTEST", "RESOLVE", "REVOKE", "FORGET")


def _pre_ret(world, ev):
    if ev.op == "commit" and ev.args.get("effect") not in world.index["effects_proposed"]:
        return False, "commit(effect=%r) without an earlier propose(effect)" % ev.args.get("effect")
    return True, ""


def _pre_cc(world, ev):
    if ev.op == "apply" and ev.args.get("rule") not in CC_RULES:
        return False, "apply(rule=%r) not one of %s" % (ev.args.get("rule"), CC_RULES)
    return True, ""


def _pre_smf(world, ev):
    if ev.op == "train" and ev.args.get("recipe") not in world.index["recipes_admitted"]:
        return False, "train(recipe=%r) without an earlier admit(recipe)" % ev.args.get("recipe")
    return True, ""


def _pre_oc(world, ev):
    if ev.op == "discharge" and not ev.args.get("cert"):
        return False, "discharge without certificate"
    return True, ""


PRECONDITIONS = {"MFA-CON-034": _pre_ret, "MFA-CON-033": _pre_cc, "MFA-CON-047": _pre_smf, "MFA-CON-071": _pre_oc}


# ---- escrow helpers --------------------------------------------------------------------------------------------
def presimulation(ev):
    """The PRESIMULATION escrow event for an irreversible event (RET shadow on the same args)."""
    return Event("MFA-CON-034", "shadow", ev.args, ev.actor, "REVERSIBLE", ev.time, "PRESIMULATION")


def authorization(ev, actor="creator"):
    """The creator's AUTHORIZATION escrow event for an IRREVERSIBLE event (RET sign_envelope on the same args)."""
    return Event("MFA-CON-034", "sign_envelope", ev.args, actor, "REVERSIBLE", ev.time, "AUTHORIZATION")


# ---- the world ---------------------------------------------------------------------------------------------------
class World:
    def __init__(self, model, seed=0, cut="HEAD"):
        self.model = model
        self.cut = cut
        self.seed = seed
        self.rng = random.Random(seed)
        self.sigma = {e: {"fidelity": Fidelity.F0.value, "state": MOCK.initial()} for e in model.elements}
        self.log = []
        self.seeds = []
        self.clock = {}
        self.violations = []
        self.unknown_results = []
        self.constants = {"telos_hash": model.telos_hash, "constitution_hash": model.constitution_hash}
        self.index = INV.new_index()
        self.last = None
        self.parent = None
        self.id = "w%s" % seed
        reg = INV.registry(model)
        self.unmeasured_reasons = {k: v.reason for k, v in reg.items() if isinstance(v, INV.Unmeasured) and k in model.invariants}
        self.unmeasured_events = 0

    # -- immutable-style copy
    def copy(self):
        w = World.__new__(World)
        w.model = self.model
        w.cut = self.cut
        w.seed = self.seed
        w.rng = random.Random()
        w.rng.setstate(self.rng.getstate())
        w.sigma = {e: {"fidelity": c["fidelity"], "state": c["state"]} for e, c in self.sigma.items()}
        w.log = list(self.log)
        w.seeds = list(self.seeds)
        w.clock = dict(self.clock)
        w.violations = list(self.violations)
        w.unknown_results = list(self.unknown_results)
        w.constants = dict(self.constants)
        w.index = INV.copy_index(self.index)
        w.last = self.last
        w.parent = self.parent
        w.id = self.id
        w.unmeasured_reasons = self.unmeasured_reasons
        w.unmeasured_events = self.unmeasured_events
        return w

    # -- views
    @property
    def unmeasured(self):
        """(inv_id, reason) for every invariant declared UNMEASURED at every event of this world."""
        return sorted(self.unmeasured_reasons.items())

    def fidelity(self, elm):
        return self.sigma[elm]["fidelity"]

    def escrow_ok(self, ev):
        key = canonical(ev.args)
        if key not in self.index["presim"]:
            return False
        if ev.ret_class == "IRREVERSIBLE" and key not in self.index["authorized"]:
            return False
        return True

    def state(self):
        return {"cut": self.cut, "sigma": self.sigma, "log": [e.to_dict() for e in self.log], "seeds": self.seeds,
                "clock": self.clock, "violations": [v.to_dict() for v in self.violations],
                "unknown_results": self.unknown_results, "unmeasured_events": self.unmeasured_events,
                "constants": self.constants}

    def state_hash(self):
        return sha256(self.state())

    def __repr__(self):
        return "World(%s, events=%d, violations=%d)" % (self.id, len(self.log), len(self.violations))


# ---- TES_Apply -----------------------------------------------------------------------------------------------------
def apply(world, event, seed=None):
    """TES_Apply(w, ev) -> w' | Violation.  `seed` forces the per-event rng seed (used by replay)."""
    M = world.model
    if event.kind not in EVENT_KINDS:
        return Violation("CONTRACT_SIGNATURE", event, "unknown event kind %r" % event.kind)
    if M.contract(event.contract) is None:
        return Violation("CONTRACT_SIGNATURE", event, "unknown contract %s" % event.contract)
    ops = M.ops_of(event.contract)
    if event.op not in ops:
        return Violation("CONTRACT_SIGNATURE", event, "op %r not in signature of %s %s" % (event.op, event.contract, list(ops)))
    if event.ret_class is not None and event.ret_class not in RET_CLASSES:
        return Violation("CONTRACT_SIGNATURE", event, "unknown RET class %r" % event.ret_class)
    if not isinstance(event.args, dict):
        return Violation("CONTRACT_SIGNATURE", event, "args must be a JSON object")
    pre = PRECONDITIONS.get(event.contract)
    if pre is not None:
        ok, trace = pre(world, event)
        if not ok:
            return Violation("CONTRACT_PRECONDITION", event, trace)
    if event.ret_class in ESCROW_CLASSES and not world.escrow_ok(event):
        need = "PRESIMULATION" + (" + creator AUTHORIZATION" if event.ret_class == "IRREVERSIBLE" else "")
        return Violation("RET_ESCROW", event, "%s event without escrow (%s on the same args)" % (event.ret_class, need))

    w = world.copy()
    drawn = w.rng.getrandbits(32)
    s = drawn if seed is None else int(seed)
    provider = M.provider_of(event.contract)
    if provider is not None:
        cell = w.sigma[provider]
        impl = impl_for(provider, cell["fidelity"])
        cell["state"] = impl.step(provider, cell["state"], event, random.Random(s))
    w.log.append(event)
    w.seeds.append(s)
    w.last = event
    w.clock[event.actor] = w.clock.get(event.actor, 0) + 1
    w.clock["_t"] = max(w.clock.get("_t", 0), event.time)
    w.unmeasured_events += 1                       # UNMEASURED invariants declared for this event (never silent)
    at = len(w.log) - 1
    for inv_id, entry in INV.PREDICATES.items():
        if not isinstance(entry, INV.Executable) or inv_id not in M.invariants or not entry.active_for(event.contract):
            continue
        r = entry(w)
        if r is True:
            continue
        if isinstance(r, INV.Unknown):
            w.unknown_results.append([inv_id, r.reason, at])
        else:
            evidence = r.evidence if isinstance(r, INV.Fail) else "%s predicate returned %r on %s" % (inv_id, r, event.label())
            w.violations.append(ViolationRecord(inv_id, event, evidence, at))
    INV.update_index(w.index, event)
    return w


def apply_all(world, events, stop_on_refusal=False):
    """Apply a sequence; returns (world, refusals).  Refused events are not applied."""
    refusals = []
    for ev in events:
        r = apply(world, ev)
        if isinstance(r, Violation):
            refusals.append(r)
            if stop_on_refusal:
                break
        else:
            world = r
    return world, refusals


def violations(world):
    return list(world.violations)


# ---- fork / replay -------------------------------------------------------------------------------------------------
def fork(world, seed):
    w = world.copy()
    w.seed = seed
    w.rng = random.Random(seed)
    w.parent = world.id
    w.id = "%s/%s" % (world.id, seed)
    return w


def replay(world0, log, seeds):
    """TES_Replay: re-apply (event, seed) pairs on world0; the caller compares state hashes (D1)."""
    if len(log) != len(seeds):
        raise TwinError("log and seeds differ in length")
    w = world0
    for ev, s in zip(log, seeds):
        r = apply(w, ev, seed=s)
        if isinstance(r, Violation):
            raise TwinError("replay refused a logged event: %s" % (r,))
        w = r
    return w


# ---- substitution (fidelity transition) ----------------------------------------------------------------------------
def conformance_tests(model, contract_id, n=8):
    """Conformance suite of a contract: one typed event per operation (bounded), fixed args and seeds."""
    suite = []
    for i, op in enumerate(model.ops_of(contract_id)[:n]):
        suite.append((Event(contract_id, op, {"k": i, "suite": contract_id}, "conformance", None, i), 1000 + i))
    return suite


def _run_suite(elm, impl, suite):
    st = impl.initial()
    for ev, s in suite:
        st = impl.step(elm, st, ev, random.Random(s))
    return impl.observe(st)


def _conforms(reference, candidate, tolerance):
    if tolerance == "exact":
        return reference == candidate
    return reference.get("n") == candidate.get("n")


def rebuild(world, elm, impl):
    """Rebuild the state of `elm` under `impl` from its own event history (deterministic: stored seeds)."""
    st = impl.initial()
    for ev, s in zip(world.log, world.seeds):
        if world.model.provider_of(ev.contract) == elm:
            st = impl.step(elm, st, ev, random.Random(s))
    return st


def substitute(world, elm, f_to, impl=None):
    """TES_Substitute: elm changes fidelity only if the new impl passes the conformance suite of every contract
    the element provides, judged against the current impl (same contract at every fidelity).
    Returns (status, receipt, world'); on FAIL the world is unchanged."""
    M = world.model
    f_to = str(getattr(f_to, "value", f_to))
    f_from = world.sigma[elm]["fidelity"]
    try:
        new_impl = impl if impl is not None else impl_for(elm, f_to)
    except TwinError as e:
        return "FAIL", {"result": "FAIL", "reason": str(e)}, world
    cur_impl = impl_for(elm, f_from)
    contracts = M.contracts_of(elm) or ("MFA-CON-072",)
    receipt = {"result": "PASS", "elm": elm, "from": f_from, "to": f_to, "tolerance": TOLERANCE.get(f_to, "count"), "tests": []}
    for cid in contracts:
        suite = conformance_tests(M, cid)
        ref = _run_suite(elm, cur_impl, suite)
        cand = _run_suite(elm, new_impl, suite)
        ok = _conforms(ref, cand, receipt["tolerance"])
        receipt["tests"].append({"contract": cid, "n": len(suite), "pass": ok})
        if not ok:
            receipt["result"] = "FAIL"
            receipt["reason"] = "contract %s: expected %s got %s" % (cid, ref, cand)
            return "FAIL", receipt, world
    w = world.copy()
    if impl is not None:
        register_impl(elm, f_to, impl)
    w.sigma[elm] = {"fidelity": f_to, "state": rebuild(w, elm, new_impl)}
    transition = Event("MFA-CON-072", "substitute",
                       {"elm": elm, "from": f_from, "to": f_to, "suite_receipt": {"result": "PASS", "tests": receipt["tests"]}},
                       "twin", None, (w.log[-1].time + 1) if w.log else 0)
    r = apply(w, transition)
    if isinstance(r, Violation):
        raise TwinError("FidelityTransition refused: %s" % (r,))
    return "OK", receipt, r
