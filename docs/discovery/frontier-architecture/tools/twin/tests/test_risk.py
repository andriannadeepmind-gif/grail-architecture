# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""TES_Propagate: risk map per element and per capability; every capability has a risk value."""
import os
import tempfile
import unittest

import yaml

import _bootstrap
from twin import model, risk


class TestRisk(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.M = model.load(_bootstrap.PKG)
        cls.rm = risk.propagate(cls.M)

    def test_every_element_and_capability_has_risk(self):
        self.assertEqual(set(self.rm["elements"]), set(self.M.elements))
        self.assertEqual(set(self.rm["capabilities"]), set(self.M.capabilities))
        for cap, rec in self.rm["capabilities"].items():
            self.assertIsInstance(rec["risk"], float, cap)
            self.assertTrue(0.0 <= rec["risk"] <= 1.0)
            self.assertTrue(rec["providers"], cap)
        self.assertEqual(self.rm["summary"]["unrecognised_status"], [])

    def test_risk_is_monotone_over_dependencies(self):
        els = self.rm["elements"]
        for e, rec in els.items():
            self.assertGreaterEqual(rec["risk"], rec["base"])
            for d in rec["dependencies"]:
                self.assertGreaterEqual(rec["risk"] + 1e-9, els[d]["risk"] * risk.DECAY)

    def test_capability_risk_is_min_over_providers(self):
        for cap, rec in self.rm["capabilities"].items():
            self.assertEqual(rec["risk"], min(self.rm["elements"][p]["risk"] for p in rec["providers"]))

    def test_scc_condensation_and_table(self):
        self.assertEqual(risk.base_risk("PROVEN"), (0.0, "PROVEN"))
        self.assertEqual(risk.base_risk(None), (0.8, "missing"))
        self.assertEqual(risk.base_risk({"overall": "NEW FORMALISM"}), (0.5, "NEW FORMALISM"))
        sccs = risk.tarjan_scc(["a", "b", "c", "d"], {"a": ["b"], "b": ["a"], "c": ["a"], "d": []})
        self.assertIn(["a", "b"], sccs)
        self.assertEqual(len(sccs), 3)
        members = {}
        for e, rec in self.rm["elements"].items():
            members.setdefault(rec["scc"], []).append(e)
        for comp in members.values():
            risks = {self.rm["elements"][e]["risk"] for e in comp}
            self.assertEqual(len(risks), 1)    # one risk per SCC

    def test_write_yaml(self):
        with tempfile.TemporaryDirectory() as d:
            p = risk.write_yaml(self.rm, os.path.join(d, "risk.yaml"))
            with open(p, encoding="utf-8") as fh:
                head = fh.readline()
                self.assertIn("STAVROPOULOS LAW", head)
                data = yaml.safe_load(fh)
            self.assertEqual(data["summary"]["capabilities"], len(self.M.capabilities))


if __name__ == "__main__":
    unittest.main()
