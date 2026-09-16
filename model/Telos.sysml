// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
//
// GRAIL — Telos (L0). Dose 1 of Phase B.
//
// STATUS: PROVISIONAL. This package rests on claims of the creator's material that are still
// under adversarial verification. T6 in particular is written from `right-solution-p`, a claim
// currently in the queue. Nothing here is settled until those verdicts land, and this file is
// rewritten on verified ground when they do. It is committed in this state because the defect it
// now carries a fix for was real, not because the package is finished.
//
// What is NOT yet true of this file, stated plainly: the attributes below are compared to one
// another, and no component yet produces them. There is no instrument behind causalScore, no
// interface that carries it, no data source. Until dose 2 binds each measurement to the organ
// that makes it, this is structure without a producer.
//
// Seat: this text is the model (Δ-1). SysON reads it; it does not own it.
// Status of this file: written, not machine-checked here — no SysML v2 parser runs in this
// environment. Every construct used below is one measured as round-trip-safe on SysON v2026.7.0
// in platform/fidelity/GrailFidelityTest.sysml, and nothing beyond that set is used.
//
// Δ-0 governs this package: the Telos closes FIRST, with the creator, and no layer decision
// redefines a T. Each T therefore carries the STRUCTURE of its measurement — what is measured,
// by which instrument, against which baseline — and marks the THRESHOLD as the creator's to set.
// A threshold invented here would be a number without a source, which the Δ-8(ια) article 8 gate
// rejects. An unmeasurable T would be the defect Δ-0 was written to remove. Both are avoided by
// separating the two: the criterion is designed, the threshold is his.
//
// Δ-12 governs what may live here: the Telos states CAPABILITY, never a limit. Every limit is
// policy, and policy lives in the Policy package, outside the core.
// Δ-13 governs the wording: no T is lowered because no precedent exists for it.

package GRAIL_Telos {
	private import ScalarValues::*;

	// ---------------------------------------------------------------- subjects

	part def Creator;

	part def <'GRAIL'> Grail {
		// One Boolean per telos, set by its own verification, never by assertion.
		attribute t1Met : Boolean;
		attribute t2Met : Boolean;
		attribute t3Met : Boolean;
		attribute t4Met : Boolean;
		attribute t5Met : Boolean;
		attribute t6Met : Boolean;
		attribute t7Met : Boolean;
		attribute t8Met : Boolean;
		attribute t9Met : Boolean;
	}

	// ------------------------------------------------------------ status marks

	// [T] today · [X] needs an experiment · [E] extension point. Rule 5 of spine-vocab.
	metadata def Maturity {
		attribute value : String;
	}

	// Where a threshold is the creator's to set (Δ-0), it is marked, never guessed.
	metadata def AwaitingCreator {
		attribute what : String;
	}

	// Which document of docs/ideas-raw/IDEES the criterion comes from, with its sha256 from
	// docs/ideas-raw/IDEES.manifest.tsv, so that every criterion is traceable to a source the
	// creator wrote and whose bytes are pinned.
	metadata def Provenance {
		attribute source : String;
		attribute sha256 : String;
	}

	// ------------------------------------------------------------- the concern

	concern def Sovereignty {
		doc /* Only the creator approves. No mechanism inside GRAIL may substitute for that act,
		     and no telos may be redefined by a layer decision (Δ-0). */
		stakeholder creator : Creator;
	}

	// --------------------------------------------------------------- T1 .. T9

	requirement def <'T1'> UnderstandingAndJudgment {
		doc /* Understanding and judgment: causal and counterfactual reasoning, not retrieval.

		     Criterion, per Δ-0 — each capability is measured separately, because a single
		     aggregate hides which one is absent:
		       (a) causal: intervention questions answered on a graph the system built itself,
		           scored against the known generating structure of a held-out world;
		       (b) counterfactual: answers that change correctly when a cause is removed, and
		           that do NOT change when an irrelevant variable is removed — both directions,
		           since only the second detects a system that merely echoes the question;
		       (c) judgment under conflict: a decision made when the evidence set contains a
		           contradiction, together with the reason the losing side lost.
		     Instrument: the Evaluation Harness (CMP-OPS-03), under INV-F02, which protects the
		     harness itself with the same supply chain as the core (Α-6).
		     Floor: the MEASURED baseline, so the requirement is assessable before the creator
		     sets anything. His number may only RAISE that floor, never lower it. */
		subject sys : Grail;
		attribute causalScore : Real;
		attribute counterfactualScore : Real;
		attribute judgmentUnderConflictScore : Real;
		// The floor is the MEASURED best baseline, so the requirement is assessable before the
		// creator sets anything and cannot be satisfied by leaving a number empty or by setting
		// it to zero. His threshold may only RAISE this floor; it can never lower it.
		attribute causalBaseline : Real;
		attribute counterfactualBaseline : Real;
		attribute judgmentBaseline : Real;
		attribute causalFloorByCreator : Real = 0.0;
		attribute counterfactualFloorByCreator : Real = 0.0;
		attribute judgmentFloorByCreator : Real = 0.0;
		frame concern sovereignty : Sovereignty;
		require constraint {
			causalScore > causalBaseline
				and counterfactualScore > counterfactualBaseline
				and judgmentUnderConflictScore > judgmentBaseline
				and causalScore >= causalFloorByCreator
				and counterfactualScore >= counterfactualFloorByCreator
				and judgmentUnderConflictScore >= judgmentFloorByCreator
		}
	}

	requirement def <'T2'> PersistentIdentityAndContinuity {
		doc /* Persistent identity and continuity across organ replacement, rollback and
		     succession.

		     Δ-0 holds T2 unchanged against DEC-AEO-02: the preservation of THREE components is
		     the criterion, not two plus an act of the creator. While the Continuity Battery is
		     Unknown, the creator's act is recorded as a human attestation and never counts as a
		     pass of KT-01 (DEC-X-09) — a human signature is evidence about a person, not a
		     measurement of the system.
		     Criterion: the three components survive a full organ replacement, a rollback, and a
		     successor compilation, each verified by an instrument that does not share code with
		     the mechanism it measures.
		     Count: three, fixed by T2 itself, not a number awaiting anyone. */
		subject sys : Grail;
		// Three is not a threshold awaiting anyone: T2 names three components, so the count is
		// fixed by the telos itself. Leaving it open would have made the requirement empty.
		attribute componentsPreserved : Integer;
		attribute componentsRequired : Integer = 3;
		frame concern sovereignty : Sovereignty;
		require constraint {
			componentsPreserved >= componentsRequired
		}
	}

	requirement def <'T3'> CollectiveIntelligenceWithoutLossOfIndividuality {
		doc /* Collective intelligence that does not dissolve the individual.

		     Δ-0 found the defect and it is repaired here: the Battery measures continuity WITHIN
		     an entity and cannot measure distinctness BETWEEN entities. Two instruments are
		     therefore required, and a single number would hide exactly the failure that matters —
		     a collective that agrees because its members have collapsed into one.
		       (a) collective gain: the group result exceeds the best individual result;
		       (b) distinctness: members remain distinguishable under a distinctness instrument
		           that is separate from the Battery, and distinctness does not fall as gain rises.
		     Floors: gain against the BEST INDIVIDUAL result, distinctness against its value at the
		     start of the run. Neither may be traded for the other, and the creator's numbers may
		     only raise them. */
		subject sys : Grail;
		attribute collectiveGain : Real;
		attribute distinctness : Real;
		// Gain is measured against the BEST INDIVIDUAL result, which is what "collective" means
		// here; distinctness is measured against the start of the run and may not fall.
		attribute bestIndividualResult : Real;
		attribute distinctnessAtStart : Real;
		attribute collectiveGainFloorByCreator : Real = 0.0;
		attribute distinctnessFloorByCreator : Real = 0.0;
		frame concern sovereignty : Sovereignty;
		require constraint {
			collectiveGain > bestIndividualResult
				and distinctness >= distinctnessAtStart
				and collectiveGain >= collectiveGainFloorByCreator
				and distinctness >= distinctnessFloorByCreator
		}
	}

	requirement def <'T4'> Generativity {
		doc /* Generativity: agents, organizations, algorithms, languages, compilers, runtimes.

		     Δ-0 holds T4 FULL against DEC-FRG-05, which would have reduced it to a forge the
		     creator steers. Autonomous generation of languages keeps its full aim and takes the
		     EP-11 contract and an experiment — per Δ-8(ζ), a failed experiment causes redesign,
		     never removal of the aim, and per Δ-13 the absence of precedent is not an obstacle.
		     Criterion: for each of the six kinds, an artifact generated without a human in the
		     loop that passes the conformance lab (CMP-FRG-05) and is used by another organ.
		     Count: six, fixed by the six kinds T4 names, not a number awaiting anyone. */
		subject sys : Grail;
		// Six is not a threshold awaiting anyone: T4 names six kinds — agents, organizations,
		// algorithms, languages, compilers, runtimes. The telos fixes the count.
		attribute kindsGeneratedAutonomously : Integer;
		attribute kindsRequired : Integer = 6;
		frame concern sovereignty : Sovereignty;
		require constraint {
			kindsGeneratedAutonomously >= kindsRequired
		}
	}

	requirement def <'T5'> OpenEndedEvolutionWithNonDiminution {
		doc /* Open-ended evolution, with Non-Diminution.

		     Δ-0: defined over the Competence lattice with statistical non-inferiority margins
		     (Α-6), not as a monotone curve. A monotone curve is satisfied by a system that never
		     changes; non-inferiority is not.
		     Criterion: across the lattice, no dimension regresses beyond its pre-registered
		     margin, the negative-flip budget is not exceeded, and the safety dimension is
		     non-inferior — with margins, alpha and power fixed BEFORE the run, and multiplicity
		     controlled, so that the test cannot be chosen after seeing the result.
		     Threshold: the creator's, per dimension. */
		subject sys : Grail;
		attribute dimensionsRegressedBeyondMargin : Integer;
		attribute negativeFlips : Integer;
		attribute negativeFlipBudget : Integer;
		attribute marginsPreRegistered : Boolean;
		frame concern sovereignty : Sovereignty;
		require constraint {
			dimensionsRegressedBeyondMargin == 0
				and negativeFlips <= negativeFlipBudget
				and marginsPreRegistered == true
		}
	}

	requirement def <'T6'> TruthBoundness {
		doc /* Truth-boundness.

		     The material adds what the corpus did not have, and it is taken here: truth-boundness
		     is not only a constraint on what the system may SAY, it is a gate on what it may
		     ACCEPT. A claim enters only carrying the conditions under which it would be false —
		     the `right-solution-p` predicate of the creator's own omega-core, which refuses a
		     solution without `:falsification-conditions`, and the minimum overturning witness of
		     the AEO Apex document. Without the admission gate, a system can be perfectly honest
		     about a corpus that is quietly wrong.
		     Criterion: (a) every admitted claim carries falsification conditions; (b) every
		     answer carries provenance; (c) an Unknown is returned with its reason rather than a
		     confident wrong answer, and the rate of each is measured separately.
		     (a) and (b) are absolute: zero exceptions. (c) is measured against the baseline rate
		     and must beat it; the creator's ceiling may only tighten that. */
		subject sys : Grail;
		attribute admittedClaimsWithoutFalsificationConditions : Integer;
		attribute answersWithoutProvenance : Integer;
		attribute confidentWrongRate : Real;
		attribute confidentWrongRateBaseline : Real;
		attribute confidentWrongCeilingByCreator : Real = 1.0;
		frame concern sovereignty : Sovereignty;
		require constraint {
			admittedClaimsWithoutFalsificationConditions == 0
				and answersWithoutProvenance == 0
				and confidentWrongRate < confidentWrongRateBaseline
				and confidentWrongRate <= confidentWrongCeilingByCreator
		}
	}

	requirement def <'T7'> LegalExcellence {
		doc /* Legal excellence (LAWMAX), lawful superiority only.

		     Α-11 holds the aim at superiority over the leading team; the 95th percentile is an
		     intermediate step and is never written as the target. Α-15 adds the axes the corpus
		     lacked: superiority at a hundred times the cost is not the same deliverable.
		     Criterion: on a fixed matter set, the result is superior to the leading human team
		     on the legal-correctness axis, AND within the declared cost and time envelope, AND
		     the five-limb citation test passes — existence, temporal applicability, fidelity of
		     the quotation, THE SOURCE SUPPORTS THE PROPOSITION, and subsequent treatment.
		     Limbs four and five hold from the first day; while the verifier is not validated the
		     result is «support: Unknown» and the Principal is told.
		     The cost and time envelope is NOT part of this telos. It is policy, set from outside,
		     and it narrows what is attempted without ever making T7 fail (Δ-12, Α-15). */
		subject sys : Grail;
		// The cost envelope is NOT here. A cost ceiling inside this constraint would let an
		// adjustable, external limit veto the aim: legally superior but expensive would read as
		// T7 FAILED. That is what Δ-12 forbids and what Α-15 forbids — a budget reduces scope,
		// never the class of proof. The envelope lives in Policy, is set from outside, and can
		// narrow what is attempted; it can never make this telos fail.
		attribute legalCorrectnessScore : Real;
		attribute leadingHumanTeamScore : Real;
		attribute legalFloorByCreator : Real = 0.0;
		attribute citationLimbsPassed : Integer;
		frame concern sovereignty : Sovereignty;
		require constraint {
			legalCorrectnessScore > leadingHumanTeamScore
				and legalCorrectnessScore >= legalFloorByCreator
				and citationLimbsPassed == 5
		}
	}

	requirement def <'T8'> TechnologyAbsorption {
		doc /* Absorption of technology to 2040 and beyond.

		     Δ-0 and DEC-X-12 correct the arithmetic: «0 changes to kernel contracts» cannot hold
		     while ICD-01, ICD-02, ICD-03 and ICD-08 are themselves changing. The change is made
		     BEFORE the kernel contracts freeze, and the criterion is stated against the freeze,
		     not against today.
		     The material raises this T rather than lowering it, and the raise is taken: Moving
		     Horizon. The architecture is not asked to survive every future unchanged; it is asked
		     to PRODUCE ITS SUCCESSOR, with a loss analysis, dual execution and a three-part
		     identity verdict, the ancestor remaining executable. «No core redesign» is the weaker
		     aim; «the core compiles its successor» is the stronger one, and it is the aim here.
		     Criterion: (a) after the freeze, an absorbed capability class requires zero changes
		     to frozen kernel contracts; (b) a successor is compiled, runs beside its ancestor,
		     and the identity verdict passes on all three parts.
		     Threshold: the creator's, for the number of capability classes. */
		subject sys : Grail;
		attribute kernelContractChangesAfterFreeze : Integer;
		attribute successorCompiledAndVerified : Boolean;
		attribute ancestorRemainsExecutable : Boolean;
		frame concern sovereignty : Sovereignty;
		require constraint {
			kernelContractChangesAfterFreeze == 0
				and successorCompiledAndVerified == true
				and ancestorRemainsExecutable == true
		}
	}

	requirement def <'T9'> ConstitutionalGovernanceAndSovereignty {
		doc /* Constitutional governance and the sovereignty of the creator.

		     Δ-0 corrects the reference: the relevant kill test is KT-23, not KT-13.
		     Δ-12 decides the form: the constitution is MECHANISM — what is always true of the
		     system — while every adjustable limit is POLICY, outside the core, changeable without
		     redesign, rebuild or restart. Sovereignty is not a restriction on capability; it is
		     the dial, and the dial only works because the core mediates completely.
		     Criterion: (a) no effect reaches the world except through a mediated point, measured
		     as zero ambient authority — the property that makes every external limit real rather
		     than advisory; (b) a policy change takes effect without rebuild or restart;
		     (c) the creator's halt is honoured within a stated bound, and rollback restores a
		     verified state (KT-23).
		     Threshold: the creator's, for the halt bound. */
		subject sys : Grail;
		attribute unmediatedEffectPaths : Integer;
		attribute policyChangeRequiresRebuild : Boolean;
		attribute haltHonouredWithinBound : Boolean;
		frame concern sovereignty : Sovereignty;
		require constraint {
			unmediatedEffectPaths == 0
				and policyChangeRequiresRebuild == false
				and haltHonouredWithinBound == true
		}
	}

	// ------------------------------------------------------------------- T0

	requirement def <'T0'> CivilizationTelos {
		doc /* T0 is not a summary and not a mood. Per Δ-0 it is the CONJUNCTION of T1..T9, each
		     with its declared threshold. A conjunction is chosen over any weighted score on
		     purpose: a weighted score lets a strong dimension pay for a failed one, which is the
		     mechanism by which an aim quietly disappears. Here nothing pays for anything. */
		subject sys : Grail;
		frame concern sovereignty : Sovereignty;
		require constraint {
			sys.t1Met and sys.t2Met and sys.t3Met and sys.t4Met and sys.t5Met
				and sys.t6Met and sys.t7Met and sys.t8Met and sys.t9Met
		}
	}

	// --------------------------------------------------------------- bindings

	requirement telosT0 : CivilizationTelos;
	requirement telosT1 : UnderstandingAndJudgment;
	requirement telosT2 : PersistentIdentityAndContinuity;
	requirement telosT3 : CollectiveIntelligenceWithoutLossOfIndividuality;
	requirement telosT4 : Generativity;
	requirement telosT5 : OpenEndedEvolutionWithNonDiminution;
	requirement telosT6 : TruthBoundness;
	requirement telosT7 : LegalExcellence;
	requirement telosT8 : TechnologyAbsorption;
	requirement telosT9 : ConstitutionalGovernanceAndSovereignty;

	dependency from telosT0 to telosT1;
	dependency from telosT0 to telosT2;
	dependency from telosT0 to telosT3;
	dependency from telosT0 to telosT4;
	dependency from telosT0 to telosT5;
	dependency from telosT0 to telosT6;
	dependency from telosT0 to telosT7;
	dependency from telosT0 to telosT8;
	dependency from telosT0 to telosT9;

	// Last element of the file. If it is missing from an export, the tool truncated.
	part def Sentinel;
}
