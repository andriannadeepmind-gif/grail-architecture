# Συλλογική συνείδηση — πρόχειρο έναντι ανώτερου (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| IDs | Ετυμηγορία | Τι λέει το πρόχειρο | Τι αλλάζει και γιατί | Κατάταξη · βεβαιότητα | Πηγές |
|---|---|---|---|---|---|
| CMP-CCP-01, INV-K01, REQ-CCP-001 | **υπάρχει αυστηρά ανώτερο** | Evidence Commons = G-Set CRDT από evidence CIDs με attestations, anti-entropy sync, σύγκλιση μετά από partition (SEC). Η δηλητηριασμένη μαρτυρία αλλάζει κατάσταση (taint) χωρίς να διαγράφεται. | Ανώτερο: BEC / BFT-CRDT: hash-DAG υπογεγραμμένων updates (ID = hash, όπως ήδη τα CIDs, συν predecessor hashes), συμφιλίωση με ανταλλαγή heads αντί για version vectors, εγκυρότητα που κρίνεται μόνο στο causal past. Το taint γίνεται grow-only σύνολο taint-attestations με ντετερμινιστική παραγωγή της κατάστασης. Ανέχεται οσουσδήποτε Byzantine κόμβους. Κατά Kleppmann & Howard (2020), τέτοια Sybil-ανοσία υπάρχει αν και μόνο αν οι συναλλαγές είναι I-confluent· η προσθήκη μαρτυρίας είναι. Κρατά grow-only, content addressing και anti-entropy. Ρητό trade-off: update υπογεγραμμένο συγχρόνως με την ανάκληση (όχι αιτιακά μετά) δεν μπορεί να απορριφθεί με τρόπο που συγκλίνει. Γίνεται δεκτό και σημαίνεται, κάτι που αλλάζει το «απόρριψη υπογραφών μετά την ανάκληση» του KT-18 σε «σήμανση». Κόστος: αποθήκευση predecessor hashes.<br>Το SEC υποθέτει μη Byzantine replicas. Κατά Kleppmann (2022), τα περισσότερα υπάρχοντα CRDT δεν εγγυώνται συνέπεια με Byzantine κόμβους, και τα version vectors καταρρέουν όταν Byzantine κόμβος στέλνει δύο updates με ίδιο ID. Το πρόχειρο έχει ήδη content-addressed CIDs (ID = hash), άρα η επίθεση ίδιου ID εξουδετερώνεται για τα evidence items. Αφήνει όμως ακαθόριστα δύο πράγματα. (α) Τον μηχανισμό anti-entropy: με version vectors αποκλίνει. (β) Τον κανόνα εγκυρότητας: η αποδοχή εξαρτάται από attestation (ICD-18, INV-E04) και από υπογραφή με live delegation («ανάκληση αποτελεσματική από τον χρόνο της», ICD-03, INV-I04). Αυτή η κατάσταση δεν ανήκει κατ' ανάγκη στο causal past του item· κατά το §3.4 του BFT-CRDT είναι ο μηχανισμός απόκλισης, ακριβώς στο σενάριο OS-08/KT-04. Επιπλέον, η «αλλαγή κατάστασης taint» δεν είναι πράξη G-Set. | σήμερα · υψηλή | [Making CRDTs Byzantine Fault Tolerant, 2022](https://martin.kleppmann.com/papers/bft-crdt-papoc22.pdf) · [Byzantine Eventual Consistency and the Fundamental Limits of Peer-to-Peer Databases, 2020](https://arxiv.org/pdf/2012.00472) · [Conflict-free Replicated Data Types, 2011](https://www.lip6.fr/Marc.Shapiro/papers/2011/CRDTs_SSS-2011.pdf) |
| CMP-CCP-02, REQ-CCP-002 | ισχύει → **αλλάζει με** DEC-CCP-01, DEC-CCP-05 | Typed claims με supports/attacks/undercuts, structured argumentation κλάσης ASPIC+, grounded εξ ορισμού και preferred για εξερεύνηση (EXP-16). Claims ως ledger events, labels ως παράγωγα. | Είναι η κύρια γραμμή της έρευνας: Dung (1995), ASPIC+ (strict/defeasible rules, τρεις μορφές attack, preferences). Η grounded extension είναι μοναδική και σκεπτική, αφήνει τη διαφωνία undecided και ταιριάζει με τη διατήρηση του dissent.<br>Διόρθωση: τα ArgLLMs και το MArgE ΔΕΝ επιβεβαιώνουν ASPIC+/grounded· χρησιμοποιούν QBAF με gradual semantics (DF-QuAD). Στηρίζουν μόνο ότι τυπικός argument graph πάνω σε εξόδους πολλών LLM ξεπερνά το αδόμητο multi-LLM debate στο claim verification. Κάνουν επίσης τις gradual semantics υποψήφιο σκέλος του EXP-16. Δεν είναι αυστηρά ανώτερες, γιατί χάνουν τα διακριτά labels accept/reject/undecided.<br>Το ICCMA αφορά abstract AF και ABA· δεν βρέθηκε track για ASPIC+. Λείπουν interchange format (AIF) και burden of proof πάνω στον graph (GAP-CCP-09). Εσωτερικό σφάλμα: η αντιστοίχιση REQ-CCP-002 → INV-K05 (GAP-CCP-11). | σήμερα · μέση | [The ASPIC+ framework for structured argumentation: a tutorial (S2 record), 2014](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1080/19462166.2013.869766) · [ArgLLMs (arXiv HTML), 2024](https://arxiv.org/html/2405.02079) · [MArgE (arXiv HTML), 2025](https://arxiv.org/html/2508.02584) · [ICCMA 2025, 2025](https://www.argumentationcompetition.org/2025/index.html) |
| CMP-CCP-03, REQ-CCP-003, INV-K05 | ισχύει → **αλλάζει με** DEC-CCP-03 | Κανένα free-text write path προς trusted state: μόνο typed speech acts, που επικυρώνονται ως προς schema, υπογράφοντα, capability και κατάσταση διαλόγου. Commitment stores ως ledger events, attention budgets απέναντι σε πλημμύρα. | Ευθυγραμμίζεται με δύο προηγούμενα: τα persuasion dialogue systems (Prakken 2006: locutions, commitment stores, protocol, effect και termination rules) και τα Protocol Documents του Agora με hash (demo 100 agents, ~5× φθηνότερο από τη φυσική γλώσσα). Η γενεαλογία FIPA ACL ισχύει ως ιστορικό πρότυπο· η πρωτογενής πηγή όμως δεν είναι πλέον προσβάσιμη, και η σημασιολογία του επικρίθηκε (Pitt & Mamdani 1999· Wooldridge 2000).<br>Ο κανόνας είναι αναγκαίος αλλά όχι επαρκής. Τα claims παραμένουν φυσική γλώσσα μέσα σε typed πεδία. Το Prompt Infection δείχνει αυτο-αναπαραγόμενο LLM-to-LLM injection, και το Secret Collusion αξιολογεί steganographic συντονισμό. Η εγγύηση προκύπτει μόνο σε συνδυασμό με INV-C03 και INV-S01 (GAP-CCP-07).<br>Στοχευμένος έλεγχος για ανώτερη εναλλακτική: το CaMeL (2025) δεν αντικαθιστά το INV-K05, το ενισχύει στο επίπεδο εκτέλεσης. | σήμερα · υψηλή | [Formal systems for persuasion dialogue, 2006](https://webspace.science.uu.nl/~prakk101/pubs/dgreview.pdf) · [A Scalable Communication Protocol for Networks of LLMs (Agora), 2024](https://arxiv.org/html/2410.11905v1) · [Prompt Infection, 2024](https://arxiv.org/abs/2410.07283) · [Defeating Prompt Injections by Design (CaMeL), 2025](https://arxiv.org/abs/2503.18813) |
| ICD-13 | **κενό** | Speech acts ASSERT/QUERY/CHALLENGE/SUPPORT/CONCEDE/RETRACT/PROPOSE/COMMIT/APPEAL, EvidenceSync, ClaimQuery, StancePublish, TaskAnnounce/Bid/Award. Binding AsyncAPI + gRPC query. Invariants K01, K04, K05. | Το §15.1 απαιτεί, για κάθε ICD, operations με προϋποθέσεις, αποτελέσματα και idempotency, καθώς και Semantics/QoS (linearizable/causal/eventual, ordering). Η γραμμή του ICD-13 δίνει μόνο λίστα performatives και τρία invariants. Λείπουν:<br>- pre/post-conditions·<br>- σημασιολογία commitments, relevance και termination·<br>- consistency model ανά ομάδα λειτουργιών (evidence, claims, stances, verdict queries με cut, tasks).<br>Η §10, που θα τα όριζε, δεν γράφτηκε. Λείπει και προφίλ εξωτερικού ορίου. Το A2A 1.0.0 έχει Tasks, Parts, υπογεγραμμένα Agent Cards και extensions με URI, αλλά όχι commitments, voting ή dissent. | σήμερα · υψηλή | [BSPL (AAMAS 2011), 2011](https://www.cs.huji.ac.il/~jeff/aamas11/papers/A4_B57.pdf) · [Ahoy: LLMs Enacting Multiagent Interaction Protocols, 2026](https://arxiv.org/abs/2606.05390) · [A2A Protocol Specification, 2026](https://a2a-protocol.org/latest/specification/) · [Governance Gaps in Agent Interoperability Protocols, 2026](https://arxiv.org/abs/2606.31498) |
| CMP-CCP-04, REQ-CCP-004 | ισχύει → **αλλάζει με** DEC-CCP-02, DEC-CCP-06 | Append-only ευρετήριο verdicts, εφέσεων και standards ως προβολή πάνω σε verdict events. Οι αναγνώσεις φέρουν cut. Verdicts μόνο μέσω Court, μαζί με τις μειοψηφίες τους. | Κανένα υπαρκτό πρωτόκολλο δεν το ξεπερνά· voting και dissent preservation απουσιάζουν από MCP, A2A, ACP, ANP και ERC-8004. Το Habermas Machine δείχνει ότι η σύνθεση που ενσωματώνει τις διαφωνούσες φωνές είναι εφικτή και προτιμάται. Το Deliberative Illusion δείχνει ότι η συμφωνία μπορεί να αυξάνεται ενώ χάνονται γεγονότα, άρα η συναίνεση δεν είναι σήμα επιτυχίας· αυτό στηρίζει την υποχρεωτική διατήρηση του dissent. Η προβολή πάνω σε ledger με cut είναι δοκιμασμένη τεχνική. | σήμερα · υψηλή | [Governance Gaps in Agent Interoperability Protocols, 2026](https://arxiv.org/abs/2606.31498) · [AI can help humans find common ground (S2 record), 2024](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1126/science.adq2852) · [The Deliberative Illusion, 2026](https://arxiv.org/abs/2606.03032) |
| CMP-CCP-05, INV-K04, REQ-CCP-005 | ισχύει → **αλλάζει με** DEC-CCP-01, DEC-CCP-04, DEC-CCP-05, DEC-CCP-06 | Stance (accept/reject/suspend + βαθμός) ανά οντότητα, υπογεγραμμένη μόνο από την ιδιοκτήτρια. Πολιτική private/published, μετρικές απόκλισης. Η stance δεν είναι ψήφος. | Η ιδιοκτησία μέσω υπογραφής είναι σωστή, και ο διαχωρισμός stance/ψήφου συμφωνεί με τα ευρήματα ότι η πλειοψηφία δεν είναι διαδικασία αλήθειας. Υπάρχουν τρία κενά:<br>(α) Δεν προβλέπεται ανεξαρτησία πριν από την έκθεση. Strict conformity 29% στο κύριο setting, με 57–77% correct-to-wrong· μετάβαση φάσης σε biased consensus· wrong-but-sure cascades (GAP-CCP-05).<br>(β) Δεν ορίζεται μετρική απόκλισης. Σε ένα leaderboard dataset τα μοντέλα συμφωνούν 60% όταν σφάλλουν, και τα ακριβέστερα συσχετίζονται ισχυρά· οι απλές μετρήσεις παραπλανούν (GAP-CCP-06).<br>(γ) Οι ιδιωτικές stances μέσα σε γεω-αναπαραγόμενα ledgers χρειάζονται E2EE και capabilities (GAP-CCP-14). | σήμερα · μέση | [Not All Flips Are Conformity, 2026](https://arxiv.org/abs/2606.00820) · [Emergence of Biased Consensus in Multi-Agent LLM Debates, 2026](https://arxiv.org/abs/2608.02827) · [Correlated Errors in Large Language Models, 2025](https://arxiv.org/abs/2506.07962) · [Keyhive notebook, 2026](https://www.inkandswitch.com/keyhive/notebook/) |
| CMP-CCP-06, REQ-CCP-006 | ισχύει → **αλλάζει με** DEC-CCP-06 | Κοινές διτεμπορικές προβολές world model από evidence + verdicts. Παράγωγες, με rebuild + differential. Rust + RDF store. INV-E01, INV-E03. | Η αρχή «μόνο παράγωγες, rebuildable προβολές πάνω σε ledger» είναι σωστή και συνεπής με το ADR-0015. Τα blackboards είναι χώροι συντονισμού, όχι αλήθειας.<br>Στοχευμένος έλεγχος: το Graphiti/Zep (2025) είναι temporally-aware knowledge graph για agent memory, αλλά συνθέτει γεγονότα από αδόμητα δεδομένα μέσω LLM. Δεν είναι ανώτερο, γιατί χάνει την ιδιότητα «μόνο από evidence + verdicts» (INV-C03).<br>Ασάφεια του προχείρου: δεν λέει αν η προβολή περιέχει μόνο ADJUDICATED/ESTABLISHED ή και COMMITTED claims μεμονωμένων οντοτήτων. Το RDF store ανήκει στο EXP-05 (KNW) και δεν ελέγχθηκε εδώ. | σήμερα · μέση | [nanopub.net, accessed 2026](https://nanopub.net/) · [Zep: A Temporal Knowledge Graph Architecture for Agent Memory, 2025](https://arxiv.org/abs/2501.13956) · [Exploring Advanced LLM MAS Based on Blackboard Architecture, 2025](https://arxiv.org/abs/2507.01701) |
| CMP-CCP-07, REQ-CCP-007 | ισχύει | Coordination Market: ανάθεση μέσω contract-net, blackboard regions, ρόλοι, budgets, timeouts και ανακατανομή. Elixir, R-A, [T]. | Ο μηχανισμός είναι υλοποιήσιμος σήμερα και έχει πρόσφατα αντίστοιχα: blackboard (καλύτερη μέση απόδοση με λιγότερα tokens· 13%–57% σχετική βελτίωση στο data discovery), auction allocation (Agora 2026), SOP-driven (MetaGPT). Κανένα δεν κυριαρχεί. Η αξία εξαρτάται από τη δομή της εργασίας (από +80.8% έως −70.0%), και οι αρχιτεκτονικές χωρίς κεντρική επαλήθευση διαδίδουν περισσότερα σφάλματα. Άρα το [T] ισχύει για τον μηχανισμό, ενώ η ωφέλεια είναι [X]. Λείπουν επιλογή τοπολογίας ανά εργασία και σημείο επαλήθευσης (GAP-CCP-10). Η αντιστοίχιση σε INV-K05 και EXP-25 είναι αδύναμη (GAP-CCP-11). | πείραμα · μέση | [Towards a Science of Scaling Agent Systems, 2025](https://arxiv.org/abs/2512.08296) · [Why Do Multi-Agent LLM Systems Fail?, 2025](https://arxiv.org/abs/2503.13657) · [Agora: Auction-Based Task Allocation, 2026](https://arxiv.org/html/2607.09600v1) · [LLM-Based Multi-Agent Blackboard System, 2025](https://arxiv.org/abs/2510.01285) |
| REQ-CCP-008 | ισχύει → **αλλάζει με** DEC-CCP-02 | Η διάταξη verdicts μεταξύ sites αντέχει f Byzantine μέλη με n ≥ 3f+1 (ADV-02, KRN-01, ICD-14, INV-K06). | Η απαίτηση είναι σωστή. Η μοναδικότητα του τελικού verdict δεν είναι I-confluent (το BEC paper δίνει ως παράδειγμα το uniqueness constraint), άρα απαιτεί ordering/consensus. Το n = 3f+1 είναι το μοντέλο partial synchrony των BFT SMR (HotStuff-2: n = 3t+1). Τα Trust-BFT με trusted components χρειάζονται λιγότερα replicas, αλλά με τρεις τεκμηριωμένους περιορισμούς, άρα δεν είναι αυστηρά ανώτερα.<br>Ασυνέπεια: το DP-3 ορίζει «≥3 sites» και το §7.4 δείχνει ακριβώς 3 (A primary, B replica + witness, C witness + cold archive). Το §7.5 δεν ορίζει n ούτε πού τρέχουν οι κόμβοι διάταξης. Με 3 ανεξάρτητα failure domains, το f=1 σε επίπεδο site δεν ικανοποιείται (GAP-CCP-04). Το REQ δεν αναφέρει κανένα CCP component (λείπει το CMP-CCP-04) ούτε το ICD-13. | σήμερα · υψηλή | [Byzantine Eventual Consistency and the Fundamental Limits of P2P Databases, 2020](https://arxiv.org/pdf/2012.00472) · [HotStuff-2, 2023](https://eprint.iacr.org/2023/397) · [Dissecting BFT Consensus: In Trusted Components we Trust!, 2022](https://arxiv.org/abs/2202.01354) |
| ADR-0031 | **υπάρχει αυστηρά ανώτερο** | Byzantine tolerance: CRDT για τα μονότονα επίπεδα, BFT (HotStuff-family) μόνο για διατοπική διάταξη verdicts, witnesses + gossip (επέκταση του witness model του TRUST-BOOTSTRAP και του tlog). | Ανώτερο: Αντικατάσταση του «CRDT» με «BEC/BFT-CRDT (hash-DAG, εγκυρότητα στο causal past)». Κρατά coordination-free, μονοτονία και gossip, και προσθέτει σύγκλιση με οσουσδήποτε Byzantine κόμβους, με το trade-off ανάκλησης που δηλώνεται στο CMP-CCP-01. Το τμήμα BFT/witness παραπέμπεται σε απόφαση του δημιουργού.<br>Η διάκριση είναι ακριβώς αυτή που δικαιολογεί το θεώρημα I-confluence: μονότονα επίπεδα χωρίς consensus, μοναδικότητα verdict με consensus. Όμως το «CRDT» σκέτο δεν παρέχει τη Byzantine tolerance που δηλώνει ο τίτλος του ADR.<br>Για τη διάταξη, το «HotStuff-family» παραμένει έγκυρο. Οι DAG-BFT (Mysticeti, Autobahn) βελτιστοποιούν throughput που ο φόρτος verdicts δεν χρειάζεται. Και οι ώριμες υλοποιήσεις έχουν σφάλματα: CometBFT CSA-2026-001, Critical, στο BFT Time. Υπάρχει απλούστερη εναλλακτική, single-writer Court log με quorum witness cosignatures (C2SP): DEC-CCP-02. | σήμερα · υψηλή | [Making CRDTs Byzantine Fault Tolerant, 2022](https://martin.kleppmann.com/papers/bft-crdt-papoc22.pdf) · [Byzantine Eventual Consistency..., 2020](https://arxiv.org/pdf/2012.00472) · [CSA-2026-001: Tachyon, 2026](https://github.com/cometbft/cometbft/security/advisories/GHSA-c32p-wcqj-j677) · [C2SP tlog-cosignature, accessed 2026](https://c2sp.org/tlog-cosignature) |
| ADR-0007 | ισχύει → **αλλάζει με** DEC-CCP-03, DEC-CCP-05, DEC-CCP-06 | Collective = Epistemic Commons Protocol με 4 επίπεδα (evidence, claims, verdicts, stances), plurality doctrine, κανένα free-text path. | Κανένα υπαρκτό πρότυπο ή σύστημα δεν καλύπτει αυτή τη σύνθεση. Κάθε επίπεδο έχει ώριμο αντίστοιχο: nanopublications για assertion/provenance, ASPIC+ και AIF για τα claims, ατομική stance, verdict μόνο μέσω διαδικασίας.<br>Η υπόθεση αξίας όμως είναι εμπειρική. Το majority voting εξηγεί τα περισσότερα κέρδη του debate. Ο c-factor έχει αποτυχίες αναπαραγωγής (Bates & Gupta 2017· Credé & Howardson 2017) και διόρθωση το 2022, άρα δεν στηρίζει αξιόπιστα την plurality doctrine. Το ADR πρέπει να μείνει υπό όρο του EXP-02. Λείπει προαιρετικό επίπεδο σύνθεσης κοινού εδάφους (GAP-CCP-12). | σήμερα · μέση | [Governance Gaps in Agent Interoperability Protocols, 2026](https://arxiv.org/abs/2606.31498) · [Debate or Vote, 2025](https://arxiv.org/abs/2508.17536) · [Collective intelligence in teams (Frontiers), 2022](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2022.989572/full) |
| EXP-02 | **υπάρχει αυστηρά ανώτερο** | ECP έναντι καλύτερης μεμονωμένης οντότητας και free-chat multi-agent, με ίδιες εργασίες και ίσο compute. Αν ECP ≤ καλύτερης μεμονωμένης, το Collective περιορίζεται σε κοινή μαρτυρία. | Ανώτερο: Προκαταχωρισμένος σχεδιασμός που κρατά τις συγκρίσεις του προχείρου και προσθέτει:<br>1. majority vote/self-consistency και Self-MoA με ίσο compute·<br>2. στρωματοποίηση κατά δομή εργασίας (decomposable ή sequential)·<br>3. μέτρηση συσχέτισης σφαλμάτων και ετερογένειας·<br>4. μέτρηση επιβίωσης κρίσιμων γεγονότων και harmful conformity·<br>5. σκέλος argument graph κατά MArgE.<br>Κριτήριο θανάτωσης: ECP ≤ ισχυρότερης φθηνής baseline ensemble. Trade-off: περισσότερο compute αξιολόγησης.<br>Οι baselines του προχείρου είναι ακριβώς αυτές που η βιβλιογραφία 2025 δείχνει ανεπαρκείς:<br>- το majority voting εξηγεί τα περισσότερα κέρδη του MAD·<br>- το MAD συχνά δεν ξεπερνά CoT/Self-Consistency·<br>- το Self-MoA ξεπερνά το mixed MoA·<br>- το αποτέλεσμα κυμαίνεται από +80.8% έως −70.0% ανάλογα με τη δομή της εργασίας·<br>- τα σφάλματα των LLM συσχετίζονται.<br>Ένα θετικό EXP-02 χωρίς αυτές τις baselines δεν αποδεικνύει την αξία του ECP. | πείραμα · υψηλή | [Debate or Vote (NeurIPS 2025), 2025](https://arxiv.org/abs/2508.17536) · [Stop Overvaluing Multi-Agent Debate, 2025](https://arxiv.org/abs/2502.08788) · [Rethinking Mixture-of-Agents, 2025](https://arxiv.org/abs/2502.00674) · [Towards a Science of Scaling Agent Systems, 2025](https://arxiv.org/abs/2512.08296) · [Correlated Errors in LLMs, 2025](https://arxiv.org/abs/2506.07962) |
| KT-04 | ισχύει → **αλλάζει με** DEC-CCP-01, DEC-CCP-02 | Partition + Byzantine agents ⇒ κανένα αντιφατικό τελικό verdict, σύγκλιση evidence μετά την επανασύνδεση, ανίχνευση equivocation εντός ορίου, καραντίνα του Byzantine body. INV K01, K06, I04· EXP-12. | Τα κριτήρια είναι σωστά. Αντιστοιχούν σε BEC (σύγκλιση) και σε BFT ή quorum witnesses (non-equivocation), με τα υπογεγραμμένα αντιφατικά updates ως μεταβιβάσιμη απόδειξη για την καραντίνα. Χρειάζονται τρεις διορθώσεις:<br>(α) Η ανίχνευση equivocation είναι δυνατή μόνο αφού οι σωστοί κόμβοι επικοινωνήσουν· άρα το όριο μετριέται από την επανασύνδεση.<br>(β) Πρέπει να δηλωθεί ότι σε minority partition τα verdicts σταματούν (liveness) ενώ η safety διατηρείται.<br>(γ) Με την ελάχιστη τοπολογία του DP-3 (3 sites) το κριτήριο δεν ικανοποιείται για f ≥ 1 σε επίπεδο site (GAP-CCP-04).<br>Η επαλήθευση απαιτεί DST (EXP-12). | πείραμα · μέση | [Making CRDTs Byzantine Fault Tolerant, 2022](https://martin.kleppmann.com/papers/bft-crdt-papoc22.pdf) · [C2SP tlog-cosignature, accessed 2026](https://c2sp.org/tlog-cosignature) |
| KT-07 | **υπάρχει αυστηρά ανώτερο** | Απόκλιση evidence → 0 με συνδεσιμότητα· απόκλιση stances μετρημένη και διατηρημένη· κανένα verdict χωρίς διαδικασία. INV K01, K02, K03, K04· EXP-02. | Ανώτερο: Κριτήρια που κρατούν τα τρία του προχείρου και προσθέτουν:<br>1. 0 ανεξήγητες αλλαγές stance· κάθε αλλαγή ως typed CONCEDE/RETRACT με αναφορά σε νέο evidence ή argument·<br>2. επιβίωση issue-critical facts ≥ προκαθορισμένου ορίου (τύπου DelibTrace)·<br>3. harmful conformity μετρημένη έναντι σφραγισμένων ανεξάρτητων αρχικών stances.<br>Το «απόκλιση stances διατηρημένη» είναι αμφίσημο. Μπορεί να σημαίνει ότι οι αποκλίνουσες stances δεν συγχωνεύονται, ή ότι το επίπεδο απόκλισης πρέπει να παραμένει. Και στις δύο αναγνώσεις το κριτήριο δεν διακρίνει τη θεμιτή σύγκλιση λόγω μαρτυρίας από τη σύγκλιση λόγω conformity. Το Not All Flips δείχνει ότι η διάκριση απαιτεί αντιπαραδειγματικούς ελέγχους. Το Deliberative Illusion δείχνει ότι η συμφωνία μπορεί να αυξάνεται ενώ σβήνονται έως 72% των issue-critical facts. | πείραμα · μέση | [Not All Flips Are Conformity, 2026](https://arxiv.org/abs/2606.00820) · [The Deliberative Illusion, 2026](https://arxiv.org/abs/2606.03032) · [Free-MAD, 2025](https://arxiv.org/abs/2509.11035) |

## Κενά που δεν καλύπτει καθόλου το πρόχειρο

### GAP-CCP-01 — Η §10 (Collective) δεν γράφτηκε και οι αναφορές σε αυτήν κρέμονται

*σήμερα*

Το glossary (master γρ.280) και ο §9.1 (γρ.811, «ECP (§10)») παραπέμπουν στην §10, που δεν υπάρχει (Παράρτημα Ω). Λείπει προδιαγραφή πρωτοκόλλου διαλόγου: pre/post-conditions ανά speech act, σημασιολογία commitment store, κανόνες relevance, turn-taking και τερματισμού, σχέση του APPEAL με το ICD-14.

**Γιατί μετρά:** Χωρίς αυτά το INV-K05 δεν ελέγχεται, το VT-013 δεν έχει oracle και το CMP-CCP-03 δεν έχει τι να επικυρώσει πέρα από το schema.

**Τι δείχνει το ανώτερο:** Declarative information protocols (BSPL/Langshaw) με επαλήθευση safety/liveness, εκτελέσιμα από LLM agents (Ahoy), μαζί με τις locutions και τους κανόνες commitment/termination του Prakken.

**Πηγές:** [BSPL (AAMAS 2011), 2011](https://www.cs.huji.ac.il/~jeff/aamas11/papers/A4_B57.pdf) · [Ahoy, 2026](https://arxiv.org/abs/2606.05390) · [Formal systems for persuasion dialogue, 2006](https://webspace.science.uu.nl/~prakk101/pubs/dgreview.pdf)

### GAP-CCP-02 — Σημασιολογία αναπαραγωγής ορίζεται μόνο για evidence και verdicts

*σήμερα*

Ορίζονται μόνο το evidence (G-Set) και η διάταξη verdicts (BFT). Για claim graph (με retractions), stances (single-owner, private/published), taint status και task contracts δεν ορίζεται διατοπική σημασιολογία. Το ICD-13 δεν δίνει consistency model ανά ομάδα λειτουργιών, όπως απαιτεί το §15.1.

**Γιατί μετρά:** Τα claims και οι attack edges εξαρτώνται αιτιακά από άλλα claims. Χωρίς causal delivery και ντετερμινιστική εγκυρότητα, οι replicas αποκλίνουν όταν υπάρχουν Byzantine σώματα.

**Τι δείχνει το ανώτερο:** Κατάταξη κάθε λειτουργίας με το κριτήριο I-confluence: οι I-confluent πάνε σε BEC hash-DAG με causal delivery· οι μη I-confluent (μοναδικότητα verdict, αποκλειστική ανάθεση task) πάνε σε ordering/consensus.

**Πηγές:** [Byzantine Eventual Consistency..., 2020](https://arxiv.org/pdf/2012.00472) · [Verifying Strong Eventual Consistency in Distributed Systems, 2017](https://arxiv.org/abs/1707.01747)

### GAP-CCP-03 — Εγκυρότητα που εξαρτάται από κατάσταση εκτός causal past (revocation race)

*σήμερα*

Η αποδοχή evidence και speech acts εξαρτάται από attestation (INV-E04) και από live delegation/ανάκληση (INV-I04, ICD-03: «ανάκληση αποτελεσματική από τον χρόνο της»). Αν η ανάκληση δεν βρίσκεται στο causal past ενός update, οι σωστοί κόμβοι αποφασίζουν διαφορετικά για την εγκυρότητά του.

**Γιατί μετρά:** Μόνιμη απόκλιση του Evidence Commons ακριβώς στα OS-08, KT-04 και KT-18, όταν σώμα με παραβιασμένο κλειδί υπογράφει κατά τη διάρκεια partition.

**Τι δείχνει το ανώτερο:** Εγκυρότητα που κρίνεται αποκλειστικά στο causal past (Kleppmann 2022, §3.4). Η ανάκληση ισχύει για ένα update μόνο αν είναι αιτιακά προγενέστερη. Updates σύγχρονα με την ανάκληση γίνονται δεκτά και σημαίνονται (taint) μέσω νέων attestations· αυτό απαιτεί αναδιατύπωση του κριτηρίου του KT-18.

**Πηγές:** [Making CRDTs Byzantine Fault Tolerant (§3.4), 2022](https://martin.kleppmann.com/papers/bft-crdt-papoc22.pdf)

### GAP-CCP-04 — Η ελάχιστη τοπολογία του DP-3 δεν ικανοποιεί το n ≥ 3f+1 για f ≥ 1 σε επίπεδο site

*σήμερα*

Το DP-3 ορίζει «≥3 sites» και το §7.4 δείχνει ακριβώς 3 (A primary, B replica + witness, C witness + cold archive). Το §7.5 ζητά αντοχή f με n ≥ 3f+1, χωρίς να ορίζει n ή την τοποθέτηση των κόμβων διάταξης. Τα INV-K06, REQ-CCP-008 και KT-04 απαιτούν n ≥ 3f+1. Για f=1 χρειάζονται ≥4 κόμβοι διάταξης σε ανεξάρτητα failure domains/διαχειριστές· με 3 ανεξάρτητα sites το f σε επίπεδο site είναι 0.

**Γιατί μετρά:** Ένα Tier-0 invariant και ένα kill test είναι ανικανοποίητα στην ελάχιστη τοπολογία που το ίδιο το πρόχειρο σημαίνει [T].

**Τι δείχνει το ανώτερο:** Τρεις δρόμοι:<br>- ≥4 ανεξάρτητοι κόμβοι BFT (HotStuff-2-class)·<br>- Trust-BFT με trusted components (HSM/TEE), με λιγότερα replicas αλλά με τεκμηριωμένους περιορισμούς·<br>- αναδιατύπωση του INV-K06 ως «Verdict Non-Equivocation» με ρητό fault model, ικανοποιούμενη με single-writer log και quorum witness cosignatures (C2SP).

**Πηγές:** [HotStuff-2, 2023](https://eprint.iacr.org/2023/397) · [C2SP tlog-cosignature, accessed 2026](https://c2sp.org/tlog-cosignature) · [Dissecting BFT Consensus: In Trusted Components we Trust!, 2022](https://arxiv.org/abs/2202.01354)

### GAP-CCP-05 — Κανένας μηχανισμός κατά της conformity και του factual attrition

*πείραμα*

Το πρόχειρο έχει private/published stances, αλλά όχι:<br>- σφραγισμένη ανεξάρτητη stance πριν από την έκθεση στις stances άλλων·<br>- υποχρέωση κάθε αλλαγή stance να παραπέμπει σε νέο evidence ή argument·<br>- μέτρηση επιβίωσης κρίσιμων γεγονότων.

**Γιατί μετρά:** Σε LLM MAS:<br>- η strict conformity είναι 29% στο κύριο setting, με 57–77% correct-to-wrong·<br>- υπάρχει μετάβαση φάσης σε biased consensus·<br>- σβήνεται έως 72% των issue-critical facts ενώ η συμφωνία αυξάνεται.<br>Αυτό είναι το «χάος με συναίνεση» που το T3 αποκλείει.

**Τι δείχνει το ανώτερο:** Anti-conformity και απόφαση πάνω στην τροχιά (Free-MAD), αντιπαραδειγματική αποσύνθεση αλλαγών stance (Not All Flips), μέτρηση τύπου DelibTrace, ετερογένεια agents, προσοχή στη συνδεσιμότητα της τοπολογίας.

**Πηγές:** [Free-MAD, 2025](https://arxiv.org/abs/2509.11035) · [Not All Flips Are Conformity, 2026](https://arxiv.org/abs/2606.00820) · [The Deliberative Illusion, 2026](https://arxiv.org/abs/2606.03032) · [Conformity Dynamics in LLM MAS, 2026](https://arxiv.org/abs/2601.05606)

### GAP-CCP-06 — Η plurality doctrine δεν λογαριάζει τη συσχέτιση σφαλμάτων

*πείραμα*

Δεν μετριέται η πραγματική ποικιλία μεταξύ οντοτήτων ή organs. Πολλές σύμφωνες stances ή N-model agreement (ADR-0019, EXP-14) μπορεί να προέρχονται από το ίδιο υπόστρωμα.

**Γιατί μετρά:** Σε ένα leaderboard dataset τα LLM συμφωνούν 60% όταν σφάλλουν και τα δύο. Κοινή αρχιτεκτονική/πάροχος αυξάνει τη συσχέτιση, και τα ακριβέστερα μοντέλα συσχετίζονται ισχυρά. Η φαινομενική συναίνεση υπερεκτιμά τη βεβαιότητα, αντίθετα με το T6.

**Τι δείχνει το ανώτερο:** Εμπειρική μέτρηση συσχέτισης σφαλμάτων ανά ζεύγος organ/παρόχου σε σφραγισμένα σύνολα, πολιτική ετερογένειας, και μείωση βάρους για συσχετισμένους μάρτυρες στις παράγωγες όψεις.

**Πηγές:** [Correlated Errors in Large Language Models, 2025](https://arxiv.org/abs/2506.07962) · [Stop Overvaluing Multi-Agent Debate, 2025](https://arxiv.org/abs/2502.08788)

### GAP-CCP-07 — Injection και steganographic collusion μέσα από typed πεδία

*πείραμα*

Το INV-K05 κλείνει τα free-text write paths στο επίπεδο του envelope, αλλά το περιεχόμενο ενός claim παραμένει φυσική γλώσσα. Δεν προβλέπονται ανίχνευση συνωμοσίας μεταξύ οντοτήτων, provenance tagging στα LLM-to-LLM μηνύματα του ECP, ή διαχωρισμός control/data flow στους agents που επεξεργάζονται εισερχόμενα speech acts.

**Γιατί μετρά:** Το prompt infection αναπαράγεται από agent σε agent. Η steganography επιτρέπει κρυφό συντονισμό που δύσκολα ανιχνεύεται. Και τα δύο οδηγούν σε capture του Court (KT-19) μέσω συλλογικών stances.

**Τι δείχνει το ανώτερο:** Τέσσερα μέτρα σε στρώσεις:<br>- διαχωρισμός control/data flow με capabilities (CaMeL: provable security στο 77% των εργασιών AgentDojo)·<br>- LLM Tagging / provenance tags ως πρόσθετη στρώση·<br>- συνεχής αξιολόγηση steganographic ικανοτήτων·<br>- πάντα verifier-gated προαγωγή (INV-C03).

**Πηγές:** [Defeating Prompt Injections by Design (CaMeL), 2025](https://arxiv.org/abs/2503.18813) · [Prompt Infection, 2024](https://arxiv.org/abs/2410.07283) · [Secret Collusion among AI Agents, 2024](https://arxiv.org/abs/2402.07510) · [Multi-Agent Risks from Advanced AI, 2025](https://arxiv.org/abs/2502.14143)

### GAP-CCP-08 — Κανένα προφίλ εξωτερικής διαλειτουργικότητας (A2A/MCP/ANP)

*σήμερα*

Το ICD-13 είναι μόνο εσωτερικό (AsyncAPI + gRPC). Δεν ορίζεται πώς συμμετέχουν εξωτερικοί agents ή θεσμοί, ούτε πώς προβάλλεται το ECP στα βιομηχανικά πρωτόκολλα.

**Γιατί μετρά:** Το A2A 1.0.0 (LF project από τον Ιούνιο 2025, με >100 εταιρείες τότε) και το MCP (AAIF, spec 2026-07-28) είναι το de facto εξωτερικό όριο. Χωρίς προφίλ, κάθε ενσωμάτωση γίνεται ad hoc πάνω σε free text· δηλαδή μονοπάτι παράκαμψης του INV-K05.

**Τι δείχνει το ανώτερο:** Adapter A2A: πράξεις ECP ως data Parts κάτω από δηλωμένο extension URI, με υπογεγραμμένο Agent Card. Οι εξωτερικές οντότητες μπαίνουν ως OBSERVED/PROPOSED, ποτέ απευθείας trusted. Ταυτότητα μέσω DID (did:wba, ANP) όπου χρειάζεται. Επειδή το A2A δεν έχει commitments ή dissent, το ECP μένει overlay.

**Πηγές:** [A2A Protocol Specification, 2026](https://a2a-protocol.org/latest/specification/) · [Linux Foundation Launches the A2A Protocol Project, 2025](https://www.linuxfoundation.org/press/linux-foundation-launches-the-agent2agent-protocol-project-to-enable-secure-intelligent-communication-between-ai-agents) · [Governance Gaps in Agent Interoperability Protocols, 2026](https://arxiv.org/abs/2606.31498) · [Strabo, 2026](https://arxiv.org/abs/2606.05043)

### GAP-CCP-09 — Λείπουν interchange format επιχειρημάτων και burden of proof πάνω στον claim graph

*σήμερα*

Το CMP-CCP-02 δεν ορίζει μορφή ανταλλαγής argument graphs. Τα standards of proof αναφέρονται μόνο στο Court (CMP-CCP-04 «standards», glossary «Standard of proof»), όχι πάνω στον claim graph· το burden of proof δεν αναφέρεται καθόλου.

**Γιατί μετρά:** Χωρίς interchange format ο graph δεν μεταφέρεται σε solvers, εργαλεία ή εξωτερικούς αναλυτές, ούτε αντέχει αλλαγή engine (KT-03). Χωρίς κατανομή burden of proof, η κρίση μέσω grounded labelling είναι φτωχότερη από τη νομική πρακτική.

**Τι δείχνει το ανώτερο:** AIF (I-, RA-, CA- και PA-nodes) ως εξωτερική προβολή του graph. Κατανομή burden of proof μέσω κατηγοριοποίησης premises κατά Carneades, ως παράμετρος του ASPIC+ instantiation.

**Πηγές:** [Towards an argument interchange format (S2 record), 2006](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1017/S0269888906001044) · [The Carneades model of argument and burden of proof (S2 record), 2007](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1016/j.artint.2007.04.010)

### GAP-CCP-10 — Η τοπολογία συντονισμού δεν εξαρτάται από την εργασία· δεν χρησιμοποιείται failure taxonomy

*πείραμα*

Το CMP-CCP-07 προσφέρει έναν μηχανισμό (contract-net/blackboard) για κάθε εργασία, χωρίς επιλογή τοπολογίας και χωρίς υποχρεωτικό σημείο επαλήθευσης. Το MAST δεν χρησιμοποιείται ως fault model για DST ή σενάρια OS.

**Γιατί μετρά:** Το multi-agent κυμαίνεται από +80.8% σε decomposable εργασίες έως −70.0% σε sequential planning. Χωρίς κεντρική επαλήθευση τα σφάλματα διαδίδονται περισσότερο.

**Τι δείχνει το ανώτερο:** Επιλογή αρχιτεκτονικής ανά κλάση εργασίας με βάση το Scaling Agent Systems, υποχρεωτικός verifier checkpoint πριν από κάθε commit, και οι 14 failure modes του MAST ως κατάλογος σεναρίων σφάλματος.

**Πηγές:** [Towards a Science of Scaling Agent Systems, 2025](https://arxiv.org/abs/2512.08296) · [Why Do Multi-Agent LLM Systems Fail?, 2025](https://arxiv.org/abs/2503.13657)

### GAP-CCP-11 — Ασυνέπειες traceability στο §29.4 και στις απαριθμήσεις

*σήμερα*

Οι ασυνέπειες:<br>- REQ-CCP-002 και REQ-CCP-007 αντιστοιχίζονται στο INV-K05 (Typed Channel), που δεν εκφράζει «καλά ορισμένη σημασιολογία» ούτε «budgets/timeouts».<br>- Το REQ-CCP-007 δείχνει στο EXP-25 (κίνητρα Resource Economy, CMP-CIV-05), όχι σε πείραμα CCP.<br>- Το REQ-CCP-008 δεν έχει CCP component (λείπει το CMP-CCP-04) και αναφέρει μόνο το ICD-14, όχι το ICD-13.<br>- Γενικά: το spine-vocab δηλώνει «COMPONENTS (76)» αλλά απαριθμεί 75, και το master γρ.580 γράφει «17 εγκάρσια» ενώ απαριθμεί 16. Ο αριθμός 7 για το CCP είναι συνεπής.

**Γιατί μετρά:** Το VT-901 (orphan/traceability gate) θα περάσει με λάθος σχέσεις satisfy/verify, και η Φάση Β θα εισαγάγει στο SysON λάθη που φαίνονται σωστά.

**Τι δείχνει το ανώτερο:** Εσωτερικό ζήτημα, χωρίς εξωτερικό SOTA. Διόρθωση στη Δόση 1 της Φάσης Β: ένα invariant ανά ιδιότητα, και νέα IDs μόνο με έγκριση (ID-REQUESTS).

### GAP-CCP-12 — Λείπει μη αυθεντικό επίπεδο σύνθεσης κοινού εδάφους

*επέκταση*

Το ECP έχει stances και verdicts, αλλά καμία λειτουργία που να παράγει κοινές δηλώσεις με ευρεία αποδοχή από διαφορετικές οπτικές, διατηρώντας τη μειοψηφία.

**Γιατί μετρά:** Το T3 (συλλογική νοημοσύνη χωρίς απώλεια ατομικότητας) ωφελείται από σύνθεση που δεν είναι ψήφος. Χωρίς αυτήν μένουν μόνο τα άκρα: raw κατανομές ή Court.

**Τι δείχνει το ανώτερο:** Γεννήτρια τύπου Habermas Machine (ενσωματώνει διαφωνούσες φωνές) και bridging-based ranking (Community Notes), με έξοδο PROPOSED που δεν γίνεται ποτέ trusted χωρίς Court. Polis για χαρτογράφηση θέσεων.

**Πηγές:** [AI can help humans find common ground (S2 record), 2024](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1126/science.adq2852) · [Birdwatch: Crowd Wisdom and Bridging Algorithms, 2022](https://arxiv.org/abs/2210.15723)

### GAP-CCP-13 — Καμία συλλογική έξοδος με εγγύηση κάλυψης και κλιμάκωση

*πείραμα*

Δεν υπάρχει μηχανισμός που να μετατρέπει ένα σύνολο stances σε σύνολο πρόβλεψης με στατιστική εγγύηση, και σε Unknown ή κλιμάκωση όταν η αβεβαιότητα είναι υψηλή.

**Γιατί μετρά:** Το INV-C04 (Unknown ως απάντηση πρώτης τάξης) δεν έχει βαθμονομημένο συλλογικό σήμα· η λανθασμένη συναίνεση περνά ως βεβαιότητα.

**Τι δείχνει το ανώτερο:** Conformal social choice: linear opinion pool + split conformal, κάλυψη ≥1−α, κλιμάκωση όταν το σύνολο έχει >1 στοιχείο. Αναχαιτίζει 81.9% των λανθασμένων consensus σε α=0.05· το όφελος έρχεται από επιλογή, όχι από καλύτερη συλλογιστική, με κόστος στην αυτοματοποίηση.

**Πηγές:** [From Debate to Decision: Conformal Social Choice, 2026](https://arxiv.org/abs/2604.07667)

### GAP-CCP-14 — Εμπιστευτικότητα ιδιωτικών stances σε αναπαραγόμενα ledgers

*επέκταση*

Η πολιτική «private/published» δεν ορίζει κρυπτογράφηση ή έλεγχο πρόσβασης, ενώ τα ledgers και το CAS αναπαράγονται γεωγραφικά (DP-3).

**Γιατί μετρά:** Το INV-K04 εγγυάται την αυθεντικότητα της stance, όχι το απόρρητό της. Η διαρροή ιδιωτικών stances ακυρώνει την ανεξαρτησία (GAP-CCP-05) και μπορεί να παραβιάσει το INV-L03.

**Τι δείχνει το ανώτερο:** E2EE με capability-based εξουσιοδότηση και CRDT διαχείρισης ομάδας (Keyhive: convergent capabilities, BeeKEM, Sedimentree· pre-alpha). Ο συνδυασμός με BEC είναι ερευνητική κατεύθυνση (PaPoC 2025).

**Πηγές:** [Keyhive notebook, 2026](https://www.inkandswitch.com/keyhive/notebook/) · [Keynote: BEC and Local-First Access Control, 2025](https://martin.kleppmann.com/2025/03/31/papoc-keynote-byzantine.html)

## Δεν ξέρω

- Δεν ελέγχθηκαν τα contracts/schemas του προχείρου (speech-act, stance, verdict στο contracts/): είναι ανεπαλήθευτο πρόχειρο.
- Οι as-built έδρες του STAVROPOULOSLAWCORPUS (legal-dialectic.lisp, N-minds protocol, plurality doctrine, institution.lisp) είναι ανεπαλήθευτες από εδώ.
- Δεν βρέθηκε επαληθευμένη production βιβλιοθήκη BEC/hash-DAG reconciliation σε Rust ή Elixir.
- Η πρωτογενής προδιαγραφή FIPA (SC00037J) δεν είναι προσβάσιμη: το fipa.org σερβίρει άσχετο περιεχόμενο και το web.archive.org δεν είναι διαθέσιμο εδώ. Ο αριθμός των communicative acts και η σημασιολογία FP/RE δεν επαληθεύτηκαν.
- Το περιεχόμενο της διόρθωσης του Riedl et al. (PNAS 2022) δεν επαληθεύτηκε. Ο ισχυρισμός για AVE 44% → 19.6% αφαιρέθηκε.
- Η μαθηματική κριτική του Hong–Page (AMS Notices) δεν επαληθεύτηκε (HTTP 403) και αφαιρέθηκε.
- Δεν επαληθεύτηκαν τα venues των MetaGPT (ICLR 2024), Secret Collusion (NeurIPS 2024) και MAST (NeurIPS 2025).
- Δεν επαληθεύτηκε η ημερομηνία ενεργοποίησης του Mysticeti στο Sui mainnet. Η ανάρτηση της Sui (Απρίλιος 2024) είναι προαναγγελία.
- Δεν επαληθεύτηκαν η παραγωγική υιοθέτηση και η ημερομηνία του C2SP tlog-witness v1.0.0.
- Η σελίδα του CometBFT v0.40.0 δείχνει «27 Jul» χωρίς έτος. Το 2026 συνάγεται από τη σειρά patches μετά το CSA-2026-001 (v0.38.21, Ιαν. 2026).
- Δεν βρέθηκε καθιερωμένη μετρική απόκλισης stances για LLM MAS.
- Δεν ξέρω αν τα ευρήματα conformity μεταφέρονται σε agents περιορισμένους από typed speech acts και verifier-gated commit. Δεν βρέθηκε σχετική μελέτη.
- Δεν ξέρω αν το ECP υπερέχει σε νομικές εργασίες. Είναι αντικείμενο του EXP-02.
- Το budget web search εξαντλήθηκε (200/200). Οι στοχευμένοι έλεγχοι για τα holds έγιναν μόνο με WebFetch σε γνωστές πηγές (CaMeL, Graphiti/Zep, Trust-BFT). Μπορεί να έχουν διαφύγει άλλες εναλλακτικές.
- Δεν ελέγχθηκε η τρέχουσα κατάσταση των bitemporal βάσεων για το CMP-CCP-06. Ανήκει στο στρώμα KNW.

## Τι διόρθωσε ο ανεξάρτητος ελεγκτής

Πηγές που άνοιξε: 72 · δεν στέκονταν: 28 · διορθώσεις: 15

- **draft_points CMP-CCP-01 (superior):** Προστέθηκε ότι τα CIDs του προχείρου ήδη δίνουν ID = hash, ότι λείπουν η συμφιλίωση και ο κανόνας εγκυρότητας, και ρητό trade-off με το KT-18 (σήμανση αντί απόρριψης). — Κανόνας 3: δήλωση trade-off όταν αλλάζει ιδιότητα που απαιτεί το πρόχειρο.
- **draft_points CMP-CCP-02:** Τα ArgLLMs/MArgE δεν στηρίζουν πλέον ASPIC+/grounded· confidence από high σε medium· αφαιρέθηκαν οι ισχυρισμοί SAT και AIF+. — Οι πηγές δείχνουν QBAF + DF-QuAD· οι ισχυρισμοί SAT/AIF+ δεν επαληθεύτηκαν.
- **draft_points ICD-13:** Confidence από medium σε high. — Το κενό φαίνεται άμεσα στο κείμενο του προχείρου (§15.1 έναντι της γραμμής ICD-13).
- **draft_points REQ-CCP-008 και GAP-CCP-04:** Το «DP-3 έχει 3 sites» έγινε «ορίζει ≥3 και δείχνει 3· δεν ορίζει n»· προστέθηκε η εναλλακτική Trust-BFT. — Ακριβής απόδοση του §7.2/§7.4/§7.5 και εναλλακτική που έλειπε.
- **draft_points KT-07:** Το «κακώς ορισμένο» έγινε «αμφίσημο», με εξήγηση των δύο αναγνώσεων. — Το πρόχειρο επιδέχεται ανάγνωση «διατήρηση εγγραφής αποκλινουσών stances».
- **draft_points ADR-0007:** Αφαιρέθηκε η στήριξη στο Hong–Page· ο c-factor στηρίζεται σε Riedl 2021 και Janssens 2022. — Η πηγή AMS απέτυχε.
- **sota SOTA-CCP-03:** Αφαιρέθηκαν το «v1.x pre-release» και η ημερομηνία του Mysticeti· προστέθηκαν τα GHSA του CSA-2026-001 και η λίστα SOSP. — Λάθος ή ανεπαλήθευτοι ισχυρισμοί.
- **sota SOTA-CCP-05:** Αναδιατυπώθηκε σε dialogue systems + γενεαλογία FIPA· kind research / maturity research-prototype. — Η πρωτογενής FIPA είναι μη προσβάσιμη.
- **sota SOTA-CCP-07:** MCP spec 2026-07-28· A2A 8 καταστάσεις + UNSPECIFIED· ANP 1.1. — Τρέχουσα κατάσταση.
- **sota SOTA-CCP-13 και SOTA-CCP-14:** Διορθώθηκαν αριθμοί (29% / 57–77%· 60% σε ένα dataset· αφαιρέθηκε το ~33%). — Ακριβής απόδοση των περιλήψεων.
- **sota SOTA-CCP-16, SOTA-CCP-17, SOTA-CCP-18, SOTA-CCP-19, SOTA-CCP-20:** Αφαιρέθηκαν ανεπαλήθευτα στοιχεία (56%, venues, pub-sub, cascades, AVE, Hong–Page)· διορθώθηκε η περιγραφή του Keyhive. — Κανόνας 1.
- **sota (νέα):** Προστέθηκαν SOTA-CCP-21 (CaMeL) και SOTA-CCP-22 (Trust-BFT). — Στοχευμένοι έλεγχοι βρήκαν ισχυρότερη απάντηση για το GAP-CCP-07 και εναλλακτική για το DEC-CCP-02.
- **decisions DEC-CCP-02, DEC-CCP-03, DEC-CCP-04:** DEC-CCP-02: νέα εναλλακτική Trust-BFT και διορθωμένα cons του CometBFT. DEC-CCP-03: διορθωμένη εναλλακτική FIPA. DEC-CCP-04: ακριβής διατύπωση του vacuous reasoning. — Δίκαιη παρουσίαση των εναλλακτικών και ακρίβεια πηγών.
- **όλα τα πεδία:** Οι συντομογραφίες «CCP-0n» έγιναν CMP-CCP-0n· αφαιρέθηκαν ονόματα μοντέλων που εμφανίζονταν στις πηγές. — Κανόνες 5 και 7.
- **Έλεγχος 4 (ανάγνωση προχείρου):** Επιβεβαιώθηκαν όλα τα draft_ref και draft_position (master γρ.90, 107, 277, 280, 367, 513–519, 580, 609, 642–647, 671, 770, 811· 15.md γρ.43–44· 29.md γρ.68–75· 24.md γρ.19, 22· 26.md γρ.29· 22.md γρ.13, 37). Επιβεβαιώθηκαν επίσης το 75 έναντι 76 και το 16 έναντι 17 εγκάρσιων. — Επαλήθευση απόδοσης.
