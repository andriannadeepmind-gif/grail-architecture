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
