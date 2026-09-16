#!/usr/bin/env python3
# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""run-report.py — runs the whole F1 twin (load, coverage, TES-E1, TES-E2, OC-E1, Omega-E1, risk, unit tests)
and prints one machine-readable YAML report.  Usage:  python3 tools/twin/run-report.py [--risk-out PATH]"""
import io
import pathlib
import sys
import time
import unittest

sys.dont_write_bytecode = True
HERE = pathlib.Path(__file__).resolve().parent
TOOLS = HERE.parent
PKG = TOOLS.parent
sys.path.insert(0, str(TOOLS))

import yaml  # noqa: E402

from twin import invariants as INV  # noqa: E402
from twin import model, oc, omega, risk, scenarios  # noqa: E402
from twin import world as W  # noqa: E402


def main(argv):
    t0 = time.time()
    risk_out = None
    if "--risk-out" in argv:
        risk_out = argv[argv.index("--risk-out") + 1]
    M = model.load(PKG)
    report = {"twin_report": {"package": str(PKG), "fidelity": "F1 executable specification (tools/twin)",
                              "seats": M.counts(), "dangling_references": M.check_references(),
                              "contracts_without_ops": M.contracts_without_ops()}}
    R = report["twin_report"]
    cov = INV.coverage(M)
    R["invariant_coverage"] = dict(cov)
    R["invariant_coverage"]["executable_ids"] = INV.executable_ids()
    R["invariant_coverage"]["unmeasured_reason"] = "no executable predicate yet"
    # TES-E1
    e1 = scenarios.run_tes_e1(M, W.World, W.apply, W.Violation, n_valid=100, seed=0)
    R["tes_e1"] = {"seeded_violations": e1["seeded"], "detected_with_correct_id": e1["detected_with_correct_id"],
                   "valid_events": e1["valid_events"], "false_positives": e1["false_positives"],
                   "unknown_results_on_valid": e1["unknown_results_on_valid"],
                   "by_kind": {}, "pass": e1["detected_with_correct_id"] == e1["seeded"] and e1["false_positives"] == 0}
    for r in e1["results"]:
        k = r["expected"] if not r["expected"].startswith("MFA-INV") else "MFA-INV-*"
        R["tes_e1"]["by_kind"][k] = R["tes_e1"]["by_kind"].get(k, 0) + 1
    # TES-E2
    w0 = W.World(M, seed=42)
    events = scenarios.random_events(M, 1000, seed=7)
    base, refusals = W.apply_all(w0, events)
    replay_base_equal = W.replay(w0, base.log, base.seeds).state_hash() == base.state_hash()
    equal = 0
    for k in range(10):
        fk, _ = W.apply_all(W.fork(base, seed=k), scenarios.valid_events(M, 50, seed=100 + k))
        n0 = len(base.log)
        equal += W.replay(W.fork(base, seed=k), fk.log[n0:], fk.seeds[n0:]).state_hash() == fk.state_hash()
    st_ok, rec_ok, _ = W.substitute(base, "MFA-ELM-001", "F1")
    faulty = W.Impl("drops-reads", W.MOCK.initial, lambda e, s, ev, r: s if ev.op == "Read" else W.MOCK.step(e, s, ev, r), W.MOCK.observe)
    st_bad, rec_bad, _ = W.substitute(base, "MFA-ELM-001", "F1", impl=faulty)
    R["tes_e2"] = {"random_events": len(events), "applied": len(base.log), "refused": len(refusals),
                   "invariant_violations_recorded": len(base.violations), "replay_base_equal": bool(replay_base_equal),
                   "forks": 10, "fork_replay_hash_equal": "%d/10" % equal,
                   "substitution": {"MFA-ELM-001 F0->F1 conformant": st_ok, "MFA-ELM-001 F0->F1 non-conformant impl": st_bad},
                   "pass": replay_base_equal and equal == 10 and st_ok == "OK" and st_bad == "FAIL"}
    # OC-E1
    o = oc.run_oc_e1()
    R["oc_e1"] = {"correct_accepted": "%d/%d" % (o["correct_accepted"], o["correct_total"]),
                  "flawed_rejected_with_reason": "%d/%d" % (o["flawed_rejected_with_reason"], o["flawed_total"]),
                  "false_positives": o["false_positives"], "false_negatives": o["false_negatives"],
                  "reasons": sorted({r["expected"] for r in o["results"] if r["expected"] != "OK"}),
                  "pass": o["false_positives"] == 0 and o["false_negatives"] == 0}
    # Omega-E1
    om = omega.run_omega_e1(cycles=10, seed=0, world=W.World(M, seed=11))
    R["omega_e1"] = {k: v for k, v in om.items() if k not in ("records", "omega")}
    R["omega_e1"]["pass"] = (om["complete_records"] == 10 and om["silent_skips"] == 0 and
                             om["handled_before_phase"] == om["interrupts_handled"] == om["interrupts_injected"] and
                             om["priority_order_ok"] and om["world_violations"] == 0)
    # risk
    rm = risk.propagate(M)
    R["risk"] = dict(rm["summary"])
    R["risk"]["capabilities_with_risk"] = "%d/%d" % (sum(1 for c in rm["capabilities"].values() if isinstance(c["risk"], float)), len(M.capabilities))
    R["risk"]["largest_scc"] = max(rec["scc_size"] for rec in rm["elements"].values())
    R["risk"]["pass"] = R["risk"]["capabilities_with_risk"] == "%d/%d" % (len(M.capabilities), len(M.capabilities))
    if risk_out:
        R["risk"]["written"] = risk.write_yaml(rm, risk_out)
    # unit tests
    stream = io.StringIO()
    suite = unittest.TestLoader().discover(str(HERE / "tests"), pattern="test_*.py", top_level_dir=str(HERE / "tests"))
    res = unittest.TextTestRunner(stream=stream, verbosity=0).run(suite)
    R["unittest"] = {"tests": res.testsRun, "failures": len(res.failures), "errors": len(res.errors),
                     "skipped": len(res.skipped), "pass": res.wasSuccessful()}
    from twin import chh
    checks = chh.acceptance_checks()
    R["chh_p"] = {"checks": checks, "passed": sum(1 for v in checks.values() if v), "total": len(checks), "pass": all(checks.values())}
    R["verification_obligations"] = {"MFA-VO-086": ["tes_e1", "tes_e2"], "MFA-VO-082": ["oc_e1"], "MFA-VO-087": ["omega_e1"], "MFA-VO-080/081": ["chh_p"]}
    R["elapsed_s"] = round(time.time() - t0, 2)
    R["overall"] = "PASS" if all(R[k]["pass"] for k in ("tes_e1", "tes_e2", "oc_e1", "omega_e1", "risk", "unittest", "chh_p")) else "FAIL"
    print(yaml.safe_dump(report, sort_keys=False, allow_unicode=True, width=120))
    return 0 if R["overall"] == "PASS" else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
