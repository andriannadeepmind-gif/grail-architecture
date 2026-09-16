# MFA-MECH-004 — Telos-Bounded Endogenous Goal Formation (TEGF): η βούληση ως δεσμεύσεις υπό εισδοχή

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-004 |
| **2. Όνομα** | Telos-Bounded Endogenous Goal Formation |
| **3. Ικανότητα** | MFA-CAP-018· χρησιμοποιεί 039, 006, 049, 017 |
| **4. Πρόβλημα** | Η ύλη (ΝΙΚΗ Ω, omega-core) έχει «κινητήρα ΕΙΜΙ→ΘΕΛΩ» με βαθμωτή ένταση `0,5 + f(μέγεθος μνήμης) + ημίτονο` που χακάρεται τετριμμένα (MATERIAL §4)· το CLAIMS-VERDICT (OMEGA-DOCS «παράγει στόχο χωρίς εξωτερικό ερέθισμα») FAILS. Το corpus δεν έχει καθόλου έδρα βούλησης. Η εντολή §11 ζητά endogenous goal formation. Κανένα δημόσιο σύστημα δεν δένει ενδογενείς στόχους σε αμετάβλητο Telos με πύλη εισδοχής και αναστρέψιμη άδεια. |
| **5. Πρώτη αρχή** | Ένας στόχος είναι δέσμευση για μελλοντική δέσμευση· άρα υπόκειται στην ίδια εισδοχή (falsifier), στην ίδια εξουσία (grant) και στον ίδιο χάρτη απώλειας με κάθε ισχυρισμό. Το «θέλω» που δεν μπορεί να πει τι θα το διέψευδε δεν είναι θέληση, είναι θόρυβος. Η ένταση είναι διάνυσμα (επιστημική, πραγματιστική, κόστος, δέσμευση), όχι βαθμωτό. |
| **6. Οντολογία** | `Goal⟨id, statement, falsifier, telos_link: [T-ids], gap: Vector⟨epistemic, pragmatic, cost, commitment⟩, plan: [Effect∣Observation∣Derive], grant_needed: AutonomyGrant∣H1, status⟩`· `SelfState` (ΕΙΜΙ: posterior του φλοιού + ObligationLedger + lattice)· `TelosPrior` (ΘΕΛΩ: επίπεδο 3, read-only)· `GapField` = διαφορές SelfState↔TelosPrior ανά T (μετρήσεις Instruments.sysml) |
| **7. Κατάσταση** | Μηχανή 10 καταστάσεων: `DORMANT → SENSING → GAP_DETECTED → CANDIDATE → ADMITTED → GRANTED → ACTING → REVIEW → {RETIRED ∣ BLOCKED}`· BLOCKED = grant αρνήθηκε ή INV παραβίαση προβλεπόμενη· κάθε μετάβαση = δέσμευση τύπου Goal-transition |
| **8. Είσοδοι/έξοδοι** | Είσοδος: GapField (μετρήσεις T1…T9 vs βάση), `Void.top(k)` (MFA-MECH-002), quests του δημιουργού (εξωγενείς, ίδιος τύπος), ObligationLedger· Έξοδος: Goals ως δεσμεύσεις, αιτήσεις AutonomyGrant, σχέδια προς Effect plane |
| **9. Αλγόριθμος** | (1) **SENSING**: υπολογισμός GapField ανά T (π.χ. T6: ποσοστό Unknown-εξαρτώμενων παραδοτέων· T7: KT-15 ratchet απόσταση)· (2) **GAP_DETECTED**: αν κάποιο gap > κατώφλι πολιτικής (PDP, όχι πυρήνας)· (3) **CANDIDATE**: παραγωγή υποψήφιων Goals με `G(π) = epistemic + pragmatic` (EFE, MFA-MECH-011): `epistemic = 𝔼[KL]` από voids, `pragmatic = −log p(o∣TelosPrior)` = μείωση gap· ταξινόμηση λεξικογραφική από LPA (MFA-MECH-005): σκληρά veto πρώτα (INV, Control Records), μετά Pareto στο διάνυσμα, tie-break regret· (4) **ADMITTED**: `CC.ASSERT(Goal)` απαιτεί falsifier — Goal χωρίς «τι θα με έκανε να τον εγκαταλείψω» απορρίπτεται στον τύπο· (5) **GRANTED**: αίτηση AutonomyGrant: `reversible(plan) ∧ FE<θ ∧ predicted_INV_violations = 0 ∧ ¬Root ∧ (Court verdict αν stakes > κατώφλι)`· αλλιώς H1 (ερώτηση στον δημιουργό — ο στόχος ΔΕΝ πεθαίνει, περιμένει)· (6) **ACTING**: εκτέλεση μέσω RET (MFA-MECH-006)· (7) **REVIEW**: μέτρηση: μειώθηκε το gap; ενεργοποιήθηκε ο falsifier;· (8) **RETIRED** με receipt και μάθημα (Observation) |
| **10. Διεπαφές** | `TEGF.sense()→GapField` · `TEGF.candidates(k)` · `TEGF.admit(goal)` · `TEGF.request_grant(goal)` · `TEGF.review(goal)`· contract: κανένα Goal δεν γράφει σε Schema-L3· κανένα Goal δεν αλλάζει κατώφλια πολιτικής (αυτό είναι Goal «ζήτα από τον δημιουργό») |
| **11. Εξαρτήσεις** | MFA-MECH-001/002/005/006/011, Instruments.sysml (μετρήσεις T), Autonomy.sysml (AutonomyGrant, NoActWithoutAnswer) |
| **12. Πόροι** | SENSING περιοδικό (πολιτική)· CANDIDATE budget ανά κύκλο· κάθε Goal φέρει budget· εξάντληση = BLOCKED, όχι σιωπή |
| **13. Κλιμάκωση** | Goals ανά οντότητα· κοινοί στόχοι μέσω Coordination Market με budgets |
| **14. Αποτυχίες** | Gap που δεν κλείνει ποτέ → REVIEW παράγει void «γιατί» (MFA-MECH-002)· ταλάντωση στόχων → hysteresis στο κατώφλι + κόστος αλλαγής στο διάνυσμα |
| **15. Αντιπαλικοί** | Reward hacking της μέτρησης T → οι μετρήσεις από held-out Πολιτισμό, κρυφά σύνολα (MFA-MECH-018)· noisy-TV → EXP με null (MFA-ALT-3 AIF-E3)· Goal που «ζητά» επέκταση εξουσίας → μόνο ως H1, ποτέ grant· wireheading (στόχος = αλλαγή του μετρητή) → ο μετρητής είναι εκτός microVM |
| **16. Επαλήθευση** | INV: 0 Goals ACTING χωρίς grant ή H1· INV: 0 Goals με telos_link κενό· μετρική: ποσοστό ενδογενών Goals που πέρασαν εισδοχή, ποσοστό που μείωσαν gap, ποσοστό falsifiers που ενεργοποιήθηκαν (πρέπει > 0, αλλιώς οι falsifiers είναι κόσμημα) |
| **17. Πρωτότυπο** | F2: TEGF πάνω σε DST με τεχνητό GapField· F3: πάνω στο void ledger πραγματικού matter set, μόνο Goals τύπου Observation (χωρίς effects) |
| **18. Ελάχιστο πείραμα** | 1.000 κύκλοι: TEGF vs τυχαία επιλογή voids vs FIFO· μετρική: VOI-σταθμισμένη μείωση άγνοιας ανά budget· null: καμία διαφορά |
| **19. Διάψευση** | Καμία διαφορά από FIFO σε δύο ανεξάρτητα σύνολα → η EFE-ταξινόμηση δεν προσθέτει· η μηχανή καταστάσεων και η εισδοχή επιβιώνουν (δεν εξαρτώνται από την ταξινόμηση) |
| **20. → Παραγωγή** | Goals τύπου Observation πρώτα (F3)· Goals με Effects μόνο μετά από KT-20 drill στη Δόση του RET |
| **21. Εξέλιξη** | Νέοι τύποι gap (νέο T) με ADD· η συνάρτηση ταξινόμησης είναι πολιτική (PDP) — αλλάζει με patch, όχι με αυτο-τροποποίηση |
| **22. Αλληλεπιδράσεις** | Cockpit: quests του δημιουργού είναι Goals με `origin: creator`· Science Organ: Goals τύπου πείραμα· Court: Goals με stakes· Self-model (MFA-MECH-010): προβλέπει ποιοι στόχοι θα RETIRED επιτυχώς |

**AI Contribution Ledger:** `NEW ARCHITECTURAL INVENTION` — στόχος = δέσμευση υπό εισδοχή με falsifier, διανυσματικό χάσμα από EFE, grant ως προϋπόθεση δράσης, Telos read-only. Συγγενή: BDI (desires→intentions), intrinsic motivation (curiosity), EFE agents· κανένα δεν απαιτεί falsifier στον στόχο ούτε δένει τη δράση σε αναστρέψιμη άδεια.
