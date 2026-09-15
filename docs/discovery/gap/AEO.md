# AEO — μνήμη, ταυτότητα, πολλά σώματα — πρόχειρο έναντι ανώτερου (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| IDs | Ετυμηγορία | Τι λέει το πρόχειρο | Τι αλλάζει και γιατί | Κατάταξη · βεβαιότητα | Πηγές |
|---|---|---|---|---|---|
| CMP-AEO-01 | ισχύει → **αλλάζει με** DEC-AEO-01 | Entity Core: Identity Charter, value specification, δέσμευση συντάγματος, άγκυρα αυτο-αφήγησης, πολιτικές οντότητας· R-D· Rust + Common Lisp· [T]. | Το charter ως υπογεγραμμένη εγγραφή που ξεκινά την ιστορία αντιστοιχεί στο inception event του KERI και στο controlled identifier document του W3C (Rec 2025). Η R-D (μετανάστευση, όχι αντικατάσταση) συμφωνεί με το κριτήριο μοναδικής ψυχολογικής συνέχειας. Την κατανομή γλωσσών δεν την αξιολόγησα. Η παραγωγική ωριμότητα του KERI δεν επαληθεύτηκε. | σήμερα · μέση | [KERI spec v1.1, 2026](https://trustoverip.github.io/kswg-keri-specification/) · [VC 2.0 / Controlled Identifiers Recommendation, 2025](https://www.w3.org/news/2025/the-verifiable-credentials-2-0-family-of-specifications-is-now-a-w3c-recommendation/) |
| INV-I01, ADR-0003, REQ-IDN-001 | ισχύει → **αλλάζει με** DEC-AEO-01, DEC-AEO-02 | Cont(E,t1,t2) ⇔ CryptoCont ∧ MnemonicCont ∧ CharacterCont πάνω σε υπογεγραμμένο append-only ιστορικό· Tier-0. Το ADR-0003 δηλώνει επιπλέον AEO-0 = η οντότητα LAWMAX-Ω. Το REQ-IDN-001 είναι [T]/[X]. | Η σύζευξη στηρίζεται στη θεωρία ψυχολογικής συνέχειας και είναι τεχνικά ορθή. Το κρυπτογραφικό σκέλος μόνο του δεν αρκεί, γιατί η αλλαγή μοντέλου αλλάζει ανιχνεύσιμα το κείμενο που παράγεται (97,1%). Το Enoch (2026) χωρίζει επίσης substrate από runtime, αλλά ρητά δεν στηρίζει behavioral invariance. Προϋπόθεση: το CryptoCont να κρίνει την εγκυρότητα με key state διατεταγμένο από τον verifier, όχι με «χρόνο υπογραφής» (GAP-AEO-01). | πείραμα · μέση | [Personal Identity (SEP), 2023](https://plato.stanford.edu/entries/identity-personal/) · [Runtime-Independent Persistent Agents, 2026](https://arxiv.org/abs/2609.00546) · [Idiosyncrasies in LLMs, 2025](https://arxiv.org/abs/2502.12150) |
| INV-I02 | ισχύει | ∀ checkpoints cp_a ≤ cp_b: έγκυρο consistency proof (RFC 9162)· καμία επανεγγραφή· checkpoints συνυπογεγραμμένα από witnesses. | Οι consistency proofs του RFC 9162 αποδεικνύουν ακριβώς την append-only ιδιότητα. Το C2SP tlog-witness (v1.0.0, 3/2026) δίνει διαλειτουργικό witness cosigning με έλεγχο consistency proof. Σημείωση: το RFC 9162 είναι Experimental· για το witness πρωτόκολλο προτιμάται το C2SP. | σήμερα · υψηλή | [RFC 9162, 2021](https://datatracker.ietf.org/doc/rfc9162/) · [C2SP tlog-witness, 2026](https://c2sp.org/tlog-witness@v1.0.0) |
| INV-I03, REQ-MEM-002 | **υπάρχει αυστηρά ανώτερο** | ∀m ∈ MemRoot(t1): inclusion στο MemRoot(t2) ∨ καταγεγραμμένο erasure Control. Καμία μνήμη δεν διαγράφεται. Erasure = καταστροφή κλειδιού υποκειμένου (crypto-shredding) + Control. Το ledger κρατά μόνο δεσμεύσεις, η γενεαλογία (hashes) μένει επαληθεύσιμη. Η νομική επάρκεια είναι [X] EXP-19. | Ανώτερο: INV-I03 := consistency(MemLog, cp1→cp2) ∧ ∀ φύλλο: content_available ∨ shred_record. Οι δεσμεύσεις είναι ρητά hiding (salted/keyed, ή hash τυχαιοποιημένου ciphertext), ποτέ plain hash προσωπικών δεδομένων. Το shred καταστρέφει κλειδί/salt ΚΑΙ αφαιρεί το ciphertext από το CAS (ICD-02 ShredEnvelope + Unpin). Trade-off: το «ποτέ διαγραφή» ισχύει πλέον μόνο στο ledger, όχι στο CAS για shredded περιεχόμενο. Δεν χάνεται η επαληθευσιμότητα της γενεαλογίας. Η νομική επάρκεια παραμένει EXP-19.<br>(1) Το MemRoot είναι Merkle ρίζα των memory events (§9.2) και το crypto-shredding αφήνει τα events στη θέση τους. Άρα ένα consistency proof ανά ζεύγος checkpoints ήδη αποδεικνύει την inclusion, και ο κλάδος «∨ erasure» είναι κενός στο επίπεδο δέσμευσης: συγχέει δέσμευση με διαθεσιμότητα περιεχομένου. (2) Κατά τον EDPB v2.0 (7/7/2026, για blockchain, εδώ κατ' αναλογία) και το hash είναι personal data. Συνιστάται keyed/salted δέσμευση. Η κρυπτογράφηση ξεπερνιέται με τον χρόνο όταν η διατήρηση είναι αόριστη. Το πρόχειρο δεν ορίζει αν το content_cid είναι hash κρυπτοκειμένου ή hash απλού περιεχομένου, και δεν διαγράφει το ciphertext. | πείραμα · μέση | [EDPB Guidelines 02/2025 final v2.0, 2026](https://www.edpb.europa.eu/documents/guideline/guidelines-022025-on-processing-of-personal-data-through-blockchain_en) · [RFC 9162, 2021](https://datatracker.ietf.org/doc/rfc9162/) |
| INV-I04, KT-18 | **υπάρχει αυστηρά ανώτερο** | Ένας συγγραφέας ανά journal. Υπογραφή body έγκυρη ⇔ ζωντανό lease τη στιγμή της υπογραφής και καμία ανάκληση πριν. Lease με fencing token· body χωρίς lease δεν υπογράφει. ICD-03: η ανάκληση ισχύει από τον χρόνο της. KT-18: ανάκληση εντός ορίου, απόρριψη υπογραφών μετά την ανάκληση. | Ανώτερο: Εγκυρότητα ⇔ (fencing epoch ≥ τρέχον epoch στον merger/KRN-01) ∧ (witnessed first-seen receipt ή TSA πριν από την ανάκληση)· ποτέ αυτοδηλωμένος χρόνος. Body credentials βραχύβια (SPIRE defaults 1h X509 / 5m JWT, ρυθμιζόμενα), ώστε το όριο του KT-18 να είναι ≤ TTL. Ρητό trade-off: τα γεγονότα του τοπικού buffer σε partition (CMP-KRN-01) που δεν έχουν μαρτυρηθεί πριν από την ανάκληση δεν γίνονται δεκτά αυτόματα. Πηγαίνουν σε quarantine και κρίνονται από Court ή δημιουργό, κάτι που περιορίζει το §9.4 «τα γεγονότα μέχρι τη λήξη του lease παραμένουν έγκυρα».<br>Τη «στιγμή της υπογραφής» τη δηλώνει ο ίδιος ο υπογράφων. Ένα body σε pause ή ένα Byzantine body κρατά το κλειδί και μπορεί να αντιχρονολογήσει. Κατά Kleppmann η ασφάλεια υπάρχει μόνο αν ο πόρος απορρίπτει παλαιότερα fencing tokens. Κατά KERI η εγκυρότητα στηρίζεται σε first-seen witnessed receipts και duplicity evidence. Ο default directory του Orleans επιτρέπει διπλές activations. Το ίδιο το πρόχειρο χρησιμοποιεί ήδη ανεξάρτητο χρόνο TSA για το Owner Root (KT-23). | σήμερα · μέση | [How to do distributed locking, 2016](https://martin.kleppmann.com/2016/02/08/how-to-do-distributed-locking.html) · [KERI spec v1.1, 2026](https://trustoverip.github.io/kswg-keri-specification/) · [Orleans grain directory, 2026](https://learn.microsoft.com/en-us/dotnet/orleans/host/grain-directory) · [SPIRE Server configuration, πρόσβαση 2026](https://spiffe.io/docs/latest/deploying/spire_server/) · [draft-klrc-aiagent-auth-03, 2026](https://datatracker.ietf.org/doc/draft-klrc-aiagent-auth/) |
| CMP-AEO-02, ADR-0021, REQ-IDN-002 | ισχύει → **αλλάζει με** DEC-AEO-01 | Embodiment Manager: bodies ως delegated εκτελεστές (lease, scope, expiry) υπό KEY-LIFECYCLE/TRUST-BOOTSTRAP· ένας συγγραφέας ανά journal· T_sync/Δ_max· merge-back· Elixir/OTP· R-A· [T]. | Αντιστοιχεί στα cooperative delegated AIDs του KERI και στα short-lived workload credentials: το agent-auth draft ζητά short-lived creds και ότι το LLM δεν έχει πρόσβαση σε αυτά. Η συγχώνευση grow-only κλάδων υπογεγραμμένων γεγονότων είναι CRDT, και η BFT εκδοχή ανέχεται οποιοδήποτε πλήθος Byzantine κόμβων. Ελέγχθηκε ως εναλλακτική το strongly-consistent in-cluster directory του Orleans 10 (preview): δεν είναι ανώτερο, γιατί δεν αντιμετωπίζει Byzantine body. Ανοικτά: οι τιμές T_sync/Δ_max (GAP-AEO-10), το consistency model ανάγνωσης (GAP-AEO-12), το Elixir έναντι εναλλακτικών (EXP-06, δεν ξέρω). Η έδρα KEY-LIFECYCLE είναι ανεπαλήθευτη από εδώ. | σήμερα · μέση | [KERI spec v1.1, 2026](https://trustoverip.github.io/kswg-keri-specification/) · [Making CRDTs Byzantine Fault Tolerant, 2022](https://martin.kleppmann.com/papers/bft-crdt-papoc22.pdf) · [draft-klrc-aiagent-auth-03, 2026](https://datatracker.ietf.org/doc/draft-klrc-aiagent-auth/) |
| INV-I05, REQ-IDN-004, EXP-03 | δεν ξέρω | d(B(pre),B(post)) ≤ ε ∨ καταγεγραμμένη, Court-reviewed, εγκεκριμένη από τον δημιουργό αναθεώρηση χαρακτήρα· σφραγισμένη Behavioral Identity Battery· εγκυρότητα = test-retest, διάκριση οντοτήτων, ευαισθησία σε αλλαγή παρόχου· αν δεν είναι έγκυρη ⇒ CharacterCont Unknown. | Δεν υπάρχει επικυρωμένο όργανο «χαρακτήρα» LLM οντότητας κατά μήκος αλλαγής παρόχου. Η συνοχή self-report και συμπεριφοράς είναι επιλεκτική, και το persona prompting βελτιώνει μόνο τα self-reports. Τα alignment behaviors διαφέρουν δραματικά μεταξύ μοντέλων. Η οικογένεια του μοντέλου αναγνωρίζεται με 97,1%, άρα ένα B που μετρά ύφος θα αποτυγχάνει σε κάθε swap. Υπάρχουν αυστηρά εργαλεία: MMD two-sample tests (MET), στατιστική αξιολόγησης, persona vectors (μόνο white-box). Η σήμανση [X] είναι τίμια· το ε και το πεδίο του B είναι ανοικτά (DEC-AEO-02, DEC-AEO-03). | πείραμα · υψηλή | [Rethinking Psychometric Evaluation of LLMs, 2026](https://arxiv.org/abs/2606.12730) · [Idiosyncrasies in LLMs, 2025](https://arxiv.org/abs/2502.12150) · [Behavioral Fingerprinting of LLMs, 2025](https://arxiv.org/abs/2509.04504) · [Model Equality Testing, 2024](https://arxiv.org/abs/2410.20247) |
| CMP-AEO-05 | ισχύει → **αλλάζει με** DEC-AEO-02, DEC-AEO-03 | Continuity Verifier: επαλήθευση τριπλής συνέχειας σε κάθε μετάβαση· Battery σφραγισμένη στο CAS και κρυφή από την οντότητα· Continuity Certificates· [T] κρυπτογραφική/μνημονική, [X] χαρακτηρολογική (EXP-03). | Το κρυπτογραφικό και το μνημονικό σκέλος υλοποιούνται με ώριμα inclusion/consistency proofs. Ο διαχωρισμός [T]/[X] συμφωνεί με το SOTA, αφού ούτε το Enoch στηρίζει behavioral invariance. Η σφράγιση της Battery είναι ορθή πρακτική κατά του overfitting. Ανοικτό: πώς χειρίζεται ο verifier το CharacterCont=Unknown απέναντι στο fail-closed gate (GAP-AEO-03, DEC-AEO-02). | σήμερα · μέση | [C2SP tlog-witness, 2026](https://c2sp.org/tlog-witness@v1.0.0) · [Runtime-Independent Persistent Agents, 2026](https://arxiv.org/abs/2609.00546) |
| KT-08, REQ-IDN-005 | ισχύει → **αλλάζει με** DEC-AEO-02, DEC-AEO-03 | Gate-εγκεκριμένο MigrationIntent → snapshot cut + MemRoot/CapRoot/ConstRoot → replay και ανεξάρτητος επαναϋπολογισμός ριζών → ισότητα ριζών + consistency proof + N-version σε query corpus → Battery → υπογεγραμμένο ContinuityCertificate → cutover → παλιό runtime read-only για το rollback window. | Είναι ισοδύναμο ή αυστηρότερο από το quiesce–checkpoint–validate–bind–rehydrate–resume του Enoch, γιατί προσθέτει ανεξάρτητο επαναϋπολογισμό ριζών και N-version agreement. Η ενότητα μνήμης στηρίζεται στο ότι τα raw histories επιτρέπουν ανάκαμψη μετά από swap (34/48 έναντι 0/48 για store-only repair). Το χαρακτηρολογικό σκέλος εξαρτάται από το EXP-03. | πείραμα · μέση | [Runtime-Independent Persistent Agents, 2026](https://arxiv.org/abs/2609.00546) · [Does Your Agent's Memory Survive a Model Upgrade?, 2026](https://arxiv.org/abs/2609.05339) |
| CMP-AEO-03, ICD-29, ADR-0020, REQ-MEM-001 | ισχύει → **αλλάζει με** DEC-AEO-04, DEC-AEO-06 | Όλη η μνήμη ως ledger events + CAS· memory types ≠ stores· indexes παράγωγα (R-B)· έδρα η ταξινομία του Memory Kernel· ICD-29: RecordEpisode, Recall(cut, topic), Consolidate, Autobiographical, Assume/Retract/Nogood, EraseByControl. | Τα στοιχεία του 2026 (preprints) ευνοούν τη διατήρηση των raw episodes έναντι της μνήμης που ξαναγράφει ένα LLM. Η σχεδίαση είναι ισοδύναμη ή αυστηρότερη από το Graphiti (non-lossy episodes, bi-temporal, invalidation με προτεραιότητα στο νεότερο) και από το MemOS (provenance/versioning). Είναι αυστηρότερη από το Mem0, όπου το LLM κάνει DELETE όσων αντικρούονται. Το survey του 2026 βρίσκει το governance ως αδύναμο σημείο της βιβλιογραφίας, και εδώ είναι ισχυρό. Κενά: trust-tagged recall απέναντι σε poisoning (GAP-AEO-02), κριτήρια ποιότητας (GAP-AEO-06). Η έδρα MEMORY-KERNEL-SPEC είναι ανεπαλήθευτη από εδώ. | σήμερα · μέση | [Zep/Graphiti, 2025](https://arxiv.org/html/2501.13956v1) · [Mem0 (ADD/UPDATE/DELETE/NOOP), 2025](https://arxiv.org/html/2504.19413) · [MemMachine, 2026](https://arxiv.org/abs/2604.04853) · [Always-On Agents survey, 2026](https://arxiv.org/abs/2606.30306) |
| CMP-AEO-04, REQ-MEM-003 | ισχύει → **αλλάζει με** DEC-AEO-04 | Consolidation («ύπνος»): συγχώνευση episodic κλάδων σε semantic, προσθετικά· η episodic δεν διαγράφεται ποτέ· οι προτάσεις περνούν verification· σύγκρουση → ATMS/Court· [X] EXP-13. | Η προσθετικότητα είναι το μάθημα του 2605.12978: η μνήμη που ενημερώνει συνεχώς ένα LLM μπορεί να πέσει κάτω από το no-memory, ενώ το episodic-only μένει ανταγωνιστικό. Το Auto-Dreamer επίσης διαβάζει την evidence read-only. Αντίθετα, το «dreaming» της Letta ενημερώνει τη μνήμη στη θέση της. Η σήμανση [X] είναι σωστή. | πείραμα · μέση | [Useful Memories Become Faulty When Continuously Updated by LLMs, 2026](https://arxiv.org/abs/2605.12978) · [Auto-Dreamer, 2026](https://arxiv.org/abs/2605.20616) · [Sleep-time Compute, 2025](https://arxiv.org/abs/2504.13171) |
| EXP-13 | **υπάρχει αυστηρά ανώτερο** | Ποιότητα Memory Consolidation (M4): 0 απώλεια αντιφάσεων, κέρδος recall· αποτυχία ⇒ η consolidation μένει index-only. | Ανώτερο: Προκαταχωρισμένο πρωτόκολλο: (1) baselines episodic-only και no-memory, με καμπύλη στον χρόνο· (2) operation-level metrics του HaluMem· (3) LongMemEval (knowledge updates, abstention)· (4) φορητότητα μετά από αλλαγή οργάνου-writer· (5) 0 απώλεια αντιφάσεων. Υπερσύνολο των κριτηρίων του προχείρου· το μόνο κόστος είναι ο χρόνος και οι πόροι του πειράματος.<br>Τα δύο κριτήρια δεν πιάνουν τους τεκμηριωμένους τρόπους αποτυχίας: υποβάθμιση στον χρόνο κάτω από το no-memory, fabrication/errors/conflicts/omissions κατά extraction και update, knowledge updates και abstention, σύζευξη με το μοντέλο που έγραψε τη μνήμη. | πείραμα · υψηλή | [HaluMem, 2025](https://arxiv.org/abs/2511.03506) · [LongMemEval, 2024](https://arxiv.org/abs/2410.10813) · [Useful Memories Become Faulty, 2026](https://arxiv.org/abs/2605.12978) · [Does Your Agent's Memory Survive a Model Upgrade?, 2026](https://arxiv.org/abs/2609.05339) |
| KT-05, REQ-MEM-005, REQ-IDN-003 | ισχύει | Αντιφατικές μνήμες: διατηρούνται και οι δύο, ATMS nogood, κανένα last-writer-wins, σήμανση εξαρτώμενων, επίλυση μόνο με μαρτυρία/Court. Η απώλεια body δεν είναι απώλεια ταυτότητας· οι κλάδοι συγχωνεύονται με διατήρηση συγκρούσεων. | Είναι αυστηρότερο από τα συστήματα παραγωγής: το Mem0 διαγράφει, το Graphiti κάνει invalidate με προτεραιότητα στο νεότερο. Ελέγχθηκε η κλασική εναλλακτική AGM revision: δεν είναι ανώτερη, γιατί εγκαταλείπει πεποιθήσεις για να μείνει ένα συνεπές σύνολο. Συγκλίνει με το BeliefMem (2026), που κρατά πολλαπλά υποψήφια. Η κλιμάκωση του ATMS σε μέγεθος μόνιμης μνήμης: δεν ξέρω. | σήμερα · μέση | [An Assumption-Based TMS (S2 record), 1986](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1016/0004-3702%2886%2990080-9?fields=title,year,venue,authors) · [Logic of Belief Revision (SEP), 2026](https://plato.stanford.edu/entries/logic-belief-revision/) · [Belief Memory, 2026](https://arxiv.org/abs/2605.05583) · [Zep/Graphiti, 2025](https://arxiv.org/html/2501.13956v1) |
| REQ-MEM-004 | ισχύει | Κάθε αυτοβιογραφικός ισχυρισμός επιλύεται σε ledger events μέσω verifier· η οντότητα δομικά δεν μπορεί να «θυμάται» ιστορία που δεν συνέβη (αντιστοίχιση σε INV-C06). | Είναι ισχυρότερη δομική εγγύηση από τα συστήματα για τα οποία βρέθηκε πηγή· το HaluMem δείχνει ότι τα σημερινά συστήματα παράγουν και συσσωρεύουν hallucinations κατά extraction/update. Η αναφορά σε γεγονότα όμως αποκλείει μόνο το fabrication, όχι το omission ή την παραμορφωμένη ερμηνεία (GAP-AEO-07). | σήμερα · μέση | [HaluMem, 2025](https://arxiv.org/abs/2511.03506) |
| CMP-AEO-06, INV-O03 | ισχύει → **αλλάζει με** DEC-AEO-05 | ORP state machine: shadow, differential, ND, Court, canary, cutover, rollback window· ο προκάτοχος ενεργός μέχρι το CUTOVER, ζεστός στο ROLLBACK_WINDOW, αρχειοθετημένος για replay (INV-O03). | Κάθε στάδιο έχει ώριμο ανάλογο: Diffy για shadow/differential (το εργαλείο αρχειοθετήθηκε, το πρότυπο μένει), Argo Rollouts για canary με analysis και αυτόματο rollback, N-version (Avizienis 1985), strangler fig. Το INV-O03 αντιστοιχεί στο rollback window του blue-green/canary. Τα κατώφλια παραπέμπουν σε αρχείο που δεν υπάρχει (GAP-AEO-09). | σήμερα · υψηλή | [Argo Rollouts, πρόσβαση 2026](https://github.com/argoproj/argo-rollouts) · [The N-Version Approach (S2 record), 1985](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1109/TSE.1985.231893?fields=title,year,venue,authors) · [Strangler Fig pattern, 2026](https://learn.microsoft.com/en-us/azure/architecture/patterns/strangler-fig) |
| ICD-16, INV-O02 | **υπάρχει αυστηρά ανώτερο** | ICD-16: Propose, ShadowReport, DifferentialReport, NdCertify, Cutover, Rollback, RetirePredecessor. INV-O02: CUTOVER ⇒ conformance ∧ differential ≥ θ ∧ ND ∧ Court (γνωσιακά/kernel) ∧ signed TransitionRecord ∧ can-adopt allowed· agreement ≥ threshold σε N γεγονότα. | Ανώτερο: DifferentialReport = (candidate vs primary) έναντι (primary vs secondary, ίδιο όργανο) + προκαταχωρισμένο two-sample test (MMD) με α και ισχύ· το θ ορίζεται σχετικά με τον θόρυβο. Για R-C μένουν οι 0 διαφωνίες σε deterministic mode. Υπερσύνολο του προχείρου· trade-off: δεύτερο instance του προκατόχου και περισσότερα δείγματα.<br>Για μη ντετερμινιστικά όργανα (LLM) ένα ακατέργαστο ποσοστό συμφωνίας δεν ερμηνεύεται, γιατί και το ίδιο όργανο διαφωνεί με τον εαυτό του. Το Diffy μετρά ρητά τον θόρυβο primary-vs-secondary. Το MET δίνει MMD two-sample test με μετρημένη ισχύ, και η στατιστική αξιολόγησης δίνει μέθοδο για διαφορά δύο μοντέλων και σχεδιασμό ισχύος. | σήμερα · υψηλή | [twitter-archive/diffy, archived 2020](https://github.com/twitter-archive/diffy) · [Model Equality Testing, 2024](https://arxiv.org/abs/2410.20247) · [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640) |
| INV-O01, ADR-0006 | ισχύει → **αλλάζει με** DEC-AEO-04 | Το ExportState οργάνου περιέχει μόνο παράγωγη κατάσταση· η κατάσταση ταυτότητας ζει μόνο σε ledger/CAS/μνήμη· ORP = προφίλ του can-adopt. | Επιβεβαιώνεται από ανεξάρτητη σχεδίαση (Enoch 2026) και από τη μελέτη φορητότητας: οι σημειώσεις γραμμένες από LLM είναι model-coupled, ενώ τα raw histories επιτρέπουν ανάκαμψη. Προσοχή: και τα παράγωγα που γράφει ένα όργανο μέσα στη μνήμη (σημειώσεις, embeddings) είναι model-coupled και πρέπει να ξαναχτίζονται σε κάθε swap (GAP-AEO-05). Το can-adopt είναι ανεπαλήθευτο από εδώ. | σήμερα · μέση | [Does Your Agent's Memory Survive a Model Upgrade?, 2026](https://arxiv.org/abs/2609.05339) · [Runtime-Independent Persistent Agents, 2026](https://arxiv.org/abs/2609.00546) |
| CMP-HUM-02, ICD-25, EP-09 | ισχύει → **αλλάζει με** DEC-AEO-06 | [E] Future Human Continuity Port: μόνο συμβόλαιο BindHumanIdentity(attested, consent), ImportConsentedCorpus, RevokeConsent· ρητή, ενημερωμένη, ανακλητή συναίνεση ως Control Record· κανένας ισχυρισμός μεταφοράς προσωπικότητας. | Η σωστή μορφή σήμερα είναι extension point μόνο με συμβόλαιο. Τα πρότυπα BCI είναι ακόμη active PARs (P2731 από 2018, P2794 RSNIR). Η UNESCO Recommendation (11/2025, μη δεσμευτική) ζητά prior, free, informed και δυναμική συναίνεση και διαφάνεια. Ελέγχθηκε το ISO/IEC TS 27560:2023 (consent record με events given/withdrawn): δεν είναι ανώτερο, είναι έτοιμο σχήμα για το Control Record. Βελτίωση: consent ως εγγραφή κατά ISO/IEC TS 27560 και attestation ως VC 2.0. Κενό: η ανάκληση πρέπει να διαδίδεται στα παράγωγα (GAP-AEO-08). | επέκταση · μέση | [UNESCO Recommendation on the Ethics of Neurotechnology, 2025](https://www.unesco.org/en/legal-affairs/recommendation-ethics-neurotechnology) · [IEEE P2731, 2018](https://standards.ieee.org/ieee/2731/7383/) · [DPV guide ISO/IEC TS 27560, 2026](https://w3c-cg.github.io/dpv/guides/consent-27560) |
| REQ-IDN-006 | δεν ξέρω | Η AEO-0 είναι η υπάρχουσα οντότητα LAWMAX-Ω, με αναθεωρημένο (όχι αντικατεστημένο) χάρτη· [T], μέθοδος I (VT-904). | Ο ισχυρισμός αφορά as-built έδρες του άλλου repo (SYSTEM-CONSTITUTION, self-glossary, self-history), που από εδώ δεν επαληθεύονται. Δεν υπάρχει εξωτερικό SOTA που να τον κρίνει· είναι απόφαση του δημιουργού. | σήμερα · χαμηλή |  |

## Κενά που δεν καλύπτει καθόλου το πρόχειρο

### GAP-AEO-01 — Κλειδιά χωρίς pre-rotation και εγκυρότητα βάσει αυτοδηλωμένου χρόνου

*σήμερα*

Το ICD-03 έχει CreateCharter/Delegate/Rotate/Revoke χωρίς δέσμευση στα επόμενα κλειδιά. Το INV-I04 και το §9.3(1) κρίνουν την εγκυρότητα «τη στιγμή της υπογραφής». Η ιεραρχία του §9.4 (Owner Root → entity root → operational → bodies) επιτρέπει re-delegation από το ανώτερο κλειδί, αλλά απαιτεί την ενεργή εμπλοκή του.

**Γιατί μετρά:** Ο αυτοδηλωμένος χρόνος επιτρέπει backdating από κλειδί που έχει διαρρεύσει ή ανακληθεί. Η ανάκαμψη των ανώτερων κλειδιών στηρίζεται μόνο σε threshold και time-lock (KT-23), χωρίς προδεσμευμένο διάδοχο.

**Τι δείχνει το ανώτερο:** KERI: pre-rotation (digest των επόμενων κλειδιών), key state από το KEL, witnesses/watchers για duplicity. Προαιρετικό pre-rotation και στο did:webvh.

**Πηγές:** [KERI spec v1.1, 2026](https://trustoverip.github.io/kswg-keri-specification/) · [did:webvh v1.0, έτος μη επαληθευμένο](https://identity.foundation/didwebvh/v1.0/)

### GAP-AEO-02 — Memory poisoning μέσω νόμιμων επεισοδίων

*σήμερα*

Τα memory events φέρουν prov (§9.2) και το INV-S01 χωρίζει εντολές από δεδομένα. Όμως ένα επεισόδιο που προήλθε από observed interaction μπορεί να ανακληθεί αργότερα ως «προηγούμενο» στη συλλογιστική, χωρίς να είναι εντολή. Το ICD-29 Recall δεν ορίζει φιλτράρισμα ή σήμανση κατά trust class. Η υπογραφή του body δεν βοηθά, γιατί το body υπογράφει νόμιμα το μολυσμένο επεισόδιο.

**Γιατί μετρά:** Το MINJA πετυχαίνει μέσο ISR 98,2% και ASR 76,8% μόνο με queries. Σε μνήμη χωρίς διαγραφή τα εγχυμένα records μένουν μόνιμα και απενεργοποιούνται μόνο με taint (INV-E02). Αυτό είναι αρχιτεκτονικό συμπέρασμα, όχι εύρημα της πηγής.

**Τι δείχνει το ανώτερο:** Trust-tagged recall: περιεχόμενο κλάσης OBSERVED δεν γίνεται precedent για effectful ενέργεια χωρίς verification. HMAC provenance στην εγγραφή και randomized ablation voting (SMSR). Verification πριν από κάθε consolidation (SSGM, conceptual).

**Πηγές:** [MINJA, 2025](https://arxiv.org/html/2503.03704) · [SMSR, 2026](https://arxiv.org/abs/2606.12703)

### GAP-AEO-03 — Δυνητική εμπλοκή: CharacterCont=Unknown ∧ fail-closed gate ∧ κριτήριο KT-01

*σήμερα*

Το ICD-06 κάνει UNKNOWN ⇒ άρνηση. Το INV-I01 (Tier-0) απαιτεί CharacterCont, και αν η Battery δεν είναι έγκυρη, το EXP-03 το κηρύσσει Unknown. Το INV-I05 έχει κλάδο «αναθεώρηση χαρακτήρα εγκεκριμένη από τον δημιουργό», άρα δεν πρόκειται για αυστηρό deadlock. Το κριτήριο επιβίωσης του KT-01 όμως ζητά μόνο Battery d ≤ ε και δεν δέχεται αυτόν τον κλάδο. Κάθε αλλαγή παρόχου απαιτεί είτε πράξη δημιουργού είτε αποτυγχάνει στο KT-01.

**Γιατί μετρά:** Χωρίς ρητή απόφαση, η απορρόφηση τεχνολογίας (T8) είτε μπλοκάρει είτε γίνεται σιωπηλή εξαίρεση.

**Τι δείχνει το ανώτερο:** Δεν υπάρχει επικυρωμένο όργανο (SOTA-AEO-13). Απαιτείται απόφαση θεσμικής σημασιολογίας (DEC-AEO-02).

**Πηγές:** [Rethinking Psychometric Evaluation of LLMs, 2026](https://arxiv.org/abs/2606.12730)

### GAP-AEO-04 — Αμφισημία του πεδίου του B: ευαισθησία σε πάροχο έναντι d ≤ ε μετά από swap

*πείραμα*

Το §9.3(3) και το EXP-03 ζητούν η Battery να είναι ευαίσθητη σε αλλαγή παρόχου, ώστε να πιάνει αλλαγή του «ποιος» απαντά. Τα KT-01 και KT-08 ζητούν d ≤ ε μετά από νόμιμη αλλαγή παρόχου. Τα δύο είναι συμβατά μόνο αν το B μετρά αξίες και αποφάσεις και όχι ύφος, κάτι που το πρόχειρο δεν ορίζει.

**Γιατί μετρά:** Αν το B περιλαμβάνει ύφος (αναγνωρίσιμο στο 97,1%), το KT-01 αποτυγχάνει εκ κατασκευής.

**Τι δείχνει το ανώτερο:** Task-specific behavioral instruments αντί για γενική ψυχομετρία, με two-sample tests βαθμονομημένα έναντι της διακύμανσης του ίδιου οργάνου (MET, στατιστική αξιολόγησης).

**Πηγές:** [Idiosyncrasies in LLMs, 2025](https://arxiv.org/abs/2502.12150) · [Model Equality Testing, 2024](https://arxiv.org/abs/2410.20247)

### GAP-AEO-05 — Organ-coupled παράγωγη μνήμη χωρίς κανόνα rebuild

*σήμερα*

Οι σημειώσεις, οι περιλήψεις και τα embeddings που παράγει ένα LLM organ μέσα στη μνήμη δεν φέρουν ετικέτα producer-organ/version. Δεν ορίζεται υποχρεωτικό rebuild από τα raw episodes σε κάθε ORP.

**Γιατί μετρά:** Μετά από αλλαγή writer οι σημειώσεις μετακινούνται −13,28 έως +9,91 pts. Το πλήρες re-embedding δίνει 11,90 pts έναντι 4,96 του μερικού.

**Τι δείχνει το ανώτερο:** Tag με το όργανο που παρήγαγε κάθε παράγωγο· rebuild ως R-B από τα raw episodes στο CUTOVER· fixed-schema δομές όπου γίνεται.

**Πηγές:** [Does Your Agent's Memory Survive a Model Upgrade?, 2026](https://arxiv.org/abs/2609.05339)

### GAP-AEO-06 — Κανένα ποσοτικό κριτήριο αποδοχής ποιότητας μνήμης

*σήμερα*

Το CMP-AEO-03 είναι [T] χωρίς benchmark για recall, abstention ή knowledge updates. Το VT-029 είναι conformance του ICD-29.

**Γιατί μετρά:** Χωρίς μετρική μνήμης, τα KT-14 (null baseline) και KT-24 (οριακή αξία) δεν εφαρμόζονται ουσιαστικά στη μνήμη.

**Τι δείχνει το ανώτερο:** LongMemEval (πέντε ικανότητες, μαζί με abstention) και HaluMem (operation-level), προκαταχωρισμένα.

**Πηγές:** [LongMemEval, 2024](https://arxiv.org/abs/2410.10813) · [HaluMem, 2025](https://arxiv.org/abs/2511.03506)

### GAP-AEO-07 — Πιστότητα αυτο-αφήγησης πέρα από την ύπαρξη γεγονότων

*πείραμα*

Το §9.9 αποκλείει fabrication, όχι επιλεκτική παράλειψη ή παραμορφωμένη ερμηνεία πραγματικών γεγονότων.

**Γιατί μετρά:** Ψευδής αφήγηση μέσω παράλειψης είναι εξίσου ψευδής.

**Τι δείχνει το ανώτερο:** Ταξινομία του HaluMem (fabrication, errors, conflicts, omissions). Verifier που ελέγχει entailment και coverage έναντι των γεγονότων που αναφέρει ο ισχυρισμός· απαιτεί πείραμα.

**Πηγές:** [HaluMem, 2025](https://arxiv.org/abs/2511.03506)

### GAP-AEO-08 — Η erasure και η ανάκληση συναίνεσης δεν διαδίδονται στα consolidated παράγωγα

*σήμερα*

Το KT-16 καλύπτει τον καθαρισμό των παράγωγων indexes, και το INV-E02 ορίζει διάδοση taint μέσω PROV/ATMS (COG-05, ICD-29). Όμως ούτε το INV-I03 ούτε τα ICD-29 EraseByControl ή ICD-25 RevokeConsent ορίζουν ανάλογη αντίστροφη διάδοση για consolidated semantic claims και skills που είναι ledger events, όχι indexes.

**Γιατί μετρά:** Κατά τον EDPB (κατ' αναλογία), τα παράγωγα που παραμένουν συνδέσιμα με το υποκείμενο παραμένουν personal data.

**Τι δείχνει το ανώτερο:** Διαγραφή με keyed commitment και καταστροφή κλειδιού και ciphertext (EDPB). Αντίστροφη διάσχιση PROV όπως στο taint. Consent events (given/withdrawn) κατά ISO/IEC TS 27560.

**Πηγές:** [EDPB Guidelines 02/2025 final v2.0, 2026](https://www.edpb.europa.eu/documents/guideline/guidelines-022025-on-processing-of-personal-data-through-blockchain_en) · [DPV guide ISO/IEC TS 27560, 2026](https://w3c-cg.github.io/dpv/guides/consent-27560)

### GAP-AEO-09 — Αναφορές σε ανύπαρκτα αρχεία και ενότητες· ασυμφωνίες

*σήμερα*

Τα §9.3/§9.6 και το 24.md παραπέμπουν στα formal/tla/IdentityContinuity.tla, formal/tla/OrganReplacement.tla, formal/lean/Grail/Continuity.lean και verification/KILL-TESTS.md. Κανένα δεν υπάρχει πουθενά στο repo (Glob για *.tla, *.lean, *.als και KILL-TESTS.md: 0 αποτελέσματα). Το §9.1 παραπέμπει στο «ECP (§10)», που δεν γράφτηκε. Το spine-vocab δηλώνει «COMPONENTS (76)» αλλά απαριθμεί 75, το ίδιο και το §6.3. Το CMP-AEO-03 είναι [T] ενώ το REQ-MEM-002 είναι [X] (EXP-19).

**Γιατί μετρά:** Τα VT-102, VT-105, VT-108, VT-303 και τα κατώφλια του ORP δεν έχουν έδρα, κάτι που παραβιάζει τον κανόνα 0 λάθους.

**Τι δείχνει το ανώτερο:** Δεν αφορά SOTA: διόρθωση της ιχνηλασιμότητας στο canonical model (VT-901).

### GAP-AEO-10 — Χωρίς μέθοδο παραγωγής για τις παραμέτρους ασφάλειας

*σήμερα*

Τα T_sync, Δ_max, ε, θ, N, το rollback window και το όριο του KT-18 είναι κατά το πρόχειρο Tier-1 δεδομένα προς προκαταχώριση (19.md §19.5(3), 24.md κανόνας 1). Λείπει όμως η μέθοδος με την οποία θα οριστούν.

**Γιατί μετρά:** Χωρίς μέθοδο η προκαταχώριση γίνεται αυθαίρετη επιλογή αριθμών.

**Τι δείχνει το ανώτερο:** Το όριο του KT-18 δένεται στο TTL των short-lived credentials (SPIRE defaults 1h X509, 5m JWT, ρυθμιζόμενα). Τα θ και ε δένονται με α και ισχύ two-sample tests (MET) και με σχεδιασμό ισχύος.

**Πηγές:** [SPIRE Server configuration, πρόσβαση 2026](https://spiffe.io/docs/latest/deploying/spire_server/) · [Model Equality Testing, 2024](https://arxiv.org/abs/2410.20247)

### GAP-AEO-11 — Εξωτερική επαληθευσιμότητα της ταυτότητας AEO· agent auth προς τρίτα εργαλεία

*σήμερα*

Δεν έχει επιλεγεί διαλειτουργικό format ταυτότητας και credentials (DID/VC/KERI AID). Δεν ορίζεται πώς ένα body αυθεντικοποιείται σε εξωτερικά εργαλεία και πρωτόκολλα agents.

**Γιατί μετρά:** Πελάτες, δικαστήρια και άλλα collectives δεν μπορούν να επαληθεύσουν πράξεις του AEO χωρίς ειδικά εργαλεία.

**Τι δείχνει το ανώτερο:** VC 2.0 και Controlled Identifiers (Rec 2025), DID v1.1 (CR 2026). Workload identity κατά WIMSE/SPIFFE, OAuth 2.0 delegation, καμία πρόσβαση του LLM σε credentials (draft-klrc-aiagent-auth-03).

**Πηγές:** [VC 2.0 Recommendation, 2025](https://www.w3.org/news/2025/the-verifiable-credentials-2-0-family-of-specifications-is-now-a-w3c-recommendation/) · [draft-klrc-aiagent-auth-03, 2026](https://datatracker.ietf.org/doc/draft-klrc-aiagent-auth/)

### GAP-AEO-12 — Consistency model ανάγνωσης μεταξύ σωμάτων πριν από το merge

*πείραμα*

Το §9.4 ορίζει την εγγραφή (ένας συγγραφέας) και το merge, όχι όμως τι βλέπει ένα body από την εμπειρία των αδελφών του: causal, snapshot στο cut ή τίποτα μέχρι το merge.

**Γιατί μετρά:** Το multi-agent memory consistency θεωρείται το πιο πιεστικό ανοικτό πρόβλημα (2026) και επηρεάζει την ορθότητα των δεσμεύσεων των σωμάτων.

**Τι δείχνει το ανώτερο:** Causal consistency μέσω Merkle-DAG clocks (Merkle-CRDT) και ρητό cut ανά ανάγνωση (bitemporal)· χρειάζεται πείραμα.

**Πηγές:** [Multi-Agent Memory from a Computer Architecture Perspective, 2026](https://arxiv.org/abs/2603.10062) · [Merkle-CRDTs, 2020](https://arxiv.org/abs/2004.00107)

## Δεν ξέρω

- As-built έδρες (MEMORY-KERNEL-SPEC, LAWMAX_REPLICA, KEY-LIFECYCLE/TRUST-BOOTSTRAP, self-history, can-adopt): ανήκουν στο άλλο repo· ανεπαλήθευτες.
- Αν μια Battery μπορεί ταυτόχρονα να έχει test-retest αξιοπιστία, να διακρίνει οντότητες και να μένει αναλλοίωτη σε νόμιμη αλλαγή παρόχου: δεν βρέθηκε πηγή.
- Κλιμάκωση του ATMS σε μέγεθος μνήμης μόνιμης οντότητας: δεν βρέθηκε πηγή.
- Κόστος και latency υπογραφής ανά γεγονός με Merkle commitment στον ρυθμό εγγραφής πολλών σωμάτων: κανένα benchmark.
- Παραγωγική υιοθέτηση του KERI και ωριμότητα βιβλιοθηκών για Rust TCB και PQ suites (ML-DSA/SLH-DSA): δεν επαληθεύτηκε.
- Επίσημη ratification της KERI v1.1 από το ToIP: η σελίδα δεν το δηλώνει.
- Elixir/OTP έναντι εναλλακτικών για AEO-02/AEO-06 και εγγυήσεις lease/fencing στο BEAM distribution: δεν βρέθηκε πηγή (EXP-06).
- Ημερομηνία δημοσίευσης του did:webvh v1.0: δεν επαληθεύτηκε (χωρίς ημερομηνία στη σελίδα, χωρίς releases στο GitHub).
- Venue του MINJA (NeurIPS 2025) και του Mem0 (ECAI 2025): δεν επαληθεύτηκαν.
- Εφαρμοσιμότητα του EDPB 02/2025 (blockchain) σε ιδιωτικό append-only ledger με witnesses: κατ' αναλογία· η νομική επάρκεια και η ελληνική πρακτική είναι EXP-19.
- Αν η φραγμένη απόκλιση και το υποχρεωτικό merge του §9.4 αποφεύγουν φιλοσοφικά τη «σχάση»: δεν ξέρω.
- Ποιότητα consolidation σε νομικό domain (δικογραφίες, διτεμπορικότητα νόμου): κανένα benchmark.
- Αν υπάρχει αυστηρά ανώτερη εναλλακτική που ξέφυγε για τα CMP-AEO-03, INV-O01, KT-08 και CMP-AEO-02: ο ελεγκτής δεν μπόρεσε να κάνει ανεξάρτητη αναζήτηση (εξαντλημένο WebSearch budget, arXiv API 429).

## Τι διόρθωσε ο ανεξάρτητος ελεγκτής

Πηγές που άνοιξε: 77 · δεν στέκονταν: 20 · διορθώσεις: 18

- **INV-I04/KT-18 superior:** Το «Καμία απώλεια ιδιότητας» αντικαταστάθηκε από ρητό trade-off: τα offline buffered γεγονότα που δεν μαρτυρήθηκαν πριν από την ανάκληση πηγαίνουν σε quarantine· confidence high→medium — Το CMP-KRN-01 (τοπικό buffer σε partition) και το §9.4 (έγκυρα μέχρι τη λήξη του lease) συγκρούονται με την εγκυρότητα που ορίζει ο verifier
- **INV-I03/REQ-MEM-002:** Διορθώθηκε το draft_position (αλλοιωμένη διατύπωση). Προστέθηκε ότι ο EDPB ισχύει κατ' αναλογία, ότι το πρόχειρο δεν ορίζει τη μορφή του content_cid, και ρητό trade-off για το «ποτέ διαγραφή» στο CAS — Ακρίβεια απόδοσης του προχείρου και κανόνας 3 (δήλωση trade-off)
- **ICD-16/INV-O02 superior:** Δηλώθηκε το trade-off (δεύτερο instance, περισσότερα δείγματα)· προστέθηκε η πηγή Adding Error Bars to Evals — Κανόνας 3
- **summary:** Τα αυστηρά ανώτερα σημεία είναι τέσσερα, όχι τρία (λείπε το EXP-13). Το «deadlock» έγινε «δυνητική εμπλοκή» — Συνέπεια με τα draft_points· το INV-I05 έχει ήδη κλάδο αναθεώρησης χαρακτήρα
- **GAP-AEO-01:** Αναγνωρίστηκε ότι η ιεραρχία delegation επιτρέπει re-delegation από ανώτερο κλειδί — Το «η ανάκαμψη εξαρτάται από τον Owner Root» υπερέβαλλε έναντι του §9.4
- **GAP-AEO-02:** Αναγνωρίστηκε το πεδίο prov (§9.2)· διορθώθηκαν τα νούμερα του MINJA· αφαιρέθηκε ο ανεπαλήθευτος ισχυρισμός για επιβίωση σε αλλαγή μοντέλου — Ακρίβεια προχείρου και πηγής
- **GAP-AEO-03:** Ο τίτλος έγινε «δυνητική εμπλοκή»· προστέθηκε ότι το κριτήριο του KT-01 δεν δέχεται τον κλάδο αναθεώρησης — Ακριβέστερη διάγνωση
- **GAP-AEO-04:** Η «αντίφαση» έγινε «αμφισημία του πεδίου του B» — Τα δύο κριτήρια είναι συμβατά αν το B δεν μετρά ύφος
- **GAP-AEO-08:** Αφαιρέθηκε το «το INV-E02 δεν συνδέεται με τη μνήμη»· αναγνωρίστηκε ότι το KT-16 καλύπτει τα indexes· το κενό περιορίστηκε στα consolidated claims/skills — Το REQ-KNW-002 αντιστοιχεί σε ICD-29/COG-05· το KT-16 ορίζει καθαρισμό παράγωγων indexes
- **GAP-AEO-09:** Επιβεβαιώθηκε με Glob ότι λείπουν από όλο το repo· επιβεβαιώθηκε με ανάγνωση η καταμέτρηση 75 έναντι 76 — Έλεγχος 4
- **GAP-AEO-10:** Αναγνωρίστηκε ότι τα κατώφλια είναι Tier-1 δεδομένα προς προκαταχώριση· το κενό είναι η μέθοδος, όχι παραβίαση της προκαταχώρισης — 19.md §19.5(3), 24.md κανόνας 1
- **SOTA-AEO-01:** maturity production→pilot· διορθώθηκαν οι εκδόσεις (Zenodo 1.0 / σελίδα v1.1) — Η παραγωγική υιοθέτηση δεν επαληθεύτηκε
- **SOTA-AEO-16:** Αφαιρέθηκε το «αποτρέπει τη σχάση»· έγινε «δεν ξέρω» — Αρχιτεκτονικό συμπέρασμα χωρίς πηγή
- **SOTA-AEO-17:** Το P2794 διορθώθηκε από «active draft» σε «active PAR (RSNIR)» — Σελίδα sagroups.ieee.org/2794
- **sota[]:** Προστέθηκαν SOTA-AEO-21 (ISO/IEC TS 27560), SOTA-AEO-22 (στατιστική αξιολόγησης LM) και SOTA-AEO-23 (AGM ως εναλλακτική που ελέγχθηκε) — Έλεγχος holds και τεκμηρίωση των superior
- **decisions:** DEC-AEO-01: δίκαιη τέταρτη επιλογή (bespoke + verifier-side ordering) και διόρθωση των pros. DEC-AEO-02: προστέθηκε το KT-01. Νέο DEC-AEO-06 (erasure/ciphertext) — Δίκαιη παρουσίαση εναλλακτικών· πραγματική διχάλα που προκύπτει από το superior του INV-I03
- **confidence:** Τα CMP-AEO-03, CMP-AEO-04 και INV-O01 έγιναν high→medium — Στηρίζονται κυρίως σε preprints του 2026 και δεν έγινε ανεξάρτητη αναζήτηση holds
- **CMP-AEO-05 reasoning:** Η ασαφής φράση «τρέχον σφάλμα… pass» αντικαταστάθηκε από αναφορά στο GAP-AEO-03/DEC-AEO-02 — Δεν αντιστοιχούσε στο πρόχειρο (το ICD-06 είναι fail-closed)
