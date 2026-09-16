# MFA-MECH-010 — Self-Prediction Ledger (SPL): το αυτο-μοντέλο ως ρεύμα ελέγξιμων προβλέψεων

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-010 |
| **2. Όνομα** | Self-Prediction Ledger |
| **3. Ικανότητα** | MFA-CAP-017· στηρίζει 016, 065, 004 (Battery trigger) |
| **4. Πρόβλημα** | Το CMP-COG-08 έχει «self-model» ως περιγραφή ικανοτήτων από το registry· η ύλη (OMEGA «consciousness», AEO-APEX self-modelling) έχει αυτο-αναφορά χωρίς μέτρηση· CLAIMS F92/F93: ανιχνευτές «συνείδησης» που αγνοούν την είσοδό τους. MATERIAL §7 #10: αυτο-βαθμονόμηση σε Ghost Worlds είναι self-consistency, όχι calibration. Κανένα σύστημα δεν κρατά το αυτο-μοντέλο του ως προβλέψεις που βαθμολογούνται με proper scoring rule έναντι πραγματικών εξόδων. |
| **5. Πρώτη αρχή** | Αυτογνωσία = προβλεπτική ακρίβεια για τον εαυτό. Το σύστημα δηλώνει εκ των προτέρων τι θα κάνει, πόσο θα κοστίσει, πού θα αποτύχει, τι ικανότητα έχει — και βαθμολογείται με Brier/log-score όταν συμβεί. Η απόκλιση είναι drift, όχι γνώμη. |
| **6. Οντολογία** | `SelfPrediction⟨id, subject ∈ {behaviour, resource, failure, capability, goal_outcome, latency}, target: ElementID∣GoalID, prediction: distribution, horizon, issued_at, resolved_at, outcome, score⟩` (δέσμευση τύπου SelfPrediction στο CC)· `SelfModel` = το σύνολο των ανοιχτών SelfPredictions + οι παράμετροι που τις παράγουν (στο Genesis plane)· `FidelityIndex` ανά subject (rolling Brier)· `DriftAlarm` |
| **7. Κατάσταση** | Ανοιχτές προβλέψεις, ιστορικό scores, FidelityIndex ανά subject/Tier, alarms |
| **8. Είσοδοι/έξοδοι** | Είσοδος: κάθε Goal (TEGF) και κάθε EffectTx πρέπει να συνοδεύεται από SelfPrediction (κόστος, επιτυχία, πιθανές αποτυχίες)· περιοδικές προβλέψεις ικανοτήτων (πριν από Battery/KT)· Έξοδος: scores, FidelityIndex, DriftAlarm → Battery (CMP-AEO-05), Calibration gates (COG-08) |
| **9. Αλγόριθμος** | (1) **Έκδοση**: το Genesis plane παράγει κατανομή (όχι σημείο)· η δέσμευση υπογράφεται ΠΡΙΝ από το γεγονός (t_known < t_event, ελέγξιμο)· (2) **Επίλυση**: όταν το outcome γίνει δέσμευση (receipt, KT result, Goal RETIRED), ο SPL το ζευγαρώνει (εκτός microVM — ο κριτής απρόσιτος από τον κρινόμενο)· (3) **Score**: Brier (πολυκλασικό) ή log-score· (4) **FidelityIndex** = rolling μέσος ανά subject με παράθυρο· (5) **Drift**: αν FidelityIndex πέσει κάτω από threshold_Tier ή αν η reliability curve αποκλίνει (ECE > ε) → DriftAlarm → Battery + πάγωμα AutonomyGrants που εξαρτώνται από self-model (πολιτική)· (6) **Discriminative-power test** (CLAIMS F93): κάθε νέο subject πρέπει να δείξει διαφορετικές προβλέψεις για δύο διαφορετικές εισόδους, αλλιώς δεν είναι πρόβλεψη· (7) **Μετα-πρόβλεψη**: το σύστημα προβλέπει και τον δικό του FidelityIndex (δεύτερης τάξης) — ένα επίπεδο, όχι άπειρα (πρακτικό όριο, δηλωμένο) |
| **10. Διεπαφές** | `SPL.predict(subject, target, distribution, horizon)→cid` · `SPL.resolve(cid, outcome)` · `SPL.fidelity(subject)` · `SPL.alarms()`· contract: Goal/EffectTx τύποι ΑΠΑΙΤΟΥΝ `self_prediction_cid` |
| **11. Εξαρτήσεις** | MFA-MECH-001 (τύπος, t_known ordering), 004, 006, CMP-AEO-05 (Battery), held-out Πολιτισμός (ο SPL scorer τρέχει εκεί) |
| **12. Πόροι** | O(predictions)· scoring φθηνό· η παραγωγή προβλέψεων κοστίζει Genesis-plane υπολογισμό (budget) |
| **13. Κλιμάκωση** | Ανά οντότητα· subjects προστίθενται |
| **14. Αποτυχίες** | Προβλέψεις που δεν επιλύονται ποτέ (horizon περασμένος) → Unknown(EXPIRED), μετρούν ως αποτυχία self-model (δεν ήξερε ότι δεν θα μάθει)· scorer bug → N-version scorer |
| **15. Αντιπαλικοί** | «Ασφαλείς» προβλέψεις (ομοιόμορφες κατανομές) → proper scoring rule τις τιμωρεί (χαμηλό sharpness)· χειραγώγηση outcome ώστε να ταιριάζει (self-fulfilling) → outcomes από receipts/KT εκτός microVM· πρόβλεψη μετά το γεγονός → t_known ordering στο ledger |
| **16. Επαλήθευση** | VO: 0 Goals/EffectTx χωρίς self_prediction· VO: FidelityIndex ≥ threshold πριν από grant· VO: discriminative test ανά subject· KT νέο: seeded drift (αλλάζω πάροχο χωρίς να το πω) → DriftAlarm εντός N προβλέψεων |
| **17. Πρωτότυπο** | F2: SPL σε DST με προβλέψεις κόστους/latency stubs· F3: πραγματικές προβλέψεις κόστους tokens και επιτυχίας Goals τύπου Observation |
| **18. Ελάχιστο πείραμα** | 500 Goals: Brier του self-model vs baseline (ιστορικός μέσος)· seeded drift ανίχνευση σε ≤ 50 προβλέψεις |
| **19. Διάψευση** | Self-model που δεν υπερέχει του ιστορικού μέσου σε κανένα subject → το «self-model» δεν μοντελοποιεί, και ο SPL μένει ως μετρητής (η μέτρηση επιβιώνει, το όργανο COG-08 ξανασχεδιάζεται) |
| **20. → Παραγωγή** | Από Δόση 1 για κόστος/latency (φθηνό), Δόση 2 για Goals |
| **21. Εξέλιξη** | Νέο subject = ADD με discriminative test |
| **22. Αλληλεπιδράσεις** | Reportability (MFA-CAP-065): «τι νομίζεις ότι κάνεις» = ανοιχτές SelfPredictions· Battery trigger· cockpit δείχνει FidelityIndex ως «διαύγεια» του οργάνου· GCP: ο διάδοχος πρέπει να προβλέψει τον εαυτό του τουλάχιστον όσο ο πρόγονος |

**AI Contribution Ledger:** `NEW ARCHITECTURAL INVENTION` — self-model = υπογεγραμμένες προ-γεγονότος κατανομές βαθμολογούμενες με proper scoring rule εκτός microVM, με drift alarm ως πύλη αυτονομίας. Συγγενή: calibration in ML, metacognitive monitoring (Flavell), forecasting ledgers· κανένα δεν το κάνει προϋπόθεση τύπου για δράση.
