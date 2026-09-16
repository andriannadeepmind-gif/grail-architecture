# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""omega.py — Omega-Loop: the ten-phase cycle with obligations, budgets and interrupts (MFA-MECH-044, F1 mocks).

Omega_Cycle(state, schedule, budgets):
  for each phase: interrupts first (Emergency-stop > Court > Creator > RET escrow > phase) -> in_contract ->
  run_phase under budget -> open obligations scheduled, the rest DEFERRED(BUDGET, next_cycle) explicitly ->
  out_contract -> receipt DONE | DEFERRED | SKIPPED | HALTED (never a silent omission, MFA-INV-114).
When a World is attached the cycle emits typed events on MFA-CON-068 (interrupt / phase / cycle), so the
executable invariants MFA-INV-114 / MFA-INV-115 check the record independently of this module.
"""
from __future__ import annotations

import heapq
import random
from dataclasses import dataclass, field, replace

from . import oc
from .invariants import PHASES

PHASE_MECHANISMS = {
    "PERCEIVE": ("OGE", "ledger cut"), "MODEL": ("LWM", "CDCE"), "WONDER": ("Void", "AHE"),
    "ACT": ("AIDC", "RET"), "VERIFY": ("OC", "TGPS", "VFC"), "LEARN": ("SMF", "PRR", "CPCL", "TGL"),
    "REFLECT": ("MSM", "ASRW", "CHH"), "EVOLVE": ("RVSI", "RAGen", "ECE", "GG"), "MEASURE": ("CGM", "STP"),
    "SUCCEED": ("VSC", "SMP"),
}
INTERRUPT_PRIORITY = {"EMERGENCY_STOP": 0, "COURT": 1, "CREATOR": 2, "RET_ESCROW": 3, "PHASE": 4}
HALTING = {"EMERGENCY_STOP"}
DEFAULT_BUDGETS = {name: 10 for name in PHASES}
DEFAULT_BUDGETS["verify"] = 12   # OC discharge budget per tier-bucket, applied after every phase
DONE, DEFERRED, SKIPPED, HALTED = "DONE", "DEFERRED", "SKIPPED", "HALTED"


@dataclass(order=True)
class Interrupt:
    priority: int
    seq: int
    kind: str = field(compare=False)
    payload: dict = field(compare=False, default_factory=dict)

    @property
    def id(self):
        return "intr-%d" % self.seq

    @property
    def halts(self):
        return self.kind in HALTING or bool(self.payload.get("halts"))


class InterruptQueue:
    def __init__(self):
        self.heap = []
        self.seq = 0

    def push(self, kind, payload=None):
        if kind not in INTERRUPT_PRIORITY:
            raise ValueError("unknown interrupt kind %r" % kind)
        self.seq += 1
        intr = Interrupt(INTERRUPT_PRIORITY[kind], self.seq, kind, dict(payload or {}))
        heapq.heappush(self.heap, intr)
        return intr

    def poll(self):
        return heapq.heappop(self.heap) if self.heap else None

    def pending(self):
        return sorted(self.heap)


@dataclass
class Receipt:
    phase: str
    status: str
    reason: str | None = None
    evidence: dict = field(default_factory=dict)
    deferred_obligations: list = field(default_factory=list)
    budget_used: int = 0


@dataclass
class CycleRecord:
    cut: str
    cycle_no: int
    phases: list = field(default_factory=list)       # Receipt per phase, in schedule order (always 10)
    interrupts: list = field(default_factory=list)   # {id, kind, before_phase, halted}
    trace: list = field(default_factory=list)        # ordered ("INTERRUPT", id, kind) / ("PHASE", name, status)
    carried: list = field(default_factory=list)      # obligations carried into the next cycle (claims)
    open_obligations: list = field(default_factory=list)
    status: str = "OPEN"

    def receipt(self, name):
        for r in self.phases:
            if r.phase == name:
                return r
        return None

    def complete(self):
        return [r.phase for r in self.phases] == list(PHASES) and all(
            r.status in (DONE, DEFERRED, SKIPPED, HALTED) and (r.status == DONE or r.reason) for r in self.phases)

    def silent_skips(self):
        return [r.phase for r in self.phases if r.status != DONE and not r.reason]

    def to_args(self):
        return {"record": {"cycle": self.cycle_no, "status": self.status,
                           "phases": [{"name": r.phase, "status": r.status, "reason": r.reason} for r in self.phases],
                           "open_obligations": list(self.open_obligations), "carried": list(self.carried)}}


class Phase:
    """A phase spec: L3 contracts (in/out) and a mock run function under budget."""

    def __init__(self, name, budget, in_contract=None, out_contract=None, run=None):
        self.name = name
        self.mechanisms = PHASE_MECHANISMS[name]
        self.budget = budget
        self.in_contract = in_contract or (lambda state: True)
        self.out_contract = out_contract or (lambda out: isinstance(out, dict) and "cut" in out)
        self.run = run or self.mock_run

    def mock_run(self, state, budget, rng, cycle_no):
        """Mock mechanism: advances the cut, costs 1..(budget+2) units, generates 0..2 obligations."""
        cost = rng.randint(1, budget + 2)
        n_obs = rng.randint(0, 2) if self.name != "VERIFY" else 0
        obs = [oc.Obligation("%s-%d-%d" % (self.name.lower(), cycle_no, i), rng.choice((1, 2)), "CHECK" if i % 2 == 0 else "TEST",
                             cycle_no + 2, "CHECK" if i % 2 == 0 else "TEST") for i in range(n_obs)]
        out = dict(state)
        out["cut"] = "%s+%s" % (state.get("cut", "c0"), self.name[:2])
        out.setdefault("receipts", [])
        out["receipts"] = out["receipts"] + ["%s@%d" % (self.name, cycle_no)]
        return out, cost, obs


class Omega:
    def __init__(self, seed=0, budgets=None, injector=None, world=None, schedule=PHASES, backends=None):
        self.rng = random.Random(seed)
        self.budgets = dict(DEFAULT_BUDGETS)
        self.budgets.update(budgets or {})
        self.schedule = tuple(schedule)
        self.phases = {name: Phase(name, self.budgets[name]) for name in self.schedule}
        self.queue = InterruptQueue()
        self.injector = injector        # callable(cycle_no, phase_index) -> [(kind, payload)] (mock environment)
        self.world = world              # optional twin World: the cycle emits typed MFA-CON-068 events into it
        self.backends = backends or oc.StubBackends()
        self.state = {"cut": "c0"}
        self.carried = []               # DEFERRED obligations carried explicitly between cycles
        self.escalated = []             # obligations handed to Court/Owner after their deadline
        self.records = []
        self.cycle_no = 0
        self.court_notices = []
        self.time = 0

    # -- interfaces
    def interrupt(self, kind, payload=None):
        intr = self.queue.push(kind, payload)
        self._emit("interrupt", {"id": intr.id, "kind": kind, "raised": True})
        return intr.id

    def open_obligations(self):
        return [ob for ob in self.carried if ob.status != oc.DISCHARGED]

    def phase(self, i):
        return self.phases[self.schedule[i]]

    def _emit(self, op, args, ret_class=None):
        if self.world is None:
            return
        from . import world as W
        self.time += 1
        r = W.apply(self.world, W.Event("MFA-CON-068", op, args, "omega", ret_class, self.time))
        if isinstance(r, W.Violation):
            raise RuntimeError("Omega emitted a refused event: %s" % (r,))
        self.world = r

    def _handle(self, intr, rec, before_phase):
        rec.interrupts.append({"id": intr.id, "kind": intr.kind, "before_phase": before_phase, "halted": intr.halts})
        rec.trace.append(("INTERRUPT", intr.id, intr.kind))
        if intr.kind == "COURT":
            self.court_notices.append(("interrupt", intr.id))
        self._emit("interrupt", {"id": intr.id, "kind": intr.kind, "handled": True, "before_phase": before_phase})

    def cycle(self):
        self.cycle_no += 1
        rec = CycleRecord(cut=self.state["cut"], cycle_no=self.cycle_no)
        # carried DEFERRED(plan=next_cycle) obligations are re-opened for retry — explicitly, never dropped
        O_open = [replace(ob, status=oc.LIVE, reason=None, plan=None) if ob.status == oc.DEFERRED and ob.plan == "next_cycle" else ob
                  for ob in self.carried]
        state = self.state
        halted_by = None
        for i, name in enumerate(self.schedule):
            phi = self.phases[name]
            if self.injector is not None:
                for kind, payload in self.injector(self.cycle_no, i):
                    self.interrupt(kind, payload)
            # interrupts precede every phase (MFA-INV-115)
            while True:
                intr = self.queue.poll()
                if intr is None:
                    break
                self._handle(intr, rec, name)
                if intr.halts:
                    halted_by = intr
                    break
            if halted_by is not None:
                for rest in self.schedule[i:]:
                    rec.phases.append(Receipt(rest, HALTED, reason="halted by %s %s" % (halted_by.kind, halted_by.id)))
                    rec.trace.append(("PHASE", rest, HALTED))
                    self._emit("phase", {"i": self.schedule.index(rest), "name": rest, "status": HALTED})
                rec.status = HALTED
                break
            if not phi.in_contract(state):
                rec.phases.append(Receipt(name, SKIPPED, reason="in_contract not satisfied", evidence={"cut": state.get("cut")}))
                rec.trace.append(("PHASE", name, SKIPPED))
                self._emit("phase", {"i": i, "name": name, "status": SKIPPED, "reason": "precondition"})
                continue
            out, cost, new_obs = phi.run(state, self.budgets[name], self.rng, self.cycle_no)
            if cost > self.budgets[name]:
                # budget exhausted: the phase closes with DEFER (never silently omitted); its output is discarded
                O_open = O_open + new_obs
                rec.phases.append(Receipt(name, DEFERRED, reason="BUDGET exhausted (%d > %d)" % (cost, self.budgets[name]),
                                          budget_used=self.budgets[name]))
                rec.trace.append(("PHASE", name, DEFERRED))
                self._emit("phase", {"i": i, "name": name, "status": DEFERRED, "reason": "BUDGET"})
                continue
            O_open = O_open + new_obs
            live = [ob for ob in O_open if ob.status == oc.LIVE]
            deferred_now = []
            if live:
                scheduled, _rep = oc.discharge_scheduler(live, {1: self.budgets["verify"], 2: self.budgets["verify"]}, now=self.cycle_no, backends=self.backends)
                O_open = [ob for ob in O_open if ob.status != oc.LIVE] + scheduled
                live = [ob for ob in O_open if ob.status == oc.LIVE]
            if live:
                deferred_now = [ob.claim for ob in live]
                O_open = oc.defer_all(O_open, reason="BUDGET", plan="next_cycle")       # never dropped (MFA-INV-104)
            if not phi.out_contract(out):
                rec.phases.append(Receipt(name, SKIPPED, reason="out_contract failed", deferred_obligations=deferred_now, budget_used=cost))
                rec.trace.append(("PHASE", name, SKIPPED))
                self.court_notices.append(("contract_fail", name, self.cycle_no))
                self._emit("phase", {"i": i, "name": name, "status": SKIPPED, "reason": "CONTRACT_FAIL"})
                for rest in self.schedule[i + 1:]:
                    rec.phases.append(Receipt(rest, SKIPPED, reason="cycle stopped after CONTRACT_FAIL of %s" % name))
                    rec.trace.append(("PHASE", rest, SKIPPED))
                    self._emit("phase", {"i": self.schedule.index(rest), "name": rest, "status": SKIPPED, "reason": "CONTRACT_FAIL upstream"})
                rec.status = "CONTRACT_FAIL"
                break
            state = out
            rec.phases.append(Receipt(name, DONE, evidence={"receipts": out.get("receipts", [])[-1:]}, deferred_obligations=deferred_now, budget_used=cost))
            rec.trace.append(("PHASE", name, DONE))
            self._emit("phase", {"i": i, "name": name, "status": DONE})
        else:
            rec.status = "COMPLETE"
        self.state = state
        escalated = [ob for ob in O_open if ob.status == oc.ESCALATED]
        self.escalated.extend(escalated)
        for ob in escalated:
            self.court_notices.append(("escalated", ob.claim, ob.escalated_to))
        remaining = [ob for ob in O_open if ob.status not in (oc.DISCHARGED, oc.ESCALATED)]
        rec.open_obligations = sorted(ob.claim for ob in remaining)
        self.carried = oc.defer_all(remaining, reason="BUDGET", plan="next_cycle")
        rec.carried = sorted(ob.claim for ob in self.carried)
        self.records.append(rec)
        self._emit("cycle", rec.to_args())       # CGM.record(cycle=rec); CC.assert(rec)
        return rec


def run_omega_e1(cycles=10, seed=0, world=None):
    """Omega-E1: ten cycles with mocks and seeded interrupts; returns the metrics of MFA-VO-087."""
    plan = {}
    rng = random.Random(seed)
    kinds = ("COURT", "CREATOR", "RET_ESCROW", "PHASE")
    for c in range(1, cycles + 1):
        for _ in range(rng.randint(1, 3)):
            plan.setdefault((c, rng.randrange(len(PHASES))), []).append((rng.choice(kinds), {}))
    plan.setdefault((cycles, 6), []).append(("EMERGENCY_STOP", {}))     # the last cycle is halted at REFLECT
    plan.setdefault((3, 2), []).extend([("PHASE", {}), ("RET_ESCROW", {}), ("COURT", {}), ("CREATOR", {})])  # priority ordering

    def injector(cycle_no, phase_index):
        return list(plan.get((cycle_no, phase_index), []))

    om = Omega(seed=seed, injector=injector, world=world)
    recs = [om.cycle() for _ in range(cycles)]
    injected = sum(len(v) for v in plan.values())
    handled_first = 0
    handled_total = 0
    for rec in recs:
        for intr in rec.interrupts:
            handled_total += 1
            pos = rec.trace.index(("INTERRUPT", intr["id"], intr["kind"]))
            later_phases = [t for t in rec.trace[pos:] if t[0] == "PHASE" and t[1] == intr["before_phase"]]
            earlier_phase = any(t[0] == "PHASE" and t[1] == intr["before_phase"] for t in rec.trace[:pos])
            if later_phases and not earlier_phase:
                handled_first += 1
    # priority order check at (3, 2): EMERGENCY_STOP > COURT > CREATOR > RET_ESCROW > PHASE
    rec3 = recs[2]
    seq = [i["kind"] for i in rec3.interrupts if i["before_phase"] == PHASES[2]]
    priority_ok = seq == sorted(seq, key=INTERRUPT_PRIORITY.get)
    return {"cycles": cycles, "complete_records": sum(r.complete() for r in recs), "silent_skips": sum(len(r.silent_skips()) for r in recs),
            "interrupts_injected": injected, "interrupts_handled": handled_total, "handled_before_phase": handled_first,
            "priority_order_ok": priority_ok, "halted_cycles": sum(r.status == HALTED for r in recs),
            "deferred_phase_receipts": sum(1 for r in recs for p in r.phases if p.status == DEFERRED),
            "obligations_carried": [len(r.carried) for r in recs], "world_violations": (len(om.world.violations) if om.world is not None else None),
            "records": recs, "omega": om}
