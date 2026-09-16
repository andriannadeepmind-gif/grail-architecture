# MFA-MECH-036 — Capability Growth Metrology (CGM) & Capability Growth Law — η ανάπτυξη ικανότητας ως μετρήσιμη, σφραγισμένη, ανά πόρο

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-036.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-050 · MFA-INV-077 · MFA-INV-001 (ratchet) · MFA-CAP-029 · MFA-TEL-08

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-036 |
| **2. Όνομα** | Capability Growth Metrology (CGM) & Capability Growth Law — η ανάπτυξη ικανότητας ως μετρήσιμη, σφραγισμένη, ανά πόρο |
| **3. Ικανότητα** | MFA-CAP-100, MFA-CAP-029 — Μέτρηση ανάπτυξης ικανότητας (§8 #12): λανθάνουσα ικανότητα ανά οικογένεια με CI, σε σφραγισμένη τράπεζα έργων που εξελίσσεται χωρίς μόλυνση, κανονικοποιημένη ανά compute/δεδομένα/χρόνο/ενέργεια· κάθε ισχυρισμός κέρδους = δέσμευση. |
| **4. Πρόβλημα** | Το 0.4.0-provisional έχει MFA-VO-067 «Capability Growth Law» ως VO χωρίς φορμαλισμό. Αφετηρίες: scaling laws (Kaplan et al. 2020· Hoffmann et al. 2022), benchmarks (HELM, Liang 2022· BIG-bench), Item Response Theory (Lord 1980· 2PL/3PL), computerized adaptive testing (van der Linden & Glas 2000), Elo/TrueSkill, task-horizon metric (Kwa et al. 2025), contamination detection (Golchin & Surdeanu 2023). Όρια: benchmarks μολύνονται και κορεννύουν· καμία σύνδεση με πύλες προαγωγής· καμία ανά-πόρο κανονικοποίηση με CI· item bank δεν εξελίσσεται από το ίδιο το σύστημα υπό HELD_OUT· «κέρδος» δηλώνεται χωρίς δέσμευση/provenance. |
| **5. Πρώτη αρχή** | Capability Growth Law (φορμαλισμός): για οικογένεια f, η λανθάνουσα ικανότητα θ_f(t) εκτιμάται με IRT (2PL) πάνω σε σφραγισμένη τράπεζα έργων I_f με παραμέτρους (δυσκολία b_i, διάκριση a_i) βαθμονομημένες από HELD_OUT· η «νομοτέλεια» είναι το προσαρμοσμένο μονότονο μοντέλο θ_f(R) πάνω σε πόρους R = (compute, data, time, Wh) με CI· το ratchet εφαρμόζεται στο ΚΑΤΩ όριο CI· κάθε έργο i με hash στο DataManifest οποιουδήποτε βάρους είναι ΑΚΥΡΟ (μόλυνση διά provenance, όχι εικασία)· η τράπεζα εξελίσσεται από curriculum/ECE έργα με απαντήσεις σε escrow στον HELD_OUT· item exposure control· plateau = ACTIVE UNKNOWN με σχέδιο. |
| **6. Οντολογία** | ItemBank I_f = {⟨i, spec, answer (escrow HELD_OUT), a_i, b_i, exposure, hash⟩}· IRT 2PL: P(correct ∣ θ, i) = σ(a_i(θ − b_i))· θ̂_f με SE από Fisher information Σ a_i² P(1−P)· CapabilityGrowthRecord = ⟨f, cut, θ̂, CI, R, items used, contamination check, scorer=HELD_OUT⟩ (δέσμευση)· GrowthLaw_f: θ_f(R) = α + β·log(R_compute) + γ·log(R_data) + … (μονότονη, fitted με CI)· ή μη-παραμετρικά isotonic· Ratchet: θ_certified,f ≤ lower_CI(θ̂_f) — υποχώρηση ⇒ FAIL· Contamination: item i invalid iff hash(i) ∈ ∪_w DataManifest(w) ∨ canary(i) hit |
| **7. Κατάσταση** | Μεταβλητές: I_{f,t}· θ̂_{f,t}, CI· R_t· GrowthLaw fits· Exposure counters· Plateau flags ‖ Μεταβάσεις: CALIBRATE: νέα έργα → a_i, b_i από HELD_OUT πληθυσμό αναφοράς (προηγούμενες εκδόσεις, πάροχοι, άνθρωποι όπου διαθέσιμο)· MEASURE: adaptive test (max Fisher info) → θ̂, SE· RECORD: CapabilityGrowthRecord ASSERT· RATCHET: lower_CI < θ_certified ⇒ FAIL (προαγωγή μπλοκάρεται)· RETIRE_ITEM: exposure > E_max ∨ contaminated ⇒ item RETIRED (μένει, δεν μετρά)· PLATEAU: Δθ̂ ≈ 0 σε 2 δόσεις ⇒ MFA-UNK entry + escalation· FIT: GrowthLaw ανά δόση |
| **8. Είσοδοι/έξοδοι** | CGM.measure(family, system, cut)→CapabilityGrowthRecord ∣ RATCHET_FAIL· CGM.bank(family)→ItemBank (χωρίς απαντήσεις)· CGM.calibrate(items)→(a, b)· CGM.law(family)→GrowthLaw with CI· CGM.contamination(item, cut)→bool+evidence· CGM.record(*)→δέσμευση |
| **9. Αλγόριθμος** | **CGM-Measure (adaptive)** [O(n_items · ∣I_f∣) επιλογή· n_items ≈ 30–60 για SE ≤ 0.2· ανά οικογένεια/cut]· **CGM-Fit (Growth Law) & plateau** [O(#records) regression· isotonic O(n log n)] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-036.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-064 (Growth Metrology: measure/bank/calibrate/law/contamination)· MFA-CON-053 (compute/data inventory ως R)· MFA-CON-050 (curriculum ως πηγή έργων) ‖ Εξουσία: Απαντήσεις σε escrow στη HELD_OUT συσκευή· βαθμονόμηση από HELD_OUT· E_max, SE_target = πολιτική· κανένα σύστημα δεν βαθμολογεί τον εαυτό του. |
| **11. Εξαρτήσεις** | Γνωστές: MFA-ELM-086 HELD_OUT· MFA-ELM-102 DataManifest· MFA-ELM-106 curriculum· MFA-ELM-114 ECE· MFA-ELM-108 πόροι· MFA-ELM-089 (ratchet) ‖ Άγνωστες: MFA-UNK-125: αν η 2PL IRT είναι επαρκής για ανοιχτά νομικά έργα (πολυδιάστατη ικανότητα) — EPISTEMIC· MIRT ως εναλλακτική |
| **12. Πόροι** | Μέτρηση: n_items λύσεις ανά οικογένεια/cut (λεπτά–ώρες)· τράπεζα 10³ έργα/οικογένεια· HELD_OUT phone-class επαρκεί για scoring/escrow |
| **13. Κλιμάκωση** | Η ίδια η CGM: SE ~ 1/√n_items· η μετρούμενη θ_f(R) είναι το αντικείμενο· αναμένεται log-γραμμική (scaling laws) με κορεσμό ανά οικογένεια — MFA-VO-078. |
| **14. Αποτυχίες** | Item drift (έργο «γερνάει») → ανίχνευση: DIF ανάλυση → απόκριση: επαναβαθμονόμηση ή RETIRE· Τράπεζα εξαντλείται (exposure) → ανίχνευση: διαθέσιμα < n_max → απόκριση: curriculum παράγει νέα· μέτρηση με ευρύτερο CI, δηλωμένο· Μόλυνση μέσω παραφράσεων → ανίχνευση: near-duplicate hash (MinHash) + canaries → απόκριση: item invalid· δηλωμένο κενό ανίχνευσης (ACTIVE UNKNOWN)· Ceiling effect → ανίχνευση: θ̂ > max b_i → απόκριση: δυσκολότερα έργα από ECE· CI διευρύνεται· Πόροι μη-μετρήσιμοι (burst) → ανίχνευση: R ελλιπές → απόκριση: record με R=UNKNOWN(reason)· law δεν προσαρμόζεται |
| **15. Αντιπαλικοί** | Περιορισμός: Harness στο σταθερό σημείο· HELD_OUT συσκευή· escrow απαντήσεων· κανένα Effect. ‖ Κλάση αναστρεψιμότητας: REVERSIBLE (records = δεσμεύσεις) |
| **16. Επαλήθευση** | MFA-VO-078: CGM-E1 (συνθετικοί πράκτορες γνωστής ικανότητας — ανάκτηση διάταξης) F2· CGM-E2 (μόλυνση εισάγεται — ανίχνευση) F2· property: measure ⇒ contamination check ∧ HELD_OUT scorer (F1)· IRT fit diagnostics ‖ Invariants: MFA-INV-098: κανένα έργο μέτρησης με hash σε DataManifest οποιουδήποτε μετρούμενου βάρους — η μόλυνση αποδεικνύεται διά provenance, όχι εικάζεται· MFA-INV-099: το ratchet εφαρμόζεται στο κάτω όριο CI· ισχυρισμός κέρδους χωρίς CapabilityGrowthRecord = FAIL (επέκταση MFA-INV-077) |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή IRT/ratchet/contamination (tools/twin) |
| **18. Ελάχιστο πείραμα** | **CGM-E1**: 20 συνθετικοί λύτες με γνωστή θ· adaptive test· ανάκτηση διάταξης και CI κάλυψης — κριτήριο (προκαταχωρισμένο): Spearman ≥ 0.95· 95 % CI καλύπτει τη γνωστή θ σε ≥ 93 % των περιπτώσεων· **CGM-E2**: Εισάγονται 50 έργα της τράπεζας στο DataManifest ενός βάρους (και 50 παραφράσεις)· μέτρηση — κριτήριο (προκαταχωρισμένο): 100 % ακριβή hashes ανιχνεύονται· παραφράσεις ≥ 80 % (το υπόλοιπο δηλώνεται ως ACTIVE UNKNOWN με CI διεύρυνση) |
| **19. Διάψευση** | CGM-E1: αδυναμία ανάκτησης διάταξης (ο IRT φορμαλισμός δεν ταιριάζει στα έργα — νέος φορμαλισμός, η μέτρηση μένει υποχρεωτική)· Ratchet παραβίαση χωρίς FAIL (σφάλμα υλοποίησης) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 0.5: τράπεζα αρχική (KT + 200 έργα) + HELD_OUT escrow· Δόση 1: adaptive IRT + records· Δόση 2: law fit + CGM-E1/E2· συνεχής. |
| **21. Εξέλιξη** | Η τράπεζα εξελίσσεται (ECE/curriculum έργα)· τα a_i, b_i μαθαίνονται· η ίδια η CGM δεν βελτιώνεται από το μετρούμενο σύστημα (ανήκει στο σταθερό σημείο ως harness — MFA-INV-086). |
| **22. Αλληλεπιδράσεις** | MFA-ELM-119 (νέο στοιχείο CGM, S7)· MFA-ELM-104 RVSI (πύλη)· MFA-ELM-116 STP (parity)· MFA-ELM-118 CPCL (sealed ανά οικογένεια)· MFA-ELM-113 RAGen (fitness)· MFA-ELM-091 cockpit |

**AI Contribution Ledger:** `NEW FORMALISM`

## Αλγόριθμοι (πλήρες pseudocode)

### CGM-Measure (adaptive) — πολυπλοκότητα: O(n_items · |I_f|) επιλογή· n_items ≈ 30–60 για SE ≤ 0.2· ανά οικογένεια/cut

```
procedure CGM_Measure(f, system, cut):
  I ← {i ∈ I_f : not contaminated(i, cut) ∧ exposure(i) < E_max}          # provenance contamination check (MFA-INV-098)
  θ ← prior_mean ; used ← []
  while SE(θ, used) > SE_target and |used| < n_max:
    i* ← argmax_{i ∈ I \ used} a_i² P(θ,i)(1−P(θ,i))                      # max Fisher information
    y ← HELD_OUT.score(system.solve(i*), escrow_answer(i*))                 # scorer never the system
    used.append((i*, y)) ; exposure(i*) += 1
    θ ← MLE_or_EAP(used)                                                    # 2PL likelihood
  rec ← CapabilityGrowthRecord(f, cut, θ̂=θ, CI=θ ± 1.96·SE, R=resources(cut), items=used)
  CC.assert(rec)
  if lower_CI(rec) < θ_certified[f]: return RATCHET_FAIL(rec)                # blocks promotion (MFA-INV-077)
  return rec
```

### CGM-Fit (Growth Law) & plateau — πολυπλοκότητα: O(#records) regression· isotonic O(n log n)

```
procedure CGM_Fit(f):
  recs ← records(f) ; fit ← isotonic_or_loglinear(θ̂ ~ log R_compute + log R_data + log R_time, weights=1/SE²)
  law[f] ← fit with bootstrap CI
  if slope_CI(law[f]) ∋ 0 over last 2 doses: UNK.open(PLATEAU, f, plan=[curriculum change, recipe change, RSP])   # never hidden
  return law[f]
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| CGM-E1 | 20 συνθετικοί λύτες με γνωστή θ· adaptive test· ανάκτηση διάταξης και CI κάλυψης | Spearman ≥ 0.95· 95 % CI καλύπτει τη γνωστή θ σε ≥ 93 % των περιπτώσεων |
| CGM-E2 | Εισάγονται 50 έργα της τράπεζας στο DataManifest ενός βάρους (και 50 παραφράσεις)· μέτρηση | 100 % ακριβή hashes ανιχνεύονται· παραφράσεις ≥ 80 % (το υπόλοιπο δηλώνεται ως ACTIVE UNKNOWN με CI διεύρυνση) |

## Επιστημική κατάσταση (§5) — συνολικά: **NEW FORMALISM**

| Ισχυρισμός | Κατάσταση |
|---|---|
| IRT/CAT μετρά λανθάνουσα ικανότητα με CI | PROVEN |
| Provenance-based contamination (hash ∈ DataManifest) είναι ακριβής για ακριβή αντίγραφα | MECHANICALLY VERIFIED |
| Capability Growth Law θ_f(R) με ratchet στο κάτω CI ως πύλη προαγωγής | NEW FORMALISM |
| Ανίχνευση μόλυνσης διά παραφράσεων | ACTIVE UNKNOWN |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή IRT/ratchet/contamination (tools/twin)
2. F2: CGM-E1/E2 σε DEP-1
3. F3: πραγματική τράπεζα νομικών έργων
4. F4: παραγωγή Δόση 1
