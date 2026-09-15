# STATE-OF-THE-ART — Το ανώτερο που υπάρχει σήμερα, ανά στρώμα

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Φάση Α — ανεύρεση του ανώτερου** · 2026-09-15 · Πηγή: επαληθευμένα αποτελέσματα ανά στρώμα (ερευνητής + ανεξάρτητος ελεγκτής που άνοιξε κάθε πηγή) και μετρήσεις στην τοπική πλατφόρμα.

## Μέθοδος και όρια

- **Εμβέλεια:** 12 ερευνητικά στρώματα: τα 10 του CLAUDE.md, με τον πυρήνα χωρισμένο σε υπόστρωμα και σύνταγμα/capabilities, συν την πλατφόρμα σχεδιασμού.
- **Έρευνα και έλεγχος:** κάθε στρώμα το ερεύνησε ένας ερευνητής και το έλεγξε αντιπαλικά ένας ανεξάρτητος ελεγκτής. Ο ελεγκτής άνοιξε **1029 πηγές**· **230** δεν στέκονταν όπως τις απέδιδε ο ερευνητής και διορθώθηκαν ή αφαιρέθηκαν. Έγιναν **246 διορθώσεις** συνολικά.
- **Κάθε στοιχείο έχει πηγή.** Οι πηγές βρίσκονται στα αρχεία λεπτομερειών `sota/<στρώμα>.md`. Ό,τι δεν τεκμηριώθηκε σημειώνεται «δεν ξέρω» στα `gap/<στρώμα>.md`.
- **Όριο 1 — αναζητήσεις:** το όριο αναζητήσεων της συνεδρίας (200) εξαντλήθηκε νωρίς. Οι έλεγχοι «μήπως ξέφυγε κάτι ανώτερο;» έγιναν με απευθείας ανάγνωση γνωστών πηγών (arXiv, GitHub, τεκμηρίωση). Νεότερες εργασίες του 2025–2026 μπορεί να λείπουν.
- **Όριο 2 — preprints:** preprints χωρίς peer review σημειώνονται ως τέτοια.
- **Όριο 3 — as-built έδρες:** οι ισχυρισμοί του προχείρου για το άλλο repo δεν επαληθεύονται από εδώ.
- **Ονοματολογία:** δεν ονομάζονται συγκεκριμένα LLM μοντέλα. Τα εμπορικά νομικά AI αναφέρονται ως «commercial legal AI system (Harvey-class)».

## 1. World OS / πυρήνας — υπόστρωμα

Για το υπόστρωμα ενός «World OS» το ανώτερο σήμερα δεν είναι κάποιο λειτουργικό σύστημα για AI: τα AIOS και MemGPT δεν υπερέχουν για τον σκοπό του GRAIL. Είναι ο συνδυασμός ώριμων τεχνικών: διαφανή append-only logs με τυποποιημένους witnesses (προφίλ C2SP tlog-tiles/checkpoint/cosignature/witness, Tessera, Rekor v2), αυτο-περιγραφόμενες διευθύνσεις περιεχομένου (CIDv1/multihash), durable execution (Temporal, Restate, DBOS), deterministic simulation (FoundationDB, TigerBeetle, Antithesis), απομόνωση οργάνων με Wasm Component Model (WASI 0.3) και microVMs (Firecracker), και supervision τύπου Erlang/OTP.

**Τι εξετάστηκε (28):** C2SP tlog-tiles / tlog-checkpoint / tlog-cosignature / tlog-witness *(production)* · Tessera (transparency-dev) + Sigstore Rekor v2 *(production)* · RFC 9162 (CT 2.0) — καθεστώς *(production)* · Witness Network / Sigsum *(pilot)* · AT Protocol repositories + DASL/DRISL *(production)* · CIDv1 (multicodec + multihash) *(production)* · Deterministic serializations: RFC 8785 JCS, CBOR CDE, dCBOR *(pilot)* · Hybrid Logical Clocks (Kulkarni, Demirbas et al.) *(production)* · Αυθεντικοποιημένος και νομικός χρόνος: NTS (RFC 8915), Roughtime, RFC 3161, eIDAS Art. 41 *(production)* · Bitemporal stores: XTDB v2, PostgreSQL 18 *(production)* · Durable execution: Temporal, Restate, DBOS *(production)* · Deterministic simulation testing: FoundationDB, TigerBeetle VOPR, Antithesis *(production)* · Consensus replication: Raft, Viewstamped Replication (TigerBeetle) *(production)* · Wasm Component Model: WASI 0.3, Wasm 3.0 DET profile, Wasmtime LTS, wRPC *(production)* · Sandboxes: Firecracker, Hyperlight, gVisor *(production)* · Capability microkernels & hardware: seL4 (+MCS), LionsOS, Genode, Zircon, CHERI *(production)* · Rust OS / verified Rust: Asterinas, Theseus, Verus *(research-prototype)* · Supervision runtimes: Erlang/OTP 29, Apache Pekko, Orleans, Ray *(production)* · Event transport: NATS JetStream 2.14, Apache Kafka 4.x *(production)* · AI agent OS: AIOS, MemGPT *(research-prototype)* · Observability: OpenTelemetry GenAI semconv, W3C Trace Context *(pilot)* · Reproducible builds & supply chain: Nix, Guix full-source bootstrap, SLSA 1.2 *(production)* · Contract IDLs & tooling: OpenAPI 3.2, AsyncAPI 3.1, Protobuf Editions 2024, JSON Schema 2020-12, TypeSpec, Buf *(production)* · Verification-guided development (Cedar) και όρια του N-version *(production)* · RFC 9170 — Long-term viability of protocol extension mechanisms *(production)* · Leases & fencing tokens *(production)* · AWS ClockBound *(pilot)* · EDPB Guidelines 02/2025 (blockchain και προσωπικά δεδομένα) *(pilot)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/KSUB.md](sota/KSUB.md)

## 2. World OS / πυρήνας — εκτελέσιμο σύνταγμα, capabilities, controls

Το εκτελέσιμο σύνταγμα έχει σήμερα σαφή βιομηχανικά ανάλογα:
- γλώσσες πολιτικής με τυπική ανάλυση: Cedar, με verification-guided development σε Lean και differential testing·
- ντετερμινιστικά σημεία επιβολής έξω από τον κώδικα των agents·
- υπογεγραμμένες ετυμηγορίες admission: SLSA VSA, Sigstore·
- έλεγχος ροής πληροφορίας για LLM agents: CaMeL, FIDES.

**Τι εξετάστηκε (21):** Cedar + verification-guided development *(production)* · Cedar Analysis (SymCC) και Zelkova *(production)* · Policy in Amazon Bedrock AgentCore + Dogwood *(pilot)* · AWS Service Control Policies ως guardrails *(production)* · OPA/Rego, ReBAC (Zanzibar/OpenFGA), AuthZEN, ABAC *(production)* · Object-capability security (seL4, WASI, Miller) *(production)* · Attenuable και sender-constrained capability tokens *(production)* · CaMeL *(research-prototype)* · FIDES (information-flow control για agents) *(research-prototype)* · Privilege control και runtime enforcement για agents *(research-prototype)* · AI Control: protocols και control evaluations *(pilot)* · Συντάγματα μοντέλων (CAI, CCAI, Constitutional Classifiers, Model Spec) *(production)* · Γλώσσες κανόνων (Catala, LegalRuleML, ODRL, IG 2.0) *(production)* · Automated Reasoning checks (Bedrock Guardrails) *(production)* · Επαληθευμένοι MFOTL runtime monitors *(research-prototype)* · Υπογεγραμμένα verdicts και fail-closed admission *(production)* · Root of trust: TUF και FROST *(production)* · Διαδικασίες αναθεώρησης σε παραγωγή (Tezos, Polkadot OpenGov) *(production)* · Ρυθμιστικό πλαίσιο: AI Act Art.14/12 και NIST AI RMF *(production)* · Αξιοπιστία capability evaluations *(research-prototype)* · Delegation tokens για αλυσίδες agents (AIP/IBCT) και authorization propagation *(research-prototype)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/KGOV.md](sota/KGOV.md)

## 3. Γνωσιακός πυρήνας GRAIL + γνώση / μαρτυρία / provenance

Το ανώτερο σήμερα είναι το σχήμα «γεννήτρια + εξωτερικός sound verifier»: LLM-Modulo, AlphaGeometry, AlphaProof, FunSearch, AlphaEvolve. Η αυτο-κριτική των LLM δεν αρκεί, ενώ ο εξωτερικός έλεγχος ανεβάζει σημαντικά την ορθότητα. Για τη γνώση: PROV-O, διτεμπορικά stores (XTDB v2, Zep/Graphiti), hybrid retrieval, και πιστοποιητικά αποδείξεων με ανεξάρτητους checkers (cvc5 → Alethe → Carcara, ανεξάρτητοι Lean kernels).

**Τι εξετάστηκε (23):** CoALA (Cognitive Architectures for Language Agents) *(theoretical)* · LLM-Modulo και όρια αυτο-επαλήθευσης *(research-prototype)* · Neurosymbolic με verifier στον βρόχο (AlphaGeometry, AlphaProof, FunSearch, AlphaEvolve) *(research-prototype)* · Test-time compute, PRMs, MCTS *(research-prototype)* · Ανεξάρτητα ελέγξιμα proof certificates (cvc5/Alethe + Carcara· ανεξάρτητοι Lean kernels) *(pilot)* · Συσχετισμένες αποτυχίες σε N-version και N-model *(research-prototype)* · Αβεβαιότητα και abstention (semantic entropy, conformal) *(research-prototype)* · ATMS, provenance semirings, ProvSQL, AGM σε belief bases *(pilot)* · Αιτιακή συμπερασματολογία: DoWhy, CLadder, Halpern–Pearl, νομική αιτιότητα *(production)* · Learned world models (V-JEPA 2, DreamerV3, Genie 3) *(research-prototype)* · Global Workspace και blackboard για AI *(research-prototype)* · Όρια ενδοσκόπησης LLM *(research-prototype)* · Prompt injection by design: CaMeL, FIDES *(research-prototype)* · Πολυπαροχικά gateways, routing, drift, μη ντετερμινισμός, OTel GenAI *(production)* · Durable execution (Temporal) *(production)* · Skill libraries και MCP *(production)* · Document parsing (OmniDocBench, Docling) *(production)* · Provenance και attestation: PROV-O, SCITT, in-toto, VC 2.0, C2PA *(production)* · RDF/SPARQL/SHACL (1.1/REC και 1.2/σε εξέλιξη), Oxigraph, Akoma Ntoso/ELI *(pilot)* · Διτεμπορικά και speculative stores (XTDB v2, Zep/Graphiti, Datomic with) *(production)* · Retrieval: hybrid, GraphRAG, HippoRAG 2, poisoning *(production)* · Incremental συντήρηση παράγωγων (Differential Dataflow) *(production)* · LinkML (σχήμα από μία πηγή) *(production)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/COG.md](sota/COG.md)

## 4. AEO — μνήμη, ταυτότητα, πολλά σώματα

Για τη μνήμη agents: MemGPT/Letta, Mem0, Zep/Graphiti, HippoRAG 2, και τα benchmarks LongMemEval και HaluMem. Έρευνα του 2026 δείχνει ότι η consolidation που ξαναγράφει τη μνήμη υποβαθμίζεται, ενώ τα ακατέργαστα ιστορικά επιτρέπουν ανάκαμψη μετά από αλλαγή μοντέλου. Για ταυτότητα και κλειδιά: KERI (pre-rotation, witnesses, duplicity detection), W3C VC 2.0 / DID 1.1, SPIFFE/SPIRE για ταυτότητα φορτίων εργασίας, και leases με fencing tokens για τον κανόνα «ένας συγγραφέας».

**Τι εξετάστηκε (23):** KERI (Key Event Receipt Infrastructure) *(pilot)* · W3C VC 2.0 + Controlled Identifiers v1.0 + DID v1.1 + did:webvh *(production)* · Transparency logs: RFC 9162 + C2SP tlog-witness *(production)* · Leases + fencing tokens· single-activation (Orleans) *(production)* · Workload/agent identity: SPIFFE/SPIRE, IETF WIMSE, draft-klrc-aiagent-auth, OpenID whitepaper *(pilot)* · Merkle-CRDTs / BFT CRDTs / Automerge 3 *(production)* · MemGPT/Letta + sleep-time compute *(production)* · Zep/Graphiti· Mem0· MemOS· A-MEM *(production)* · Evidence-preserving memory: MemMachine, faulty consolidation, memory portability *(research-prototype)* · Consolidation/episodic: Auto-Dreamer, HippoRAG 2, EM-LLM, Position paper, BeliefMem *(research-prototype)* · Memory benchmarks: LongMemEval, HaluMem *(production)* · Memory security & governance: MINJA, SMSR, SSGM, Always-On survey *(research-prototype)* · Behavioral identity measurement *(research-prototype)* · Runtime-independent persistent agents (Enoch)· multi-anchor identity *(research-prototype)* · Progressive delivery & differential: Diffy, Argo Rollouts, N-version, strangler fig *(production)* · Psychological continuity (Parfit), non-branching & fission *(theoretical)* · Neurotechnology ethics & BCI standards *(pilot)* · EDPB Guidelines 02/2025 (blockchain), final v2.0 *(production)* · ATMS (assumption-based truth maintenance) *(research-prototype)* · Multi-agent memory consistency (computer-architecture view) *(theoretical)* · ISO/IEC TS 27560:2023 consent record information structure *(pilot)* · Statistical evaluation of language models (error bars) *(pilot)* · AGM belief revision *(theoretical)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/AEO.md](sota/AEO.md)

## 5. Συλλογική συνείδηση

Τα βιομηχανικά πρωτόκολλα agents (MCP, A2A 1.0, ANP) δεν έχουν ψηφοφορία, δεσμεύσεις ή διατήρηση διαφωνίας. Η έρευνα 2025–2026 δείχνει τρία πράγματα: η ψηφοφορία εξηγεί τα περισσότερα κέρδη του debate, τα σφάλματα των LLM συσχετίζονται μεταξύ τους, και υπάρχει μετρήσιμη conformity. Για αναπαραγωγή με Byzantine κόμβους υπάρχουν BEC/BFT-CRDT (hash-DAG), HotStuff-2 και witness cosigning.

**Τι εξετάστηκε (22):** CRDT / Strong Eventual Consistency + μηχανικά ελεγμένες αποδείξεις σύγκλισης *(research-prototype)* · Byzantine Eventual Consistency (BEC) / Byzantine-fault-tolerant CRDTs *(research-prototype)* · BFT state machine replication: HotStuff-2, DAG-BFT (Mysticeti), Autobahn, CometBFT *(production)* · Transparency-log witness cosigning (C2SP tlog-witness, tlog-cosignature) *(pilot)* · Dialogue systems με commitment stores (Prakken) και η γενεαλογία FIPA ACL *(research-prototype)* · Declarative information protocols (BSPL, Langshaw) εκτελούμενα από LLM agents (Ahoy, Strabo) *(research-prototype)* · Βιομηχανικά agent πρωτόκολλα: A2A 1.0 (LF), MCP (AAIF), ANP *(production)* · Agora meta-protocol (Protocol Documents με hash) *(research-prototype)* · Structured argumentation: Dung AF, ASPIC+, Carneades, AIF, ICCMA *(research-prototype)* · LLM + τυπική argumentation (ArgLLMs, MArgE) με QBAF και gradual semantics *(research-prototype)* · Nanopublications (assertion / provenance / publication info, + knowledge provenance) *(pilot)* · Εμπειρική επιστήμη LLM MAS: failure taxonomy, scaling, debate έναντι ensembling *(research-prototype)* · Conformity, consensus collapse, factual attrition σε LLM MAS *(research-prototype)* · Συσχετισμένα σφάλματα LLM και wisdom of the silicon crowd *(research-prototype)* · Συνάθροιση πέρα από την πλειοψηφία: bridging, surprisingly popular, conformal social choice *(production)* · Διαβούλευση με διαμεσολάβηση AI: Habermas Machine, Polis *(pilot)* · Υποστρώματα συντονισμού: blackboard LLM MAS, SOP-driven MAS, auction allocation *(research-prototype)* · Multi-agent security: prompt infection, steganographic collusion, Byzantine LLM agents *(research-prototype)* · Keyhive: local-first access control (convergent capabilities, group CRDT, E2EE) *(research-prototype)* · Επιστήμη συλλογικής νοημοσύνης και knowledge commons (με την αμφισβήτησή της) *(theoretical)* · CaMeL: prompt-injection defense by design (control/data-flow separation + capabilities) *(research-prototype)* · Trust-BFT: BFT με trusted components (λιγότερα replicas) *(research-prototype)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/CCP.md](sota/CCP.md)

## 6. Epistemic Court & Adversarial Entity

Το ανώτερο σήμερα:
- debate και scalable oversight, με μετρημένα όρια·
- AI control evaluations (ControlArena)·
- αντιπαλικοί θεσμοί σε παραγωγή που αγκυρώνουν τη διαφωνία σε μηχανική απόδειξη ενός βήματος (Arbitrum BoLD)·
- structured argumentation με burdens και standards of proof (ASPIC+, Carneades)·
- accountable safety στο BFT.

Οι LLM κριτές είναι εκμεταλλεύσιμοι, και τα σφάλματά τους συσχετίζονται ακόμη και μεταξύ παρόχων.

**Τι εξετάστηκε (23):** AI safety via debate και εμπειρικά αποτελέσματα debate *(research-prototype)* · Complexity-theoretic debate: doubly-efficient, prover-estimator, DQC, safety case *(theoretical)* · Σύγκριση πρωτοκόλλων oversight 2025–2026 *(research-prototype)* · Multi-agent debate έναντι ψηφοφορίας· αξία της μειοψηφίας *(research-prototype)* · Prover-verifier games (legibility) και weak-to-strong *(research-prototype)* · Biases και ευπάθειες του LLM-as-judge *(research-prototype)* · LLM juries και βαθμονόμηση panels *(pilot)* · Συσχετισμένα σφάλματα και όρια της ποικιλομορφίας (N-version) *(research-prototype)* · AI Control, ControlArena και συμπαιγνία χωρίς κανάλι *(pilot)* · AI sandbagging *(research-prototype)* · Automated και ανθρώπινο red teaming *(pilot)* · Εργαλεία, benchmarks και ταξινομίες red team: garak, PyRIT, Petri, HarmBench, AgentDojo, NIST AI 100-2e2025, OWASP *(production)* · Inspect (UK AISI) και sandboxing *(production)* · Structured argumentation με burdens και standards of proof (ASPIC+, Carneades, Prakken–Sartor, Calegari–Sartor) *(research-prototype)* · ICCMA 2025: solvers επιχειρηματολογίας *(production)* · Gradual/QBAF semantics και Argumentative LLMs *(research-prototype)* · Εμπειρικές γνωσιακές μελέτες σημασιολογιών *(research-prototype)* · Μηχανικοί oracles με μικρό TCB: certifying algorithms και ανεξάρτητοι Lean checkers *(production)* · Αντιπαλικοί θεσμοί επίλυσης διαφορών σε παραγωγή: Arbitrum BoLD, Kleros *(production)* · Community Notes: bridging algorithm, LLM γράφουν και άνθρωποι κρίνουν *(production)* · BFT: HotStuff-2 και accountable safety (BFT forensics, Casper FFG, CometBFT evidence) *(production)* · Επιστημικοί θεσμοί βαθμονόμησης: forecasting benchmarks και adversarial collaboration *(pilot)* · AgentCourt (persona-based προσομοίωση δικαστηρίου) *(research-prototype)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/ADV.md](sota/ADV.md)

## 7. Εξέλιξη / αυτο-βελτίωση + κύκλος ζωής

Το ανώτερο σήμερα: Darwin Gödel Machine, Huxley–Gödel Machine, AlphaEvolve. Η αναζήτηση γίνεται με archive και evaluators σε sandbox, και το loop, τα benchmarks και το sandbox μένουν εκτός τροποποίησης. Τα τεκμήρια 2023–2026 για reward hacking (τροποποίηση evaluators, επέκταση timeouts, διαγραφή tests) και για emergent misalignment είναι ισχυρά.

**Τι εξετάστηκε (23):** Darwin Gödel Machine (DGM) *(research-prototype)* · Huxley–Gödel Machine (HGM) *(research-prototype)* · AlphaEvolve (και ο πρόγονος FunSearch) *(production)* · Ανοιχτά frameworks εξέλιξης προγραμμάτων (OpenEvolve, ShinkaEvolve) *(pilot)* · Αυτο-αναφορικός σχεδιασμός agents (ADAS, Gödel Agent, SICA, STOP) *(research-prototype)* · Open-endedness και quality-diversity *(research-prototype)* · Τεκμήρια specification gaming σε αυτο-βελτιούμενα loops *(research-prototype)* · Emergent misalignment από στενή βελτιστοποίηση *(research-prototype)* · AI control και monitoring *(pilot)* · Frontier safety frameworks (ML R&D / αυτο-βελτίωση) *(production)* · Τεχνολογίες sandbox για untrusted κώδικα *(production)* · Formal confinement και analysable policy (seL4, Cedar, Alloy 6) *(production)* · Guaranteed Safe AI και Gödel machine *(theoretical)* · Provenance, lineage και append-only πρότυπα *(production)* · Στατιστικό non-regression / non-inferiority *(production)* · Αυτόματος σχεδιασμός οργανισμών multi-agent και ταξινομία αστοχιών *(research-prototype)* · Moise / JaCaMo (normative MAS organisation) *(production)* · Κοινωνίες agents: διακυβέρνηση, πολιτισμική μετάδοση, διάδοση exploits *(research-prototype)* · Οικονομίες agents *(research-prototype)* · Μετάδοση γνώσης μεταξύ γενεών: κίνδυνοι και θετικοί τρόποι *(research-prototype)* · AI scientists και αυτοματοποιημένη σύνθεση μαρτυρίας (βιοϊατρική) *(research-prototype)* · Διάδοχοι DGM 2026: meta-level αυτο-τροποποίηση έναντι σταθερού meta-agent *(research-prototype)* · Εκμετάλλευση LLM judges και deterministic guardrails (2026) *(research-prototype)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/EVO.md](sota/EVO.md)

## 8. Forge γλωσσών / compilers

Για νομικό DSL, το ανώτερο είναι το Catala: formal semantics, default logic, βήματα compilation αποδεδειγμένα σε F*, concolic testing (CUTECat). Ανάλογα είναι τα L4, OpenFisca και Mlang. Για τη γενική αλυσίδα: semantics-first πλαίσια (K, Sail, SpecTec, Lean κατά το Cedar), verified compilers (CompCert, CakeML), translation validation με ελέγξιμα πιστοποιητικά, και WebAssembly 3.0 με ντετερμινιστικό προφίλ.

**Τι εξετάστηκε (21):** Catala (rules-as-code DSL, default logic) *(pilot)* · L4 (Legalese, πρώην SMU CCLAW) και Blawx (s(CASP)) *(research-prototype)* · OpenFisca, Mlang (γλώσσα M της DGFiP) και MPS / Agile Law Execution Factory *(production)* · LegalRuleML Core 1.0 (OASIS) και DMN 1.5 (OMG) *(production)* · Cedar Verification-Guided Development (Lean + DRT + PBT) *(production)* · Verified compilers: CompCert 3.18 και CakeML *(production)* · Alive2 (bounded translation validation για LLVM IR) *(production)* · MLIR/LLVM με IRDL (dialects ως δεδομένα) *(production)* · Σημασιολογία και TV για MLIR: verification dialects, SMT dialect, mlir-tv, Lean-MLIR *(research-prototype)* · Cranelift: VeriISLE/Crocus και Arrival (επαληθευμένο instruction selection Wasm→native) *(production)* · WebAssembly 3.0 (deterministic profile, SpecTec) και WasmCert-Coq *(production)* · Wasm Component Model / WIT (WASI 0.2 → 0.3.x) *(pilot)* · Semantics-first single-source frameworks: K, Sail, SpecTec, PLT Redex *(production)* · Language workbenches: Langium, Spoofax, Rascal, MPS, Racket #lang *(production)* · Parsing: Tree-sitter, ANTLR 4.13.2, verified/validated parsers *(production)* · Ελέγξιμα certificates για SAT/SMT: Lean bv_decide (LRAT), cvc5 proofs, Carcara *(production)* · E-graphs: egg και egglog *(research-prototype)* · Differential testing compilers και όρια του N-version (και για κώδικα από LLM) *(production)* · LLMs σε compilers/transpilation ως proposers με verifier (2023–2026) *(research-prototype)* · Design-space exploration πάνω σε SysML v2 *(production)* · Επαλήθευση και testing για κώδικα νόμου στο Catala: CUTECat, formal date arithmetic *(research-prototype)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/FRG.md](sota/FRG.md)

## 9. LAWMAX — νομική συλλογιστική

Οι μετρήσεις αξιοπιστίας είναι του 2024: τα commercial legal AI systems (Harvey-class) έκαναν 17–33% hallucination και τα γενικά μοντέλα 58–88% (Magesh· Dahl). Το 2025 (Vals Legal Research, 200 ερωτήσεις αμερικανικής νομικής έρευνας) τα νομικά εργαλεία AI (74–78%) και το γενικής χρήσης AI (78%) ξεπέρασαν baseline έμπειρων δικηγόρων (69%)· κύριος διαφοροποιητής έμειναν οι πηγές και οι παραπομπές.

Το ανώτερο ανά θέμα:
- νομική αναπαράσταση: Akoma Ntoso / ELI / ECLI και LegalRuleML·
- rules-as-code: Catala (με τυπική αριθμητική ημερομηνιών και ανίχνευση αμφισημίας)·
- ελληνικό benchmark: GreekBarBench (EMNLP 2025)·
- τυφλή σύγκριση με ειδικούς: τύπου GDPval.

Ρυθμιστικό προηγούμενο: ένα AI-driven δικηγορικό γραφείο εγκεκριμένο από τη SRA (Αγγλία, 05/2025).

**Τι εξετάστηκε (25):** Magesh et al., Hallucination-Free? (τυπολογία correctness/groundedness) *(research-prototype)* · Dahl et al., Large Legal Fictions *(research-prototype)* · Legal NLP benchmarks (LegalBench, LexGLUE, LawBench, CaseHOLD, SARA) *(production)* · LEXam (ICLR 2026) *(research-prototype)* · GreekBarBench (EMNLP 2025) *(research-prototype)* · GDPval — blinded pairwise σύγκριση με ειδικούς *(pilot)* · Vals Legal AI Report (VLAIR) και Legal Research Report — lawyer baseline *(pilot)* · LegalAgentBench — αξιολόγηση νομικών agents με progress rate *(research-prototype)* · Νομική ανάκτηση (CLERC, LegalBench-RAG) *(research-prototype)* · Akoma Ntoso / AKN4EU, ELI, ECLI *(production)* · LegalRuleML Core 1.0 *(production)* · Rules-as-code: Catala, OpenFisca, Blawx *(pilot)* · Argumentation και θεωρία αποδείξεων (Carneades· hybrid theory· legal probabilism) *(research-prototype)* · Πρόβλεψη δικαστικών αποφάσεων και η κριτική της· adversarial προσομοίωση δίκης *(research-prototype)* · Πρότυπα δεδομένων νομικών υποθέσεων (SALI LMSS, FOLIO, LEDES) *(production)* · EU AI Act (Κανονισμός 2024/1689) όπως αποτυπώνεται στον tracker (ενημ. 31/08/2026) *(production)* · Εγκεκριμένο από ρυθμιστή AI-driven δικηγορικό γραφείο (SRA, Αγγλία και Ουαλία) *(production)* · Cedar — analysable policy language *(pilot)* · Cognitive forcing έναντι overreliance *(research-prototype)* · eIDAS 2 / EUDI Wallet και OpenID4VP 1.0 *(production)* · Ελληνικά νομικά δεδομένα και πηγές *(pilot)* · Κανονιστικό πλαίσιο δεδομένων και επαγγέλματος (EDPB, CCBE) *(production)* · Τυπική αριθμητική ημερομηνιών με ανίχνευση αμφισημίας (Catala dates-calc, ESOP 2024) *(research-prototype)* · Moise / JaCaMo — οργανωσιακό μοντέλο πολυπρακτορικών συστημάτων *(research-prototype)* · Γαλλία: απαγόρευση judge analytics (ν. 2019-222, άρθ. 33) *(production)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/LAW.md](sota/LAW.md)

## 10. Ασφάλεια / κρυπτογραφία

Η μετα-κβαντική κρυπτογραφία είναι υλοποιήσιμη σήμερα: FIPS 203/204/205, OpenSSL 3.5, PKCS#11 3.2, RFC 10024 για hybrid TLS. Το ανώτερο ανά θέμα:
- κλειδιά: KERI (pre-rotation, witnessed KEL)·
- prompt injection: σχεδίαση που το αποκλείει δομικά (CaMeL, FIDES)·
- supply chain: full-source bootstrap (Guix, stagex), SLSA, in-toto, TUF·
- GDPR απέναντι σε append-only: EDPB 02/2025 και CNIL, με ιεραρχία commitment > keyed hash > ciphertext.

**Τι εξετάστηκε (22):** NIST PQC standards (FIPS 203 ML-KEM, FIPS 204 ML-DSA, FIPS 205 SLH-DSA) + HQC + Falcon *(production)* · NIST IR 8547 (ipd) — PQC transition timeline *(pilot)* · Composite ML-DSA (IETF LAMPS) *(pilot)* · PQ implementation readiness: OpenSSL 3.5, PKCS#11 3.2, RFC 9881, RFC 9814, SP 800-227, RFC 10024 *(production)* · Crypto agility practice: NIST CSWP 39, CBOM (CycloneDX 1.7 / ECMA-424), multihash, RFC 8725 *(production)* · KERI (Key Event Receipt Infrastructure) v1.1 *(pilot)* · Transparency & witnessing: C2SP tlog-witness, Sigsum, IETF KEYTRANS, Sigstore Rekor v2 *(production)* · Long-term evidence & time: RFC 4998 ERS, RFC 3161, eIDAS Art. 41, Roughtime *(production)* · Threshold/multisig: FROST RFC 9591, NIST MPTS (IR 8214C), TUF root rotation *(pilot)* · Prompt injection by design: CaMeL, FIDES, Design Patterns, Dual LLM, Progent *(research-prototype)* · Injection evaluation & structural rules: AgentDojo, adaptive attacks, Spotlighting, AgentPoison, Rule of Two *(pilot)* · Threat taxonomies: OWASP LLM Top 10 2025, OWASP Agentic Top 10 2026, MITRE ATLAS, LINDDUN *(production)* · Supply-chain frameworks: SLSA v1.2, in-toto attestations, TUF *(production)* · Reproducible & bootstrappable builds: Guix FSB, stagex, DDC *(production)* · Authorization & workload identity: Cedar, Biscuit, Macaroons, SPIFFE/SPIRE *(production)* · GDPR vs append-only: EDPB Guidelines 02/2025, CNIL blockchain guidance, CJEU C-413/23 P *(pilot)* · Confidential computing & attestation: RFC 9334 RATS, Private Cloud Compute, TEE.fail *(pilot)* · LLM serving side channels (KV / semantic cache) *(research-prototype)* · EU regulatory security frame: CRA, EU PQC roadmap, AI Act Art. 15 *(production)* · BFT ordering: HotStuff, HotStuff-2 *(pilot)* · NIST SP 800-88 Rev. 2 — Media Sanitization (Cryptographic Erase) *(production)* · vLLM prefix-cache isolation (cache_salt) *(production)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/SEC.md](sota/SEC.md)

## 11. Verification toolchain

Η σημερινή πρακτική:
- verification-guided development (Cedar)·
- P/PObserve στην AWS·
- trace validation σε CI·
- deterministic simulation (FoundationDB, TigerBeetle, Antithesis)·
- ελέγξιμα πιστοποιητικά SMT (cvc5 → Alethe → Carcara)·
- επαλήθευση κώδικα Rust (Kani, Aeneas, Verus)·
- evaluation harnesses (Inspect)·
- adaptive red teaming·
- assurance cases (SACM, GSN, Assurance 2.0).

**Τι εξετάστηκε (26):** TLA+ εργαλεία: TLC, Apalache, TLAPS (TLA+ Foundation) *(production)* · Trace validation υλοποιήσεων έναντι TLA+ *(production)* · P language: PChecker, PObserve, PVerifier (AWS) *(production)* · Quint και FizzBee (specs φιλικά προς μηχανικούς, με MBT) *(pilot)* · Verification-guided development (Cedar) *(production)* · Lean 4, Lean FRO και ανεξάρτητοι kernel checkers *(production)* · Επαλήθευση κώδικα Rust: Aeneas, Verus, Kani *(pilot)* · SMT με ελέγξιμες αποδείξεις: cvc5 → Alethe/LFSC/CPC, Carcara, lean-smt *(pilot)* · Alloy 6 *(production)* · Επαλήθευση πρωτοκόλλων για κάθε n: TLAPS, Ivy· όρια του Apalache *(pilot)* · In-process DST: FoundationDB, TigerBeetle VOPR, madsim, turmoil, Shuttle *(production)* · Ντετερμινισμός ολόκληρου συστήματος: Antithesis, Shadow, Hermit *(production)* · Twins: παραγωγή Byzantine σεναρίων για BFT *(production)* · Σκευή testing: PBT/MBT, fuzzing, mutation, Jepsen *(production)* · Ανίχνευση breaking changes και translation validation *(production)* · AI για formal verification (vericoding) *(research-prototype)* · Evaluation harnesses: Inspect, HELM, lm-evaluation-harness *(production)* · Στατιστική αυστηρότητα και adaptive overfitting *(production)* · Μεθοδολογία αξιολόγησης νομικού AI και έργου ειδικών *(pilot)* · Adaptive red teaming και άμυνα prompt injection by design *(research-prototype)* · Conformal εγγυήσεις: conformal factuality και adaptive conformal inference *(research-prototype)* · SysML v2: εγγενής ιχνηλασιμότητα και επαλήθευση *(production)* · Assurance cases: SACM 2.3, GSN v3, Assurance 2.0 *(production)* · Ντετερμινιστικό LLM inference (batch-invariant kernels) *(pilot)* · Όριο ανεξαρτησίας στο N-version programming *(production)* · Veil: επαλήθευση transition systems μέσα στο Lean 4 *(research-prototype)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/VER.md](sota/VER.md)

## 12. Πλατφόρμα σχεδιασμού

Το SysML v2 (OMG, formal από 09/2025) έχει πλέον δεκάδες εργαλεία, όπως δείχνει η επίσημη λίστα της OMG. Κανένα δεν κυριαρχεί αυστηρά για αυτό το έργο:
- το SysON είναι ανοιχτό και web, αλλά χωρίς ιστορικό και με όρια πιστότητας κειμένου·
- τα CATIA Magic και Rhapsody είναι εμπορικά· το CATIA έχει δωρεάν Community Edition με όριο 500 στοιχείων·
- το Syside είναι text-first με ισχυρό έλεγχο, επί πληρωμή·
- τα Spec42 και OMG Pilot είναι δωρεάν ελεγκτές.

Η βιομηχανική πρακτική του 2026 (SEI) είναι κείμενο SysML v2 σε git, με language-aware έλεγχο σε CI.

**Τι εξετάστηκε (21):** OMG SysML 2.0 + KerML 1.0 + Systems Modeling API & Services 1.0 *(production)* · KerML 1.1 Beta 2 / SysML 2.1 Beta 2 (αναθεωρήσεις υπό εξέλιξη) *(pilot)* · Eclipse SysON v2026.x (Obeo + CEA, EPL-2.0) *(pilot)* · mcp-syson 0.8.7 (Casys AI, MIT, 05-09-2026) *(pilot)* · OMG SysML v2 Pilot Implementation *(pilot)* · SysML v2 API Services (reference, PoC) *(research-prototype)* · OpenMBEE Flexo MMS SysML v2 (+ Flexo MCP) *(pilot)* · Syside (Sensmetry): Editor / Modeler / Automator *(production)* · Sysand (package manager SysML v2/KerML) *(pilot)* · CATIA Magic / Cameo SysML v2 (2026x) + Teamwork Cloud *(production)* · IBM Rhapsody Systems Engineering 1.5 / 1.8 *(production)* · PySAM (ansys-sam-sysml2) *(pilot)* · Tom Sawyer SysML v2 Viewer 2.1 *(production)* · Ανεξάρτητοι parsers: MontiCore sysmlv2, sysml-v2-lsp *(research-prototype)* · SEI/CMU: Native AI integration for MBSE (3 layers) *(pilot)* · Έρευνα LLM → SysML v2 *(research-prototype)* · Textual vs JSON interchange (element IDs) *(production)* · Capella/Arcadia ↔ SysML v2 *(research-prototype)* · Structurizr (C4 models as code) *(production)* · Άλλοι SysML v2 MCP servers και Gaphor *(research-prototype)* · Git signed commits/tags *(production)*

→ Περιγραφή, σημασία για το GRAIL και πηγές: [sota/PLT.md](sota/PLT.md)
