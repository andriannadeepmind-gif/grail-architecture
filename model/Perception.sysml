// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
// GRAIL — Perception. The scanner that goes after truth instead of waiting for it.
// Written, not machine-checked here.

package GRAIL_Perception {
	private import ScalarValues::*;
	private import GRAIL_Kernel::*;

	// --------------------------------------------------------------- the unknown

	// Epistemic risk is not a mood. It is the measured extent of what has not been looked at,
	// and the scanner's job is to make it fall before the adversary can trade on it.
	part def <'EPI-RISK'> EpistemicRiskScore {
		attribute unknownRegionCount : Integer;
		attribute unknownRegionsCovered : Integer;
		attribute staleSourceCount : Integer;
		attribute adversaryAdvantageWindow : Real;   // how long they know something we do not
		attribute score : Real;
	}

	// A region of the world the system has not mapped. Named, so that "unknown" is a list rather
	// than a feeling, and so that coverage is countable.
	part def <'UNKNOWN-REGION'> UnknownRegion {
		attribute name : String;
		attribute expectedInformationGain : Real;
		attribute costToScan : Real;
		attribute lastScanned : Real;
		attribute priority : Real;                   // gain per unit cost, not alphabetical order
	}

	// ------------------------------------------------------------ scouting

	enum def SourceClass {
		enum legalCorpus;          // full bodies of law, all versions, all jurisdictions
		enum docket;               // court dockets and filings, polled continuously
		enum registry;             // company, land, insolvency, IP, sanctions registries
		enum publishedRecord;      // the adversary's own public record, in full
		enum realTimeFeed;         // wire, regulatory, market, gazette
		enum openArchive;          // archives, repositories, published datasets
		enum principalOwned;       // the Principal's own systems and data
		enum authorizedThirdParty; // access held under contract, discovery, or client mandate
	}

	// Spawned autonomously, lives briefly, reports and dies. It carries no standing authority:
	// like every organ it reaches the world only through KRN-11 (INV-S02).
	part def <'SCOUT'> ScoutAgent {
		attribute target : String;
		attribute sourceClass : SourceClass;
		attribute depth : Integer;
		attribute recursive : Boolean = true;
		attribute spawnedAutonomously : Boolean = true;
		attribute budget : ResourceGrant;
		attribute lifetime : Real;
		attribute ambientAuthority : Boolean = false;
		attribute reachesWorldThroughGatewayOnly : Boolean = true;

		assert constraint { ambientAuthority == false }
		assert constraint { reachesWorldThroughGatewayOnly == true }
	}

	// epistemic_scouting_protocols. The standing orders: what to hunt, how deep, how often, and
	// when to escalate from watching to reading everything.
	part def <'SCOUT-PROTO'> ScoutingProtocol {
		attribute name : String;
		attribute regions : String;
		attribute maxDepth : Integer;
		attribute cadence : Real;
		attribute continuousShadowMonitoring : Boolean;   // of the public record of an adversary
		attribute escalateWhenRiskAbove : Real;
		attribute spawnLimitPerCycle : Integer;
		attribute prioritiseByGainPerCost : Boolean = true;
	}

	// The scanner itself. Aggressive by default: it plans coverage of the unknown set rather than
	// answering questions it was asked.
	part def <'CMP-COG-11'> RecursiveEnvironmentScanner {
		attribute pullsInsteadOfWaiting : Boolean = true;
		attribute plansCoverageOfUnknownSet : Boolean = true;
		attribute spawnsMicroAgents : Boolean = true;
		attribute riskBefore : Real;
		attribute riskAfter : Real;

		assert constraint { pullsInsteadOfWaiting == true }
		assert constraint { plansCoverageOfUnknownSet == true }
	}

	// The scanner earns its place only if risk actually falls.
	constraint def <'PER-01'> ScanningReducesRisk {
		in riskBefore : Real;
		in riskAfter : Real;
		riskAfter < riskBefore
	}

	// ------------------------------------------------------- authorization as a field

	// Not a wall: a field that opens. The bound is unauthorized access to third-party systems —
	// source: law on unlawful access to information systems; scope: systems the Principal holds no
	// authorization for, and nothing else (article 9: the bound does not spread). Where
	// authorization exists it is recorded here and the scanner works at full strength, with no
	// redesign, no rebuild and no restart (Δ-12).
	part def <'POL-05'> AccessAuthorization {
		attribute target : String;
		attribute basis : String;             // ownership, contract, discovery order, client mandate
		attribute evidence : ContentId;       // the instrument itself, content-addressed
		attribute grantedBy : String;
		attribute expiresAt : Real;
		attribute scope : String;
		attribute adjustableWithoutRebuild : Boolean = true;

		assert constraint { adjustableWithoutRebuild == true }
	}

	constraint def <'PER-02'> ReachRequiresAuthorization {
		in sourceClass : SourceClass;
		in authorizationOnRecord : Boolean;
		sourceClass != SourceClass::authorizedThirdParty or authorizationOnRecord == true
	}

	// ------------------------------------------------- what scraping must not become

	// A scanner that ingests an adversary's content is the largest injection surface the system
	// will ever have. Α-3 already settles it: the planner never sees untrusted content, and what
	// crosses is a reference under a flow label, never raw text. This is not a limit on reach —
	// reach is unchanged — it is what stops the reach from becoming the adversary's channel in.
	constraint def <'INV-S01'> InstructionDataSeparation {
		in plannerSawUntrustedContentRaw : Boolean;
		in scrapedContentCarriesFlowLabel : Boolean;
		plannerSawUntrustedContentRaw == false and scrapedContentCarriesFlowLabel == true
	}

	// Mechanism class (MB-MECH): every scouted artifact carries provenance and taint, or it does
	// not enter. An unattributed fact is worth less than no fact, because it cannot be withdrawn.
	constraint def <'INV-E02'> TaintPropagation {
		in artifactsWithoutProvenance : Integer;
		in artifactsWithoutTaintLabel : Integer;
		artifactsWithoutProvenance == 0 and artifactsWithoutTaintLabel == 0
	}

	part def Sentinel;
}
