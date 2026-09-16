// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
// GRAIL — Contracts. The Organ ABI and the single envelope, with the fields the material carries.
// Written, not machine-checked here.

package GRAIL_Contracts {
	private import ScalarValues::*;
	private import GRAIL_Kernel::*;

	// ---------------------------------------------------- Organ contract (ICD-10)
	// Seventeen fields with a law each, from the provider contract of the material, plus the five
	// the corpus lacked: determinism declared AND tested, effects graded, equivalence against a
	// reference oracle with stated tolerances, resources including energy and a typed timeout,
	// and no-training as the default rather than a negotiated term.

	part def OrganAbiContract {
		attribute identity : String;
		attribute capability : String;
		attribute semantics : String;              // law: no untyped success
		attribute inputSchema : String;            // one seat of schemas: LinkML -> JSON Schema
		attribute outputSchema : String;
		attribute failureModes : String;           // law: fail closed, zero silent fallback
		attribute determinismClass : Determinism;  // law: declared AND measured, not asserted
		attribute determinismTested : Boolean;
		attribute effectGrade : Effect;            // law: approval per grade, never one switch
		attribute reversibilityClass : Reversibility;
		attribute equivalenceOracle : String;      // law: a reference oracle with stated tolerance
		attribute equivalenceTolerance : Real;
		attribute energyBudget : Real;             // law: cost is a declared field, not an afterthought
		attribute timeoutTyped : Boolean;
		attribute noTrainingByDefault : Boolean = true;
		attribute confidentialityDomain : String;
		attribute provenanceRequired : Boolean = true;

		assert constraint { determinismTested == true }
		assert constraint { noTrainingByDefault == true }
		assert constraint { provenanceRequired == true }
		assert constraint { timeoutTyped == true }
	}

	// An organ is admitted only against a contract that passed conformance. No organ without one.
	constraint def <'INV-O02'> SwapAdmissibility {
		in contractPresent : Boolean;
		in conformancePassed : Boolean;
		in equivalenceWithinTolerance : Boolean;
		contractPresent == true and conformancePassed == true and equivalenceWithinTolerance == true
	}

	// ------------------------------------------------- The one envelope (ICD-29 / CPEI)
	// One seat. The material's Cognitive Object v2 and proof-carrying object are FACETS of this,
	// never a second envelope: support, attack and counterexample live INSIDE the act, and absence
	// is typed rather than left as an empty field to be read as "does not exist".

	enum def Absence {
		enum notApplicable;
		enum unknown;
		enum notObserved;          // the one the corpus lacked: a research gap, not a denial
		enum notYetDerived;
		enum contested;
		enum withheldByAuthority;
	}

	enum def TrustState {
		enum observed;
		enum proposed;
		enum verified;
		enum committed;
		enum adjudicated;
		enum established;
		enum refuted;
		enum quarantined;
	}

	part def InstitutionalAct {
		attribute claim : String;
		attribute sourceSet : String;
		attribute temporalFrame : BitemporalCut;   // five times, two histories
		attribute method : String;
		attribute assumptions : String;
		attribute uncertainty : Real;
		attribute support : String;
		attribute attack : String;                 // the duty of rebuttal travels with the act
		attribute counterexampleSet : String;
		attribute minimumOverturningWitness : String;
		attribute proofOrCheckReceipt : String;
		attribute authorityCeiling : String;
		attribute authorityCeilingMonotone : Boolean = true;  // without this the field is decoration
		attribute falsificationConditions : String;           // T6: the admission gate
		attribute provenance : Provenance;
		attribute trust : TrustState;
		attribute absenceReason : Absence;
		attribute causalFacet : String;

		assert constraint { authorityCeilingMonotone == true }
	}

	// A single total order would let "authentic source but out of date" collapse into one number.
	// Ten axes, never compressed.
	part def StatusVector {
		attribute sourceIntegrity : Real;
		attribute evidentiarySupport : Real;
		attribute formalValidity : Real;
		attribute temporalApplicability : Real;
		attribute interpretiveStatus : Real;
		attribute causalSupport : Real;
		attribute strategicValue : Real;
		attribute executionStatus : Real;
		attribute freshness : Real;
		attribute authorization : Real;
		attribute compressedToScalar : Boolean = false;

		assert constraint { compressedToScalar == false }
	}

	constraint def OneEnvelope {
		in envelopeKinds : Integer;
		envelopeKinds == 1
	}

	// T6 as a gate rather than a wish: nothing is admitted without its falsifier.
	constraint def AdmissionRequiresFalsifier {
		in admittedWithoutFalsificationConditions : Integer;
		admittedWithoutFalsificationConditions == 0
	}

	// Meta-level confinement, from the creator's own +META-LEVEL-RULES+: default deny, no skipping
	// a level, a declared reason to ascend. gap/EVO.md asked for exactly this and called it absent.
	part def ReflectiveTower {
		attribute defaultDeny : Boolean = true;
		attribute skippingAllowed : Boolean = false;
		attribute ascentRequiresDeclaredReason : Boolean = true;
		attribute topLevelReadableFromAnyLevel : Boolean = true;
		attribute topLevelWritableFromAnyLevel : Boolean = false;

		assert constraint { defaultDeny == true }
		assert constraint { skippingAllowed == false }
		assert constraint { topLevelWritableFromAnyLevel == false }
	}

	part def Sentinel;
}
