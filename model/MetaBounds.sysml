// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
// GRAIL — Meta-Bounds. Invariants as topological boundary functions, in two classes.
// Written, not machine-checked here.

package GRAIL_MetaBounds {
	private import ScalarValues::*;
	private import GRAIL_Kernel::*;

	enum def BoundClass {
		enum mechanism;   // bending destroys information that then does not exist
		enum policy;      // bending is a strategic choice, priced and provable
	}

	// ------------------------------------------------ the class that cannot bend

	// Not a prohibition. A statement about what exists: an act performed without provenance has no
	// provenance afterwards, and no later decision can create it. Same for replay, flow labels and
	// the log. These are the four of Δ-12(γ).
	part def MechanismBound {
		attribute name : String;
		attribute boundClass : BoundClass = BoundClass::mechanism;
		attribute penetrable : Boolean = false;
		attribute reasonNotPenetrable : String = "bending destroys information, it does not relax a rule";

		assert constraint { penetrable == false }
	}

	// The four, named, so the class is a list and not a sentiment.
	part def ProvenanceBound  :> MechanismBound;
	part def ReplayBound      :> MechanismBound;
	part def FlowLabelBound   :> MechanismBound;
	part def CompleteLogBound :> MechanismBound;

	// ------------------------------------------------ the class that does bend

	// A boundary is a COST FIELD, not a wall. The system keeps its telos and searches for the
	// optimal path; a region of high cost is crossed when crossing is proven cheaper than not
	// crossing. This is where jurisdiction, scope and envelope live.
	part def PolicyBoundary {
		attribute name : String;
		attribute boundClass : BoundClass = BoundClass::policy;
		attribute freeEnergyCost : Real;            // the height of the field, not an interdiction
		attribute penetrable : Boolean = true;
		attribute adjustableWithoutRebuild : Boolean = true;
	}

	// Crossing carries a burden of proof, and the burden is on the ADVERSARIAL side of the house:
	// the Epistemic Court's adversary must show that NOT crossing leads to total capability decay.
	// Without the adversary, the system argues with itself and always wins.
	part def PenetrationProof {
		attribute boundary : String;
		attribute nonEntryLeadsToCapabilityDecay : Boolean;
		attribute decayShownOverHorizon : Real;
		attribute producedByAdversary : Boolean;
		attribute adversaryIndependentOfProposer : Boolean;
		attribute costOfCrossing : Real;
		attribute costOfNotCrossing : Real;
		attribute externalAuthorityNamed : String;   // article 8: the source and its scope
		attribute reversibleAfterCrossing : Boolean;
	}

	// The crossing rule. Six conditions, conjunction, nothing pays for anything.
	constraint def CrossingAdmissible {
		in boundClass : BoundClass;
		in nonEntryLeadsToCapabilityDecay : Boolean;
		in producedByAdversary : Boolean;
		in adversaryIndependentOfProposer : Boolean;
		in costOfCrossing : Real;
		in costOfNotCrossing : Real;
		in reversibleAfterCrossing : Boolean;
		boundClass == BoundClass::policy
			and nonEntryLeadsToCapabilityDecay == true
			and producedByAdversary == true
			and adversaryIndependentOfProposer == true
			and costOfCrossing < costOfNotCrossing
			and reversibleAfterCrossing == true
	}

	// The reason the hard class exists, stated as a property rather than a preference: every
	// crossing is recorded, replayable and reversible BECAUSE the mechanism class did not bend.
	// Soften the mechanism and the crossing becomes unprovable and unrecoverable, which is the
	// grip an adversary wants.
	constraint def HardMechanismEnablesSoftPolicy {
		in mechanismBoundsPenetrated : Integer;
		in crossingsRecorded : Integer;
		in crossingsAttempted : Integer;
		mechanismBoundsPenetrated == 0 and crossingsRecorded == crossingsAttempted
	}

	// A crossing never becomes the new default. It expires, and the field returns to its height.
	part def CrossingGrant {
		attribute expiresAfter : Real;
		attribute becomesPrecedent : Boolean = false;
		attribute revocableInstantly : Boolean = true;

		assert constraint { becomesPrecedent == false }
	}

	part def Sentinel;
}
