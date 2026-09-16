# MFA-MECH-011 — Attention Fixed-Point Propagation (AFP): ο νόμος διάδοσης προσοχής με κριτήριο σύγκλισης

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-011 |
| **2. Όνομα** | Attention Fixed-Point Propagation |
| **3. Ικανότητα** | MFA-CAP-073· δίνει VOI/KL στα 039, 018· salience στο ICD-28 |
| **4. Πρόβλημα** | MATERIAL §9.2: η ύλη δίνει «εννέα πεδία, typed edges με διαφορετικούς kernels» χωρίς εξίσωση, κριτήριο σύγκλισης ή όριο επανάληψης — αδιευκρίνιστος μηχανισμός. CLAIMS F96: το Neural Luminescence με α=0,45, λ_max=8,238 (α·λ=3,71>1) δεν συγκλίνει — κάθε σπίθα δίνει την ιδιοδιανυσματική κεντρικότητα ανεξάρτητα από αφετηρία. CMP-COG-02 «budgeted salience» χωρίς νόμο. |
| **5. Πρώτη αρχή** | Η προσοχή είναι ακρίβεια (precision) πάνω σε σφάλμα πρόβλεψης σε ιεραρχία (MFA-ALT-3)· η διάδοσή της σε γράφο typed edges είναι γραμμική-ιοποιήσιμη ενημέρωση `a(t+1) = (I − κA) a(t) + b`, που συγκλίνει σε λύση εξαρτώμενη από την αφετηρία **αν και μόνο αν** `ρ(I − κA) < 1` — για συμμετρικό θετικά ημιορισμένο `A`: `0 < κ·λ_max(A) < 2`. Όριο επανάληψης `N = ⌈log(tol)/log(ρ)⌉`. |
| **6. Οντολογία** | `Field` (πεδίο προσοχής: διάνυσμα a ∈ ℝ^n πάνω σε κόμβους workspace)· `TypedEdge⟨kind, kernel_weight w_k, decay δ_k⟩` (kinds: lineage, contract, contradiction, temporal, stakes…)· `A = Σ_k w_k L_k` (σταθμισμένο άθροισμα Laplacians ανά kind)· `b` = εξωγενής είσοδος (νέα μαρτυρία × precision Π)· `κ` βήμα· `tol`, `N`· `Interrupt` (metacognitive) |
| **7. Κατάσταση** | Τρέχον `a`, `λ_max(A)` (επανυπολογίζεται σε αλλαγή γράφου, power iteration), μετρητής επαναλήψεων |
| **8. Είσοδοι/έξοδοι** | Είσοδος: γράφος workspace (typed edges), εξωγενής `b`, precision Π ανά κόμβο· Έξοδος: `a*` (salience ανά κόμβο) ή `Unknown(UNDECIDABLE_IN_BUDGET)` αν N ξεπεραστεί· `KL` ανά κόμβο (διαφορά prior/posterior προσοχής) ως επιστημική αξία για το void ledger |
| **9. Αλγόριθμος** | (1) Υπολογισμός `λ_max(A)` (power iteration, O(edges·iters))· (2) **Επιλογή κ** ώστε `κ·λ_max ≤ 1` (συντηρητικό, εγγυημένο ρ < 1)· (3) Επανάληψη `a ← (I − κA) a + b` μέχρι `‖a(t+1) − a(t)‖ < tol` ή `t = N`· (4) Στο `N`: **Interrupt** → η προσοχή παγώνει στο τρέχον `a`, καταγράφεται Unknown, το metacognition αποφασίζει (μείωση κ, περικοπή γράφου, ερώτηση)· (5) **Salience** = `Π ⊙ a*`· (6) **KL** = `D_KL(softmax(a_prior) ‖ softmax(a*))`· (7) **Decay**: `w_k ← w_k · (1 − δ_k)` ανά κύκλο για kinds που «ξεθωριάζουν» (temporal), ώστε παλιά μαρτυρία να μη μονοπωλεί· **INV**: `κ·λ_max < 1` ελέγχεται σε ΚΑΘΕ αλλαγή γράφου — παραβίαση = άρνηση της αλλαγής, όχι διάδοση |
| **10. Διεπαφές** | `AFP.propagate(graph, b, Π)→{a*, KL, iters}∣Unknown` · `AFP.spectral()→λ_max` · `AFP.set_kernels(w, δ)` (πολιτική PDP, όχι πυρήνας)· ICD-28 `Salience` = AFP output |
| **11. Εξαρτήσεις** | Workspace γράφος (CMP-COG-02), precision από αντίληψη/verifiers, MFA-MECH-005 για την απόφαση μετά από Interrupt |
| **12. Πόροι** | O(edges) ανά επανάληψη· N ≤ ~100 για tol 10⁻⁶ με ρ ≈ 0,87· sparse· laptop-εφικτό για 10⁴ κόμβους |
| **13. Κλιμάκωση** | Ανά matter/workspace· `λ_max` incremental (Lanczos) |
| **14. Αποτυχίες** | Γράφος που αλλάζει μέσα στην επανάληψη → snapshot ανά κύκλο· `A` μη συμμετρικό (κατευθυνόμενες ακμές) → χρήση `ρ(I−κA)` άμεσα (power iteration στον τελεστή), όχι λ_max |
| **15. Αντιπαλικοί** | Injection κόμβων με τεράστιο `b` (κατάληψη προσοχής) → `b` σταθμίζεται με Π που δίνει provenance (untrusted → χαμηλή Π)· «echo chamber» (ακμές που ενισχύονται μόνες τους) → decay + INV κ·λ_max |
| **16. Επαλήθευση** | VO: `κ·λ_max < 1` ανά κύκλο (μηχανικό)· VO: σύγκλιση σε ≤ N σε σφραγισμένο σύνολο· ablation: AFP vs ομοιόμορφη προσοχή στο KT-14· mutation: α·λ>1 πρέπει να προκαλεί Interrupt, ποτέ σιωπηλή «κεντρικότητα» |
| **17. Πρωτότυπο** | F1: numpy υλοποίηση σε γράφο 10⁴ κόμβων νομικών ισχυρισμών (από CCP-02 δομή)· F2: μέσα στο DST workspace |
| **18. Ελάχιστο πείραμα** | AIF-E1 (MFA-ALT-3): σύγκλιση, εξάρτηση από αφετηρία (δύο αφετηρίες → διαφορετικά a*), ablation kernels |
| **19. Διάψευση** | Αν η γραμμικοποίηση αποτυγχάνει (μη σύγκλιση με κ·λ<1) → η ενημέρωση δεν είναι γραμμικοποιήσιμη· ο νόμος ξαναγράφεται ως contraction mapping με άλλη νόρμα, και μέχρι τότε το ICD-28 φέρει το διάνυσμα χωρίς κανόνα (η θέση της σύνθεσης) |
| **20. → Παραγωγή** | Δόση 2 (workspace) |
| **21. Εξέλιξη** | Νέα kind ακμής = ADD με kernel και decay· η επιλογή κ = πολιτική |
| **22. Αλληλεπιδράσεις** | KL → void ledger VOI· salience → workspace broadcast· Interrupt → LPA/metacognition· ο ίδιος νόμος (`α·λ_max<1`) ισχύει για κάθε διάδοση ενεργοποίησης στο σύστημα (INV-C06 όπως ξαναγράφεται στο INVARIANTS.yaml) |

**AI Contribution Ledger:** `NEW ALGORITHM` (η εξίσωση με κριτήριο σύγκλισης, το Interrupt στο N, το decay ανά kind) πάνω σε `CORRECTED` υπόλειμμα (CLAIMS F96 έδωσε το θεώρημα Perron–Frobenius· η ύλη έδωσε τα typed kernels χωρίς εξίσωση).
