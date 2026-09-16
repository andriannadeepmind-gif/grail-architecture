# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""MFA-VO-086 — TES-E1 (seeded violations, 0 false positives) and TES-E2 (replay determinism, fork, substitution)."""
import unittest

import _bootstrap
from twin import invariants as INV
from twin import model, scenarios
from twin import world as W


class TestTESE1(unittest.TestCase):
    """TES-E1: 30 seeded violations detected with the correct id; 0 false positives on 100 valid events."""

    @classmethod
    def setUpClass(cls):
        cls.M = model.load(_bootstrap.PKG)
        cls.report = scenarios.run_tes_e1(cls.M, W.World, W.apply, W.Violation, n_valid=100, seed=0)

    def test_at_least_30_seeds_cover_every_violation_kind(self):
        seeds = scenarios.seeded_violations(self.M)
        self.assertGreaterEqual(len(seeds), 30)
        kinds = {s.expect for s in seeds}
        for k in ("CONTRACT_SIGNATURE", "CONTRACT_PRECONDITION", "RET_ESCROW"):
            self.assertIn(k, kinds)
        for inv_id in INV.executable_ids():
            self.assertIn(inv_id, kinds, "no seeded violation for executable %s" % inv_id)

    def test_every_seed_detected_with_correct_id(self):
        failed = [r for r in self.report["results"] if not r["pass"]]
        self.assertEqual(failed, [], failed)
        self.assertEqual(self.report["detected_with_correct_id"], self.report["seeded"])

    def test_zero_false_positives_on_valid_events(self):
        self.assertEqual(self.report["valid_refused"], 0)
        self.assertEqual(self.report["valid_invariant_violations"], 0)
        self.assertEqual(self.report["false_positives"], 0)

    def test_refusal_does_not_touch_the_world(self):
        w = W.World(self.M, seed=1)
        h = w.state_hash()
        r = W.apply(w, W.Event("MFA-CON-002", "Teleport", {}, "x", None, 1))
        self.assertIsInstance(r, W.Violation)
        self.assertEqual(w.state_hash(), h)
        self.assertEqual(len(w.log), 0)

    def test_unmeasured_declared_never_silent(self):
        w = W.World(self.M, seed=1)
        w = W.apply(w, W.Event("MFA-CON-002", "Put", {"cid": "c"}, "x", None, 1))
        self.assertEqual(w.unmeasured_events, 1)
        self.assertEqual(len(w.unmeasured), INV.coverage(self.M)["unmeasured"])
        self.assertTrue(all(reason == "no executable predicate yet" for _, reason in w.unmeasured))

    def test_unknown_result_is_recorded_not_passed(self):
        w = W.World(self.M, seed=1)
        ev = W.Event("MFA-CON-054", "merge", {"concepts": ["never-born"], "merged": "m", "lossmap": {"never-born": []}}, "x", None, 1)
        w = W.apply(w, ev)
        self.assertEqual(w.violations, [])
        self.assertEqual([u[0] for u in w.unknown_results], ["MFA-INV-078"])


class TestTESE2(unittest.TestCase):
    """TES-E2: 1000 random events, fork into 10 worlds, replay hash equality 100 %, substitution F0->F1 PASS/FAIL."""

    @classmethod
    def setUpClass(cls):
        cls.M = model.load(_bootstrap.PKG)
        cls.w0 = W.World(cls.M, seed=42)
        cls.events = scenarios.random_events(cls.M, 1000, seed=7)
        cls.base, cls.refusals = W.apply_all(cls.w0, cls.events)

    def test_thousand_events_applied(self):
        self.assertEqual(len(self.events), 1000)
        self.assertEqual(len(self.base.log) + len(self.refusals), 1000)
        self.assertGreater(len(self.refusals), 0)          # some seeded refusals are part of the traffic
        self.assertGreater(len(self.base.violations), 0)   # and some recorded invariant violations

    def test_replay_of_base_is_bitwise_equal(self):
        again = W.replay(self.w0, self.base.log, self.base.seeds)
        self.assertEqual(again.state_hash(), self.base.state_hash())
        self.assertEqual(again.violations, self.base.violations)

    def test_fork_ten_worlds_replay_equal(self):
        equal = 0
        hashes = set()
        for k in range(10):
            f = W.fork(self.base, seed=k)
            tail = scenarios.valid_events(self.M, 50, seed=100 + k)
            fk, ref = W.apply_all(f, tail)
            self.assertEqual(ref, [])
            n0 = len(self.base.log)
            replayed = W.replay(W.fork(self.base, seed=k), fk.log[n0:], fk.seeds[n0:])
            if replayed.state_hash() == fk.state_hash():
                equal += 1
            hashes.add(fk.state_hash())
        self.assertEqual(equal, 10)
        self.assertEqual(len(hashes), 10)                  # different seeds, different worlds

    def test_fork_is_isolated_from_parent(self):
        h = self.base.state_hash()
        f = W.fork(self.base, seed=3)
        self.assertEqual(f.state_hash(), h)
        f2 = W.apply(f, W.Event("MFA-CON-002", "Put", {"cid": "child"}, "x", None, 99999))
        self.assertNotEqual(f2.state_hash(), h)
        self.assertEqual(self.base.state_hash(), h)
        self.assertEqual(f2.parent, self.base.id)

    def test_seed_changes_state(self):
        a = W.apply(W.World(self.M, seed=1), W.Event("MFA-CON-002", "Put", {"cid": "c"}, "x", None, 1))
        b = W.apply(W.World(self.M, seed=2), W.Event("MFA-CON-002", "Put", {"cid": "c"}, "x", None, 1))
        self.assertNotEqual(a.state_hash(), b.state_hash())
        c = W.replay(W.World(self.M, seed=2), a.log, a.seeds)
        self.assertEqual(c.state_hash(), a.state_hash())

    def test_substitution_pass(self):
        status, receipt, w = W.substitute(self.base, "MFA-ELM-001", W.Fidelity.F1)
        self.assertEqual(status, "OK")
        self.assertEqual(receipt["result"], "PASS")
        self.assertEqual(w.fidelity("MFA-ELM-001"), "F1")
        self.assertEqual(self.base.fidelity("MFA-ELM-001"), "F0")
        self.assertEqual(w.log[-1].op, "substitute")
        self.assertEqual(len(w.violations), len(self.base.violations))    # MFA-INV-113 satisfied
        n_cs = sum(1 for e in w.log if self.M.provider_of(e.contract) == "MFA-ELM-001")
        self.assertEqual(len(w.sigma["MFA-ELM-001"]["state"]["journal"]), n_cs)
        again = W.apply(w, W.Event("MFA-CON-033", "read", {"query": "q", "cut": "HEAD"}, "x", None, 99999))
        self.assertEqual(len(again.sigma["MFA-ELM-001"]["state"]["journal"]), n_cs + 1)

    def test_substitution_fail_nonconformant_impl(self):
        faulty = W.Impl("drops-reads", W.MOCK.initial,
                        lambda elm, st, ev, rng: st if ev.op == "Read" else W.MOCK.step(elm, st, ev, rng), W.MOCK.observe)
        status, receipt, w = W.substitute(self.base, "MFA-ELM-001", "F1", impl=faulty)
        self.assertEqual(status, "FAIL")
        self.assertEqual(receipt["result"], "FAIL")
        self.assertIs(w, self.base)
        self.assertEqual(self.base.fidelity("MFA-ELM-001"), "F0")

    def test_substitution_fail_without_implementation(self):
        status, receipt, w = W.substitute(self.base, "MFA-ELM-002", "F1")
        self.assertEqual(status, "FAIL")
        self.assertIn("no F1 implementation", receipt["reason"])

    def test_direct_fidelity_change_is_a_violation(self):
        ev = W.Event("MFA-CON-072", "substitute", {"elm": "MFA-ELM-002", "from": "F0", "to": "F2"}, "twin", None, 1)
        w = W.apply(W.World(self.M, seed=1), ev)
        self.assertEqual([v.inv_id for v in w.violations], ["MFA-INV-113"])


if __name__ == "__main__":
    unittest.main()
