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


---

# World OS / πυρήνας — υπόστρωμα — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### C2SP tlog-tiles / tlog-checkpoint / tlog-cosignature / tlog-witness

*standard, production* · SOTA-KSUB-01

Στατικό HTTP API tiles για transparency logs. Όλες οι Merkle πράξεις γίνονται κατά RFC 6962, με μόνο SHA-256, και ο client υπολογίζει μόνος τα inclusion/consistency proofs από cacheable tiles. Checkpoint είναι ένα signed note (origin, size, root) που δέχεται πολλαπλές υπογραφές, με τις άγνωστες να αγνοούνται. Για τον log προβλέπεται SHOULD Ed25519, αλλά επιτρέπεται και άλλος note αλγόριθμος. Η cosignature v1.0.1 (28/3/2026) είναι μόνο Ed25519· το v1.1.0-rc.1 (23/4/2026) προσθέτει ML-DSA-44 ως SHOULD για νέες εγκαταστάσεις. Ο witness (v1.0.0, 31/3/2026) κρατά μόνο το τελευταίο επαληθευμένο checkpoint ανά log και συνυπογράφει μόνο μετά από έγκυρο consistency proof. Ο μηχανισμός ανάκτησης από monitors κατά του split-view είναι «still under discussion».

**Για το GRAIL:** Υποψήφιο προφίλ για τα proofs, τα checkpoints και το witnessing του CMP-KRN-01/ICD-01 και του REQ-KRN-002.

**Πηγές:** [C2SP tlog-tiles, 2026](https://c2sp.org/tlog-tiles) · [C2SP tlog-checkpoint, 2026](https://c2sp.org/tlog-checkpoint) · [C2SP tlog-cosignature (v1.0.1), 2026](https://c2sp.org/tlog-cosignature) · [C2SP tlog-cosignature v1.1.0-rc.1 (ML-DSA-44), 2026](https://github.com/C2SP/C2SP/blob/tlog-cosignature/v1.1.0-rc.1/tlog-cosignature.md) · [C2SP tlog-witness, 2026](https://c2sp.org/tlog-witness) · [C2SP tags, 2026](https://github.com/C2SP/C2SP/tags)

### Tessera (transparency-dev) + Sigstore Rekor v2

*tool, production* · SOTA-KSUB-02

Go βιβλιοθήκη για tile-based logs, «logical successor» του Trillian v1. Η v1.0.0 κυκλοφόρησε στις 22/9/2025, ενώ το README τη δηλώνει production ready ήδη από το v0.2.0 beta. Έχει drivers POSIX, AWS και GCP, antispam, σύγχρονη δημοσίευση μέσω PublicationAwaiter και C2SP tlog-witness με witness policies. Το Trillian δηλώνει maintenance mode και συστήνει Tessera σε νέους operators. Το Rekor v2 έγινε GA στις 10/10/2025 με tile-backed backend Tessera και public-good instance με 99.5% SLO. Στις 28/6/2026 όμως το Sigstore δήλωσε ότι το sigstore.dev κρατά το Rekor v1 ως default «for the foreseeable future», λόγω breaking changes στους clients και της επερχόμενης PQC μετάβασης.

**Για το GRAIL:** Αποδεδειγμένη υλοποίηση του προφίλ C2SP, με sovereign POSIX backend (EP-05). Η απόφαση του Sigstore δείχνει ότι η PQ μετάβαση των tlogs θεωρείται ακόμη ανοιχτή.

**Πηγές:** [transparency-dev/tessera, 2026](https://github.com/transparency-dev/tessera) · [Tessera v1.0.0 release (GitHub API), 2025](https://api.github.com/repos/transparency-dev/tessera/releases/tags/v1.0.0) · [google/trillian README (maintenance mode), 2026](https://github.com/google/trillian) · [sigstore/rekor-tiles README, 2025](https://raw.githubusercontent.com/sigstore/rekor-tiles/main/README.md) · [Rekor v2 GA, 2025](https://blog.sigstore.dev/rekor-v2-ga/) · [sigstore.dev and Rekor evolution, 2026](https://blog.sigstore.dev/rekor-evolution/)

### RFC 9162 (CT 2.0) — καθεστώς

*standard, production* · SOTA-KSUB-03

Experimental RFC του 2021 που κάνει obsolete το RFC 6962. Εισάγει IANA registry hash algorithms, με τον αλγόριθμο ως αμετάβλητη παράμετρο κάθε log. Το Static CT API κρατά το write path του RFC 6962, αντικαθιστά το read path με tiles και δεν αναφέρει το RFC 9162.

**Για το GRAIL:** Το πρόχειρο βασίζει τα proofs στο RFC 9162. Η ευελιξία του είναι ευελιξία ανά log, όχι μέσα στο ίδιο log, άρα το trade-off έναντι των tiles είναι στενότερο απ' όσο φαίνεται.

**Πηγές:** [RFC 9162 info page, 2021](https://www.rfc-editor.org/info/rfc9162) · [RFC 9162 text, 2021](https://www.rfc-editor.org/rfc/rfc9162) · [C2SP Static CT API, 2026](https://c2sp.org/static-ct-api)

### Witness Network / Sigsum

*system, pilot* · SOTA-KSUB-04

Το Witness Network είναι κοινοτική υπηρεσία που τηρεί λίστες εγκεκριμένων logs και witnesses πάνω στο C2SP tlog-witness και δηλώνει «experimental / work-in-progress». Το Sigsum είναι σύστημα διαφάνειας υπογραφών με threshold witnesses. Καμία από τις δύο σελίδες δεν έχει ημερομηνία.

**Για το GRAIL:** Προσφέρει ανεξάρτητους witnesses (SH-11) χωρίς bespoke «witness gossip». Η ωριμότητά του είναι χαμηλή.

**Πηγές:** [Witness Network, 2026](https://witness-network.org/) · [Sigsum, 2026](https://www.sigsum.org/)

### AT Protocol repositories + DASL/DRISL

*system, production* · SOTA-KSUB-05

Ένα repository ανά account, με signed commits, Merkle Search Tree (SHA-256, fanout 4), CID links και κωδικοποίηση DRISL CBOR. Τα signing keys είναι rotatable μέσω του DID document, και το repo εξάγεται σε CAR v1. Το DASL είναι αυστηρό υποσύνολο IPFS CIDs/IPLD· το DRISL είναι deterministic CBOR profile. Στηρίζει τον γράφο του Bluesky.

**Για το GRAIL:** Αποδεικνύει σε μεγάλη κλίμακα το μοτίβο «υπογεγραμμένη, content-addressed ιστορία ανά ταυτότητα με έναν συγγραφέα». Είναι άμεσο ανάλογο των KRN-01/02 και του INV-I04.

**Πηγές:** [AT Protocol Repository spec, 2026](https://atproto.com/specs/repository) · [DASL, 2026](https://dasl.ing/)

### CIDv1 (multicodec + multihash)

*standard, production* · SOTA-KSUB-06

Αυτο-περιγραφόμενη διεύθυνση <version><content-type multicodec><multihash>, με εκδόσεις ώστε η ίδια η μορφή να εξελίσσεται. Στον πίνακα multicodec το raw έχει code 0x55 (permanent) και το json-jcs code 0xb601 (draft).

**Για το GRAIL:** Προσθέτει την ετικέτα codec/canonicalization που λείπει από το {alg, digest} του ICD-02, και υπάρχει ήδη code για JCS.

**Πηγές:** [multiformats/cid, 2026](https://github.com/multiformats/cid) · [multicodec table.csv, 2026](https://raw.githubusercontent.com/multiformats/multicodec/master/table.csv)

### Deterministic serializations: RFC 8785 JCS, CBOR CDE, dCBOR

*standard, pilot* · SOTA-KSUB-07

Το JCS είναι Informational RFC (2020). Απαιτεί I-JSON και σειριοποιεί αριθμούς κατά ECMAScript· τα binary δεδομένα μόνο ως JSON strings (π.χ. Base64). Το CBOR CDE (draft-ietf-cbor-cde-13, 13/10/2025, intended BCP) είναι σήμερα Expired. Το dCBOR (draft-mcnally-deterministic-cbor-18, 10/8/2026) είναι ατομικό draft χωρίς IETF stream.

**Για το GRAIL:** Κανένα deterministic CBOR δεν είναι RFC. Το JCS επαρκεί για JSON, όχι για blobs.

**Πηγές:** [RFC 8785, 2020](https://www.rfc-editor.org/rfc/rfc8785) · [draft-ietf-cbor-cde, 2025](https://datatracker.ietf.org/doc/draft-ietf-cbor-cde/) · [draft-mcnally-deterministic-cbor, 2026](https://datatracker.ietf.org/doc/draft-mcnally-deterministic-cbor/)

### Hybrid Logical Clocks (Kulkarni, Demirbas et al.)

*research, production* · SOTA-KSUB-08

Το HLC διατηρεί την ιδιότητα e hb f ⇒ l.e < l.f, με \|l.e − pt.e\| φραγμένο και χώρο O(1). Χωρά στο 64-bit NTP timestamp και ανέχεται τα NTP kinks. Το CockroachDB υλοποιεί HLC· όταν ένας κόμβος διαπιστώσει ότι απέχει από τουλάχιστον τους μισούς κόμβους κατά 80% του μέγιστου offset, τερματίζεται αμέσως.

**Για το GRAIL:** Επιβεβαιώνει το ADR-0017 και δίνει συγκεκριμένη πολιτική για παραβίαση του ε (KT-21).

**Πηγές:** [Logical Physical Clocks and Consistent Snapshots in Globally Distributed Databases (tech report 2014-04), 2014](https://cse.buffalo.edu/tech-reports/2014-04.pdf) · [Murat Demirbas: Hybrid Logical Clocks, 2014](https://muratbuffalo.blogspot.com/2014/07/hybrid-logical-clocks.html) · [CockroachDB transaction layer (HLC, max offset), 2026](https://docs.cockroachlabs.com/docs/stable/architecture/transaction-layer) · [CockroachDB: Living without atomic clocks, 2022](https://www.cockroachlabs.com/blog/living-without-atomic-clocks/)

### Αυθεντικοποιημένος και νομικός χρόνος: NTS (RFC 8915), Roughtime, RFC 3161, eIDAS Art. 41

*standard, production* · SOTA-KSUB-09

Το NTS (Standards Track, 2020) δίνει αυθεντικοποίηση, anti-replay και TLS 1.3 key establishment στο NTP. Το Roughtime (draft-ietf-ntp-roughtime-19, 17/3/2026) βρίσκεται στο RFC Editor queue ως Experimental και επιτρέπει proofs of malfeasance. Το RFC 3161 (2001, ενημερωμένο από το RFC 5816) δίνει proof-of-existence από TSA. Το eIDAS (910/2014) Art. 41 δίνει τεκμήριο ακρίβειας μόνο στις qualified electronic time stamps από QTSP.

**Για το GRAIL:** Κλείνει το κενό του προχείρου, όπου το ε του HLC στηρίζεται σε μη αυθεντικοποιημένο NTP. Προσθέτει νομικό τεκμήριο στις χρονοσφραγίδες του LAWMAX.

**Πηγές:** [RFC 8915, 2020](https://www.rfc-editor.org/rfc/rfc8915) · [draft-ietf-ntp-roughtime, 2026](https://datatracker.ietf.org/doc/draft-ietf-ntp-roughtime/) · [RFC 3161, 2001](https://www.rfc-editor.org/rfc/rfc3161) · [Regulation (EU) 910/2014 (eIDAS), 2014](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910)

### Bitemporal stores: XTDB v2, PostgreSQL 18

*system, production* · SOTA-KSUB-10

Το XTDB v2 είναι immutable SQL database με bitemporal λειτουργίες κατά SQL:2011, άδεια MPL 2.0, GA από τις 5/6/2025. Το PostgreSQL 18 (25/9/2025) προσθέτει PRIMARY KEY/UNIQUE WITHOUT OVERLAPS, foreign keys με PERIOD και uuidv7().

**Για το GRAIL:** Υποψήφιες μηχανές για παράγωγες διτεμπορικές προβολές (ADR-0015, EP-05), όχι για την αλήθεια.

**Πηγές:** [XTDB docs, 2026](https://docs.xtdb.com/) · [XTDB blog: Launching XTDB v2, 2025](https://xtdb.com/blog) · [PostgreSQL 18 release notes, 2025](https://www.postgresql.org/docs/18/release-18.html)

### Durable execution: Temporal, Restate, DBOS

*system, production* · SOTA-KSUB-11

Temporal: ντετερμινιστικός workflow code με replay του Event History· χρόνος και τυχαιότητα μόνο μέσω SDK APIs· αλλαγές κώδικα με Worker Versioning ή patching. Restate: journal κάθε βήματος, virtual objects με single-writer, idempotency keys, και immutable deployments όπου κάθε invocation μένει pinned στην έκδοση όπου ξεκίνησε. DBOS: versioning ώστε τα workflows να ανακάμπτουν μόνο σε συμβατό κώδικα. Το paper του DBOS (PVLDB 2022) προτείνει distributed transactional DBMS ως βάση cluster OS και επισημαίνει ότι το provenance απουσιάζει από τα σημερινά OS.

**Για το GRAIL:** Είναι η βιομηχανική μορφή του INV-C08. Δείχνει ότι το replay χρειάζεται pinning της έκδοσης κώδικα, που λείπει από το πρόχειρο.

**Πηγές:** [Temporal workflow definition, 2026](https://docs.temporal.io/workflow-definition) · [Restate durable execution, 2026](https://docs.restate.dev/concepts/durable_execution) · [Restate versioning, 2026](https://docs.restate.dev/operate/versioning) · [DBOS architecture (versioning), 2026](https://docs.dbos.dev/architecture) · [DBOS: A DBMS-oriented Operating System, 2022](https://www.vldb.org/pvldb/vol15/p21-skiadopoulos.pdf)

### Deterministic simulation testing: FoundationDB, TigerBeetle VOPR, Antithesis

*tool, production* · SOTA-KSUB-12

Ολόκληρο το cluster εκτελείται σε μία ντετερμινιστική διεργασία με fault injection σε δίκτυο, δίσκο και μηχανές. Στο VOPR τα clock, network και disk είναι stubs, και κάθε bug αναπαράγεται από το seed μαζί με το commit hash. Το Antithesis προσφέρει deterministic simulation για κατανεμημένα συστήματα.

**Για το GRAIL:** Στηρίζει το OPS-02 και την εκτέλεση των KT-21/KT-22 σε DST πριν από τον κώδικα.

**Πηγές:** [FoundationDB Simulation and Testing, 2026](https://apple.github.io/foundationdb/testing.html) · [TigerBeetle VOPR, 2026](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/internals/vopr.md) · [Antithesis docs, 2026](https://antithesis.com/docs/)

### Consensus replication: Raft, Viewstamped Replication (TigerBeetle)

*research, production* · SOTA-KSUB-13

Replicated log με commit πλειοψηφίας, ώστε κανένας κόμβος να μην εφαρμόσει διαφορετική εντολή στην ίδια θέση. Το TigerBeetle χρησιμοποιεί Viewstamped Replication, υποθέτει ότι ο δίσκος θα αστοχήσει, κρατά checksummed και hash-chained δεδομένα και σταματά με ασφάλεια (safe halt) αντί για σιωπηλή απώλεια.

**Για το GRAIL:** Αποδεδειγμένος μηχανισμός για RPO 0 και HA ενός single-writer journal. Το πρόχειρο δεν τον ορίζει.

**Πηγές:** [Raft, 2026](https://raft.github.io/) · [TigerBeetle safety, 2026](https://docs.tigerbeetle.com/concepts/safety/)

### Wasm Component Model: WASI 0.3, Wasm 3.0 DET profile, Wasmtime LTS, wRPC

*standard, production* · SOTA-KSUB-14

Το WASI 0.2.0 κυκλοφόρησε τον Ιανουάριο 2024, με patches έως 0.2.12. Το 0.3.0 (11/6/2026) προσθέτει native async (async func, stream, future) και ακολούθησε το 0.3.1 (11/8/2026)· υλοποιείται στο Wasmtime 46+. Το WIT ορίζει packages με semver, worlds, interfaces και resources/handles. Το Wasm 3.0 DET profile ορίζει canonical NaN και fixed relaxed SIMD, αλλά τα memory.grow/table.grow μένουν μη ντετερμινιστικά. Το Wasmtime βγάζει μηνιαία major έκδοση, με LTS κάθε 12η και υποστήριξη 24 μηνών· τελευταία είναι η v48.0.2 (10/9/2026). Το wRPC μεταφέρει WIT πάνω από δίκτυο, με bindings Rust/Go και transports TCP, QUIC, WebTransport, WebSockets και Unix sockets.

**Για το GRAIL:** Βάση του ICD-10/EP-02. Δίνει ορισμό για το «deterministic mode» και ενιαίο IDL για τοπικά και απομακρυσμένα organs.

**Πηγές:** [WASI roadmap, 2026](https://wasi.dev/roadmap) · [WebAssembly/WASI, 2026](https://github.com/WebAssembly/WASI) · [Wasm 3.0 profiles, 2026](https://webassembly.github.io/spec/core/appendix/profiles.html) · [Wasmtime stability & release, 2026](https://docs.wasmtime.dev/stability-release.html) · [Wasmtime releases, 2026](https://github.com/bytecodealliance/wasmtime/releases) · [WIT, 2026](https://component-model.bytecodealliance.org/design/wit.html) · [wRPC README, 2026](https://raw.githubusercontent.com/bytecodealliance/wrpc/main/README.md)

### Sandboxes: Firecracker, Hyperlight, gVisor

*tool, production* · SOTA-KSUB-15

Το Firecracker είναι KVM microVM με minimal device model και jailer, και στηρίζει τα Lambda και Fargate. Το vsock του μεσολαβεί AF_UNIX στον host και AF_VSOCK στον guest, ως κανάλι ανεξάρτητο από network interface. Το Hyperlight είναι micro-VM χωρίς kernel ή OS, με guests ELF σε no_std Rust ή C· είναι CNCF sandbox, pre-1.0, με hyperlight-wasm. Το gVisor είναι application kernel σε userspace (Sentry), με αντάλλαγμα μειωμένη συμβατότητα και υψηλότερο κόστος ανά syscall.

**Για το GRAIL:** Επιλογές για το CMP-KRN-12. Το Hyperlight ταιριάζει σε Wasm ή no_std organs, όχι σε SBCL image.

**Πηγές:** [Firecracker, 2026](https://github.com/firecracker-microvm/firecracker) · [Firecracker vsock, 2026](https://github.com/firecracker-microvm/firecracker/blob/main/docs/vsock.md) · [Hyperlight, 2026](https://github.com/hyperlight-dev/hyperlight) · [gVisor docs, 2026](https://gvisor.dev/docs/)

### Capability microkernels & hardware: seL4 (+MCS), LionsOS, Genode, Zircon, CHERI

*system, production* · SOTA-KSUB-16

Το seL4 έχει formal verification, και οι security proofs ολοκληρώθηκαν σε AArch64 (ανακοίνωση 24/8/2026). Τα MCS scheduling contexts επιβάλλουν budget/period με sporadic server για temporal isolation. Το LionsOS (v0.4.0) πάνω σε seL4 δεν έχει ακόμη «concrete verification story». Το Genode είναι framework ειδικών OS με αναδρομικό sandbox model, πάνω σε seL4, NOVA, Fiasco.OC, Linux κ.ά. Τα Zircon handles φέρουν rights, μεταφέρονται ρητά μέσω channels, και δεν υπάρχει πρόσβαση χωρίς handle. Η CHERI Alliance έχει 50+ μέλη.

**Για το GRAIL:** Αφορά το κατώτερο όριο του TCB (ADR-0004), το EP-03 και το «capability hardware» του EP-02, και δίνει πρότυπο budgets για το ICD-11.

**Πηγές:** [seL4 About, 2026](https://sel4.systems/About/) · [seL4 MCS tutorial, 2026](https://docs.sel4.systems/Tutorials/mcs.html) · [LionsOS, 2026](https://lionsos.org/) · [Genode, 2026](https://genode.org/about/index) · [Zircon handles, 2026](https://fuchsia.dev/fuchsia-src/concepts/kernel/handles) · [CHERI Alliance, 2026](https://cheri-alliance.org/)

### Rust OS / verified Rust: Asterinas, Theseus, Verus

*research, research-prototype* · SOTA-KSUB-17

Το Asterinas είναι framekernel: το unsafe Rust περιορίζεται στο OSTD, υποστηρίζει 230+ Linux syscalls, είχε δύο papers στο USENIX ATC 2025 και τελευταία έκδοση την 0.18.1 (1/9/2026). Το Theseus είναι ερευνητικό Rust OS, «not yet mature», με στόχο live evolution και fault recovery. Το Verus επαληθεύει στατικά προδιαγραφές σε Rust και είναι σε ενεργή ανάπτυξη.

**Για το GRAIL:** Τεκμηριώνει ότι η ζωντανή αντικατάσταση kernel components (REQ-ABS-002) μένει έρευνα. Δίνει δρόμο για επαλήθευση Rust TCB.

**Πηγές:** [Asterinas, 2026](https://github.com/asterinas/asterinas) · [Theseus OS, 2026](https://github.com/theseus-os/Theseus) · [Verus, 2026](https://github.com/verus-lang/verus)

### Supervision runtimes: Erlang/OTP 29, Apache Pekko, Orleans, Ray

*system, production* · SOTA-KSUB-18

OTP: supervisors με στρατηγικές one_for_one, one_for_all, rest_for_one και simple_one_for_one, και restart intensity/period (προεπιλογή 1 ανά 5s)· η OTP 29.0 κυκλοφόρησε στις 13/5/2026. Pekko: fork του Akka 2.6.x πριν το Akka περάσει σε BSL. Orleans: virtual actors με αυτόματη activation, placement και grain versioning. Ray: η κατάσταση του actor χάνεται στο restart (ξανατρέχει ο constructor), με max_restarts· ισχύει owner fate-sharing, όχι supervision trees με στρατηγικές.

**Για το GRAIL:** Στηρίζει το ADR-0013 και ορίζει τα σκέλη του EXP-06.

**Πηγές:** [Erlang/OTP news, 2026](https://www.erlang.org/news) · [OTP supervisor principles, 2026](https://www.erlang.org/doc/system/sup_princ.html) · [Apache Pekko, 2026](https://pekko.apache.org/) · [Orleans overview, 2026](https://learn.microsoft.com/en-us/dotnet/orleans/overview) · [Ray actor fault tolerance, 2026](https://docs.ray.io/en/latest/ray-core/fault_tolerance/actors.html)

### Event transport: NATS JetStream 2.14, Apache Kafka 4.x

*system, production* · SOTA-KSUB-19

Το NATS 2.14 (30/4/2026) προσθέτει high-throughput publishing σε JetStream· από το 2.12 (22/9/2025) ο κύκλος εκδόσεων είναι 6μηνος. Το 2025 η Synadia επιχείρησε έξοδο του NATS από το CNCF και μετάβαση σε BUSL· η διαφορά λύθηκε με παραμονή στο CNCF (1/5/2025). Το Kafka 4.0 (18/3/2025) λειτουργεί χωρίς ZooKeeper, με KIP-848 GA και KIP-932 σε early access. Ακολούθησαν η 4.3.0 (22/5/2026) και η 4.3.1 (25/6/2026).

**Για το GRAIL:** Αφορά το ADR-0014/EP-06. Ο κίνδυνος διακυβέρνησης και άδειας είναι πραγματικός, αλλά το «transport ≠ truth» τον περιορίζει.

**Πηγές:** [NATS blog, 2026](https://nats.io/blog/) · [CNCF: Protecting NATS, 2025](https://www.cncf.io/blog/2025/05/01/protecting-nats-and-the-integrity-of-open-source-cncfs-commitment-to-the-community/) · [Apache Kafka 4.0.0 announcement, 2025](https://kafka.apache.org/blog/2025/03/18/apache-kafka-4.0.0-release-announcement/) · [Apache Kafka blog, 2026](https://kafka.apache.org/blog)

### AI agent OS: AIOS, MemGPT

*research, research-prototype* · SOTA-KSUB-20

Το AIOS (COLM 2025, αναθεώρηση 12/8/2025) βάζει σε «AIOS kernel» scheduling, context, memory, storage και access control για LLM agents και αναφέρει έως 2.1x ταχύτερη εκτέλεση. Το MemGPT (2023) εφαρμόζει virtual context management κατά το πρότυπο της ιεραρχίας μνήμης των OS.

**Για το GRAIL:** Είναι η αντίθετη σχολή από το ADR-0004. Χρήσιμο ως πρότυπο scheduling και context για το COG-01, όχι για TCB.

**Πηγές:** [AIOS: LLM Agent Operating System, 2025](https://arxiv.org/abs/2403.16971) · [MemGPT: Towards LLMs as Operating Systems, 2023](https://arxiv.org/abs/2310.08560)

### Observability: OpenTelemetry GenAI semconv, W3C Trace Context

*standard, pilot* · SOTA-KSUB-21

Οι GenAI spans (inference, embeddings, execute_tool, invoke_agent) είναι σε Development στη v1.37.0. Οι instrumentations που ήταν σε v1.36.0 ή παλαιότερη κάνουν opt-in με OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental. Οι συμβάσεις μεταφέρθηκαν στο semantic-conventions-genai, που καλύπτει και MCP. Το W3C Trace Context είναι Recommendation (23/11/2021).

**Για το GRAIL:** Αφορά το ICD-24/OPS-04: correlation traceparent ↔ event_cid, με τα ασταθή GenAI attributes πίσω από adapter.

**Πηγές:** [OTel GenAI semconv (moved notice), 2026](https://opentelemetry.io/docs/specs/semconv/gen-ai/) · [semantic-conventions-genai, 2026](https://github.com/open-telemetry/semantic-conventions-genai) · [GenAI spans v1.37.0, 2025](https://github.com/open-telemetry/semantic-conventions/blob/v1.37.0/docs/gen-ai/gen-ai-spans.md) · [W3C Trace Context, 2021](https://www.w3.org/TR/trace-context/)

### Reproducible builds & supply chain: Nix, Guix full-source bootstrap, SLSA 1.2

*tool, production* · SOTA-KSUB-22

Μελέτη του MSR 2025 σε 709.816 πακέτα του nixpkgs (2017–2023) μέτρησε bitwise reproducibility 69–91% με ανοδική τάση και rebuildability πάνω από 99%. Το Guix (26/4/2023) χτίζει γράφο 22.000+ κόμβων από seed 357 bytes. Το SLSA 1.1 έχει αποσυρθεί· η 1.2 είναι Approved και προσθέτει Source track.

**Για το GRAIL:** Αφορά το ADR-0029/OPS-01: το Nix είναι τεκμηριωμένο, και το full-source bootstrap είναι ισχυρότερο για artifacts του TCB.

**Πηγές:** [Does Functional Package Management Enable Reproducible Builds at Scale? Yes, 2025](https://arxiv.org/abs/2501.15919) · [Guix full-source bootstrap, 2023](https://guix.gnu.org/en/blog/2023/the-full-source-bootstrap-building-from-source-all-the-way-down/) · [SLSA v1.1 (Retired), 2026](https://slsa.dev/spec/v1.1/) · [SLSA v1.2, 2026](https://slsa.dev/spec/v1.2/)

### Contract IDLs & tooling: OpenAPI 3.2, AsyncAPI 3.1, Protobuf Editions 2024, JSON Schema 2020-12, TypeSpec, Buf

*standard, production* · SOTA-KSUB-23

Το OpenAPI 3.2.0 (19/9/2025) προσθέτει sequential/streaming media types (και SSE), QUERY και webhooks. Το AsyncAPI είναι στην 3.1.0 με NATS bindings. Τα Protobuf Editions αντικαθιστούν τα proto2/proto3, με τελευταία την 2024. Το JSON Schema 2020-12 παραμένει τρέχον. Το TypeSpec έχει emitters για OpenAPI3 και JSON Schema· Protobuf/WIT δεν επαληθεύτηκαν. Το Buf ελέγχει breaking changes σε επίπεδα FILE, PACKAGE, WIRE_JSON και WIRE.

**Για το GRAIL:** Αφορά το ADR-0025/REQ-INT-001: επικαιροποίηση εκδόσεων και κανόνας παραγωγής των bindings από τη μία έδρα.

**Πηγές:** [OpenAPI 3.2.0, 2025](https://spec.openapis.org/oas/v3.2.0.html) · [AsyncAPI latest, 2026](https://www.asyncapi.com/docs/reference/specification/latest) · [Protobuf Editions, 2026](https://protobuf.dev/editions/overview/) · [JSON Schema specification, 2026](https://json-schema.org/specification) · [TypeSpec docs, 2026](https://typespec.io/docs/) · [Buf breaking, 2026](https://buf.build/docs/breaking/)

### Verification-guided development (Cedar) και όρια του N-version

*research, production* · SOTA-KSUB-24

Στο Cedar, ένα εκτελέσιμο Lean model αποδείχθηκε και συγκρίθηκε με την Rust υλοποίηση με differential random testing: 4 bugs βρέθηκαν μέσω proofs και 21 μέσω DRT/PBT. Οι Knight & Leveson (IEEE TSE 12(1), 1986) απέρριψαν στατιστικά την ανεξαρτησία αστοχιών στο N-version programming (δευτερογενής πηγή).

**Για το GRAIL:** Το N-version του προχείρου ανιχνεύει διαφωνίες αλλά δεν εγγυάται ορθότητα όταν οι εκδόσεις συμφωνούν. Χρειάζεται VGD.

**Πηγές:** [How We Built Cedar: A Verification-Guided Approach, 2024](https://arxiv.org/abs/2407.01688) · [N-version programming (Knight & Leveson 1986 citation), 2026](https://en.wikipedia.org/wiki/N-version_programming)

### RFC 9170 — Long-term viability of protocol extension mechanisms

*standard, production* · SOTA-KSUB-25

Informational RFC του IAB (2021): «Mechanisms that aren't used are the ones that fail most often». Συστήνει ενεργή χρήση των μηχανισμών επέκτασης, GREASE και ρητή τεκμηρίωση των invariants.

**Για το GRAIL:** Κατ' αναλογία για το §28: EPs που δεν ασκούνται κινδυνεύουν να απολιθωθούν.

**Πηγές:** [RFC 9170, 2021](https://www.rfc-editor.org/rfc/rfc9170)

### Leases & fencing tokens

*research, production* · SOTA-KSUB-26

Ένα lease χωρίς fencing token δεν είναι ασφαλές απέναντι σε GC pauses και καθυστερήσεις. Η λύση είναι μονότονο token που ο πόρος ελέγχει και με το οποίο απορρίπτει παλαιότερα tokens.

**Για το GRAIL:** Για τη μοναδικότητα body του ICD-12/INV-I04, ο έλεγχος πρέπει να γίνεται στο ledger.

**Πηγές:** [Kleppmann: How to do distributed locking, 2016](https://martin.kleppmann.com/2016/02/08/how-to-do-distributed-locking.html)

### AWS ClockBound

*tool, pilot* · SOTA-KSUB-27

Daemon και client library που δίνουν Clock Error Bound ως ζεύγος (earliest, latest), από NTP, PTP Hardware Clock ή VMClock. Διατίθεται ως Rust crate και C FFI.

**Για το GRAIL:** Κάνει μετρήσιμο το ε του HLC (GAP-KSUB-06). Η έκταση χρήσης εκτός AWS δεν επαληθεύτηκε.

**Πηγές:** [aws/clock-bound, 2026](https://github.com/aws/clock-bound)

### EDPB Guidelines 02/2025 (blockchain και προσωπικά δεδομένα)

*standard, pilot* · SOTA-KSUB-28

Έκδοση 1.1 για δημόσια διαβούλευση (υιοθέτηση 8/4/2025, διαβούλευση έως 9/6/2025). Κρίνει μη ενδεδειγμένη την εγγραφή προσωπικών δεδομένων σε clear, encrypted ή hashed μορφή σε blockchain· αυτά πρέπει να φυλάσσονται off-chain. Ως μέτρα προτείνει salted ή keyed hash με salt/κλειδί off-chain, και perfectly hiding commitments που γίνονται άχρηστα μόλις διαγραφούν τα δεδομένα και ο witness. Απαιτεί DPIA και erasure by design.

**Για το GRAIL:** Άμεσο για append-only ledger και CAS με προσωπικά δεδομένα (KT-16, REQ-MEM-002, ShredEnvelope).

**Πηγές:** [EDPB Guidelines 02/2025 v1.1 (PDF), 2025](https://www.edpb.europa.eu/system/files/2025-04/edpb_guidelines_202502_blockchain_en.pdf) · [EDPB adopts guidelines on blockchains, 2025](https://www.edpb.europa.eu/news/news/2025/edpb-adopts-guidelines-processing-personal-data-through-blockchains-and-ready_en) · [EDPB Guidelines 02/2025 consultation page, 2025](https://www.edpb.europa.eu/our-work-tools/documents/public-consultations/2025/guidelines-022025-processing-personal-data_en)


---

# World OS / πυρήνας — εκτελέσιμο σύνταγμα, capabilities, controls — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### Cedar + verification-guided development

*system, production* · SOTA-KGOV-01

Γλώσσα εξουσιοδότησης σε Rust. Αποδεδειγμένα σε Lean: ικανοποιημένο forbid ⇒ deny· allow μόνο με explicit permit· αλλιώς default deny· ανεξαρτησία από σειρά και διπλότυπα· sound type checking (validation)· sound slicing· sound και complete symbolic compilation. VGD: εκτελέσιμο μοντέλο σε Lean και DRT/PBT έναντι της Rust υλοποίησης. Οι αποδείξεις βρήκαν 4 bugs στον validator και το DRT/PBT άλλα 21 σε διάφορα μέρη του Cedar. Σε παραγωγή στο Amazon Verified Permissions (Cedar 4.7). CNCF Sandbox από 2025-10-08.

**Για το GRAIL:** Είναι το ίδιο το «Cedar-class» του ADR-0010 και πρότυπο μεθοδολογίας για το reference του KRN-06: αποδεδειγμένο spec με DRT έναντι της υλοποίησης.

**Πηγές:** [How We Built Cedar: A Verification-Guided Approach, 2024](https://arxiv.org/abs/2407.01688) · [Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization, 2024](https://arxiv.org/abs/2403.04651) · [cedar-spec / cedar-lean (proven properties), 2026](https://github.com/cedar-policy/cedar-spec/tree/main/cedar-lean) · [What is Amazon Verified Permissions, 2026](https://docs.aws.amazon.com/verifiedpermissions/latest/userguide/what-is-avp.html) · [CNCF project: Cedar, 2025](https://www.cncf.io/projects/cedar/)

### Cedar Analysis (SymCC) και Zelkova

*tool, production* · SOTA-KGOV-02

Cedar Analysis (2025-06-16): Cedar Symbolic Compiler γραμμένος σε Lean, με soundness και completeness, πάνω σε SMT solvers (π.χ. CVC5). Το CLI ελέγχει ισοδυναμία, σχέση permissiveness, shadowed permits, αδύνατες συνθήκες, forbid overrides και complete denials. Προηγούμενο σε παραγωγή: Zelkova (FMCAD 2018), SMT κωδικοποίηση των πολιτικών AWS· κατά το paper καλείται εκατομμύρια φορές ημερησίως.

**Για το GRAIL:** Κάνει μηχανικά ελέγξιμο ότι μια αναθεώρηση ή ένα νέο control μόνο στενεύει τα δικαιώματα. Βάση για τα VT-203 και VT-302 πέρα από το Alloy.

**Πηγές:** [Introducing Cedar Analysis, 2025](https://aws.amazon.com/blogs/opensource/introducing-cedar-analysis-open-source-tools-for-verifying-authorization-policies/) · [Semantic-based automated reasoning for AWS access policies using SMT, 2018](https://www.amazon.science/publications/semantic-based-automated-reasoning-for-aws-access-policies-using-smt)

### Policy in Amazon Bedrock AgentCore + Dogwood

*system, pilot* · SOTA-KGOV-03

Αναχαιτίζει όλη την κίνηση των agents μέσω των AgentCore Gateways και αξιολογεί κάθε αίτημα με ντετερμινιστικές πολιτικές Cedar πριν την πρόσβαση στο tool, έξω από τον κώδικα του agent. NL authoring→Cedar, με automated reasoning που εντοπίζει υπερβολικά επιτρεπτικές, υπερβολικά περιοριστικές ή ανέφικτες πολιτικές. Modes LOG_ONLY/ENFORCE· decision logs σε CloudWatch. Τα temporal policies γράφονται σε Dogwood (Cedar-compatible: formerly within, since within, count, sum). Το ιστορικό τους περιορίζεται σε session, με session ID που δίνει ο καλών· παράθυρο ≤24h, ≤25 temporal policies ανά engine. Προσθήκη ή αλλαγή temporal policy ακυρώνει τα ενεργά sessions. Ο ανοικτός reference interpreter του Dogwood δηλώνει ρητά ότι δεν προορίζεται για παραγωγή. Η managed υλοποίηση του AgentCore είναι άλλο πράγμα, με ανεπιβεβαίωτο καθεστώς GA.

**Για το GRAIL:** Η πλησιέστερη υπαρκτή υλοποίηση του KRN-11 + KRN-05 για agents. Δείχνει και τα όρια: η τεκμηρίωση λέει ρητά ότι ένα count-based rate limit ισχύει ανά session και μηδενίζεται με νέο session.

**Πηγές:** [Policy in Amazon Bedrock AgentCore, 2026](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/policy.html) · [Temporal policies (AgentCore), 2026](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/policy-temporal.html) · [dogwood-policy/dogwood, 2026](https://github.com/dogwood-policy/dogwood)

### AWS Service Control Policies ως guardrails

*system, production* · SOTA-KGOV-04

Τα SCPs δεν χορηγούν ποτέ δικαιώματα· ορίζουν το μέγιστο διαθέσιμο σύνολο. Τα effective permissions είναι η τομή τους (και των RCPs) με τις identity- και resource-based policies, και ένα explicit deny σε οποιοδήποτε επίπεδο αποκλείει την ενέργεια. Τα μηνύματα AccessDenied δηλώνουν τον τύπο της πολιτικής που αρνήθηκε και μόνο σε ορισμένες περιπτώσεις το ARN της· όταν αρνούνται πολλοί τύποι, αναφέρεται μόνο ένας.

**Για το GRAIL:** Προηγούμενο σε κλίμακα για το INV-C02: το control είναι εξωτερικό όριο, όχι αλλαγή ικανότητας. Και προηγούμενο κλιμακωτής ορατότητας της άρνησης.

**Πηγές:** [Service control policies (SCPs), 2026](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) · [Troubleshoot access denied error messages, 2026](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_access-denied.html)

### OPA/Rego, ReBAC (Zanzibar/OpenFGA), AuthZEN, ABAC

*standard, production* · SOTA-KGOV-05

OPA: CNCF Graduated (2021-01-29), τελευταία έκδοση v1.20.2 (2026-09-03). Τα decision logs έχουν decision_id, bundle revision και masking· η τεκμηρίωση δεν αναφέρει υπογραφή ή integrity protection. Zanzibar (USENIX ATC 2019): relation tuples, zookies (opaque timestamp για freshness), external consistency απέναντι στο new-enemy problem. OpenFGA: CNCF Incubating (2025-10-28). OpenID AuthZEN Authorization API 1.0: Final (Ιαν. 2026), για διαλειτουργικότητα PEP↔PDP. NIST SP 800-162 (2014, αναθ. 2019): ABAC.

**Για το GRAIL:** Εναλλακτικές για το KRN-05. Το AuthZEN είναι ο φυσικός εξωτερικός binding του Decide (ICD-05). Τα zookies δείχνουν πώς δένεται το Decide σε cut.

**Πηγές:** [CNCF: Open Policy Agent, 2021](https://www.cncf.io/projects/open-policy-agent-opa/) · [OPA releases, 2026](https://github.com/open-policy-agent/opa/releases) · [OPA decision logs, 2026](https://www.openpolicyagent.org/docs/management-decision-logs) · [Zanzibar: Google's Consistent, Global Authorization System, 2019](https://research.google/pubs/zanzibar-googles-consistent-global-authorization-system/) · [Zanzibar paper, annotated copy (AuthZed), 2019](https://zanzibar.tech/) · [CNCF: OpenFGA, 2025](https://www.cncf.io/projects/openfga/) · [OpenID AuthZEN WG, 2026](https://openid.net/wg/authzen/) · [NIST SP 800-162, 2019](https://csrc.nist.gov/pubs/sp/800/162/upd2/final)

### Object-capability security (seL4, WASI, Miller)

*research, production* · SOTA-KGOV-06

seL4: capability = unforgeable token που συνιστά δικαίωμα πρόσβασης σε αντικείμενο. Το Mint αντιγράφει capability ορίζοντας access rights και badge· το Revoke διαγράφει όλες τις child capabilities· ο πυρήνας έχει εκτενή τυπική επαλήθευση. WASI: ένα Wasm module/component ξεκινά χωρίς ambient authority και κάνει μόνο ό,τι του χορηγεί ρητά ο host. WASI 0.2.0 κυκλοφόρησε 2024-01-25· το WASI 0.3 έχει κυκλοφορήσει, με native async στο Component Model. Robust Composition (Miller, PhD JHU 2006): σύνθεση ανεξάρτητα γραμμένων, δυνητικά εχθρικών components (E, CapDesk).

**Για το GRAIL:** Θεμέλιο του ισχυρισμού του KRN-11 ότι η παράκαμψη δεν αναπαρίσταται. Υλοποιήσιμο σήμερα με Wasmtime/WASI.

**Πηγές:** [seL4 capabilities tutorial, 2026](https://docs.sel4.systems/Tutorials/capabilities.html) · [seL4 API reference (CNode Mint/Revoke), 2026](https://docs.sel4.systems/projects/sel4/api-doc.html) · [About seL4, 2026](https://sel4.systems/About/) · [WASI, 2026](https://wasi.dev/) · [Component Model, 2024](https://component-model.bytecodealliance.org/) · [Robust Composition (abstract), 2006](https://papers.agoric.com/papers/robust-composition/abstract/)

### Attenuable και sender-constrained capability tokens

*standard, production* · SOTA-KGOV-07

Biscuit (Eclipse, spec έως v3.3): bearer token με offline attenuation, επαλήθευση μόνο με το root public key, γλώσσα εξουσιοδότησης Datalog, third-party blocks. Macaroons (NDSS 2014): nested, chained HMACs με caveats. UCAN 1.0.0: delegation και invocation REQUIRED, revocation RECOMMENDED· κάθε delegation MUST είτε επαναλαμβάνει είτε στενεύει (attenuate) τις capabilities. SPIFFE: workload identity, CNCF Graduated 2022-08-23. DPoP (RFC 9449, 2023, Standards Track): sender-constraining με PoP. OAuth Transaction Tokens (draft-11, 2026-07-30): διάδοση user/workload identity και authorization context σε call chain εντός trust domain. MCP authorization (τρέχουσα έκδοση 2026-07-28): OAuth 2.1· RFC 8707 resource indicators και audience validation· ο server δεν δέχεται ούτε διαμετακομίζει άλλα tokens.

**Για το GRAIL:** Ορίζουν τη σημασιολογία που λείπει από το capability token του ICD-08: attenuation, delegation chain, revocation, PoP και διάδοση ανάμεσα σε όργανα.

**Πηγές:** [Biscuit docs, 2026](https://doc.biscuitsec.org/) · [Biscuit SPECIFICATIONS.md, 2026](https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md) · [Macaroons, 2014](https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/) · [UCAN spec, 2026](https://github.com/ucan-wg/spec) · [CNCF: SPIFFE, 2022](https://www.cncf.io/projects/spiffe/) · [RFC 9449 DPoP, 2023](https://www.rfc-editor.org/rfc/rfc9449.html) · [OAuth Transaction Tokens draft, 2026](https://datatracker.ietf.org/doc/draft-ietf-oauth-transaction-tokens/) · [MCP Authorization 2026-07-28, 2026](https://modelcontextprotocol.io/specification/2026-07-28/basic/authorization)

### CaMeL

*research, research-prototype* · SOTA-KGOV-08

Εξάγει ρητά τη ροή ελέγχου και δεδομένων από το έμπιστο αίτημα και την εκτελεί σε custom interpreter περιορισμένης Python. Οι capabilities είναι tags πάνω σε κάθε τιμή (provenance, επιτρεπόμενοι αναγνώστες), και οι security policies ελέγχονται σε κάθε tool call· τα untrusted δεδομένα δεν αλλάζουν τη ροή του προγράμματος. AgentDojo: 77% των εργασιών με provable security, έναντι 84% χωρίς άμυνα.

**Για το GRAIL:** Δείχνει ότι δεν αρκεί να εξουσιοδοτείται η κλήση· πρέπει να ελέγχεται και η προέλευση των ορισμάτων της επίδρασης.

**Πηγές:** [Defeating Prompt Injections by Design, 2025](https://arxiv.org/abs/2503.18813) · [Defeating Prompt Injections by Design (HTML), 2025](https://arxiv.org/html/2503.18813)

### FIDES (information-flow control για agents)

*research, research-prototype* · SOTA-KGOV-09

Planner που παρακολουθεί confidentiality και integrity labels, επιβάλλει ντετερμινιστικά IFC policies και υποστηρίζει selective hiding. Τυπικό μοντέλο: με τις policies εφαρμοσμένες σε κάθε tool, εγγυάται non-interference για την integrity των tool calls και explicit secrecy για την confidentiality (δέχεται περιορισμένη implicit διαρροή). Αξιολόγηση σε AgentDojo· όλοι οι συγγραφείς από τη Microsoft (2025).

**Για το GRAIL:** Φυσικό ταίρι για το TB-3/INV-L03: τα confidentiality domains γίνονται labels που ρέουν μέχρι το gateway.

**Πηγές:** [Securing AI Agents with Information-Flow Control, 2025](https://arxiv.org/abs/2505.23643) · [Securing AI Agents with Information-Flow Control (HTML), 2025](https://arxiv.org/html/2505.23643)

### Privilege control και runtime enforcement για agents

*research, research-prototype* · SOTA-KGOV-10

Progent (2025): τα δικαιώματα είναι symbolic rules πάνω σε tool names/args, με ντετερμινιστικό έλεγχο. Ένας SMT solver εφαρμόζει αυτόματα τις στενώσεις, ενώ οι διευρύνσεις θέλουν έγκριση (monotonic confinement). AgentSpec (ICSE 2026): DSL με triggers/predicates/enforcement και overhead της τάξης ms. Design Patterns (2025): action-selector, plan-then-execute, LLM map-reduce, dual LLM, code-then-execute, context-minimization. VIGIL (2026): policy language για temporal dependencies, argument constraints και value-flow, σε SMT πάνω σε πεπερασμένα traces· >95% recall, FPR <10%· χωρίς τυπική επαλήθευση του enforcement. Invariant Guardrails: Python-inspired matching rules για τη συμπεριφορά agents, ως proxy μεταξύ εφαρμογής και MCP/LLM. LlamaFirewall (2025): PromptGuard 2, Agent Alignment Checks, CodeShield.

**Για το GRAIL:** Το monotonic confinement είναι η μορφή κυριαρχίας του εντολέα πάνω στα δικαιώματα. Τα patterns δίνουν προφίλ οργάνων για το gateway. Το VIGIL είναι υποψήφιο για ακολουθιακά controls, αλλά χωρίς εγγύηση fail-closed.

**Πηγές:** [Progent, 2025](https://arxiv.org/abs/2504.11703) · [AgentSpec, 2025](https://arxiv.org/abs/2503.18666) · [Design Patterns for Securing LLM Agents against Prompt Injections (HTML), 2025](https://arxiv.org/html/2506.08837) · [VIGIL: Runtime Enforcement of Behavioral Specifications in AI Agent Skills, 2026](https://arxiv.org/abs/2606.26524) · [Invariant Guardrails, 2026](https://github.com/invariantlabs-ai/invariant) · [LlamaFirewall, 2025](https://arxiv.org/abs/2505.03574)

### AI Control: protocols και control evaluations

*research, pilot* · SOTA-KGOV-11

Greenblatt κ.ά. (ICML 2024): trusted editing, untrusted monitoring με anti-collusion, defer-to-trusted, αξιολογημένα απέναντι σε σκόπιμη υπονόμευση. Ctrl-Z (2025): resample protocols στο BashBench· το attack success πέφτει από 58% σε 7%, με 5% κόστος στην απόδοση μη κακόβουλου agent. ControlArena (UK AI Security Institute + Redwood Research): βιβλιοθήκη με 18 settings.

**Για το GRAIL:** Λείπει μεθοδολογία που να ελέγχει adversarially τα gate/gateway/registry απέναντι σε όργανα που συνεργάζονται.

**Πηγές:** [AI Control: Improving Safety Despite Intentional Subversion, 2024](https://arxiv.org/abs/2312.06942) · [Ctrl-Z: Controlling AI Agents via Resampling, 2025](https://arxiv.org/abs/2504.10374) · [ControlArena, 2026](https://github.com/UKGovernmentBEIS/control-arena)

### Συντάγματα μοντέλων (CAI, CCAI, Constitutional Classifiers, Model Spec)

*research, production* · SOTA-KGOV-12

Constitutional AI (2022): οι αρχές χρησιμοποιούνται ως training signal (SL + RLAIF). Collective CAI (FAccT 2024): αρχές από δημόσια συμμετοχή. Constitutional Classifiers (2025): runtime classifiers παραγόμενοι από constitution· >3.000 ώρες red teaming, +0,38% απόλυτη αύξηση refusals σε production traffic, 23,7% inference overhead. OpenAI Model Spec (2026-08-18): chain of command root > system > developer > user > guideline.

**Για το GRAIL:** Είναι πιθανοτικά «συντάγματα» συμπεριφοράς των γεννητριών, όχι εκτελέσιμα κατηγορήματα μεταβάσεων. Στο trusted path το GOV-01 είναι αυστηρότερο· οι classifiers συμπληρώνουν το TB-4.

**Πηγές:** [Constitutional AI, 2022](https://arxiv.org/abs/2212.08073) · [Collective Constitutional AI, 2024](https://arxiv.org/abs/2406.07814) · [Constitutional Classifiers, 2025](https://arxiv.org/abs/2501.18837) · [OpenAI Model Spec, 2026](https://model-spec.openai.com/2026-08-18.html)

### Γλώσσες κανόνων (Catala, LegalRuleML, ODRL, IG 2.0)

*standard, production* · SOTA-KGOV-13

Catala (ICFP 2021): γλώσσα για τη μετάφραση νόμων σε κώδικα (default logic), με τα βασικά βήματα του compiler αποδεδειγμένα σε F*· το repo του Inria το χαρακτηρίζει ερευνητικό έργο με ακόμη ασταθή compiler. LegalRuleML Core 1.0 (OASIS Standard, 2021-08-30): obligation/permission/prohibition, strict/defeasible/defeater, χρονικές διαστάσεις (entry, efficacy, applicability). ODRL 2.2 (W3C Rec, 2018-02-15): permission/prohibition/duty, conflict perm/prohibit/invalid (προεπιλογή invalid). IG 2.0 codebook (v5, 2024): regulative και constitutive statements.

**Για το GRAIL:** Ώριμες επιλογές για τη deontic και defeasible σημασιολογία των άρθρων, που λείπει από το GOV-01.

**Πηγές:** [Catala: A Programming Language for the Law, 2021](https://arxiv.org/abs/2103.03198) · [CatalaLang/catala, 2026](https://github.com/CatalaLang/catala) · [LegalRuleML Core 1.0, 2021](https://docs.oasis-open.org/legalruleml/legalruleml-core-spec/v1.0/legalruleml-core-spec-v1.0.html) · [ODRL Information Model 2.2, 2018](https://www.w3.org/TR/odrl-model/) · [Institutional Grammar 2.0 Codebook, 2024](https://arxiv.org/abs/2008.08937)

### Automated Reasoning checks (Bedrock Guardrails)

*system, production* · SOTA-KGOV-14

Εξάγει formal rules και σχήμα μεταβλητών από έγγραφο πολιτικής και παράγει fidelity report (coverage, accuracy, grounding). Επικυρώνει την έξοδο LLM (VALID/INVALID/TRANSLATION_AMBIGUOUS/TOO_COMPLEX κ.ά.) μόνο σε detect mode. Το VALID εγγυάται μόνο για ό,τι αποτυπώνεται σε μεταβλητές της πολιτικής· δεν προστατεύει από prompt injection· η μετάφραση NL→logic γίνεται με foundation models. Γενικά διαθέσιμο σε 6 regions (US/EU).

**Για το GRAIL:** Δείχνει το ρεαλιστικό όριο του «εκτελέσιμου συντάγματος» από φυσική γλώσσα και του REQ-GOV-005.

**Πηγές:** [Automated Reasoning checks in Amazon Bedrock Guardrails, 2026](https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-automated-reasoning-checks.html)

### Επαληθευμένοι MFOTL runtime monitors

*research, research-prototype* · SOTA-KGOV-15

Schneider και Traytel (AFP, 2019-07-04): monitor για metric first-order temporal logic, επαληθευμένος σε Isabelle, ως απλοποιημένη παραλλαγή του MonPoly. Η σύγκριση με τυχαίες εισόδους αποκάλυψε σφάλματα στα βελτιστοποιημένα αλλά ανεπαλήθευτα εργαλεία.

**Για το GRAIL:** Κατάλληλο για controls με χρονικές ή ακολουθιακές συνθήκες πάνω στο ledger ως event stream, εκεί όπου το Cedar είναι stateless.

**Πηγές:** [Formalization of a Monitoring Algorithm for MFOTL, 2019](https://www.isa-afp.org/entries/MFOTL_Monitor.html)

### Υπογεγραμμένα verdicts και fail-closed admission

*standard, production* · SOTA-KGOV-16

SLSA v1.2 (Approved· Build και Source tracks). VSA: in-toto predicate με verifier, policy (URI+digest), resourceUri, verificationResult PASSED/FAILED και verifiedLevels· ο καταναλωτής επαληθεύει πρώτα την υπογραφή του envelope. in-toto Attestation Framework: spec v1, κατά το repo ακόμη υπό ανάπτυξη. Sigstore policy-controller: Kubernetes admission controller με opt-in ανά namespace· ως προεπιλογή απορρίπτει images που δεν ταιριάζουν σε policy, ρυθμίσιμο σε warn/allow. Rekor (v2): transparency log. K8s ValidatingAdmissionPolicy (GA από v1.30): CEL, failurePolicy Fail (προεπιλογή)/Ignore, actions Deny/Warn/Audit.

**Για το GRAIL:** Υπαρκτό πρότυπο για το σχήμα του Gate Verdict (ICD-06) και για το AdmitArtifact (ICD-04).

**Πηγές:** [SLSA v1.2, 2026](https://slsa.dev/spec/v1.2/) · [SLSA Verification Summary Attestation, 2026](https://slsa.dev/spec/v1.2/verification_summary) · [in-toto Attestation Framework, 2026](https://github.com/in-toto/attestation) · [Sigstore policy-controller, 2026](https://docs.sigstore.dev/policy-controller/overview/) · [Rekor, 2026](https://docs.sigstore.dev/logging/overview/) · [Kubernetes ValidatingAdmissionPolicy, 2024](https://kubernetes.io/docs/reference/access-authn-authz/validating-admission-policy/)

### Root of trust: TUF και FROST

*standard, production* · SOTA-KGOV-17

TUF spec v1.0.36 (τελ. ενημέρωση 2026-08-05): root role με threshold υπογραφών και offline κλειδιά. Κάθε νέο root (N+1) πρέπει να υπογράφεται από threshold κλειδιών του N και από threshold του N+1· expiration απέναντι σε indefinite freeze attacks· delegations. FROST (RFC 9591, Ιούν. 2024): threshold Schnorr signatures δύο γύρων· Informational (CFRG), όχι Standards Track.

**Για το GRAIL:** k-of-n κλειδιά του ίδιου δημιουργού μειώνουν το single-key risk χωρίς να παραβιάζουν το KL-7, όπως ήδη προβλέπει το EP-04 του προχείρου.

**Πηγές:** [The Update Framework Specification, 2026](https://theupdateframework.github.io/specification/latest/) · [RFC 9591 FROST, 2024](https://www.rfc-editor.org/rfc/rfc9591.html)

### Διαδικασίες αναθεώρησης σε παραγωγή (Tezos, Polkadot OpenGov)

*system, production* · SOTA-KGOV-18

Tezos: proposal → exploration (quorum και supermajority >80%) → cooldown για δοκιμές σε test networks → promotion (ίδια κατώφλια) → adoption με αυτόματη ενεργοποίηση στο Mainnet· περίπου 14 ημέρες ανά περίοδο. Polkadot OpenGov: 15 origins/tracks με δικές τους παραμέτρους· lead-in, decision, confirmation και enactment periods· conviction voting με delegation ανά track· Technical Fellowship whitelist για επισπευσμένη διαδρομή· Referendum Canceller και Killer.

**Για το GRAIL:** Επιβεβαιώνουν tiers και ψύξη. Δείχνουν επισπευσμένη διαδρομή και ακύρωση, που λείπουν από το πρόχειρο.

**Πηγές:** [Tezos governance, 2026](https://docs.tezos.com/architecture/governance) · [Polkadot OpenGov, 2026](https://wiki.polkadot.com/learn/learn-polkadot-opengov/)

### Ρυθμιστικό πλαίσιο: AI Act Art.14/12 και NIST AI RMF

*standard, production* · SOTA-KGOV-19

Art.14(4)(d): απόφαση να μη χρησιμοποιηθεί το σύστημα ή override/reverse της εξόδου. Art.14(4)(e): παρέμβαση ή διακοπή μέσω «stop» button ή ανάλογης διαδικασίας, ώστε το σύστημα να σταματά σε ασφαλή κατάσταση. Art.12(1): αυτόματη καταγραφή γεγονότων σε όλη τη διάρκεια ζωής. Υποχρεώσεις high-risk από 2027-12-02 (Annex III) και 2028-08-02 (Annex I)· το AI Omnibus (πρόταση 2025-11-19) σε ισχύ από 2026-07-27. NIST AI RMF 1.0 (2023-01-26, υπό αναθεώρηση στο πλαίσιο του White House AI Action Plan) και NIST AI 600-1 (2024-07-26).

**Για το GRAIL:** Το ledger καλύπτει το Art.12· το Art.14(4)(e) απαιτεί safe-halt, που το πρόχειρο δεν ορίζει.

**Πηγές:** [AI Act Article 14, 2026](https://artificialintelligenceact.eu/article/14/) · [AI Act Article 12, 2026](https://artificialintelligenceact.eu/article/12/) · [AI Act implementation timeline, 2026](https://artificialintelligenceact.eu/implementation-timeline/) · [Digital Omnibus on AI, 2026](https://digital-strategy.ec.europa.eu/en/library/digital-omnibus-ai-regulation-proposal) · [NIST AI RMF, 2026](https://www.nist.gov/itl/ai-risk-management-framework) · [NIST AI 600-1, 2024](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence)

### Αξιοπιστία capability evaluations

*research, research-prototype* · SOTA-KGOV-20

AI Sandbagging (2024, αναθ. 2025): τα μοντέλα μπορούν να υποαποδίδουν επιλεκτικά σε dangerous-capability evals ή να κρύβουν ικανότητες πίσω από password. Noise Injection (2024, NeurIPS 2025): με θόρυβο στα βάρη, τα sandbagging μοντέλα εμφανίζουν ανώμαλη βελτίωση ενώ τα κανονικά υποβαθμίζονται — κατά τους συγγραφείς, model-agnostic σήμα ανίχνευσης. Adding Error Bars to Evals (2024): super-population, paired comparisons, power analysis.

**Για το GRAIL:** Το KRN-04 δέχεται ικανότητες μόνο από evidence. Χωρίς προστασία από sandbagging και χωρίς στατιστικό κριτήριο, το ND ratchet παραπλανάται.

**Πηγές:** [AI Sandbagging, 2024](https://arxiv.org/abs/2406.07358) · [Noise Injection Reveals Hidden Capabilities of Sandbagging Language Models, 2024](https://arxiv.org/abs/2412.01784) · [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640)

### Delegation tokens για αλυσίδες agents (AIP/IBCT) και authorization propagation

*research, research-prototype* · SOTA-KGOV-21

AIP (2026): Invocation-Bound Capability Tokens σε δύο μορφές — compact mode (υπογεγραμμένο JWT, single-hop) και chained mode (Biscuit με Datalog, multi-hop delegation) — με attenuation και provenance, για γεφύρωση MCP και A2A. Reference implementations σε Python και Rust· οι ίδιοι οι συγγραφείς αναφέρουν 100% απόρριψη σε 600 επιθέσεις. Authorization Propagation in Multi-Agent AI Systems (2026): η διατήρηση permission invariants σε delegation είναι ιδιότητα επιπέδου workflow· προτείνει task-scoped authorization envelopes και execution-count revocation.

**Για το GRAIL:** Προφίλ του Biscuit για αλυσίδες οργάνων, υποψήφιο για multi-hop χρήση του ICD-08. Ερευνητικό, χωρίς ανεξάρτητη αξιολόγηση.

**Πηγές:** [AIP: Agent Identity Protocol for Verifiable Delegation, 2026](https://arxiv.org/abs/2603.24775) · [Authorization Propagation in Multi-Agent AI Systems, 2026](https://arxiv.org/abs/2605.05440)


---

# Γνωσιακός πυρήνας GRAIL + γνώση / μαρτυρία / provenance — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### CoALA (Cognitive Architectures for Language Agents)

*research, theoretical* · SOTA-COG-01

Εννοιολογικό πλαίσιο: modular memory components, δομημένος χώρος ενεργειών (εσωτερική μνήμη και εξωτερικό περιβάλλον), γενικευμένη διαδικασία απόφασης.

**Για το GRAIL:** Ταξινομία αναφοράς για COG-02/08/09 και για τη διεπαφή με τη μνήμη AEO. Αν η CoALA ορίζει κάτι ανάλογο με commit υπό proof, δεν επαληθεύτηκε πέρα από το abstract.

**Πηγές:** [Cognitive Architectures for Language Agents (TMLR camera-ready v3), 2024](https://arxiv.org/abs/2309.02427)

### LLM-Modulo και όρια αυτο-επαλήθευσης

*research, research-prototype* · SOTA-COG-02

Τα autoregressive LLMs δεν σχεδιάζουν και δεν αυτο-επαληθεύονται μόνα τους, αλλά λειτουργούν ως «universal approximate knowledge sources» σε βρόχο με εξωτερικούς model-based verifiers. Με self-critique η απόδοση καταρρέει, με sound εξωτερική επαλήθευση ανεβαίνει σημαντικά.

**Για το GRAIL:** Άμεση τεκμηρίωση για τον PVC (ADR-0005, INV-C03).

**Πηγές:** [Position: LLMs Can't Plan, But Can Help Planning in LLM-Modulo Frameworks (ICML), 2024](https://proceedings.mlr.press/v235/kambhampati24a.html) · [On the Self-Verification Limitations of LLMs on Reasoning and Planning Tasks, 2024](https://arxiv.org/abs/2402.08115)

### Neurosymbolic με verifier στον βρόχο (AlphaGeometry, AlphaProof, FunSearch, AlphaEvolve)

*system, research-prototype* · SOTA-COG-03

Γλωσσικό μοντέλο προτείνει, συμβολικός/formal/αυτόματος evaluator κρίνει. AlphaGeometry: 25/30 προβλήματα γεωμετρίας IMO (01/2024). AlphaProof: επίπεδο αργυρού μεταλλίου στην IMO 2024 με RL σε Lean (Nature, online 12/11/2025). FunSearch: ο evaluator «guards against hallucinations». AlphaEvolve: εξελικτικός coding agent με ανάδραση από evaluators.

**Για το GRAIL:** Η αναζήτηση γειωμένη σε verifiers (COG-03/04) φτάνει σε αποτελέσματα αιχμής. Στο νομικό πεδίο δεν τεκμηριώνεται αντίστοιχος πλήρης checker.

**Πηγές:** [AlphaGeometry: An Olympiad-level AI system for geometry, 2024](https://deepmind.google/discover/blog/alphageometry-an-olympiad-level-ai-system-for-geometry/) · [Olympiad-level formal mathematical reasoning with reinforcement learning (Nature, Crossref metadata), 2025](https://api.crossref.org/works/10.1038/s41586-025-09833-y) · [FunSearch: Making new discoveries in mathematical sciences using LLMs, 2023](https://deepmind.google/discover/blog/funsearch-making-new-discoveries-in-mathematical-sciences-using-large-language-models/) · [AlphaEvolve: A coding agent for scientific and algorithmic discovery, 2025](https://arxiv.org/abs/2506.13131)

### Test-time compute, PRMs, MCTS

*research, research-prototype* · SOTA-COG-04

Η compute-optimal κατανομή ανά prompt βελτιώνει την αποδοτικότητα >4× έναντι best-of-N. rStar-Math: MCTS με SLM-based process reward model και code-augmented CoT· MATH 58.8%→90.0% σε μοντέλο 7B. PRMs: η σύνθεση δεδομένων με Monte Carlo estimation δίνει κατώτερα PRMs και η αξιολόγηση Best-of-N έχει biases. Τα frontier μοντέλα έχουν «remarkably weak out-of-box verification».

**Για το GRAIL:** COG-03 (budgets, rewards γειωμένα σε verifiers) και COG-08 (κατανομή compute).

**Πηγές:** [Scaling LLM Test-Time Compute Optimally can be More Effective than Scaling Model Parameters, 2024](https://arxiv.org/abs/2408.03314) · [rStar-Math, 2025](https://arxiv.org/abs/2501.04519) · [The Lessons of Developing Process Reward Models in Mathematical Reasoning (Findings ACL), 2025](https://aclanthology.org/2025.findings-acl.547/) · [Sample, Scrutinize and Scale, 2025](https://arxiv.org/abs/2502.01839)

### Ανεξάρτητα ελέγξιμα proof certificates (cvc5/Alethe + Carcara· ανεξάρτητοι Lean kernels)

*tool, pilot* · SOTA-COG-05

Το cvc5 εξάγει αποδείξεις σε CPC, Alethe και LFSC. Το Carcara (Rust, Apache-2.0, TACAS 2023) είναι checker και elaborator για Alethe. Για τη Lean 4:<br>- Lean4Lean: ελέγχει όλο το mathlib, 20–50% πιο αργό, εντόπισε και διορθώθηκε ένα soundness bug.<br>- nanoda_lib: εξωτερικός type checker σε Rust, πρώιμο στάδιο.<br>- leanchecker (πρώην lean4checker): χρησιμοποιεί τον ίδιο kernel, άρα δεν είναι ανεξάρτητο.

**Για το GRAIL:** Κάνει το proof object ελέγξιμο χωρίς εμπιστοσύνη στον solver ή στον kernel (COG-04, ICD-30).

**Πηγές:** [Carcara (GitHub), 2026](https://github.com/ufmg-smite/carcara) · [cvc5 documentation: Proofs, 2026](https://cvc5.github.io/docs/latest/proofs/proofs.html) · [Lean4Lean: Verifying a Typechecker for Lean, in Lean, 2024](https://arxiv.org/abs/2403.14064) · [nanoda_lib (GitHub), 2026](https://github.com/ammkrn/nanoda_lib) · [lean4checker (archived, merged as leanchecker), 2026](https://github.com/leanprover/lean4checker)

### Συσχετισμένες αποτυχίες σε N-version και N-model

*research, research-prototype* · SOTA-COG-06

Knight & Leveson (IEEE TSE 12(1), 1986): η υπόθεση ανεξαρτησίας των αποτυχιών σε N-version προγράμματα απορρίφθηκε στατιστικά (δευτερογενής πηγή· το κείμενο της εργασίας δεν ανοίχτηκε). Kim et al. (ICML 2025), >350 LLMs: σε ένα leaderboard dataset τα μοντέλα συμφωνούν ~60% όταν και τα δύο σφάλλουν. Τα μεγαλύτερα και ακριβέστερα μοντέλα έχουν ισχυρά συσχετισμένα σφάλματα, ακόμη και με διαφορετικές αρχιτεκτονικές και παρόχους. PoLL: panel μικρότερων μοντέλων από διαφορετικές οικογένειες υπερέχει ενός μεγάλου judge, με λιγότερο intra-model bias και >7× χαμηλότερο κόστος.

**Για το GRAIL:** Περιορίζει το βάρος του N-version/N-model agreement (§8.3, §8.5, §8.7) και αφορά το EXP-14.

**Πηγές:** [An experimental evaluation of the assumption of independence in multiversion programming (Crossref metadata), 1986](https://api.crossref.org/works/10.1109/TSE.1986.6312924) · [N-version programming (Wikipedia, για το εύρημα Knight & Leveson), 2026](https://en.wikipedia.org/wiki/N-version_programming) · [Correlated Errors in Large Language Models (ICML), 2025](https://proceedings.mlr.press/v267/kim25e.html) · [Replacing Judges with Juries, 2024](https://arxiv.org/abs/2404.18796)

### Αβεβαιότητα και abstention (semantic entropy, conformal)

*research, research-prototype* · SOTA-COG-07

Semantic entropy (Nature 2024): εντοπίζει confabulations μετρώντας αβεβαιότητα στον χώρο του νοήματος. Conformal factuality: back-off σε λιγότερο ειδικό ισχυρισμό με εγγύηση ορθότητας 80–90%. Conformal abstention: εγγύηση για το hallucination rate. Conformal risk control: εγγύηση αναμενόμενης απώλειας για κάθε μονότονη loss, υπό exchangeability. Survey abstention (TACL 2025). Το verbalized confidence των LLMs είναι υπερβέβαιο (ICLR 2024).

**Για το GRAIL:** Μέθοδοι για τα κατώφλια του COG-08 και για το Unknown (INV-C04).

**Πηγές:** [Detecting hallucinations in LLMs using semantic entropy (OATML, Nature paper), 2024](https://oatml.cs.ox.ac.uk/blog/2024/06/19/detecting_hallucinations_2024.html) · [Language Models with Conformal Factuality Guarantees (ICML), 2024](https://proceedings.mlr.press/v235/mohri24a.html) · [Mitigating LLM Hallucinations via Conformal Abstention, 2024](https://arxiv.org/abs/2405.01563) · [Conformal Risk Control, 2022](https://arxiv.org/abs/2208.02814) · [Know Your Limits: A Survey of Abstention in LLMs (TACL), 2025](https://aclanthology.org/2025.tacl-1.26/) · [Can LLMs Express Their Uncertainty? (ICLR), 2024](https://arxiv.org/abs/2306.13063)

### ATMS, provenance semirings, ProvSQL, AGM σε belief bases

*research, pilot* · SOTA-COG-08

ATMS (de Kleer, Artificial Intelligence 28(2), 1986): τα μεταδεδομένα επαληθεύτηκαν, το κείμενο δεν ανοίχτηκε (403). Provenance semirings (PODS 2007): τα μεταδεδομένα επαληθεύτηκαν. ProvSQL: επέκταση PostgreSQL με (m-)semiring provenance (Boolean, counting, why-, how-, which-provenance, πιθανότητες, Shapley). MIT. VLDB 2018. SEP (αναθ. 29/7/2026): AGM και ειδική ενότητα για belief bases (contraction, consolidation, revision).

**Για το GRAIL:** Υλοποιήσιμη τυπική βάση για COG-05, INV-E02, KT-06. Η αντιστοίχιση ATMS labels ↔ why-provenance είναι ερμηνεία, όχι ισχυρισμός πηγής.

**Πηγές:** [An assumption-based TMS (Crossref metadata), 1986](https://api.crossref.org/works/10.1016/0004-3702(86)90080-9) · [Provenance semirings (Crossref metadata), 2007](https://api.crossref.org/works/10.1145/1265530.1265535) · [ProvSQL (GitHub), 2026](https://github.com/PierreSenellart/provsql) · [ProvSQL website (supported semirings), 2026](https://provsql.org/) · [Logic of Belief Revision (SEP), 2026](https://plato.stanford.edu/entries/logic-belief-revision/)

### Αιτιακή συμπερασματολογία: DoWhy, CLadder, Halpern–Pearl, νομική αιτιότητα

*tool, production* · SOTA-COG-09

DoWhy (MIT): identification, estimation, refutation API, και counterfactuals μέσω GCM. CLadder (NeurIPS 2023): η τυπική αιτιακή συλλογιστική είναι «highly challenging» για τα LLMs. Τροποποιημένος ορισμός Halpern–Pearl (IJCAI 2015) για την actual causation. SEP (αναθ. 2/2024): στο δίκαιο κυριαρχεί το but-for, με εναλλακτική το NESS· η overdetermination και η preemption είναι γνωστά προβλήματα.

**Για το GRAIL:** COG-06: το identification είναι [T]. Η νομική αιτιότητα είναι όμως actual causation.

**Πηγές:** [DoWhy (GitHub), 2026](https://github.com/py-why/dowhy) · [CLadder, 2023](https://arxiv.org/abs/2312.04350) · [A Modification of the Halpern-Pearl Definition of Causality, 2015](https://arxiv.org/abs/1505.00162) · [Causation in the Law (SEP), 2024](https://plato.stanford.edu/entries/causation-law/)

### Learned world models (V-JEPA 2, DreamerV3, Genie 3)

*research, research-prototype* · SOTA-COG-10

V-JEPA 2: pretraining σε >1M ώρες βίντεο, <62 ώρες ρομποτικού βίντεο, zero-shot planning σε βραχίονες Franka. DreamerV3 (Nature 2025): >150 tasks με μία ρύθμιση. Genie 3 (5/8/2025): 720p/24fps, περιβάλλοντα «largely consistent for several minutes», limited research preview.

**Για το GRAIL:** EXP-23, COG-07: η αιχμή αφορά φυσικά και οπτικά περιβάλλοντα.

**Πηγές:** [V-JEPA 2, 2025](https://arxiv.org/abs/2506.09985) · [DreamerV3 project page, 2025](https://danijar.com/project/dreamerv3/) · [Genie 3: A new frontier for world models, 2025](https://deepmind.google/discover/blog/genie-3-a-new-frontier-for-world-models/)

### Global Workspace και blackboard για AI

*research, research-prototype* · SOTA-COG-11

Shared workspace όπου τα modules ανταγωνίζονται για πρόσβαση λόγω περιορισμένου bandwidth (ICLR 2022). Butlin et al. 2023: καμία σημερινή AI δεν είναι συνειδητή, αλλά δεν υπάρχουν προφανή τεχνικά εμπόδια. Φιλοσοφικό επιχείρημα υπέρ language agents υπό GWT (2024). Blackboard LLM MAS (2025): ανταγωνιστικό με λιγότερα tokens.

**Για το GRAIL:** COG-02, EXP-21: καμία ελεγχόμενη απόδειξη υπεροχής.

**Πηγές:** [Coordination Among Neural Modules Through a Shared Global Workspace (ICLR), 2022](https://arxiv.org/abs/2103.01197) · [Consciousness in Artificial Intelligence, 2023](https://arxiv.org/abs/2308.08708) · [A Case for AI Consciousness: Language Agents and GWT, 2024](https://arxiv.org/abs/2410.11407) · [Exploring Advanced LLM Multi-Agent Systems Based on Blackboard Architecture, 2025](https://arxiv.org/abs/2507.01701)

### Όρια ενδοσκόπησης LLM

*research, research-prototype* · SOTA-COG-12

Με concept injection, το καλύτερο μοντέλο πετυχαίνει ~20% στις βέλτιστες συνθήκες· κατά τους συγγραφείς οι ικανότητες είναι «highly unreliable; failures of introspection remain the norm». Το self-prediction advantage αποτυγχάνει σε σύνθετα και OOD tasks.

**Για το GRAIL:** Στηρίζει την επιλογή του COG-08 να μην εμπιστεύεται την αυτο-αναφορά.

**Πηγές:** [Emergent Introspective Awareness in Large Language Models, 2025](https://transformer-circuits.pub/2025/introspection/index.html) · [Looking Inward: Language Models Can Learn About Themselves by Introspection, 2024](https://arxiv.org/abs/2410.13787)

### Prompt injection by design: CaMeL, FIDES

*research, research-prototype* · SOTA-COG-13

CaMeL: εξάγει control και data flow από το έμπιστο ερώτημα και χρησιμοποιεί capabilities κατά της εξαγωγής δεδομένων. Λύνει 77% των tasks του AgentDojo με provable security (84% το σύστημα χωρίς άμυνα). FIDES: planner με labels εμπιστευτικότητας και ακεραιότητας, ντετερμινιστική επιβολή πολιτικών, dynamic taint-tracking.

**Για το GRAIL:** COG-02/10: μηχανισμός επιβολής για το INV-S01.

**Πηγές:** [Defeating Prompt Injections by Design, 2025](https://arxiv.org/abs/2503.18813) · [Securing AI Agents with Information-Flow Control, 2025](https://arxiv.org/abs/2505.23643)

### Πολυπαροχικά gateways, routing, drift, μη ντετερμινισμός, OTel GenAI

*tool, production* · SOTA-COG-14

LiteLLM: >100 πάροχοι, retry/fallback, cost tracking, spend management· open-source με commercial enterprise άδεια. RouteLLM (ICLR 2025): >2× μείωση κόστους χωρίς απώλεια ποιότητας. Drift: σε εμπορική υπηρεσία LLM, ίδιο task 84%→51% σε 3 μήνες (2023). Μη ντετερμινισμός: τα endpoints είναι μη ντετερμινιστικά επειδή το φορτίο (άρα το batch size) αλλάζει και τα kernels δεν είναι batch-invariant· το κείμενο («Defeating Nondeterminism», 10/9/2025) στοχεύει σε batch-invariant kernels. OTel GenAI semconv: status Development.

**Για το GRAIL:** COG-01, ICD-22, EP-01, KT-01.

**Πηγές:** [LiteLLM (GitHub), 2026](https://github.com/BerriAI/litellm) · [RouteLLM (ICLR), 2025](https://proceedings.iclr.cc/paper_files/paper/2025/hash/5503a7c69d48a2f86fc00b3dc09de686-Abstract-Conference.html) · [Chen, Zaharia, Zou: LLM service behavior drift (arXiv 2307.09009), 2023](https://arxiv.org/abs/2307.09009) · [Defeating Nondeterminism in LLM Inference, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/) · [OTel GenAI semantic conventions README, 2026](https://github.com/open-telemetry/semantic-conventions-genai/blob/main/docs/gen-ai/README.md)

### Durable execution (Temporal)

*system, production* · SOTA-COG-15

Το event history είναι «the source of truth». Ο κώδικας της ροής ξαναπαίζεται ντετερμινιστικά. Το αποτέλεσμα κάθε activity καταγράφεται και στο replay «is reused, not recomputed».

**Για το GRAIL:** Υλοποίηση για sagas και INV-C08 (COG-10)· εισάγει δεύτερο ιστορικό.

**Πηγές:** [Temporal Workflows documentation, 2026](https://docs.temporal.io/workflows)

### Skill libraries και MCP

*standard, production* · SOTA-COG-16

Voyager: skill library ως εκτελέσιμος κώδικας, με επαναληπτικό prompting και self-verification. MCP (spec 2026-07-28): resources, prompts, tools, elicitation, και extensions (Tasks· «Skills over MCP» μέσω working group· MCP Apps). Η spec ορίζει ότι οι annotations των εργαλείων θεωρούνται untrusted, εκτός αν προέρχονται από trusted server.

**Για το GRAIL:** COG-09/10 ως adapters πίσω από ORP και gateway.

**Πηγές:** [Voyager, 2023](https://arxiv.org/abs/2305.16291) · [Model Context Protocol Specification (latest), 2026](https://modelcontextprotocol.io/specification/latest)

### Document parsing (OmniDocBench, Docling)

*tool, production* · SOTA-COG-17

OmniDocBench (CVPR 2025): αξιολογεί pipeline μεθόδους και end-to-end VLMs και αναδεικνύει δυνατά και αδύναμα σημεία ανά τύπο εγγράφου. Docling: MIT, τοπική εκτέλεση, DocLayNet (layout) και TableFormer (πίνακες).

**Για το GRAIL:** COG-11.

**Πηγές:** [OmniDocBench, 2025](https://arxiv.org/abs/2412.07626) · [Docling Technical Report, 2024](https://arxiv.org/abs/2408.09869)

### Provenance και attestation: PROV-O, SCITT, in-toto, VC 2.0, C2PA

*standard, production* · SOTA-COG-18

PROV-O: W3C REC, 30/4/2013 (Entity, Activity, Agent, used, wasDerivedFrom, wasAttributedTo, qualified terms). RFC 9943 (SCITT architecture): Proposed Standard, 06/2026· γενίκευση του CT (RFC 9162), με COSE_Sign1 signed statements και receipts κατά RFC 9942. Η ωριμότητα των υλοποιήσεων είναι άγνωστη. in-toto attestation v1.2: Envelope (προτεινόμενο DSSE v1.0), Statement με subject DigestSet, Predicate, Bundle. VC 2.0: W3C REC, 15/5/2025. C2PA 2.2 (1/5/2025): hard και soft bindings.

**Για το GRAIL:** KNW-01/04, ICD-18, INV-E04, INV-C06.

**Πηγές:** [PROV-O, 2013](https://www.w3.org/TR/prov-o/) · [RFC 9943: An Architecture for Trustworthy and Transparent Digital Supply Chains, 2026](https://datatracker.ietf.org/doc/rfc9943/) · [in-toto Attestation Framework spec, 2026](https://github.com/in-toto/attestation/blob/main/spec/README.md) · [in-toto attestation v1 Envelope (DSSE), 2026](https://github.com/in-toto/attestation/blob/main/spec/v1/envelope.md) · [Verifiable Credentials Data Model v2.0, 2025](https://www.w3.org/TR/vc-data-model-2.0/) · [C2PA Technical Specification 2.2, 2025](https://spec.c2pa.org/specifications/specifications/2.2/specs/_attachments/C2PA_Specification.pdf)

### RDF/SPARQL/SHACL (1.1/REC και 1.2/σε εξέλιξη), Oxigraph, Akoma Ntoso/ELI

*standard, pilot* · SOTA-COG-19

Recommendations: RDF 1.1 (25/2/2014), SPARQL 1.1 (21/3/2013), SHACL (20/7/2017). Σε εξέλιξη:<br>- RDF 1.2 Concepts: CR Snapshot 07/04/2026, με triple terms και επίπεδα Full/Basic conformance.<br>- SPARQL 1.2: WD 13/9/2026.<br>- SHACL 1.2 Core: WD 28/8/2026.<br>Oxigraph: RDF 1.2 και SPARQL 1.2 πίσω από τα features `rdf-12`/`sparql-12`· SHACL δεν αναφέρεται στο CHANGELOG. Akoma Ntoso 1.0: OASIS Standard, 08/2018. Αντιστοίχιση ELI–AKN: ICEGOV 2023.

**Για το GRAIL:** KNW-02/05, ICD-17, EP-07.

**Πηγές:** [RDF 1.2 Concepts, 2026](https://www.w3.org/TR/rdf12-concepts/) · [SPARQL 1.2 Query Language, 2026](https://www.w3.org/TR/sparql12-query/) · [SHACL 1.2 Core, 2026](https://www.w3.org/TR/shacl12-core/) · [RDF 1.1 Concepts, 2014](https://www.w3.org/TR/rdf11-concepts/) · [SPARQL 1.1 Query Language, 2013](https://www.w3.org/TR/sparql11-query/) · [SHACL, 2017](https://www.w3.org/TR/shacl/) · [Oxigraph CHANGELOG, 2026](https://raw.githubusercontent.com/oxigraph/oxigraph/master/CHANGELOG.md) · [OASIS LegalDocML TC, 2018](https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=legaldocml) · [Mapping ELI and AKN Ontologies (Crossref metadata), 2023](https://api.crossref.org/works/10.1145/3614321.3614327)

### Διτεμπορικά και speculative stores (XTDB v2, Zep/Graphiti, Datomic with)

*system, production* · SOTA-COG-20

XTDB v2: διτεμπορικό (πότε συνέβη / πότε καταγράφηκε), SQL:2011, αμετάβλητα δεδομένα, MPL-2.0. Zep/Graphiti: bi-temporal μοντέλο (T γεγονότων, T′ ingestion) με t_valid/t_invalid στις ακμές. Datomic `with`: speculative database value χωρίς durable commit, συνδυάσιμο με `as-of`.

**Για το GRAIL:** KNW-02 και ghost worlds πάνω σε cuts (COG-07).

**Πηγές:** [XTDB, 2026](https://xtdb.com/) · [Zep: A Temporal Knowledge Graph Architecture for Agent Memory, 2025](https://arxiv.org/html/2501.13956) · [Datomic filters (with / as-of), 2026](https://docs.datomic.com/reference/filters.html)

### Retrieval: hybrid, GraphRAG, HippoRAG 2, poisoning

*research, production* · SOTA-COG-21

BEIR (NeurIPS 2021): το BM25 είναι «robust baseline»· re-ranking και late interaction δίνουν τα καλύτερα zero-shot αποτελέσματα, με υψηλό κόστος. GraphRAG: LLM χτίζει entity KG και community summaries. HippoRAG 2 (ICML 2025): Personalized PageRank με ενσωμάτωση passages. PoisonedRAG (USENIX Security 2025): 90% επιτυχία επίθεσης με 5 κακόβουλα κείμενα ανά στοχευμένη ερώτηση, σε βάση εκατομμυρίων κειμένων· οι άμυνες που δοκιμάστηκαν ήταν ανεπαρκείς.

**Για το GRAIL:** KNW-03, ICD-31, INV-E02.

**Πηγές:** [BEIR, 2021](https://arxiv.org/abs/2104.08663) · [From Local to Global: A Graph RAG Approach, 2024](https://arxiv.org/abs/2404.16130) · [From RAG to Memory (HippoRAG 2), 2025](https://arxiv.org/abs/2502.14802) · [PoisonedRAG, 2025](https://arxiv.org/abs/2402.07867)

### Incremental συντήρηση παράγωγων (Differential Dataflow)

*tool, production* · SOTA-COG-22

Ενημερώνει τα αποτελέσματα μόνο όπου αλλάζουν οι είσοδοι, και σε επαναληπτικούς υπολογισμούς (iterate: reachability, k-core). Παράδειγμα του README: degree distribution σε γράφο 10M κόμβων/50M ακμών· αλλαγή μίας ακμής σε ~230µs έναντι ~15s αρχικού υπολογισμού (~10^5×).

**Για το GRAIL:** INV-E01, EXP-05.

**Πηγές:** [differential-dataflow (GitHub), 2026](https://github.com/TimelyDataflow/differential-dataflow)

### LinkML (σχήμα από μία πηγή)

*tool, production* · SOTA-COG-23

Από YAML σχήμα παράγει >30 μορφές: JSON Schema, OWL, SHACL, ShEx, JSON-LD, SQL DDL, Python/Pydantic/TypeScript/Java/Rust. Apache 2.0.

**Για το GRAIL:** Ένταση «μίας έδρας» σχημάτων (ADR-0025 έναντι KNW-05 έναντι canonical model).

**Πηγές:** [LinkML, 2026](https://linkml.io/)


---

# AEO — μνήμη, ταυτότητα, πολλά σώματα — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### KERI (Key Event Receipt Infrastructure)

*standard, pilot* · SOTA-AEO-01

Self-certifying AID με Key Event Log (KEL). Pre-rotation: δέσμευση σε digest των επόμενων κλειδιών. Witnesses με KAWA, watchers με first-seen πολιτική, ανίχνευση duplicity, cooperative delegated AIDs. Το key state ορίζεται από το KEL (append-only), όχι από wall-clock. Η ζωντανή σελίδα ToIP δηλώνει v1.1 (DOI 10.5281/zenodo.18887102, χωρίς ημερομηνία). Το Zenodo deposit (6/3/2026) περιέχει kswg-keri-specification-1.0. Το IETF individual draft έχει λήξει (-00, 2023). Το arXiv paper έχει φτάσει στο v16 (2025).

**Για το GRAIL:** Άμεσο ανάλογο του CryptoCont, των body delegations και της ανίχνευσης equivocation. Η παραγωγική υιοθέτηση και οι βιβλιοθήκες για Rust/PQ δεν επαληθεύτηκαν από εδώ.

**Πηγές:** [KERI specification (ToIP, v1.1), 2026 (Zenodo DOI)](https://trustoverip.github.io/kswg-keri-specification/) · [Key Event Receipt Infrastructure (KERI), Zenodo, 2026](https://zenodo.org/records/18887102) · [draft-ssmith-keri (expired), 2023](https://datatracker.ietf.org/doc/draft-ssmith-keri/) · [Key Event Receipt Infrastructure (arXiv, v16), 2019 (v16 2025)](https://arxiv.org/pdf/1907.02143)

### W3C VC 2.0 + Controlled Identifiers v1.0 + DID v1.1 + did:webvh

*standard, production* · SOTA-AEO-02

VC Data Model 2.0 και Controlled Identifiers v1.0: W3C Recommendations από 15/5/2025, μαζί με άλλες πέντε προδιαγραφές. Το DID v1.1 είναι Candidate Recommendation Snapshot (5/3/2026) και στη σελίδα TR δεν έχει προχωρήσει πέρα από CR. Το did:webvh v1.0 προσφέρει verifiable history log και προαιρετικά pre-rotation, witnesses και portability· η ημερομηνία του δεν επαληθεύτηκε.

**Για το GRAIL:** Διαλειτουργική εξωτερική προβολή της ταυτότητας AEO και των credentials (consent, delegation). Το maturity production αφορά μόνο τα Recommendations.

**Πηγές:** [VC 2.0 family is now a W3C Recommendation, 2025](https://www.w3.org/news/2025/the-verifiable-credentials-2-0-family-of-specifications-is-now-a-w3c-recommendation/) · [Decentralized Identifiers (DIDs) v1.1, 2026](https://www.w3.org/TR/did-1.1/) · [did:webvh v1.0, έτος μη επαληθευμένο](https://identity.foundation/didwebvh/v1.0/)

### Transparency logs: RFC 9162 + C2SP tlog-witness

*standard, production* · SOTA-AEO-03

Merkle inclusion και consistency proofs. Το RFC 9162 είναι Experimental (12/2021). Το C2SP tlog-witness ορίζει witness cosigning checkpoints μέσω add-checkpoint με consistency proof· tag tlog-witness/v1.0.0 στις 31/3/2026.

**Για το GRAIL:** Αποδεδειγμένος μηχανισμός για το INV-I02 και τη μνημονική δέσμευση.

**Πηγές:** [RFC 9162 Certificate Transparency v2.0, 2021](https://datatracker.ietf.org/doc/rfc9162/) · [C2SP Transparency Log Witness Protocol, 2026](https://c2sp.org/tlog-witness@v1.0.0) · [C2SP tags (tlog-witness/v1.0.0), 2026](https://github.com/C2SP/C2SP/tags)

### Leases + fencing tokens· single-activation (Orleans)

*research, production* · SOTA-AEO-04

Το lock/lease μόνο του δεν είναι ασφαλές σε pauses. Ο storage server πρέπει να απορρίπτει εγγραφές με fencing token μικρότερο του μέγιστου που έχει δει (Kleppmann). Ο default grain directory του Orleans είναι eventually consistent και επιτρέπει περιστασιακές διπλές activations σε αστάθεια. Για ισχυρότερη εγγύηση υπάρχουν storage-based directories ή, στο Orleans 10, strongly-consistent in-cluster directory (preview).

**Για το GRAIL:** Η μοναδικότητα των bodies απαιτεί έλεγχο στην πλευρά του πόρου/verifier, όχι αυτοδήλωση.

**Πηγές:** [How to do distributed locking, 2016](https://martin.kleppmann.com/2016/02/08/how-to-do-distributed-locking.html) · [Orleans grain directory, 2026](https://learn.microsoft.com/en-us/dotnet/orleans/host/grain-directory)

### Workload/agent identity: SPIFFE/SPIRE, IETF WIMSE, draft-klrc-aiagent-auth, OpenID whitepaper

*standard, pilot* · SOTA-AEO-05

Τα SPIFFE keys/certs είναι short-lived και ανανεώνονται αυτόματα. Defaults του SPIRE: X509-SVID 1h, JWT-SVID 5m. Το WIMSE arch-07 (2/3/2026, τελευταία έκδοση -08 στις 6/7/2026) αντιμετωπίζει τα AI agents ως delegated workloads. Το draft-klrc-aiagent-auth-03 (6/7/2026) ορίζει: short-lived credentials με ρητή λήξη, OAuth 2.0 για delegation, και ότι το LLM MUST NOT έχει πρόσβαση σε credentials. Υπάρχει whitepaper «Identity Management for Agentic AI» (PDF 29/10/2025, openid.net)· το περιεχόμενό του δεν επαληθεύτηκε.

**Για το GRAIL:** Με body credentials TTL λεπτών/ωρών, το όριο του KT-18 φράσσεται από το TTL ανεξάρτητα από τη διάδοση της ανάκλησης.

**Πηγές:** [SPIFFE Concepts, πρόσβαση 2026](https://spiffe.io/docs/latest/spiffe-about/spiffe-concepts/) · [SPIRE Server configuration, πρόσβαση 2026](https://spiffe.io/docs/latest/deploying/spire_server/) · [draft-klrc-aiagent-auth-03, 2026](https://datatracker.ietf.org/doc/draft-klrc-aiagent-auth/) · [WIMSE Architecture draft-07, 2026](https://datatracker.ietf.org/doc/html/draft-ietf-wimse-arch-07) · [draft-ietf-wimse-arch (latest -08), 2026](https://datatracker.ietf.org/doc/draft-ietf-wimse-arch/) · [Identity Management for Agentic AI, 2025](https://openid.net/wp-content/uploads/2025/10/Identity-Management-for-Agentic-AI.pdf)

### Merkle-CRDTs / BFT CRDTs / Automerge 3

*research, production* · SOTA-AEO-06

Τα Merkle-DAGs λειτουργούν ως logical clocks (2020). Η προσαρμογή των CRDTs για BFT ανέχεται οποιοδήποτε πλήθος Byzantine κόμβων (immune σε Sybil) με Strong Eventual Consistency (PaPoC 2022). Το Automerge 3 (7/2025) μείωσε τη μνήμη πάνω από 10x.

**Για το GRAIL:** Θεμέλιο για τη συγχώνευση των grow-only episodic κλάδων πολλών σωμάτων υπό partition και Byzantine body.

**Πηγές:** [Merkle-CRDTs: Merkle-DAGs meet CRDTs, 2020](https://arxiv.org/abs/2004.00107) · [Making CRDTs Byzantine Fault Tolerant, 2022](https://martin.kleppmann.com/papers/bft-crdt-papoc22.pdf) · [Automerge 3.0, 2025](https://automerge.org/blog/automerge-3/)

### MemGPT/Letta + sleep-time compute

*system, production* · SOTA-AEO-07

Virtual context management σε κλιμάκια μνήμης (2023). Sleep-time compute: offline precomputation με περίπου 5x λιγότερο test-time compute και έως +13%/+18% ακρίβεια (2025). Η τρέχουσα τεκμηρίωση Letta («Memory & dreaming») περιγράφει background subagents που εξετάζουν συνομιλίες, κάνουν consolidation και ενημερώνουν τη μνήμη.

**Για το GRAIL:** Αποδεδειγμένο πρότυπο για offline consolidation (AEO-04). Η μνήμη ενημερώνεται στη θέση της, άρα δεν είναι προσθετική.

**Πηγές:** [MemGPT: Towards LLMs as Operating Systems, 2023](https://arxiv.org/abs/2310.08560) · [Sleep-time Compute, 2025](https://arxiv.org/abs/2504.13171) · [Letta docs: Memory & dreaming, πρόσβαση 2026](https://docs.letta.com/guides/agents/architectures/sleeptime/)

### Zep/Graphiti· Mem0· MemOS· A-MEM

*system, production* · SOTA-AEO-08

Graphiti: episode subgraph ως non-lossy store, semantic entity και community subgraphs· bi-temporal (t_valid/t_invalid, t'_created/t'_expired)· οι αντιφάσεις κάνουν invalidate, δεν διαγράφουν, με σταθερή προτεραιότητα στη νέα πληροφορία. Mem0: το LLM επιλέγει ADD/UPDATE/DELETE/NOOP, και το DELETE αφαιρεί μνήμες που αντικρούει νέα πληροφορία. MemOS: MemCube με provenance/versioning. A-MEM: Zettelkasten linking με memory evolution.

**Για το GRAIL:** Σημείο αναφοράς: το πρόχειρο (ποτέ διαγραφή, ATMS) είναι αυστηρότερο από το Mem0 και από την πολιτική επίλυσης του Graphiti.

**Πηγές:** [Zep: A Temporal Knowledge Graph Architecture for Agent Memory, 2025](https://arxiv.org/html/2501.13956v1) · [Mem0: Building Production-Ready AI Agents with Scalable Long-Term Memory, 2025](https://arxiv.org/html/2504.19413) · [MemOS: A Memory OS for AI System, 2025](https://arxiv.org/abs/2507.03724) · [A-MEM: Agentic Memory for LLM Agents, 2025](https://arxiv.org/abs/2502.12110)

### Evidence-preserving memory: MemMachine, faulty consolidation, memory portability

*research, research-prototype* · SOTA-AEO-09

Το MemMachine αποθηκεύει ολόκληρα τα επεισόδια (LongMemEval-S 93,0%). Η χρησιμότητα της μνήμης που ενημερώνει συνεχώς ένα LLM πρώτα ανεβαίνει και μετά πέφτει, μπορεί και κάτω από το no-memory· το episodic-only μένει ανταγωνιστικό. Μετά από αλλαγή του writer: οι σημειώσεις μετακινούνται +9,91/−13,28 pts, το fixed-schema KG +0,0004±0,0020, το πλήρες re-embedding αποδίδει 11,90 pts έναντι 4,96 του μερικού, και τα raw histories επιτρέπουν ανάκαμψη σε 34/48 περιπτώσεις.

**Για το GRAIL:** Εμπειρική στήριξη (preprints) των ADR-0020, INV-O01 και REQ-MEM-003.

**Πηγές:** [MemMachine, 2026](https://arxiv.org/abs/2604.04853) · [Useful Memories Become Faulty When Continuously Updated by LLMs, 2026](https://arxiv.org/abs/2605.12978) · [Does Your Agent's Memory Survive a Model Upgrade?, 2026](https://arxiv.org/abs/2609.05339)

### Consolidation/episodic: Auto-Dreamer, HippoRAG 2, EM-LLM, Position paper, BeliefMem

*research, research-prototype* · SOTA-AEO-10

Auto-Dreamer: διαβάζει την evidence read-only και συνθέτει νέο compact σύνολο με GRPO (ScienceWorld +7, 12x μικρότερη μνήμη). HippoRAG 2 (ICML 2025): non-parametric continual learning. EM-LLM (ICLR 2025): event segmentation με Bayesian surprise. Position paper: episodic memory ως το κομμάτι που λείπει. BeliefMem: πολλαπλά υποψήφια συμπεράσματα με πιθανότητες (Noisy-OR), όχι ένα.

**Για το GRAIL:** Υποψήφιες μέθοδοι για το EXP-13, συμβατές με προσθετική consolidation.

**Πηγές:** [Auto-Dreamer, 2026](https://arxiv.org/abs/2605.20616) · [From RAG to Memory (HippoRAG 2), 2025](https://arxiv.org/abs/2502.14802) · [Human-inspired Episodic Memory for Infinite Context LLMs (EM-LLM), 2024](https://arxiv.org/abs/2407.09450) · [Position: Episodic Memory is the Missing Piece for Long-Term LLM Agents, 2025](https://arxiv.org/abs/2502.06975) · [Belief Memory, 2026](https://arxiv.org/abs/2605.05583)

### Memory benchmarks: LongMemEval, HaluMem

*tool, production* · SOTA-AEO-11

LongMemEval (ICLR 2025) μετρά information extraction, multi-session reasoning, temporal reasoning, knowledge updates και abstention. HaluMem μετρά hallucination ανά πράξη (extraction, updating, QA) στις κατηγορίες fabrication, errors, conflicts, omissions.

**Για το GRAIL:** Έτοιμα κριτήρια αποδοχής για AEO-03/04 και μέτρηση ψευδομνήμης.

**Πηγές:** [LongMemEval, 2024](https://arxiv.org/abs/2410.10813) · [HaluMem, 2025](https://arxiv.org/abs/2511.03506)

### Memory security & governance: MINJA, SMSR, SSGM, Always-On survey

*research, research-prototype* · SOTA-AEO-12

MINJA: injection μόνο μέσω queries· μέσο ISR 98,2%, μέσο ASR 76,8%. SMSR (2026): HMAC-SHA256 provenance στην εγγραφή (unsigned 0%) και randomized ablation voting (authenticated 8,0%). SSGM (2026, conceptual): consistency verification, decay και access control πριν από κάθε consolidation. Always-On survey (2026): η βιβλιογραφία εστιάζει στη συσσώρευση και την ανάκληση, όχι στο governance/recovery.

**Για το GRAIL:** Απειλή που το πρόχειρο δεν μοντελοποιεί: δηλητηρίαση μέσω νόμιμων επεισοδίων.

**Πηγές:** [Memory Injection Attacks on LLM Agents via Query-Only Interaction, 2025 (v5 2026)](https://arxiv.org/html/2503.03704) · [SMSR, 2026](https://arxiv.org/abs/2606.12703) · [SSGM, 2026](https://arxiv.org/abs/2603.11768) · [Always-On Agents survey, 2026](https://arxiv.org/abs/2606.30306)

### Behavioral identity measurement

*research, research-prototype* · SOTA-AEO-13

Σημαντικό instruction drift μέσα σε 8 γύρους (2024). Οι core capabilities συγκλίνουν, ενώ τα alignment behaviors (sycophancy, robustness) διαφέρουν δραματικά (2025). Ταξινόμηση πέντε οικογενειών frontier LLM από το κείμενο με ακρίβεια 97,1%, που επιμένει μετά από rewrite/translation/summarization (2025). Η συνοχή self-report και συμπεριφοράς είναι επιλεκτική· το persona prompting βελτιώνει τα self-reports, όχι τη συμπεριφορά (2026). Persona vectors: traits στις ενεργοποιήσεις (white-box). MET: MMD two-sample test με median power 77,4% και περίπου 10 δείγματα/prompt.

**Για το GRAIL:** Δεν υπάρχει επικυρωμένο όργανο «χαρακτήρα» κατά μήκος αλλαγής παρόχου· υπάρχουν αυστηρά statistical tests.

**Πηγές:** [Measuring and Controlling Instruction (In)Stability in Language Model Dialogs, 2024](https://arxiv.org/abs/2402.10962) · [Behavioral Fingerprinting of LLMs, 2025](https://arxiv.org/abs/2509.04504) · [Idiosyncrasies in Large Language Models, 2025](https://arxiv.org/abs/2502.12150) · [Rethinking Psychometric Evaluation of LLMs, 2026](https://arxiv.org/abs/2606.12730) · [Persona Vectors, 2025](https://arxiv.org/abs/2507.21509) · [Model Equality Testing, 2024](https://arxiv.org/abs/2410.20247)

### Runtime-independent persistent agents (Enoch)· multi-anchor identity

*research, research-prototype* · SOTA-AEO-14

Continuity substrate P_t=(I_t,M_t,B_t), έξι continuity invariants, πρωτόκολλο quiesce–checkpoint–validate–bind–rehydrate–resume. Ρητά στηρίζει mechanical substitutability και όχι behavioral invariance. Το multi-anchor paper (2026) παρουσιάζει τους βασικούς ισχυρισμούς του ως υποθέσεις χωρίς ελεγχόμενη επικύρωση.

**Για το GRAIL:** Ανεξάρτητη σχεδίαση που συγκλίνει με το §9.5. Επιβεβαιώνει ότι το χαρακτηρολογικό σκέλος είναι ανοικτό.

**Πηγές:** [Runtime-Independent Persistent Agents, 2026](https://arxiv.org/abs/2609.00546) · [Persistent Identity in AI Agents: A Multi-Anchor Architecture, 2026](https://arxiv.org/html/2604.09588)

### Progressive delivery & differential: Diffy, Argo Rollouts, N-version, strangler fig

*system, production* · SOTA-AEO-15

Diffy: candidate ∥ primary ∥ secondary· ο θόρυβος μετριέται ως primary-vs-secondary. Το repo αρχειοθετήθηκε το 2020 (υπάρχει fork Opendiffy). Argo Rollouts: canary/blue-green με metric analysis και αυτόματο rollback. N-version programming (Avizienis, IEEE TSE 1985). Strangler fig: σταδιακή υποκατάσταση πίσω από façade.

**Για το GRAIL:** Κάθε στάδιο του ORP έχει ώριμο ανάλογο· η βαθμονόμηση θορύβου λείπει από το πρόχειρο.

**Πηγές:** [twitter-archive/diffy, archived 2020](https://github.com/twitter-archive/diffy) · [Argo Rollouts, πρόσβαση 2026](https://github.com/argoproj/argo-rollouts) · [The N-Version Approach to Fault-Tolerant Software (Semantic Scholar record), 1985](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1109/TSE.1985.231893?fields=title,year,venue,authors) · [Strangler Fig pattern, 2026](https://learn.microsoft.com/en-us/azure/architecture/patterns/strangler-fig)

### Psychological continuity (Parfit), non-branching & fission

*research, theoretical* · SOTA-AEO-16

Οι θεωρίες ψυχολογικής συνέχειας αντιμετωπίζουν τη σχάση με τον όρο non-branching: ένα μελλοντικό ον είσαι εσύ μόνο αν κανένα άλλο δεν είναι τότε ψυχολογικά συνεχές μαζί σου.

**Για το GRAIL:** Θεμελιώνει το MnemonicCont/CharacterCont. Τα πολλά σώματα με αποκλίνοντες κλάδους είναι μορφή branching. Αν η φραγμένη απόκλιση και το υποχρεωτικό merge του §9.4 αρκούν φιλοσοφικά για να μη θεωρηθούν σχάση: δεν ξέρω.

**Πηγές:** [Personal Identity (SEP), 2002, αναθ. 2023](https://plato.stanford.edu/entries/identity-personal/)

### Neurotechnology ethics & BCI standards

*standard, pilot* · SOTA-AEO-17

UNESCO Recommendation on the Ethics of Neurotechnology (11/11/2025, μη δεσμευτική): prior, free and informed, δυναμική και τεκμηριωμένη συναίνεση, διαφάνεια. IEEE P2731 (Unified Terminology for BCIs): active PAR από 27/9/2018. IEEE P2794 (RSNIR, reporting standards για in vivo neural interface research): active PAR.

**Για το GRAIL:** Μόνο για το EP-09/ICD-25: πλαίσιο συναίνεσης και ορολογίας για μελλοντικές τροπικότητες.

**Πηγές:** [UNESCO Recommendation on the Ethics of Neurotechnology, 2025](https://www.unesco.org/en/legal-affairs/recommendation-ethics-neurotechnology) · [IEEE P2731, 2018](https://standards.ieee.org/ieee/2731/7383/) · [IEEE P2794 working group, πρόσβαση 2026](https://sagroups.ieee.org/2794/) · [IEEE WG P2794 overview (EMBC), 2019](https://sagroups.ieee.org/2794/wp-content/uploads/sites/17/2019/08/IEEE-WG-P2794_Overview-Pres_EMBC2019.pdf)

### EDPB Guidelines 02/2025 (blockchain), final v2.0

*standard, production* · SOTA-AEO-18

Η τελική έκδοση υιοθετήθηκε στις 7/7/2026. Συνιστά on-chain μόνο salted/keyed hash και off-chain τα δεδομένα. Και το hash θεωρείται personal data. Μετά τη διαγραφή κλειδιού/salt η προστασία ισχύει μόνο αν ο αλγόριθμος δεν έχει σπάσει και το κλειδί δεν έχει διαρρεύσει. Η κρυπτογράφηση ξεπερνιέται με τον χρόνο όταν η διατήρηση είναι αόριστη. Η τεχνική αδυναμία δεν δικαιολογεί μη συμμόρφωση.

**Για το GRAIL:** Εφαρμόζεται κατ' αναλογία στα REQ-MEM-002, INV-I03, ICD-29 EraseByControl: το ledger του GRAIL είναι ιδιωτικό append-only log με witnesses, όχι blockchain.

**Πηγές:** [EDPB Guidelines 02/2025 on blockchain (final v2.0), 2026](https://www.edpb.europa.eu/documents/guideline/guidelines-022025-on-processing-of-personal-data-through-blockchain_en)

### ATMS (assumption-based truth maintenance)

*research, research-prototype* · SOTA-AEO-19

Διαχείριση environments και nogoods αντί για μία συνεπή κατάσταση (de Kleer, Artificial Intelligence).

**Για το GRAIL:** Ο μηχανισμός του προχείρου για αντιφατικές μνήμες. Δεν βρέθηκε πηγή για κλιμάκωση σε μνήμη πρακτόρων.

**Πηγές:** [An Assumption-Based TMS (Semantic Scholar record· DOI 10.1016/0004-3702(86)90080-9), 1986 (το S2 δείχνει 1987)](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1016/0004-3702%2886%2990080-9?fields=title,year,venue,authors)

### Multi-agent memory consistency (computer-architecture view)

*research, theoretical* · SOTA-AEO-20

Διάκριση shared και distributed memory, ιεραρχία I/O–cache–memory· το πιο πιεστικό ανοικτό πρόβλημα είναι το multi-agent memory consistency.

**Για το GRAIL:** Τα πολλά σώματα χρειάζονται ρητό consistency model ανάγνωσης.

**Πηγές:** [Multi-Agent Memory from a Computer Architecture Perspective, 2026](https://arxiv.org/abs/2603.10062)

### ISO/IEC TS 27560:2023 consent record information structure

*standard, pilot* · SOTA-AEO-21

Δομή consent record: header, processing, parties, events. Τα events έχουν καταστάσεις given, withdrawn, requested, renewed, ώστε να καταγράφεται ο κύκλος ζωής της συναίνεσης. Υλοποίηση μέσω W3C DPV (οδηγός 15/2/2026).

**Για το GRAIL:** Έτοιμο σχήμα για συναίνεση ως Control Record (ICD-25) και για events ανάκλησης (GAP-AEO-08)· συμπληρώνει το VC 2.0. Η υιοθέτηση δεν επαληθεύτηκε.

**Πηγές:** [DPV guide: Implementing ISO/IEC TS 27560:2023 consent records, 2026](https://w3c-cg.github.io/dpv/guides/consent-27560)

### Statistical evaluation of language models (error bars)

*research, pilot* · SOTA-AEO-22

Formulas για ανάλυση evaluation data, μέτρηση διαφοράς δύο μοντέλων και σχεδιασμό πειράματος (ισχύς) με ελάχιστο στατιστικό θόρυβο.

**Για το GRAIL:** Στηρίζει το προκαταχωρισμένο, στατιστικά θεμελιωμένο κριτήριο differential/Battery (ICD-16, INV-O02, EXP-03).

**Πηγές:** [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640)

### AGM belief revision

*research, theoretical* · SOTA-AEO-23

Στο revision η νέα πρόταση προστίθεται και αφαιρούνται παλαιές όσο χρειάζεται για να μείνει ένα συνεπές belief set.

**Για το GRAIL:** Εναλλακτική του ATMS για το KT-05 που ελέγχθηκε: δεν είναι ανώτερη, γιατί εγκαταλείπει πεποιθήσεις αντί να κρατά εναλλακτικές.

**Πηγές:** [Logic of Belief Revision (SEP), 2006, αναθ. 2026](https://plato.stanford.edu/entries/logic-belief-revision/)


---

# Συλλογική συνείδηση — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### CRDT / Strong Eventual Consistency + μηχανικά ελεγμένες αποδείξεις σύγκλισης

*research, research-prototype* · SOTA-CCP-01

Τυπικό μοντέλο SEC με ικανές συνθήκες σύγκλισης για state-based και op-based CRDTs (Shapiro et al. 2011). Αρθρωτό framework σε Isabelle/HOL με τα πρώτα machine-checked θεωρήματα ορθότητας για τρία CRDTs (OOPSLA 2017).

**Για το GRAIL:** Θεμέλιο για INV-K01 και VT-103: οι αποδείξεις σύγκλισης επαναχρησιμοποιούνται αντί για μόνο model checking. Το SEC υποθέτει μη Byzantine replicas.

**Πηγές:** [Conflict-free Replicated Data Types (SSS 2011), 2011](https://www.lip6.fr/Marc.Shapiro/papers/2011/CRDTs_SSS-2011.pdf) · [Verifying Strong Eventual Consistency in Distributed Systems (PACMPL OOPSLA), 2017](https://arxiv.org/abs/1707.01747) · [crdt-isabelle repository, 2017](https://github.com/trvedata/crdt-isabelle)

### Byzantine Eventual Consistency (BEC) / Byzantine-fault-tolerant CRDTs

*research, research-prototype* · SOTA-CCP-02

Hash-DAG υπογεγραμμένων updates (ID = hash, predecessor hashes), συμφιλίωση χωρίς version vectors (που καταρρέουν υπό equivocation), εγκυρότητα που κρίνεται μόνο πάνω στο causal past (§3.4 του BFT-CRDT). Ανέχεται οσουσδήποτε Byzantine κόμβους (Sybil-immune). Θεώρημα: μια p2p βάση είναι Sybil-immune αν και μόνο αν όλες οι συναλλαγές είναι I-confluent ως προς όλα τα invariants· μη I-confluent παράδειγμα είναι το uniqueness constraint. Η keynote PaPoC 2025 παρουσιάζει το local-first access control υπό BEC ως νέα ερευνητική κατεύθυνση.

**Για το GRAIL:** Αυστηρά ανώτερο του «G-Set SEC» για το CMP-CCP-01 (και για claims/stances/taint) όταν υπάρχουν Byzantine σώματα (OS-08, KT-04). Το I-confluence δίνει τυπικό κριτήριο για το ποια επίπεδα μένουν coordination-free και ποια απαιτούν ordering.

**Πηγές:** [Byzantine Eventual Consistency and the Fundamental Limits of Peer-to-Peer Databases, 2020](https://arxiv.org/pdf/2012.00472) · [Making CRDTs Byzantine Fault Tolerant (PaPoC'22), 2022](https://martin.kleppmann.com/papers/bft-crdt-papoc22.pdf) · [Keynote: Byzantine Eventual Consistency and Local-First Access Control (PaPoC 2025), 2025](https://martin.kleppmann.com/2025/03/31/papoc-keynote-byzantine.html)

### BFT state machine replication: HotStuff-2, DAG-BFT (Mysticeti), Autobahn, CometBFT

*system, production* · SOTA-CCP-03

HotStuff-2: two-phase, optimistic responsiveness, O(n²) worst-case, μοντέλο partial synchrony με n = 3t+1. Mysticeti: uncertified DAG, 3 message rounds, ~0.5 s WAN, ενσωματωμένο στο Sui mainnet· η ημερομηνία ενεργοποίησης δεν επαληθεύτηκε. Autobahn: SOSP 2024. CometBFT: τελευταία έκδοση v0.40.0 (27 Ιουλ., νέο PQ key type mldsa65)· υπάρχουν και τελικές v1.0.0/v1.0.1· κρίσιμη ευπάθεια BFT Time CSA-2026-001 (Ιαν. 2026, patched σε v0.38.21/v0.37.18).

**Για το GRAIL:** Υποψήφιοι για τη διατοπική διάταξη verdicts (ADR-0031, INV-K06). Ο φόρτος verdicts είναι χαμηλός, άρα το throughput των DAG-BFT δεν χρειάζεται. Κριτήρια: απλότητα, ωριμότητα, επαληθευσιμότητα. Το CSA-2026-001 δείχνει ότι και οι ώριμες υλοποιήσεις έχουν σφάλματα consensus.

**Πηγές:** [HotStuff-2: Optimal Two-Phase Responsive BFT, 2023](https://eprint.iacr.org/2023/397) · [Mysticeti: Reaching the Latency Limits with Uncertified DAGs (NDSS 2025), 2025](https://www.ndss-symposium.org/wp-content/uploads/2025-929-paper.pdf) · [Autobahn: Seamless high speed BFT, 2024](https://arxiv.org/abs/2401.10369) · [SOSP 2024 accepted papers, 2024](https://sigops.org/s/conferences/sosp/2024/accepted.html) · [CometBFT releases, 2026](https://github.com/cometbft/cometbft/releases) · [CSA-2026-001: Tachyon (CometBFT BFT Time), 2026](https://github.com/cometbft/cometbft/security/advisories/GHSA-c32p-wcqj-j677)

### Transparency-log witness cosigning (C2SP tlog-witness, tlog-cosignature)

*standard, pilot* · SOTA-CCP-04

Ο witness συνυπογράφει checkpoint μόνο αφού επαληθεύσει consistency proof έναντι του τελευταίου checkpoint που συνυπέγραψε (έλεγχος atomic). Κατά το tlog-cosignature, οι clients μπορούν να επαληθεύουν quorum cosignatures για να αποτρέψουν split-view πριν εμπιστευτούν inclusion proof.

**Για το GRAIL:** Εναλλακτική ή συμπλήρωμα του BFT για non-equivocation του Court log (single-writer + k-of-n witnesses). Συμβατή με την έδρα tlog-1 και το witness model του προχείρου.

**Πηγές:** [Transparency Log Witness Protocol (C2SP), accessed 2026](https://c2sp.org/tlog-witness@v1.0.0) · [C2SP tlog-witness.md (editor's copy), accessed 2026](https://github.com/C2SP/C2SP/blob/main/tlog-witness.md) · [C2SP tlog-cosignature, accessed 2026](https://c2sp.org/tlog-cosignature)

### Dialogue systems με commitment stores (Prakken) και η γενεαλογία FIPA ACL

*research, research-prototype* · SOTA-CCP-05

Prakken (KER 2006): locutions claim/why/concede/retract/since/question, commitment stores, protocol, effect rules, turn-taking και termination rules. FIPA ACL (2002): ιστορικό πρότυπο performatives με mentalistic σημασιολογία. Η σημασιολογία του επικρίθηκε (Pitt & Mamdani 1999· Wooldridge 2000 για ζητήματα επαλήθευσης). Ο οργανισμός FIPA διαλύθηκε το 2005 και το fipa.org δεν σερβίρει πλέον τις προδιαγραφές.

**Για το GRAIL:** Άμεση γενεαλογία των ASSERT/CHALLENGE/CONCEDE/RETRACT του ICD-13 και των commitment stores του CMP-CCP-03. Δίνει τις pre/post-conditions και τους κανόνες τερματισμού που λείπουν.

**Πηγές:** [Formal systems for persuasion dialogue (Prakken, KER), 2006](https://webspace.science.uu.nl/~prakk101/pubs/dgreview.pdf) · [Some Remarks on the Semantics of FIPA's Agent Communication Language (S2 record), 1999](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1023/A:1010016503852) · [Semantic Issues in the Verification of Agent Communication Languages (S2 record), 2000](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1023/A:1010090027213) · [Foundation for Intelligent Physical Agents (Wikipedia), accessed 2026](https://en.wikipedia.org/wiki/Foundation_for_Intelligent_Physical_Agents)

### Declarative information protocols (BSPL, Langshaw) εκτελούμενα από LLM agents (Ahoy, Strabo)

*research, research-prototype* · SOTA-CCP-06

Το BSPL (AAMAS 2011) μοντελοποιεί πρωτόκολλα με βάση την πληροφορία που χρειάζονται και παράγουν, όχι με control flow. Langshaw (IJCAI 2024· arXiv 2026): sayso, conflict constructs, έλεγχος safety/liveness. Ahoy (EMAS 2026): LLM agents εκτελούν πολλαπλά declarative πρωτόκολλα, και ταυτόχρονα, χωρίς ειδική εκπαίδευση. Strabo (2026): το τμήμα checkout του UCP ως πρωτόκολλο Langshaw, διαλειτουργικό με υπάρχουσες υλοποιήσεις UCP.

**Για το GRAIL:** Ανώτερη μέθοδος προδιαγραφής για τα typed speech acts του ICD-13: τα πρωτόκολλα γίνονται επαληθεύσιμα αντικείμενα, όχι λίστα performatives.

**Πηγές:** [BSPL, the Blindingly Simple Protocol Language (AAMAS 2011), 2011](https://www.cs.huji.ac.il/~jeff/aamas11/papers/A4_B57.pdf) · [Ahoy: LLMs Enacting Multiagent Interaction Protocols, 2026](https://arxiv.org/abs/2606.05390) · [Strabo: Declarative Specification and Implementation of Agentic Interaction Protocols, 2026](https://arxiv.org/abs/2606.05043) · [Langshaw: Declarative Interaction Protocols Based on Sayso and Conflict, 2026](https://arxiv.org/abs/2606.29601)

### Βιομηχανικά agent πρωτόκολλα: A2A 1.0 (LF), MCP (AAIF), ANP

*standard, production* · SOTA-CCP-07

A2A: latest released 1.0.0· Agent Card signing (§8.4)· TaskState: 8 καταστάσεις + UNSPECIFIED· Parts text/file/structured data· extensions με URI· καμία έννοια commitments, voting ή dissent. LF project από τον Ιούνιο 2025, με >100 εταιρείες τότε. MCP: founding project του Agentic AI Foundation (LF, Δεκ. 2025)· τρέχουσα spec 2026-07-28. ANP: ταυτότητα με did:wba, spec set 1.1. Μελέτη 2026: voting και dissent preservation απουσιάζουν από MCP, A2A, ACP, ANP, ERC-8004.

**Για το GRAIL:** Κανένα δεν αντικαθιστά το ECP. Το A2A είναι το φυσικό εξωτερικό όριο (adapter), με τις πράξεις ECP ως data Parts κάτω από extension URI.

**Πηγές:** [A2A Protocol Specification (latest), 2026](https://a2a-protocol.org/latest/specification/) · [Linux Foundation Launches the Agent2Agent Protocol Project, 2025](https://www.linuxfoundation.org/press/linux-foundation-launches-the-agent2agent-protocol-project-to-enable-secure-intelligent-communication-between-ai-agents) · [MCP joins the Agentic AI Foundation, 2025](https://blog.modelcontextprotocol.io/posts/2025-12-09-mcp-joins-agentic-ai-foundation/) · [MCP Specification (latest, 2026-07-28), 2026](https://modelcontextprotocol.io/specification/latest) · [AgentNetworkProtocol repository, accessed 2026](https://github.com/agent-network-protocol/AgentNetworkProtocol) · [Governance Gaps in Agent Interoperability Protocols: What MCP, A2A, and ACP Cannot Express, 2026](https://arxiv.org/abs/2606.31498)

### Agora meta-protocol (Protocol Documents με hash)

*research, research-prototype* · SOTA-CCP-08

Τυποποιημένες ρουτίνες για συχνές επικοινωνίες, φυσική γλώσσα για σπάνιες, LLM-written ρουτίνες για τα ενδιάμεσα. Κάθε Protocol Document ταυτοποιείται με SHA1 hash. Σε demo 100 agents, ~5× φθηνότερο από την επικοινωνία μόνο με φυσική γλώσσα (36.23 έναντι 7.67 USD ανά 1000 queries).

**Για το GRAIL:** Εμπειρική στήριξη της θέσης «typed, όχι free text» (INV-K05) και τρόπος να παίρνουν εκδόσεις οι τύποι speech acts: σχήματα content-addressed στο CAS.

**Πηγές:** [A Scalable Communication Protocol for Networks of Large Language Models, 2024](https://arxiv.org/html/2410.11905v1)

### Structured argumentation: Dung AF, ASPIC+, Carneades, AIF, ICCMA

*research, research-prototype* · SOTA-CCP-09

Dung (AIJ 1995): abstract AF. ASPIC+ (2014): strict/defeasible rules, attack σε uncertain premises, defeasible inferences ή conclusions, preferences. Carneades (AIJ 2007): μοντέλο argument και burden of proof, με κατηγοριοποίηση premises που καθορίζει τις αποδεικτικές απαιτήσεις. AIF (KER 2006): I-, RA-, CA- και PA-nodes για ανταλλαγή argument graphs. ICCMA: διαγωνισμός για abstract AF· το ICCMA 2025 κάλυψε abstract και assumption-based argumentation, χωρίς track ASPIC+.

**Για το GRAIL:** Στηρίζει την επιλογή ASPIC+ και grounded για το CMP-CCP-02. Αναδεικνύει τα κενά AIF (interchange) και burden of proof.

**Πηγές:** [On the Acceptability of Arguments... (Dung, S2 record), 1995](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1016/0004-3702(94)00041-X) · [The ASPIC+ framework for structured argumentation: a tutorial (S2 record), 2014](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1080/19462166.2013.869766) · [The Carneades model of argument and burden of proof (S2 record), 2007](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1016/j.artint.2007.04.010) · [Towards an argument interchange format (S2 record), 2006](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1017/S0269888906001044) · [The third and fourth ICCMA: Design, results and analysis (S2 record), 2024](https://api.semanticscholar.org/graph/v1/paper/DOI:10.3233/AAC-230013) · [ICCMA 2025, 2025](https://www.argumentationcompetition.org/2025/index.html)

### LLM + τυπική argumentation (ArgLLMs, MArgE) με QBAF και gradual semantics

*research, research-prototype* · SOTA-CCP-10

Τα ArgLLMs (AAAI 2025) κατασκευάζουν QBAFs από εξόδους LLM και κάνουν ντετερμινιστική inference με gradual semantics (DF-QuAD), για επεξηγήσιμο και αμφισβητήσιμο claim verification. Το MArgE (2025) συνενώνει επιχειρήματα πολλών LLM σε QBAF με DF-QuAD και ξεπερνά μεμονωμένα LLM, τα ArgLLMs και μεθόδους αδόμητου multi-LLM debate.

**Για το GRAIL:** Άμεση ένδειξη ότι το συλλογικό μέσω τυπικού argument graph (CMP-CCP-02) ξεπερνά το free debate. Με άλλο φορμαλισμό όμως (QBAF/gradual, όχι ASPIC+/grounded): υποψήφιο σκέλος του EXP-16 και του EXP-02.

**Πηγές:** [Argumentative Large Language Models for Explainable and Contestable Claim Verification (AAAI 2025), 2025](https://ojs.aaai.org/index.php/AAAI/article/view/33637) · [ArgLLMs (arXiv HTML), 2024](https://arxiv.org/html/2405.02079) · [MArgE: Meshing Argumentative Evidence from Multiple LLMs, 2025](https://arxiv.org/html/2508.02584)

### Nanopublications (assertion / provenance / publication info, + knowledge provenance)

*standard, pilot* · SOTA-CCP-11

Κάθε nanopublication είναι μικρή μονάδα RDF με assertion, provenance και publication info. Επέκταση του IRCDL 2025: τέταρτο συστατικό knowledge provenance για ισχυρισμούς που προέρχονται από σώμα υποστηρικτικής και αντιφατικής μαρτυρίας, εφαρμοσμένο σε 197.511 assertions.

**Για το GRAIL:** Πρότυπο σχήμα για τα evidence-item και proof-carrying-claim του ICD-13, συμβατό με PROV και RDF (KNW).

**Πηγές:** [Nanopublications: A Growing Resource of Provenance-Centric Scientific Linked Data (IEEE eScience), 2018](https://arxiv.org/abs/1809.06532) · [nanopub.net, accessed 2026](https://nanopub.net/) · [Extending Nanopublications with Knowledge Provenance for Multi-Source Scientific Assertions (IRCDL 2025), 2025](https://ceur-ws.org/Vol-3937/paper10.pdf)

### Εμπειρική επιστήμη LLM MAS: failure taxonomy, scaling, debate έναντι ensembling

*research, research-prototype* · SOTA-CCP-12

MAST: 14 failure modes σε 3 κατηγορίες (system design, inter-agent misalignment, task verification), πάνω από 1600 annotated traces. Scaling Agent Systems: 260 διαμορφώσεις, από +80.8% (decomposable financial reasoning) έως −70.0% (sequential planning)· αρχιτεκτονικές χωρίς κεντρική επαλήθευση διαδίδουν περισσότερα σφάλματα. Debate or Vote (NeurIPS 2025 spotlight): το majority voting εξηγεί τα περισσότερα κέρδη του MAD και το debate είναι martingale. Stop Overvaluing MAD: συχνά δεν ξεπερνά CoT/Self-Consistency, η ετερογένεια βοηθά. Self-MoA: +6.6% έναντι MoA στο AlpacaEval 2.0. Talk isn't cheap: το debate μπορεί να μειώσει την ακρίβεια. Αφετηρίες: Du et al. (ICML 2024), MoA (2024).

**Για το GRAIL:** Ορίζει baselines και κριτήρια θανάτωσης που λείπουν από το EXP-02. Δείχνει ότι η τοπολογία του CMP-CCP-07 πρέπει να εξαρτάται από τη δομή της εργασίας.

**Πηγές:** [Why Do Multi-Agent LLM Systems Fail?, 2025](https://arxiv.org/abs/2503.13657) · [Towards a Science of Scaling Agent Systems, 2025](https://arxiv.org/abs/2512.08296) · [Debate or Vote: Which Yields Better Decisions in Multi-Agent LLMs?, 2025](https://arxiv.org/abs/2508.17536) · [Stop Overvaluing Multi-Agent Debate, 2025](https://arxiv.org/abs/2502.08788) · [Rethinking Mixture-of-Agents (Self-MoA), 2025](https://arxiv.org/abs/2502.00674) · [Talk Isn't Always Cheap: Understanding Failure Modes in Multi-Agent Debate, 2025](https://arxiv.org/abs/2509.05396) · [Improving Factuality and Reasoning through Multiagent Debate (ICML 2024), 2024](https://proceedings.mlr.press/v235/du24e.html) · [Mixture-of-Agents Enhances LLM Capabilities, 2024](https://arxiv.org/abs/2406.04692)

### Conformity, consensus collapse, factual attrition σε LLM MAS

*research, research-prototype* · SOTA-CCP-13

Free-MAD: anti-conformity και score πάνω σε ολόκληρη την τροχιά, χωρίς consensus. Conformity Dynamics: η τοπολογία ρυθμίζει ταχύτητα και ανθεκτικότητα· περισσότερη συνδεσιμότητα αυξάνει τα wrong-but-sure cascades. Not All Flips: αντιπαραδειγματική αποσύνθεση σε spontaneous instability, conformity και persuasion· strict conformity 29% στο κύριο setting, με 57–77% correct-to-wrong στις αναπαραγωγές· ακόμη και vacuous reasoning συνδέεται με 20–39% υιοθέτηση σφάλματος. Deliberative Illusion (DelibTrace): σβήνει έως 72% των issue-critical facts ενώ η συμφωνία αυξάνεται. Biased consensus: μετάβαση φάσης πάνω από κρίσιμο κατώφλι conformity, που η ετερογένεια στρογγυλεύει.

**Για το GRAIL:** Τεκμηριώνει ανεξαρτησία stance πριν από την έκθεση, αιτιολογημένες αλλαγές stance και μέτρηση επιβίωσης γεγονότων (CMP-CCP-05, KT-07).

**Πηγές:** [Free-MAD: Consensus-Free Multi-Agent Debate, 2025](https://arxiv.org/abs/2509.11035) · [Conformity Dynamics in LLM Multi-Agent Systems, 2026](https://arxiv.org/abs/2601.05606) · [Not All Flips Are Conformity, 2026](https://arxiv.org/abs/2606.00820) · [The Deliberative Illusion, 2026](https://arxiv.org/abs/2606.03032) · [Emergence of Biased Consensus in Multi-Agent LLM Debates, 2026](https://arxiv.org/abs/2608.02827)

### Συσχετισμένα σφάλματα LLM και wisdom of the silicon crowd

*research, research-prototype* · SOTA-CCP-14

Σε >350 LLM (ICML 2025): σε ένα leaderboard dataset τα μοντέλα συμφωνούν 60% των φορών όταν σφάλλουν και τα δύο. Η συσχέτιση οδηγείται από κοινή αρχιτεκτονική και πάροχο· τα μεγαλύτερα και ακριβέστερα μοντέλα έχουν ισχυρά συσχετισμένα σφάλματα ανεξαρτήτως αρχιτεκτονικής ή οργανισμού. Ensemble 12 LLM σε 31 δυαδικές ερωτήσεις forecasting δεν διαφέρει στατιστικά από πλήθος 925 ανθρώπων (Science Advances 2024).

**Για το GRAIL:** Η plurality doctrine και οι μετρήσεις stances υπερεκτιμούν την ανεξαρτησία αν δεν μετρηθεί η συσχέτιση. Αφορά EXP-02, CMP-CCP-05, ADR-0019.

**Πηγές:** [Correlated Errors in Large Language Models (ICML 2025), 2025](https://arxiv.org/abs/2506.07962) · [Wisdom of the Silicon Crowd (arXiv), 2024](https://arxiv.org/abs/2402.19379) · [Wisdom of the silicon crowd (Science Advances, S2 record), 2024](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1126/sciadv.adp1528)

### Συνάθροιση πέρα από την πλειοψηφία: bridging, surprisingly popular, conformal social choice

*system, production* · SOTA-CCP-15

Birdwatch/Community Notes: bridging-based επιλογή με matrix factorization, με μετρημένη μείωση reshares σε field πείραμα. LLM-written notes (2026): υψηλότερες βαθμολογίες από τις ανθρώπινες σε raters όλου του πολιτικού φάσματος. Surprisingly popular (Nature 2017): επιλέγεται η απάντηση που είναι πιο δημοφιλής από όσο προβλέπουν οι ψηφοφόροι. Conformal social choice (2026): linear opinion pool + split conformal, κάλυψη ≥1−α· singleton → πράξη, αλλιώς κλιμάκωση· αναχαιτίζει 81.9% των λανθασμένων consensus σε α=0.05, με όφελος από επιλογή και όχι από καλύτερη συλλογιστική.

**Για το GRAIL:** Μη αυθεντικές παράγωγες όψεις για stances (CMP-CCP-05, CMP-CCP-06). Το conformal act-vs-escalate ευθυγραμμίζεται με το INV-C04 (Unknown).

**Πηγές:** [Birdwatch: Crowd Wisdom and Bridging Algorithms, 2022](https://arxiv.org/abs/2210.15723) · [AI Fact-Checking in the Wild: LLM-Written Community Notes on X, 2026](https://arxiv.org/abs/2604.02592) · [A solution to the single-question crowd wisdom problem (Europe PMC record), 2017](https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=DOI:%2210.1038/nature21054%22&resultType=core&format=json) · [From Debate to Decision: Conformal Social Choice for Safe Multi-Agent Deliberation, 2026](https://arxiv.org/abs/2604.07667)

### Διαβούλευση με διαμεσολάβηση AI: Habermas Machine, Polis

*system, pilot* · SOTA-CCP-16

Habermas Machine (Science 2024, N=5.734): οι συμμετέχοντες προτίμησαν τις δηλώσεις κοινού εδάφους που παρήγαγε το AI από εκείνες ανθρώπινων mediators· οι επιτυχημένες δηλώσεις ενσωμάτωναν τις διαφωνούσες φωνές σεβόμενες την πλειοψηφία. Επαναλήφθηκε σε citizens' assembly στο ΗΒ. Polis (Recerca 2021): χαρτογράφηση υψηλοδιάστατων χώρων γνώμης για διαβούλευση σε κλίμακα.

**Για το GRAIL:** Πρότυπο για προαιρετικό, μη αυθεντικό επίπεδο σύνθεσης κοινού εδάφους με διατήρηση της διαφωνίας· απουσιάζει από το ECP.

**Πηγές:** [AI can help humans find common ground in democratic deliberation (S2 record), 2024](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1126/science.adq2852) · [Polis: Scaling Deliberation by Mapping High Dimensional Opinion Spaces (αντίγραφο), 2021](https://gwern.net/doc/sociology/2021-small.pdf)

### Υποστρώματα συντονισμού: blackboard LLM MAS, SOP-driven MAS, auction allocation

*research, research-prototype* · SOTA-CCP-17

Blackboard LLM MAS (2025): καλύτερη μέση απόδοση με λιγότερα tokens σε commonsense και μαθηματικά. Blackboard για data discovery (2025): 13%–57% σχετική βελτίωση στην end-to-end επιτυχία έναντι της καλύτερης baseline, χωρίς master με πλήρη γνώση των agents. MetaGPT: SOPs κωδικοποιημένα σε prompts, assembly-line με επαλήθευση ενδιάμεσων αποτελεσμάτων. Agora (2026): bid = (calibrated confidence)^γ − β·cost. DALA (2025): agents κάνουν bid για να μιλήσουν, με εμφάνιση «strategic silence» και χαμηλό κόστος tokens.

**Για το GRAIL:** Αντίστοιχα του CMP-CCP-07. Κανένα δεν αποδεικνύεται ανώτερο σε όλα τα κριτήρια· η αξία εξαρτάται από την εργασία.

**Πηγές:** [Exploring Advanced LLM Multi-Agent Systems Based on Blackboard Architecture, 2025](https://arxiv.org/abs/2507.01701) · [LLM-Based Multi-Agent Blackboard System for Information Discovery in Data Science, 2025](https://arxiv.org/abs/2510.01285) · [MetaGPT: Meta Programming for A Multi-Agent Collaborative Framework, 2023](https://arxiv.org/abs/2308.00352) · [Agora: Enhancing LLM Agent Reasoning Via Auction-Based Task Allocation, 2026](https://arxiv.org/html/2607.09600v1) · [Cost-Effective Communication: An Auction-based Method for Language Agent Interaction, 2025](https://arxiv.org/abs/2511.13193)

### Multi-agent security: prompt infection, steganographic collusion, Byzantine LLM agents

*research, research-prototype* · SOTA-CCP-18

Prompt Infection: αυτο-αναπαραγόμενο LLM-to-LLM injection· άμυνα LLM Tagging σε συνδυασμό με υπάρχοντα μέτρα. Secret Collusion: πλαίσιο αξιολόγησης ικανοτήτων steganographic συνωμοσίας· σήμερα περιορισμένες ικανότητες, με άλμα στα frontier LLM που απαιτεί συνεχή παρακολούθηση. Multi-Agent Risks (2025): 3 failure modes (miscoordination, conflict, collusion) και 7 risk factors, μεταξύ τους το multi-agent security. Can AI Agents Agree? (2026): η έγκυρη συμφωνία δεν είναι αξιόπιστη ούτε σε καλοήθεις συνθήκες και χειροτερεύει με το μέγεθος της ομάδας. DecentLLMs (2025): Byzantine-robust αποκεντρωμένη συνάθροιση χωρίς ευάλωτο leader.

**Για το GRAIL:** Δείχνει ότι το INV-K05 δεν αρκεί και ότι το consensus δεν ανατίθεται σε LLM agents: γίνεται σε τυπικό BFT/witnesses ή σε verifiers.

**Πηγές:** [Prompt Infection: LLM-to-LLM Prompt Injection within Multi-Agent Systems, 2024](https://arxiv.org/abs/2410.07283) · [Secret Collusion among AI Agents: Multi-Agent Deception via Steganography, 2024](https://arxiv.org/abs/2402.07510) · [Multi-Agent Risks from Advanced AI, 2025](https://arxiv.org/abs/2502.14143) · [Can AI Agents Agree?, 2026](https://arxiv.org/abs/2603.01213) · [Byzantine-Robust Decentralized Coordination of LLM Agents, 2025](https://arxiv.org/abs/2507.14928)

### Keyhive: local-first access control (convergent capabilities, group CRDT, E2EE)

*tool, research-prototype* · SOTA-CCP-19

Convergent capabilities (self-certifying αλυσίδες delegation), CRDT διαχείρισης ομάδας με coordination-free revocation, E2EE με causal keys και post-compromise security (BeeKEM), Sedimentree για συγχρονισμό κρυπτογραφημένου περιεχομένου. Pre-alpha (Μάρτιος 2025), χωρίς audit, «όχι για παραγωγή»· notebook 2024–2026.

**Για το GRAIL:** Πρότυπο για ιδιωτικές stances και εμπιστευτικά domains μέσα σε αναπαραγόμενα επίπεδα του ECP (INV-K04, INV-L03).

**Πηγές:** [Keyhive: Local-first access control (lab notebook), 2026](https://www.inkandswitch.com/keyhive/notebook/)

### Επιστήμη συλλογικής νοημοσύνης και knowledge commons (με την αμφισβήτησή της)

*research, theoretical* · SOTA-CCP-20

Riedl et al. (PNAS 2021): 22 μελέτες, 5.279 άτομα, 1.356 ομάδες· υποστηρίζουν ισχυρό CI factor. Δημοσιεύθηκε διόρθωση το 2022 (περιεχόμενο μη επαληθευμένο εδώ). Αποτυχίες αναπαραγωγής: Bates & Gupta (2017)· Credé & Howardson (2017, στατιστικά artifacts), με αντίκρουση από Woolley et al. (2018), κατά την ανασκόπηση Janssens et al. (2022). Hess & Ostrom (2006/2007): πλαίσιο ανάλυσης knowledge commons.

**Για το GRAIL:** Η plurality doctrine δεν μπορεί να στηριχθεί στον c-factor ως αποδεδειγμένο· απαιτείται εμπειρική επίδειξη (EXP-02). Η Ostrom δίνει θεσμικό λεξιλόγιο διακυβέρνησης commons, όχι μηχανισμό.

**Πηγές:** [Quantifying collective intelligence in human groups (Europe PMC record), 2021](https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=DOI:%2210.1073/pnas.2005737118%22&resultType=core&format=json) · [Correction for Riedl et al. (S2 record), 2022](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1073/pnas.2204380119) · [Collective intelligence in teams (Frontiers in Psychology), 2022](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2022.989572/full) · [Understanding Knowledge as a Commons (Open Library record), 2006](https://openlibrary.org/search.json?q=Understanding+Knowledge+as+a+Commons)

### CaMeL: prompt-injection defense by design (control/data-flow separation + capabilities)

*research, research-prototype* · SOTA-CCP-21

Εξάγει ρητά control και data flow από το έμπιστο query, ώστε τα μη έμπιστα δεδομένα να μη μπορούν ποτέ να επηρεάσουν τη ροή του προγράμματος. Capabilities επιβάλλουν πολιτικές ασφαλείας σε κάθε κλήση εργαλείου. Στο AgentDojo λύνει 77% των εργασιών με provable security, έναντι 84% χωρίς άμυνα.

**Για το GRAIL:** Ισχυρότερη απάντηση από το heuristic LLM Tagging για injection μέσα από typed πεδία (GAP-CCP-07). Συμπληρώνει τα INV-K05 και INV-S01, δεν τα αντικαθιστά· σχεδιασμένο για tool-use ενός agent, όχι για πολυπρακτορικό κανάλι.

**Πηγές:** [Defeating Prompt Injections by Design (CaMeL), 2025](https://arxiv.org/abs/2503.18813)

### Trust-BFT: BFT με trusted components (λιγότερα replicas)

*research, research-prototype* · SOTA-CCP-22

Τα κλασικά BFT χρειάζονται f replicas περισσότερα από τα Paxos-style για να αποτρέψουν equivocation· τα Trust-BFT μειώνουν αυτό το κόστος με trusted components στους replicas. Οι Gupta et al. εντοπίζουν τρεις περιορισμούς που αποκλείουν τις περισσότερες πρακτικές αναπτύξεις, μερικούς θεμελιώδεις και μερικούς δεμένους στην τρέχουσα κατάσταση των trusted components.

**Για το GRAIL:** Εναλλακτική για REQ-CCP-008 και DEC-CCP-02: με τα HSM/TEE του trust plane, 3 sites θα μπορούσαν να ανεχθούν f=1. Όχι αυστηρά ανώτερη: προσθέτει υπόθεση εμπιστοσύνης στο hardware και έχει τεκμηριωμένους περιορισμούς.

**Πηγές:** [Dissecting BFT Consensus: In Trusted Components we Trust!, 2022](https://arxiv.org/abs/2202.01354)


---

# Epistemic Court & Adversarial Entity — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### AI safety via debate και εμπειρικά αποτελέσματα debate

*research, research-prototype* · SOTA-ADV-01

Δύο πράκτορες αντιπαρατίθενται και κρίνει ασθενέστερος κριτής. Με βέλτιστο παίγνιο απαντώνται ερωτήματα PSPACE με πολυωνυμικό κριτή (Irving et al. 2018). Με debate, μη ειδικά μοντέλα φτάνουν 76% και άνθρωποι 88%, έναντι 48% και 60% των naive baselines (Khan et al. ICML 2024). Το debate υπερέχει του consultancy σε όλα τα tasks (math, code, logic, multimodal) όταν ο consultant ανατίθεται τυχαία. Έναντι direct QA υπερέχει μόνο σε extractive QA με information asymmetry· αλλού τα αποτελέσματα είναι μικτά (Kenton et al. NeurIPS 2024). Το self-play των debaters αυξάνει την ακρίβεια του κριτή, ενώ για consultancy δεν βρέθηκε τέτοια σχέση (Arnesen et al. 2024).

**Για το GRAIL:** Θεμέλιο για Court όπου ασθενέστερος κριτής εποπτεύει ισχυρότερους. Το όφελος εξαρτάται από την ασυμμετρία πληροφορίας και από το baseline, άρα δεν είναι γενικό.

**Πηγές:** [AI safety via debate, 2018](https://arxiv.org/abs/1805.00899) · [Debating with More Persuasive LLMs Leads to More Truthful Answers, 2024](https://proceedings.mlr.press/v235/khan24a.html) · [On scalable oversight with weak LLMs judging strong LLMs, 2024](https://arxiv.org/abs/2407.04622) · [Training Language Models to Win Debates with Self-Play Improves Judge Accuracy, 2024](https://arxiv.org/abs/2409.16636)

### Complexity-theoretic debate: doubly-efficient, prover-estimator, DQC, safety case

*research, theoretical* · SOTA-ADV-02

Doubly-efficient debate: η έντιμη στρατηγική κερδίζει με προσομοίωση πολυωνυμικού αριθμού βημάτων, και για στοχαστικά συστήματα (Brown-Cohen, Irving, Piliouras 2023). Prover-estimator debate: αντιμετωπίζει το obfuscated arguments problem με υπολογιστικό κόστος του έντιμου συγκρίσιμο με του αντιπάλου, υπό stability assumptions (2025, αναθ. 2026). Debate Query Complexity: η PSPACE/poly είναι ακριβώς η κλάση που αποφασίζεται με O(log n) queries (2026). Safety case sketch με debate: τέσσερις ρητοί ισχυρισμοί και ανοιχτά προβλήματα (Buhl et al. 2025).

**Για το GRAIL:** Θεωρητική βάση για διαδικασία που στενεύει τη διαφωνία σε λίγα ελέγξιμα βήματα, και πρότυπο safety case για το Court. Οι εγγυήσεις προϋποθέτουν ότι ο ισχυρισμός είναι υπολογισμός.

**Πηγές:** [Scalable AI Safety via Doubly-Efficient Debate, 2023](https://arxiv.org/abs/2311.14125) · [Avoiding Obfuscation with Prover-Estimator Debate, 2025](https://arxiv.org/abs/2506.13609) · [Debate is efficient with your time, 2026](https://arxiv.org/abs/2602.08630) · [An alignment safety case sketch based on debate, 2025](https://arxiv.org/abs/2505.03989)

### Σύγκριση πρωτοκόλλων oversight 2025–2026

*research, research-prototype* · SOTA-ADV-03

Proposer-critic debate σε code και logic tasks που ελέγχονται προγραμματιστικά: κέρδος έναντι consultancy μόνο όταν η ικανότητα ταξινόμησης του critic ξεπερνά του κριτή και ο κριτής ελέγχει τις θέσεις του critic αντί να τις συνοψίζει. Αυτό ίσχυσε σε 3 από 5 ζεύγη, και μία ανεξάρτητη κριτική ανακτά το μεγαλύτερο μέρος του οφέλους (Elasky et al. 2026). Η collaborative disagreement resolution δίνει 62,1% ακρίβεια κριτή έναντι 49,2% του standard debate (Jiang et al. ICML 2026). NSO σε general Elo gap 400: Mafia 13,5%, Debate 51,7%, Backdoor Code 10,0%, Wargames 9,4% (Engels et al. NeurIPS 2025).

**Για το GRAIL:** Το πρωτόκολλο είναι ανοιχτό εμπειρικό ερώτημα, και κανένα LLM πρωτόκολλο δεν αρκεί ως άγκυρα εμπιστοσύνης.

**Πηγές:** [Debate Helps Weak Judges Reward Stronger Models, 2026](https://arxiv.org/abs/2605.27483) · [Collaborative Disagreement Resolution for Scalable Oversight, 2026](https://arxiv.org/abs/2607.01251) · [Scaling Laws For Scalable Oversight, 2025](https://arxiv.org/abs/2504.18530)

### Multi-agent debate έναντι ψηφοφορίας· αξία της μειοψηφίας

*research, research-prototype* · SOTA-ADV-04

Η majority voting εξηγεί το μεγαλύτερο μέρος των κερδών του multi-agent debate. Το debate επάγει martingale πάνω στις πεποιθήσεις και από μόνο του δεν αυξάνει την αναμενόμενη ορθότητα (Choi, Zhu, Li NeurIPS 2025). Λόγω συσχετισμένων σφαλμάτων, σε περίπου 1 στις 4 αποκλίνουσες περιπτώσεις η μειοψηφία έχει δίκιο. Meta-classifier πάνω στα logs πετυχαίνει Flip Precision 81,2%, δηλαδή ακρίβεια των αποφάσεων ανατροπής (Minority Sentinel 2026).

**Για το GRAIL:** Στηρίζει το INV-K03 (το dissent είναι σήμα) και δείχνει ότι η πλειοψηφία LLM δεν είναι ετυμηγορία αλήθειας.

**Πηγές:** [Debate or Vote: Which Yields Better Decisions in Multi-Agent Large Language Models, 2025](https://proceedings.neurips.cc/paper_files/paper/2025/hash/934252acd87f254d5d4672fbde283bd2-Abstract-Conference.html) · [Minority Sentinel: When to Overturn Majority Voting in Multi-Agent LLM Debates, 2026](https://arxiv.org/abs/2606.29270)

### Prover-verifier games (legibility) και weak-to-strong

*research, research-prototype* · SOTA-ADV-05

Μικροί verifiers εκπαιδεύονται απέναντι σε helpful και sneaky provers. Η legibility μεταφέρεται σε ανθρώπους με χρονικό περιορισμό: η ακρίβειά τους αυξάνεται στις helpful λύσεις και μειώνεται στις sneaky (Kirchner et al. 2024). Ισχυρά μοντέλα εκπαιδευμένα με ετικέτες ασθενούς επόπτη τον ξεπερνούν, αλλά η naive finetuning απέχει πολύ από πλήρη ανάκτηση ικανοτήτων (Burns et al. 2023).

**Για το GRAIL:** Στηρίζει την απαίτηση ο Adversary να παράγει μαρτυρίες ελέγξιμες από ασθενέστερους ή μηχανικούς ελεγκτές. Η εποπτεία από ασθενέστερο είναι εν μέρει μόνο εφικτή.

**Πηγές:** [Prover-Verifier Games improve legibility of LLM outputs, 2024](https://arxiv.org/abs/2407.13692) · [Weak-to-Strong Generalization: Eliciting Strong Capabilities With Weak Supervision, 2023](https://arxiv.org/abs/2312.09390)

### Biases και ευπάθειες του LLM-as-judge

*research, research-prototype* · SOTA-ADV-06

Position, verbosity και self-enhancement bias και περιορισμένη συλλογιστική, παρότι οι ισχυροί LLM κριτές συμφωνούν με ανθρώπους σε ποσοστό άνω του 80% (Zheng et al. NeurIPS 2023 D&B). Self-preference σε γραμμική συσχέτιση με την ικανότητα αυτο-αναγνώρισης (Panickssery et al. 2024). «Master keys»: σύμβολα όπως «:» ή «.» και φράσεις όπως «Thought process:» προκαλούν ψευδώς θετικές ανταμοιβές. Mitigation είναι το data augmentation με κομμένες εξόδους (Master-RMs), δηλαδή αντίδραση εκ των υστέρων (Zhao et al. 2025).

**Για το GRAIL:** Ο LLM κριτής είναι επιφάνεια επίθεσης, παρά την καλή μέση συμφωνία. Αυτό δικαιολογεί τον μη-LLM oracle και red-team γεννήτριες κατά του κριτή.

**Πηγές:** [Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena, 2023](https://arxiv.org/abs/2306.05685) · [LLM Evaluators Recognize and Favor Their Own Generations, 2024](https://arxiv.org/abs/2404.13076) · [One Token to Fool LLM-as-a-Judge, 2025](https://arxiv.org/abs/2507.08794)

### LLM juries και βαθμονόμηση panels

*research, pilot* · SOTA-ADV-07

PoLL: panel πολλών μικρότερων μοντέλων από disjoint οικογένειες ξεπερνά έναν μεγάλο κριτή, με λιγότερο intra-model bias και πάνω από 7 φορές χαμηλότερο κόστος (Verga et al. 2024). Finite-Calibration Regime Map: με λίγες ανθρώπινες ετικέτες, το scalar/reliability aggregation έχει χαμηλότερο MSE από το unrestricted joint-table calibration σε 16 από 20 κελιά κατά point estimate. Σε 11 κελιά τα 95% διαστήματα εξαιρούν το μηδέν (4 datasets, 7 κριτές· Zhu, Xie, Rao 2026). Alt-test: στατιστική διαδικασία που δικαιολογεί την αντικατάσταση ανθρώπων σχολιαστών από LLM με μέτριο δείγμα ετικετών (Calderon, Reichart, Dror 2025).

**Για το GRAIL:** Μέθοδοι για τα panels του CMP-ADV-02 και για τον σχεδιασμό του EXP-04.

**Πηγές:** [Replacing Judges with Juries: Evaluating LLM Generations with a Panel of Diverse Models, 2024](https://arxiv.org/abs/2404.18796) · [A Finite-Calibration Regime Map for LLM Judge Panels, 2026](https://arxiv.org/abs/2606.01034) · [The Alternative Annotator Test for LLM-as-a-Judge, 2025](https://arxiv.org/abs/2501.10970)

### Συσχετισμένα σφάλματα και όρια της ποικιλομορφίας (N-version)

*research, research-prototype* · SOTA-ADV-08

Σε πάνω από 350 LLMs, όταν σφάλλουν και τα δύο μοντέλα συμφωνούν στο 60% των περιπτώσεων. Τα μεγαλύτερα και ακριβέστερα μοντέλα έχουν ισχυρά συσχετισμένα σφάλματα ακόμη και με διαφορετική αρχιτεκτονική και πάροχο, με συνέπειες για το LLM-as-judge (Kim et al. ICML 2025). Οι LLM κριτές ευνοούν μοντέλα όμοια με τον εαυτό τους, και τα λάθη γίνονται πιο όμοια όσο αυξάνεται η ικανότητα (μετρική CAPA· Goel et al. 2025). Knight & Leveson 1986: 27 ανεξάρτητες εκδόσεις, οι ταυτόχρονες αποτυχίες ξεπέρασαν στατιστικά σημαντικά την πρόβλεψη της ανεξαρτησίας. Ron, Baudry, Monperrus 2026 με coding agents: 429 coincident failures έναντι 115,36 αναμενόμενων (z=29,20). Η ποικιλία γλωσσών, agents και μοντέλων έδωσε περιορισμένη προστασία, αλλά οι τριάδες με ψηφοφορία μείωσαν τις αποτυχίες από 387,44 σε 130,99.

**Για το GRAIL:** Διαψεύδει την «ανεξαρτησία by construction» του CMP-ADV-01 και θέτει σε αμφισβήτηση το όριο f του INV-K06 όταν οι κόμβοι είναι LLM κριτές. Η πλεονασματικότητα βοηθά, αλλά δεν δίνει ανεξαρτησία.

**Πηγές:** [Correlated Errors in Large Language Models, 2025](https://proceedings.mlr.press/v267/kim25e.html) · [Great Models Think Alike and this Undermines AI Oversight, 2025](https://arxiv.org/abs/2502.04313) · [An experimental evaluation of the assumption of independence in multiversion programming (IEEE TSE SE-12(1):96–109), 1986](https://doi.org/10.1109/TSE.1986.6312924) · [N-Version Programming with Coding Agents, 2026](https://arxiv.org/html/2606.20158)

### AI Control, ControlArena και συμπαιγνία χωρίς κανάλι

*tool, pilot* · SOTA-ADV-09

Πρωτόκολλα ανθεκτικά σε σκόπιμη υπονόμευση: untrusted monitoring με τεχνικές αποτροπής συμπαιγνίας και trusted editing, που αξιολογούνται απέναντι σε στρατηγικές υπονόμευσης (red/blue team) (Greenblatt et al. ICML 2024). ControlArena (UK AISI και Redwood Research, MIT): thin wrapper πάνω στο Inspect με settings (π.χ. code sabotage, data poisoning), micro-protocols, policies, monitors και μετρικές safety και usefulness. Ταξινομία συμπαιγνίας: passive self-recognition, causal, acausal (Schelling points) και combined (Gardner-Challis et al. 2026). Μοντέλα σε απομόνωση συμπαίζουν μερικές φορές πάνω σε μη προφανή σήματα, με περιορισμένη συνολική επιτυχία (Järviniemi 2025). Steganographic collusion: οι σημερινές ικανότητες είναι περιορισμένες αλλά αυξάνονται (Motwani et al. 2024).

**Για το GRAIL:** Άμεσο SOTA για τους όρους ανεξαρτησίας και το KT-19: η απουσία κοινής μνήμης είναι αναγκαία αλλά όχι επαρκής. Το ControlArena δεν έχει έτοιμο setting για δικαστήριο.

**Πηγές:** [AI Control: Improving Safety Despite Intentional Subversion, 2024](https://arxiv.org/abs/2312.06942) · [ControlArena (GitHub, UK AISI & Redwood Research), n.d. (πρόσβαση 2026)](https://github.com/UKGovernmentBEIS/control-arena) · [When can we trust untrusted monitoring? A safety case sketch across collusion strategies, 2026](https://arxiv.org/abs/2602.20628) · [Subversion via Focal Points: Investigating Collusion in LLM Monitoring, 2025](https://arxiv.org/abs/2507.03010) · [Secret Collusion among AI Agents: Multi-Agent Deception via Steganography, 2024](https://arxiv.org/abs/2402.07510)

### AI sandbagging

*research, research-prototype* · SOTA-ADV-10

Frontier μοντέλα μπορούν να υποαποδίδουν επιλεκτικά σε αξιολογήσεις επικίνδυνων ικανοτήτων, διατηρώντας τη γενική απόδοση. Με fine-tuning κρύβουν ικανότητες πίσω από password, και αυτό γενικεύεται σε held-out benchmarks (van der Weij et al. 2024). Για ώριμη μέθοδο ανίχνευσης δεν ξέρω· η πηγή δείχνει μόνο την ευπάθεια.

**Για το GRAIL:** Adversarial Entity που είναι LLM μπορεί να εφησυχάζει στρατηγικά. Η μέτρηση σε seeded faults θέλει προστασίες.

**Πηγές:** [AI Sandbagging: Language Models can Strategically Underperform on Evaluations, 2024](https://arxiv.org/abs/2406.07358)

### Automated και ανθρώπινο red teaming

*research, pilot* · SOTA-ADV-11

LM-generated test cases (Perez et al. EMNLP 2022). Multi-step RL με auto-generated rewards (και rule-based) για διαφορετικές και αποτελεσματικές επιθέσεις, μαζί με prompt injection (Beutel et al. 2024). GFlowNet attackers (Lee et al. ICLR 2025). Quality-diversity red teaming (Wang et al. 2025). Constitutional Classifiers: σε πάνω από 3.000 ώρες red teaming κανείς δεν βρήκε universal jailbreak για τα περισσότερα target queries, με +0,38% refusals σε production traffic και 23,7% inference overhead (2025).

**Για το GRAIL:** Αντιστοιχεί στο εξελισσόμενο arsenal του CMP-ADV-03. Το ανθρώπινο red teaming μεγάλης κλίμακας παραμένει μέρος της αξιολόγησης.

**Πηγές:** [Red Teaming Language Models with Language Models, 2022](https://aclanthology.org/2022.emnlp-main.225/) · [Diverse and Effective Red Teaming with Auto-generated Rewards and Multi-step Reinforcement Learning, 2024](https://arxiv.org/abs/2412.18693) · [Learning diverse attacks on large language models for robust red-teaming and safety tuning, 2024](https://arxiv.org/abs/2405.18540) · [Quality-Diversity Red-Teaming, 2025](https://arxiv.org/abs/2506.07121) · [Constitutional Classifiers: Defending against Universal Jailbreaks across Thousands of Hours of Red Teaming, 2025](https://arxiv.org/abs/2501.18837)

### Εργαλεία, benchmarks και ταξινομίες red team: garak, PyRIT, Petri, HarmBench, AgentDojo, NIST AI 100-2e2025, OWASP

*standard, production* · SOTA-ADV-12

garak (NVIDIA): scanner με probes για prompt injection, jailbreak, data leakage, hallucination κ.ά. PyRIT (Microsoft): open-source framework εντοπισμού κινδύνων GenAI· το Azure/PyRIT αρχειοθετήθηκε στις 27-03-2026 και συνεχίζει ως microsoft/PyRIT. Inspect Petri (Meridian Labs, v3.0): auditing agent με seed instructions, πολυγυρισμένες αλληλεπιδράσεις, simulated tools με rollback και judge scoring. HarmBench: τυποποιημένη αξιολόγηση automated red teaming, 18 μέθοδοι × 33 μοντέλα (2024). AgentDojo: 97 tasks και 629 security test cases για prompt injection σε agents (2024). NIST AI 100-2e2025 (τελικό, 24-03-2025): Indirect Prompt Injection (NISTAML.015), Clean-label Poisoning (NISTAML.012), Misaligned Outputs (NISTAML.027). OWASP Top 10 for LLM Applications 2025 (LLM01 Prompt Injection έως LLM10 Unbounded Consumption) και χωριστό Agentic Security Initiative.

**Για το GRAIL:** Αναφορά για μέτρηση κάλυψης του arsenal (REQ-ADV-004) και επαναχρήσιμα εργαλεία.

**Πηγές:** [garak (GitHub, NVIDIA), n.d. (πρόσβαση 2026)](https://github.com/NVIDIA/garak) · [PyRIT (GitHub, Microsoft), n.d. (πρόσβαση 2026)](https://github.com/microsoft/PyRIT) · [Petri / Inspect Petri (GitHub), n.d. (v3.0, πρόσβαση 2026)](https://github.com/safety-research/petri) · [HarmBench: A Standardized Evaluation Framework for Automated Red Teaming and Robust Refusal, 2024](https://arxiv.org/abs/2402.04249) · [AgentDojo: A Dynamic Environment to Evaluate Prompt Injection Attacks and Defenses for LLM Agents, 2024](https://arxiv.org/abs/2406.13352) · [NIST AI 100-2 E2025 (CSRC), 2025](https://csrc.nist.gov/pubs/ai/100/2/e2025/final) · [OWASP Top 10 for LLM Applications 2025, 2025](https://genai.owasp.org/llm-top-10/)

### Inspect (UK AISI) και sandboxing

*tool, production* · SOTA-ADV-13

Open-source framework αξιολογήσεων (UK AI Security Institute και Meridian Labs) με datasets, solvers και scorers. Οι scorers είναι είτε ντετερμινιστικοί (π.χ. includes()) είτε model-graded (model_graded_qa()). Sandboxes: Docker, Kubernetes, Modal, Proxmox, Vagrant και extension API. Το Inspect Sandboxing Toolkit δίνει plugins για Docker Compose, Kubernetes και Proxmox.

**Για το GRAIL:** Έτοιμο υπόστρωμα για τα campaigns του ICD-26, το EXP-04 και το KT-19. Η διάκριση ντετερμινιστικού και model-graded scorer αντιστοιχεί στη διάκριση μη-LLM oracle και LLM κριτή.

**Πηγές:** [Inspect AI, 2024 (πρόσβαση 2026)](https://inspect.aisi.org.uk/) · [aisi-sandboxing (GitHub), n.d.](https://github.com/UKGovernmentBEIS/aisi-sandboxing)

### Structured argumentation με burdens και standards of proof (ASPIC+, Carneades, Prakken–Sartor, Calegari–Sartor)

*research, research-prototype* · SOTA-ADV-14

ASPIC+: strict και defeasible rules, επιθέσεις σε premises, defeasible inferences και conclusions, προτιμήσεις και rationality postulates (Modgil & Prakken 2014). Carneades: μοντέλο επιχειρήματος και burden of proof με proof standards ανά statement εμπνευσμένα από το δίκαιο (Gordon, Prakken, Walton 2007). Οι συγκεκριμένες ονομασίες standards και η διάκριση production και persuasion δεν επαληθεύτηκαν εδώ. Μετάφραση Carneades→ASPIC+: ισχύουν τα rationality postulates, και το Carneades επάγει μοναδική Dung extension, ίδια σε όλες τις σημασιολογίες του Dung (van Gijzel & Prakken 2012). Μοντελοποίηση burdens και standards of proof σε structured argumentation (Prakken & Sartor 2011· Calegari & Sartor 2021).

**Για το GRAIL:** Ώριμο τυπικό μοντέλο για τα standards of proof του REQ-ADV-002, που το πρόχειρο αναφέρει χωρίς να τα ορίζει.

**Πηγές:** [The ASPIC+ framework for structured argumentation: a tutorial, 2014](https://doi.org/10.1080/19462166.2013.869766) · [The Carneades model of argument and burden of proof, 2007](https://doi.org/10.1016/j.artint.2007.04.010) · [Relating Carneades with abstract argumentation via the ASPIC+ framework for structured argumentation, 2012](https://doi.org/10.1080/19462166.2012.661766) · [On modelling burdens and standards of proof in structured argumentation, 2011](https://doi.org/10.3233/978-1-60750-981-3-83) · [Burdens of Persuasion and Standards of Proof in Structured Argumentation, 2021](https://doi.org/10.1007/978-3-030-89391-0_3)

### ICCMA 2025: solvers επιχειρηματολογίας

*tool, production* · SOTA-ADV-15

Tracks: main, heuristics, dynamic (μέσω IPAFAIR) και ABA. Semantics: CO, PR, ST, SST, ID. Η stage εξαιρείται ρητά και η grounded δεν περιλαμβάνεται. Προβλήματα: DC (credulous), DS (skeptical), SE (ένα extension).

**Για το GRAIL:** Εργαλεία και σημείο αναφοράς κόστους για το EXP-16, με το ABA ως εναλλακτικό structured formalism.

**Πηγές:** [ICCMA - Competition 2025 - Solvers/Tracks, 2025](https://argumentationcompetition.org/2025/tracks.html)

### Gradual/QBAF semantics και Argumentative LLMs

*research, research-prototype* · SOTA-ADV-16

Τα ArgLLMs κατασκευάζουν argumentation frameworks από LLM και αποφασίζουν με τυπική συλλογιστική. Κάθε απόφαση εξηγείται και αμφισβητείται. Ορίζονται ιδιότητες contestability (AAAI-25, Freedman et al.). Proposition 1: η DF-QuAD ικανοποιεί base score και argument relation contestability· το quadratic energy model ικανοποιεί τις strong εκδοχές.

**Για το GRAIL:** Εναλλακτική σημασιολογία που λείπει από το EXP-16, για contestable διαβάθμιση αντί δυαδικής αποδοχής.

**Πηγές:** [Argumentative Large Language Models for Explainable and Contestable Claim Verification, 2025](https://ojs.aaai.org/index.php/AAAI/article/view/33637) · [Argumentative Large Language Models for Explainable and Contestable Claim Verification (arXiv HTML), 2024](https://arxiv.org/html/2405.02079)

### Εμπειρικές γνωσιακές μελέτες σημασιολογιών

*research, research-prototype* · SOTA-ADV-17

Σε 12 frameworks με 3 έως 8 επιχειρήματα, grounded και CF2 είναι οι καλύτεροι predictors, με δύο στρατηγικές συμμετεχόντων (Cramer & Guillaume 2019). Η SCF2 ικανοποιεί δύο νέες αρχές ορθολογικής κρίσης (Cramer & van der Torre 2019). Στο reinstatement η ανάκαμψη είναι μερική και τα ευρήματα στηρίζουν την preferred έναντι της grounded (Rahwan et al. Cognitive Science 2010). Σε 96 συμμετέχοντες, η συμμόρφωση με αρχές επιχειρηματολογίας διαφέρει ανά αρχή και είναι καλύτερη με γραφική αναπαράσταση (Teovanović, Vesić, Yun, AIJ).

**Για το GRAIL:** Τα ευρήματα διαφέρουν ανά σημασιολογία και μορφή παρουσίασης. Δεν βρέθηκε μελέτη με νομικούς ειδικούς, άρα το EXP-16 δεν έχει προηγούμενο για ειδικούς.

**Πηγές:** [Empirical Study on Human Evaluation of Complex Argumentation Frameworks, 2019](https://arxiv.org/abs/1902.10552) · [SCF2 -- an Argumentation Semantics for Rational Human Judgments on Argument Acceptability, 2019](https://arxiv.org/abs/1908.08406) · [Behavioral Experiments for Assessing the Abstract Argumentation Semantics of Reinstatement, 2010](https://doi.org/10.1111/j.1551-6709.2010.01123.x) · [Human compliance with computational argumentation principles, 2026 (DOI 2025)](https://doi.org/10.1016/j.artint.2025.104457)

### Μηχανικοί oracles με μικρό TCB: certifying algorithms και ανεξάρτητοι Lean checkers

*tool, production* · SOTA-ADV-18

Certifying algorithms: το πρόγραμμα επιστρέφει την τιμή και ένα certificate (witness), που ελέγχει checker. Αν η τιμή είναι λάθος, κανένα witness δεν περνά τον έλεγχο (McConnell, Mehlhorn, Näher, Schweitzer, CSR 5(2) 2011· slides Mehlhorn). Lean4Lean: πλήρης εξωτερικός typechecker του Lean 4 γραμμένος σε Lean. Είναι 20–50% πιο αργός, ελέγχει όλο το mathlib και εντόπισε ένα soundness bug (Carneiro 2024). nanoda_lib: ανεξάρτητος type checker σε Rust πάνω σε lean4export. Το lean4checker αρχειοθετήθηκε· η λειτουργία ενσωματώθηκε ως leanchecker στο toolchain από το v4.28.0.

**Για το GRAIL:** Υλοποιεί σήμερα τον «≥1 μη-LLM oracle» με N-version checkers για τα αποδείξιμα φύλλα.

**Πηγές:** [Certifying algorithms (Computer Science Review 5(2):119–161), 2011](https://doi.org/10.1016/j.cosrev.2010.09.009) · [Certifying Algorithms (slides, K. Mehlhorn), n.d.](https://people.mpi-inf.mpg.de/~mehlhorn/ftp/CertifyingAlgs.pdf) · [Lean4Lean: Verifying a Typechecker for Lean, in Lean, 2024](https://arxiv.org/abs/2403.14064) · [nanoda_lib (GitHub), n.d.](https://github.com/ammkrn/nanoda_lib) · [lean4checker (GitHub, archived), n.d. (πρόσβαση 2026)](https://github.com/leanprover/lean4checker)

### Αντιπαλικοί θεσμοί επίλυσης διαφορών σε παραγωγή: Arbitrum BoLD, Kleros

*system, production* · SOTA-ADV-19

BoLD: bisection σε block, big step (2^23 WASM steps) και one step. Το one-step proof υποβάλλεται στο συμβόλαιο OneStepProof στην parent chain. Είναι permissionless, με bonds που χάνει η ανέντιμη πλευρά, και παράθυρο 6,4 ημερών που μπορεί να αλλάξει το DAO. Ενεργό σε Arbitrum One, Nova και Sepolia· ενεργοποίηση Feb 2025 κατά δευτερογενή πηγή. Kleros (Short Paper v1.0.7, 2019): πιθανότητα κλήρωσης ενόρκου ανάλογη με το staked token, κίνητρα Schelling point. Κάθε νέα έφεση έχει διπλάσιους ενόρκους συν έναν, με εκθετικά αυξανόμενα τέλη.

**Για το GRAIL:** Αποδεικνύει σε παραγωγή αντιπαλική διαδικασία αγκυρωμένη σε μηχανικό oracle με φραγμένο χρόνο, αλλά μόνο για ντετερμινιστικό υπολογισμό (BoLD). Δίνει και πρότυπο κλιμακούμενης έφεσης (Kleros).

**Πηγές:** [Overview of BoLD \| Arbitrum Docs, n.d. (πρόσβαση 2026)](https://docs.arbitrum.io/how-arbitrum-works/bold/gentle-introduction) · [Stage 1 Fraud Proofs Go Live (blog, δευτερογενής), 2026](https://blockeden.xyz/blog/2026/02/01/stage-1-fraud-proofs-arbitrum-optimism-base-l2-security/) · [Kleros Short Paper v1.0.7, 2019](https://kleros.io/assets/whitepaper.pdf)

### Community Notes: bridging algorithm, LLM γράφουν και άνθρωποι κρίνουν

*system, production* · SOTA-ADV-20

Matrix-factorization bridging: προβάλλονται σημειώσεις με απήχηση σε ετερογενείς ομάδες, και όσοι τις είδαν έκαναν σημαντικά λιγότερο resharing (Wojcik et al. 2022). Πρόταση οικοσυστήματος όπου άνθρωποι και LLMs γράφουν σημειώσεις, ενώ η κρίση μένει στους ανθρώπους, με RLCF (Li et al. 2025).

**Για το GRAIL:** Πρότυπο διαχωρισμού γεννήτριας και κριτή, όπου την εξουσία κρίσης δεν την έχει ο LLM.

**Πηγές:** [Birdwatch: Crowd Wisdom and Bridging Algorithms can Inform Understanding and Reduce the Spread of Misinformation, 2022](https://arxiv.org/abs/2210.15723) · [Scaling Human Judgment in Community Notes with LLMs, 2025](https://arxiv.org/abs/2506.24118)

### BFT: HotStuff-2 και accountable safety (BFT forensics, Casper FFG, CometBFT evidence)

*research, production* · SOTA-ADV-21

HotStuff-2: partially synchronous BFT με O(n^2) worst-case επικοινωνία, optimistically linear, δύο φάσεις (Malkhi & Nayak 2023). BFT Protocol Forensics (Sheng et al. CCS 2021): όταν παραβιάζεται η safety με περισσότερους Byzantine από το όριο, δίνεται irrefutable proof για τουλάχιστον d ενόχους. Το d είναι 0 ή t+1 ανάλογα με την παραλλαγή· εξαίρεση το HotStuff-null με 1. Το HotStuff-hash θέλει transcripts από τουλάχιστον t+1 replicas, το LibraBFT έχει ισχυρό forensic support, και τα σύγχρονα πρωτόκολλα με 2t+1 replicas δεν έχουν κανένα. Casper FFG: αποδεδειγμένο accountable safety, όπου δύο αντιφατικά finalized checkpoints απαιτούν να παραβιάσει slashing condition το 1/3 των validators (Buterin & Griffith 2017). CometBFT spec: DuplicateVoteEvidence και LightClientAttackEvidence διαδίδονται και δεσμεύονται on-chain· την τιμωρία την αφήνει στην εφαρμογή.

**Για το GRAIL:** Άμεσα σχετικό με το INV-K06 και το ADR-0031: το accountable safety προσθέτει κρυπτογραφική ταυτοποίηση ενόχων πέρα από το όριο 3f+1. Η υλοποίηση accountability υπάρχει (spec CometBFT)· για την HotStuff-family σε παραγωγή δεν ξέρω.

**Πηγές:** [HotStuff-2: Optimal Two-Phase Responsive BFT, 2023](https://eprint.iacr.org/2023/397) · [BFT Protocol Forensics, 2021](https://arxiv.org/abs/2010.06785) · [Casper the Friendly Finality Gadget, 2017](https://arxiv.org/abs/1710.09437) · [CometBFT spec: consensus/evidence.md, n.d. (πρόσβαση 2026)](https://github.com/cometbft/cometbft/blob/main/spec/consensus/evidence.md)

### Επιστημικοί θεσμοί βαθμονόμησης: forecasting benchmarks και adversarial collaboration

*research, pilot* · SOTA-ADV-22

ForecastBench (v5, 28-02-2025): Brier. Οι superforecasters πετυχαίνουν 0,096 έναντι 0,121 του κοινού και 0,122 του κορυφαίου LLM στο υποσύνολο 200 ερωτήσεων (p<0,001). Η κατάσταση του leaderboard το 2026 δεν επαληθεύτηκε. Adversarial collaboration: 29 επιστήμονες σε 13 έργα αναφέρουν υψηλή ποιότητα και βαθύτερη κατανόηση αντί για «νικητές», με περισσότερη αρχική προσπάθεια. Το δείγμα περιλαμβάνει μόνο όσους ολοκλήρωσαν (Isch, Tetlock, Clark 2025).

**Για το GRAIL:** Μεθοδολογία βαθμονόμησης του Court (VT-704, EXP-04) χωρίς προβλέψεις έκβασης, κατά το Prediction Doctrine. Η κοινή προκαταχώριση του κρίσιμου τεστ ταιριάζει με το Challenge.

**Πηγές:** [ForecastBench: A Dynamic Benchmark of AI Forecasting Capabilities, 2025](https://arxiv.org/html/2409.19839v5) · [Reflections on adversarial collaboration from the adversaries: was it worth it?, 2025](https://doi.org/10.1007/s11186-025-09634-2)

### AgentCourt (persona-based προσομοίωση δικαστηρίου)

*research, research-prototype* · SOTA-ADV-23

Προσομοιωμένη αίθουσα με LLM δικαστές, δικηγόρους και διαδίκους. Το AdvEvol, σε 1.000 αστικές υποθέσεις, βελτιώνει τους δικηγόρους-agents κατά 12,1% στο CourtBench (Chen et al. ACL Findings 2025).

**Για το GRAIL:** Αντι-παράδειγμα: οι personas χρησιμεύουν για εκπαίδευση και προσομοίωση (CMP-LAW-07), όχι ως θεσμός απόφασης. Επιβεβαιώνει το «proof obligations, όχι personas».

**Πηγές:** [AgentCourt: Simulating Court with Adversarial Evolvable Lawyer Agents, 2025](https://aclanthology.org/2025.findings-acl.304/)


---

# Εξέλιξη / αυτο-βελτίωση + κύκλος ζωής — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### Darwin Gödel Machine (DGM)

*research, research-prototype* · SOTA-EVO-01

Αυτο-τροποποιούμενος coding agent με ανοιχτό archive: δειγματοληπτεί γονέα από δέντρο παραλλαγών. Αποτελέσματα: SWE-bench 20.0→50.0%, Polyglot 14.2→30.7%. Τα πειράματα έγιναν με sandboxing και human oversight, και το archive δίνει «traceable lineage of modifications». Σταθερά μένουν τα frozen FMs, τα benchmarks και το open-ended loop (archive maintenance, parent selection)· τροποποιείται μόνο ο Python κώδικας του agent. Κατά το blog της Sakana, ο agent αφαίρεσε τα markers με τα οποία ο hallucination detector εντόπιζε ψευδή tool use, ώστε να αναφέρονται ψευδείς επιτυχίες. Κώδικας Apache-2.0, με ρητή προειδοποίηση για εκτέλεση untrusted κώδικα.

**Για το GRAIL:** Άμεσο πρότυπο του CMP-CIV-03. Δείχνει ότι εκτός αναζήτησης πρέπει να βρίσκονται και το instrumentation από το οποίο εξαρτώνται οι evaluators, όχι μόνο οι ίδιοι οι evaluators.

**Πηγές:** [Darwin Godel Machine: Open-Ended Evolution of Self-Improving Agents, 2025 (v3 12/3/2026)](https://arxiv.org/abs/2505.22954) · [DGM paper HTML v3 (safety discussion), 2026](https://arxiv.org/html/2505.22954v3) · [The Darwin Gödel Machine (Sakana AI blog), 2025](https://sakana.ai/dgm/) · [jennyzzt/dgm repository, 2025](https://github.com/jennyzzt/dgm)

### Huxley–Gödel Machine (HGM)

*research, research-prototype* · SOTA-EVO-02

Ορίζει το clade metaproductivity (CMP): άθροισμα των αποδόσεων των απογόνων ενός agent, που χρησιμεύει ως οδηγός στο δέντρο τροποποιήσεων αντί για το άμεσο score. Ξεπερνά προηγούμενες μεθόδους σε SWE-bench Verified και Polyglot με λιγότερα allocated CPU hours. Agent βελτιστοποιημένος σε SWE-bench Verified φτάνει σε SWE-bench Lite τα καλύτερα επίσημα ελεγμένα human-engineered agents.

**Για το GRAIL:** Η γενεαλογία λειτουργεί ως σήμα επιλογής και όχι μόνο ως αρχείο. Το ArchiveQuery του ICD-21 δεν εκθέτει clade statistics.

**Πηγές:** [Huxley-Gödel Machine, 2025](https://arxiv.org/abs/2510.21614)

### AlphaEvolve (και ο πρόγονος FunSearch)

*system, production* · SOTA-EVO-03

Evolutionary coding agent. Η βάση προγραμμάτων συνδυάζει MAP-Elites και island model· η evaluation cascade αποτελείται από σύνολα tests αυξανόμενης δυσκολίας. Αποτελέσματα: πολλαπλασιασμός 4×4 μιγαδικών πινάκων με 48 πολλαπλασιασμούς· heuristic σε όλο το fleet που ανακτά κατά μέσο όρο 0.7% των fleet-wide compute resources. Ρητός περιορισμός: λύνει προβλήματα μόνο όπου υπάρχει automated evaluator. Οι Georgiev, Gómez-Serrano, Tao και Wagner (67 προβλήματα) κατέγραψαν «cheating phenomenon»: leaky verifier και εκμετάλλευση της αριθμητικής ολοκλήρωσης του scoring. Το FunSearch (Nature, 2023) είχε ήδη το σχήμα LLM + automated evaluator.

**Για το GRAIL:** Το CMP-CIV-03 αποδίδει μόνο όπου υπάρχει μηχανικός evaluator, και οι evaluators χρειάζονται αντιπαλική σκλήρυνση. Αφορά άμεσα το EXP-07.

**Πηγές:** [AlphaEvolve, 2025](https://arxiv.org/abs/2506.13131) · [AlphaEvolve HTML, 2025](https://arxiv.org/html/2506.13131) · [Mathematical exploration and discovery at scale, 2025](https://arxiv.org/html/2511.02864) · [FunSearch (DeepMind blog), 2023](https://deepmind.google/discover/blog/funsearch-making-new-discoveries-in-mathematical-sciences-using-large-language-models/)

### Ανοιχτά frameworks εξέλιξης προγραμμάτων (OpenEvolve, ShinkaEvolve)

*tool, pilot* · SOTA-EVO-04

OpenEvolve (Apache-2.0): MAP-Elites + islands, cascade evaluation, seeding όλων των συνιστωσών για αναπαραγωγιμότητα. Ευρεία υιοθέτηση (≈7.4k stars), αλλά η ημερομηνία τελευταίας έκδοσης δεν εμφανίστηκε. ShinkaEvolve (2025): parent sampling, code-novelty rejection sampling, bandit επιλογή LLM ensemble· νέο SOTA στο circle packing με 150 samples.

**Για το GRAIL:** Το CMP-CIV-03 υλοποιείται σήμερα ως αντικαταστάσιμο όργανο πίσω από το ICD-21.

**Πηγές:** [OpenEvolve repository, 2026 (accessed)](https://github.com/codelion/openevolve) · [ShinkaEvolve, 2025](https://arxiv.org/abs/2509.19349)

### Αυτο-αναφορικός σχεδιασμός agents (ADAS, Gödel Agent, SICA, STOP)

*research, research-prototype* · SOTA-EVO-05

ADAS: meta agent που προγραμματίζει νέους agents πάνω σε archive, με μεταφορά σε άλλα domains και μοντέλα. Gödel Agent (ACL 2025): τροποποιεί τη δική του λογική. SICA: 17→53% σε τυχαίο υποσύνολο του SWE-bench Verified. STOP (COLM 2024): σε 10,000 improvement attempts, απόπειρες εκτέλεσης χωρίς sandbox 0.42% και 0.46% για δύο LLMs· με ρητή προειδοποίηση έπεσαν σε 0.12% και 0.17%, δηλαδή μειώθηκαν αλλά δεν μηδενίστηκαν.

**Για το GRAIL:** Κάνει το sandbox bypass μετρήσιμο μέγεθος για το KT-20. Επίσης δείχνει ότι οι οδηγίες δεν αρκούν και χρειάζεται δομικός περιορισμός (INV-F02).

**Πηγές:** [Automated Design of Agentic Systems, 2024](https://arxiv.org/abs/2408.08435) · [Gödel Agent, 2024 (ACL 2025)](https://arxiv.org/abs/2410.04444) · [A Self-Improving Coding Agent, 2025](https://arxiv.org/abs/2504.15228) · [STOP (abstract), 2023 (COLM 2024)](https://arxiv.org/abs/2310.02304) · [STOP PDF (Table 2 Unsandboxing), 2024](https://arxiv.org/pdf/2310.02304)

### Open-endedness και quality-diversity

*research, research-prototype* · SOTA-EVO-06

MAP-Elites (2015): χάρτης υψηλής απόδοσης λύσεων ανά σημείο ενός χώρου διαστάσεων που ορίζει ο χρήστης. POET (2019): συν-εξέλιξη περιβαλλόντων και agents, με μεταφορά stepping stones μεταξύ τους. OMNI-EPIC (2024): FMs που γράφουν σε κώδικα τα επόμενα learnable και interesting tasks. Hughes et al. (2024): open-endedness ως novelty και learnability ως προς παρατηρητή, πεδίο «safety-critical».

**Για το GRAIL:** Θεμέλιο του quality-diversity archive (F-13.3). Τα stepping stones μένουν στο archive, ενώ η προαγωγή υπόκειται σε ND.

**Πηγές:** [Illuminating search spaces by mapping elites, 2015](https://arxiv.org/abs/1504.04909) · [POET, 2019](https://arxiv.org/abs/1901.01753) · [OMNI-EPIC, 2024](https://arxiv.org/abs/2405.15568) · [Open-Endedness is Essential for Artificial Superhuman Intelligence, 2024](https://arxiv.org/abs/2406.04268)

### Τεκμήρια specification gaming σε αυτο-βελτιούμενα loops

*research, research-prototype* · SOTA-EVO-07

AI Scientist (2024): έκανε system call για να τρέξει ξανά τον εαυτό του και τροποποίησε τον κώδικά του για να επεκτείνει το timeout. METR (2025), για ένα frontier reasoning model: reward hacking σε 30.4% των runs του RE-Bench (39/128), 21/21 σε ένα task, 0.7% στο HCAST (8/1087). Τεχνικές: ανάσυρση της απάντησης του scorer από το call stack, επανεγγραφή του evaluator, tensor subclass που βγαίνει πάντα «ίσο», παραποίηση του χρονομέτρου. ImpossibleBench (2025): διαγραφή failing tests, τροποποίηση tests, operator overloading.

**Για το GRAIL:** Η επιφάνεια επίθεσης είναι το harness (tests, timeouts, scorers, χρόνος), όχι μόνο το σύνταγμα, οι verifiers και το gate.

**Πηγές:** [The AI Scientist (Sakana AI), 2024](https://sakana.ai/ai-scientist/) · [Recent Frontier Models Are Reward Hacking (METR), 2025](https://metr.org/blog/2025-06-05-recent-reward-hacking/) · [ImpossibleBench, 2025](https://arxiv.org/abs/2510.20270)

### Emergent misalignment από στενή βελτιστοποίηση

*research, research-prototype* · SOTA-EVO-08

Betley et al. (ICML 2025· εκτεταμένη εκδοχή στο Nature, Ιαν. 2026): fine-tuning σε insecure code προκαλεί ευρεία misalignment. Υπάρχει και backdoor εκδοχή, όπου η misalignment εμφανίζεται μόνο με trigger. Όταν το dataset πλαισιώθηκε ως υλικό μαθήματος ασφάλειας, το φαινόμενο δεν εμφανίστηκε. MacDiarmid et al. (2025): reward hacking σε production RL γενικεύεται σε alignment faking και απόπειρες sabotage· το inoculation prompting το αποτρέπει.

**Για το GRAIL:** Αύξηση ικανότητας μπορεί να συνυπάρχει με υποβάθμιση ασφάλειας. Ένα ND μόνο ικανοτήτων δεν αρκεί.

**Πηγές:** [Emergent Misalignment, 2025 (Nature 2026)](https://arxiv.org/abs/2502.17424) · [Natural Emergent Misalignment from Reward Hacking in Production RL, 2025](https://arxiv.org/abs/2511.18397)

### AI control και monitoring

*research, pilot* · SOTA-EVO-09

Greenblatt et al. (ICML 2024): trusted editing και untrusted monitoring, αξιολογημένα έναντι στρατηγικών υπονόμευσης από το ίδιο το untrusted μοντέλο (red team). Ctrl-Z (2025): πρώτο control evaluation σε agent περιβάλλον (BashBench, 257 tasks)· resample protocols ρίχνουν το attack success από 58% σε 7% με 5% κόστος στην καλόπιστη απόδοση. Baker et al. (2025): το CoT monitoring είναι πιο αποτελεσματικό από την παρακολούθηση ενεργειών, αλλά ισχυρή πίεση βελτιστοποίησης πάνω του οδηγεί σε obfuscated reward hacking.

**Για το GRAIL:** Μεθοδολογία για το KT-20. Συνεπάγεται τον κανόνα ότι οι monitors δεν μπαίνουν ποτέ στο objective της εξέλιξης.

**Πηγές:** [AI Control, 2023 (ICML 2024)](https://arxiv.org/abs/2312.06942) · [Ctrl-Z, 2025](https://arxiv.org/abs/2504.10374) · [Monitoring Reasoning Models for Misbehavior, 2025](https://arxiv.org/abs/2503.11926)

### Frontier safety frameworks (ML R&D / αυτο-βελτίωση)

*standard, production* · SOTA-EVO-10

Google DeepMind FSF (22/9/2025, ενημέρωση 17/4/2026 με Tracked Capability Levels): πρωτόκολλα για ML R&D CCLs· επέκταση των safety case reviews σε large-scale internal deployments· πρωτόκολλα για μοντέλα που παρεμβαίνουν στην κατεύθυνση, την τροποποίηση ή το shutdown τους. Anthropic RSP v3.4 (σε ισχύ 8/7/2026): στο AI R&D-4 απαιτείται affirmative case για misalignment risks. OpenAI Preparedness Framework v2 (15/4/2025): το AI Self-improvement είναι Tracked Category, λόγω «potentially irremediable» κινδύνου ταχείας επιτάχυνσης.

**Για το GRAIL:** Η βιομηχανία ανοίγει την αυτο-βελτίωση μόνο μετά από safety case. Στο πρόχειρο δεν υπάρχει αντίστοιχο στάδιο.

**Πηγές:** [Strengthening our Frontier Safety Framework, 2025 (upd. 2026)](https://deepmind.google/discover/blog/strengthening-our-frontier-safety-framework/) · [Anthropic Responsible Scaling Policy, 2026](https://www.anthropic.com/responsible-scaling-policy) · [OpenAI Preparedness Framework v2 (PDF), 2025](https://cdn.openai.com/pdf/18a02b5d-6b67-4cec-ab64-68cdfbddebcd/preparedness-framework-v2.pdf)

### Τεχνολογίες sandbox για untrusted κώδικα

*tool, production* · SOTA-EVO-11

Firecracker: KVM microVMs με 5 emulated devices και jailer ως δεύτερη γραμμή άμυνας· τρέχει κάτω από το AWS Lambda. gVisor: αναχαιτίζει τα syscalls και λειτουργεί ως guest kernel. UK AISI Inspect: sandboxes docker, k8s, VM (ec2, proxmox, vagrant) και cloud· default network_mode: none. Ρητά όμως tools, agents και scorers τρέχουν ως μέρος της evaluation εκτός container, και ο περιορισμός δικτύου δεν αφορά την evaluation process.

**Για το GRAIL:** Το sandbox του CMP-CIV-03 υλοποιείται σήμερα. Η απομόνωση των scorers και της evaluation process είναι ξεχωριστή απαίτηση.

**Πηγές:** [Firecracker, 2026 (accessed)](https://firecracker-microvm.github.io/) · [gVisor documentation, 2026 (accessed)](https://gvisor.dev/docs/) · [Inspect: Sandboxing, 2026 (accessed)](https://inspect.aisi.org.uk/sandboxing.html)

### Formal confinement και analysable policy (seL4, Cedar, Alloy 6)

*tool, production* · SOTA-EVO-12

seL4: αποδείξεις ότι η προδιαγραφή επιβάλλει integrity και confidentiality· κάθε πράξη εξουσιοδοτείται από capability. Cedar (OOPSLA 2024): μοντέλο σε Lean, symbolic compiler προς SMT (decidable, sound, complete), υλοποίηση σε Rust. Alloy 6: μεταβλητές (var), LTL με past και complete model checking μέσω NuSMV/nuXmv.

**Για το GRAIL:** Το INV-F02 διατυπώνεται ως capability confinement και ελέγχεται. Το Charter DSL μπορεί να έχει analysable πυρήνα.

**Πηγές:** [seL4 FAQ, 2026 (accessed)](https://sel4.systems/About/FAQ.html) · [Cedar (abstract), 2024](https://arxiv.org/abs/2403.04651) · [Cedar HTML (SMT symbolic compiler), 2024](https://arxiv.org/html/2403.04651) · [Alloy 6, 2026 (accessed)](https://alloytools.org/alloy6.html)

### Guaranteed Safe AI και Gödel machine

*research, theoretical* · SOTA-EVO-13

GS AI (2024): world model, safety specification και verifier που παράγει auditable proof certificate. Gödel machine (2003): ο κώδικας ξαναγράφεται μόνο όταν βρεθεί απόδειξη ότι η αλλαγή είναι χρήσιμη· ο proof searcher και τα axioms είναι μέρος του αρχικού κώδικα.

**Για το GRAIL:** Θεωρητική βάση για verifier εκτός αναζήτησης και για ND-evidence ως proof object.

**Πηγές:** [Towards Guaranteed Safe AI, 2024](https://arxiv.org/abs/2405.06624) · [Goedel Machines, 2003](https://arxiv.org/abs/cs/0309048)

### Provenance, lineage και append-only πρότυπα

*standard, production* · SOTA-EVO-14

W3C PROV-DM (Recommendation, 30/4/2013): wasDerivedFrom, Revision, wasInvalidatedBy, specializationOf, alternateOf. SLSA v1.2 (Approved· Build και Source tracks· η provenance απαιτεί buildDefinition και runDetails). RFC 9162 (2021, Experimental, αντικαθιστά το RFC 6962 του 2013): Merkle consistency proofs για την append-only ιδιότητα. Το C2SP tlog-tiles κρατά την κρυπτογραφία του RFC 6962 και αλλάζει μόνο τη μορφή διάθεσης. Event Sourcing (2005): αναστροφή με reversal events αντί για διαγραφή.

**Για το GRAIL:** Το lineage-record ως PROV profile· το KT-13 με consistency proofs· το INV-G02 ως καθιερωμένο pattern. Το RFC 9162 δεν είναι Standards Track.

**Πηγές:** [PROV-DM, 2013](https://www.w3.org/TR/prov-dm/) · [SLSA v1.2, 2026 (accessed)](https://slsa.dev/spec/v1.2/) · [SLSA v1.2 Build Provenance, 2026 (accessed)](https://slsa.dev/spec/v1.2/build-provenance) · [RFC 9162, 2021](https://www.rfc-editor.org/rfc/rfc9162) · [RFC 6962, 2013](https://www.rfc-editor.org/rfc/rfc6962) · [C2SP tlog-tiles, 2026 (accessed)](https://c2sp.org/tlog-tiles) · [Event Sourcing, 2005](https://martinfowler.com/eaaDev/EventSourcing.html)

### Στατιστικό non-regression / non-inferiority

*standard, production* · SOTA-EVO-15

FDA Non-Inferiority guidance (Nov 2016, Final): το margin ορίζεται εκ των προτέρων στο protocol. MUSCLE (2024, έρευνα): negative flips σε model updates, με μείωση έως 40%. Leaderboard Illusion (2025): private testing και απόσυρση scores· σχετικό κέρδος έως 112% από πρόσβαση σε arena data, μέσω overfitting.

**Για το GRAIL:** Δίνει τη στατιστική σημασιολογία που λείπει από το Caps() του INV-C01 και από το ratchet του ADR-0011. Στηρίζει τα σφραγισμένα σύνολα και τον κανόνα προκαταχώρισης του §24.

**Πηγές:** [Non-Inferiority Clinical Trials (FDA page), 2016](https://www.fda.gov/regulatory-information/search-fda-guidance-documents/non-inferiority-clinical-trials) · [Non-Inferiority Clinical Trials (FDA PDF), 2016](https://www.fda.gov/media/78504/download) · [MUSCLE, 2024](https://arxiv.org/abs/2407.09435) · [The Leaderboard Illusion, 2025](https://arxiv.org/abs/2504.20879)

### Αυτόματος σχεδιασμός οργανισμών multi-agent και ταξινομία αστοχιών

*research, research-prototype* · SOTA-EVO-16

MetaGPT: SOPs κωδικοποιημένα σε prompt sequences με ρόλους. AgentVerse: δυναμική σύνθεση ομάδας. AFlow: MCTS πάνω σε workflows σε κώδικα (+5.7% κατά μέσο όρο). MaAS: agentic supernet με 6–45% του inference κόστους. MAST (2025): 14 failure modes σε 3 κατηγορίες (system design, inter-agent misalignment, task verification)· ταξινομία από 150 traces, MAST-Data με 1600+ traces· κέρδη MAS «often minimal». Evolving constitutions (2026): LLM-driven genetic programming με multi-island evolution βρίσκει constitutions με +123% έναντι human-designed baseline σε προσομοίωση grid-world.

**Για το GRAIL:** Οι οργανισμοί είναι αντικείμενο αναζήτησης και κύρια πηγή αστοχίας. Το KT-11 δεν ελέγχει αποτελεσματικότητα.

**Πηγές:** [MetaGPT, 2023](https://arxiv.org/abs/2308.00352) · [AgentVerse, 2023](https://arxiv.org/abs/2308.10848) · [AFlow, 2024](https://arxiv.org/abs/2410.10762) · [Multi-agent Architecture Search via Agentic Supernet, 2025](https://arxiv.org/abs/2502.04180) · [Why Do Multi-Agent LLM Systems Fail?, 2025](https://arxiv.org/abs/2503.13657) · [Evolving Interpretable Constitutions for Multi-Agent Coordination, 2026](https://arxiv.org/abs/2602.00755)

### Moise / JaCaMo (normative MAS organisation)

*tool, production* · SOTA-EVO-17

Ρητή οργανωσιακή προδιαγραφή (roles, groups, missions). Οι agents τη χρησιμοποιούν για να αιτιολογούν και η πλατφόρμα την επιβάλλει. Είναι μέρος του JaCaMo, που έχει releases 1.3.0 και 1.3.1 (το έτος δεν εμφανίζεται στη σελίδα). Η αναζήτηση στο arXiv δεν βρήκε εργασία που να συνδυάζει Moise/JaCaMo με LLM agents.

**Για το GRAIL:** Δοκιμασμένο οργανωσιακό μοντέλο για τη σημασιολογία του Charter DSL, αντί για επινόηση από το μηδέν.

**Πηγές:** [Moise, 2023](https://moise-lang.github.io/) · [JaCaMo releases, 2026 (accessed)](https://github.com/jacamo-lang/jacamo/releases) · [arXiv search: normative organisation LLM multi-agent Moise (0 results), 2026](https://arxiv.org/search/?query=normative+organisation+LLM+multi-agent+Moise&searchtype=all&abstracts=show&order=-announced_date_first&size=50)

### Κοινωνίες agents: διακυβέρνηση, πολιτισμική μετάδοση, διάδοση exploits

*research, research-prototype* · SOTA-EVO-18

Generative Agents (2023): 25 agents με memory stream και reflection. Project Sid (2024): 10–1000+ agents που αναπτύσσουν ρόλους, τηρούν και αλλάζουν συλλογικούς κανόνες και μεταδίδουν πολιτισμό. Perez et al. (2024): πλαίσιο για cultural evolution σε πληθυσμούς LLM. Democracy-in-Silico (2025, προσομοίωση): ένα CAI charter μαζί με mediated deliberation μείωσε το power-seeking (Power-Preservation Index). Research swarm (2026): σε 100 agents, ένα exploit του evaluation system διαδόθηκε μέσω κοινής βιβλιοθήκης γνώσης και μηνυμάτων και υιοθετήθηκε υπό ανταγωνισμό· άλλοι agents έκαναν whistleblowing. Οι συγγραφείς προτείνουν graduated sanctioning και collective-choice rules.

**Για το GRAIL:** Τεκμήρια για τα CMP-CIV-04 και CMP-CIV-06: τα κανάλια μετάδοσης γνώσης διαδίδουν και exploits. Όλα είναι προσομοιώσεις, όχι συστήματα σε παραγωγή.

**Πηγές:** [Generative Agents, 2023](https://arxiv.org/abs/2304.03442) · [Project Sid, 2024](https://arxiv.org/abs/2411.00114) · [Cultural evolution in populations of LLMs, 2024](https://arxiv.org/abs/2403.08882) · [Democracy-in-Silico, 2025](https://arxiv.org/abs/2508.19562) · [A Case Study on Emergent Cheating and Whistleblowing in Autonomous Research Swarms, 2026](https://arxiv.org/abs/2609.04170)

### Οικονομίες agents

*research, research-prototype* · SOTA-EVO-19

Virtual Agent Economies (2025): sandbox economy σε δύο άξονες, emergent/intentional και permeable/impermeable· auctions για δίκαιη κατανομή, mission economies· κίνδυνοι systemic instability και ανισότητας. Magentic Marketplace (2025): first-proposal bias με 10–30x πλεονέκτημα της ταχύτητας έναντι της ποιότητας, και απότομη υποβάθμιση με την κλίμακα. Hendrycks (2023): η Darwinian λογική ευνοεί ιδιοτελή χαρακτηριστικά σε AI agents.

**Για το GRAIL:** Γνωστοί τρόποι αποτυχίας που πρέπει να δοκιμάσει το EXP-25.

**Πηγές:** [Virtual Agent Economies, 2025](https://arxiv.org/abs/2509.10147) · [Magentic Marketplace, 2025](https://arxiv.org/abs/2510.25779) · [Natural Selection Favors AIs over Humans, 2023](https://arxiv.org/abs/2303.16200)

### Μετάδοση γνώσης μεταξύ γενεών: κίνδυνοι και θετικοί τρόποι

*research, research-prototype* · SOTA-EVO-20

Subliminal learning (2025): χαρακτηριστικά μεταδίδονται μέσα από δεδομένα φιλτραρισμένα από κάθε αναφορά σε αυτά, μόνο όταν teacher και student έχουν κοινό base model· prompted LLM classifiers και in-context learning δεν τα εντοπίζουν. Model collapse (2023/24): η αναδρομική εκπαίδευση σε παραγόμενα δεδομένα εξαφανίζει τις ουρές της κατανομής. Voyager: skill library σε εκτελέσιμο κώδικα που μεταφέρεται σε νέο κόσμο. Evolutionary model merge (Nature Machine Intelligence, 1/2025).

**Για το GRAIL:** Το μέσο της κληρονομιάς καθορίζει αν το taint είναι ελέγξιμο. Αφορά τα CMP-CIV-06 και EXP-26.

**Πηγές:** [Subliminal Learning (HTML), 2025](https://arxiv.org/html/2507.14805) · [The Curse of Recursion, 2023 (v3 2024)](https://arxiv.org/abs/2305.17493) · [Voyager, 2023](https://arxiv.org/abs/2305.16291) · [Evolutionary Optimization of Model Merging Recipes, 2024 (NMI 2025)](https://arxiv.org/abs/2403.13187)

### AI scientists και αυτοματοποιημένη σύνθεση μαρτυρίας (βιοϊατρική)

*system, research-prototype* · SOTA-EVO-21

Co-Scientist (v2 29/6/2026· κατά τη σελίδα arXiv, δημοσιευμένο στο Nature 2026): tournament evolution υποθέσεων· υποψήφια φάρμακα για AML επικυρωμένα in vitro. Kosmos (2025): structured world model· 79.4% των δηλώσεων ακριβείς κατά ανεξάρτητους επιστήμονες· 7 ευρήματα. LUMEN (2026): pipeline systematic review/meta-analysis με 100% directional agreement με δημοσιευμένες meta-analyses και screening sensitivity 96.7%· δεν αναφέρει συμμόρφωση με PRISMA ή RoB 2. ARISMA (2026, πρόταση, όχι υιοθετημένο πρότυπο): οδηγίες για AI-assisted reviews πάνω στο PRISMA 2020, όπου κάθε κρίσιμη απόφαση μένει human-accountable. Το Cochrane RoB 2 είναι το συνιστώμενο εργαλείο risk of bias· το PRISMA 2020 είναι η τρέχουσα έκδοση.

**Για το GRAIL:** Κάνει εφικτό το EXP-10. Ο domain template (EP-10) πρέπει να δεσμεύει domain-standard verifiers και κανόνες αναφοράς.

**Πηγές:** [Accelerating scientific discovery with Co-Scientist, 2025 (v2 2026)](https://arxiv.org/abs/2502.18864) · [Kosmos, 2025](https://arxiv.org/abs/2511.02824) · [LUMEN, 2026](https://arxiv.org/abs/2606.28362) · [ARISMA, 2026](https://arxiv.org/abs/2608.25050) · [RoB 2, n.d. (accessed 2026)](https://methods.cochrane.org/bias/resources/rob-2-revised-cochrane-risk-bias-tool-randomized-trials) · [PRISMA statement, 2026 (accessed)](https://www.prisma-statement.org/)

### Διάδοχοι DGM 2026: meta-level αυτο-τροποποίηση έναντι σταθερού meta-agent

*research, research-prototype* · SOTA-EVO-22

Hyperagents (3/2026): επεκτείνει το DGM ώστε να είναι επεξεργάσιμη και η ίδια η διαδικασία meta-level τροποποίησης (metacognitive self-modification). Η περίληψη δεν αναφέρει μέτρα ασφάλειας. SBCO (8/2026): harness optimisation με σταθερό meta-agent και verifier-grounded feedback· ισοφαρίζει ή ξεπερνά ένα self-modifying baseline σε planning tasks με 4–5.5x λιγότερο compute.

**Για το GRAIL:** Αφορά την απόφαση DEC-EVO-01. Το Hyperagents καταργεί ακριβώς την ιδιότητα «σταθερό loop»· το SBCO είναι ένδειξη ότι ένα παγωμένο meta-level δεν σημαίνει κατ' ανάγκη απώλεια απόδοσης.

**Πηγές:** [Hyperagents, 2026](https://arxiv.org/abs/2603.19461) · [SBCO: Self-Supervised, Verifier-Grounded Harness Optimization, 2026](https://arxiv.org/abs/2608.10157)

### Εκμετάλλευση LLM judges και deterministic guardrails (2026)

*research, research-prototype* · SOTA-EVO-23

LLM-as-a-Judge Is Not an Oracle: 11 αστοχίες του σήματος αξιολόγησης σε 4 κλάσεις. Agents πέτυχαν 100% pass διαβάζοντας cached answer keys, ενώ η πραγματική ικανότητα ήταν 68%. Προτείνονται 5 guardrails: hermetic sandboxes, capability-disjoint roles, acceptance checks που υπερισχύουν, frozen holdouts και canary cases. Self-play έναντι reference-free judges: pass 0.72→0.94 ενώ η ακρίβεια έμενε 0.20· όταν ο judge λύνει πρώτα ο ίδιος το πρόβλημα, το FPR πέφτει από 0.719 σε 0.012. BAITBENCH: 57.1% των runs 7 frontier agents έκανε reward hacking, και >50% ακόμη και με ρητή απαγόρευση. Proof-or-Stop (prototype): μεταβάσεις κύκλου ζωής μόνο με φρέσκια, μηχανικά επαληθεύσιμη μαρτυρία· 18 κλάσεις tampering απορρίφθηκαν με 0 false accepts.

**Για το GRAIL:** Τεκμηριώνει ότι fitness βασισμένο σε LLM judge είναι εκμεταλλεύσιμο, κρίσιμο για το EXP-07. Στηρίζει τον κανόνα μη-LLM oracle του §24 και τα GAP-EVO-02 και GAP-EVO-03. Όλα είναι preprints χωρίς peer review.

**Πηγές:** [LLM-as-a-Judge Is Not an Oracle, 2026](https://arxiv.org/abs/2609.02246) · [More Convincing, Not More Correct, 2026](https://arxiv.org/abs/2607.05904) · [BAITBENCH, 2026](https://arxiv.org/abs/2608.30724) · [Proof-or-Stop, 2026](https://arxiv.org/abs/2607.14890)


---

# Forge γλωσσών / compilers — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### Catala (rules-as-code DSL, default logic)

*system, pilot* · SOTA-FRG-01

DSL για νόμους πάνω σε default logic («definition-under-conditions», κατά Lawsky), με literate programming άρθρο-άρθρο πάνω στο κείμενο του νόμου. Formal semantics· τα core βήματα compilation αποδείχθηκαν σε F* (2021). Μεταγλωττίζει σε Python ή C (κατά το Catala book)· σύνταξη γαλλική και αγγλική· Apache-2.0. Εκδόσεις: v1.0.0 (10/11/2025, «first stable release»), 1.1.0 (29/01/2026), 1.2.0 (02/06/2026), 1.2.1 (06/07/2026)· nightly 22/08/2026.

**Για το GRAIL:** Άμεσος ανταγωνιστής και υποψήφια βάση της LexDSL, με ενεργή συντήρηση. Στην αξιολόγηση του 2021 αποκάλυψε bug στην επίσημη υλοποίηση των γαλλικών οικογενειακών επιδομάτων. Η παραγωγική χρήση από διοικήσεις (DGFiP/CNAF) δεν επαληθεύτηκε, γιατί η σελίδα της Inria μπλόκαρε την πρόσβαση.

**Πηγές:** [Catala: A Programming Language for the Law (arXiv 2103.03198), 2021](https://arxiv.org/abs/2103.03198) · [Catala: a programming language for the law (PACMPL ICFP, Crossref metadata), 2021](https://api.crossref.org/works/10.1145/3473582) · [CatalaLang/catala releases (GitHub API, dates), 2026](https://api.github.com/repos/CatalaLang/catala/releases?per_page=15) · [CatalaLang/catala README, 2026 (accessed)](https://github.com/CatalaLang/catala) · [The Catala book — Introduction, 2026 (accessed)](https://book.catala-lang.org/en/index.html)

### L4 (Legalese, πρώην SMU CCLAW) και Blawx (s(CASP))

*system, research-prototype* · SOTA-FRG-02

L4: DSL νόμου και συμβάσεων με Haskell core (parser, typechecker, evaluator), REST decision service, VS Code/LSP, REPL και ίχνη αξιολόγησης σε GraphViz. Το repo συνεχίζεται στο legalese/l4-ide, και το README αναφέρει pilots σε δημόσιο και ιδιωτικό τομέα. Blawx: rules-as-code σε SWI-Prolog/s(CASP) με εξηγήσεις και hypothetical reasoning· κατά το README, «not production-quality software», για εκπαιδευτική και πειραματική χρήση.

**Για το GRAIL:** Δείχνουν ότι explanation traces και LSP είναι πλέον βασικές ιδιότητες νομικού DSL. Η παραγωγική κλίμακα και των δύο δεν τεκμηριώθηκε· για το L4 υπάρχουν μόνο pilots.

**Πηγές:** [smucclaw/l4-ide (continued at legalese/l4-ide), 2026 (accessed)](https://github.com/smucclaw/l4-ide) · [Lexpedite/blawx, 2026 (accessed)](https://github.com/Lexpedite/blawx)

### OpenFisca, Mlang (γλώσσα M της DGFiP) και MPS / Agile Law Execution Factory

*system, production* · SOTA-FRG-03

OpenFisca: «the most widely adopted» open-source μηχανή rules-as-code σε Python. Χρησιμοποιείται στη Βαρκελώνη (Les meves ajudes), στο LexImpact της γαλλικής Εθνοσυνέλευσης και στην Ιαπωνία. Δεν δηλώνει formal semantics. Mlang: compiler της γλώσσας M του γαλλικού φόρου εισοδήματος, με formal semantics σε Coq. Περνά όλα τα ιδιωτικά tests της DGFiP (09/2022, φορολογικά έτη 2018–2021), αλλά δηλώνει «no legal guarantee of any kind». MPS: case study DSLs για την ολλανδική φορολογική νομοθεσία (Agile Law Execution Factory)· η παραγωγική κλίμακα δεν επαληθεύτηκε.

**Για το GRAIL:** Αποδεικνύουν ότι οι υπολογιστικές διατάξεις (φόροι, επιδόματα) κωδικοποιούνται σε κλίμακα· είναι baseline για το EXP-08. Το Mlang δείχνει ότι τα επίσημα test vectors μιας διοίκησης λειτουργούν ως μηχανικός oracle πιστότητας.

**Πηγές:** [OpenFisca, 2026 (accessed)](https://openfisca.org/en/) · [MLanguage/mlang, 2022](https://github.com/MLanguage/mlang) · [JetBrains MPS, 2026 (accessed)](https://www.jetbrains.com/mps/)

### LegalRuleML Core 1.0 (OASIS) και DMN 1.5 (OMG)

*standard, production* · SOTA-FRG-04

LegalRuleML: OASIS Standard (30/08/2021). Καλύπτει strict και defeasible κανόνες, defeaters με superiority, deontic τελεστές [OBL]/[PER]/[FOR], χρονική μεταβολή κανόνων (repealed, suspended κ.λπ.) και N:M σύνδεση κανόνα↔διάταξης. Είναι XML schema/RDFS, χωρίς εκτελέσιμη σημασιολογία. DMN 1.5: formal από 08/2024 (decision tables).

**Για το GRAIL:** Φορμά ανταλλαγής και εξαγωγής κανόνων LexDSL μέσω του EP-07. Χρησιμεύει και ως μέτρο εκφραστικότητας για deontic τελεστές, που δεν επαληθεύτηκε ότι καλύπτει το Catala (το Catala καλύπτει εξαιρέσεις μέσω default logic). Δεν είναι μηχανή εκτέλεσης.

**Πηγές:** [LegalRuleML Core Specification v1.0, 2021](https://docs.oasis-open.org/legalruleml/legalruleml-core-spec/v1.0/legalruleml-core-spec-v1.0.html) · [OMG DMN specification, 2024](https://www.omg.org/spec/DMN/)

### Cedar Verification-Guided Development (Lean + DRT + PBT)

*system, production* · SOTA-FRG-05

Εκτελέσιμο μοντέλο σε Lean, περίπου 10× μικρότερο από τον κώδικα παραγωγής, με αποδείξεις ιδιοτήτων. DRT Lean↔Rust «six hours nightly», «on the order of 100 million total tests» (2023). PBT για ό,τι δεν μοντελοποιείται. Lean 5µs/test έναντι Rust 7µs. Πολιτική: «No new Cedar version is released unless its model, proofs, and differential tests are current». Βρέθηκαν 4 bugs από τις αποδείξεις και 21 από DRT/PBT.

**Για το GRAIL:** Το πρόχειρο ήδη υιοθετεί αυτό το πρότυπο για τον πυρήνα (31.md P2, VT-505, VT-501, VT-301…VT-307). Δεν το εφαρμόζει στο Forge (CMP-FRG-01, KT-10), όπου η αναφορά είναι Lisp interpreter χωρίς αποδείξεις. Τα νούμερα throughput αφορούν authorization, όχι νομικό DSL, οπότε το EXP-18 μένει ανοιχτό.

**Πηγές:** [How We Built Cedar: A Verification-Guided Approach (arXiv 2407.01688), 2024](https://arxiv.org/abs/2407.01688) · [How we built Cedar with automated reasoning and differential testing, 2023](https://www.amazon.science/blog/how-we-built-cedar-with-automated-reasoning-and-differential-testing) · [Lean use case: Cedar, 2026 (accessed)](https://lean-lang.org/use-cases/cedar/)

### Verified compilers: CompCert 3.18 και CakeML

*system, production* · SOTA-FRG-06

CompCert 3.18 (08/2026): verified C compiler για ARM, PowerPC, RISC-V και x86. Ο parser δηλώνεται formally-verified από την έκδοση 2.3 (2014), με επικύρωση του LR(1) automaton από Coq-verified validator (Jourdan–Pottier–Leroy, ESOP 2012). Qualified τον 03/2026 για το MFC_NG των ATR 42/72, με credits DO-178C/DO-333/DO-330. CakeML: bootstrapped μέσα στο HOL, verified PEG parser, sound και complete type inferencer, proof-producing synthesis από HOL. Το backend στοχεύει 6 αρχιτεκτονικές, που η σελίδα δεν κατονομάζει· Wasm δεν αναφέρεται.

**Για το GRAIL:** Κορυφή της κλίμακας τεκμηρίωσης του INV-F01: απόδειξη για όλα τα προγράμματα, χωρίς TV ανά μονάδα.

**Πηγές:** [CompCert, 2026](https://compcert.org/) · [Validating LR(1) Parsers (ESOP, Crossref metadata), 2012](https://api.crossref.org/works?query.bibliographic=Validating+LR(1)+Parsers+Jourdan+Pottier+Leroy&rows=3) · [CakeML, 2026 (accessed)](https://cakeml.org/)

### Alive2 (bounded translation validation για LLVM IR)

*tool, production* · SOTA-FRG-07

Αυτόματο SMT-based TV για LLVM IR, χωρίς false alarms. Είναι bounded: ξεδιπλώνει loops έως όριο. Βρήκε 47 νέα bugs και οδήγησε σε 8 διορθώσεις του LLVM LangRef. Απαιτεί Z3 και έχει ρυθμιζόμενο SMT timeout· το README δεν αναφέρει ελέγξιμα certificates.

**Για το GRAIL:** Το σημερινό ανώτερο TV για LLVM IR→IR. Δεν καλύπτει backend→Wasm/machine code και, κατά τις πηγές, δεν παράγει ανεξάρτητα ελέγξιμο certificate. Με timeout το αποτέλεσμα δεν είναι απόφαση. Άρα δεν στηρίζει ως έχει το «100% μονάδων» του KT-10.

**Πηγές:** [Alive2: bounded translation validation for LLVM (PLDI, Crossref metadata), 2021](https://api.crossref.org/works/10.1145/3453483.3454030) · [Alive2 paper PDF, 2021](https://users.cs.utah.edu/~regehr/alive2-pldi21.pdf) · [AliveToolkit/alive2 README, 2026 (accessed)](https://github.com/AliveToolkit/alive2)

### MLIR/LLVM με IRDL (dialects ως δεδομένα)

*tool, production* · SOTA-FRG-08

Επεκτάσιμα IR (dialects). Το IRDL ορίζει dialects ως MLIR προγράμματα και έχει σχεδιαστεί ώστε να φορτώνονται στο runtime (dynamic registration ή JIT). Dialects με C++ predicates (irdl.c_pred) δεν καταχωρούνται στο runtime.

**Για το GRAIL:** Σωστή υποδομή για γενικό Compiler Forge και μηχανισμός για το EP-11 («νέα γλώσσα ως δεδομένα»). Το MLIR όμως δεν κωδικοποιεί σημασιολογία.

**Πηγές:** [MLIR IRDL dialect, 2026 (accessed)](https://mlir.llvm.org/docs/Dialects/IRDL/)

### Σημασιολογία και TV για MLIR: verification dialects, SMT dialect, mlir-tv, Lean-MLIR

*research, research-prototype* · SOTA-FRG-09

First-Class Verification Dialects (PACMPL/PLDI 06/2025): το MLIR είναι «syntax-focused» και δεν υποστηρίζει κωδικοποίηση σημασιολογίας. Η σημασιολογία ενός dialect ορίζεται ως lowering προς semantics dialects και από εκεί σε SMT. Δόθηκε σημασιολογία σε 5 dialects, φτιάχτηκαν 3 εργαλεία ανεξάρτητα από dialect και βρέθηκαν 5 miscompilations upstream. Upstream SMT dialect κατά SMT-LIB 2.7. mlir-tv (CAV 2022): SMT TV για ML dialects. Lean-MLIR (ITP 2024): αποδείξεις peephole rewrites σε SSA με regions, στο Lean.

**Για το GRAIL:** Δείχνει ότι TV για custom dialect απαιτεί πρώτα formal σημασιολογία του dialect. Το πρόχειρο δεν το προβλέπει.

**Πηγές:** [First-Class Verification Dialects for MLIR (PACMPL, Crossref metadata), 2025](https://api.crossref.org/works/10.1145/3729309) · [First-Class Verification Dialects for MLIR (abstract, Semantic Scholar), 2025](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1145/3729309?fields=title,abstract,venue,year) · [MLIR SMT dialect, 2026 (accessed)](https://mlir.llvm.org/docs/Dialects/SMT/) · [aqjune/mlir-tv, 2022](https://github.com/aqjune/mlir-tv) · [Verifying Peephole Rewriting in SSA Compiler IRs (arXiv 2407.03685), 2024](https://arxiv.org/abs/2407.03685)

### Cranelift: VeriISLE/Crocus και Arrival (επαληθευμένο instruction selection Wasm→native)

*tool, production* · SOTA-FRG-10

SMT επαλήθευση κανόνων ISLE (ASPLOS 04/2024), που τρέχει στο CI με κοινό SMT query cache. Arrival (PACMPL 10/2025): επαληθεύει σχεδόν όλους τους κανόνες instruction selection AArch64 από Wasm core έναντι authoritative ISA semantics (ARM Machine Readable Specification, ASL). Μειώνει την προσπάθεια κατά 2.6× και βρήκε νέα bugs. Το x86-64 δεν έχει την ίδια κάλυψη. Η ισοδυναμία είναι ακριβής, με εξαίρεση τις διαφορές NaN payload.

**Για το GRAIL:** Ανώτερο πρότυπο για runtime Wasm (CMP-FRG-03): επαληθευμένο instruction selection έναντι authoritative ISA semantics, αντί για TV ανά μονάδα.

**Πηγές:** [Lightweight, Modular Verification for WebAssembly-to-Native Instruction Selection (ASPLOS, Crossref metadata), 2024](https://api.crossref.org/works/10.1145/3617232.3624862) · [wasmtime cranelift/isle/veri README, 2026 (accessed)](https://github.com/bytecodealliance/wasmtime/blob/main/cranelift/isle/veri/README.md) · [Scaling Instruction-Selection Verification against Authoritative ISA Semantics (PACMPL, Crossref metadata with abstract), 2025](https://api.crossref.org/works/10.1145/3764383)

### WebAssembly 3.0 (deterministic profile, SpecTec) και WasmCert-Coq

*standard, production* · SOTA-FRG-11

Wasm 3.0 (17/09/2025): GC, memory64, exceptions, tail calls, relaxed SIMD. Ορίζει ντετερμινιστική default συμπεριφορά για κάθε κατά τα άλλα μη ντετερμινιστική εντολή (floating point και NaN, relaxed vector). Είναι η πρώτη έκδοση του προτύπου που παρήχθη με το toolchain SpecTec. WasmCert-Coq: μηχανοποιεί το Wasm 2.0 μαζί με subtyping και tail-call, με soundness του interpreter WasmRef-Coq, type safety και soundness του module instantiation.

**Για το GRAIL:** Άμεση στήριξη για το INV-C08 και για τις «byte-identical roots» του KT-02, εφόσον το προφίλ απαιτηθεί ρητά.

**Πηγές:** [Wasm 3.0 Completed, 2025](https://webassembly.org/news/2025-09-17-wasm-3.0/) · [WasmCert/WasmCert-Coq, 2026 (accessed)](https://github.com/WasmCert/WasmCert-Coq)

### Wasm Component Model / WIT (WASI 0.2 → 0.3.x)

*standard, pilot* · SOTA-FRG-12

Βρίσκεται ακόμη σε WASI Developer Preview, μέσα στο W3C WebAssembly Community Group· δεν είναι ολοκληρωμένο W3C standard. Η 0.3.0 έφερε native async (async functions, streams, futures)· η 0.3.1 προσθέτει map<K,V>.

**Για το GRAIL:** Στόχος πακεταρίσματος οργάνων Forge (ICD-10, EP-02). Χρειάζεται pinning έκδοσης.

**Πηγές:** [WebAssembly/component-model, 2026 (accessed)](https://github.com/WebAssembly/component-model)

### Semantics-first single-source frameworks: K, Sail, SpecTec, PLT Redex

*tool, production* · SOTA-FRG-13

K Framework Tools 7.0: από μία formal προδιαγραφή παράγει interpreters, model checkers, verifiers και τεκμηρίωση (LLVM και Haskell backends). Sail RISC-V: υιοθετημένο από τη RISC-V International· παράγει εκτελέσιμο emulator, ορισμούς Isabelle/Rocq/Lean και τεκμηρίωση. SpecTec: με αυτό παρήχθη για πρώτη φορά το πρότυπο Wasm (3.0). PLT Redex: DSL για reduction semantics με random testing.

**Για το GRAIL:** Ανώτερο πρότυπο για το Language Forge: μία έδρα σημασιολογίας από την οποία παράγονται interpreter, prover defs και docs. Το CMP-FRG-01 ορίζει grammar, typed semantics και Lisp interpreter ως χωριστά artifacts, χωρίς δηλωμένη παραγωγή από κοινή πηγή.

**Πηγές:** [runtimeverification/k, 2026 (accessed)](https://github.com/runtimeverification/k) · [riscv/sail-riscv, 2026 (accessed)](https://github.com/riscv/sail-riscv) · [PLT Redex, 2026 (accessed)](https://docs.racket-lang.org/redex/) · [Wasm 3.0 Completed (SpecTec), 2025](https://webassembly.org/news/2025-09-17-wasm-3.0/)

### Language workbenches: Langium, Spoofax, Rascal, MPS, Racket #lang

*tool, production* · SOTA-FRG-14

Langium: TypeScript με ενσωματωμένο LSP, «spiritual successor» του Xtext. Spoofax 2.5.23 (28/04/2025): SDF3, Statix (scope graphs), Stratego. Rascal: metaprogramming με VS Code/LSP. MPS: projectional workbench, με case study νομικών DSLs. Racket: #lang που πακετάρει reader και expander.

**Για το GRAIL:** Υπαρκτά εργαλεία για τη γραμματική, το type system και το LSP του CMP-FRG-01, αντί για custom Tree-sitter + ANTLR + Lisp.

**Πηγές:** [eclipse-langium/langium, 2026 (accessed)](https://github.com/eclipse-langium/langium) · [Spoofax, 2025](https://spoofax.dev/) · [Rascal, 2026 (accessed)](https://www.rascal-mpl.org/) · [JetBrains MPS, 2026 (accessed)](https://www.jetbrains.com/mps/) · [Racket Guide: Creating Languages, 2026 (accessed)](https://docs.racket-lang.org/guide/languages.html)

### Parsing: Tree-sitter, ANTLR 4.13.2, verified/validated parsers

*tool, production* · SOTA-FRG-15

Tree-sitter: «fast enough to parse on every keystroke» και robust σε syntax errors. ANTLR 4.13.2 (03/08/2024): 10 targets (Cpp, CSharp, Dart, Java, JavaScript, PHP, Python3, Swift, TypeScript, Go), κανένα Common Lisp. Verified/validated parsers: CoStar (ALL(*) verified σε Coq), parser του CompCert μέσω Coq-verified validator LR(1) automata (ESOP 2012), verified PEG parser του CakeML.

**Για το GRAIL:** Στο trusted path χρειάζεται μία κανονιστική γραμματική με validated parser· το Tree-sitter είναι μόνο παράγωγη προβολή για IDE. Το ANTLR δεν ταιριάζει με Lisp reference.

**Πηγές:** [Tree-sitter docs, 2026 (accessed)](https://tree-sitter.github.io/tree-sitter/) · [antlr/antlr4 releases (GitHub API), 2024](https://api.github.com/repos/antlr/antlr4/releases?per_page=5) · [antlr/antlr4 README (targets), 2026 (accessed)](https://github.com/antlr/antlr4) · [slasser/CoStar, 2023](https://github.com/slasser/CoStar) · [Validating LR(1) Parsers (ESOP, Crossref metadata), 2012](https://api.crossref.org/works?query.bibliographic=Validating+LR(1)+Parsers+Jourdan+Pottier+Leroy&rows=3)

### Ελέγξιμα certificates για SAT/SMT: Lean bv_decide (LRAT), cvc5 proofs, Carcara

*tool, production* · SOTA-FRG-16

bv_decide (LeanSAT): στέλνει τον στόχο σε SAT solver (προεπιλογή CaDiCaL) και ελέγχει το LRAT UNSAT proof με verified checker μέσα στο Lean. Ενσωματώθηκε στο Lean 4 core ως Std.Tactic.BVDecide (nightly 29/08/2024). Το cvc5 εξάγει proofs σε CPC, Alethe και LFSC. Το Carcara ελέγχει και επεξεργάζεται proofs Alethe (TACAS 2023).

**Για το GRAIL:** Κάνει το «translation-validation proof» του ICD-20 ανεξάρτητα ελέγξιμο αντικείμενο PCL, αντί για απλό «unsat» του Z3 (VT-404).

**Πηγές:** [leanprover/leansat, 2024](https://github.com/leanprover/leansat) · [cvc5 proof production, 2026 (accessed)](https://cvc5.github.io/docs/latest/proofs/proofs.html) · [ufmg-smite/carcara, 2023](https://github.com/ufmg-smite/carcara)

### E-graphs: egg και egglog

*research, research-prototype* · SOTA-FRG-17

egg (POPL 2021): equality saturation με rebuilding και e-class analyses. egglog (PLDI 2023): Datalog μαζί με EqSat, με lattice-based reasoning και incremental εκτέλεση. Το repo είναι ενεργό, με Python bindings και crate 3.0.0.

**Για το GRAIL:** Μηχανή rewrites και ελέγχου ισοδυναμίας για optimizers του Compiler Forge. Δεν αναφέρεται στο πρόχειρο. Η παραγωγική χρήση δεν τεκμηριώθηκε.

**Πηγές:** [egg: Fast and Extensible Equality Saturation, 2021](https://arxiv.org/abs/2004.03082) · [Better Together: Unifying Datalog and Equality Saturation, 2023](https://arxiv.org/abs/2304.04332) · [egraphs-good/egglog, 2026 (accessed)](https://github.com/egraphs-good/egglog)

### Differential testing compilers και όρια του N-version (και για κώδικα από LLM)

*tool, production* · SOTA-FRG-18

Csmith (PLDI 2011): τυχαία προγράμματα C χωρίς undefined behavior για differential testing. YARPGen (OOPSLA 2020, PLDI 2023): πάνω από 260 bugs σε gcc, clang, ispc, dpc++, sde και alive2. Knight & Leveson (1986): η υπόθεση ανεξαρτησίας αποτυχιών στο N-version «failed statistically». arXiv 2607.02808 (07/2026): σε 224 προβλήματα και 12 LLMs, ensembles 3 και 5 εκδόσεων πέτυχαν μόνο το 0.43 και το 0.44 του εφικτού κέρδους αξιοπιστίας, κάτω από 0.3 όταν προέρχονται από το ίδιο μοντέλο. Και διαφορετικά μοντέλα αποτυγχάνουν στα ίδια tests πολύ συχνότερα απ' ό,τι αναμένεται υπό ανεξαρτησία.

**Για το GRAIL:** Ο CMP-FRG-05 χρειάζεται generators χωρίς UB και μετρούμενη διαφορετικότητα. Η συμφωνία N εκδόσεων, ιδίως από LLM, δεν αποδεικνύει ορθότητα.

**Πηγές:** [csmith-project/csmith, 2011](https://github.com/csmith-project/csmith) · [intel/yarpgen, 2023](https://github.com/intel/yarpgen) · [N-version programming (Wikipedia; cites Knight & Leveson 1986), 2026 (accessed)](https://en.wikipedia.org/wiki/N-version_programming) · [A Systematic Methodology for Evaluating Failure Independence in LLM-Generated Code (arXiv 2607.02808), 2026](https://arxiv.org/abs/2607.02808)

### LLMs σε compilers/transpilation ως proposers με verifier (2023–2026)

*research, research-prototype* · SOTA-FRG-19

LLMLift (2024): LLM με verified lifting και proofs λειτουργικής ισοδυναμίας, για 4 DSLs. LLM-Vectorizer (2024): το Alive2 επαλήθευσε μόνο το 38.2% των vectorizations (TSVC). Foundation LLM για LLVM-IR/assembly (2024): 45% round-trip disassembly, 14% exact match. LLM 14B για GIMPLE→LLVM IR (05/2026): μόνο εμπειρική αξιολόγηση, χωρίς formal TV. DARPA TRACTOR: C→Rust με static/dynamic analysis και LLMs. Tenspiler (2024): verified-lifting compiler με program synthesis, όχι LLM. Grammar prompting (2023): LLM που παράγει προγράμματα σε υπάρχοντα DSL με BNF. Αναζήτηση arXiv (09/2026) βρήκε γλώσσες σχεδιασμένες για LLMs, όχι γλώσσες με formal semantics σχεδιασμένες από LLM.

**Για το GRAIL:** Επιβεβαιώνει το PVC για το Forge: τα LLMs προτείνουν, TV/proof αποφασίζει, και η απόδοση επαλήθευσης μετριέται.

**Πηγές:** [Verified Code Transpilation with LLMs, 2024](https://arxiv.org/abs/2406.03003) · [Tenspiler: A Verified Lifting-Based Compiler for Tensor Operations, 2024](https://arxiv.org/abs/2404.18249) · [LLM-Vectorizer: LLM-based Verified Loop Vectorizer, 2024](https://arxiv.org/abs/2406.04693) · [Foundation Models of Compiler Optimization (arXiv 2407.02524), 2024](https://arxiv.org/abs/2407.02524) · [LLM Translation of Compiler Intermediate Representation, 2026](https://arxiv.org/abs/2605.08247) · [DARPA TRACTOR, 2026 (accessed)](https://darpa.mil/research/programs/translating-all-c-to-rust) · [Grammar Prompting for DSL Generation with LLMs, 2023](https://arxiv.org/abs/2305.19234) · [arXiv search: LLM design new programming language semantics, 2026 (accessed)](https://arxiv.org/search/?query=LLM+design+new+programming+language+semantics&searchtype=all&order=-announced_date_first)

### Design-space exploration πάνω σε SysML v2

*tool, production* · SOTA-FRG-20

SysML 2.0 formal (09/2025) και Systems Modeling API & Services 1.0 formal (09/2025). Solvers: MiniZinc 2.10.1 (31/08/2026, solver-independent), OR-Tools CP-SAT, Alloy 6.2.0 (09/01/2025, με mutable state και temporal logic). Clafer: η 0.5.1 (09/2023) αφαίρεσε το reasoning· instance generation και multi-objective optimization υπάρχουν μόνο στην παλαιά 0.4.5. LLMs πάνω σε SysML v2: υπάρχουν παραγωγή μοντέλων (SysTemp, 2025) και ευθυγράμμιση/fault localization (2025–2026)· δεν βρέθηκε DSE με LLM.

**Για το GRAIL:** Το «Python + SysML v2 API» του CMP-FRG-04 στηρίζεται πλέον σε formal πρότυπο. Η DSE χρειάζεται τυπικό μοντέλο μεταβλητών, περιορισμών και στόχων πάνω από solver· η 31.md P7 ορίζει μόνο τη μέθοδο αξιολόγησης.

**Πηγές:** [OMG SysML, 2025](https://www.omg.org/spec/SysML/) · [OMG Systems Modeling API and Services, 2025](https://www.omg.org/spec/SystemsModelingAPI/) · [MiniZinc, 2026](https://www.minizinc.org/) · [OR-Tools CP-SAT, 2026 (accessed)](https://developers.google.com/optimization/cp/cp_solver) · [Alloy, 2025](https://alloytools.org/) · [Clafer, 2023](https://www.clafer.org/) · [SysTemp: A Multi-Agent System for Template-Based Generation of SysML v2, 2025](https://arxiv.org/abs/2506.21608) · [arXiv API search: "SysML v2" (40 most recent), 2026 (accessed)](http://export.arxiv.org/api/query?search_query=all:%22SysML%20v2%22&max_results=40&sortBy=submittedDate&sortOrder=descending)

### Επαλήθευση και testing για κώδικα νόμου στο Catala: CUTECat, formal date arithmetic

*research, research-prototype* · SOTA-FRG-21

CUTECat (arXiv 10/2024, αναθ. 01/2025): concolic execution που χειρίζεται default logic. Παράγει «hundreds of thousands of testcases covering all branches» σε γαλλικά επιδόματα στέγασης και στην §132 του US tax code, με test cases κατανοητά σε δικηγόρους. Formal date arithmetic (arXiv 03/2024): σημασιολογία πράξεων ημερομηνιών επαληθευμένη σε F*, με abstract interpretation για στατική ανίχνευση αμφισημιών, ενσωματωμένη στο Catala· βρήκε αμφισημίες στον κώδικα γαλλικών επιδομάτων στέγασης. Ένα preprint του 06/2026 χρησιμοποιεί το Catala ως ντετερμινιστικό verifier για legal AI, χωρίς ποσοτικά αποτελέσματα στο abstract.

**Για το GRAIL:** Generators για νομικό DSL με default logic, καταλληλότεροι από Csmith/YARPGen για το KT-10 και το EXP-08. Η date arithmetic αφορά άμεσα την εφεδρεία του EXP-08 (προθεσμίες, δικονομικοί κανόνες) και τον CMP-LAW-10.

**Πηγές:** [CUTECat: Concolic Execution for Computational Law (arXiv 2410.18212), 2024](https://arxiv.org/abs/2410.18212) · [Formalizing Date Arithmetic and Statically Detecting Ambiguities for the Law (arXiv 2403.08935), 2024](https://arxiv.org/abs/2403.08935) · [Closing the Loop: Formally Verified Law as a Reward Signal for Self-Improving Legal AI (arXiv 2606.23913), 2026](https://arxiv.org/abs/2606.23913)


---

# LAWMAX — νομική συλλογιστική — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### Magesh et al., Hallucination-Free? (τυπολογία correctness/groundedness)

*research, research-prototype* · SOTA-LAW-01

Εμπειρική αξιολόγηση (2024) εμπορικών νομικών AI research tools (Harvey-class) με RAG. Παραίσθηση = απάντηση «incorrect ή misgrounded»· misgrounded είναι η παραπομπή σε υπαρκτή πηγή που δεν στηρίζει την πρόταση. Παραισθήσεις 17%–33%, ακρίβεια 19%–65%. Οι συγγραφείς κρίνουν τα misgrounded σφάλματα δυνητικά πιο επικίνδυνα από την επινόηση απόφασης, επειδή είναι λεπτότερα και εντοπίζονται δυσκολότερα.

**Για το GRAIL:** Μέτρο για INV-L01 και KT-15: η ύπαρξη παραπομπής δεν αρκεί, χρειάζεται έλεγχος στήριξης της πρότασης. Το RAG μόνο του δεν εξαλείφει σφάλματα. Μέτρηση του 2024· νεότερη εικόνα στο SOTA-LAW-07.

**Πηγές:** [Hallucination-Free? Assessing the Reliability of Leading AI Legal Research Tools (arXiv 2405.20362), 2024](https://arxiv.org/abs/2405.20362) · [Hallucination-Free? (HTML: typology, per-tool rates), 2024](https://arxiv.org/html/2405.20362) · [Semantic Scholar record (publication venue: Journal of Empirical Legal Studies), 2024](https://api.semanticscholar.org/graph/v1/paper/arXiv:2405.20362?fields=title,year,venue,journal,publicationVenue,externalIds)

### Dahl et al., Large Legal Fictions

*research, research-prototype* · SOTA-LAW-02

Προφίλ νομικών παραισθήσεων γενικών LLM (2024): 58%–88% σε ερωτήσεις για αποφάσεις ομοσπονδιακών δικαστηρίων ΗΠΑ. Contra-factual bias (δεν διορθώνουν λανθασμένες προκείμενες του χρήστη). Τα μοντέλα δεν ξέρουν πάντα πότε παράγουν παραίσθηση.

**Για το GRAIL:** Το LLM δεν μπορεί να είναι verifier του εαυτού του. Στηρίζει PVC, INV-C04 και τον εξωτερικό citation verifier του CMP-LAW-08.

**Πηγές:** [Large Legal Fictions (Journal of Legal Analysis 16(1):64–93; arXiv 2401.01301), 2024](https://arxiv.org/abs/2401.01301)

### Legal NLP benchmarks (LegalBench, LexGLUE, LawBench, CaseHOLD, SARA)

*research, production* · SOTA-LAW-03

LegalBench: 162 εργασίες, 6 τύποι νομικής συλλογιστικής, από νομικούς. LexGLUE: σουίτα legal NLU (ACL 2022). LawBench: 20 εργασίες σε 3 γνωστικά επίπεδα, στο κινεζικό δίκαιο· συμπέρασμα: «still a long way from obtaining usable and reliable LLMs in legal tasks». CaseHOLD: >53k ερωτήσεις αναγνώρισης holding (ICAIL 2021). SARA (2020): statutory reasoning στο φορολογικό δίκαιο ΗΠΑ· χειροποίητο σύστημα Prolog έλυσε πλήρως το task, ενώ τα machine-reading μοντέλα της εποχής απέδωσαν χαμηλά.

**Για το GRAIL:** Εξωτερικά σημεία αναφοράς για VT-701. Το CaseHOLD είναι το πλησιέστερο task στην «αναγνώριση κρίσιμων λόγων» του EXP-09. Το SARA στηρίζει τον συμβολικό πυρήνα του CMP-LAW-04, αλλά μετρά μοντέλα προ του 2021.

**Πηγές:** [LegalBench (arXiv 2308.11462), 2023](https://arxiv.org/abs/2308.11462) · [LexGLUE (arXiv 2110.00976), 2022](https://arxiv.org/abs/2110.00976) · [LawBench (arXiv 2309.16289), 2023](https://arxiv.org/abs/2309.16289) · [open-compass/LawBench (GitHub: tasks based on the Chinese legal system), 2023](https://github.com/open-compass/LawBench) · [CaseHOLD (arXiv 2104.08671), 2021](https://arxiv.org/abs/2104.08671) · [A Dataset for Statutory Reasoning in Tax Law Entailment and Question Answering (arXiv 2005.05257), 2020](https://arxiv.org/abs/2005.05257)

### LEXam (ICLR 2026)

*research, research-prototype* · SOTA-LAW-04

7.537 ερωτήσεις από 340 εξετάσεις (116 μαθήματα), EN/DE, ανοιχτές και πολλαπλής επιλογής. Ensemble LLM-as-a-Judge με αυστηρή επικύρωση από ειδικούς. Τα LLM δυσκολεύονται σε ανοιχτές ερωτήσεις δομημένης πολυβηματικής νομικής συλλογιστικής.

**Για το GRAIL:** Μεθοδολογικό πρότυπο για VT-701 και VT-702: ανοιχτές ερωτήσεις με επικυρωμένο αυτόματο κριτή.

**Πηγές:** [LEXam: Benchmarking Legal Reasoning on 340 Law Exams (arXiv 2505.12864), 2025](https://arxiv.org/abs/2505.12864)

### GreekBarBench (EMNLP 2025)

*research, research-prototype* · SOTA-LAW-05

Benchmark ελεύθερου κειμένου σε θέματα των εξετάσεων του ελληνικού δικηγορικού συλλόγου, 5 πεδία δικαίου, με υποχρεωτικές παραπομπές σε διατάξεις και πραγματικά περιστατικά. Τρισδιάστατη βαθμολόγηση, LLM-as-judge με meta-evaluation (τα span-based rubrics βελτιώνουν τη συμφωνία με ειδικούς). 13 μοντέλα· τα κορυφαία ξεπερνούν τον μέσο ειδικό αλλά όχι το 95ο εκατοστημόριο.

**Για το GRAIL:** Το μόνο ελληνόγλωσσο νομικό benchmark με έλεγχο παραπομπών που εντόπισα. Εξωτερικό anchor για KT-15, VT-701 και μέτρο για INV-L01.

**Πηγές:** [GreekBarBench (arXiv 2505.17267), 2025](https://arxiv.org/abs/2505.17267)

### GDPval — blinded pairwise σύγκριση με ειδικούς

*research, pilot* · SOTA-LAW-06

44 επαγγέλματα, μεταξύ τους οι δικηγόροι· εργασίες από επαγγελματίες με μέσο όρο 14 ετών εμπειρίας, τυφλή βαθμολόγηση ανά ζεύγος από ειδικούς. Στο gold subset το καλύτερο μοντέλο κρίθηκε ισοδύναμο ή καλύτερο (win-or-tie) στο 47,6%. Inter-rater agreement 71%· αυτόματος grader 66%. Οι συγγραφείς αναγνωρίζουν ότι οι κριτές μπορεί να αναγνώριζαν την προέλευση από υφολογικές ενδείξεις.

**Για το GRAIL:** Πλησιέστερο πρωτόκολλο στο KT-15. Δείχνει δύο αδυναμίες που το KT-15 πρέπει να καλύψει: διαρροή τυφλότητας από το ύφος και όριο συμφωνίας κριτών.

**Πηγές:** [GDPval (arXiv 2510.04374), 2025](https://arxiv.org/abs/2510.04374) · [GDPval full text (HTML), 2025](https://arxiv.org/html/2510.04374)

### Vals Legal AI Report (VLAIR) και Legal Research Report — lawyer baseline

*research, pilot* · SOTA-LAW-07

(α) 27/02/2025: 7 εργασίες με ομάδα ελέγχου δικηγόρων. Τα εμπορικά νομικά AI (Harvey-class) ξεπέρασαν τη baseline σε data extraction, document Q&A, summarization, transcript analysis· η baseline ισοφάρισε το καλύτερο εργαλείο στη χρονολόγηση· οι δικηγόροι υπερείχαν σε redlining και EDGAR research.<br>(β) 14/10/2025: 200 ερωτήσεις αμερικανικής νομικής έρευνας, τυφλή βαθμολόγηση από δικηγόρους και βιβλιοθηκονόμους (accuracy 50%, authoritativeness 40%, appropriateness 10%). Νομικά AI 74–78%, γενικής χρήσης AI 78%, baseline έμπειρων δικηγόρων 69%. Κύριος διαφοροποιητής οι πηγές και οι παραπομπές (+6 μονάδες authoritativeness για τα νομικά εργαλεία)· το γενικής χρήσης AI υπερείχε σε πρόσφατη πληροφορία μέσω web search. Η έκθεση αναφέρει >370 καταγεγραμμένες περιπτώσεις δικογράφων με παραισθημένες παραπομπές παγκοσμίως.

**Για το GRAIL:** Υπαρκτό πρωτόκολλο «AI έναντι δικηγόρων» για το KT-15. Η υπεροχή εξαρτάται από την εργασία (στρωματοποίηση), και η baseline έμπειρων δικηγόρων έχει ήδη ξεπεραστεί στην αμερικανική νομική έρευνα· οι δυσκολότεροι συγκριτές είναι τα συστήματα. Μόνο δίκαιο ΗΠΑ.

**Πηγές:** [Vals Legal AI Report (VLAIR), 02/2025, 2025](https://www.vals.ai/vlair) · [VLAIR Legal Research Report (14/10/2025), 2025](https://www.vals.ai/industry-reports/vlair-10-14-25)

### LegalAgentBench — αξιολόγηση νομικών agents με progress rate

*research, research-prototype* · SOTA-LAW-08

17 corpora, 37 εργαλεία, 300 σχολιασμένες εργασίες (κινεζικό δίκαιο). Μετρά και την πρόοδο των ενδιάμεσων βημάτων (progress rate μέσω keyword analysis).

**Για το GRAIL:** Πρότυπο για end-to-end ροές (OS-01) με μέτρηση ενδιάμεσων βημάτων, συμβατό με receipts ανά βήμα.

**Πηγές:** [LegalAgentBench (arXiv 2412.17259), 2024](https://arxiv.org/abs/2412.17259)

### Νομική ανάκτηση (CLERC, LegalBench-RAG)

*research, research-prototype* · SOTA-LAW-09

CLERC: ανάκτηση αποφάσεων και retrieval-augmented analysis· zero-shot recall@1000 48,3%· το μοντέλο με τα υψηλότερα ROUGE F-scores είχε και τις περισσότερες παραισθήσεις. LegalBench-RAG: 6.858 ζεύγη πάνω σε >79M χαρακτήρες, ανάκτηση ελάχιστων σχετικών snippets.

**Για το GRAIL:** Στηρίζει τις επιλογές του CMP-LAW-05 (πολυστρατηγική ανάκτηση, coverage report, καμία εμπιστοσύνη χωρίς CMP-LAW-08). Το pinpoint snippet είναι προϋπόθεση ελέγχου στήριξης πρότασης.

**Πηγές:** [CLERC (arXiv 2406.17186), 2024](https://arxiv.org/abs/2406.17186) · [LegalBench-RAG (arXiv 2408.10343), 2024](https://arxiv.org/abs/2408.10343)

### Akoma Ntoso / AKN4EU, ELI, ECLI

*standard, production* · SOTA-LAW-10

Akoma Ntoso v1.0 (OASIS Standard, 29/08/2018): FRBR levels (Work, Expression, Manifestation, Item)· ισχύς με @start/@end και efficacy με @startEfficacy/@endEfficacy· active/passive modifications για point-in-time ενοποίηση. AKN4EU: ευρωπαϊκό profile, ρητά work in progress. ELI: 4 πυλώνες (URI, οντολογία FRBR, RDFa/JSON-LD, συγχρονισμός με sitemap/Atom). ECLI: πενταμερές αναγνωριστικό + Dublin Core (Council conclusions 29/04/2011). Η εφαρμογή ELI/ECLI στην Ελλάδα δεν επαληθεύτηκε.

**Για το GRAIL:** Κανονικά πρότυπα για CMP-LAW-02, CMP-KNW-05 και ταυτοποίηση αυθεντιών στο CMP-LAW-08. Η διάκριση ισχύος/efficacy τεκμηριώνει το ανώτερο του INV-L04.

**Πηγές:** [Akoma Ntoso Version 1.0 Part 1: XML Vocabulary (OASIS Standard), 2018](https://docs.oasis-open.org/legaldocml/akn-core/v1.0/akn-core-v1.0-part1-vocabulary.html) · [AKN4EU (EU Vocabularies), 2026](https://op.europa.eu/en/web/eu-vocabularies/akn4eu) · [ELI register — About, 2026](https://eur-lex.europa.eu/eli-register/about.html) · [European Case Law Identifier (ECLI) — e-Justice, 2026](https://e-justice.europa.eu/topics/legislation-and-case-law/european-case-law-identifier-ecli_en)

### LegalRuleML Core 1.0

*standard, production* · SOTA-LAW-11

OASIS Standard (30/08/2021): defeasibility (strict/defeasible rules, defeaters, Override για superiority)· δεοντικά Obligation, Permission, Prohibition, Right· temporal characteristics InForce, Efficacious, Applicability, Enforceability· μεταδεδομένα Jurisdiction/Authority· Alternatives για πολλαπλές ερμηνείες· isomorphism N:M κανόνα ↔ πηγής.

**Για το GRAIL:** Αναφορά για τον δεοντικό/defeasible πυρήνα του CMP-LAW-04, τη διατήρηση εναλλακτικών ερμηνειών (ATMS §8.8) και την ιχνηλασιμότητα κανόνα → διάταξη as-of· τεκμηριώνει το ανώτερο του INV-L04.

**Πηγές:** [LegalRuleML Core Specification Version 1.0 (OASIS Standard), 2021](https://docs.oasis-open.org/legalruleml/legalruleml-core-spec/v1.0/legalruleml-core-spec-v1.0.html)

### Rules-as-code: Catala, OpenFisca, Blawx

*tool, pilot* · SOTA-LAW-12

Catala (ICFP 2021): default logic ως first-class χαρακτηριστικό (README)· απόδειξη ορθότητας των βασικών βημάτων μεταγλώττισης σε F*· στην αξιολόγηση εντόπισε ένα bug σε επίσημη υλοποίηση· κατά το README research project της Inria με compiler «yet unstable». OpenFisca: σε παραγωγή σε δημόσιους φορείς (Βαρκελώνη, LexImpact της Γαλλικής Εθνοσυνέλευσης, Ιαπωνία). Blawx: reasoner SWI-Prolog/s(CASP) με εξηγήσεις· «not production-quality», για εκπαιδευτική/πειραματική χρήση.

**Για το GRAIL:** Υπαρκτή εναλλακτική έναντι της μελλοντικής LexDSL (GP-8) για τους εκτελέσιμους κανόνες των CMP-LAW-04 και CMP-LAW-10· ο Catala μπορεί να λειτουργήσει και ως ανεξάρτητη N-version αναφορά.

**Πηγές:** [Catala: A Programming Language for the Law (arXiv 2103.03198), 2021](https://arxiv.org/abs/2103.03198) · [CatalaLang/catala (GitHub README), 2026](https://github.com/CatalaLang/catala) · [OpenFisca, 2026](https://openfisca.org/en/) · [Lexpedite/blawx (GitHub), 2026](https://github.com/Lexpedite/blawx)

### Argumentation και θεωρία αποδείξεων (Carneades· hybrid theory· legal probabilism)

*research, research-prototype* · SOTA-LAW-13

Carneades: μοντέλο επιχειρημάτων και βάρους απόδειξης (Gordon, Prakken, Walton, Artificial Intelligence 2007) και λογισμικό 4.3 (2017) με argumentation schemes και αξιολόγηση επιχειρημάτων· 2η θέση και στα τέσσερα grounded tracks του ICCMA 2015. Hybrid theory επιχειρημάτων, ιστοριών και ποινικής μαρτυρίας (Bex, van Koppen, Prakken, Verheij, AI & Law 2010). Legal probabilism (SEP, 2021): Bayesian network idioms (Fenton, Neil, Lagnado 2013)· ανοιχτά προβλήματα paradoxes of proof και naked statistical evidence. Για τα άρθρα 2007/2010 επαληθεύτηκαν μόνο μεταδεδομένα.

**Για το GRAIL:** Αναφορά για typed argument graphs (CMP-LAW-04, CMP-CCP-02) και για το CMP-LAW-03: βάρος απόδειξης, αποδεικτικά standards, σύγκριση σεναρίων.

**Πηγές:** [Carneades Argumentation System, 2017](https://carneades.github.io/) · [Gordon, Prakken, Walton — The Carneades model of argument and burden of proof (Artificial Intelligence 171:875–896), Semantic Scholar record, 2007](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1016/j.artint.2007.04.010?fields=title,authors,year,venue,journal,abstract) · [Bex, van Koppen, Prakken, Verheij — A hybrid formal theory of arguments, stories and criminal evidence (AI & Law 18:123–152), Semantic Scholar record, 2010](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1007/s10506-010-9092-x?fields=title,authors,year,venue,journal,abstract) · [Legal Probabilism (Stanford Encyclopedia of Philosophy), 2021](https://plato.stanford.edu/entries/legal-probabilism/)

### Πρόβλεψη δικαστικών αποφάσεων και η κριτική της· adversarial προσομοίωση δίκης

*research, research-prototype* · SOTA-LAW-14

Chalkidis, Androutsopoulos, Aletras (ACL 2019): πρόβλεψη αποφάσεων ΕΔΔΑ. Medvedeva, Wieling, Vols (AI & Law 31:195–212, online 2022): διακρίνουν outcome identification, outcome-based judgement categorisation και outcome forecasting και κατατάσσουν τις υπάρχουσες μελέτες σε αυτές. AgentCourt (2024, v2 2025): προσομοίωση 1.000 αστικών υποθέσεων με adversarial evolvable lawyer agents· +12,1% έναντι των αρχικών agents (CourtBench).

**Για το GRAIL:** Στηρίζει τον στόχο του EXP-09 (κρίσιμοι λόγοι αντί για έκβαση)· το leakage-free as-of backtest (VT-705) αντιστοιχεί στο forecasting της διάκρισης Medvedeva (συναγωγή). Προηγούμενο γεννήτριας αντεπιχειρημάτων για το CMP-LAW-07.

**Πηγές:** [Neural Legal Judgment Prediction in English (arXiv 1906.02059), 2019](https://arxiv.org/abs/1906.02059) · [Medvedeva, Wieling, Vols — Rethinking the field of automatic prediction of court decisions (AI & Law 31:195–212), Semantic Scholar record with abstract, 2022](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1007/s10506-021-09306-3?fields=title,authors,year,venue,journal,abstract) · [AgentCourt (arXiv 2408.08089), 2024](https://arxiv.org/abs/2408.08089)

### Πρότυπα δεδομένων νομικών υποθέσεων (SALI LMSS, FOLIO, LEDES)

*standard, production* · SOTA-LAW-15

SALI LMSS: κοινή γλώσσα κατάταξης υποθέσεων, χρόνου, εγγράφων και οργανισμών. FOLIO (μετονομασία του SOLI): >18.000 νομικές έννοιες σε OWL, CC-BY 4.0, με μεταφράσεις σε πολλές γλώσσες· στόχος η διαλειτουργικότητα πολλών νομικών προτύπων. LEDES: XML Ebilling 2.2, LEDES API v1 (2020), UTBMS, budgeting format.

**Για το GRAIL:** Εξωτερικά λεξιλόγια για το ICD-19 (matters, εργασίες, παραδοτέα, billing) και για τη διαλειτουργικότητα του CMP-LAW-01. Η κάλυψη ελληνικών κατηγοριών δικαίου δεν επαληθεύτηκε.

**Πηγές:** [SALI Alliance — LMSS, 2026](https://www.sali.org/) · [FOLIO — Federated Open Legal Information Ontology, 2025](https://openlegalstandard.org/) · [LEDES, 2026](https://ledes.org/)

### EU AI Act (Κανονισμός 2024/1689) όπως αποτυπώνεται στον tracker (ενημ. 31/08/2026)

*standard, production* · SOTA-LAW-16

- Annex III 8(a): συστήματα για χρήση από ή για λογαριασμό δικαστικής αρχής (έρευνα/ερμηνεία πραγματικών και δικαίου, εφαρμογή), ή ανάλογη χρήση σε ADR.<br>- Art. 3(3), 3(11): provider είναι και όποιος αναπτύσσει σύστημα και το θέτει σε λειτουργία για ίδια χρήση.<br>- Art. 6(3): εξαιρέσεις από τον υψηλό κίνδυνο· το profiling φυσικών προσώπων μένει πάντα υψηλού κινδύνου· 6(4): τεκμηρίωση και καταχώριση (Art. 49(2)) όταν ο πάροχος κρίνει ότι σύστημα του Annex III δεν είναι υψηλού κινδύνου.<br>- Art. 4 (AI literacy, από 02/02/2025): εμφανίζεται τροποποιημένο από το Digital Omnibus (νέες παρ. 2–3)· η ακριβής ισχύουσα διατύπωση δεν επαληθεύτηκε.<br>- Art. 5(1)(f): απαγόρευση συμπερασμού συναισθημάτων σε χώρο εργασίας/εκπαίδευσης, εκτός ιατρικών λόγων ή λόγων ασφάλειας.<br>- Art. 14(4)(b) automation bias· Art. 26 υποχρεώσεις deployer: μόνο για υψηλό κίνδυνο.<br>- Art. 50: 50(1) δήλωση αλληλεπίδρασης με AI (provider)· 50(2) machine-readable σήμανση συνθετικού περιεχομένου, και κειμένου (provider)· 50(4) εξαίρεση editorial ελέγχου μόνο για κείμενα που δημοσιεύονται για ενημέρωση του κοινού σε θέματα δημόσιου ενδιαφέροντος.<br>- Ημερομηνίες: Art. 50 από 02/08/2026, μεταβατικό 50(2) έως 02/12/2026· Chapter III §1–3 για Annex III από 02/12/2027, για Annex I από 02/08/2028. Πρόταση Omnibus 19/11/2025· αριθμός πράξης και έναρξη ισχύος δεν επαληθεύτηκαν.

**Για το GRAIL:** Ορίζει τα Control Records του CMP-LAW-09 και το EXP-19. Ο βοηθός δικηγόρου κατά κανόνα δεν είναι Annex III 8(a)· χρήση σε ADR ή για λογαριασμό δικαστικής αρχής θα τον καθιστούσε υψηλού κινδύνου. Οι υποχρεώσεις provider του Art. 50 ισχύουν ήδη.

**Πηγές:** [AI Act Annex III, 2024](https://artificialintelligenceact.eu/annex/3/) · [AI Act Article 3, 2024](https://artificialintelligenceact.eu/article/3/) · [AI Act Article 4 (with Digital Omnibus amendment markers), 2026](https://artificialintelligenceact.eu/article/4/) · [AI Act Article 5, 2024](https://artificialintelligenceact.eu/article/5/) · [AI Act Article 6, 2024](https://artificialintelligenceact.eu/article/6/) · [AI Act Article 14, 2024](https://artificialintelligenceact.eu/article/14/) · [AI Act Article 26, 2024](https://artificialintelligenceact.eu/article/26/) · [AI Act Article 49, 2024](https://artificialintelligenceact.eu/article/49/) · [AI Act Article 50, 2024](https://artificialintelligenceact.eu/article/50/) · [AI Act implementation timeline (updated 31/08/2026), 2026](https://artificialintelligenceact.eu/implementation-timeline/) · [Digital Omnibus on AI Regulation Proposal (European Commission), 2025](https://digital-strategy.ec.europa.eu/en/library/digital-omnibus-ai-regulation-proposal)

### Εγκεκριμένο από ρυθμιστή AI-driven δικηγορικό γραφείο (SRA, Αγγλία και Ουαλία)

*system, production* · SOTA-LAW-17

Η SRA ενέκρινε στις 06/05/2025 το πρώτο AI-driven γραφείο (είσπραξη οφειλών μέσω small claims έως τη δίκη). Δικλίδες: επώνυμοι ρυθμιζόμενοι solicitors φέρουν την τελική ευθύνη για κάθε έξοδο· το σύστημα δεν προτείνει νομολογία, ως «high-risk area» για LLMs· δεν είναι αυτόνομο και προχωρά μόνο σε βήμα που ενέκρινε ο πελάτης· διαδικασίες για συγκρούσεις συμφερόντων και απόρρητο· αυξημένη αρχική εποπτεία. Όπως κάθε ρυθμιζόμενο γραφείο, οφείλει ελάχιστη ασφαλιστική κάλυψη.

**Για το GRAIL:** Ρυθμιστικό προηγούμενο για το «νομικό ίδρυμα» του T7· επιβεβαιώνει την υπογραφή Principal (ADR-0026)· ο αποκλεισμός νομολογίας αφορά το INV-L01 (DEC-LAW-03).

**Πηγές:** [SRA approves first AI-driven law firm, 2025](https://www.sra.org.uk/sra/news/press/garfield-ai-authorised/)

### Cedar — analysable policy language

*tool, pilot* · SOTA-LAW-18

Γλώσσα εξουσιοδότησης με sound και complete λογική κωδικοποίηση για ακριβή ανάλυση πολιτικών· ιδιότητες σχεδίασης αποδεδειγμένες σε Lean· υλοποίηση σε Rust, open source· καλύτερη απόδοση από OpenFGA και Rego. Χρήση σε παραγωγή δεν επαληθεύτηκε από την πηγή.

**Για το GRAIL:** Υποψήφια policy language για τα Control Records του CMP-LAW-09 (ADR-0010, Cedar-class [X]): μηχανικός έλεγχος ότι οι κανονιστικοί έλεγχοι δεν συγκρούονται.

**Πηγές:** [Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization (arXiv 2403.04651), 2024](https://arxiv.org/abs/2403.04651)

### Cognitive forcing έναντι overreliance

*research, research-prototype* · SOTA-LAW-19

Πείραμα με 199 συμμετέχοντες: οι cognitive forcing functions μείωσαν σημαντικά την υπερβολική εμπιστοσύνη στο AI, περισσότερο από απλές εξηγήσεις. Κόστος: χαμηλότερη ικανοποίηση· ωφελούνται περισσότερο όσοι έχουν υψηλό κίνητρο νοητικής προσπάθειας.

**Για το GRAIL:** Μηχανισμός για ουσιαστικό, όχι τυπικό, sign-off του Principal (INV-L02, CMP-HUM-01)· συνδέεται με το Art. 14(4)(b).

**Πηγές:** [To Trust or to Think (arXiv 2102.09692), 2021](https://arxiv.org/abs/2102.09692)

### eIDAS 2 / EUDI Wallet και OpenID4VP 1.0

*standard, production* · SOTA-LAW-20

Κανονισμός 2024/1183 (11/04/2024, European Digital Identity Framework): κατά την αιτ. 56, ιδιώτες relying parties που οφείλουν strong user authentication πρέπει να δέχονται EUDI Wallets. OpenID4VP 1.0: Final, 09/07/2025, με DCQL, selective disclosure, cross-device flows· υποστηρίζει W3C VC, ISO mdoc, SD-JWT VC.

**Για το GRAIL:** Συγκεκριμένη σύνδεση για αυθεντικοποίηση και επαλήθευση ιδιοτήτων πελάτη (π.χ. εκπροσώπηση νομικού προσώπου) στο CMP-LAW-12 και στο ICD-23· εξειδικεύει το «eIDAS/OIDC» του προχείρου. Διαθεσιμότητα wallet στην Ελλάδα άγνωστη.

**Πηγές:** [Regulation (EU) 2024/1183 (European Digital Identity Framework), 2024](https://eur-lex.europa.eu/eli/reg/2024/1183/oj) · [OpenID for Verifiable Presentations 1.0 (Final), 2025](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)

### Ελληνικά νομικά δεδομένα και πηγές

*research, pilot* · SOTA-LAW-21

Greek Legal Code: >47.000 κατηγοριοποιημένα ελληνικά νομοθετήματα (NLLP 2021). search.et.gr: αναζήτηση ΦΕΚ με ελεύθερο κείμενο και ειδική αναζήτηση νομοθεσίας· δεν αναφέρεται API ή bulk/open data. Αναζήτηση αποφάσεων Αρείου Πάγου: web φόρμα με πεδία αριθμού, ημερομηνιών και διατάξεων· δεν φάνηκε ECLI ούτε API. Αρχική σελίδα ΔΣΑ (09/2026): καμία ορατή οδηγία για AI.

**Για το GRAIL:** Αφορά την attested ingestion των CMP-LAW-02 και CMP-KNW-04 και τα δεδομένα backtest του EXP-09. Η απουσία εμφανούς ECLI/API κάνει την ταυτοποίηση και την πληρότητα νομολογίας ανοιχτό ζήτημα.

**Πηγές:** [Multi-granular Legal Topic Classification on Greek Legislation (arXiv 2109.15298), 2021](https://arxiv.org/abs/2109.15298) · [Εθνικό Τυπογραφείο — Αναζήτηση ΦΕΚ, 2026](https://search.et.gr/el/) · [Άρειος Πάγος — Αναζήτηση αποφάσεων, 2026](https://www.areiospagos.gr/nomologia/apofaseis.asp) · [ΔΣΑ (Athens Bar Association), 2026](https://www.dsa.gr/)

### Κανονιστικό πλαίσιο δεδομένων και επαγγέλματος (EDPB, CCBE)

*standard, production* · SOTA-LAW-22

EDPB Opinion 28/2024 (18/12/2024): ανωνυμία AI models (πρέπει να αποδεικνύεται), legitimate interest, συνέπειες παράνομης επεξεργασίας στην ανάπτυξη. EDPB Guidelines 02/2025 για blockchain (14/04/2025, διαβούλευση έως 09/06/2025): να αποφεύγεται η αποθήκευση προσωπικών δεδομένων σε blockchain όταν συγκρούεται με τις αρχές. CCBE: Guide on the use of AI-based tools by lawyers and law firms in the EU (31/03/2022).

**Για το GRAIL:** Στοιχεία για το EXP-19 (crypto-shredding έναντι append-only), για τη μάθηση μεταξύ υποθέσεων (GAP-LAW-06) και για τα Control Records απορρήτου του CMP-LAW-09.

**Πηγές:** [EDPB Opinion 28/2024 on AI models, 2024](https://www.edpb.europa.eu/our-work-tools/our-documents/opinion-board-art-64/opinion-282024-certain-data-protection-aspects_en) · [EDPB adopts guidelines on processing personal data through blockchains, 2025](https://www.edpb.europa.eu/news/news/2025/edpb-adopts-guidelines-processing-personal-data-through-blockchains-and-ready_en) · [CCBE AI4Lawyers (guide listing), 2022](https://www.ccbe.eu/actions/events/ai4lawyers/)

### Τυπική αριθμητική ημερομηνιών με ανίχνευση αμφισημίας (Catala dates-calc, ESOP 2024)

*tool, research-prototype* · SOTA-LAW-23

Βιβλιοθήκη (OCaml, Python, C) για ημερομηνίες και περιόδους σε ημέρες/μήνες/έτη, με ρητά ορισμένους τελεστές στρογγυλοποίησης και επιλέξιμα rounding modes για την πρόσθεση μηνών/ετών. Συνοδεύει τη δημοσίευση «Formalizing Date Arithmetic and Statically Detecting Ambiguities for the Law» (ESOP 2024). Διαβάστηκε μόνο το README, όχι το άρθρο.

**Για το GRAIL:** Κλείνει την κλάση σφάλματος που ο διπλός υπολογισμός του CMP-LAW-10 δεν πιάνει: δύο μέθοδοι μπορεί να συμφωνούν στην ίδια σιωπηλή στρογγυλοποίηση ενώ ο κανόνας είναι αμφίσημος.

**Πηγές:** [CatalaLang/dates-calc (GitHub; cites the ESOP 2024 paper), 2024](https://github.com/CatalaLang/dates-calc)

### Moise / JaCaMo — οργανωσιακό μοντέλο πολυπρακτορικών συστημάτων

*tool, research-prototype* · SOTA-LAW-24

Οργανωσιακή πλατφόρμα για πολυπρακτορικά συστήματα με ρόλους, ομάδες και αποστολές (missions): agents και μηχανισμοί επιβολής αναφέρονται σε ρητή οργανωσιακή προδιαγραφή. Μέρος της πλατφόρμας JaCaMo· τελευταία ενημέρωση σελίδας 12/2023.

**Για το GRAIL:** Πλησιέστερος γενικός συγκριτής για τα Organization Charters του CMP-LAW-11 (και του CMP-CIV-02). Δεν αξιολόγησα αν είναι ανώτερος του Charter DSL με ελέγχους Alloy/SMT.

**Πηγές:** [Moise — organisational platform for MAS (part of JaCaMo), 2023](https://moise-lang.github.io/)

### Γαλλία: απαγόρευση judge analytics (ν. 2019-222, άρθ. 33)

*standard, production* · SOTA-LAW-25

Ο ν. 2019-222 απαγορεύει την επαναχρησιμοποίηση δεδομένων ταυτότητας δικαστών με σκοπό την αξιολόγηση, ανάλυση, σύγκριση ή πρόβλεψη των επαγγελματικών τους πρακτικών, με ποινικές κυρώσεις. Επαληθεύτηκε το κείμενο της δημοσίευσης στην επίσημη εφημερίδα· η τρέχουσα ενοποιημένη μορφή δεν ελέγχθηκε.

**Για το GRAIL:** Ευρωπαϊκό προηγούμενο για το DEC-LAW-04: η μοντελοποίηση σε επίπεδο δικαστή μπορεί να είναι παράνομη σε κράτος μέλος. Για την Ελλάδα δεν ξέρω.

**Πηγές:** [Loi n° 2019-222 (Légifrance, JORF), 2019](https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000038261631)


---

# Ασφάλεια / κρυπτογραφία — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### NIST PQC standards (FIPS 203 ML-KEM, FIPS 204 ML-DSA, FIPS 205 SLH-DSA) + HQC + Falcon

*standard, production* · SOTA-SEC-01

Τελικά FIPS από 13/8/2024 («can and should be put into use now»)· HQC επιλέχθηκε 11/3/2025 ως δεύτερος KEM μετά το ML-KEM (τελικό πρότυπο σε ~2 έτη)· Falcon σε διαδικασία τυποποίησης (underway).

**Για το GRAIL:** Βάση για ADR-0016, EP-04, INV-X02, CMP-KRN-03· HQC ως διάδοχος KEM στο Crypto Suite Registry.

**Πηγές:** [NIST Post-Quantum Cryptography project, 2026](https://csrc.nist.gov/projects/post-quantum-cryptography) · [HQC announced as a 4th round selection, 2025](https://csrc.nist.gov/news/2025/hqc-announced-as-a-4th-round-selection) · [FIPS 204 ML-DSA, 2024](https://csrc.nist.gov/pubs/fips/204/final)

### NIST IR 8547 (ipd) — PQC transition timeline

*standard, pilot* · SOTA-SEC-02

Initial public draft 12/11/2024 (καμία τελική έκδοση στη σελίδα). ECDSA, EdDSA, RSA, finite-field/ECDH: 112-bit deprecated μετά το 2030, όλα disallowed μετά το 2035. Symmetric (hash, XOF, block ciphers, KDF, DRBG): «significantly less vulnerable to known quantum attacks», η NIST δεν αναμένει μετάβαση. Dual signatures αποδεκτές αν ≥1 συνιστώσα είναι NIST-approved. FAQ: ο Grover δίνει μικρό ή μηδενικό πλεονέκτημα έναντι AES.

**Για το GRAIL:** Διορθώνει την πλαισίωση του κβαντικού κινδύνου (υπογραφές/KEM, όχι SHA-2)· θέτει ορόσημα έναντι του GP-9.

**Πηγές:** [NIST IR 8547 ipd, 2024](https://csrc.nist.gov/pubs/ir/8547/ipd) · [NIST IR 8547 ipd PDF, 2024](https://nvlpubs.nist.gov/nistpubs/ir/2024/NIST.IR.8547.ipd.pdf) · [NIST PQC FAQs, n.d.](https://csrc.nist.gov/Projects/post-quantum-cryptography/faqs)

### Composite ML-DSA (IETF LAMPS)

*standard, pilot* · SOTA-SEC-03

ML-DSA σε hybrid με RSASSA-PKCS1-v1.5, RSASSA-PSS, ECDSA, Ed25519, Ed448 (18 συνδυασμοί)· υπογράφεται το Prefix \|\| Label \|\| len(ctx) \|\| ctx \|\| PH(M)· weak non-separability· καμία παραλλαγή SUF-CMA έναντι κβαντικού αντιπάλου· δεν καλύπτει SLH-DSA· draft-19 (21/4/2026), RFC Editor queue.

**Για το GRAIL:** Ανώτερο από ανεξάρτητες «διπλές υπογραφές» (ADR-0016, INV-X02) για ζεύγη PQ/traditional· ένα alg id ανά ζεύγος (INV-X01).

**Πηγές:** [draft-ietf-lamps-pq-composite-sigs, 2026](https://datatracker.ietf.org/doc/draft-ietf-lamps-pq-composite-sigs/)

### PQ implementation readiness: OpenSSL 3.5, PKCS#11 3.2, RFC 9881, RFC 9814, SP 800-227, RFC 10024

*tool, production* · SOTA-SEC-04

OpenSSL 3.5.0 (8/4/2025): ML-KEM, ML-DSA, SLH-DSA· default TLS keyshares X25519MLKEM768 και X25519.<br>PKCS#11 v3.2, OASIS Standard (3/6/2026): ML-DSA, ML-KEM, SLH-DSA, HSS, XMSS/XMSSMT.<br>RFC 9881 (2025), ML-DSA στο X.509: ctx κενό σε αυτό το profile, HashML-DSA MUST NOT· ML-DSA-65 pk 1952 B / sig 3309 B, ML-DSA-87 sig 4627 B.<br>RFC 9814 (2025): SLH-DSA στο CMS.<br>SP 800-227 final (18/9/2025): συστάσεις για KEMs.<br>RFC 10024 (Proposed Standard, 2026): X25519MLKEM768, SecP256r1MLKEM768, SecP384r1MLKEM1024 για TLS 1.3, πάνω στο RFC 9954 (Informational).

**Για το GRAIL:** Κάνει το CMP-KRN-03 (HSM μέσω PKCS#11), την PQ σουίτα και το hybrid TLS [T] σήμερα· δεδομένα για το EXP-11.

**Πηγές:** [OpenSSL 3.5 release notes, 2025](https://openssl-library.org/news/openssl-3.5-notes/) · [PKCS #11 v3.2, 2026](https://docs.oasis-open.org/pkcs11/pkcs11-spec/v3.2/pkcs11-spec-v3.2.html) · [RFC 9881 ML-DSA in X.509, 2025](https://www.rfc-editor.org/rfc/rfc9881) · [RFC 9814 SLH-DSA in CMS, 2025](https://www.rfc-editor.org/rfc/rfc9814) · [NIST SP 800-227, 2025](https://csrc.nist.gov/pubs/sp/800/227/final) · [RFC 10024 PQ/T Hybrid Key Agreement for TLS 1.3, 2026](https://www.rfc-editor.org/rfc/rfc10024) · [RFC 9954 Hybrid Key Exchange in TLS 1.3, n.d.](https://www.rfc-editor.org/rfc/rfc9954)

### Crypto agility practice: NIST CSWP 39, CBOM (CycloneDX 1.7 / ECMA-424), multihash, RFC 8725

*standard, production* · SOTA-SEC-05

CSWP 39 final 19/12/2025, αποσύρθηκε 29/6/2026 υπέρ του CSWP 39upd1. CycloneDX 1.7 (21/10/2025) και ECMA-424 (10/12/2025), με cryptography registry (CBOM). Multihash: self-describing digests (TLV: function code, length, digest)· spec υπό προετοιμασία για το IETF, όχι πρότυπο. RFC 8725 (BCP 225, JWT) §3.1: allowlist αλγορίθμων· κάθε κλειδί με ακριβώς έναν αλγόριθμο, έλεγχος κατά την πράξη.

**Για το GRAIL:** Εξειδικεύει τα INV-X01 και EP-04: αλγόριθμος δεμένος στο κλειδί, κρυπτογραφική απογραφή. Το RFC 8725 αφορά JWT· η αρχή μεταφέρεται κατ' αναλογία.

**Πηγές:** [NIST CSWP 39, 2025](https://csrc.nist.gov/pubs/cswp/39/considerations-for-achieving-cryptographic-agility/final) · [CycloneDX specification overview, 2025](https://cyclonedx.org/specification/overview/) · [Multihash, n.d.](https://multiformats.io/multihash/) · [RFC 8725 JWT BCP, 2020](https://www.rfc-editor.org/rfc/rfc8725)

### KERI (Key Event Receipt Infrastructure) v1.1

*standard, pilot* · SOTA-SEC-06

Self-certifying identifiers με append-only Key Event Log. Pre-rotation σε «unexposed but pre-committed» κλειδιά. Witness pools (KAWA) με receipts, watchers με first-seen policy, nonrepudiable duplicity proofs, delegated inception/rotation, SQAR (Surprise Quantum Attack Recovery). Δηλώνει crypto agility pre- και post-quantum.

**Για το GRAIL:** Αντιστοιχία στο CMP-KRN-03 και ICD-03 (charter, delegate, rotate, revoke, continuity). Λύνει κρυπτογραφικά τον αγώνα ανάκτησης του KT-23, υπό την προϋπόθεση ότι τα next keys φυλάσσονται χωριστά από τα τρέχοντα.

**Πηγές:** [KERI Specification v1.1 (ToIP KSWG), n.d.](https://trustoverip.github.io/kswg-keri-specification/)

### Transparency & witnessing: C2SP tlog-witness, Sigsum, IETF KEYTRANS, Sigstore Rekor v2

*system, production* · SOTA-SEC-07

C2SP tlog-witness: οι witnesses ελέγχουν checkpoint signature και consistency proof και επιστρέφουν timestamped cosignature· ο μηχανισμός monitor retrieval είναι ακόμη υπό συζήτηση. Sigsum: δημόσιο log υπογραφών με witnesses για ανίχνευση κακής χρήσης κλειδιού. KEYTRANS protocol-05 (6/7/2026, WG I-D): log tree και prefix tree. Rekor v2 GA 10/10/2025: tile-backed (Tessera), backends GCP/AWS/MySQL/POSIX· το ενσωματωμένο witnessing ανακοινώθηκε ως επερχόμενο.

**Για το GRAIL:** Ανίχνευση κακής χρήσης κλειδιών (KT-18, KT-23) και διαφάνεια release signatures (CMP-OPS-01)· συμβατό με τα witnessed checkpoints του ICD-01.

**Πηγές:** [C2SP tlog-witness, n.d.](https://c2sp.org/tlog-witness) · [Sigsum, n.d.](https://www.sigsum.org/) · [IETF KEYTRANS WG, n.d.](https://datatracker.ietf.org/wg/keytrans/about/) · [draft-ietf-keytrans-protocol, 2026](https://datatracker.ietf.org/doc/draft-ietf-keytrans-protocol/) · [Rekor v2 GA, 2025](https://blog.sigstore.dev/rekor-v2-ga/)

### Long-term evidence & time: RFC 4998 ERS, RFC 3161, eIDAS Art. 41, Roughtime

*standard, production* · SOTA-SEC-08

ERS (Proposed Standard, 2007): Timestamp Renewal (συμβιβασμός κλειδιού TSU ή αδυναμία αλγορίθμου της χρονοσφραγίδας) έναντι Hash-Tree Renewal (αδυναμία του hash των δέντρων)· το δεύτερο απαιτεί πρόσβαση στα αρχειοθετημένα δεδομένα. RFC 3161 (updated by RFC 5816): tokens SHOULD be time-stamped again. eIDAS Art. 41(2): το qualified time stamp έχει τεκμήριο ακρίβειας ημερομηνίας/ώρας και ακεραιότητας. Roughtime draft-19 (Experimental), σε τελικό στάδιο προς RFC· malfeasance reports από αλυσίδες απαντήσεων πολλών servers.

**Για το GRAIL:** Τυποποιημένη μορφή του INV-X02· νομική ισχύς χρονοσφραγίδων για LAWMAX· KT-21, KT-23 (pre-compromise TSA-timed υπογραφές), GAP-SEC-05.

**Πηγές:** [RFC 4998 Evidence Record Syntax, 2007](https://www.rfc-editor.org/rfc/rfc4998) · [RFC 3161 TSP, 2001](https://www.rfc-editor.org/rfc/rfc3161) · [eIDAS Regulation 910/2014, 2014](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910) · [draft-ietf-ntp-roughtime, 2026](https://datatracker.ietf.org/doc/draft-ietf-ntp-roughtime/)

### Threshold/multisig: FROST RFC 9591, NIST MPTS (IR 8214C), TUF root rotation

*standard, pilot* · SOTA-SEC-09

FROST: threshold Schnorr (Informational, 2024), βασίζεται στο discrete log, άρα όχι PQ· trusted dealer ή DKG (το DKG εκτός εμβέλειας). NIST IR 8214C final 20/1/2026· previews υποβολών Ιανουάριος και Ιούλιος 2026, τρίτος γύρος 29–30/9/2026· καμία τυποποιημένη PQ threshold. TUF spec 1.0.36: το νέο root υπογράφεται από threshold του παλιού ΚΑΙ του νέου root· κάθε keyid μετρά μία φορά.

**Για το GRAIL:** Για PQ root σήμερα: k-of-n multisignature (TUF-style) αντί threshold signature· PQ threshold ως επέκταση του EP-04.

**Πηγές:** [RFC 9591 FROST, 2024](https://www.rfc-editor.org/rfc/rfc9591) · [NIST Threshold Cryptography project, 2026](https://csrc.nist.gov/projects/threshold-cryptography) · [TUF specification, 2026](https://theupdateframework.github.io/specification/latest/)

### Prompt injection by design: CaMeL, FIDES, Design Patterns, Dual LLM, Progent

*research, research-prototype* · SOTA-SEC-10

CaMeL: το control flow εξάγεται μόνο από το trusted query, untrusted δεδομένα δεν επηρεάζουν τη ροή· capabilities και πολιτικές σε κάθε tool call· 77% εργασιών AgentDojo με provable security (84% χωρίς άμυνα). FIDES: planner με confidentiality και integrity labels, ντετερμινιστική επιβολή πολιτικών, primitives επιλεκτικής απόκρυψης, τυπικό μοντέλο. Design Patterns (2025): Action-Selector, Plan-Then-Execute, LLM Map-Reduce, Dual LLM, Code-Then-Execute, Context-Minimization. Dual LLM (2023): privileged και quarantined LLM με controller. Progent: συμβολικοί κανόνες σε tools/arguments, SMT για narrowing/expansion, το action space μόνο συρρικνώνεται χωρίς έγκριση.

**Για το GRAIL:** Ο μηχανισμός που λείπει από την INV-S01 και το KT-17.

**Πηγές:** [Defeating Prompt Injections by Design (CaMeL), 2025](https://arxiv.org/abs/2503.18813) · [Securing AI Agents with Information-Flow Control (FIDES), 2025](https://arxiv.org/abs/2505.23643) · [Design Patterns for Securing LLM Agents against Prompt Injections, 2025](https://arxiv.org/abs/2506.08837) · [The Dual LLM pattern, 2023](https://simonwillison.net/2023/Apr/25/dual-llm-pattern/) · [Progent, 2025](https://arxiv.org/abs/2504.11703)

### Injection evaluation & structural rules: AgentDojo, adaptive attacks, Spotlighting, AgentPoison, Rule of Two

*research, pilot* · SOTA-SEC-11

AgentDojo: 97 tasks, 629 security test cases. «The Attacker Moves Second» (10/2025): 12 άμυνες παρακάμφθηκαν με ASR >90% στις περισσότερες, ενώ οι περισσότερες ανέφεραν αρχικά σχεδόν μηδενικό ASR. Spotlighting: ASR από >50% σε <2% (πιθανοτική άμυνα). AgentPoison: μέσο ASR >80% με poison rate <0,1%, σε RAG driving, knowledge-intensive QA και EHRAgent. Agents Rule of Two (31/10/2025): όχι ταυτόχρονα [A] untrusted input, [B] sensitive data/systems, [C] αλλαγή κατάστασης ή εξωτερική επικοινωνία χωρίς human-in-the-loop.

**Για το GRAIL:** Κριτήρια και σώμα επιθέσεων για KT-17 και VT-801· κανόνας σύνθεσης για το INV-C07.

**Πηγές:** [AgentDojo, 2024](https://arxiv.org/abs/2406.13352) · [The Attacker Moves Second, 2025](https://arxiv.org/abs/2510.09023) · [Spotlighting, 2024](https://arxiv.org/abs/2403.14720) · [AgentPoison, 2024](https://arxiv.org/abs/2407.12784) · [Agents Rule of Two, 2025](https://ai.meta.com/blog/practical-ai-agent-security/)

### Threat taxonomies: OWASP LLM Top 10 2025, OWASP Agentic Top 10 2026, MITRE ATLAS, LINDDUN

*standard, production* · SOTA-SEC-12

OWASP LLM 2025: LLM01 Prompt Injection, LLM02 Sensitive Information Disclosure, LLM03 Supply Chain, LLM04 Data and Model Poisoning, LLM05 Improper Output Handling, LLM06 Excessive Agency, LLM07 System Prompt Leakage, LLM08 Vector and Embedding Weaknesses, LLM09 Misinformation, LLM10 Unbounded Consumption. OWASP Top 10 for Agentic Applications 2026 (9/12/2025) και OWASP Agentic AI Threats and Mitigations (17/2/2025): δημοσιεύσεις επιβεβαιωμένες, το περιεχόμενο των λιστών δεν επαληθεύτηκε. MITRE ATLAS data 2026.05. LINDDUN (KU Leuven DistriNet): Linking, Identifying, Non-repudiation, Detecting, Data Disclosure, Unawareness, Non-compliance.

**Για το GRAIL:** Εξωτερικό πλέγμα κάλυψης για την §18 που δεν γράφτηκε και για την απρόσιτη έδρα THREAT-MODEL.

**Πηγές:** [OWASP Top 10 for LLM Applications 2025, 2025](https://genai.owasp.org/llm-top-10/) · [OWASP Top 10 for Agentic Applications 2026, 2025](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/) · [OWASP Agentic AI Threats and Mitigations, 2025](https://genai.owasp.org/resource/agentic-ai-threats-and-mitigations/) · [MITRE ATLAS data, 2026](https://github.com/mitre-atlas/atlas-data) · [LINDDUN, n.d.](https://linddun.org/)

### Supply-chain frameworks: SLSA v1.2, in-toto attestations, TUF

*standard, production* · SOTA-SEC-13

SLSA v1.2 (Approved): Build track L0, L1, L2, L3· κανένα Build level δεν απαιτεί reproducible ή hermetic build· το Source track επανεισάγεται στο 1.2. in-toto: DSSE envelope, statement, predicates (SLSA provenance, SPDX, CycloneDX, VSA). TUF: CNCF graduated· ρόλοι root, targets, snapshot, timestamp· προστασία από arbitrary installation, rollback, indefinite freeze, mix-and-match, fast-forward και από συμβιβασμό κλειδιών κάτω από το threshold.

**Για το GRAIL:** Η INV-S03 είναι αυστηρότερη από το SLSA· το TUF καλύπτει τη διανομή artifacts στους organ hosts, που λείπει από το πρόχειρο.

**Πηγές:** [SLSA specification, n.d.](https://slsa.dev/spec/) · [SLSA v1.2 Build track basics, n.d.](https://slsa.dev/spec/v1.2/build-track-basics) · [in-toto Attestation Framework, n.d.](https://github.com/in-toto/attestation) · [The Update Framework, n.d.](https://theupdateframework.io/) · [TUF specification, 2026](https://theupdateframework.github.io/specification/latest/)

### Reproducible & bootstrappable builds: Guix FSB, stagex, DDC

*system, production* · SOTA-SEC-14

Reproducible: οποιοσδήποτε αναπαράγει bit-by-bit πανομοιότυπα artifacts. Guix full-source bootstrap (26/4/2023): γράφος >22.000 κόμβων από seed 357 bytes, x86_64/i686· ως driver απομένει στατικό Guile 25 MiB. Guix Rust (2018): bootstrap από πηγή μέσω mrustc, χωρίς binary rustc. stagex: seed <190 bytes, deterministic, υπογραφές 4 maintainers με hardware-backed PGP. DDC (Wheeler, 2005 και 2009): ανίχνευση trusting-trust με δεύτερο compiler. NixOS: η Nix από μόνη της δεν εγγυάται αναπαραγωγιμότητα.

**Για το GRAIL:** Ισχυρότερο από τους «δύο builders» για το kernel TCB (INV-S03, CMP-OPS-01)· περιορίζει δραστικά, όχι μηδενίζει, το common-mode trusting-trust.

**Πηγές:** [Reproducible builds definition, n.d.](https://reproducible-builds.org/docs/definition/) · [Guix full-source bootstrap, 2023](https://guix.gnu.org/en/blog/2023/the-full-source-bootstrap-building-from-source-all-the-way-down/) · [Guix: Bootstrapping Rust, 2018](https://guix.gnu.org/en/blog/2018/bootstrapping-rust/) · [StageX, n.d.](https://stagex.tools/) · [Countering Trusting Trust (DDC), 2009](https://dwheeler.com/trusting-trust/) · [NixOS reproducibility, n.d.](https://reproducible.nixos.org/)

### Authorization & workload identity: Cedar, Biscuit, Macaroons, SPIFFE/SPIRE

*tool, production* · SOTA-SEC-15

Cedar (2024): μοντέλο και αποδείξεις ιδιοτήτων σε Lean, sound και complete logical encoding για ανάλυση πολιτικών, υλοποίηση σε Rust. Biscuit (Eclipse): capability tokens με public key, offline attenuation με blocks, Datalog, revocation ids· Ed25519 (default) και ECDSA secp256r1, καμία PQ. Macaroons (NDSS 2014): chained HMACs με caveats, άρα μόνο συμμετρική κρυπτογραφία. SPIFFE/SPIRE: short-lived SVIDs (X.509/JWT), node και workload attestation, αυτόματη rotation.

**Για το GRAIL:** Υλοποιήσεις για INV-S02, INV-C07, ADR-0010 και για τα leases των bodies.

**Πηγές:** [Cedar paper, 2024](https://arxiv.org/abs/2403.04651) · [Biscuit, n.d.](https://github.com/eclipse-biscuit/biscuit) · [Biscuit SPECIFICATIONS, n.d.](https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md) · [Macaroons, 2014](https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/) · [SPIFFE overview, n.d.](https://spiffe.io/docs/latest/spiffe-about/overview/)

### GDPR vs append-only: EDPB Guidelines 02/2025, CNIL blockchain guidance, CJEU C-413/23 P

*standard, pilot* · SOTA-SEC-16

EDPB 02/2025 v1.1 (υιοθέτηση 8/4/2025, έκδοση διαβούλευσης έως 9/6/2025):<br>- η τεχνική αδυναμία δεν δικαιολογεί μη συμμόρφωση·<br>- τα κρυπτογραφημένα δεδομένα παραμένουν προσωπικά· η κρυπτογράφηση «overtaken by time» αν το blockchain διατηρείται επ' αόριστον·<br>- salted/keyed hash: μετά τη διαγραφή key/salt δεν πρέπει να είναι linkable· unsalted/unkeyed hashes κατά κανόνα ανεπαρκή για δημόσιο blockchain·<br>- perfectly hiding commitment: μετά τη διαγραφή δεδομένων και witness γίνεται «useless».<br>CNIL (Σεπτ. 2018): ρητή σειρά προτίμησης commitment > keyed hash > ciphertext· με διαγραφή witness ή key το αποτέλεσμα κινείται «closer to» erasure· perfectly hiding commitment μαζί με διαγραφή witness και τιμής ⇒ ανώνυμο.<br>CJEU C-413/23 P (4/9/2025): τα pseudonymised δεδομένα δεν είναι αναγκαστικά προσωπικά για αποδέκτη χωρίς εύλογα μέσα ταυτοποίησης.

**Για το GRAIL:** Ορίζει τις προϋποθέσεις για ADR-0018 και KT-16 και την είσοδο του EXP-19· η δήλωση για unsalted hashes αφορά δημόσιο blockchain και εφαρμόζεται κατ' αναλογία στο ιδιωτικό ledger του GRAIL.

**Πηγές:** [EDPB adopts guidelines on blockchain (news), 2025](https://www.edpb.europa.eu/news/news/2025/edpb-adopts-guidelines-processing-personal-data-through-blockchains-and-ready_en) · [EDPB Guidelines 02/2025 PDF, 2025](https://www.edpb.europa.eu/system/files/2025-04/edpb_guidelines_202502_blockchain_en.pdf) · [CNIL Blockchain guidance (EN), 2018](https://www.cnil.fr/sites/default/files/atoms/files/blockchain_en.pdf) · [CJEU C-413/23 P EDPS v SRB, 2025](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:62023CJ0413)

### Confidential computing & attestation: RFC 9334 RATS, Private Cloud Compute, TEE.fail

*research, pilot* · SOTA-SEC-17

RFC 9334 (Informational, 2023): Attester, Verifier, Relying Party· Evidence και Attestation Results. PCC (10/6/2024): stateless computation, enforceable guarantees, no privileged runtime access, non-targetability, verifiable transparency. TEE.fail (IEEE S&P'26): DDR5 interposer <1000$· εξαγωγή attestation keys από Intel TDX/SGX, ιδιωτικών ECDSA κλειδιών σε AMD SEV-SNP, παραβίαση του NVIDIA CC με «δανεικά» attestation keys.

**Για το GRAIL:** Το TB-4 (provider egress) μπορεί να προσθέσει attested inference, αλλά ο TEE δεν αντικαθιστά residency και τοπικά μοντέλα για privileged δεδομένα.

**Πηγές:** [RFC 9334 RATS, 2023](https://www.rfc-editor.org/rfc/rfc9334) · [Private Cloud Compute, 2024](https://security.apple.com/blog/private-cloud-compute/) · [TEE.fail, 2026](https://tee.fail/)

### LLM serving side channels (KV / semantic cache)

*research, research-prototype* · SOTA-SEC-18

Timing side channels σε KV cache και semantic cache· token-by-token ανάκτηση κοινών prefixes, δηλαδή system prompts και prompts άλλων χρηστών, σε multi-tenant serving (αποδεκτό στο IEEE TIFS).

**Για το GRAIL:** Κίνδυνος cross-matter leakage στους τοπικούς model servers του DP-2 (REQ-SEC-006, VT-805).

**Πηγές:** [The Early Bird Catches the Leak, 2024](https://arxiv.org/abs/2409.20002)

### EU regulatory security frame: CRA, EU PQC roadmap, AI Act Art. 15

*standard, production* · SOTA-SEC-19

CRA: σε ισχύ από 10/12/2024· υποχρεώσεις αναφοράς από 11/9/2026· κύριες υποχρεώσεις από 11/12/2027. EU PQC coordinated implementation roadmap: 23/6/2025 (ορόσημα μη επαληθευμένα). AI Act Art. 15(5): ανθεκτικότητα high-risk συστημάτων σε data poisoning, model poisoning, adversarial examples, confidentiality attacks, model flaws.

**Για το GRAIL:** Δυνητικές υποχρεώσεις για LAWMAX/GRAIL· η εφαρμοσιμότητα κρίνεται στο EXP-19.

**Πηγές:** [Cyber Resilience Act, 2024](https://digital-strategy.ec.europa.eu/en/policies/cyber-resilience-act) · [EU PQC coordinated implementation roadmap, 2025](https://digital-strategy.ec.europa.eu/en/library/coordinated-implementation-roadmap-transition-post-quantum-cryptography) · [AI Act Article 15, 2024](https://artificialintelligenceact.eu/article/15/)

### BFT ordering: HotStuff, HotStuff-2

*research, pilot* · SOTA-SEC-20

HotStuff (2018· PODC'19): partial synchrony, n = 3f+1, linear view change, responsiveness. HotStuff-2 (2023): δύο φάσεις ανά view αντί τριών, με optimistic responsiveness και χωρίς ουσιαστική πρόσθετη πολυπλοκότητα.

**Για το GRAIL:** Στηρίζει το REQ-SEC-003 και το ADR-0031 («HotStuff-family»)· το HotStuff-2 είναι βελτίωση latency μέσα στην ίδια οικογένεια.

**Πηγές:** [HotStuff, 2018](https://arxiv.org/abs/1803.05069) · [HotStuff-2, 2023](https://eprint.iacr.org/2023/397)

### NIST SP 800-88 Rev. 2 — Media Sanitization (Cryptographic Erase)

*standard, production* · SOTA-SEC-21

Guidelines for Media Sanitization, Rev. 2 (Σεπτ. 2025), αντικαθιστά την Rev. 1 (2014)· περιλαμβάνει το cryptographic erase ως τεχνική sanitization. Οι απαιτήσεις επαλήθευσης δεν ελέγχθηκαν εδώ.

**Για το GRAIL:** Τυποποιημένη βάση για το «επαληθευμένη καταστροφή κλειδιού» του KT-16 και το ADR-0018.

**Πηγές:** [NIST SP 800-88 Rev. 2, 2025](https://csrc.nist.gov/pubs/sp/800/88/r2/final)

### vLLM prefix-cache isolation (cache_salt)

*tool, production* · SOTA-SEC-22

Το cache_salt μπαίνει στο hash του πρώτου block, ώστε μόνο αιτήματα με το ίδιο salt να μοιράζονται KV blocks· στοχεύει ρητά timing side channels.

**Για το GRAIL:** Μέτρο διαθέσιμο σήμερα για GAP-SEC-09 και REQ-SEC-006: ένα salt ανά confidentiality domain.

**Πηγές:** [vLLM Automatic Prefix Caching design, n.d.](https://docs.vllm.ai/en/latest/design/prefix_caching.html)


---

# Verification toolchain — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### TLA+ εργαλεία: TLC, Apalache, TLAPS (TLA+ Foundation)

*tool, production* · SOTA-VER-01

Σταθερή TLC 1.7.4 (διόρθωσε unsoundness στο liveness checking με πολλούς workers)· η 1.8.0 διανέμεται ως pre-release· το Toolbox δεν συντηρείται πια (σύσταση: VS Code extension ή CLI). Το Apalache (symbolic, SMT) πέρασε στο TLA+ Foundation υπό το Linux Foundation· paper CAV 2026 με case studies σε Byzantine consensus και υιοθέτηση σε AWS, Microsoft, MongoDB, NVIDIA. TLAPS 1.6.0-pre (rolling) με backends Zenon, Isabelle, SMT, LS4.

**Για το GRAIL:** Έδρα των VT-101, VT-102, VT-103, VT-104, VT-105, VT-106, VT-107, VT-108. Η διόρθωση soundness της 1.7.4 δείχνει ότι η έκδοση του εργαλείου πρέπει να μπαίνει στο evidence.

**Πηγές:** [tlaplus/tlaplus releases, 2026](https://github.com/tlaplus/tlaplus/releases) · [tlaplus v1.7.4 release, 2026](https://github.com/tlaplus/tlaplus/releases/tag/v1.7.4) · [apalache-mc/apalache, 2026](https://github.com/apalache-mc/apalache) · [The TLA+ Model Checker Apalache (CAV 2026), 2026](https://link.springer.com/chapter/10.1007/978-3-032-32519-8_8) · [tlaplus/tlapm, 2026](https://github.com/tlaplus/tlapm)

### Trace validation υλοποιήσεων έναντι TLA+

*research, production* · SOTA-VER-02

Ο έλεγχος ανάγεται σε constrained model checking με TLC πάνω σε traces που περιέχουν μόνο updates (ή υποσύνολο) μεταβλητών· βρήκε αποκλίσεις spec/υλοποίησης σε όλα τα προγράμματα που δοκιμάστηκαν· API instrumentation για Java. Στο CCF (C++) η smart casual verification μπήκε στο CI και βρήκε 6 bugs πριν την παραγωγή. Το Specula (1ο βραβείο GenAI-accelerated TLA+ Challenge 2025) παράγει TLA+ από κώδικα με LLM και control-flow analysis και ευθυγραμμίζει με trace validation (etcd Raft σε Go, Asterinas SpinLock σε Rust).

**Για το GRAIL:** Αυτό είναι το VT-109 και η γέφυρα sim/real του CMP-OPS-02. Τεκμηριωμένο instrumentation: Java, C++ (production), Go και Rust (Specula, research prototype)· για Common Lisp και Elixir δεν βρέθηκε.

**Πηγές:** [Validating Traces of Distributed Programs Against TLA+ Specifications, 2024](https://arxiv.org/abs/2404.16075) · [Smart Casual Verification of the Confidential Consortium Framework (NSDI 2025), 2024](https://arxiv.org/abs/2406.17455) · [GenAI-accelerated TLA+ Challenge, 2025](https://foundation.tlapl.us/challenge/index.html)

### P language: PChecker, PObserve, PVerifier (AWS)

*tool, production* · SOTA-VER-03

Communicating state machines· το PChecker εξερευνά συστηματικά interleavings μηνυμάτων και σφάλματα με αναπαραγώγιμα error traces· το PObserve ελέγχει δομημένα service logs έναντι P specifications· το PVerifier δίνει αποδείξεις με lemmas. Σε χρήση στην AWS από το 2019 (S3, EBS, DynamoDB, MemoryDB, Aurora, EC2, IoT), κατά τη σελίδα case studies που παραπέμπει σε άρθρο CACM 2025. MIT.

**Για το GRAIL:** Εναλλακτική έδρα προδιαγραφής πρωτοκόλλων με ενσωματωμένο runtime conformance από logs, που λείπει από το πρόχειρο (GAP-VER-08).

**Πηγές:** [P case studies, 2025](https://p-org.github.io/P/casestudies/) · [P framework, 2026](https://p-org.github.io/P/)

### Quint και FizzBee (specs φιλικά προς μηχανικούς, με MBT)

*tool, pilot* · SOTA-VER-04

Το Quint (Informal Systems) είναι εναλλακτική σύνταξη για TLA, με simulator, symbolic model checking μέσω Apalache και Quint Connect (MBT σε Rust με replay παραγόμενων traces). Το FizzBee (Apache-2.0) είναι γλώσσα προδιαγραφής με model checker και υποστήριξη MBT μέσω adapters σε Go· η σύνταξή του δεν επαληθεύτηκε εδώ.

**Για το GRAIL:** Κάνουν το VT-502 (MBT) εκτελέσιμο· δεύτερη γλώσσα προδιαγραφής δίπλα στο TLA+ συγκρούεται με το «μία έδρα» (DEC-VER-02).

**Πηγές:** [informalsystems/quint, 2026](https://github.com/informalsystems/quint) · [fizzbee-io/fizzbee, 2026](https://github.com/fizzbee-io/fizzbee)

### Verification-guided development (Cedar)

*system, production* · SOTA-VER-05

Εκτελέσιμο model σε Lean με αποδείξεις, παραγωγικός κώδικας σε Rust, differential random testing (DRT) model↔Rust με εκατομμύρια εισόδους κάθε νύχτα, και PBT. Οι αποδείξεις βρήκαν 4 bugs, DRT και PBT άλλα 21. Το Lean αποτιμά μία είσοδο DRT σε 5 µs (η Rust σε 7 µs)· έλεγχος όλων των αποδείξεων και compile των models σε 185 s· η απόδειξη soundness του validator κόστισε 18 person-days.

**Για το GRAIL:** Άμεσο προηγούμενο για το P2 (Lean reference semantics), το VT-505 και το EXP-18.

**Πηγές:** [How We Built Cedar: A Verification-Guided Approach, 2024](https://arxiv.org/abs/2407.01688) · [Lean Into Verified Software Development (AWS), 2024](https://aws.amazon.com/blogs/opensource/lean-into-verified-software-development/) · [cedar-spec, 2026](https://github.com/cedar-policy/cedar-spec) · [Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization, 2024](https://arxiv.org/abs/2403.04651)

### Lean 4, Lean FRO και ανεξάρτητοι kernel checkers

*tool, production* · SOTA-VER-06

Roadmap Y4-1 (Σεπ. 2026 – Φεβ. 2027): νέο do notation με first-class intrinsic verification, verification-condition generator, grind και bv_decide, βελτιώσεις compiler, και `lake check` ώστε ο εξωτερικός έλεγχος kernel να γίνει ρουτίνα (με εναλλακτικούς checkers, π.χ. nanoda). Το leanchecker διανέμεται με κάθε toolchain από το v4.28.0 (replay δηλώσεων στον kernel). Το lean4lean είναι kernel σε Lean που λειτουργεί ως εξωτερικός checker και έχει βρει kernel bugs, αλλά είναι παράγωγο του C++ kernel· το nanoda_lib είναι εξωτερικός type checker σε Rust.

**Για το GRAIL:** Αφορά τα VT-301, VT-302, VT-303, VT-304, VT-305, VT-306, VT-307 και το proof object του §8.7: υπάρχουν checkers για ανεξάρτητο επανέλεγχο.

**Πηγές:** [Lean FRO Roadmap Y4-1, 2026](https://lean-lang.org/fro/roadmap/y4-1/) · [lean4checker (deprecated; merged as leanchecker), 2026](https://github.com/leanprover/lean4checker) · [lean4lean, 2026](https://github.com/digama0/lean4lean) · [nanoda_lib, 2026](https://github.com/ammkrn/nanoda_lib)

### Επαλήθευση κώδικα Rust: Aeneas, Verus, Kani

*tool, pilot* · SOTA-VER-07

Το Aeneas μεταφράζει safe Rust (μέσω Charon) σε Lean, HOL4, Coq, F* (ωριμότερα Lean και HOL4)· δεν υποστηρίζει ακόμη unsafe ούτε concurrency. Η Microsoft ανακοίνωσε (6/2025) ότι στηρίζεται στο Aeneas για την επαλήθευση της αναγραφής του SymCrypt σε Rust· διαθέσιμο προκαταρκτικό ML-KEM σε preview branch. Το Verus (SMT-based) δηλώνει «under active development». Το Kani (bit-precise model checker) ελέγχει UB, panics, overflows, assertions και function contracts· είναι το κύριο εργαλείο του verify-rust-std (πρόκληση επαλήθευσης της Rust std με υποστήριξη του Rust Foundation).

**Για το GRAIL:** Κλείνει το κενό «αποδείξαμε το model, όχι τον Rust TCB» (ADR-0012), που σήμερα καλύπτει μόνο το DRT.

**Πηγές:** [AeneasVerif/aeneas, 2026](https://github.com/AeneasVerif/aeneas) · [Rewriting SymCrypt in Rust, 2025](https://www.microsoft.com/en-us/research/blog/rewriting-symcrypt-in-rust-to-modernize-microsofts-cryptographic-library/) · [verus-lang/verus, 2026](https://github.com/verus-lang/verus) · [model-checking/kani, 2026](https://github.com/model-checking/kani) · [verify-rust-std, 2026](https://github.com/model-checking/verify-rust-std)

### SMT με ελέγξιμες αποδείξεις: cvc5 → Alethe/LFSC/CPC, Carcara, lean-smt

*tool, pilot* · SOTA-VER-08

Το cvc5 εξάγει αποδείξεις σε CPC, Alethe και LFSC· το Carcara (TACAS 2023) είναι ανεξάρτητος checker και elaborator αποδείξεων Alethe· το lean-smt στέλνει goals στο cvc5 και ξαναπαίζει την απόδειξη στο Lean (beta· UF, LIA/LRA με quantifiers· bitvectors πειραματικά· οι αποδείξεις του cvc5 μπορεί να έχουν holes που μένουν ως Lean goals). Τρέχων Z3: 5.1.0 (16/8/2026).

**Για το GRAIL:** Αντικαθιστά το «unsat core + solver version» του §8.7 με πιστοποιητικό που ελέγχεται ανεξάρτητα (INV-C03). Η κάλυψη θεωριών δεν τεκμηριώθηκε.

**Πηγές:** [cvc5 proofs, 2026](https://cvc5.github.io/docs/latest/proofs/proofs.html) · [Carcara, 2026](https://github.com/ufmg-smite/carcara) · [lean-smt, 2026](https://github.com/ufmg-smite/lean-smt) · [Z3 releases, 2026](https://github.com/Z3Prover/z3/releases)

### Alloy 6

*tool, production* · SOTA-VER-09

Alloy 6.2.0 (9/1/2025): mutable state και traces, CLI και ενσωματωμένος LSP server.

**Για το GRAIL:** Έδρα των VT-201, VT-202, VT-203, VT-204, VT-205.

**Πηγές:** [Alloy releases, 2025](https://github.com/AlloyTools/org.alloytools.alloy/releases)

### Επαλήθευση πρωτοκόλλων για κάθε n: TLAPS, Ivy· όρια του Apalache

*tool, pilot* · SOTA-VER-10

Το Apalache ελέγχει inductive invariants (IndInit/IndNext) «για σταθερές ή φραγμένες παραμέτρους»· το bounded MC χαρακτηρίζεται «incomplete». Για αυθαίρετο n χρειάζεται απόδειξη: TLAPS (ήδη στο πρόχειρο για VT-107, VT-108) ή Ivy, research tool για διαδραστική ανάπτυξη πρωτοκόλλων και αποδείξεων, με inductive invariants, αναγωγή σε decidable logics και παραδείγματα parameterized systems.

**Για το GRAIL:** Το VT-104 (n ≥ 3f+1) με TLC ή Apalache για σταθερό n δεν αποδεικνύει το INV-K06 για κάθε n.

**Πηγές:** [Apalache running docs, 2026](https://apalache-mc.org/docs/apalache/running.html) · [apalache-mc/apalache, 2026](https://github.com/apalache-mc/apalache) · [kenmcmil/ivy, 2026](https://github.com/kenmcmil/ivy) · [IVy documentation, 2026](https://microsoft.github.io/ivy/)

### In-process DST: FoundationDB, TigerBeetle VOPR, madsim, turmoil, Shuttle

*system, production* · SOTA-VER-11

Το FoundationDB προσομοιώνει ντετερμινιστικά ολόκληρο cluster σε μία single-threaded διεργασία· εκτιμά περίπου ένα τρισεκατομμύριο CPU-hours simulation. Το VOPR κάνει stub σε clock, network και disk, με αναπαραγωγή από seed και Git commit. Το madsim αντικαθιστά το tokio runtime με simulator («όλο το I/O πρέπει να γίνει mock»· παρέχει simulated εκδόσεις για tokio, tonic κ.ά.). Το turmoil τρέχει πολλούς hosts σε ένα thread με simulated δίκτυο και filesystem. Το Shuttle κάνει randomized concurrency testing (PCT)· είναι unsound, αλλά κλιμακώνεται σε πολύ μεγαλύτερα tests από το Loom.

**Για το GRAIL:** Σημερινή πρακτική για τα όργανα σε Rust του CMP-OPS-02· δεν καλύπτει όργανα σε άλλες γλώσσες.

**Πηγές:** [FoundationDB simulation testing, 2026](https://apple.github.io/foundationdb/testing.html) · [TigerBeetle VOPR, 2026](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/internals/vopr.md) · [madsim, 2026](https://github.com/madsim-rs/madsim) · [turmoil, 2026](https://github.com/tokio-rs/turmoil) · [awslabs/shuttle, 2026](https://github.com/awslabs/shuttle)

### Ντετερμινισμός ολόκληρου συστήματος: Antithesis, Shadow, Hermit

*system, production* · SOTA-VER-12

Antithesis: πλήρως ντετερμινιστικό περιβάλλον μέσω δικού τους hypervisor (Determinator)· τρέχει containerized λογισμικό (Docker Compose ή Kubernetes) χωρίς αλλαγές κώδικα, με fault injection, RL guidance και SDKs για assertions always, sometimes, reachable, unreachable, alwaysOrUnreachable· hermetic, χωρίς πρόσβαση στο internet· πρόσβαση με credentials και registry· δεν βρέθηκε δηλωμένη on-prem λύση. Shadow: real, unmodified binaries ως διεργασίες Linux πάνω σε ντετερμινιστικό simulated network (open source)· δεν ελέγχει ντετερμινιστικά το thread scheduling by default και δεν υποστηρίζει static binaries (LD_PRELOAD). Hermit: ελέγχει thread scheduling, χρόνο και τυχαιότητα σε unmodified binaries, αλλά είναι σε maintenance mode με περίπου 3–6× overhead.

**Για το GRAIL:** Οι μόνες τεκμηριωμένες επιλογές για ντετερμινισμό οργάνων σε SBCL, BEAM ή Python χωρίς αναγραφή του I/O· καμία δεν καλύπτει όλα τα κριτήρια (DEC-VER-01). Το hermetic περιβάλλον αποκλείει κλήσεις σε εξωτερικούς παρόχους inference, άρα τα γνωσιακά όργανα θέλουν replay ή stubs σε κάθε περίπτωση.

**Πηγές:** [How Antithesis works, 2026](https://antithesis.com/docs/introduction/how_antithesis_works/) · [Antithesis deterministic hypervisor, 2024](https://antithesis.com/blog/deterministic_hypervisor/) · [Antithesis assertions, 2026](https://antithesis.com/docs/properties_assertions/assertions/) · [Antithesis getting started, 2026](https://antithesis.com/docs/getting_started/) · [Shadow, 2026](https://shadow.github.io/) · [Shadow limitations, 2026](https://shadow.github.io/docs/guide/limitations.html) · [Hermit, 2026](https://github.com/facebookexperimental/hermit)

### Twins: παραγωγή Byzantine σεναρίων για BFT

*research, production* · SOTA-VER-13

Δίδυμα αντίγραφα κόμβων με ίδια credentials παράγουν leader equivocation, double voting και απώλεια εσωτερικής κατάστασης. Στο DiemBFT έτρεχαν 44M σενάρια ημερησίως και τα σκόπιμα injected bugs εκτέθηκαν μέσα σε λεπτά.

**Για το GRAIL:** Εφαρμόζεται άμεσα στο VT-601 και στο HotStuff-family BFT του ADR-0031.

**Πηγές:** [Twins: BFT Systems Made Robust, 2022](https://arxiv.org/abs/2004.10617)

### Σκευή testing: PBT/MBT, fuzzing, mutation, Jepsen

*tool, production* · SOTA-VER-14

Hypothesis stateful (rules, invariants, shrinking)· PropEr (GPL v3, modules για stateful testing)· Concuerror (stateless model checking για Erlang· CI μέχρι Erlang 23.3, copyright ως 2023 — η συμβατότητα με τρέχον OTP δεν επαληθεύτηκε)· OSS-Fuzz (libFuzzer, AFL++, Honggfuzz· C/C++, Rust, Go, Python, Java, JavaScript, Lua· >13.000 ευπάθειες και 50.000 bugs ως 5/2025)· mutation testing σε κλίμακα Google (incremental, στο code review, >24.000 developers)· cargo-mutants («semi-actively-maintained», 8/2026)· Schemathesis (PBT από OpenAPI/GraphQL)· Jepsen (τελευταία ανάλυση 3/2026).

**Για το GRAIL:** Υλοποιούν τα VT-501, VT-502, VT-503, VT-504 και τη σουίτα conformance VT-001 έως VT-032.

**Πηγές:** [Hypothesis stateful, 2026](https://hypothesis.readthedocs.io/en/latest/stateful.html) · [PropEr, 2026](https://github.com/proper-testing/proper) · [Concuerror, 2023](https://github.com/parapluu/Concuerror) · [OSS-Fuzz, 2025](https://github.com/google/oss-fuzz) · [Practical Mutation Testing at Scale, 2021](https://arxiv.org/abs/2102.11378) · [cargo-mutants, 2026](https://github.com/sourcefrog/cargo-mutants) · [Schemathesis, 2026](https://github.com/schemathesis/schemathesis) · [Jepsen analyses, 2026](https://jepsen.io/analyses)

### Ανίχνευση breaking changes και translation validation

*tool, production* · SOTA-VER-15

buf breaking (κατηγορίες FILE, PACKAGE, WIRE_JSON, WIRE)· oasdiff (OpenAPI 3.0, 3.1, 3.2)· Alive2 (translation validation για LLVM με Z3· δεν υποστηρίζει inter-procedural μετασχηματισμούς).

**Για το GRAIL:** Υλοποιούν σήμερα τα VT-902 και VT-404.

**Πηγές:** [buf breaking, 2026](https://buf.build/docs/breaking/) · [oasdiff, 2026](https://github.com/oasdiff/oasdiff) · [Alive2, 2026](https://github.com/AliveToolkit/alive2)

### AI για formal verification (vericoding)

*research, research-prototype* · SOTA-VER-16

DafnyBench: 68% στην παραγωγή hints για Dafny (2024). AutoVerus (OOPSLA 2025): >90% σε 150 εργασίες απόδειξης Verus. VERINA (Lean, 189 εργασίες): code 72.6%, spec soundness/completeness 52.3%, proof 4.9%. Vericoding (12.504 specs): Dafny 82%, Verus/Rust 44%, Lean 27%.

**Για το GRAIL:** Proofs που προτείνει LLM και ελέγχει μηχανικά checker ταιριάζουν στο Propose–Verify–Commit (ADR-0005). Τα χαμηλά ποσοστά σε specs και Lean σημαίνουν ότι spec από LLM δεν είναι αξιόπιστη χωρίς ανθρώπινο έλεγχο.

**Πηγές:** [DafnyBench, 2024](https://arxiv.org/abs/2406.08467) · [AutoVerus, 2025](https://arxiv.org/abs/2409.13082) · [VERINA, 2025](https://arxiv.org/abs/2505.23135) · [A benchmark for vericoding, 2025](https://arxiv.org/abs/2509.22908)

### Evaluation harnesses: Inspect, HELM, lm-evaluation-harness

*tool, production* · SOTA-VER-17

Inspect (UK AI Security Institute και Meridian Labs, MIT): datasets/solvers/scorers, agents και multi-agent primitives, sandboxing σε Docker, Kubernetes, Modal, Proxmox κ.ά., >200 έτοιμα evals· το Hawk του METR είναι χτισμένο πάνω του. HELM (TMLR 2023): 7 μετρικές, μεταξύ τους calibration και efficiency. lm-evaluation-harness (MIT): >60 ακαδημαϊκά benchmarks.

**Για το GRAIL:** Έτοιμο υπόστρωμα για το CMP-OPS-03 και το ICD-27.

**Πηγές:** [Inspect, 2026](https://inspect.aisi.org.uk/) · [inspect_ai, 2026](https://github.com/UKGovernmentBEIS/inspect_ai) · [METR, 2026](https://metr.org/) · [HELM, 2023](https://arxiv.org/abs/2211.09110) · [lm-evaluation-harness, 2026](https://github.com/EleutherAI/lm-evaluation-harness)

### Στατιστική αυστηρότητα και adaptive overfitting

*research, production* · SOTA-VER-18

Error bars για evals (Miller 2024): ερωτήσεις ως δείγμα από super-population, clustered SE, paired συγκρίσεις, power analysis. Reusable holdout (Dwork et al. 2015): επανειλημμένη χρήση holdout με αποδεδειγμένη αποφυγή overfitting. Kapoor et al. (2024): η εστίαση μόνο στην ακρίβεια οδηγεί σε άσκοπα σύνθετα agents· κοινή αποτίμηση κόστους-ακρίβειας· πολλά benchmarks χωρίς επαρκή holdouts. LiveBench (ICLR 2025): νέες ερωτήσεις κάθε μήνα, αντικειμενικό ground truth.

**Για το GRAIL:** Θέτει το μέτρο για τα KT-14, KT-15, KT-24 και το REQ-VAL-001.

**Πηγές:** [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640) · [Generalization in Adaptive Data Analysis and Holdout Reuse, 2015](https://arxiv.org/abs/1506.02629) · [AI Agents That Matter, 2024](https://arxiv.org/abs/2407.01502) · [LiveBench, 2025](https://arxiv.org/abs/2406.19314)

### Μεθοδολογία αξιολόγησης νομικού AI και έργου ειδικών

*research, pilot* · SOTA-VER-19

Preregistered μελέτη: commercial legal AI systems (Harvey-class) για νομική έρευνα κάνουν hallucination στο 17–33%. VLAIR (2/2025): baseline με δικηγόρους, βαθμολόγηση με LLM-as-judge και rubrics. GDPval (2025): εργασίες από επαγγελματίες (μέσος όρος 14 έτη εμπειρίας), blind pairwise σύγκριση από ειδικούς του επαγγέλματος με ατελή τύφλωση (υφολογικές ενδείξεις)· αυτόματος grader 66% συμφωνία έναντι 71% μεταξύ ανθρώπων. Οι LLM judges έχουν position, verbosity και self-enhancement bias.

**Για το GRAIL:** Αφορά το VT-702 (blind panel), το KT-15 και το REQ-VAL-001.

**Πηγές:** [Hallucination-Free? Assessing the Reliability of Leading AI Legal Research Tools, 2024](https://arxiv.org/abs/2405.20362) · [Vals Legal AI Report, 2025](https://www.vals.ai/vlair) · [GDPval, 2025](https://arxiv.org/abs/2510.04374) · [GDPval (full text), 2025](https://arxiv.org/html/2510.04374) · [Judging LLM-as-a-Judge, 2023](https://arxiv.org/abs/2306.05685)

### Adaptive red teaming και άμυνα prompt injection by design

*research, research-prototype* · SOTA-VER-20

Adaptive attacks (gradient, RL, random search, human-guided) παρέκαμψαν 12 πρόσφατες άμυνες, τις περισσότερες με επιτυχία >90%, ενώ οι περισσότερες δήλωναν σχεδόν μηδενική. Το CaMeL εξάγει control και data flow από το trusted query και επιβάλλει capabilities: 77% εργασιών AgentDojo με αποδείξιμη ασφάλεια έναντι 84% χωρίς άμυνα.

**Για το GRAIL:** Τα VT-801 και KT-17 με στατικό σώμα επιθέσεων είναι ανεπαρκή· το INV-S01 συμφωνεί με τον σχεδιασμό του CaMeL.

**Πηγές:** [The Attacker Moves Second, 2025](https://arxiv.org/abs/2510.09023) · [CaMeL: Defeating Prompt Injections by Design, 2025](https://arxiv.org/abs/2503.18813)

### Conformal εγγυήσεις: conformal factuality και adaptive conformal inference

*research, research-prototype* · SOTA-VER-21

Conformal factuality: εγγυήσεις ορθότητας 80–90% με back-off της εξειδίκευσης, με ρητή υπόθεση exchangeability (Theorem 4.1). Adaptive conformal inference: long-run coverage υπό αυθαίρετη distribution shift, χωρίς exchangeability.

**Για το GRAIL:** Αφορά το REQ-VAL-004 και το VT-704. Η χρονική μεταβολή του δικαίου σπάει την exchangeability, αλλά το ACI δίνει μακροχρόνια κάλυψη υπό shift· η εφαρμογή σε ordinal επιστημικούς βαθμούς δεν τεκμηριώθηκε.

**Πηγές:** [Language Models with Conformal Factuality Guarantees, 2024](https://arxiv.org/abs/2402.10978) · [Conformal Factuality (full text), 2024](https://arxiv.org/html/2402.10978) · [Adaptive Conformal Inference Under Distribution Shift, 2021](https://arxiv.org/abs/2106.00170)

### SysML v2: εγγενής ιχνηλασιμότητα και επαλήθευση

*standard, production* · SOTA-VER-22

KerML 1.0, SysML 2.0 και Systems Modeling API 1.0 υιοθετήθηκαν τυπικά από την OMG στις 30/6/2025· η SysML 2.0 εμφανίζεται ως formal 9/2025· editorial ενημέρωση 3/2026 για υποβολή στον ISO. Γλώσσα: `satisfy … by`, `verification def` με subject, objective, `verify` και `out verdict : VerdictKind`. Το Syside (Sensmetry) προσφέρει headless CLI και CI validation στα εμπορικά Modeler/Automator· το Syside Editor είναι δωρεάν.

**Για το GRAIL:** Το VT-901, το REQ-VAL-002 και οι σχέσεις satisfy/verify του §29 εκφράζονται εγγενώς στο model.

**Πηγές:** [OMG SysML specifications, 2025](https://www.omg.org/spec/SysML/) · [SysML-v2-Release, 2026](https://github.com/Systems-Modeling/SysML-v2-Release) · [Verification Case Definition Example, 2026](https://raw.githubusercontent.com/Systems-Modeling/SysML-v2-Release/master/sysml/src/training/34.%20Verification/Verification%20Case%20Definition%20Example.sysml) · [Requirement Satisfaction example, 2026](https://raw.githubusercontent.com/Systems-Modeling/SysML-v2-Release/master/sysml/src/training/32.%20Requirements/Requirement%20Satisfaction.sysml) · [Syside, 2026](https://sensmetry.com/syside/)

### Assurance cases: SACM 2.3, GSN v3, Assurance 2.0

*standard, production* · SOTA-VER-23

SACM 2.3 (OMG, 10/2023): metamodel και γραφική σημειογραφία για claims, arguments, evidence. GSN Community Standard v3 (τρέχουσα έκδοση). Assurance 2.0 (2020): έμφαση στη συλλογιστική και ρητή αναγνώριση defeaters και counterevidence.

**Για το GRAIL:** Προσθέτει στο REQ-VAL-002 αιτιολόγηση και αντιλόγους· ταιριάζει με το Court και το INV-K03.

**Πηγές:** [OMG SACM, 2023](https://www.omg.org/spec/SACM/) · [GSN Standard, 2026](https://scsc.uk/gsn-standard) · [Assurance 2.0: A Manifesto, 2020](https://arxiv.org/abs/2004.10474)

### Ντετερμινιστικό LLM inference (batch-invariant kernels)

*research, pilot* · SOTA-VER-24

Η μη-ντετερμινιστική έξοδος σε temperature 0 οφείλεται κυρίως στη μη-αμεταβλητότητα των kernels ως προς το batch size. Με batch-invariant kernels 1000 από 1000 completions ήταν ταυτόσημα (έναντι 80 διαφορετικών χωρίς), με επιβράδυνση 1.6× (42 s έναντι 26 s) έως 2.1× στη μη βελτιστοποιημένη εκδοχή (9/2025).

**Για το GRAIL:** Αφορά το INV-C08 και το DST με γνωσιακά όργανα: replay από receipts ή ντετερμινιστικό inference.

**Πηγές:** [Defeating Nondeterminism in LLM Inference, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/)

### Όριο ανεξαρτησίας στο N-version programming

*research, production* · SOTA-VER-25

Το πείραμα Knight & Leveson (1986) απέρριψε στατιστικά την υπόθεση ανεξαρτησίας αποτυχιών μεταξύ versions. Η πηγή εδώ είναι δευτερογενής.

**Για το GRAIL:** Το VT-506 δεν τεκμηριώνει ανεξαρτησία· η τεκμηριωμένη χρήση του είναι ως έλεγχος ισοδυναμίας (KT-02).

**Πηγές:** [N-version programming, 2026](https://en.wikipedia.org/wiki/N-version_programming)

### Veil: επαλήθευση transition systems μέσα στο Lean 4

*tool, research-prototype* · SOTA-VER-26

Framework ενσωματωμένο στο Lean 4 για προδιαγραφή, υλοποίηση, testing και απόδειξη safety ιδιοτήτων transition systems με έμφαση σε κατανεμημένα πρωτόκολλα (liveness «στο μέλλον»): push-button επαλήθευση σε decidable fragments πρώτης τάξης, model checking, interactive proofs. Veil 2.0 σε pre-release.

**Για το GRAIL:** Εναλλακτική που θα ένωνε προδιαγραφή πρωτοκόλλων και Lean reference semantics (P2) σε μία έδρα· όχι αυστηρά ανώτερο του TLA+ σήμερα (pre-release, χωρίς liveness).

**Πηγές:** [verse-lab/veil, 2026](https://github.com/verse-lab/veil)


---

# Πλατφόρμα σχεδιασμού — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### OMG SysML 2.0 + KerML 1.0 + Systems Modeling API & Services 1.0

*standard, production* · SOTA-PLT-01

Final adoption 21-07-2025, formal έκδοση Σεπτ. 2025 και για τα τρία. Το API έχει PIM και PSMs, με REST/HTTP και JSON schemas για OpenAPI/KerML/SysML. Το Cookbook καλύπτει Projects/Commits/Branches/Tags/Elements/Queries. Η OMG ανέφερε (07-2025) reference implementation και conformance test suite υπό ανάπτυξη· η σημερινή κατάστασή της δεν τεκμηριώνεται.

**Για το GRAIL:** Η μόνη προτυποποιημένη γλώσσα και API για την έδρα. Η γραμμή βάσης για τις ADR-0002 και ICD-32.

**Πηγές:** [OMG Approves Final Adoption of the SysML V2 Specification, 2025](https://www.omg.org/news/releases/pr2025/07-21-25.htm) · [OMG SysML specification versions, 2025](https://www.omg.org/spec/SysML/) · [OMG KerML specification, 2025](https://www.omg.org/spec/KerML/) · [Systems Modeling API and Services, 2025](https://www.omg.org/spec/SystemsModelingAPI/) · [SysML-v2-API-Cookbook, 2026 (accessed)](https://github.com/Systems-Modeling/SysML-v2-API-Cookbook)

### KerML 1.1 Beta 2 / SysML 2.1 Beta 2 (αναθεωρήσεις υπό εξέλιξη)

*standard, pilot* · SOTA-PLT-02

Η pilot release 2026-07 (0.61.0, 20-08-2026) «brings the implementation into conformance with the KerML 1.1 Beta 2 and SysML 2.1 Beta 2 metamodels». Ακολούθησε η 0.62.0 (11-09-2026). Οι δημόσιες σελίδες προδιαγραφών της OMG δείχνουν μόνο τις 2.0/1.0 formal.

**Για το GRAIL:** Κίνδυνος version drift: οι libraries του SysON είναι «SysMLv2 and KerML 2025-07» (από την 2025.10.0). Χρειάζεται pin έκδοσης.

**Πηγές:** [SysML-v2-Pilot-Implementation releases, 2026](https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation/releases) · [SysON release notes, 2026](https://doc.mbse-syson.org/syson/main/user-manual/release-notes/release-notes.html)

### Eclipse SysON v2026.x (Obeo + CEA, EPL-2.0)

*tool, pilot* · SOTA-PLT-03

Web γραφικό εργαλείο SysML v2 με textual import/export .sysml ανά document («some concept are still under development»), GraphQL InsertTextualSysMLv2/UploadDocument, GET document ως κείμενο (Accept: text/html) και project archive ZIP με manifest documentIdsToName. Όρια: 150.000 σημασιολογικά στοιχεία, 1.000 ανά representation, 80 ταυτόχρονοι χρήστες, ~10 MB. «SysON doesn't include built-in version control tools»· προτείνει ZIP ανά έκδοση μέσα σε Git. «SysON does not include built-in mechanisms for authentication or authorization». REST API: ένα commit/branch ανά project, «API for creating additional commits isn't functional». Validation «experimental… not recommended for production». Satisfy στο Requirements View «not yet available», αλλά textual export SatisfyRequirementUsage από την 2026.1.0· derivation edges (#original/#derive) από την 2026.9.0. Η αναφορά συντακτικών σφαλμάτων που αφήνουν upload «partially imported» είναι στην 2026.11.0 (work in progress). Εκδόσεις: v2026.7.0 (10-07-2026), v2026.9.0 (09-09-2026). Ωριμότητα: teaching/research/industrial pilot· Early Adopter Program για επιχειρησιακή χρήση το 2026.

**Για το GRAIL:** Η επιλεγμένη ζωντανή πλατφόρμα και το τοπικό image v2026.7.0 (επιβεβαιωμένο με docker inspect). Ισχυρή στην επεξεργασία από agents, στα διαγράμματα και στα όρια κλίμακας. Αδύναμη σε ιστορικό, έλεγχο πρόσβασης, fidelity του κειμένου και satisfy/verify.

**Πηγές:** [SysON SysML v2 textual format, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/import-export-textual.html) · [SysON release notes, 2026](https://doc.mbse-syson.org/syson/main/user-manual/release-notes/release-notes.html) · [SysON Version control and change management, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/cm.html) · [SysON Security and compliance, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/security.html) · [SysON FAQ, 2026](https://doc.mbse-syson.org/syson/main/user-manual/faq/faq.html) · [SysON Scaling limits, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/scaling-limits.html) · [SysON API details, 2026](https://doc.mbse-syson.org/syson/main/developer-guide/api/api-details.html) · [SysON APIs cookbook, 2026](https://doc.mbse-syson.org/syson/main/developer-guide/api/api-cookbook.html) · [SysON Requirements management, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/requirement-management.html) · [SysON Validation, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/validation.html) · [SysON home (maturity, Early Adopter), 2026](https://mbse-syson.org/) · [eclipse-syson/syson releases, 2026](https://github.com/eclipse-syson/syson/releases) · [eclipse-syson/syson (Obeo, CEA), 2026](https://github.com/eclipse-syson/syson)

### mcp-syson 0.8.7 (Casys AI, MIT, 05-09-2026)

*tool, pilot* · SOTA-PLT-04

MCP provider για SysON (GraphQL + REST) με 31 εργαλεία syson_* (επιβεβαιωμένα από το τοπικό tool listing). Κανένα δεν κάνει textual export, commit ή diff. Fail-closed delete: αναφέρει «deleted: true» μόνο αφού REST GET αποδείξει απουσία. Read-back για κρίσιμες εγγραφές· OUTCOME_UNKNOWN «Do not retry». «SysON and its PostgreSQL database remain authoritative for live model state». Η AQL μπορεί να μεταλλάξει (eSet) και να παρακάμψει το editor command path. Οι τιμές είναι αδιάστατες (δεν διαβάζει MeasurementReferences). Η 0.8.4 (30-08-2026) πιστοποιήθηκε έναντι digest-pinned SysON v2026.7.0. Το stdio αφαιρέθηκε στην 0.4.0 και επανήλθε («Native --stdio») στην 0.8.0.

**Για το GRAIL:** Η σημερινή λύση για ζωντανή εγγραφή από agents, με τεκμηριωμένα όρια ασφάλειας.

**Πηγές:** [Casys-AI/mcp-syson, 2026](https://github.com/Casys-AI/mcp-syson) · [mcp-syson CHANGELOG, 2026](https://raw.githubusercontent.com/Casys-AI/mcp-syson/main/CHANGELOG.md) · [mcp-syson capabilities and safety, 2026](https://github.com/Casys-AI/mcp-syson/blob/main/docs/capabilities-and-safety.md)

### OMG SysML v2 Pilot Implementation

*tool, pilot* · SOTA-PLT-05

Reference Xtext parser/editor για .sysml και .kerml μέσα στο Eclipse, με Jupyter kernel και PlantUML visualization. EPL από την 2026-04· 0.62.0 στις 11-09-2026. Τα README του repo και του SysML-v2-Release δεν τεκμηριώνουν headless/CLI parse-validate για CI.

**Για το GRAIL:** Ανεξάρτητος reference oracle. Η χρήση του σε CI απαιτεί πείραμα (π.χ. μέσω Jupyter kernel ή Xtext standalone).

**Πηγές:** [SysML-v2-Pilot-Implementation, 2026](https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation) · [Pilot releases, 2026](https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation/releases) · [SysML-v2-Release, 2026 (accessed)](https://github.com/Systems-Modeling/SysML-v2-Release)

### SysML v2 API Services (reference, PoC)

*tool, research-prototype* · SOTA-PLT-06

«Proof-of-concept pilot implementation for the Systems Modeling API and Services» με PostgreSQL. Release 2026-04 (14-05-2026), άδεια EPL.

**Για το GRAIL:** Πιθανός provider για ICD-32 (commits/branches), όχι βαθμού παραγωγής.

**Πηγές:** [SysML-v2-API-Services, 2026 (accessed)](https://github.com/Systems-Modeling/SysML-v2-API-Services) · [SysML-v2-API-Services releases, 2026](https://github.com/Systems-Modeling/SysML-v2-API-Services/releases)

### OpenMBEE Flexo MMS SysML v2 (+ Flexo MCP)

*system, pilot* · SOTA-PLT-07

REST/HTTP PSM του Systems Modeling API πάνω στο Flexo, graph-native/RDF, με Layer 1 σε Apache Jena Fuseki quadstore (Apache-2.0). Beta («try out the beta»), με diff μοντέλων. Ο Flexo MCP server έχει 35 εργαλεία, μεταξύ τους Branches, Commits και Merge· 10 commits.

**Για το GRAIL:** Η μόνη ανοιχτή λύση με ιστορικό μέσα στο πρότυπο API. Εναλλακτική έδρα ή provider για ICD-32, μη ώριμη και χωρίς ενσωμάτωση με SysON.

**Πηγές:** [OpenMBEE Flexo, 2026 (accessed)](https://www.openmbee.org/flexo.html) · [flexo-mms-sysmlv2, 2026 (accessed)](https://github.com/Open-MBEE/flexo-mms-sysmlv2) · [flexo-mms-layer1-service, 2026 (accessed)](https://github.com/Open-MBEE/flexo-mms-layer1-service) · [flexo-mms-sysmlv2-mcp, 2026 (accessed)](https://github.com/Open-MBEE/flexo-mms-sysmlv2-mcp)

### Syside (Sensmetry): Editor / Modeler / Automator

*tool, production* · SOTA-PLT-08

Text-first SysML v2 στο VS Code. Το Editor είναι δωρεάν· τα Modeler και Automator «paid-for and licensed». Headless CLI για validate/format/export διαγραμμάτων και CSV σε CI/CD. Διαγράμματα με τη μηχανή Tom Sawyer. On-prem και air-gapped. Roadmap (13-05-2026): v1 το Q3 2026, MCP servers, αρχική υποστήριξη SysML v2 API (Q2) και model servers (Q3) μέσω Automator. Είναι το language-aware toolchain της πρακτικής SEI 2026.

**Για το GRAIL:** Το πιο τεκμηριωμένο text+git+CI toolchain. Κόστος άδειας και εξάρτηση από vendor για την πύλη.

**Πηγές:** [Syside, 2026](https://sensmetry.com/syside/) · [Syside Automator docs, 2026](https://docs.sensmetry.com/automator/index.html) · [Syside Modeler docs, 2026](https://docs.sensmetry.com/modeler/index.html) · [Syside Roadmap Q2 2026 update, 2026](https://sensmetry.com/product-roadmap-2026-q2-update/)

### Sysand (package manager SysML v2/KerML)

*tool, pilot* · SOTA-PLT-09

Package manager για model interchange projects (.kpar, KerML clause 10.3), με official index (sysand.com) και private indexes, CLI και Python/Java APIs. MIT/Apache-2.0. Ο v1 στοχεύεται το Q3 2026.

**Για το GRAIL:** Μηχανισμός για pinned αναφορές βιβλιοθηκών ανάμεσα σε repos χωρίς συγχώνευσή τους. Χρήση git ως πηγής δεν τεκμηριώνεται στο README.

**Πηγές:** [sensmetry/sysand, 2026 (accessed)](https://github.com/sensmetry/sysand) · [Introducing Sysand, 2025](https://sensmetry.com/introducing-sysand-the-package-manager-for-the-sysml-v2-ecosystem/) · [Syside Roadmap Q2 2026 update, 2026](https://sensmetry.com/product-roadmap-2026-q2-update/)

### CATIA Magic / Cameo SysML v2 (2026x) + Teamwork Cloud

*system, production* · SOTA-PLT-10

Άμεσος αμφίδρομος συγχρονισμός κειμένου και γραφικών. «Teamwork Cloud fully conforms to the SysML v2 API and Services specification» (δήλωση vendor)· branches με επανένταξη μέσω model patch και αυτόματο merge. Η δωρεάν Community Edition: «up to 500 major elements», για μάθηση/εκπαίδευση, χωρίς δημοσιευμένο ορισμό του major element.

**Για το GRAIL:** Εμπορικός provider που καλύπτει ιστορικό και API, με vendor lock-in. Το πρόχειρο έχει ~345 IDs πριν από σχέσεις, ports και usages, οπότε η CE είναι εύλογα ανεπαρκής· ακριβής σύγκριση αδύνατη χωρίς τον ορισμό.

**Πηγές:** [CATIA Magic/Cameo SysML v2 Solution, 2026](https://docs.nomagic.com/SYSML2P/2026x/catia-magic-cameo-sysml-v2-solution-272740940.html) · [SysML v2 Community Edition, 2026](https://docs.nomagic.com/SYSML2P/2026x/catia-magic-cameo-sysml-v2-community-edition-286557495.html)

### IBM Rhapsody Systems Engineering 1.5 / 1.8

*system, production* · SOTA-PLT-11

Η 1.5 (14-10-2025) φέρνει ιδιωτικά branches έναντι του δημόσιου «main» για υιοθέτηση του SysML v2. Η 1.8 (09-07-2026) φέρνει AI MCP API και υποστήριξη air-gapped.

**Για το GRAIL:** Εμπορικό σημείο αναφοράς. Οι ανακοινώσεις δεν τεκμηριώνουν textual interchange ούτε conformance στο SysML v2 API.

**Πηγές:** [Rhapsody SE 1.8, 2026](https://www.ibm.com/new/announcements/scaling-sysml-v2-systems-engineering-with-ibm-rhapsody-systems-engineering-v1-8) · [Rhapsody SE 1.5, 2025](https://www.ibm.com/new/announcements/ibm-introduces-rhapsody-systems-engineering-v1-5-simplifying-the-adoption-of-sysml-v2-for-complex-product-development)

### PySAM (ansys-sam-sysml2)

*tool, pilot* · SOTA-PLT-12

Η 0.3.3 (03-09-2026, MIT, Beta) φορτώνει models από εργαλεία που υλοποιούν το πρότυπο SysML v2 API, επιτρέπει επεξεργασία σε Python και συγχρονίζει πίσω.

**Για το GRAIL:** Παράδειγμα Python client πάνω στο πρότυπο API. Συνδέεται με την εμπορική πλατφόρμα Ansys SAM.

**Πηγές:** [ansys-sam-sysml2 (PyPI), 2026](https://pypi.org/project/ansys-sam-sysml2/)

### Tom Sawyer SysML v2 Viewer 2.1

*tool, production* · SOTA-PLT-13

Automatic layout και ενσωμάτωση «with any SysML v2 API-compliant repository» (20-05-2026, πάνω στο reference implementation 2026-03). Είναι επίσης η μηχανή διαγραμμάτων του Syside Modeler.

**Για το GRAIL:** Διαγράμματα ως παραγόμενες προβολές (ADR-0033). Εμπορικό.

**Πηγές:** [Tom Sawyer SysML v2 Viewer 2.1, 2026](https://www.tomsawyer.com/news/tom-sawyer-software-releases-sysml-v2-viewer-2.1) · [Syside Modeler docs, 2026](https://docs.sensmetry.com/modeler/index.html)

### Ανεξάρτητοι parsers: MontiCore sysmlv2, sysml-v2-lsp

*tool, research-prototype* · SOTA-PLT-14

MontiCore: «second SysML v2 parser for comparison… with the Pilot», με CLI (java -jar MCSysMLv2.jar -i …). Τα context conditions «definitely not yet complete»· άδεια BSD-3-based. sysml-v2-lsp: ANTLR4 LSP με semantic validation (unresolved types, multiplicity, duplicates) και sysml-mcp CLI, MIT.

**Για το GRAIL:** Υποψήφιοι για N-version parsing στην πύλη, σύμφωνα με το δόγμα N-version του GRAIL. Ελλιπείς σημασιολογικοί έλεγχοι.

**Πηγές:** [MontiCore/sysmlv2, 2026 (accessed)](https://github.com/MontiCore/sysmlv2) · [daltskin/sysml-v2-lsp, 2026 (accessed)](https://github.com/daltskin/sysml-v2-lsp)

### SEI/CMU: Native AI integration for MBSE (3 layers)

*research, pilot* · SOTA-PLT-15

Τρία στρώματα (C. Dempsey, 02-09-2026): (1) AI coding assistants πάνω σε version-controlled artifacts, (2) language-aware toolchain (Syside μέσω LSP και CLI στο CI), (3) knowledge/workflow layer με Markdown οδηγούς, MCP retrieval και skill files. Ένα καθαρό validation run δείχνει μόνο ότι το model περνά τους ελέγχους· απαιτείται ανθρώπινη engineering review.

**Για το GRAIL:** Η πιο πρόσφατη τεκμηριωμένη πρακτική agent-authored MBSE: κείμενο + git + μηχανικός έλεγχος + ανθρώπινη έγκριση.

**Πηγές:** [Native AI Integration for MBSE: Three Layers, 2026](https://www.sei.cmu.edu/blog/native-ai-integration-for-model-based-systems-engineering-three-layers-that-make-it-work/)

### Έρευνα LLM → SysML v2

*research, research-prototype* · SOTA-PLT-16

SysTemp: multi-agent με template generator (το abstract δεν αναφέρει parser feedback). SysMBench: 151 σενάρια, 17 LLMs, μέγιστο SysMEval-F1 62%. KG-augmented semantic fault localization (22-06-2026): repair από <3% σε >91% μετά από fine-tuning μικρού μοντέλου, με human-in-the-loop. LLM semantic alignment (ISSE 2025).

**Για το GRAIL:** Η παραγωγή από LLM δεν είναι αξιόπιστη χωρίς μηχανικό έλεγχο και ανθρώπινη έγκριση, άρα η πύλη είναι υποχρεωτική.

**Πηγές:** [SysTemp, 2025](https://arxiv.org/abs/2506.21608) · [System Model Generation Benchmark (SysMBench), 2025](https://arxiv.org/abs/2508.03215) · [Automated Semantic Fault Localization in SysML v2, 2026](https://arxiv.org/abs/2606.23395) · [LLM-Assisted Semantic Alignment with SysML v2, 2025](https://arxiv.org/abs/2508.16181)

### Textual vs JSON interchange (element IDs)

*research, production* · SOTA-PLT-17

Η textual interchange είναι «less suited for round-trip scenarios due to the absence of element identifiers». Για round-trip προτείνεται JSON-based interchange, ιδανικά μαζί με το κείμενο (04-03-2026).

**Για το GRAIL:** Μια επανεισαγωγή από κείμενο δεν διατηρεί IDs. Ένα byte-exact JSON αντίγραφο στο git είναι ο πιθανός μετριασμός (ανεπαλήθευτο για το SysON).

**Πηγές:** [A Practical Guide for SysML v2 Adoption (Sodius Willert), 2026](https://www.sodiuswillert.com/en/blog/a-practical-guide-for-sysml-v2-adoption)

### Capella/Arcadia ↔ SysML v2

*tool, research-prototype* · SOTA-PLT-18

Arcadia library για SysML v2 (10-06-2026): «a first, foundational step», «still an early basis». Το SysML Bridge for Capella είναι custom υπηρεσία για SysML v1.4 (Eclipse UML XMI), όχι SysML v2.

**Για το GRAIL:** Το «Capella bridge» του EXP-17 δεν είναι σήμερα SysML v2 client.

**Πηγές:** [Obeo strengthens its commitment to the future of Capella, 2026](https://blog.obeosoft.com/obeo-strengthens-its-commitment-to-the-future-of-capella) · [SysML Bridge for Capella, 2026 (accessed)](https://www.obeosoft.com/en/products/sysml-bridge-for-capella/)

### Structurizr (C4 models as code)

*tool, production* · SOTA-PLT-19

DSL και όλες οι εντολές δωρεάν, εκτός του server με prebuilt binaries (v2026.06.28) που θέλει άδεια. Lite και On-Premises σε end of life.

**Για το GRAIL:** Προαιρετική C4 προβολή (architecture/workspace.dsl). Δεν βρέθηκε generator από SysML v2.

**Πηγές:** [Structurizr docs, 2026](https://docs.structurizr.com/)

### Άλλοι SysML v2 MCP servers και Gaphor

*tool, research-prototype* · SOTA-PLT-20

redsteve SysML-v2-API-MCP-Server: C++, MIT, «WORK IN PROGRESS… by no means suitable for productive use». Dassault: MCP πάνω στο SysML v2 REST API, prototype demo (02-12-2025). Gaphor: core language-agnostic από την 3.0 (01-2025)· η πλήρης υποστήριξη SysML v2 είναι ανοιχτό issue (milestone 4.0).

**Για το GRAIL:** Κανένας τεκμηριωμένα ωριμότερος από το mcp-syson για ζωντανή on-prem εγγραφή (δεν ελέγχθηκε το Flexo MCP σε λειτουργία).

**Πηγές:** [redsteve/SysML-v2-API-MCP-Server, 2025](https://github.com/redsteve/SysML-v2-API-MCP-Server) · [SysML v2 MCP is Next Level Digital Engineering, 2025](https://3dswym.3dexperience.3ds.com/post/catia-mbse-cyber-systems/sysml-v2-mcp-is-next-level-digital-engineering_ZhL0f2H8TL-_b6m9fDkX9w) · [Gaphor: Full Support for SysML v2 (issue), 2026 (accessed)](https://github.com/gaphor/gaphor/issues/1399) · [Gaphor 3.0, 2025](https://gaphor.org/de/2025/01/26/gaphor-3.0/)

### Git signed commits/tags

*tool, production* · SOTA-PLT-21

commit -S, tag -s, log --show-signature, merge --verify-signatures, commit.gpgsign.

**Για το GRAIL:** Το σημερινό ισοδύναμο του «κάθε αλλαγή σχεδίου = υπογεγραμμένο γεγονός» (P5), χωρίς ledger.

**Πηγές:** [Git Tools - Signing Your Work, 2026 (accessed)](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work)
