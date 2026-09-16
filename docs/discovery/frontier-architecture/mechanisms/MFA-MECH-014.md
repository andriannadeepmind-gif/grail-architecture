# MFA-MECH-014 — Semantic Loss Map via Pushout Conflicts (SLM): ο χάρτης απώλειας ως θεώρημα και κάτω φράγμα

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-014 |
| **2. Όνομα** | Semantic Loss Map via Pushout Conflicts |
| **3. Ικανότητα** | MFA-CAP-080, 024· χρησιμοποιείται από 026 (ORP cutover), 027 (GCP), 041 forks/merges |
| **4. Πρόβλημα** | MATERIAL §9.4: «η πληρότητα του loss map είναι ανεπίτευκτη» — round-trip tests και anchor queries δεν λένε πώς ξέρεις ότι το σύνολο probes είναι πλήρες· MFA-OBJ-041: forks χωρίς συγκρισιμότητα. Το ORP έχει «differential» χωρίς ορισμό του τι είναι απώλεια. |
| **5. Πρώτη αρχή** | Δύο εκδοχές που μοιράζονται κοινό πρόγονο συγκρίνονται με pushout πάνω στον πρόγονο (MFA-ALT-5)· ό,τι ΔΕΝ έχει pushout (ασύμβατες επανεγγραφές του ίδιου διατηρούμενου τμήματος K) είναι **δομική** απώλεια — θεώρημα, όχι λίστα. Η **σημασιολογική** απώλεια (ίδια δομή, άλλο νόημα) δεν είναι θεώρημα· είναι κάτω φράγμα από anchor queries που μόνο μεγαλώνει. Ο χάρτης = ένωση των δύο, με ρητή ετικέτα ποιο μέρος είναι θεώρημα και ποιο φράγμα. |
| **6. Οντολογία** | `LossMap⟨structural: [ConflictNode], semantic: [AnchorFailure], obligations: [LostObligation], lattice: [LostCapability], completeness: {structural: THEOREM, semantic: LOWER_BOUND}, blocks_cutover: bool⟩`· `ConflictNode⟨K_element, side_a_rewrite, side_b_rewrite⟩`· `AnchorQuery⟨query, expected, cut⟩` (μονότονο σύνολο: ADD μόνο)· `AnchorFailure⟨query, got_a, got_b⟩` |
| **7. Κατάσταση** | AnchorSet (μονότονο, |AnchorSet(t+1)| ≥ |AnchorSet(t)|)· ιστορικό LossMaps |
| **8. Είσοδοι/έξοδοι** | Είσοδος: δύο εκδοχές (forks, P/S, old/new organ) + κοινός πρόγονος· Έξοδος: LossMap· `SEMANTIC-LOSS` σήμα που **μπλοκάρει cutover/merge** αν οποιοδήποτε μέρος μη κενό, μέχρι ρητή απόφαση (Court/δημιουργός) που **καταγράφει την απώλεια ως αποδεκτή** με τύχη στο Capability Conservation Ledger |
| **9. Αλγόριθμος** | (1) **Δομικό**: υπολογισμός pushout `A ← C → B` στο υπεργράφημα· για κάθε K-στοιχείο που επανεγγράφηκε διαφορετικά και στις δύο πλευρές → ConflictNode· (2) **Σημασιολογικό**: για κάθε AnchorQuery, εκτέλεση σε A και B στο ίδιο cut· διαφορά → AnchorFailure· (3) **Υποχρεώσεις**: `ObligationLedger(A) ∖ ObligationLedger(B)` (Goals, Both, OPEN voids που «χάθηκαν»)· (4) **Lattice**: `lattice(A) ∖ lattice(B)` με evidence· (5) **Απόφαση**: αν κάθε λίστα κενή → merge/cutover επιτρέπεται· αλλιώς SEMANTIC-LOSS → ο καλών επιλέγει: (i) διόρθωση B, (ii) ρητή αποδοχή με ledger entry (SUPERSEDED BY STRICTLY SUPERIOR απαιτεί κενές λίστες· αλλιώς μόνο PARETO-FORK ή REJECTED), (iii) Court· (6) **Μονοτονία anchors**: κάθε AnchorFailure που αποδείχθηκε πραγματική απώλεια γεννά νέο AnchorQuery (το σύνολο μαθαίνει)· (7) **Ετικέτα πληρότητας** στην έξοδο: «δομικό: πλήρες· σημασιολογικό: κάτω φράγμα με |AnchorSet| = n» |
| **10. Διεπαφές** | `SLM.map(A, B, ancestor)→LossMap` · `SLM.add_anchor(query, expected)` · `SLM.accept(lossmap, decision_cid)`· ICD-16 (ORP DifferentialReport = LossMap), GCP, fork compare (CGP) |
| **11. Εξαρτήσεις** | MFA-ALT-5 δομή (pushout), MFA-MECH-001 (obligations/lattice ως δεσμεύσεις), CAPABILITY-CONSERVATION.md (τύχες) |
| **12. Πόροι** | Pushout O(|diff|)· anchors O(|AnchorSet|)· φθηνό |
| **13. Κλιμάκωση** | Το AnchorSet μεγαλώνει με τις πραγματικές απώλειες — self-limiting |
| **14. Αποτυχίες** | Pushout που δεν υπάρχει καθόλου (ασύμβατες δομές, π.χ. άλλο metamodel) → ολόκληρη η δομή είναι ConflictNode → GCP replay (003) αντί για merge |
| **15. Αντιπαλικοί** | B που «περνά» anchors μαθαίνοντάς τα → anchors κρυφά και περιστρεφόμενα (held-out)· απώλεια που κρύβεται ως «ισοδύναμη αναδιατύπωση» → anchors συγκρίνουν σε κανονική μορφή (JCS), όχι σε κείμενο |
| **16. Επαλήθευση** | VO: 0 cutover/merge με μη κενό LossMap χωρίς accept record· mutation: seeded απώλεια (αφαίρεση ενός κανόνα/ικανότητας) πρέπει να εμφανιστεί (GCP §18)· VO: |AnchorSet| μονότονο |
| **17. Πρωτότυπο** | F1: pushout σε YAML-γράφο αυτού του πακέτου (δύο patches που αγγίζουν το ίδιο element)· F2: ORP δύο stubs |
| **18. Ελάχιστο πείραμα** | RDM-E4 (MFA-ALT-5): ποσοστό συγκρούσεων που εντοπίζονται vs χειροκίνητο diff — δομικό 100%, σημασιολογικό: αναφέρεται ως φράγμα |
| **19. Διάψευση** | Δομική σύγκρουση που το pushout δεν πιάνει → σφάλμα στη μοντελοποίηση του K (το «διατηρούμενο» δεν ήταν ρητό)· διορθώνεται η ρητότητα του K, ο μηχανισμός μένει |
| **20. → Παραγωγή** | Δόση 1 (patches του πακέτου), Δόση 2 (ORP) |
| **21. Εξέλιξη** | Νέος τύπος απώλειας (π.χ. χρονική: ίδιο αποτέλεσμα, άλλη διάρκεια) = ADD λίστας |
| **22. Αλληλεπιδράσεις** | Capability Conservation Ledger: κάθε αποδεκτή απώλεια είναι εγγραφή· Delta Ledger: «strictly superior» απαιτεί κενό LossMap· CGP· cockpit fork compare |

**AI Contribution Ledger:** `NEW FORMALISM` — διαχωρισμός δομικής απώλειας (θεώρημα pushout) από σημασιολογική (μονότονο κάτω φράγμα), με SEMANTIC-LOSS ως blocking σήμα. Συγγενή: three-way merge, schema diff, differential testing· κανένα δεν δηλώνει ποιο μέρος του χάρτη είναι πλήρες.
