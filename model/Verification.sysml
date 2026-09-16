// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
//
// GRAIL — Verification. The seat of the rules that govern HOW a telos is scored.
//
// These three were written into the Telos constraints and did not belong there: they are not
// properties of GRAIL, they are rules about the measurement. Keeping them in the Telos put two
// different concepts on one seat. Removing them without a seat would have deleted three guards in
// silence, which article 6 forbids. They live here.
//
// Written, not machine-checked here.

package GRAIL_Verification {
	private import ScalarValues::*;
	private import GRAIL_Telos::*;

	// T2. A signature is evidence about a person, not a measurement of the system. While the
	// Continuity Battery is Unknown, the creator's act is recorded as a human attestation and
	// never counts as a pass of KT-01 (Δ-0, DEC-X-09).
	constraint def HumanAttestationIsNotAPass {
		in humanAttestationCountedAsPass : Boolean;
		humanAttestationCountedAsPass == false
	}

	// T4. Generation the creator steers is not autonomous generation. Without this the telos is
	// satisfied by a forge with a hand on it, which is the reduction Δ-0 refused.
	constraint def SteeredGenerationIsNotAutonomous {
		in steeredByCreatorCountsAsPass : Boolean;
		steeredByCreatorCountsAsPass == false
	}

	// T5. Margins, alpha, power and multiplicity control are fixed BEFORE the run, so that the
	// test cannot be chosen after seeing the result (Α-6).
	constraint def MarginsPreRegistered {
		in marginsPreRegistered : Boolean;
		marginsPreRegistered == true
	}

	part def Sentinel;
}
