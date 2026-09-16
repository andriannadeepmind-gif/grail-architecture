# MFA-MECH-037 — Mechanistic Self-Model (MSM) — μοντέλο των ίδιων των κυκλωμάτων, επαληθευμένο με αυτο-παρέμβαση

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-037.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-052 (συνείδηση — self-model συνιστώσα) · MFA-OBJ-051 · MFA-CAP-017 (self-model) · MFA-CAP-016 (μεταγνώση) · MFA-CAP-088 (unlearning)

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-037 |
| **2. Όνομα** | Mechanistic Self-Model (MSM) — μοντέλο των ίδιων των κυκλωμάτων, επαληθευμένο με αυτο-παρέμβαση |
| **3. Ικανότητα** | MFA-CAP-101, MFA-CAP-017 — Μηχανιστικό αυτο-μοντέλο (§6 #14): το σύστημα διατηρεί, ελέγχει με δικές του παρεμβάσεις και χρησιμοποιεί online ένα μοντέλο των δικών του χαρακτηριστικών/κυκλωμάτων — για μεταγνώση, εδραίωση, unlearning και μέτρα συνείδησης. |
| **4. Πρόβλημα** | Το 0.3.0 έχει συμπεριφορικό αυτο-μοντέλο (MFA-ELM-024 SPL) και το provisional attention schema (MFA-MECH-024)· κανένα μοντέλο των βαρών/κυκλωμάτων (AA-027). Αφετηρίες: circuits (Olah et al. 2020), sparse autoencoders (Bricken et al. 2023· Templeton et al. 2024), activation patching/causal scrubbing (Chan et al. 2022), ACDC (Conmy et al. 2023), model editing (ROME, Meng 2022), introspection σε LLMs (Binder et al. 2024). Όρια: offline ανάλυση από ανθρώπους· τα ευρήματα δεν είναι δεσμεύσεις με προβλέψεις· δεν επαληθεύονται από ΠΑΡΕΜΒΑΣΕΙΣ που σχεδιάζει το ίδιο το σύστημα· δεν χρησιμοποιούνται online για έλεγχο (τι να προστατεύσω, τι έμαθα, τι ξέχασα)· καμία ανίχνευση drift ανά έκδοση βαρών. |
| **5. Πρώτη αρχή** | Το αυτο-μοντέλο είναι σύνολο ΚΥΚΛΩΜΑΤΙΚΩΝ ΥΠΟΘΕΣΕΩΝ h = ⟨features (SAE), circuit (υπογράφος), predicted causal effect on behaviour family f, confidence⟩· κάθε h επαληθεύεται με ΑΥΤΟ-ΠΑΡΕΜΒΑΣΗ (activation patching/ablation στο Genesis plane, DST) και βαθμολογείται με proper scoring από HELD_OUT· επιζώσες h = δεσμεύσεις· το αυτο-μοντέλο τροφοδοτεί online: CompetenceProfile (ποιο κύκλωμα στηρίζει ποια ικανότητα), CPCL (προστατευμένοι υπόχωροι), unlearning verification (feature για shredded πηγή απούσα), CHH (κυκλώματα global broadcast για δείκτες συνείδησης)· διαψευσμένες h μένουν FALSIFIED. |
| **6. Οντολογία** | Feature dictionary D_l ανά στρώμα (SAE: x ≈ Σ f_i d_i, sparse)· CircuitHypothesis h = ⟨F ⊆ features, E ⊆ edges, family f, effect Δ_pred = E[score_f ∣ ablate(F)] − E[score_f], conf⟩· SelfExperiment x = ⟨intervention (ablate/patch/scale F), sealed tasks, predicted Δ, observed Δ, proper score⟩· SelfModel M_self = {h : verified} ∪ {h : FALSIFIED} (δέσμευση ανά WeightCommitment)· DriftMap(w_a → w_b): αντιστοίχιση features μεταξύ εκδόσεων (Hungarian σε cos-sim) με χαμένα/νέα· FeaturePresence(w, source) = max activation των features αντιστοιχισμένων στην πηγή σε probe set |
| **7. Κατάσταση** | Μεταβλητές: D_l ανά στρώμα ανά WeightCommitment· M_self,t· Experiment queue· DriftMaps· Calibration ανά τύπο πρόβλεψης ‖ Μεταβάσεις: DICTIONARY: SAE εκπαίδευση σε activations δείγματος (Genesis, sealed-free)· DISCOVER: ανά οικογένεια f: ACDC-style pruning → h υποψήφια με Δ_pred· SELF_TEST: x εκτελείται σε DST· Δ_obs από HELD_OUT scorer· ADMIT/FALSIFY: proper score > θ ⇒ h ∈ M_self· αλλιώς FALSIFIED (μένει)· USE: CPCL.protected ← circuits των Tier-0 οικογενειών· unlearning check· CompetenceProfile grounding· CHH indicators· DRIFT: νέο w ⇒ DriftMap· h που χάνουν features → RE-TEST |
| **8. Είσοδοι/έξοδοι** | MSM.model(weight)→SelfModel· MSM.hypotheses(family)→[h with status]· MSM.self_test(h)→SelfExperiment· MSM.feature_absent(weight, source)→bool+evidence· MSM.drift(w_a, w_b)→DriftMap· MSM.ground(profile)→CompetenceProfile update |
| **9. Αλγόριθμος** | **MSM-Cycle** [SAE O(N·d·k) ανά στρώμα (ώρες GPU σε 7B)· ACDC O(∣edges∣·evals)· self-tests O(∣h∣·∣sealed∣)]· **DriftMap** [O(∣D_a∣·∣D_b∣) cos-sim + Hungarian O(n³) (n ≈ 10⁴–10⁵ → blocked)] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-037.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-069 (Mechanistic Self-Model: model/hypotheses/self_test/feature_absent/drift)· MFA-CON-063 (CPCL)· MFA-CON-051 (Introspection)· MFA-CON-070 (CHH indicators) ‖ Εξουσία: Αυτο-παρεμβάσεις μόνο Genesis/DST (ποτέ σε serving βάρη)· scorer HELD_OUT· τα ευρήματα δεν έχουν εξουσία· χρήση στο CPCL μέσω πύλης. |
| **11. Εξαρτήσεις** | Γνωστές: MFA-ELM-100/101/102 (βάρη, host, registry)· MFA-ELM-024 SPL· MFA-ELM-107 ASRW· MFA-ELM-118 CPCL· MFA-ELM-086 HELD_OUT· MFA-ELM-121 CHH ‖ Άγνωστες: MFA-UNK-126: σταθερότητα SAE λεξικών μεταξύ εκδόσεων βαρών (EPISTEMIC· DriftMap το μετρά) |
| **12. Πόροι** | DEP-1: SAE σε ≤1B, λίγα στρώματα· DEP-2: 7–13B όλα τα στρώματα (GPU ημέρες)· DEP-3: 70B δείγμα στρωμάτων· self-tests O(∣h∣·n) |
| **13. Κλιμάκωση** | Κόστος SAE ~ N·d· αριθμός features ~ d·expansion· η προβλεπτική ακρίβεια του αυτο-μοντέλου (proper score) ως συνάρτηση compute = MFA-VO-079. |
| **14. Αποτυχίες** | SAE λεξικό μη-ερμηνεύσιμο/ασταθές → ανίχνευση: DriftMap lost ≫ → απόκριση: k_sparse/seed αλλαγή· δηλώνεται ACTIVE UNKNOWN· Κύκλωμα «λειτουργεί» στο probe set αλλά όχι sealed → ανίχνευση: proper score χαμηλό → απόκριση: FALSIFIED· Αυτο-παρέμβαση σε serving → ανίχνευση: plane check → απόκριση: αδύνατο εξ ορισμού (Genesis only)· Υπερβολικό κόστος σε 70B+ → ανίχνευση: budget → απόκριση: στρώματα-δείγμα· MFA-UNK· Ψευδής απουσία feature (unlearning «περνά» ενώ η γνώση επιβιώνει αλλού) → ανίχνευση: behavioural probe + membership inference (MFA-VO-058) → απόκριση: διπλός έλεγχος: μηχανιστικός ΚΑΙ συμπεριφορικός· obligation μένει ανοιχτή αν διαφωνούν |
| **15. Αντιπαλικοί** | Περιορισμός: Genesis/DST μόνο· βάρη αντίγραφα· scorer HELD_OUT. ‖ Κλάση αναστρεψιμότητας: REVERSIBLE (δεσμεύσεις· παρεμβάσεις σε αντίγραφα) |
| **16. Επαλήθευση** | MFA-VO-079: MSM-E1 (πρόβλεψη Δ από ablation με Brier < baseline) F2/F3· MSM-E2 (unlearning: feature absent ∧ behavioural absent) F3· property: h ⇒ self-test (F1)· επέκταση MFA-VO-058 ‖ Invariants: MFA-INV-100: καμία κυκλωματική υπόθεση στο αυτο-μοντέλο χωρίς αυτο-παρέμβαση με proper score από HELD_OUT· διαψευσμένες μένουν FALSIFIED· MFA-INV-101: το αυτο-μοντέλο είναι δέσμευση ανά WeightCommitment· αλλαγή βαρών χωρίς DriftMap ⇒ το αυτο-μοντέλο σημαίνεται STALE (ποτέ σιωπηλά έγκυρο) |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή CircuitHypothesis/self-test/status (tools/twin) |
| **18. Ελάχιστο πείραμα** | **MSM-E1**: 7B κυρίαρχο μοντέλο· 20 οικογένειες· κυκλώματα· self-tests σε sealed· Brier της Δ_pred έναντι (α) μηδενικής πρόβλεψης (β) τυχαίας ablation ίδιου μεγέθους — κριτήριο (προκαταχωρισμένο): Brier(MSM) < Brier(baselines) με διακριτικό περιθώριο σε ≥ 70 % των οικογενειών· τα FALSIFIED καταγράφονται· **MSM-E2**: Shred 10 πηγών· unlearn (SMF)· MSM feature_absent ΚΑΙ membership inference — κριτήριο (προκαταχωρισμένο): Συμφωνία μηχανιστικού/συμπεριφορικού ελέγχου ≥ 90 %· 0 πηγές με feature present που περνούν |
| **19. Διάψευση** | MSM-E1: Brier όχι καλύτερο από τυχαία ablation (τα κυκλώματα δεν είναι προβλεπτικά — νέος φορμαλισμός features, η ικανότητα self-model μένει)· Διαφωνία μηχανιστικού/συμπεριφορικού unlearning > 30 % (ο μηχανιστικός έλεγχος διαψεύδεται ως επαρκής μόνος του) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 2: SAE + ACDC σε adapters/μικρά μοντέλα, self-tests DST, MSM-E1· Δόση 3: MSM-E2 unlearning check ενεργό στο CPCL gate· Δόση 4: 70B δείγμα στρωμάτων. |
| **21. Εξέλιξη** | SAE λεξικά μαθαίνονται ανά βάρος· οι υποθέσεις επιλέγονται εξελικτικά (ACDC + PRR για την πρόβλεψη Δ)· η βαθμονόμηση πρόβλεψης = ικανότητα ενδοσκόπησης (μετρήσιμη, CGM οικογένεια «introspection»). |
| **22. Αλληλεπιδράσεις** | MFA-ELM-120 (νέο στοιχείο MSM, S2)· MFA-ELM-024· MFA-ELM-118· MFA-ELM-102 (unlearning)· MFA-ELM-121 (δείκτες)· MFA-ELM-107 (attention schema γειωμένο σε κυκλώματα) |

**AI Contribution Ledger:** `NEW ARCHITECTURAL INVENTION`

## Αλγόριθμοι (πλήρες pseudocode)

### MSM-Cycle — πολυπλοκότητα: SAE O(N·d·k) ανά στρώμα (ώρες GPU σε 7B)· ACDC O(|edges|·evals)· self-tests O(|h|·|sealed|)

```
procedure MSM_Cycle(w, families, HELD_OUT):
  for l in layers(w): D_l ← train_SAE(activations(w, l, sample=ledger_cut \ sealed), k_sparse)     # dictionaries per weight commitment
  M ← M_self[w] or ∅
  for f in families:
    G ← full_computational_graph(w, features=D)
    C ← ACDC_prune(G, task=probe_set(f), threshold=τ)                       # minimal circuit reproducing behaviour
    h ← CircuitHypothesis(F=C.features, E=C.edges, family=f, Δ_pred=predict_effect(C, ablate), conf)
    x ← SelfExperiment(intervention=ablate(C.features), tasks=HELD_OUT.sealed(f, n), Δ_pred=h.Δ_pred)
    Δ_obs ← HELD_OUT.score(run(w with ablate(C.features), x.tasks)) − HELD_OUT.score(run(w, x.tasks))   # Genesis plane, DST
    s ← proper_score(h.Δ_pred, Δ_obs)
    if s > θ_admit: M.add(h, status=VERIFIED, evidence=x) else M.add(h, status=FALSIFIED, evidence=x)   # never deleted (MFA-INV-100)
  CC.assert(SelfModelCommitment(w, M))
  CPCL.protected ← {h.F : h ∈ M.verified ∧ tier(h.family) = 0}                # feeds consolidation
  CompetenceProfile.ground(M)                                                    # MFA-ELM-024
  return M
procedure MSM_UnlearningCheck(w', source):
  F_src ← features_for(source, D(w_prev))                                        # features that fired on the shredded source
  F_src' ← DriftMap(w_prev → w').map(F_src)
  return max_activation(w', F_src', probe=near_duplicates(source)) < θ_absent      # MFA-INV-097 evidence
```

### DriftMap — πολυπλοκότητα: O(|D_a|·|D_b|) cos-sim + Hungarian O(n³) (n ≈ 10⁴–10⁵ → blocked)

```
function DriftMap(w_a, w_b):
  for l in layers: S ← cos_sim(D_l(w_a), D_l(w_b)) ; match_l ← Hungarian(S, min_sim=0.7)
  return ⟨matched, lost = unmatched(a), new = unmatched(b)⟩             # lost features on verified circuits ⇒ RE-TEST
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| MSM-E1 | 7B κυρίαρχο μοντέλο· 20 οικογένειες· κυκλώματα· self-tests σε sealed· Brier της Δ_pred έναντι (α) μηδενικής πρόβλεψης (β) τυχαίας ablation ίδιου μεγέθους | Brier(MSM) < Brier(baselines) με διακριτικό περιθώριο σε ≥ 70 % των οικογενειών· τα FALSIFIED καταγράφονται |
| MSM-E2 | Shred 10 πηγών· unlearn (SMF)· MSM feature_absent ΚΑΙ membership inference | Συμφωνία μηχανιστικού/συμπεριφορικού ελέγχου ≥ 90 %· 0 πηγές με feature present που περνούν |

## Επιστημική κατάσταση (§5) — συνολικά: **NOVEL SYNTHESIS**

| Ισχυρισμός | Κατάσταση |
|---|---|
| SAE features και ACDC κυκλώματα είναι αιτιακά σχετικά με συμπεριφορές | EMPIRICALLY SUPPORTED |
| Αυτο-μοντέλο ως σύνολο επαληθευμένων κυκλωματικών υποθέσεων με proper scoring και online χρήση | NOVEL SYNTHESIS |
| Μηχανιστικός έλεγχος unlearning συμφωνεί με συμπεριφορικό | RESEARCH HYPOTHESIS |
| Το αυτο-μοντέλο κάνει τη μεταγνώση καλύτερα βαθμονομημένη | RESEARCH HYPOTHESIS |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή CircuitHypothesis/self-test/status (tools/twin)
2. F2: MSM-E1 σε DEP-2 (7B)
3. F3: MSM-E2
4. F4: παραγωγή Δόση 2–3
