// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
// GRAIL — Instruments. Every telos measurement is bound to the organ that produces it and the
// interface that carries it. Without this file the Telos compares names to names.
// Written, not machine-checked here.

package GRAIL_Instruments {
	private import ScalarValues::*;
	private import GRAIL_Telos::*;
	private import GRAIL_Kernel::*;

	// The harness is protected by INV-F02 with the same supply chain as the core: every recorded
	// reward-hacking incident struck the harness, not the policy.
	part def <'CMP-OPS-03'> EvaluationHarness {
		attribute underSameSupplyChainAsCore : Boolean = true;
		attribute insideAnySearchSpace : Boolean = false;
		attribute marginsPreRegistered : Boolean;
		attribute alphaAndPowerFixedBeforeRun : Boolean;
	}

	part def <'CMP-COG-06'> CausalEngine {
		attribute causalScore : Real;
		attribute counterfactualScore : Real;
		attribute irrelevantVariableFlipRate : Real;   // the direction that detects an echo
	}

	part def <'CMP-COG-04'> VerificationSuite {
		attribute judgmentUnderConflictScore : Real;
	}

	part def <'CMP-AEO-05'> ContinuityVerifier {
		attribute componentsPreserved : Integer;       // crypto, mnemonic, characterological
		attribute sharesCodeWithMeasuredMechanism : Boolean = false;
	}

	part def <'CMP-CCP-02'> ClaimAndArgumentGraph {
		attribute collectiveGain : Real;
		attribute bestIndividualResult : Real;
	}

	part def <'CMP-FRG-05'> ConformanceLab {
		attribute kindsGeneratedAutonomously : Integer;
		attribute artifactUsedByAnotherOrgan : Boolean;
	}

	part def <'CMP-KNW-01'> ProvenanceStore {
		attribute answersWithoutProvenance : Integer;
		attribute artifactsWithoutProvenance : Integer;
	}

	part def <'CMP-LAW-08'> CitationAuthority {
		attribute citationLimbsPassed : Integer;       // five limbs; four and five from day one
		attribute supportVerifierValidated : Boolean;
	}

	part def <'CMP-AEO-06'> ReplacementOrchestrator {
		attribute successorCompiledAndVerified : Boolean;
		attribute ancestorRemainsExecutable : Boolean;
		attribute identityVerdictParts : Integer = 3;
	}

	part def <'CMP-KRN-11-AUDIT'> EffectPathAudit {
		attribute unmediatedEffectPaths : Integer;
		attribute pathsEnumeratedStatically : Boolean = true;
	}

	// ------------------------------------------------- bind measurement to organ

	allocation def MeasuredBy;

	part def InstrumentedGrail {
		part sys : Grail;
		part harness    : EvaluationHarness;
		part causal     : CausalEngine;
		part verifiers  : VerificationSuite;
		part continuity : ContinuityVerifier;
		part commons    : ClaimAndArgumentGraph;
		part forge      : ConformanceLab;
		part provenance : ProvenanceStore;
		part citations  : CitationAuthority;
		part successor  : ReplacementOrchestrator;
		part effectAudit : EffectPathAudit;

		// A measurement with no producer is not a measurement.
		assert constraint { harness.insideAnySearchSpace == false }
		assert constraint { harness.underSameSupplyChainAsCore == true }
		assert constraint { continuity.sharesCodeWithMeasuredMechanism == false }
		assert constraint { effectAudit.pathsEnumeratedStatically == true }
	}

	allocate InstrumentedGrail.causal to InstrumentedGrail.sys;
	allocate InstrumentedGrail.continuity to InstrumentedGrail.sys;
	allocate InstrumentedGrail.commons to InstrumentedGrail.sys;
	allocate InstrumentedGrail.forge to InstrumentedGrail.sys;
	allocate InstrumentedGrail.provenance to InstrumentedGrail.sys;
	allocate InstrumentedGrail.citations to InstrumentedGrail.sys;
	allocate InstrumentedGrail.successor to InstrumentedGrail.sys;
	allocate InstrumentedGrail.effectAudit to InstrumentedGrail.sys;

	// ------------------------------------------------------- verification cases

	verification def <'VT-T1'> UnderstandingMeasured { subject sys : Grail; objective { verify telosT1; } }
	verification def <'VT-T2'> ContinuityMeasured    { subject sys : Grail; objective { verify telosT2; } }
	verification def <'VT-T3'> CollectiveMeasured    { subject sys : Grail; objective { verify telosT3; } }
	verification def <'VT-T4'> GenerativityMeasured  { subject sys : Grail; objective { verify telosT4; } }
	verification def <'VT-T5'> EvolutionMeasured     { subject sys : Grail; objective { verify telosT5; } }
	verification def <'VT-T6'> TruthMeasured         { subject sys : Grail; objective { verify telosT6; } }
	verification def <'VT-T7'> LegalMeasured         { subject sys : Grail; objective { verify telosT7; } }
	verification def <'VT-T8'> AbsorptionMeasured    { subject sys : Grail; objective { verify telosT8; } }
	verification def <'VT-T9'> GovernanceMeasured    { subject sys : Grail; objective { verify telosT9; } }

	// --------------------------------------------------------------- ID-REQUESTS

	// Rule 1 of spine-vocab: never invent an ID. Two organs the material requires have no ID in
	// the 76, and are requested rather than created:
	//
	//   ID-REQUEST 1 — Claim Admission Gate. T6 needs a gate on what the system ACCEPTS, not only
	//   on what it says. Source: right-solution-p in omega-core, which refuses a solution without
	//   :falsification-conditions; and the minimum overturning witness of AEO Apex. The 76 have no
	//   seat for it: ICD-30 verifies a claim on request, it does not gate admission.
	//
	//   ID-REQUEST 2 — Successor Compiler. T8 as written requires the architecture to compile its
	//   successor, with loss analysis, dual execution and a three-part identity verdict. CMP-AEO-06
	//   replaces an ORGAN under a fixed metamodel; it does not compile a successor metamodel.
	//
	//   ID-REQUEST 3 — Distinctness Instrument. Δ-0 found that the Continuity Battery measures
	//   continuity WITHIN an entity and cannot measure distinctness BETWEEN entities. T3 needs a
	//   separate organ. None of the 76 provides it.

	part def Sentinel;
}
