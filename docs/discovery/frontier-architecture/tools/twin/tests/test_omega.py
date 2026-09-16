# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""MFA-VO-087 — Omega-E1: 10 cycles with mocks, complete CycleRecords, interrupts handled first (100 %)."""
import unittest

import _bootstrap
from twin import model, omega
from twin import world as W
from twin.invariants import PHASES


class TestOmegaE1(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.M = model.load(_bootstrap.PKG)
        cls.res = omega.run_omega_e1(cycles=10, seed=0, world=W.World(cls.M, seed=11))

    def test_ten_complete_cycle_records(self):
        self.assertEqual(self.res["cycles"], 10)
        self.assertEqual(self.res["complete_records"], 10)
        for rec in self.res["records"]:
            self.assertEqual([r.phase for r in rec.phases], list(PHASES))

    def test_zero_silent_skips(self):
        self.assertEqual(self.res["silent_skips"], 0)
        for rec in self.res["records"]:
            for r in rec.phases:
                self.assertIn(r.status, ("DONE", "DEFERRED", "SKIPPED", "HALTED"))
                if r.status != "DONE":
                    self.assertTrue(r.reason)

    def test_interrupts_handled_before_phase(self):
        self.assertEqual(self.res["interrupts_handled"], self.res["interrupts_injected"])
        self.assertEqual(self.res["handled_before_phase"], self.res["interrupts_handled"])
        self.assertTrue(self.res["priority_order_ok"])

    def test_emergency_stop_halts_with_receipts(self):
        self.assertEqual(self.res["halted_cycles"], 1)
        last = self.res["records"][-1]
        self.assertEqual(last.status, "HALTED")
        self.assertTrue(any(r.status == "HALTED" for r in last.phases))
        self.assertTrue(all(r.status == "HALTED" for r in last.phases[6:]))

    def test_obligations_carried_explicitly_and_retried(self):
        recs = self.res["records"]
        for rec in recs:
            self.assertEqual(sorted(rec.open_obligations), sorted(rec.carried))
        self.assertGreater(self.res["deferred_phase_receipts"], 0)

    def test_twin_invariants_hold_on_emitted_events(self):
        self.assertEqual(self.res["world_violations"], 0)
        om = self.res["omega"]
        ops = [e.op for e in om.world.log]
        self.assertEqual(ops.count("cycle"), 10)
        self.assertEqual(ops.count("phase"), 100)

    def test_priority_queue_order(self):
        q = omega.InterruptQueue()
        for k in ("PHASE", "RET_ESCROW", "CREATOR", "COURT", "EMERGENCY_STOP", "COURT"):
            q.push(k)
        order = []
        while True:
            i = q.poll()
            if i is None:
                break
            order.append(i.kind)
        self.assertEqual(order, ["EMERGENCY_STOP", "COURT", "COURT", "CREATOR", "RET_ESCROW", "PHASE"])


if __name__ == "__main__":
    unittest.main()
