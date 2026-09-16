# MFA-MECH-005 — Lexicographic Polycentric Arbitration (LPA): διαιτησία χωρίς κρυφό βαθμωτό

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-005 |
| **2. Όνομα** | Lexicographic Polycentric Arbitration |
| **3. Ικανότητα** | MFA-CAP-049· χρησιμοποιείται από 018, 021, 006 (gate verdict διάνυσμα) |
| **4. Πρόβλημα** | AEO-APEX: 10 governors, Pareto μέτωπο, «απαγόρευση πρόωρης βαθμωτής κατάρρευσης» — αλλά **δεν λέει ποιος κανόνας διαλέγει** (MATERIAL §9.1)· τα βάρη (D14 = 3/4) εμπειρικά· MATERIAL §7 #2 FAILS («καταργεί την ανάγκη alignment»): οι governors μοιράζονται substrate, η ανεξαρτησία τους δεν ισχύει. Το Gate Verdict του corpus (ICD-06) είναι δυαδικό. Ένα Pareto μέτωπο χωρίς κανόνα επιλογής δεν αποφασίζει ή καταρρέει σιωπηλά σε ό,τι κρατά την τελευταία πύλη. |
| **5. Πρώτη αρχή** | Δικαιώματα δεν ανταλλάσσονται με ταχύτητα, κόστος ή βεβαιότητα· άρα οι governors που φυλούν δικαιώματα είναι **veto** (περικόπτουν), όχι όροι σε άθροισμα. Μόνο μέσα στο εναπομείναν εφικτό σύνολο επιτρέπεται στάθμιση — ονομασμένη, φραγμένη, με δηλωμένα βάρη — και μόνο για tie-break regret. |
| **6. Οντολογία** | `Governor⟨id, class ∈ {VETO, ORDER, WEIGHT}, stops: predicate, cannot: predicate, budget, lineage⟩`· τάξεις: VETO (Legal/Deontic όπου η πηγή έχει ισχύ, Identity, OwnerIntent, Tier-0 INV, Control Records)· ORDER (λεξικογραφική σειρά μεταξύ VETO όταν συγκρούονται: Tier-0 > Control > Identity > Legal > OwnerIntent — **προτεινόμενη**, απόφαση δημιουργού)· WEIGHT (κόστος, χρόνος, βεβαιότητα, ποιότητα — μόνο μέσα στο μέτωπο)· `Decision⟨options, vector_per_option, pruning_trace, chosen, regret⟩`· `Verdict` (διάνυσμα, όχι bit) |
| **7. Κατάσταση** | Μητρώο governors (δεσμεύσεις επιπέδου 2)· ιστορικό αποφάσεων με ίχνος περικοπής· βαθμονόμηση βαρών (μόνο WEIGHT) |
| **8. Είσοδοι/έξοδοι** | Είσοδος: σύνολο επιλογών + διάνυσμα κριτηρίων ανά επιλογή (από τα όργανα)· Έξοδος: `Decision` με ίχνος: ποια επιλογή κόπηκε από ποιο veto, ποιο μέτωπο έμεινε, ποιο βάρος έκρινε, regret |
| **9. Αλγόριθμος** | (1) **Veto pass**: για κάθε VETO governor `g` σε σειρά ORDER: `options ← {o : ¬g.stops(o)}`· αν κενό → `Unknown(CONTESTED)` + Court (όχι «η καλύτερη κακή»)· (2) **Pareto**: υπολογισμός μη κυριαρχούμενων στο διάνυσμα WEIGHT· (3) **Scalarization** μόνο αν |front| > 1 και η απόφαση είναι **ονομασμένη** (τύπος με δηλωμένα βάρη στο Constitution)· αλλιώς **επιστρέφεται το μέτωπο** (διανυσματική ετυμηγορία — ο καλών αποφασίζει ή ρωτά)· (4) **Tie-break**: ελάχιστο max-regret ως προς τα δηλωμένα βάρη· (5) Κάθε βήμα καταγράφεται· **κανένα βήμα δεν μπορεί να «ξαναβάλει» επιλογή που κόπηκε από veto** (μονοτονία περικοπής, ελέγξιμη). Το `cannot` κάθε governor: τι ΔΕΝ μπορεί να κάνει (π.χ. Legal δεν μπορεί να προσθέσει επιλογή, Cost δεν μπορεί να κόψει) — ώστε κανείς να μην έχει καθολικό veto. |
| **10. Διεπαφές** | `LPA.decide(options, vectors, decision_type)→Decision` · `LPA.register(governor)` (επίπεδο 2, Court) · `LPA.explain(decision)→pruning_trace`· Gate Verdict = `Decision` με options {allow, deny, unknown} → ICD-06 από δυαδικό σε διανυσματικό |
| **11. Εξαρτήσεις** | Constitution (τύποι ονομασμένων αποφάσεων + βάρη)· Control Records (VETO)· MFA-MECH-009 (μετρημένη ανεξαρτησία governors — απάντηση στο §7 #2) |
| **12. Πόροι** | O(|governors| · |options|)· κάθε governor έχει budget (MATERIAL §9.8)· εξάντληση governor = ο governor απέχει με ρητή σήμανση, ποτέ σιωπηλό «allow» |
| **13. Κλιμάκωση** | Governors προστίθενται με ADD· η σειρά ORDER αλλάζει μόνο με Court + δημιουργό |
| **14. Αποτυχίες** | Όλα κομμένα → CONTESTED/Court (τιμιότερο από «λιγότερο κακό»)· βάρη αβαθμονόμητα → μόνο tie-break, ποτέ επιλογή· governor που «κοιμάται» → budget receipt δείχνει αποχή |
| **15. Αντιπαλικοί** | Κατάληψη governor → KT-19· συμπαιγνία governors → ανεξαρτησία μετρημένη (009), γενεαλογική απόσταση· option-injection (πλαστές επιλογές) → επιλογές ως δεσμεύσεις με εξουσία |
| **16. Επαλήθευση** | INV: 0 αποφάσεις όπου veto-κομμένη επιλογή επελέγη· INV: 0 scalarization σε μη ονομασμένη απόφαση· VT: mutation — αλλάζω βάρη, καμία veto-απόφαση δεν αλλάζει· KT-19 |
| **17. Πρωτότυπο** | F1: Lean spec της μονοτονίας περικοπής· F2: Rust/Lisp LPA με 5 governors σε DST (Gate verdicts) |
| **18. Ελάχιστο πείραμα** | 10⁴ συνθετικές αποφάσεις με σκληρά veto γνωστά: LPA vs σταθμισμένο άθροισμα· μετρική: ποσοστό παραβιάσεων veto (LPA πρέπει 0, άθροισμα > 0) |
| **19. Διάψευση** | LPA με 1 παραβίαση veto → σφάλμα υλοποίησης· αν το Pareto μέτωπο είναι συστηματικά > 1 και ο καλών δεν μπορεί να αποφασίσει → χρειάζονται περισσότερες ονομασμένες αποφάσεις (Constitution), όχι κρυφός βαθμωτός |
| **20. → Παραγωγή** | Gate (KRN-06) πρώτα· μετά βούληση, Court panel, Organ Activation Planner |
| **21. Εξέλιξη** | Νέος governor = ADD με `stops/cannot/budget/lineage`, αρνητική επιλογή (MFA-MECH-012): δεν «δεσμεύει» το Telos |
| **22. Αλληλεπιδράσεις** | Το διάνυσμα ετυμηγορίας πάει στο cockpit ως ίχνος περικοπής (εξήγηση MFA-CAP-069)· StatusVector 10-αξόνων (Contracts.sysml) είναι είσοδος |

**AI Contribution Ledger:** `NEW ALGORITHM` — λεξικογραφική περικοπή με τυποποιημένο `stops/cannot` ανά governor, διανυσματική ετυμηγορία, scalarization μόνο για ονομασμένες αποφάσεις, μονοτονία περικοπής ως INV. Συγγενή: lexicographic optimization, constraint-then-optimize, Pareto MCDM· η ύλη έδωσε governors+μέτωπο, όχι τον κανόνα.
