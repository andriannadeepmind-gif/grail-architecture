# MFA-MECH-019 — Proposal Distribution Evolution (PDE): η κατανομή προτάσεων ως μείγμα που μαθαίνεται εντός του κυρίαρχου ορίου

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-019 |
| **2. Όνομα** | Proposal Distribution Evolution (PDE) |
| **3. Ικανότητα** | MFA-CAP-067 (επινόηση ως έξοδος), MFA-CAP-066 (αυτο-κατευθυνόμενη μάθηση), MFA-CAP-068 (γενικευμένη κρίση), MFA-CAP-015, MFA-CAP-025 |
| **4. Πρόβλημα** | MFA-ATK-10: η αρχιτεκτονική δίνει θεσμική υπερ-νοημοσύνη (επαλήθευση, μνήμη, συλλογικό, εξέλιξη οργάνων) αλλά η ΚΑΤΑΝΟΜΗ ΠΡΟΤΑΣΕΩΝ είναι νοικιασμένη (πάροχοι LLM πίσω από TED)· επαλήθευση και αναζήτηση φράσσονται από ό,τι προτείνει ο πάροχος· κανένας μηχανισμός ενδογενούς βελτίωσης της πρότασης μέσα στο κυρίαρχο όριο (adapters = EP, DEC-X-19). |
| **5. Πρώτη αρχή** | Η ποιότητα ενός συστήματος που προτείνει-και-επαληθεύει φράσσεται από sup της κατανομής προτάσεων· ένα ΜΕΙΓΜΑ ανεξάρτητων γεννητριών με βάρη που μαθαίνονται με proper scoring έναντι εκβάσεων δεν φράσσεται από κανένα μεμονωμένο μέλος του (mixture-of-experts επιχείρημα, με τον verifier ως τον μόνο κριτή). Άρα: η κυρίαρχη κατανομή P_sov = Σ w_i · P_i, με P_i που ΔΕΝ είναι όλα πάροχοι. |
| **6. Οντολογία** | `Generator⟨id, kind ∈ {PROVIDER, PROGRAM, EVOLVED_ORGAN, SCIENCE_HYPOTHESIS, ADAPTER(EP)}, lineage, competence_profile, exec_type⟩` · `Mixture⟨task_family, weights: Generator→[0,1], scoring_window, last_update⟩` · `Proposal⟨generator, content, receipt⟩` · `Outcome⟨proposal, verdict ∈ {VERIFIED, REFUTED, UNKNOWN}, score⟩` |
| **7. Κατάσταση** | Μείγμα ανά οικογένεια έργων (task family)· βάρη ως δεσμεύσεις L2 (ιστορικό στο ledger)· scoring windows |
| **8. Είσοδοι/έξοδοι** | Είσοδος: αίτημα πρότασης ⟨task, budget⟩· Έξοδος: k προτάσεις με generator receipts· Ανατροφοδότηση: Outcome από verifiers/Court/SPL |
| **9. Αλγόριθμος** | (1) Για task family T, δειγματοληψία generators κατά w (με ελάχιστο εξερεύνησης ε ανά generator ώστε κανένα μέλος να μη «πεθαίνει» σιωπηλά)· (2) κάθε πρόταση περνά τον ίδιο verifier/emission barrier (MFA-ELM-020/032)· (3) Outcome → proper scoring rule (log/Brier) ανά generator, βαθμολογημένο από HELD_OUT scorer (MFA-ELM-056, ίδιο με SPL MFA-MECH-010)· (4) w ← ενημέρωση (exponentiated gradient / Bayesian model averaging) — ΩΣ ΔΕΣΜΕΥΣΗ με receipt· (5) PROGRAM generators: η Skill Library (MFA-ELM-025) παράγει προγράμματα από raw επεισόδια με αναζήτηση προγραμμάτων (MFA-CAP-066 ως ΠΡΟΓΡΑΜΜΑΤΑ, όχι βάρη — δεσμεύσεις με lineage, επαληθεύσιμα, υπό ORP)· (6) EVOLVED_ORGAN generators από το QD αρχείο (MFA-ELM-073)· (7) SCIENCE_HYPOTHESIS από MFA-ELM-030· (8) ADAPTER generators μόνο ως EP (DEC-X-19), μέλος (e) του μείγματος όταν ο δημιουργός το επιτρέψει. |
| **10. Διεπαφές** | `PDE.propose(task, budget)→[Proposal]` · `PDE.report(outcome)` · `PDE.weights(task_family)→Mixture` · `PDE.register(generator)` · επέκταση MFA-CON-022 (TED: ο generator είναι πεδίο του receipt) και MFA-CON-028 |
| **11. Εξαρτήσεις** | MFA-MECH-007 (TED), MFA-MECH-010 (SPL scorer), MFA-MECH-009 (EIM: generators ανεξάρτητοι), MFA-MECH-012 (CAM-NS ως αντίπαλος generator), MFA-ELM-025/030/073/017 |
| **12. Πόροι** | k προτάσεις ανά αίτημα (k από OAP)· PROGRAM generators φθηνοί (D1/D2)· PROVIDER generators = Disclose κόστος· scoring O(k) |
| **13. Κλιμάκωση** | Γραμμική στο πλήθος generators· ε-εξερεύνηση φράσσει το κόστος των αδύναμων |
| **14. Αποτυχίες** | Το μείγμα συγκλίνει στον πάροχο (w_provider→1): τότε ο falsifier πυροδοτεί· αδύναμος PROGRAM generator «πεθαίνει»: ε-εξερεύνηση + ORP απόσυρση με KT· scorer διαρροή: HELD_OUT rotation |
| **15. Αντιπαλικοί** | Generator που μαθαίνει τον verifier (Goodhart): scorer HELD_OUT με sealed sets + CAM-NS negative selection· πάροχος που αλλάζει μοντέλο: SPL drift alarm ανά generator |
| **16. Επαλήθευση** | MFA-VO-024 (ablation: χωρίς PDE, η ποιότητα = καλύτερος μεμονωμένος πάροχος)· MFA-VO-051 (διακριτική ισχύς του περιθωρίου)· MFA-VO-036 (SPL drift ανά generator)· νέο πείραμα PDE-E1 (RSP-016) |
| **17. Πρωτότυπο** | F2: 3 generators (1 πάροχος, 1 PROGRAM από Skill Library, 1 CAM-NS) σε σφραγισμένη οικογένεια νομικών έργων· F3: + EVOLVED_ORGAN |
| **18. Ελάχιστο πείραμα** | PDE-E1: σφραγισμένη οικογένεια 200 έργων (HELD_OUT)· μείγμα vs καλύτερος μεμονωμένος πάροχος μετά από N=1000 επεισόδια· μέτρο: ποσοστό VERIFIED εξόδων στην πρώτη πρόταση, με διακριτική ισχύ |
| **19. Διάψευση** | Αν σε ΚΑΜΙΑ οικογένεια έργων το μείγμα δεν ξεπερνά τον καλύτερο μεμονωμένο πάροχο με διακριτικό περιθώριο μετά από N επεισόδια → το PDE είναι διακοσμητικό → RECLASSIFY σε έρευνα· η τίμια δήλωση: η νοημοσύνη του συστήματος = η νοημοσύνη του παρόχου + επαλήθευση |
| **20. → Παραγωγή** | Δόση 4 (RSP-016)· PROGRAM generators μπορούν από Δόση 2 (Skill Library) |
| **21. Εξέλιξη** | Νέο kind generator = ADD· κανόνας ενημέρωσης βαρών = MODIFY με CPEG· adapters (e) όταν DEC-X-19 αλλάξει |
| **22. Αλληλεπιδράσεις** | SPL (ίδιος scorer)· OAP (k και budget)· Cockpit (τα βάρη ορατά ως ομίχλη/στερεότητα ανά generator)· CAM-NS (αντίπαλος generator)· GCP (τα βάρη μεταφέρονται ως δεσμεύσεις στον διάδοχο) |

**AI Contribution Ledger:** `NEW ARCHITECTURAL INVENTION` — η κατανομή προτάσεων ως μείγμα μη-παρόχων (προγράμματα με lineage, εξελιγμένα όργανα, υποθέσεις) με βάρη-δεσμεύσεις βαθμολογούμενα από HELD_OUT scorer· συγγενή προηγούμενα: mixture-of-experts, Bayesian model averaging, AlphaEvolve/DGM archives, program synthesis from demonstrations — κανένα με τον verifier ως μόνο κριτή και τα βάρη ως θεσμικές δεσμεύσεις. Προέκυψε από την ισχυρότερη επιζώσα επίθεση (MFA-ATK-10)· ωριμότητα R· ΔΕΝ εγγυάται υπερ-νοημοσύνη — εγγυάται ότι η πρόταση δεν φράσσεται από έναν πάροχο και ότι ο ισχυρισμός είναι διαψεύσιμος.
