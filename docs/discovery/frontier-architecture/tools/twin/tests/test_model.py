# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""Loader: seats, derived graphs, reference check (R1), invariant registry coverage (MFA-INV-112)."""
import unittest

import _bootstrap
from twin import invariants as INV
from twin import model


class TestModel(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.M = model.load(_bootstrap.PKG)

    def test_seats_loaded(self):
        c = self.M.counts()
        for key in ("elements", "contracts", "invariants", "capabilities", "objectives", "telos", "obligations",
                    "unknowns", "conflicts", "programs", "mechanisms"):
            self.assertGreater(c[key], 0, key)
        self.assertIn("MFA-ELM-126", self.M.elements)
        self.assertIn("MFA-CON-072", self.M.contracts)
        self.assertIn("MFA-INV-115", self.M.invariants)

    def test_derived_maps(self):
        self.assertEqual(self.M.provider_of("MFA-CON-072"), "MFA-ELM-126")
        self.assertIn("MFA-ELM-126", self.M.cap_providers["MFA-CAP-107"])
        self.assertIn("MFA-ELM-010", self.M.deps["MFA-ELM-126"])
        self.assertIn("apply", self.M.ops_of("MFA-CON-072"))
        self.assertEqual(self.M.contracts_without_ops(), [])
        for cap, provs in self.M.cap_providers.items():
            self.assertTrue(provs, "capability %s has no provider" % cap)

    def test_parse_ops(self):
        self.assertEqual(model.parse_ops("Put/Get/Has· CIDv1."), ("Put", "Get", "Has", "CIDv1"))
        self.assertEqual(model.parse_ops("OGE.observe(residual)→AnomalyId / OGE.merge(c1,c2)→Proceeding"), ("observe", "merge"))
        self.assertEqual(model.parse_ops("Verify(claim, class)→ProofObject(grade) ∣ Unknown(reason)· grade από τη μία κλίμακα"), ("Verify",))
        self.assertNotIn("deny", model.parse_ops("Evaluate(transition)→Decision (όχι allow/deny bit)· ProposeAmendment/Ratify."))

    def test_references_resolve(self):
        self.assertEqual(self.M.check_references(), [])

    def test_registry_covers_every_invariant(self):
        reg = INV.registry(self.M)
        for inv_id in self.M.invariants:
            self.assertIn(inv_id, reg)
            self.assertTrue(isinstance(reg[inv_id], (INV.Executable, INV.Unmeasured)))
        cov = INV.coverage(self.M)
        self.assertGreaterEqual(cov["executable"], 30)
        self.assertEqual(cov["executable"] + cov["unmeasured"], cov["total"])
        for inv_id in ("MFA-INV-001", "MFA-INV-072", "MFA-INV-075", "MFA-INV-104", "MFA-INV-112", "MFA-INV-115"):
            self.assertIsInstance(reg[inv_id], INV.Executable)
        self.assertEqual(reg["MFA-INV-002"].reason, "no executable predicate yet")

    def test_hashes_are_stable(self):
        self.assertEqual(len(self.M.telos_hash), 64)
        self.assertEqual(self.M.telos_hash, model.Model(self.M.path).telos_hash)
        self.assertEqual(self.M.constitution_hash, model.Model(self.M.path).constitution_hash)


if __name__ == "__main__":
    unittest.main()
