// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
// Platform fidelity test: the construct set measured on SysON v2026.7.0 (2026-09-15), with valid names only.
// Every section ends before the next comment; 'Sentinel' is the last element: if it is missing, the tool truncated.
package GrailFidelityTest {
	private import ScalarValues::*;
	private import RequirementDerivation::*;

	// 1. Requirements, concerns, derivation, dependency
	part def Creator;
	concern def <'CON-01'> Sovereignty {
		doc /* Only the creator approves. */
		stakeholder creator : Creator;
	}
	part def WorldOS {
		attribute size : Integer;
	}
	requirement def <'T2'> PersistentIdentity {
		doc /* Persistent identity and continuity. */
	}
	requirement def <'REQ-KRN-001'> LedgerRecordsEveryTransition {
		doc /* Every state transition is recorded as a signed, content-addressed event. */
		subject sys : WorldOS;
		frame concern sovereignty : Sovereignty;
		require constraint { sys.size >= 0 }
	}
	requirement telosT2 : PersistentIdentity;
	requirement reqKrn001 : LedgerRecordsEveryTransition;
	#derivation connection {
		end #original ::> telosT2;
		end #derive ::> reqKrn001;
	}
	dependency from reqKrn001 to telosT2;

	// 2. Structure and interfaces
	port def LedgerPort {
		in item appendRequest;
		out item receipt;
	}
	interface def <'ICD-01'> LedgerInterface {
		end provider : LedgerPort;
		end consumer : ~LedgerPort;
	}
	part def <'CMP-KRN-01'> LedgerService {
		port ledgerApi : LedgerPort;
	}
	part def <'CMP-KRN-06'> ConstitutionGate {
		port gateApi : ~LedgerPort;
	}

	// 3. Behaviour
	enum def Status {
		enum proposed;
		enum approved;
	}
	item def Claim;
	action def Propose {
		out item claim : Claim;
	}
	action def Check {
		in item claim : Claim;
	}
	part worldOS : WorldOS {
		part ledger : LedgerService;
		part gate : ConstitutionGate;
		interface : LedgerInterface connect ledger.ledgerApi to gate.gateApi;
		action cycle {
			action propose : Propose;
			action check : Check;
			flow propose.claim to check.claim;
		}
		perform cycle.propose;
		attribute status : Status = Status::proposed;
		assert constraint { size >= 0 }
	}
	satisfy reqKrn001 by worldOS;
	allocation def FunctionToComponent;
	allocate worldOS.cycle.check to worldOS.gate;

	// 4. Invariants and verification
	constraint def <'INV-C01'> NonDiminution {
		in before : Integer;
		in current : Integer;
		current >= before
	}
	verification def <'VT-101'> LedgerAppendOnlyCheck {
		subject sys : WorldOS;
		objective {
			verify reqKrn001;
		}
	}

	// 5. Variability and metadata
	abstract part def <'EP-01'> ModelContract;
	variation part def InferenceProvider {
		variant part localProvider;
		variant part remoteProvider;
	}
	metadata def ReviewStatus {
		attribute value : String;
	}
	part def Sentinel;
}
