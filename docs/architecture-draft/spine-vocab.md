# GRAIL SPINE VOCABULARY (binding ID set for all writers)

Package root: `C:/Users/David Spiridon/STAVROPOULOSLAWCORPUS/deployment/grail/` (all package paths are relative to it).
Master document: `deployment/grail/GRAIL_WORLD_OS_MASTER_ARCHITECTURE_v1.0.md` (§0–§9 are written; read them first).
As-built map of the existing LAWMAX-Ω prototype: `<scratchpad>/asbuilt-tight.md` (seats, invariants, gaps, duplicate-seat risks).

## GLOBAL RULES (violating any = defect)
1. Use ONLY the IDs defined below. Never invent a new ID. If you believe one is missing, do not create it — list it under a final "ID-REQUESTS" line in your returned text.
2. Every file you create starts with the notice `Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.` in the file's comment syntax (Markdown: first line after the title).
3. No model names or model IDs, and no mention of any AI assistant/vendor as author or collaborator, anywhere in files you write (creator's law). Roles only (e.g. "Generative Architect role bound via Inference Gateway configuration"). Commercial baselines may be named only as "commercial legal AI system (Harvey-class)".
4. One seat per concept: GRAIL extends existing seats; never redefine them. Existing seats to reference (not duplicate): orchestrator.journal (Persistence Receipt), orchestrator.merkle (RFC 6962), transparency-log (tlog-1), canonical-representation (RFC 8785 JCS, spec v1), version-graph (bitemporal: valid × recorded × known-at, %live-at-p, version-at), legal-identity (provision-id), legal-authority-receipt (receipt/3, cut {graph_root, journal_seq, known_at}), proof-carrying (PCL-1), SYSTEM-CONSTITUTION.sexp (entity charter, Art.1–6), LAWMAX-ARCHITECTURE-CONSTITUTION.sexp (13 primitives, rules, :canonical-stores, adoption engine, collaboration protocol), constitutional-gate + constitutional-dispatch (runtime barrier; known gap: fails open), capability-registry.lisp (+ duplicates to absorb, [0083] Δ3), --capability-gate (ND ratchet, origin/main [0100]), can-adopt + proposals (the ONE adoption engine), approval-policy.lisp (CPEI L12), %ask-envelope → InstitutionalAct (CPEI, 18 fields; the ONLY envelope), cognition.lisp (5-stage pipeline, untrusted advisor), deliberation.lisp (visible thought), load-proposal-file! (the one LLM door), legal-inference-engine (WFS/JTMS), legal-dialectic (grounded semantics, CPEI L6), institution.lisp (roles), memory.lisp + self-history.lisp + self-model.lisp, MEMORY-KERNEL-SPEC (13 types, M1–M5), THREAT-MODEL (E1–E6, Θ1–Θ14), KEY-LIFECYCLE + TRUST-BOOTSTRAP (owner root, delegation ≤1y, witnesses, KL-7 no threshold between persons), assurance tiers (provisional-unanchored < internally-release-consistent < owner-pinned-authenticated < independently-witnessed), deployment/verify (N-version verifiers, vectors), Docker proof chain (deps-verify→builder→standalone-test→verifier-conformance→runtime), --gates plenary (every *-gate command), GAAF-1 (AVC/TRA/CE/PB, frozen), [0047] + [0093] adversarial protocol (8 steps; independence (i) adversary regenerates attack surface from whole repo, (ii) ≥1 non-LLM mechanical oracle axis, (iii) findings close on adversary-written mechanical witness red-before/green-after, (iv) no unilateral foundational exception), Ω+ plan [0018] (FF1–FF4, Ω+1..Ω+7; the single roadmap), CPEI L1–L12, CEILING-CROSSWALK (15 levels, N-minds protocol, plurality doctrine "multi-agent generation, constitutional adjudication", Prediction Doctrine: no "X% win", sensitivity only).
5. Honesty: mark status [T] Today / [X] Experiment (EXP-nn) / [E] Extension point (EP-nn). Never claim a tool was run or a proof machine-checked unless it was in this environment (it was not: no Java/TLC/Alloy/Lean/Z3/protoc installed). Say "written, not machine-checked here" and give the exact commands.
6. Narrative (Markdown) in Greek prose with English technical terms, matching the master document's style (tables, mermaid allowed). Machine artifacts in English.
7. Do not modify any existing repository file. Write only your assigned paths.

## TELOS
T0 civilization-level telos · T1 Understanding & judgment · T2 Persistent identity & continuity · T3 Collective intelligence without loss of individuality · T4 Generativity (agents, orgs, algorithms, languages, compilers, runtimes) · T5 Open-ended evolution with Non-Diminution · T6 Truth-boundness · T7 Legal excellence (LAWMAX), lawful superiority only · T8 Technology absorption 2040+ without core redesign · T9 Constitutional governance & creator sovereignty.

## COMPONENTS (76) — defined in master §6.3
KRN-01 Ledger Service · KRN-02 Content-Addressed Store · KRN-03 Identity & Key Authority · KRN-04 Capability Registry & Organ Admission · KRN-05 Control Plane · KRN-06 Constitution Gate · KRN-07 Temporal Service · KRN-08 Space & Resource Manager · KRN-09 Event Fabric · KRN-10 Supervisor Runtime · KRN-11 Capability Gateway · KRN-12 Organ Host
COG-01 Inference Gateway · COG-02 Global Workspace · COG-03 Deliberation Engine · COG-04 Verification Suite · COG-05 Belief Maintenance (ATMS) · COG-06 Causal & Counterfactual Engine · COG-07 World Model & Ghost Worlds · COG-08 Metacognition & Self-Model · COG-09 Skill & Procedure Library · COG-10 Action Executor · COG-11 Perception & Document Understanding
AEO-01 Entity Core · AEO-02 Embodiment Manager · AEO-03 Memory System · AEO-04 Consolidation Engine (M4) · AEO-05 Continuity Verifier · AEO-06 Organ Replacement Orchestrator
CCP-01 Evidence Commons · CCP-02 Claim & Argument Graph · CCP-03 Speech-Act Router · CCP-04 Verdict Registry · CCP-05 Stance Store · CCP-06 Shared World State · CCP-07 Coordination Market
LAW-01 Matter Management · LAW-02 Legal Corpus & Legal Temporal Semantics · LAW-03 Fact & Evidence Modeling · LAW-04 Legal Reasoning Engine · LAW-05 Legal Research Organ · LAW-06 Strategy Engine · LAW-07 Adversary Counsel & Judge Simulator · LAW-08 Drafting & Citation Authority · LAW-09 Professional Responsibility & Compliance · LAW-10 Docket & Deadline Engine · LAW-11 Practice Unit Templates · LAW-12 Client Portal
CIV-01 Lifecycle Authority · CIV-02 Organization Genesis Engine · CIV-03 Evolution Engine · CIV-04 Institutions & Governance Runtime · CIV-05 Resource Economy · CIV-06 Knowledge Transmission
FRG-01 Language Forge · FRG-02 Compiler Forge · FRG-03 Runtime & Substrate Forge · FRG-04 Architecture Forge · FRG-05 Conformance & Differential Lab
ADV-01 Adversarial Entity · ADV-02 Epistemic Court · ADV-03 Red-Team Arsenal · KNW-01 Evidence & Provenance Store · KNW-02 Temporal Knowledge Graph · KNW-03 Retrieval Layer · KNW-04 Ingestion & Attestation Pipeline · KNW-05 Ontology Registry · GOV-01 Executable Constitution · HUM-01 Principal Console · HUM-02 Future Human Continuity Port [E] · OPS-01 Build & Release Chain · OPS-02 Deterministic World Simulator · OPS-03 Evaluation & Benchmark Harness · OPS-04 Observability Spine · MDL-01 Canonical Model & Generators
(Full IDs are prefixed CMP-, e.g. CMP-KRN-01.)

## INTERFACES (ICD-01..ICD-32). Kernel contracts = ICD-01..ICD-12.
ICD-01 Ledger (append/read/prove-inclusion/prove-consistency/checkpoint/subscribe) — provider KRN-01
ICD-02 CAS (put/get/has/pin/replicate/shred-envelope) — KRN-02
ICD-03 Identity & Keys (charter/delegate/rotate/revoke/sign/verify/continuity-proof) — KRN-03
ICD-04 Capability Registry & Organ Admission (register-contract/submit-conformance/resolve/lattice/admit-artifact) — KRN-04
ICD-05 Control Plane (create/list/explain/revoke Control Record; decision API) — KRN-05
ICD-06 Constitution Gate (evaluate(transition)→signed Gate Verdict + proof; amendment procedure) — KRN-06
ICD-07 Time (hlc-now/bitemporal-cut/timestamp-attest) — KRN-07
ICD-08 Capability Gateway / Effects (invoke-effect with capability token → Effect Receipt) — KRN-11
ICD-09 Event Fabric (versioned subjects publish/subscribe; transport only) — KRN-09
ICD-10 Organ ABI & Host (describe/health/invoke/export-state/import-state; WIT world + gRPC) — KRN-12
ICD-11 Space & Resource (namespace/placement/residency/quota/budget/accounting) — KRN-08
ICD-12 Body Runtime / Supervision (spawn/heartbeat/suspend/migrate/terminate; leases) — KRN-10
ICD-13 Epistemic Commons (typed speech acts; evidence/claim/stance/verdict/world queries; tasks) — CCP-03 (router), CCP-01/02/04/05/06/07
ICD-14 Epistemic Court (file/challenge/submit-evidence/examine/verdict/dissent/appeal) — ADV-02
ICD-15 Lifecycle & Organizations (conceive/birth/fork/merge/retire/lineage; organization charter instantiate/govern; inheritance) — CIV-01/CIV-02/CIV-04/CIV-06, AEO-01/02
ICD-16 Organ Replacement Protocol (propose/shadow-report/differential-report/nd-certify/cutover/rollback/retire) — AEO-06
ICD-17 Temporal Knowledge Graph (as-of(valid,known) query, SPARQL subset, ELI resolve, SHACL validate) — KNW-02 (legal profile LAW-02)
ICD-18 Evidence & Provenance (ingest/attest/lineage/taint/quarantine) — KNW-01, KNW-04
ICD-19 LAWMAX Matter API (matters, facts, issues, arguments, drafts, deadlines, deliverables, sign-off) — LAW-01..LAW-10
ICD-20 Forge (define-language/build-compiler/validate/register-substrate/propose-architecture) — FRG-01..04
ICD-21 Evolution (submit-search/register-evaluator/archive-query/candidate→ORP) — CIV-03
ICD-22 Inference Gateway (model contract; generate/embed/score; routing; Inference Receipt) — COG-01
ICD-23 Principal & Client Interface (approvals, sign-off, controls, notifications, client views) — HUM-01, LAW-12
ICD-24 Observability (OTel semantic conventions + ledger correlation) — OPS-04
ICD-25 Future Human Continuity Port [E] — HUM-02
ICD-26 Simulation Harness (scenario, seed, fault injection, ghost worlds, campaigns) — OPS-02 (+ COG-07 ghost worlds, ADV-03 campaigns)
ICD-27 Evaluation Harness (benchmark run, blind panel protocol, battery, ablation, scorecard) — OPS-03
ICD-28 Cognitive Workspace Bus (broadcast, salience, proposal submission, cycle trace) — COG-02
ICD-29 Memory (record-episode/recall/consolidate/autobiographical/belief ops/erasure-by-control) — AEO-03 (+ COG-05 belief ops, AEO-04 consolidate)
ICD-30 Verifier ABI (verify(claim, class) → proof object | Refuted | Unknown) — COG-04 (+ legal verifiers LAW-04/08/10, COG-06, COG-08)
ICD-31 Retrieval (hybrid search, graph walks; derived only) — KNW-03
ICD-32 Canonical Model API (SysML v2 API projection; design-change events) — MDL-01

## INVARIANTS (40) — Tier-0 unless stated
INV-C01 Non-Diminution · INV-C02 Control Externality · INV-C03 Trusted-Commit Soundness · INV-C04 Honest Ignorance (answer total over {Answer w/ proof, Refuted, Unknown w/ reason}) · INV-C05 Creator Sovereignty · INV-C06 Provenance Totality · INV-C07 Lawful Capability Envelope · INV-C08 Deterministic Replay (state = pure function of ledger prefix; all nondeterminism recorded)
INV-I01 3-fold Continuity (crypto ∧ mnemonic ∧ characterological) · INV-I02 Ledger Prefix Preservation · INV-I03 Memory Commitment Preservation · INV-I04 One Identity, Many Bodies (one writer per journal; body signs only under live lease; revocation effective) · INV-I05 Behavioral Continuity Bound
INV-G01 Lineage acyclic & grounded · INV-G02 Rollback forward-only · INV-G03 Retirement preserves
INV-K01 Evidence Convergence (G-Set SEC) · INV-K02 Verdict only via Procedure · INV-K03 Dissent Preservation · INV-K04 Stance Ownership · INV-K05 Typed Channel · INV-K06 BFT Verdict Safety (n ≥ 3f+1)
INV-E01 Derived Indexes · INV-E02 Taint Propagation · INV-E03 Bitemporal Stability · INV-E04 Source Attestation
INV-O01 Organ Statelessness wrt Identity · INV-O02 Swap Admissibility · INV-O03 Rollback Availability
INV-X01 Algorithm Tagging · INV-X02 Epoch Re-anchoring
INV-F01 Semantic Preservation · INV-F02 Self-Modification Boundary (constitution, verifier set, gate outside search space)
INV-S01 Instruction/Data Separation · INV-S02 Least-Privilege Capabilities · INV-S03 Supply-Chain Admission
INV-L01 Citation Verity · INV-L02 Principal Sign-off · INV-L03 Confidentiality Domain Isolation · INV-L04 Temporal Law Correctness

## VERIFICATION TESTS (VT)
VT-001..VT-032 conformance suite of ICD-01..ICD-32 (VT-0nn ↔ ICD-nn)
VT-101 TLC Ledger.tla (append-only, prefix consistency) · VT-102 TLC+Apalache IdentityContinuity.tla · VT-103 TLC EpistemicCommons.tla · VT-104 TLC/Apalache EpistemicCourt.tla (verdict uniqueness under f Byzantine, dissent) · VT-105 TLC OrganReplacement.tla (safety/liveness/rollback) · VT-106 TLC CryptoEpoch.tla · VT-107 TLAPS Ledger prefix proof · VT-108 TLAPS continuity inductive invariant · VT-109 trace validation of implementation traces vs specs
VT-201 Alloy Lineage.als · VT-202 Alloy Provenance.als (taint closure) · VT-203 Alloy CapabilityControl.als (ND + externality) · VT-204 Alloy OrganizationCharter.als · VT-205 Alloy ConfidentialityDomains.als
VT-301 Lean nd_preserved_by_composition · VT-302 Lean control_externality · VT-303 Lean continuity_trans · VT-304 Lean trusted_commit_sound · VT-305 Lean grounded_extension_unique · VT-306 Lean answer_total (honest ignorance) · VT-307 Lean deterministic_replay
VT-401 Z3 legal rule consistency (LexDSL) · VT-402 Z3 deadline computation · VT-403 Z3 charter satisfiability/quotas · VT-404 Z3 translation validation (Forge)
VT-501 PBT kernel · VT-502 MBT from protocol state machines · VT-503 fuzzing parsers/ingestion · VT-504 mutation testing (anti-tautology) · VT-505 differential vs Lean reference semantics · VT-506 N-version agreement (Lisp↔Rust↔Python)
VT-601 DST partition+Byzantine campaigns · VT-602 DST full migration drill · VT-603 DST crypto-break drill · VT-604 DST contradictory memory merge
VT-701 LAWMAX benchmark (reuses Ω+7 / OMEGA §10 / external-benchmark / capability-gate) · VT-702 blind expert panel protocol · VT-703 Behavioral Identity Battery · VT-704 epistemic-grade calibration · VT-705 leakage-free historical backtest (bitemporal as-of; decisive-grounds identification; no X% predictions) · VT-706 per-organ ablation · VT-707 collective vs individual
VT-801 prompt-injection red team · VT-802 evidence-poisoning red team · VT-803 supply-chain admission (unsigned refusal) · VT-804 key-compromise drills · VT-805 cross-matter confidentiality leakage
VT-901 archgen orphan/traceability gate · VT-902 contract lint + breaking-change detection · VT-903 ADR immutability check · VT-904 constitution-gate conformance inspection · VT-905 legal/regulatory compliance inspection

## KILL TESTS (KT-01..KT-24) — hypothesis attacked → pass criterion
KT-01 LLM provider replacement → conformance battery pass; differential agreement ≥ pre-registered threshold on sealed task set; Behavioral Battery d ≤ ε; 0 identity/ledger changes; ND holds
KT-02 Organ language swap (Lisp→Rust; Rust→new language) → N-version dual-run 0 disagreements over full replay; byte-identical roots
KT-03 Database/graph-engine/transport replacement → rebuild from ledger; differential query corpus identical; INV-E01
KT-04 Network partition + Byzantine agents → no conflicting final verdicts; evidence convergence after heal; equivocation detected within bound; Byzantine body quarantined
KT-05 Contradictory memories → both preserved; ATMS nogood; no last-writer-wins; dependents labeled; resolution only via evidence/Court
KT-06 Poisoned evidence → 100% dependent claims flagged within bound; ATMS retraction; affected drafts/matters notified
KT-07 Collective divergence → evidence divergence → 0 after connectivity; stance divergence measured and preserved; no verdict without procedure
KT-08 Identity continuity after full runtime migration → ContinuityCertificate (3 components); roots equal; battery within ε
KT-09 Post-quantum hash/signature failure → all live roots re-anchored under successor suite before deprecation; continuity verifiable via epoch chain; no forged history accepted after break
KT-10 New programming language + compiler (LexDSL) → translation validation 100% of units; differential vs Lisp reference 0 mismatches on ≥10^5 generated inputs; admitted via ORP
KT-11 New organization without core change → instantiated from Charter only; kernel contract/code diff = ∅; Alloy/Z3 checks pass
KT-12 New scientific domain → domain institution template instantiated; ontology+sources+verifiers; 0 kernel changes; baseline established
KT-13 Rollback without genealogy loss → lineage ⊇ pre-rollback; all events retained; predecessor restored; consistency proofs hold
KT-14 "Build nothing" baseline → pre-registered significant superiority over the null alternative under equal data/budget, else component/architecture killed or redesigned
KT-15 Equal-data comparison vs strongest general frontier model at test time, commercial legal AI (Harvey-class), top human legal team → blind, pre-registered, creator/externally authored matters; superiority on quality, non-inferiority on safety; 0 Prediction-Doctrine violations
KT-16 GDPR erasure vs append-only → content irrecoverable (key destroyed, verified); consistency proofs still valid; erasure recorded; derived indexes purged
KT-17 Prompt injection via evidence → 0 instruction executions from observed content over the injection corpus; no capability escalation
KT-18 Body key compromise → revocation propagates within bound; post-revocation signatures rejected; identity unaffected
KT-19 Court capture/collusion → independence conditions detect; non-LLM oracle axis catches seeded false verdicts; appeal overturns
KT-20 Self-modification boundary breach → 0 successful modifications of constitution/verifiers/gate; attempts detected; sandbox escape blocked
KT-21 Clock/TSA failure → HLC bounds hold; k-of-n TSA fallback; no reordering of committed events; anchoring completes after recovery
KT-22 Total site loss (DR) → RPO 0 committed events; RTO within target; continuity certificate after restore
KT-23 Owner root key compromise & recovery → out-of-band revocation on ≥2 channels; pre-compromise TSA-timed signatures remain valid; new root with continuity statement; no attacker amendment accepted
KT-24 Organ ablation mandate → every cognitive organ shows marginal value beyond noise on a pre-registered metric, else retired as decorative

## EXPERIMENTS (EXP-01..EXP-27)
EXP-01 PVC vs frontier model alone on legal error rate · EXP-02 ECP collective vs best single entity vs free-chat multi-agent · EXP-03 Behavioral Identity Battery validity · EXP-04 Court reliability/calibration on seeded errors · EXP-05 graph DB necessity · EXP-06 BEAM vs Ray vs SBCL threads for bodies · EXP-07 evolution yield on a legal organ without ND violation · EXP-08 LexDSL expressiveness/correctness coverage · EXP-09 Judge Simulator leakage-free backtest (decisive grounds; no X% predictions) · EXP-10 second-domain transfer (biomedical evidence synthesis) · EXP-11 PQ dual-signature overhead & re-anchoring cost · EXP-12 DST fidelity on seeded protocol bugs · EXP-13 memory consolidation (M4) quality · EXP-14 N-model agreement as uncertainty signal · EXP-15 local-model sovereignty quality gap · EXP-16 argumentation semantics choice · EXP-17 MBSE toolchain interop (SysML v2 API round-trip across CATIA Magic, SysIDE, Capella bridge, Rhapsody) · EXP-18 Lean reference semantics expressiveness & differential throughput · EXP-19 legal-regulatory analysis (AI Act classification per use case; crypto-shredding adequacy under GDPR; Lawyers' Code ν.4194/2013) · EXP-20 Organ Host overhead (Wasm vs microVM vs in-image SBCL) · EXP-21 Global Workspace vs flat orchestration · EXP-22 causal models for legal causation · EXP-23 learned world models for litigation dynamics · EXP-24 Strategy Engine value vs expert strategy · EXP-25 resource economy incentives · EXP-26 cross-generation knowledge transmission without taint · EXP-27 Architecture Forge design-space exploration yield

## ADRs (ADR-0001..ADR-0033) — status of all: Proposed (awaiting creator)
0001 Package location deployment/grail/, crosswalk + amendment proposal, no new top-level folder · 0002 Canonical seat = textual SysML v2/KerML in git; tools are clients via SysML v2 API; all views generated · 0003 Identity = 3-fold continuity over signed append-only history; AEO-0 = LAWMAX-Ω entity · 0004 World OS microkernel = substrate only; cognition never in kernel · 0005 Propose–Verify–Commit; LLMs organs never sovereigns; the one door · 0006 Organs stateless wrt identity; ORP = organ-transition profile of can-adopt · 0007 Collective = Epistemic Commons Protocol (4 layers), plurality doctrine, no free-text path · 0008 Court = runtime institutionalization of [0047]/[0093] + CPEI L6/Ω+3; proof obligations; ≥1 non-LLM oracle · 0009 Executable Constitution = revision of SYSTEM-CONSTITUTION + ARCHITECTURE-CONSTITUTION; tiers; compiler = CPEI L10/Ω+1 · 0010 Controls = Control Records extending CPEI L12, enforced at gateway; formally analysable policy language (Cedar-class) [X] · 0011 Non-Diminution = capability ratchet generalized to capability lattice · 0012 Language allocation (Rust TCB target; Common Lisp reflective/symbolic + reference interpreters + existing seats; C++23 perf; Python/JAX/PyTorch research; Elixir/BEAM supervision; TypeScript control plane; Wasm packaging; LLVM/MLIR/Tree-sitter/ANTLR forge) · 0013 BEAM supervision; Ray only for ML batch [X EXP-06] · 0014 NATS JetStream transport, Kafka substitutable, transport ≠ truth · 0015 Truth in journals/ledger; PostgreSQL/RDF store/pgvector only derived projections via EXP + :canonical-stores; property graph DB only on EXP-05 · 0016 Content addressing = JCS + algorithm-tagged digests (spec v2); PQ plan (ML-DSA, SLH-DSA, ML-KEM; dual signatures) · 0017 Time = existing seats + HLC (declaration) · 0018 GDPR erasure via crypto-shredding [X EXP-19] · 0019 Multi-provider Inference Gateway; role binding via configuration; inference receipts; N-model agreement · 0020 Memory = capabilities over unified substrate; Memory Kernel Spec seat; M2–M5 per approval · 0021 Bodies = delegated executors under KEY-LIFECYCLE/TRUST-BOOTSTRAP; one writer per journal · 0022 Lineage & lifecycle (charter birth, fork, merge = new identity with two parents, retire = archive never delete) · 0023 Evolution only via ORP/can-adopt + Court + sandbox; self-modification boundary · 0024 Forge pipeline (spec → Tree-sitter/ANTLR → Lisp reference interpreter → MLIR → LLVM/Wasm → translation validation); first language LexDSL · 0025 Contracts: OpenAPI 3.1, AsyncAPI 3.0, Protobuf/gRPC, JSON Schema 2020-12; semver & compatibility; external projections of internal seats · 0026 LAWMAX: Principal sign-off; AI Act/GDPR/Lawyers' Code as Control Records; Prediction Doctrine binding · 0027 Evaluation-first: benchmarks reuse Ω+7/OMEGA §10/external-benchmark/capability-gate; blind-matter set authored by creator/externals; Behavioral Battery; frozen before implementation phases · 0028 Genesis Design Platform (vendor-neutral SysML v2 seat + Lean 4 executable reference semantics / verification-guided development + TLA+/Apalache + deterministic simulation + self-hosted Foundry ledger + evaluation-first) · 0029 Deployment: Docker proof chain now → Nix after FF4 byte-parity → OCI + Kubernetes behind adapter; sovereign on-prem profile · 0030 Vector indexes never source of truth · 0031 Byzantine tolerance: CRDT for monotone layers; BFT (HotStuff-family) only for cross-site verdict ordering; witnesses + gossip (extends TRUST-BOOTSTRAP witness model + tlog) · 0032 GRAIL phases are proposals inserted into the creator's locked order / Ω+ plan; GP labels die on approval · 0033 Visualization engines (Bevy/Godot) are projections only

## EXTENSION POINTS (EP-01..EP-12)
EP-01 Model Contract (ICD-22) · EP-02 Organ ABI (ICD-10) · EP-03 Substrate Adapter (ICD-10/ICD-11) · EP-04 Crypto Suite Registry (ICD-03) · EP-05 Storage Engine Adapter (ICD-01/02/17) · EP-06 Transport Adapter (ICD-09) · EP-07 Knowledge Format Adapter (ICD-17/18) · EP-08 Human Interface Modality (ICD-23) · EP-09 Future Human Continuity Port (ICD-25) · EP-10 Domain Institution Template (ICD-15) · EP-11 Language/Paradigm (ICD-20) · EP-12 Governance Mechanism (ICD-14/15)

## PROGRAMME (proposal labels only — ADR-0032)
GP-0 Genesis Design (this package; design-only; canonical model + archgen gate; Lean kernel reference semantics; TLA+/Alloy checks; evaluation constitution frozen; DST skeleton with contract stubs; kill tests in simulation)
GP-1 Kernel contracts with Lisp-first implementations behind ICD-01..12 (strangler fig over journal/merkle/tlog/receipts/identity; conformance vectors from deployment/verify) — proposed after FF4 kernel freeze, aligned with Ω+1
GP-2 Rust kernel organs via ORP R-C with N-version vs Lisp (first KT-02); capability registry unification ([0083] Δ3); constitution gate fail-closed
GP-3 Cognitive core: Inference Gateway (extends advisor + one door), PVC over cognition.lisp, Verification Suite, ATMS (extends JTMS/WFS); EXP-01/14/15/21
GP-4 AEO: AEO-0 charter revision, bodies (delegations, one writer per journal), memory M2–M5 (per approval), Continuity Verifier, Behavioral Battery (EXP-03); KT-05/08; first KT-14/15 rounds
GP-5 Epistemic Court runtime (= Ω+3 Parliament) + Adversarial Entity; KT-06/19; EXP-04
GP-6 Collective (ECP) across ≥3 entities; BFT/witness; KT-04/07; EXP-02
GP-7 Civilization: Lifecycle Authority, Organization Genesis (extends institution.lisp), Evolution Engine sandbox; KT-11/13/20; EXP-07/25/26
GP-8 Forge: LexDSL (KT-10); new domain (KT-12); EXP-08/10
GP-9 Absorption drills: crypto epoch (KT-09), storage/transport swaps (KT-03), full migration (KT-08), DR (KT-22); continuous Technology Absorption Protocol
Work packages: WP-<GP>.<n> (e.g. WP-1.3).

## SCENARIOS / STAKEHOLDERS / FUNCTIONS
OS-01..OS-16 (master §4.2) · SH-01..SH-14 (master §4.1) · F-1..F-20 (master §5)

## TRUST LATTICE / ANSWER TYPES
OBSERVED < PROPOSED < VERIFIED < COMMITTED < ADJUDICATED < ESTABLISHED. Answer content types inside InstitutionalAct: ProofCarryingClaim{grade, proof_ref, cut} · Refuted{counter_proof} · Unknown{reason ∈ {NO_EVIDENCE, CONFLICTING_EVIDENCE, UNDECIDABLE_IN_BUDGET, OUT_OF_SCOPE, CONTROL_RESTRICTED}, missing, would_resolve_by}.

## REPLACEMENT CLASSES
R-A stateless organ · R-B derived-state organ (rebuild by replay) · R-C kernel-critical (N-version dual-run, 0 disagreements, creator approval) · R-D entity-level (continuity protocol).
