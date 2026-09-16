# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""MFA-VO-082 — OC-E1: 25 correct Think–Recommend flows accepted, 25 flawed flows rejected with the right reason."""
import unittest

import _bootstrap  # noqa: F401
from twin import oc


class TestOCE1(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.report = oc.run_oc_e1()

    def test_fifty_flows(self):
        self.assertEqual(self.report["correct_total"], 25)
        self.assertEqual(self.report["flawed_total"], 25)

    def test_correct_flows_accepted(self):
        self.assertEqual(self.report["correct_accepted"], 25)
        self.assertEqual(self.report["false_positives"], 0)

    def test_flawed_flows_rejected_with_reason(self):
        failed = [r for r in self.report["results"] if not r["pass"]]
        self.assertEqual(failed, [], failed)
        self.assertEqual(self.report["flawed_rejected_with_reason"], 25)
        self.assertEqual(self.report["false_negatives"], 0)
        reasons = {r["expected"] for r in self.report["results"] if r["expected"] != "OK"}
        for code in ("DROPPED_OBLIGATIONS", "INSUFFICIENT_EVIDENCE", "UNVERIFIED_EFFECT"):
            self.assertIn(code, reasons)


class TestOCRules(unittest.TestCase):
    def test_gen_produces_claimed_with_obligation(self):
        tau, O = oc.infer(oc.Gen("g", oc.Lit("x"), "c1", tier=0))
        self.assertIsInstance(tau, oc.Claimed)
        self.assertEqual([(o.claim, o.tier, o.evidence_class, o.method, o.status) for o in O], [("c1", 0, "PROOF", "PROOF", "LIVE")])

    def test_discharge_yields_verified_only_when_ledger_empty(self):
        p = oc.Discharge(oc.Gen("g", oc.Lit("x"), "c1", 1), oc.good_cert("c1", "CHECK"))
        tau, O = oc.check_program(p)
        self.assertIsInstance(tau, oc.Verified)
        self.assertEqual(O, [])
        p2 = oc.Discharge(oc.Gen("g", oc.Gen("g", oc.Lit("x"), "c1", 1), "c2", 2), oc.good_cert("c1", "CHECK"))
        tau2, O2 = oc.infer(p2)
        self.assertIsInstance(tau2, oc.Claimed)
        self.assertEqual([o.claim for o in O2], ["c2"])

    def test_weakening_rejected(self):
        with self.assertRaises(oc.OCError) as cm:
            oc.check_program(oc.Gen("g", oc.Lit("x"), "c1", 1))
        self.assertEqual(cm.exception.code, "DROPPED_OBLIGATIONS")

    def test_defer_keeps_obligation_marked(self):
        p = oc.Defer(oc.Gen("g", oc.Lit("x"), "c1", 2), "c1", "AWAITING_CREATOR", "ask at next review", deadline=5)
        tau, O = oc.check_program(p)
        self.assertEqual([(o.claim, o.status, o.reason, o.plan, o.deadline) for o in O], [("c1", "DEFERRED", "AWAITING_CREATOR", "ask at next review", 5)])

    def test_act_rules(self):
        verified = oc.Discharge(oc.Gen("g", oc.Lit("x"), "c1", 1), oc.good_cert("c1", "CHECK"))
        self.assertEqual(oc.check(oc.Act(verified, "IRREVERSIBLE"))[0], "OK")
        deferred = oc.Defer(oc.Gen("g", oc.Lit("x"), "c1", 2), "c1", "BUDGET", "retry")
        self.assertEqual(oc.check(oc.Act(deferred, "REVERSIBLE"))[0], "OK")
        self.assertEqual(oc.check(oc.Act(deferred, "IRREVERSIBLE"))[1], "UNVERIFIED_EFFECT")
        self.assertEqual(oc.check(oc.Act(oc.Lit(1, oc.Base("Text"))))[1], "UNVERIFIED_EFFECT")

    def test_vfc_two_independent_checkers(self):
        vfc = oc.VFC()
        self.assertTrue(vfc.verify(oc.good_cert("c")))
        self.assertFalse(vfc.verify(oc.Cert("c", "PROOF", (("a", "PASS"),))))
        self.assertFalse(vfc.verify(oc.Cert("c", "PROOF", (("a", "PASS"), ("a", "PASS")))))
        self.assertFalse(vfc.verify(oc.Cert("c", "PROOF", (("gen", "PASS"), ("b", "PASS")), generator="gen")))

    def test_scheduler_discharges_defers_escalates(self):
        obs = [oc.Obligation("p0", 0, "PROOF", 10, "PROOF"), oc.Obligation("p1", 0, "PROOF", 10, "PROOF"),
               oc.Obligation("late", 1, "CHECK", 0, "CHECK"), oc.Obligation("unprovable-t2", 2, "TEST", 0, "TEST"),
               oc.Obligation("w", 2, "TEST", 10, "WITNESS")]
        out, rep = oc.discharge_scheduler(obs, {0: 5, 1: 0, 2: 4}, now=1)
        st = {o.claim: (o.status, o.reason, o.escalated_to) for o in out}
        self.assertEqual(st["p0"], ("DISCHARGED", None, None))
        self.assertEqual(st["p1"], ("DEFERRED", "BUDGET", None))
        self.assertEqual(st["late"], ("ESCALATED", "BUDGET", "Court"))
        self.assertEqual(st["unprovable-t2"], ("ESCALATED", "BUDGET", "Owner"))
        self.assertEqual(st["w"], ("DISCHARGED", None, None))
        self.assertEqual(rep["LIVE"], 0)


if __name__ == "__main__":
    unittest.main()
