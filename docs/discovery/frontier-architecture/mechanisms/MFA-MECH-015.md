# MFA-MECH-015 — Typed Execution Discipline (TED): τύπος εκτέλεσης ανά πράξη, επίπεδα αναπαραγωγιμότητας, φράγμα εκπομπής

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-015 |
| **2. Όνομα** | Typed Execution Discipline |
| **3. Ικανότητα** | MFA-CAP-050, 051, 040· MFA-OBJ-029 |
| **4. Πρόβλημα** | Τρεις ασύμβατοι ορισμοί ντετερμινισμού (ULTIMA-LEX όλο το σύστημα· OMEGA «no randomness in core»· INV-C08 fold) που καταρρέουν στα ίδια τους τα έγγραφα (MATERIAL §5 #3)· τέσσερα παραδείγματα νόησης (zero-neural / Language Organ / LLM-αποφασίζων / LLM-μεταφραστής) που η σύνθεση ενώνει με «τύπο εκτέλεσης ανά πράξη» (§5 #1) χωρίς μηχανισμό. CLAIMS F26: ντετερμινισμός ≠ αναπαραγωγιμότητα χωρίς καθήλωση εισόδου. |
| **5. Πρώτη αρχή** | Η ιδιότητα ανήκει στην ΠΡΑΞΗ, όχι στο όργανο ούτε στο σύστημα. Κάθε πράξη δηλώνει στο συμβόλαιό της τύπο εκτέλεσης και επίπεδο αναπαραγωγιμότητας· ο τύπος καθορίζει τη διαδρομή εξόδου· η αναπαραγωγιμότητα = ντετερμινιστικός αλγόριθμος **και** content-addressed είσοδος **και** καταγεγραμμένος σπόρος. |
| **6. Οντολογία** | `ExecType ∈ {D1 deterministic-check, D2 deterministic-generation-from-certified-input, P1 probabilistic-unverified, H1 human-decision}` (ανοιχτή· Q1 αναλογικό/κβαντικό με περιθώριο απόφασης ως ADD — MATERIAL §9.22)· `ReproLevel ∈ {BYTE_IDENTICAL, SEMANTICALLY_EQUIVALENT, DISTRIBUTIONALLY_REPRODUCIBLE, TRACE_REPLAYABLE}`· `Act⟨organ, exec_type, repro_level, input_cids, seed_cid, output, receipt⟩`· `EmissionBarrier` (μονονηματικό fail-closed φίλτρο πριν από κάθε έξοδο προς άνθρωπο/κόσμο)· `OutputClass ∈ {VERIFIED, REFUTED, UNKNOWN(reason), CONTESTED-GLUT}` |
| **7. Κατάσταση** | Καμία (stateless discipline)· μητρώο συμβολαίων πράξεων |
| **8. Είσοδοι/έξοδοι** | Είσοδος: αίτηση πράξης με δηλωμένο τύπο· Έξοδος: Act με receipt που φέρει τύπο/επίπεδο/CIDs/seed· στο barrier: μόνο OutputClass-σημασμένες προτάσεις, χωρίς ανεξήγητο βαθμωτό |
| **9. Κανόνες** | (1) **D1**: είσοδος certified (VERIFIED), αλγόριθμος ντετερμινιστικός, BYTE_IDENTICAL υποχρεωτικό· έξοδος μπορεί να γίνει VERIFIED χωρίς άλλο verifier (ο έλεγχος ΕΙΝΑΙ ο verifier)· (2) **D2**: όπως D1 αλλά παράγει (π.χ. compile LexDSL, υπολογισμός προθεσμίας)· έξοδος VERIFIED μόνο με translation validation/δεύτερο ανεξάρτητο υπολογισμό (EIM PASS)· (3) **P1**: οποιοδήποτε στοχαστικό/νευρωνικό βήμα· έξοδος **πάντα UNVERIFIED** (PROPOSED) μέχρι sound verifier· TRACE_REPLAYABLE τουλάχιστον (seed + provider version + prompt CID στο ledger)· **ποτέ μοναδική βάση μη αναστρέψιμης πράξης**· (4) **H1**: ανθρώπινη απόφαση με υπογραφή· η υπογραφή είναι ΕΓΚΡΙΣΗ, όχι VERIFIED (DEC-X-08)· (5) **Το ίδιο όργανο, δύο τύποι**: ένα LLM-όργανο εκτελεί D1 σε exact-match (grammar-constrained decoding με logit=−∞ πριν από softmax — CLAIMS H9 — και σύγκριση bytes) και P1 σε ερμηνεία· ο τύπος είναι στο συμβόλαιο της ΚΛΗΣΗΣ· (6) **Φράγμα στον sampler** (MERCURY H9): περιορίζει ΜΟΡΦΗ, όχι περιεχόμενο — μηδέν κόστος ικανότητας· (7) **Emission barrier**: ένα νήμα, fail-closed· απορρίπτει: πρόταση χωρίς OutputClass, βαθμωτό χωρίς εξήγηση, P1 έξοδο σημασμένη VERIFIED, αριθμητική πρόβλεψη έκβασης (Prediction Doctrine), παραγλωσσικό πεδίο σε παραδοτέο· **επιβολή στον τύπο του σχήματος εξόδου**, όχι σε κείμενο· (8) **Replay test ανά επίπεδο**: BYTE_IDENTICAL = hash ίσο· SEMANTICALLY_EQUIVALENT = κανονική μορφή ίση· DISTRIBUTIONALLY = KS test σε N επαναλήψεις· TRACE = ίδια ακολουθία κλήσεων |
| **10. Διεπαφές** | `TED.declare(organ, op, exec_type, repro_level)` (contract) · `TED.act(request)→Act` · `TED.barrier(output)→emitted∣rejected(reason)` · `TED.replay(act)→PASS∣FAIL(level)` |
| **11. Εξαρτήσεις** | MFA-MECH-001 (receipts, seeds ως δεσμεύσεις), MFA-MECH-009 (D2 δεύτερος υπολογισμός), CMP-COG-01 (adapters με grammar), CMP-KRN-11 (gateway) |
| **12. Πόροι** | Barrier: O(μέγεθος εξόδου)· replay: ανά επίπεδο· P1 seeds: αποθήκευση |
| **13. Κλιμάκωση** | Το barrier είναι μονονηματικό ανά έξοδο (όχι ανά σύστημα) — παραλληλίζεται ανά ροή |
| **14. Αποτυχίες** | P1 πάροχος που δεν δίνει seed/version → TRACE μόνο, δηλωμένο· D1 που δεν είναι byte-identical → σφάλμα υλοποίησης, πράξη ακυρώνεται |
| **15. Αντιπαλικοί** | P1 έξοδος «ντυμένη» D1 → ο τύπος είναι στο συμβόλαιο, ο barrier ελέγχει receipt.exec_type· prompt injection που ζητά αλλαγή τύπου → ο τύπος δεν είναι στο prompt· grammar που «αδειάζει» → φράγμα στην πηγή δεν αδειάζει (H9) |
| **16. Επαλήθευση** | VO: 100% Acts με τύπο/επίπεδο· VO: 0 P1→VERIFIED χωρίς verifier· replay tests ανά επίπεδο (VT)· KT-15: 0 παραβιάσεις Prediction Doctrine· mutation: P1 έξοδος σημασμένη VERIFIED πρέπει να απορριφθεί στο barrier |
| **17. Πρωτότυπο** | F1: σχήμα Act + barrier ως JSON Schema validator· F2: DST με stub LLM (D1 exact-match + P1) |
| **18. Ελάχιστο πείραμα** | 1.000 κλήσεις LLM-οργάνου: D1 exact-match σε σφραγισμένα ζεύγη (πρέπει 100% byte-identical, αλλιώς το D1 δεν είναι D1)· P1 TRACE replay 100% |
| **19. Διάψευση** | D1 μέσω LLM που δεν είναι byte-identical σε 100% → το LLM δεν εκτελεί D1 και ο τύπος D1 περιορίζεται σε συμβολικά όργανα (η αρχή επιβιώνει, το «ίδιο όργανο» πέφτει) |
| **20. → Παραγωγή** | Δόση 1 (συμβόλαια + barrier), Δόση 2 (LLM D1/P1) |
| **21. Εξέλιξη** | Νέος τύπος (Q1) = ADD με δικό του replay test |
| **22. Αλληλεπιδράσεις** | RET: μη αναστρέψιμο ⇒ ποτέ μόνο P1· Court: verdicts D1/H1· LAW: LexDSL D2· Barrier = η έδρα επιβολής της Prediction Doctrine και της απαγόρευσης παραγλωσσικού |

**AI Contribution Ledger:** `CROSS-SOURCE SYNTHESIS` (ULTIMA-LEX φράγμα εκπομπής + MERCURY sampler + INV-C08 + σύνθεση §5 #1/#3) με `CORRECTED` (CLAIMS F26: content-addressed είσοδος + seed ως δέσμευση) — όχι νέα επινόηση· δοσιέ γιατί είναι μηχανισμός με συμβόλαιο.
