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
