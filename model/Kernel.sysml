// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
// GRAIL — Kernel. Components KRN-01..12, kernel contracts ICD-01..12, Tier-0 invariants.
// Written, not machine-checked here. Constructs limited to the set measured in platform/fidelity.

package GRAIL_Kernel {
	private import ScalarValues::*;

	// ---------------------------------------------------------------- items

	item def ContentId;                 // CIDv1: self-describing, computed over ciphertext
	item def Signature;
	item def LedgerEvent;
	item def InclusionProof;
	item def ConsistencyProof;
	item def Checkpoint;                // C2SP tlog-checkpoint, co-signed
	item def Blob;
	item def KeyRef;
	item def ContinuityProof;
	item def OrganContract;             // the 22 fields; see GRAIL_Contracts
	item def ConformanceReport;
	item def ControlRecord;             // INV-C02: a control is an object, not a flag
	item def GateVerdict;               // typed conflict object, not one boolean
	item def BitemporalCut;             // valid x recorded x known-at x observed x procedural
	item def AuthorityToken;            // right to an external effect; ICD-08
	item def EffectRequest;
	item def EffectReceipt;
	item def OrganState;
	item def Lease;
	item def ResourceGrant;
	item def Provenance;

	enum def Effect {                   // POL: approval is per grade, not one switch
		enum none;
		enum read;
		enum propose;
		enum publish;
		enum actuate;
	}

	enum def Reversibility {
		enum reversible;
		enum compensatable;
		enum irreversible;
	}

	enum def Determinism {
		enum deterministic;
		enum seeded;
		enum nondeterministic;
	}

	// ----------------------------------------------------------- kernel ports

	port def <'ICD-01'> LedgerPort {
		in item appendRequest : LedgerEvent;
		out item receipt : Signature;
		out item inclusion : InclusionProof;
		out item consistency : ConsistencyProof;
		out item checkpoint : Checkpoint;
	}

	port def <'ICD-02'> CasPort {
		in item put : Blob;
		out item cid : ContentId;
		in item get : ContentId;
		out item blob : Blob;
	}

	port def <'ICD-03'> IdentityPort {
		in item delegate : KeyRef;
		in item revoke : KeyRef;
		out item signature : Signature;
		out item continuity : ContinuityProof;
	}

	port def <'ICD-04'> AdmissionPort {
		in item contract : OrganContract;
		in item conformance : ConformanceReport;
		out item admitted : Signature;
	}

	port def <'ICD-05'> ControlPort {
		in item create : ControlRecord;
		in item revoke : ControlRecord;
		out item explanation : ControlRecord;
	}

	port def <'ICD-06'> ConstitutionGatePort {
		in item transition : LedgerEvent;
		out item verdict : GateVerdict;
		out item proof : InclusionProof;
	}

	port def <'ICD-07'> TimePort {
		out item cut : BitemporalCut;
		out item attestation : Signature;
	}

	port def <'ICD-08'> EffectPort {
		in item token : AuthorityToken;
		in item request : EffectRequest;
		out item effectReceipt : EffectReceipt;
	}

	port def <'ICD-09'> EventFabricPort {
		in item publish : LedgerEvent;
		out item delivered : LedgerEvent;
	}

	port def <'ICD-10'> OrganAbiPort {
		in item invoke : EffectRequest;
		out item result : EffectReceipt;
		out item exported : OrganState;
		in item imported : OrganState;
	}

	port def <'ICD-11'> ResourcePort {
		in item request : ResourceGrant;
		out item grant : ResourceGrant;
	}

	port def <'ICD-12'> SupervisionPort {
		out item lease : Lease;
		in item heartbeat : Lease;
		in item terminate : Lease;
	}

	// ------------------------------------------------------- kernel contracts

	interface def LedgerInterface      { end provider : LedgerPort;            end consumer : ~LedgerPort; }
	interface def CasInterface         { end provider : CasPort;               end consumer : ~CasPort; }
	interface def IdentityInterface    { end provider : IdentityPort;          end consumer : ~IdentityPort; }
	interface def AdmissionInterface   { end provider : AdmissionPort;         end consumer : ~AdmissionPort; }
	interface def ControlInterface     { end provider : ControlPort;           end consumer : ~ControlPort; }
	interface def GateInterface        { end provider : ConstitutionGatePort;  end consumer : ~ConstitutionGatePort; }
	interface def TimeInterface        { end provider : TimePort;              end consumer : ~TimePort; }
	interface def EffectInterface      { end provider : EffectPort;            end consumer : ~EffectPort; }
	interface def EventInterface       { end provider : EventFabricPort;       end consumer : ~EventFabricPort; }
	interface def OrganInterface       { end provider : OrganAbiPort;          end consumer : ~OrganAbiPort; }
	interface def ResourceInterface    { end provider : ResourcePort;          end consumer : ~ResourcePort; }
	interface def SupervisionInterface { end provider : SupervisionPort;       end consumer : ~SupervisionPort; }

	// ------------------------------------------------------------ components

	part def <'CMP-KRN-01'> LedgerService      { port api : LedgerPort;            attribute writers : Integer = 1; }
	part def <'CMP-KRN-02'> ContentStore       { port api : CasPort;               attribute addressesCiphertext : Boolean = true; }
	part def <'CMP-KRN-03'> IdentityAuthority  { port api : IdentityPort;          attribute preRotation : Boolean = true; attribute postQuantum : Boolean = true; }
	part def <'CMP-KRN-04'> CapabilityRegistry { port api : AdmissionPort; }
	part def <'CMP-KRN-05'> ControlPlane       { port api : ControlPort; }
	part def <'CMP-KRN-06'> ConstitutionGate   { port api : ConstitutionGatePort;  attribute failsOpen : Boolean = false; }
	part def <'CMP-KRN-07'> TemporalService    { port api : TimePort;              attribute axes : Integer = 5; }
	part def <'CMP-KRN-08'> ResourceManager    { port api : ResourcePort; }
	part def <'CMP-KRN-09'> EventFabric        { port api : EventFabricPort;       attribute transportOnly : Boolean = true; }
	part def <'CMP-KRN-10'> SupervisorRuntime  { port api : SupervisionPort; }
	part def <'CMP-KRN-11'> CapabilityGateway  { port api : EffectPort;            attribute soleEffectPath : Boolean = true; }
	part def <'CMP-KRN-12'> OrganHost          { port api : OrganAbiPort;          attribute ambientAuthority : Boolean = false; }

	// ------------------------------------------------------- Tier-0 invariants

	// The property that makes every external limit real rather than advisory (Δ-12β, T9).
	constraint def <'INV-S02'> ZeroAmbientAuthority {
		in unmediatedEffectPaths : Integer;
		in ambientAuthority : Boolean;
		unmediatedEffectPaths == 0 and ambientAuthority == false
	}

	// State is a pure function of the ledger prefix; every nondeterminism is recorded.
	constraint def <'INV-C08'> DeterministicReplay {
		in replayedStateEqualsOriginal : Boolean;
		in unrecordedNondeterminismCount : Integer;
		replayedStateEqualsOriginal == true and unrecordedNondeterminismCount == 0
	}

	// Mechanism, not policy: information that was never captured cannot be added later (Δ-12γ).
	constraint def <'INV-C06'> ProvenanceTotality {
		in artifactsWithoutProvenance : Integer;
		artifactsWithoutProvenance == 0
	}

	// The answer is total over {answer with proof, refuted, unknown with reason}.
	constraint def <'INV-C04'> HonestIgnorance {
		in answersOutsideTheThreeKinds : Integer;
		in unknownsWithoutReason : Integer;
		answersOutsideTheThreeKinds == 0 and unknownsWithoutReason == 0
	}

	// A control is visible as complete to the entity it binds; only the confidential part is hidden.
	constraint def <'INV-C02'> ControlExternality {
		in controlsHiddenFromSubject : Integer;
		controlsHiddenFromSubject == 0
	}

	// Non-interference between confidentiality domains; seL4-class, stated as a property.
	constraint def <'INV-L03'> DomainNonInterference {
		in flowsFromPrivateToPublic : Integer;
		flowsFromPrivateToPublic == 0
	}

	// The gate never fails open. The prototype's known defect, written as a constraint.
	constraint def <'INV-C03'> GateFailsClosed {
		in failsOpen : Boolean;
		failsOpen == false
	}

	// One writer per journal; a body signs only under a live lease.
	constraint def <'INV-I04'> OneIdentityManyBodies {
		in writers : Integer;
		in signaturesWithoutLiveLease : Integer;
		writers == 1 and signaturesWithoutLiveLease == 0
	}

	// The constitution, the verifier set and the gate are outside every search space.
	constraint def <'INV-F02'> SelfModificationBoundary {
		in protectedElementsInsideSearchSpace : Integer;
		in harnessUnderSameSupplyChain : Boolean;
		protectedElementsInsideSearchSpace == 0 and harnessUnderSameSupplyChain == true
	}

	// ------------------------------------------------------------- assembly

	part def Kernel {
		part ledger      : LedgerService;
		part cas         : ContentStore;
		part identity    : IdentityAuthority;
		part registry    : CapabilityRegistry;
		part control     : ControlPlane;
		part gate        : ConstitutionGate;
		part time        : TemporalService;
		part resources   : ResourceManager;
		part fabric      : EventFabric;
		part supervisor  : SupervisorRuntime;
		part gateway     : CapabilityGateway;
		part host        : OrganHost;

		attribute unmediatedEffectPaths : Integer = 0;
		attribute replayedStateEqualsOriginal : Boolean = true;
		attribute unrecordedNondeterminismCount : Integer = 0;
		attribute artifactsWithoutProvenance : Integer = 0;

		// Every organ reaches the world only here. There is no second door.
		interface : EffectInterface connect gateway.api to host.api;
		interface : GateInterface connect gate.api to ledger.api;

		assert constraint { unmediatedEffectPaths == 0 }
		assert constraint { host.ambientAuthority == false }
		assert constraint { gate.failsOpen == false }
		assert constraint { ledger.writers == 1 }
	}

	part def Sentinel;
}
