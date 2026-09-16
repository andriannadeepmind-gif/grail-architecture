// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
//
// GRAIL — Policy. Every adjustable limit lives here and nowhere else (Δ-12ε).
//
// The Constitution holds what is ALWAYS TRUE of the mechanism. This package holds what is
// PERMITTED RIGHT NOW: by whom, with which key, within which envelope. Nothing here may cause a
// telos to fail. A limit that can veto an aim is not a limit, it is a lowered aim — which is how
// the cost ceiling first arrived inside T7 and why it was taken out again.
//
// Written, not machine-checked here.

package GRAIL_Policy {
	private import ScalarValues::*;

	// Α-15. The envelope narrows WHAT IS ATTEMPTED — scope, breadth, how many matters run in
	// parallel. It never lowers the class of proof, and it never turns a met telos into a failed
	// one. Fail-closed: when the budget is exhausted the work stops and says so, rather than
	// continuing with weaker evidence.
	part def <'POL-01'> CostAndTimeEnvelope {
		attribute costCeiling : Real;
		attribute timeCeiling : Real;
		attribute reducesScope : Boolean = true;
		attribute reducesProofClass : Boolean = false;
		attribute canCauseTelosFailure : Boolean = false;
	}

	// Α-12. The system never produces a probability of the outcome of a case. This is a
	// prohibition, not a capability, so it is policy and not telos — and being policy does not
	// make it weak: it is enforced at the mediated point, where the effect would leave.
	part def <'POL-02'> NoOutcomeProbability {
		attribute outcomeProbabilityEverProduced : Boolean = false;
	}

	// Δ-12(β). Policy binds only what the core mediates. Zero ambient authority is the property
	// that makes everything in this package real rather than advisory, and it is stated in T9 as
	// a capability of the mechanism — not here, because it is not adjustable.
	part def <'POL-03'> PolicyDecisionPoint {
		attribute changeTakesEffectWithoutRebuild : Boolean = true;
		attribute changeTakesEffectWithoutRestart : Boolean = true;
	}

	part def Sentinel;
}
