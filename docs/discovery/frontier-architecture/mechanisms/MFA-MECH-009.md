# MFA-MECH-009 — Evaluator Independence Meter (EIM): η ανεξαρτησία ως μετρούμενο μέγεθος με κατώφλι

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-009 |
| **2. Όνομα** | Evaluator Independence Meter |
| **3. Ικανότητα** | MFA-CAP-075· πύλη για 022, 029, 049 (governors), 018 (Πολιτισμοί), 003 (GCP verdict) |
| **4. Πρόβλημα** | MATERIAL §9.18: «μπορεί η ανεξαρτησία του evaluator να διατηρηθεί σε σύστημα που εξελίσσει πολλά επίπεδα;» — άλυτο. DEC-X-02δ/DEC-X-15: κοινή καταγωγή parser (Syside/SysON) και Catala/dates-calc παράγουν ψευδή ανεξαρτησία. MATERIAL §7 #2: οι governors μοιράζονται substrate. Το N-version programming υποθέτει ανεξαρτησία που η βιβλιογραφία (Knight & Leveson) διέψευσε. Κανένα σύστημα δεν ΜΕΤΡΑ την ανεξαρτησία και δεν την κάνει πύλη. |
| **5. Πρώτη αρχή** | Η ανεξαρτησία δεν είναι ιδιότητα· είναι απόσταση σε τρεις μετρήσιμες διαστάσεις: (α) supply chain (κοινοί πρόγονοι στα build/schema/model lineages), (β) δεδομένα (επικάλυψη εκπαίδευσης/βαθμονόμησης), (γ) συμπεριφορά (συσχέτιση σφαλμάτων σε seeded faults). Η πύλη λέει «δεν έπεσε κάτω από X ανά Tier», και το X είναι πολιτική. |
| **6. Οντολογία** | `Evaluator` (verifier, governor, Πολιτισμός, panel member) με `lineage` (CIDs build, schema, μοντέλο, δεδομένα)· `IndependenceVector⟨d_supply, d_data, d_behaviour⟩`· `Threshold` ανά Tier (Constitution)· `SeededFaultSet` (κρυφό, περιστρεφόμενο, από held-out Πολιτισμό) |
| **7. Κατάσταση** | Μητρώο lineages· ιστορικό μετρήσεων· αποτελέσματα seeded faults |
| **8. Είσοδοι/έξοδοι** | Είσοδος: δύο (ή N) evaluators· Έξοδος: IndependenceVector + PASS/FAIL ανά Tier + ίχνος (ποιοι κοινοί πρόγονοι, ποια επικάλυψη, ποια συσχέτιση) |
| **9. Αλγόριθμος** | (α) **d_supply** = 1 − Jaccard(ancestors_A, ancestors_B) πάνω στο DAG των build/schema/model CIDs (SLSA provenance + Schema lineage στο CC)· μια κοινή ρίζα «Lean kernel» ή «Linux» μετρά με βάρος ανά βάθος (ρίζες βαθιά κοινές πληρώνουν λίγο, κοινός parser πληρώνει πολύ)· (β) **d_data** = 1 − επικάλυψη σε σφραγισμένα σύνολα εκπαίδευσης/βαθμονόμησης (canary strings, hash-sets)· για κλειστά μοντέλα παρόχων: Unknown(NOT_OBSERVED) με plan «ζήτα attestation» — μετρά ως 0 (worst case), όχι ως άγνωστο-ευνοϊκό· (γ) **d_behaviour** = 1 − φ-συντελεστής συσχέτισης σφαλμάτων σε SeededFaultSet (n ≥ 200 faults, με CI)· (δ) **Vector → πύλη**: PASS αν κάθε συνιστώσα ≥ threshold_Tier (χωρίς άθροισμα — LPA στυλ: veto ανά διάσταση)· (ε) **γενετική απόσταση** (MFA-MECH-012) ως τέταρτη συνιστώσα για εξελιγμένους evaluators |
| **10. Διεπαφές** | `EIM.measure(A, B)→IndependenceVector` · `EIM.gate(A, B, tier)→PASS∣FAIL+trace` · `EIM.register_lineage(evaluator, cids)`· χρησιμοποιείται από: ORP (verifier promotion), LPA (governor registration), GCP (verdict signers), Court (panel composition), MFA-MECH-018 (Πολιτισμοί) |
| **11. Εξαρτήσεις** | SLSA/in-toto attestations (CMP-OPS-01), CC lineage, held-out Πολιτισμός (SeededFaultSet), CMP-FRG-05 (differential lab) |
| **12. Πόροι** | d_supply O(|DAG|)· d_behaviour: 200 faults × 2 evaluators ανά μέτρηση· περιοδικό (drift) |
| **13. Κλιμάκωση** | Pairwise O(N²) για N evaluators — αποδεκτό (N μικρό)· cache ανά ζεύγος μέχρι αλλαγή lineage |
| **14. Αποτυχίες** | Lineage ελλιπής → d_supply = 0 (worst case, ορατό)· faults που «διαρρέουν» → περιστροφή σετ |
| **15. Αντιπαλικοί** | Evaluator που μαθαίνει το SeededFaultSet → κρυφό, περιστρεφόμενο, από άλλο trust domain· «ψεύτικη» ποικιλομορφία (rename της ίδιας υλοποίησης) → d_supply πιάνει κοινούς CIDs, d_behaviour πιάνει ίδια σφάλματα |
| **16. Επαλήθευση** | VO: EIM PASS πριν από κάθε verifier promotion/governor registration/panel/verdict signer· mutation: κλωνοποιώ evaluator με rename → EIM πρέπει FAIL· KT-19 |
| **17. Πρωτότυπο** | F1: d_supply πάνω στα CIDs αυτού του πακέτου + του corpus (ποιοι verifiers έχουν κοινή καταγωγή)· F2: d_behaviour με seeded faults σε DST (2 stub verifiers, ένας κλώνος) |
| **18. Ελάχιστο πείραμα** | 3 verifiers (Lean evaluator, Rust, Lisp) + 1 κλώνος με rename: ο EIM πρέπει να δώσει FAIL στον κλώνο και PASS στους τρεις· d_behaviour πρέπει να συσχετίζεται με d_supply (αρνητικά με σφάλματα) |
| **19. Διάψευση** | Αν d_supply/d_data δεν προβλέπουν d_behaviour σε δύο ανεξάρτητα σύνολα → οι στατικές διαστάσεις είναι κόσμημα και η πύλη γίνεται μόνο συμπεριφορική (ακριβότερη αλλά τίμια) |
| **20. → Παραγωγή** | Πύλη από Δόση 1 (verifiers του CC), υποχρεωτική για Court panels από Δόση 2 |
| **21. Εξέλιξη** | Νέα διάσταση = ADD (π.χ. χρονική: evaluators που δεν έτρεξαν ποτέ ταυτόχρονα)· κατώφλια = πολιτική με patch |
| **22. Αλληλεπιδράσεις** | Απαντά στο MATERIAL §7 #2 (governors) και §9.18· κάνει το N-version του corpus διαψεύσιμο· τροφοδοτεί το MFA-OBJ-039 |

**AI Contribution Ledger:** `NEW ALGORITHM` — τριδιάστατη μετρούμενη ανεξαρτησία (supply/data/behaviour) με veto ανά διάσταση και worst-case για μη παρατηρήσιμα. Συγγενή: N-version diversity metrics, Knight–Leveson, SLSA provenance· κανένα δεν συνθέτει τις τρεις σε πύλη προαγωγής.


## 0.4.0 — Κανόνας γενεαλογίας (MFA-PATCH-0040, ASI-ABSTENTION-AUDIT AA-015)

**Κανόνας:** `distilled(student, P) ⇒ lineage(student) ∋ P`. Ένα κυρίαρχο μοντέλο που αποστάχθηκε (SFT σε εξόδους, distillation υπό DisclosureGrant) από πάροχο P **κληρονομεί** τη γενεαλογία του P στη διάσταση `d_supply` (μοντέλο) και `d_data` (δεδομένα εκπαίδευσης)· επομένως ο P (ή οποιοδήποτε άλλο μοντέλο της γενεαλογίας του) **δεν είναι ανεξάρτητος αξιολογητής** του student, και instances του ίδιου μοντέλου δεν είναι ανεξάρτητοι κριτές μεταξύ τους (§4 της εντολής). Η γενεαλογία διαβάζεται από το Weight Commitment Registry (MFA-ELM-102) — ποτέ από δήλωση. Η πληθυσμιακή εφαρμογή (πληθυσμοί E/H, αποκλεισμοί ανά ζεύγος, Goodhart monitor) είναι ο μηχανισμός MFA-MECH-031 (ECE)· η αναλλοίωτη είναι η MFA-INV-089. Επιστημική κατάσταση του κανόνα: **EMPIRICALLY SUPPORTED** (συσχέτιση σφαλμάτων ίδιας γενεαλογίας) — η κατωφλίωση ανά Tier παραμένει πολιτική.
