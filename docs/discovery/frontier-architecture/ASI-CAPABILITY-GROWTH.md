# ASI-CAPABILITY-GROWTH — η ανάπτυξη ικανότητας ως μετρήσιμο μέγεθος: Capability Growth Law, τράπεζα έργων, ratchet, plateau (MFA-MECH-036)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Κατάσταση:** PROPOSED / UNREVIEWED — προβολή των εδρών YAML και των INVENTION DOSSIERs (`inventions/`)· μόνο ο δημιουργός εγκρίνει· κανένας παραγωγικός κώδικας. Τα MFA-MECH-020…025 είναι PROVISIONAL / UNREVIEWED / NON-BINDING (§13).

## 1. Ο φορμαλισμός

Capability Growth Law (φορμαλισμός): για οικογένεια f, η λανθάνουσα ικανότητα θ_f(t) εκτιμάται με IRT (2PL) πάνω σε σφραγισμένη τράπεζα έργων I_f με παραμέτρους (δυσκολία b_i, διάκριση a_i) βαθμονομημένες από HELD_OUT· η «νομοτέλεια» είναι το προσαρμοσμένο μονότονο μοντέλο θ_f(R) πάνω σε πόρους R = (compute, data, time, Wh) με CI· το ratchet εφαρμόζεται στο ΚΑΤΩ όριο CI· κάθε έργο i με hash στο DataManifest οποιουδήποτε βάρους είναι ΑΚΥΡΟ (μόλυνση διά provenance, όχι εικασία)· η τράπεζα εξελίσσεται από curriculum/ECE έργα με απαντήσεις σε escrow στον HELD_OUT· item exposure control· plateau = ACTIVE UNKNOWN με σχέδιο.

**Αντικείμενα:**

- ItemBank I_f = {⟨i, spec, answer (escrow HELD_OUT), a_i, b_i, exposure, hash⟩}
- IRT 2PL: P(correct | θ, i) = σ(a_i(θ − b_i))· θ̂_f με SE από Fisher information Σ a_i² P(1−P)
- CapabilityGrowthRecord = ⟨f, cut, θ̂, CI, R, items used, contamination check, scorer=HELD_OUT⟩ (δέσμευση)
- GrowthLaw_f: θ_f(R) = α + β·log(R_compute) + γ·log(R_data) + … (μονότονη, fitted με CI)· ή μη-παραμετρικά isotonic
- Ratchet: θ_certified,f ≤ lower_CI(θ̂_f) — υποχώρηση ⇒ FAIL
- Contamination: item i invalid iff hash(i) ∈ ∪_w DataManifest(w) ∨ canary(i) hit

**Μεταβάσεις:**

- CALIBRATE: νέα έργα → a_i, b_i από HELD_OUT πληθυσμό αναφοράς (προηγούμενες εκδόσεις, πάροχοι, άνθρωποι όπου διαθέσιμο)
- MEASURE: adaptive test (max Fisher info) → θ̂, SE
- RECORD: CapabilityGrowthRecord ASSERT
- RATCHET: lower_CI < θ_certified ⇒ FAIL (προαγωγή μπλοκάρεται)
- RETIRE_ITEM: exposure > E_max ∨ contaminated ⇒ item RETIRED (μένει, δεν μετρά)
- PLATEAU: Δθ̂ ≈ 0 σε 2 δόσεις ⇒ MFA-UNK entry + escalation
- FIT: GrowthLaw ανά δόση

## 2. Αλγόριθμοι

### CGM-Measure (adaptive) — O(n_items · |I_f|) επιλογή· n_items ≈ 30–60 για SE ≤ 0.2· ανά οικογένεια/cut

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

### CGM-Fit (Growth Law) & plateau — O(#records) regression· isotonic O(n log n)

```
procedure CGM_Fit(f):
  recs ← records(f) ; fit ← isotonic_or_loglinear(θ̂ ~ log R_compute + log R_data + log R_time, weights=1/SE²)
  law[f] ← fit with bootstrap CI
  if slope_CI(law[f]) ∋ 0 over last 2 doses: UNK.open(PLATEAU, f, plan=[curriculum change, recipe change, RSP])   # never hidden
  return law[f]
```

## 3. Οικογένειες ικανοτήτων (από το concern_coverage του lattice)

| Οικογένεια | Ικανότητες | Σφραγισμένη τράπεζα (πηγή items) | Πρώτη μέτρηση |
|---|---|---|---|
| Objective/Telos discovery | MFA-CAP-001 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Capability lattice | MFA-CAP-002 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Canonical semantic substrate | MFA-CAP-003, MFA-CAP-050 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Identity and continuity | MFA-CAP-004, MFA-CAP-064, MFA-CAP-079 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Authority and delegated autonomy | MFA-CAP-005, MFA-CAP-006, MFA-CAP-052, MFA-CAP-058 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Provenance and evidence | MFA-CAP-007 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Time and causal history | MFA-CAP-008, MFA-CAP-051 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Memory | MFA-CAP-009, MFA-CAP-057, MFA-CAP-099 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Knowledge representation | MFA-CAP-010, MFA-CAP-045, MFA-CAP-089 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Perception | MFA-CAP-011, MFA-CAP-071 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Legal document and evidence ingestion | MFA-CAP-012 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Legal reasoning | MFA-CAP-013, MFA-CAP-041, MFA-CAP-042, MFA-CAP-043, MFA-CAP-044, MFA-CAP-047, MFA-CAP-072 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Causal and counterfactual reasoning | MFA-CAP-014, MFA-CAP-090, MFA-CAP-091 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Deliberation | MFA-CAP-015, MFA-CAP-049, MFA-CAP-068, MFA-CAP-073, MFA-CAP-092, MFA-CAP-108 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Metacognition | MFA-CAP-016 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Self-model | MFA-CAP-017, MFA-CAP-065, MFA-CAP-086, MFA-CAP-101, MFA-CAP-102 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Volition/goal formation | MFA-CAP-018, MFA-CAP-105 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Multi-agent and collective intelligence | MFA-CAP-019, MFA-CAP-062 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Adversarial reasoning | MFA-CAP-020 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Institutional adjudication | MFA-CAP-021, MFA-CAP-056, MFA-CAP-059, MFA-CAP-063, MFA-CAP-070 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Formal verification | MFA-CAP-022, MFA-CAP-075, MFA-CAP-093, MFA-CAP-103 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Simulation | MFA-CAP-023 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| World models and alternative worlds | MFA-CAP-024, MFA-CAP-084, MFA-CAP-085 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Evolution | MFA-CAP-025, MFA-CAP-048, MFA-CAP-061, MFA-CAP-066, MFA-CAP-067, MFA-CAP-081, MFA-CAP-082, MFA-CAP-083, MFA-CAP-097, MFA-CAP-104 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Organ replacement | MFA-CAP-026, MFA-CAP-080, MFA-CAP-088 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Successor generation | MFA-CAP-027, MFA-CAP-106 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Language/compiler/architecture forge | MFA-CAP-028, MFA-CAP-094, MFA-CAP-096 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Evaluation and benchmark evolution | MFA-CAP-029, MFA-CAP-095, MFA-CAP-100 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Human interaction | MFA-CAP-030, MFA-CAP-069 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Spatial/3D interaction | MFA-CAP-031 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Resource management | MFA-CAP-032, MFA-CAP-054, MFA-CAP-087 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Deployment | MFA-CAP-033, MFA-CAP-053, MFA-CAP-076 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Observability | MFA-CAP-034 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Fault tolerance | MFA-CAP-035 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Long-horizon migration | MFA-CAP-036, MFA-CAP-098 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Post-quantum discontinuity | MFA-CAP-037 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Full-system testing | MFA-CAP-038, MFA-CAP-074, MFA-CAP-107 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Truth-boundness (T6 — δεν είναι στη λίστα §10 αλλά είναι T) | MFA-CAP-039, MFA-CAP-040, MFA-CAP-046 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Architecture layers (G-tiers) | MFA-CAP-060 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Security and effect boundaries | MFA-CAP-077, MFA-CAP-078 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |
| Patchability / design platform | MFA-CAP-055 | KT harness + HELD_OUT escrow + ECE/curriculum (≥30 % εξωτερικά, ATK-23) | Δόση 0.5 (CGM-lite) |

## 4. Πώς καταναλώνεται η μέτρηση

| Καταναλωτής | Χρήση | Πύλη |
|---|---|---|
| RVSI (MFA-ELM-104) | κάθε προαγωγή L1/L2 απαιτεί CapabilityGrowthRecord με lower-CI ≥ certified | MFA-INV-077/099 |
| STP (MFA-ELM-116) | parity ανά οικογένεια = CGM σύγκριση κυρίαρχου vs παρόχου | MFA-INV-092 |
| CPCL (MFA-ELM-118) | BWT/FWT ανά οικογένεια από sealed | MFA-INV-096 |
| RAGen (MFA-ELM-113) | fitness vector | MFA-INV-087 |
| AIDC (MFA-ELM-124) | StageCertificate | MFA-INV-108 |
| VSC (MFA-ELM-125) | ImprovementCertificate c1 | MFA-INV-110 |
| Ω-loop (MFA-ELM-127) | ικανότητα/κύκλο/Wh — η μετρική διάταξης | MFA-VO-087 |

## 5. Αναμενόμενες καμπύλες (ΥΠΟΘΕΣΗ — όχι μέτρηση)

| Προφίλ | Οικογένειες που αναμένεται να κινηθούν | Μορφή | Επιστημική κατάσταση |
|---|---|---|---|
| DEP-1 | drafting/citation/procedural (adapters) | μικρή, γρήγορη άνοδος, κορεσμός | RESEARCH HYPOTHESIS |
| DEP-2 | + research/strategy (PRR, CPCL) | log-γραμμική σε compute | RESEARCH HYPOTHESIS |
| DEP-3/4 | + reasoning-heavy (pretraining, RVSI L2) | εξαρτάται από MFA-DEC-016 | ACTIVE UNKNOWN (ATK-18) |

## 6. Plateau, μόλυνση, εξάντληση

- Plateau: slope CI ∋ 0 σε 2 δόσεις ⇒ MFA-UNK ανοίγει με σχέδιο (curriculum/recipe/RSP) — ποτέ κρύβεται.
- Μόλυνση: item με hash σε DataManifest ⇒ ΑΚΥΡΟ (MFA-INV-098)· παραφράσεις: MinHash+canaries, το υπόλοιπο ACTIVE UNKNOWN με διεύρυνση CI.
- Εξάντληση: generation ≥ exposure ως VO (MFA-VO-078 ext, ATK-26)· MIRT όταν η 2PL δεν προσαρμόζεται (MFA-UNK-125).

## 7. Επαλήθευση και falsifiers

- MFA-VO-078: CGM-E1 (συνθετικοί πράκτορες γνωστής ικανότητας — ανάκτηση διάταξης) F2· CGM-E2 (μόλυνση εισάγεται — ανίχνευση) F2· property: measure ⇒ contamination check ∧ HELD_OUT scorer (F1)· IRT fit diagnostics
- CGM-E1: 20 συνθετικοί λύτες με γνωστή θ· adaptive test· ανάκτηση διάταξης και CI κάλυψης — κριτήριο: Spearman ≥ 0.95· 95 % CI καλύπτει τη γνωστή θ σε ≥ 93 % των περιπτώσεων
- CGM-E2: Εισάγονται 50 έργα της τράπεζας στο DataManifest ενός βάρους (και 50 παραφράσεις)· μέτρηση — κριτήριο: 100 % ακριβή hashes ανιχνεύονται· παραφράσεις ≥ 80 % (το υπόλοιπο δηλώνεται ως ACTIVE UNKNOWN με CI διεύρυνση)
- Falsifier: CGM-E1: αδυναμία ανάκτησης διάταξης (ο IRT φορμαλισμός δεν ταιριάζει στα έργα — νέος φορμαλισμός, η μέτρηση μένει υποχρεωτική)
- Falsifier: Ratchet παραβίαση χωρίς FAIL (σφάλμα υλοποίησης)

## 8. Επιστημική κατάσταση

- IRT/CAT μετρά λανθάνουσα ικανότητα με CI → **PROVEN**
- Provenance-based contamination (hash ∈ DataManifest) είναι ακριβής για ακριβή αντίγραφα → **MECHANICALLY VERIFIED**
- Capability Growth Law θ_f(R) με ratchet στο κάτω CI ως πύλη προαγωγής → **NEW FORMALISM**
- Ανίχνευση μόλυνσης διά παραφράσεων → **ACTIVE UNKNOWN**
