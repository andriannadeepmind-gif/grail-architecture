# MFA-MECH-002 — Void Ledger: το Unknown ως αντικείμενο με σχέδιο και αξία

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-002 |
| **2. Όνομα** | Void Ledger — μητρώο κενών γνώσης με σχέδιο παρατήρησης και αξία πληροφορίας |
| **3. Ικανότητα** | MFA-CAP-039· τροφοδοτεί 011 (scouts), 018 (βούληση), 031 (quests), 016 |
| **4. Πρόβλημα** | Το corpus έχει `Unknown` ως τιμή εξόδου (INV-C04) και `Absence` enum (6 τιμές)· δεν έχει **τι γίνεται μετά**: ποιος παρατηρεί, με τι κόστος, πόσο αξίζει, σε ποια εξαρτώμενα διαδίδεται. Η Perception.sysml έχει `UnknownRegion`/`EpistemicRiskScore` (αφαιρεμένα IDs) χωρίς μηχανισμό. Χωρίς αυτά, η «τίμια άγνοια» είναι τρύπα, όχι καύσιμο. |
| **5. Πρώτη αρχή** | Η άγνοια είναι απαίτηση παρατήρησης με τιμή· η τιμή = αναμενόμενη μείωση αβεβαιότητας σε αποφάσεις που εξαρτώνται από αυτήν (επιστημική αξία, MFA-ALT-3) επί το ύψος του διακυβεύματος, μείον το κόστος παρατήρησης. |
| **6. Οντολογία** | `Void⟨id, expected_type, reason ∈ {NO_EVIDENCE, NOT_OBSERVED, UNDECIDABLE_IN_BUDGET, CONTESTED, FORBIDDEN_BY_CONTROL, NOT_IDENTIFIABLE, NOT_IMPLEMENTED}, plan: ObservationPlan⟨method, source_class, cost, expected_gain, deadline⟩, VOI, dependents: [cid], owner, status ∈ {OPEN, SCHEDULED, OBSERVING, RESOLVED, SPLIT, EXPIRED}⟩`· τα Voids είναι δεσμεύσεις τύπου Unknown στο CC |
| **7. Κατάσταση** | Το σύνολο των OPEN voids με VOI· ουρά scouts· ιστορικό επιλύσεων (για βαθμονόμηση της εκτίμησης VOI) |
| **8. Είσοδοι/έξοδοι** | Είσοδος: κάθε `Unknown(reason)` που παράγει DERIVE/OBSERVE/verifier· αίτηση από Goal/Quest· Έξοδος: ObservationPlan προς scanner/scout, quest προς cockpit, Resolved/Split δεσμεύσεις, taint σε dependents όταν ένα void επιλύεται αντίθετα από την υπόθεση εργασίας |
| **9. Αλγόριθμοι** | (1) **Ταξινόμηση** reason από τον παραγωγό (υποχρεωτικό πεδίο)· (2) **VOI**: `VOI = stakes(dependents) · 𝔼[KL(q(s) ‖ q(s∣o))] − cost(plan)` με το KL από τον φλοιό (MFA-MECH-011) ή, όπου δεν υπάρχει μοντέλο, από ιστορικό επιλύσεων ίδιας κλάσης (empirical prior)· (3) **Σχεδιασμός**: ο πρώτος διαθέσιμος μέθοδος στη σειρά {ανάγνωση υπάρχουσας μαρτυρίας, ερώτηση Principal, scout σε εξουσιοδοτημένη πηγή, πείραμα (Science Organ), Court}· (4) **Διάδοση**: dependents λαμβάνουν ετικέτα `depends_on_void`· η επίλυση διαδίδεται με ATMS· (5) **Split**: void που επιλύεται εν μέρει γεννά παιδιά· (6) **Λήξη**: void με deadline περασμένη γίνεται Unknown(EXPIRED) — ορατό, όχι σιωπηλό |
| **10. Διεπαφές** | `Void.open(reason, expected_type, dependents)` · `Void.plan(id)→ObservationPlan` · `Void.resolve(id, cid)` · `Void.split(id, [children])` · `Void.top(k, by=VOI)` (για scouts/quests) · `Void.taint(id)` |
| **11. Εξαρτήσεις** | MFA-MECH-001 (τύπος Unknown)· MFA-MECH-011 (KL)· scanner (Perception.sysml ScoutingProtocol)· Control Records (FORBIDDEN_BY_CONTROL: το void υπάρχει, το plan είναι «ζήτα άνοιγμα Control») |
| **12. Πόροι** | O(voids)· η VOI επανυπολογίζεται lazily όταν αλλάζουν dependents ή stakes· scouts με budget από MFA-CAP-032 |
| **13. Κλιμάκωση** | Priority queue ανά VOI· voids ανά matter/οντότητα· τα δημόσια voids (νομοθεσία) κοινά μεταξύ οντοτήτων (G-Set) |
| **14. Αποτυχίες** | Void χωρίς plan → πύλη τύπου το απορρίπτει· VOI αβαθμονόμητη → μετριέται έναντι πραγματικών επιλύσεων (Brier του «expected_gain»)· έκρηξη voids → budget + συγχώνευση ίδιων expected_type |
| **15. Αντιπαλικοί** | Noisy-TV: πηγή που παράγει «νέα» αβεβαιότητα χωρίς μείωση → η VOI πέφτει σε 0 μετά από N παρατηρήσεις χωρίς μείωση KL (μετρημένο, όχι θεώρημα — EXP)· voids ως όχημα injection → το plan εκτελείται από scout με ετικέτα untrusted, ποτέ ως τελεστής |
| **16. Επαλήθευση** | INV: κάθε Unknown στο CC έχει void με plan (static)· VT: 0 voids OPEN πέρα από deadline χωρίς EXPIRED· βαθμονόμηση VOI (Brier ≤ κατώφλι)· ablation: σύστημα με/χωρίς VOI-οδηγούμενους scouts σε σφραγισμένο σύνολο |
| **17. Πρωτότυπο** | F1: σχήμα Void + VOI με empirical prior (χωρίς φλοιό)· F2: DST με seeded voids και scouts-stubs· F3: πραγματικοί scouts σε εξουσιοδοτημένες πηγές (ΦΕΚ, Areios Pagos) |
| **18. Ελάχιστο πείραμα** | 200 voids από πραγματικό matter set· δύο πολιτικές (VOI vs FIFO)· μετρική: μείωση Unknown-εξαρτώμενων παραδοτέων ανά μονάδα κόστους scouting |
| **19. Διάψευση** | VOI δεν υπερέχει του FIFO σε δύο ανεξάρτητα matter sets → η VOI παραμένει ως πεδίο αλλά παύει να οδηγεί· το void ledger επιβιώνει ως μητρώο (η δομή δεν εξαρτάται από τη VOI) |
| **20. → Παραγωγή** | F3 shadow πλάι στον υπάρχοντα `gap ledger` του LAWMAX-Ω (self-model.lisp) → cutover |
| **21. Εξέλιξη** | Νέοι reason codes με ADD (ανοιχτή απαρίθμηση, κανόνας: κάθε νέος code φέρει default plan)· νέοι μέθοδοι παρατήρησης ως όργανα με contract |
| **22. Αλληλεπιδράσεις** | Βούληση (004) καταναλώνει `top(k)`· cockpit δείχνει voids ως ομίχλη/κενά (008)· Science Organ παίρνει voids τύπου πείραμα· Court παίρνει CONTESTED |

**AI Contribution Ledger:** `NEW ARCHITECTURAL INVENTION` — η άγνοια ως αντικείμενο με reason/plan/VOI/dependents/λήξη. Συγγενή: active learning (VOI), belief-desire-intention «desires», open-world assumption σε KGs· κανένα δεν κάνει το Unknown ledger-πολίτη με σχέδιο και διάδοση taint.
