# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""tools/twin — F1 executable architectural digital twin of the MFA package.

Implements, as an executable specification (fidelity F1, no production code):
  MFA-MECH-043  Twin Execution Semantics  (model, world, invariants, risk)
  MFA-MECH-039  Obligation Calculus       (oc)
  MFA-MECH-044  Omega-Loop                 (omega)
Verification obligations exercised: MFA-VO-086 (TES-E1/E2), MFA-VO-082 (OC-E1), MFA-VO-087 (Omega-E1).
Import the submodules explicitly: `from twin import model, world, invariants, risk, oc, omega, scenarios`.
"""
__all__ = ["model", "world", "invariants", "risk", "oc", "omega", "scenarios"]
