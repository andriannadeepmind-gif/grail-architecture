# Συλλογική συνείδηση — αποφάσεις (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## DEC-CCP-01 · Ποιο fault model δεσμεύει τα μονότονα επίπεδα του ECP (evidence, claims, stances, taint);

**Πρόταση:** BEC / BFT-CRDT: hash-DAG υπογεγραμμένων updates, εγκυρότητα μόνο στο causal past, συμφιλίωση με heads, και κατάταξη κάθε λειτουργίας με το κριτήριο I-confluence. Αναδιατύπωση του INV-K01 υπό αυτό το μοντέλο, και του κριτηρίου του KT-18 (σήμανση αντί απόρριψης για updates σύγχρονα με την ανάκληση).

- **BEC / BFT-CRDT (πρόταση)** — υπέρ: Σύγκλιση με οσουσδήποτε Byzantine κόμβους, Sybil-immune, χωρίς consensus, με αποδείξεις. Επαναχρησιμοποιεί τα CIDs του προχείρου. Καλύπτει OS-08, KT-04 και το revocation race. · κατά: Αποθήκευση predecessor hashes. Δεν επαληθεύτηκε production βιβλιοθήκη σε Rust/Elixir. Αλλάζει τη σημασιολογία ανάκλησης: τα σύγχρονα updates σημαίνονται αντί να απορρίπτονται.
- **Απλό CRDT με έμπιστους replicas (crash-only στην ομοσπονδία)** — υπέρ: Απλούστερο, ώριμα CRDT. · κατά: Αποκλίνει με Byzantine σώμα, version-vector anti-entropy ή revocation race. Αντιφάσκει με τον τίτλο του ADR-0031 και με το KT-04.
- **Όλα τα επίπεδα μέσα από BFT log** — υπέρ: Ενιαία ολική διάταξη· η ανάκληση ισχύει κατά σειρά log. · κατά: Χάνει τη διαθεσιμότητα σε partitions (αντίθετα με το OS-08), απαιτεί n ≥ 3f+1 για ό,τι δεν το χρειάζεται και χάνει το coordination-free.

**Γιατί:** Κατά Kleppmann & Howard (2020), η προσθήκη μαρτυρίας δεν χρειάζεται consensus. Κατά Kleppmann (2022), τα περισσότερα CRDT αποκλίνουν με Byzantine κόμβους. Η επιλογή δεσμεύει την Constitution (INV-K01), το VT-103 και το κριτήριο του KT-18.

**Επηρεάζει:** INV-K01, ADR-0031, CMP-CCP-01, CMP-CCP-02, CMP-CCP-05, REQ-CCP-001, KT-04, ICD-13

## DEC-CCP-02 · Με ποιον μηχανισμό επιτυγχάνεται η μοναδικότητα και η μη αμφισημία των τελικών verdicts μεταξύ sites;

**Πρόταση:** Για το GP-6: single-writer Court log με lease fencing και quorum witness cosignatures (C2SP tlog-witness/tlog-cosignature), ως επέκταση του tlog-1 και του witness model. Αναδιατύπωση του INV-K06 ως «Verdict Non-Equivocation» με ρητό fault model. Μετάβαση σε πλήρες BFT (HotStuff-2-class) μόνο με ≥4 ανεξάρτητα failure domains/διαχειριστές.

- **Witnessed single-writer log (πρόταση για σήμερα)** — υπέρ: Απλό, συμβατό με τις υπάρχουσες έδρες. Ο client που απαιτεί quorum cosignatures προστατεύεται από split-view εκτός αν συνωμοτήσει το quorum. Λειτουργεί με τα 3 sites του DP-3. · κατά: Η liveness εξαρτάται από τον writer (crash failover με fencing, όχι Byzantine). Το censorship από compromised writer ανιχνεύεται αλλά δεν αποτρέπεται.
- **Πλήρες BFT SMR (HotStuff-2 / CometBFT) με ≥4 κόμβους** — υπέρ: Κανένας μεμονωμένος κόμβος δεν κάνει equivocation ή censorship. Ικανοποιεί κυριολεκτικά το n ≥ 3f+1. · κατά: Απαιτεί ≥4 ανεξάρτητα sites/διαχειριστές, που το DP-3 δεν έχει. Επιχειρησιακό κόστος. Και οι ώριμες υλοποιήσεις έχουν κρίσιμα σφάλματα consensus (CometBFT CSA-2026-001, BFT Time).
- **Trust-BFT με trusted components (HSM/TEE του trust plane)** — υπέρ: Λιγότερα replicas για το ίδιο f· 3 sites θα μπορούσαν να ανεχθούν f=1. · κατά: Νέα υπόθεση εμπιστοσύνης στο hardware (compromise του TEE σπάει την safety). Τρεις τεκμηριωμένοι περιορισμοί αποκλείουν τις περισσότερες πρακτικές αναπτύξεις (Gupta et al. 2022).
- **DAG-BFT (Mysticeti-class)** — υπέρ: Ελάχιστο latency, σε παραγωγή. · κατά: Βελτιστοποιημένο για throughput που ο φόρτος verdicts δεν χρειάζεται. Μεγαλύτερη πολυπλοκότητα για την ίδια safety.

**Γιατί:** Το KT-04 και το REQ-CCP-008 είναι ανικανοποίητα στην ελάχιστη τοπολογία του DP-3 (GAP-CCP-04). Η επιλογή αλλάζει Tier-0 invariant και deployment profile, άρα απαιτεί «εγκρίνω».

**Επηρεάζει:** REQ-CCP-008, ADR-0031, KT-04, CMP-CCP-04, ICD-13

## DEC-CCP-03 · Σε ποια σημασιολογία στηρίζονται τα typed speech acts του ICD-13, και ποιο είναι το εξωτερικό όριο;

**Πρόταση:** Εσωτερικά: information-protocol σημασιολογία (BSPL/Langshaw) με locutions και commitment stores κατά Prakken· κάθε πρωτόκολλο είναι επαληθεύσιμο αντικείμενο content-addressed. Εξωτερικά: adapter A2A 1.0 (data Parts + extension URI) ως extension point, με το εισερχόμενο περιεχόμενο πάντα OBSERVED/PROPOSED.

- **BSPL/Langshaw/Prakken εσωτερικά + A2A στο όριο (πρόταση)** — υπέρ: Επαλήθευση safety/liveness πριν από την υλοποίηση, αποκεντρωμένη εκτέλεση, εκτελέσιμα από LLM agents (Ahoy)· έχει δειχθεί διαλειτουργικότητα με βιομηχανικό πρωτόκολλο (Strabo). · κατά: Το tooling είναι ερευνητικό. Χρειάζεται αντιστοίχιση προς AsyncAPI/JSON Schema.
- **FIPA ACL (mentalistic σημασιολογία)** — υπέρ: Ιστορικό πρότυπο με καθορισμένα performatives και υλοποιήσεις. · κατά: Η σημασιολογία πάνω σε νοητικές καταστάσεις έχει επικριθεί ως προς την επαλήθευση. Ο οργανισμός διαλύθηκε το 2005 και οι προδιαγραφές δεν σερβίρονται πλέον από το fipa.org.
- **A2A-native (Tasks/Messages) χωρίς σημασιολογία ECP** — υπέρ: Άμεση διαλειτουργικότητα. · κατά: Δεν έχει commitments, dissent ή voting, άρα χάνει τα INV-K03/INV-K05. Σημασιολογικά ισοδυναμεί με free text.

**Γιατί:** Η §10 δεν γράφτηκε, οπότε το σημασιολογικό θεμέλιο πρέπει να επιλεγεί πριν από το pkg Interfaces της Φάσης Β. Επηρεάζει το VT-013 και το KT-17.

**Επηρεάζει:** ICD-13, CMP-CCP-03, INV-K05, REQ-CCP-003, ADR-0007

## DEC-CCP-04 · Πώς προστατεύεται η ανεξαρτησία των stances από τη conformity;

**Πρόταση:** Σφραγισμένη ανεξάρτητη stance (commit-then-reveal) πριν από την έκθεση σε stances άλλων, για κάθε θέμα που προορίζεται για Court ή συλλογική όψη. Κάθε αλλαγή stance μόνο ως typed CONCEDE/RETRACT με αναφορά σε νέο evidence ή argument, ελεγμένο από verifier. Μέτρηση harmful conformity και επιβίωσης γεγονότων στο KT-07.

- **Sealed-first + αιτιολογημένες αλλαγές (πρόταση)** — υπέρ: Η αναιτιολόγητη conformity γίνεται μη αναπαραστάσιμη (εξάλειψη κλάσης σφάλματος). Διατηρεί την ατομικότητα (T3) και δίνει baseline για μέτρηση. · κατά: Πρόσθετη καθυστέρηση και γύροι. Ακόμη και vacuous reasoning συνδέεται με 20–39% υιοθέτηση σφάλματος, άρα η αιτιολόγηση χρειάζεται έλεγχο από verifier.
- **Ελεύθερη έκθεση (debate) με εκ των υστέρων μέτρηση** — υπέρ: Απλό και γρήγορο. · κατά: Τεκμηριωμένα wrong-but-sure cascades, biased consensus και διαγραφή έως 72% των issue-critical facts.
- **Καμία έκθεση μεταξύ οντοτήτων (μόνο ανεξάρτητες stances)** — υπέρ: Μέγιστη ανεξαρτησία και ισχυρό σήμα ensemble (Debate or Vote). · κατά: Χάνεται η ανταλλαγή επιχειρημάτων. Το Collective εκφυλίζεται σε ψηφοφορία, αντίθετα με το glossary («Stance ≠ Ψήφος»).

**Γιατί:** Είναι αρχή του Collective και δεσμεύει τη σημασιολογία του CMP-CCP-05 και το κριτήριο του KT-07.

**Επηρεάζει:** CMP-CCP-05, INV-K04, REQ-CCP-005, KT-07, ICD-13

## DEC-CCP-05 · Ποια είναι η προκαταχωρισμένη baseline και το κριτήριο θανάτωσης του EXP-02;

**Πρόταση:** Baselines: καλύτερη μεμονωμένη οντότητα, free-chat MAD, majority vote/self-consistency και Self-MoA με ίσο compute, στρωματοποιημένα κατά δομή εργασίας, με μέτρηση συσχέτισης σφαλμάτων. Κριτήριο: αν ECP ≤ ισχυρότερης φθηνής baseline ensemble, το Collective περιορίζεται σε κοινή μαρτυρία και verdicts μέσω Court, χωρίς speech-act debate.

- **Πλήρες σύνολο baselines (πρόταση)** — υπέρ: Αντέχει τις γνωστές αδυναμίες αξιολόγησης MAD (Debate or Vote· Stop Overvaluing MAD). Το αποτέλεσμα είναι αξιόπιστο για την τύχη του στρώματος. · κατά: Περισσότερο compute και σχεδιασμός. Υψηλότερο όριο, που μπορεί να «σκοτώσει» μέρος του ECP.
- **Οι baselines του προχείρου (μεμονωμένη + free-chat)** — υπέρ: Φθηνότερο. · κατά: Ένα θετικό αποτέλεσμα μπορεί να οφείλεται μόνο σε voting/ensembling, άρα αποτυγχάνει ως kill test.

**Γιατί:** Κατά το ADR-0027 η αξιολόγηση παγώνει πριν από την υλοποίηση. Το κριτήριο αποφασίζει αν θα υπάρξει μέρος ολόκληρου στρώματος, άρα απαιτεί «εγκρίνω».

**Επηρεάζει:** EXP-02, ADR-0007, KT-07, REQ-CCP-002, REQ-CCP-005

## DEC-CCP-06 · Επιτρέπονται παράγωγες συλλογικές όψεις πέρα από τα verdicts (bridging σύνθεση, conformal σύνολα);

**Πρόταση:** Ναι, ως μη αυθεντικές όψεις: έξοδος PROPOSED με ρητή ετικέτα, ποτέ trusted state, ποτέ υποκατάστατο verdict. Το conformal act-vs-escalate συνδέεται με το Unknown (INV-C04). Υλοποίηση ως extension point μετά από πείραμα.

- **Μη αυθεντικές όψεις PROPOSED (πρόταση)** — υπέρ: Αξιοποιεί την τεκμηριωμένη αξία των bridging, Habermas και conformal μεθόδων χωρίς να παραβιάζει το INV-K02. Βαθμονομημένη αβεβαιότητα. · κατά: Κίνδυνος να εκληφθούν ως αλήθεια στο UI. Απαιτεί πείραμα και ευθυγράμμιση με το Prediction Doctrine.
- **Μόνο raw κατανομές stances + Court** — υπέρ: Καθαρότητα, κανένα ψευδο-verdict. · κατά: Χάνονται η σύνθεση κοινού εδάφους (T3) και η βαθμονομημένη κλιμάκωση.
- **Οι όψεις ως προαγωγή εμπιστοσύνης** — υπέρ: Ταχύτητα. · κατά: Παραβιάζει το INV-K02 (verdict μόνο μέσω διαδικασίας) και ανοίγει μονοπάτι conformity προς trusted state.

**Γιατί:** Αγγίζει το όριο Collective–Court και το Prediction Doctrine. Πρέπει να αποφασιστεί πριν από τη δομή των pkg Functions/LogicalArchitecture.

**Επηρεάζει:** CMP-CCP-05, CMP-CCP-06, REQ-CCP-004, REQ-CCP-005, ADR-0007
