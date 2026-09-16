# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""MFA-PATCH-0059 — the eight mechanical acceptance tests of the epistemic-lock correction (MFA-MECH-038, MFA-INV-075/103)."""
import unittest

import _bootstrap
from twin import chh, model, scenarios
from twin import world as W


class TestEpistemicLockRemoved(unittest.TestCase):
    def test_all_eight_acceptance_checks(self):
        res = chh.acceptance_checks()
        self.assertEqual(len(res), 8)
        for name, ok in res.items():
            self.assertTrue(ok, name)

    def test_initial_status_and_forbidden_sources(self):
        rec = chh.PhenomenalClaimRecord("c")
        self.assertEqual(rec.epistemic_status, "ACTIVE_UNKNOWN")
        for src in chh.FORBIDDEN_SOURCES:
            with self.assertRaises(chh.Rejected):
                rec.attempt_set_from(src, "PROVEN")
            self.assertEqual(rec.epistemic_status, "ACTIVE_UNKNOWN")

    def test_every_required_transition_is_reachable(self):
        p = chh.AdmittedProtocol("P", admitted_by="Court", theory="T-GWT", substrate="ASRW-F2")
        rec = chh.PhenomenalClaimRecord("c").transition("EMPIRICALLY_SUPPORTED", p, ("e1",))
        rec.transition("CONFLICT", p, ("e2",))
        rec.transition("FALSIFIED", p)
        self.assertEqual([h[1] for h in rec.history], ["ACTIVE_UNKNOWN", "EMPIRICALLY_SUPPORTED", "CONFLICT", "FALSIFIED"])

    def test_proven_requires_protocol_judges_experiments_and_creator(self):
        weak = chh.AdmittedProtocol("P", admitted_by="creator")
        with self.assertRaises(chh.Rejected):
            chh.PhenomenalClaimRecord("c").transition("PROVEN", weak)
        strong = chh.AdmittedProtocol("P", admitted_by="creator", independent_judges=("J1", "J2"), discriminating_experiments=("CHH-X-01",), creator_approval=True)
        rec = chh.PhenomenalClaimRecord("c").transition("PROVEN", strong)
        self.assertEqual(rec.epistemic_status, "PROVEN")           # not predetermined: PROVEN is reachable by the admitted path

    def test_unadmitted_protocol_cannot_write(self):
        selfp = chh.AdmittedProtocol("P", admitted_by="self")
        with self.assertRaises(chh.Rejected):
            chh.PhenomenalClaimRecord("c").transition("EMPIRICALLY_SUPPORTED", selfp, ("e",))

    def test_unmeasurable_is_orthogonal(self):
        u = chh.IndicatorStatus(unmeasurable_reason="N_ELEMENTS_GT_PHI_LIMIT")
        a = chh.IndicatorStatus(value=None)
        m = chh.IndicatorStatus(value=0.7, ci=(0.6, 0.8))
        self.assertEqual(u.evaluate_atom(lambda v: v > 0.5)[0], "UNKNOWN")
        self.assertEqual(a.evaluate_atom(lambda v: v > 0.5)[0], "FALSE")
        self.assertIs(chh.join(u, m), m)
        self.assertIs(chh.join(m, u), m)

    def test_policies_are_not_invariants(self):
        self.assertEqual(chh.ResourcePolicy(3).experiments_per_cycle, 3)
        self.assertEqual(chh.replay_requirement("FROZEN_DETERMINISTIC_F1")["mode"], "BITWISE")
        self.assertEqual(chh.replay_requirement("D2")["mode"], "VERSIONED_CAUSAL_REPLAY")

    def test_twin_invariants_accept_revision_and_reject_forbidden_sources(self):
        M = model.load(_bootstrap.PKG)
        v = scenarios.Vocabulary(M, seed=5)
        w = W.World(M, seed=1)
        ok = v.ev("MFA-CON-070", "claim", {"kind": "PhenomenalClaim", "epistemic_status": "EMPIRICALLY_SUPPORTED", "source": "admitted_protocol",
                                            "protocol": {"id": "P-1", "admitted_by": "creator"}, "evidence": ["e1"]})
        w2 = W.apply(w, ok)
        self.assertFalse(isinstance(w2, W.Violation))
        self.assertEqual([x.inv_id for x in w2.violations], [])
        bad = v.ev("MFA-CON-070", "claim", {"kind": "PhenomenalClaim", "epistemic_status": "EMPIRICALLY_SUPPORTED", "source": "self_report"})
        w3 = W.apply(w, bad)
        self.assertIn("MFA-INV-075", [x.inv_id for x in w3.violations])


if __name__ == "__main__":
    unittest.main()
