// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
// GRAIL — Layered Autonomy. The creator's approval stops being a serial bottleneck without ever
// ceasing to be sovereign. Written, not machine-checked here.

package GRAIL_Autonomy {
	private import ScalarValues::*;
	private import GRAIL_Kernel::*;

	enum def AutonomyGrade {
		enum autonomous;          // court-verified contract satisfied; acts at machine speed
		enum courtVerified;       // contract partially satisfied; acts under a narrowed envelope
		enum creatorSignature;    // irreversible, or touching the Root: time freezes
	}

	// The three conditions of the epistemic contract, evaluated BEFORE the act, by an organ that
	// is itself outside every search space (INV-F02).
	part def <'EC-01'> EpistemicContract {
		attribute fullyReversible : Boolean;
		attribute freeEnergy : Real;
		attribute thetaSafe : Real;
		attribute invariantsViolated : Integer;
		attribute touchesRoot : Boolean;
		attribute verdictSignedByCourt : Boolean;
		attribute verdictLatency : Real;              // the whole purpose: milliseconds, not days

		attribute grade : AutonomyGrade;
	}

	// EVALUATED OUTSIDE THE CORE. This is the contract the PDP applies (GRAIL_Policy::PDP-01);
	// it is written here as the shape of the question, not as a gate welded into the kernel. The
	// core's only obligation is AUT-00: it does not act without an answer.
	constraint def <'AUT-01'> AutonomyAdmissible {
		in fullyReversible : Boolean;
		in freeEnergy : Real;
		in thetaSafe : Real;
		in invariantsViolated : Integer;
		in touchesRoot : Boolean;
		in verdictSignedByCourt : Boolean;
		fullyReversible == true
			and freeEnergy < thetaSafe
			and invariantsViolated == 0
			and touchesRoot == false
			and verdictSignedByCourt == true
	}

	// The core's whole rule. Everything else about autonomy is decided outside it.
	constraint def <'AUT-00'> NoActWithoutAnswer {
		in actsTakenWithoutPdpAnswer : Integer;
		actsTakenWithoutPdpAnswer == 0
	}

	// A POLICY DEFAULT, not a kernel rule — the creator may change it. It is set this way because
	// the classifier is conservative BY CONSTRUCTION: an act whose reversibility is not proven is
	// irreversible. Otherwise the fastest path to full autonomy is to leave reversibility unknown,
	// and the contract becomes a formality that always passes.
	constraint def <'AUT-02'> UnprovenReversibilityIsIrreversible {
		in reversibilityProven : Boolean;
		in classifiedAs : Reversibility;
		reversibilityProven == true or classifiedAs == Reversibility::irreversible
	}

	// Rollback must be READY before the act, not merely possible after it. "Reversible" with no
	// pre-staged inverse is a promise, and a promise executes nothing.
	constraint def <'AUT-03'> InverseStagedBeforeAct {
		in inversePreStaged : Boolean;
		in classifiedAs : Reversibility;
		inversePreStaged == true or classifiedAs == Reversibility::irreversible
	}

	// A hot swap in the real world is an act like any other: it passes the same contract, and its
	// inverse is the previous organ, kept executable (T8 keeps the ancestor runnable).
	part def <'HOT-SWAP'> HotSwapAct {
		attribute previousOrganExecutable : Boolean = true;
		attribute differentialReportPassed : Boolean;
		attribute nonDiminutionCertified : Boolean;   // INV-C01 over the Competence lattice

		assert constraint { previousOrganExecutable == true }
	}

	// The irreversible path. Time freezes: nothing in the affected scope advances while the
	// signature is outstanding, so that waiting cannot be exploited as a state change.
	part def <'FREEZE'> TimeFreeze {
		attribute scopeFrozen : Boolean = true;
		attribute externalEffectsSuspended : Boolean = true;
		attribute creatorSignatureRequired : Boolean = true;
		attribute freezeIsAuditable : Boolean = true;

		assert constraint { externalEffectsSuspended == true }
	}

	// A-14: the creator's approval is never reward, never fitness. Layered autonomy serves this
	// directly — fewer acts of approval, grouped and escalated, instead of one per change.
	constraint def <'AUT-04'> ApprovalIsNotASignal {
		in approvalUsedAsRewardOrFitness : Boolean;
		approvalUsedAsRewardOrFitness == false
	}

	// The grant is POLICY: thetaSafe, the grades and the scope are set from outside and change
	// without rebuild or restart (Δ-12). The mediation that makes them binding is mechanism.
	part def <'POL-04'> AutonomyGrant {
		attribute thetaSafe : Real;
		attribute maximumAutonomousGrade : AutonomyGrade;
		attribute adjustableWithoutRebuild : Boolean = true;
		attribute revocableInstantly : Boolean = true;

		assert constraint { adjustableWithoutRebuild == true }
		assert constraint { revocableInstantly == true }
	}

	part def Sentinel;
}
