# MFA-MECH-029 — Theorem-Guided Program & Proof Synthesis (TGPS) — αποδείξεις και προγράμματα ως ένα αντικείμενο υπό VFC

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-029.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-056 (proof-carrying cognition) · MFA-OBJ-050 · MFA-CAP-022 (formal verification) · MFA-MECH-025 VFC

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-029 |
| **2. Όνομα** | Theorem-Guided Program & Proof Synthesis (TGPS) — αποδείξεις και προγράμματα ως ένα αντικείμενο υπό VFC |
| **3. Ικανότητα** | MFA-CAP-093 — Σύνθεση θεωρημάτων και προγραμμάτων (§8 #9): από υποχρέωση (spec) σε πιστοποιημένο artifact (απόδειξη ή πρόγραμμα με πιστοποιητικό), με βιβλιοθήκη που μαθαίνεται και μετρήσιμη αυτο-βελτίωση της αναζήτησης. |
| **4. Πρόβλημα** | Το 0.3.0 ονομάζει «library learning» και «proof search» (MFA-ELM-025, MFA-ELM-020) χωρίς σημασιολογία/πολυπλοκότητα/contracts. Αφετηρίες: neural proof search σε Lean (AlphaProof, DeepMind 2024· DeepSeek-Prover V2 2025· LeanDojo/ReProver, Yang et al. 2023), library learning (DreamCoder, Ellis et al. 2021· LILO 2023), CEGIS (Solar-Lezama 2008), verified synthesis (Fiat, Delaware et al. 2015· Dafny· refinement types), FunSearch. Όρια: οι αποδείξεις δεν είναι δεσμεύσεις με provenance· αποδείξεις και προγράμματα ζουν σε χωριστές βιβλιοθήκες· ο προϋπολογισμός αναζήτησης δεν είναι δεμένος με το Tier της υποχρέωσης· τα πιστοποιητικά ελέγχονται από ΕΝΑΝ checker (ο Lean kernel — αρχή de Bruijn μεν, ένας δε)· η αυτο-βελτίωση της αναζήτησης δεν μετριέται σε σφραγισμένες υποχρεώσεις. |
| **5. Πρώτη αρχή** | Κάθε στόχος σύνθεσης είναι ΥΠΟΧΡΕΩΣΗ (Obligation Calculus MFA-MECH-039) με spec στο κανονικό υπόστρωμα· απόδειξη και πρόγραμμα είναι ο ίδιος τύπος αντικειμένου (Curry–Howard σε Lean 4: πρόγραμμα με refinement = απόδειξη)· δύο EIM-ανεξάρτητες γεννήτριες (συμβολική απαρίθμηση με type-directed pruning + παραμετρική πολιτική εκπαιδευμένη με PRR) αναζητούν σε ΜΙΑ βιβλιοθήκη· κάθε artifact φέρει πιστοποιητικό που ελέγχεται από ≥2 ανεξάρτητους checkers (VFC)· η βιβλιοθήκη μαθαίνεται (anti-unification/refactoring) και η μάθηση μετριέται ως μείωση μήκους απόδειξης/κόστους ανά σφραγισμένη υποχρέωση. |
| **6. Οντολογία** | Obligation ob = ⟨cid, spec (Lean Prop ∣ refinement type ∣ test-suite+contract), tier, budget B(tier), provenance⟩· Artifact art = ⟨term t, type τ, certificate cert (kernel-checkable), library_refs, cost⟩· Library Lib = ⟨lemmas ∪ programs, με χρήση, μήκος, provenance⟩ (ένα namespace)· SearchState = ⟨goal stack, partial term, budget used⟩· Policy π_θ(tactic ∣ state) — PRR-εκπαιδευμένη· Value V_θ(state)· Certificate check: VFC.verify(art) = ∧_{k∈Checkers} k.check(cert) με ∣Checkers∣ ≥ 2 EIM-ανεξάρτητοι |
| **7. Κατάσταση** | Μεταβλητές: Queue_t υποχρεώσεων ανά tier· Lib_t· π_θ, V_θ (βάρη = WeightCommitments)· Stats_t (επιτυχία ανά budget, μήκος απόδειξης) σε σφραγισμένο σύνολο· Partial_t (ημιτελείς αποδείξεις ως UNKNOWN(PROOF_NOT_FOUND) με πρόοδο) ‖ Μεταβάσεις: SUBMIT: ob → Queue με B(tier)· SKETCH: ob → υποστόχοι (lemma sketch από παραμετρική γεννήτρια, τυπικά ελεγμένοι ως δηλώσεις)· SEARCH: ανά υποστόχο, δύο γεννήτριες παράλληλα, budget split· CERTIFY: cert ελέγχεται από ≥2 checkers· διαφωνία ⇒ Both → VFC incident· ADMIT: art → Lib (ADD) + CC ASSERT(proved(ob), cert)· FAIL: budget εξαντλήθηκε ⇒ UNKNOWN(PROOF_NOT_FOUND, partial, plan=more budget ∣ decompose)· COMPRESS: epoch → anti-unify Lib, refactor, re-check όλων |
| **8. Είσοδοι/έξοδοι** | TGPS.submit(obligation)→Ticket· TGPS.solve(ticket)→Artifact ∣ UNKNOWN(reason, partial)· TGPS.verify(artifact)→[checker verdicts]· TGPS.library(cut)→Lib· TGPS.stats(sealed_set)→GrowthRecord· TGPS.compress()→Receipt |
| **9. Αλγόριθμος** | **TGPS-Solve** [Εκθετική στο βάθος d (b^d), φραγμένη από B(tier)· type-directed pruning μειώνει b· CEGIS O(iters·(synth+verify))· ανά υποχρέωση]· **Guided_Search (best-first με πολιτική/αξία)** [O(B · (∣tactics∣ · cost(π_θ) + cost(kernel step)))]· **Library-Compress (epoch)** [O(∣Lib∣² · anti-unification) ανά epoch· re-check O(∣Lib∣ · kernel)] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-029.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-057 (Synthesis: submit/solve/verify/library/compress)· MFA-CON-052 (VFC)· MFA-CON-047 (SMF — εκπαίδευση π_θ)· MFA-CON-048 (PRR) ‖ Εξουσία: Σύνθεση = Genesis plane· ADMIT = πράξη επιπέδου του tier της υποχρέωσης (Tier-0 υποχρεώσεις: επιπλέον έγκριση δημιουργού για αλλαγή βιβλιοθήκης πυρήνα)· budgets = πολιτική· οι checkers = MFA-DEC-020. |
| **11. Εξαρτήσεις** | Γνωστές: MFA-ELM-020 (Lean)· MFA-ELM-025 (Skill Library)· MFA-ELM-099 VFC· MFA-ELM-103 PRR· MFA-ELM-100 SMF· MFA-MECH-009 EIM· MFA-ELM-122 Obligation Calculus (specs)· MFA-ELM-086 HELD_OUT ‖ Άγνωστες: MFA-UNK-118: ποσοστό υποχρεώσεων του πακέτου που είναι εκφράσιμες ως Lean Props χωρίς νέα θεμέλια (EPISTEMIC· μετριέται στη Δόση 1) |
| **12. Πόροι** | DEP-1: Lean 4 CPU, B=10³ κόμβοι/υποχρέωση, πολιτική μικρή (≤1B)· DEP-2: B=10⁵, πολιτική 7–13B GPU· DEP-3+: B=10⁷, PRR συνεχής· Compress epoch ώρες |
| **13. Κλιμάκωση** | Επιτυχία ανά budget αυξάνει με log(B) (best-first) και με ∣Lib∣ (μείωση μήκους)· η PRR-πολιτική αναμένεται να μετατοπίζει την καμπύλη (AlphaProof-class evidence)· MFA-VO-071 = success-rate-per-budget καμπύλη ανά epoch. |
| **14. Αποτυχίες** | Unsound sketch (ψευδές λήμμα) → ανίχνευση: type-check / kernel → απόκριση: απορρίπτεται· αρνητικό παράδειγμα· Checker διαφωνία → ανίχνευση: VFC → απόκριση: incident, ADMIT μπλοκάρεται (MFA-INV-084)· Βιβλιοθήκη «φουσκώνει» με άχρηστα λήμματα → ανίχνευση: χρήση < θ σε N epochs → απόκριση: RETIRE (η έδρα μένει)· compression· Policy overfitting στο train set υποχρεώσεων → ανίχνευση: sealed success flat/πτώση → απόκριση: MFA-INV-085· ORP επιστροφή· Budget exhaustion σε Tier-0 → ανίχνευση: UNKNOWN(PROOF_NOT_FOUND) → απόκριση: decompose + escalation στον δημιουργό· ποτέ ψευδές PASS |
| **15. Αντιπαλικοί** | Περιορισμός: Κανένα artifact δεν επηρεάζει Effect plane χωρίς ADMIT· Tier-0 ADMIT υπό δημιουργό· η βιβλιοθήκη πυρήνα (CC κανόνες) εκτός αυτο-συμπίεσης (VFC L3). ‖ Κλάση αναστρεψιμότητας: REVERSIBLE (βιβλιοθήκη = δεσμεύσεις, RETIRE όχι διαγραφή) |
| **16. Επαλήθευση** | MFA-VO-071: TGPS-E1 (σφραγισμένο σύνολο υποχρεωμένων: miniF2F-class + οι Lean VOs του πακέτου) F2/F3· TGPS-E2 (προγράμματα Skill Library από raw επεισόδια) F3· property: ≥2 checkers ανά ADMIT (F1)· #print axioms σε κάθε artifact ‖ Invariants: MFA-INV-084: κανένα artifact ADMITTED χωρίς ≥2 ανεξάρτητα PASS πιστοποιητικού· διαφωνία = VFC incident, ποτέ σιωπηλή επιλογή· MFA-INV-085: η αυτο-βελτίωση της αναζήτησης μετριέται μόνο σε σφραγισμένες υποχρεώσεις (HELD_OUT), ποτέ στις υποχρεώσεις που εκπαίδευσαν την πολιτική |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή (tools/twin): Obligation/Artifact/2-checker ADMIT, growth record |
| **18. Ελάχιστο πείραμα** | **TGPS-E1**: Σφραγισμένο σύνολο 500 υποχρεώσεων (miniF2F-class + 50 VO specs)· καμπύλη επιτυχίας vs budget ανά epoch (πριν/μετά compress+PRR) — κριτήριο (προκαταχωρισμένο): Μετά 3 epochs: success@B αυξάνει ≥ 10 pp ΚΑΙ μέσο μήκος απόδειξης μειώνεται ≥ 20 %· 0 ADMIT με checker διαφωνία· **TGPS-E2**: Σύνθεση 100 προγραμμάτων Skill Library από spec+tests (raw επεισόδια)· CEGIS + guided — κριτήριο (προκαταχωρισμένο): ≥ 70 % με πιστοποιητικό (refinement ή πλήρης test+contract)· 0 ψευδώς πιστοποιημένα σε adversarial tests |
| **19. Διάψευση** | Καμία βελτίωση success@B μετά compress+PRR σε 3 epochs (η αυτο-βελτίωση της αναζήτησης διαψεύδεται)· Οποιοδήποτε ADMITTED artifact που απορρίπτεται από ανεξάρτητο checker (unsoundness = σφάλμα υλοποίησης VFC)· Η ενοποιημένη βιβλιοθήκη δεν μειώνει κόστος έναντι δύο χωριστών (τότε ο ισχυρισμός ενοποίησης πέφτει, η ικανότητα μένει) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 0.5: Lean specs των 8 κανόνων CC ως πρώτες υποχρεώσεις, enumerative μόνο· Δόση 1: guided search με μικρή πολιτική + 2 checkers· Δόση 2: PRR + compress + TGPS-E1· Δόση 3: TGPS-E2, υπό RVSI. |
| **21. Εξέλιξη** | π_θ/V_θ με PRR (ανταμοιβή = kernel-checked επιτυχία, process reward = πρόοδος υποστόχων)· βιβλιοθήκη (μη-παραμετρική) μέσω συμπίεσης· self-play: TGPS γεννά νέες υποχρεώσεις (conjectures) από AHE και curriculum (MFA-ELM-106)· υπό RVSI L1/L2. |
| **22. Αλληλεπιδράσεις** | MFA-ELM-112 (νέο στοιχείο TGPS, S3)· MFA-ELM-020/025 (υλοποιήσεις υπό VFC)· MFA-ELM-122 OC (πηγή υποχρεώσεων)· MFA-ELM-104 RVSI L1 (προγράμματα ως προτάσεις)· MFA-ELM-113 RAGen (αρχιτεκτονικές αποδείξεις ιδιοτήτων)· MFA-ELM-106 curriculum (conjectures) |

**AI Contribution Ledger:** `CROSS-SOURCE SYNTHESIS`

## Αλγόριθμοι (πλήρες pseudocode)

### TGPS-Solve — πολυπλοκότητα: Εκθετική στο βάθος d (b^d), φραγμένη από B(tier)· type-directed pruning μειώνει b· CEGIS O(iters·(synth+verify))· ανά υποχρέωση

```
procedure TGPS_Solve(ob):
  B ← budget(ob.tier)                                     # Tier-0: B_max ; policy MFA-DEC-005
  subgoals ← LemmaSketch(ob.spec, Parametric_Gen)          # each sketch statement is type-checked; unsound sketches rejected
  if subgoals = ⊥: subgoals ← [ob.spec]
  proofs ← {}
  for g in topological(subgoals):
    res ← parallel_first_success(
        Enumerative_Search(g, Lib, budget=B/2, prune=type_directed, order=by_library_usage),
        Guided_Search(g, Lib, policy=π_θ, value=V_θ, budget=B/2, algorithm=best_first))
    if res = ⊥ and is_program_spec(g):
      res ← CEGIS(g, Lib, tests=spec_tests(g), budget=B/4)  # counterexample-guided; verifier = spec checker
    if res = ⊥: return UNKNOWN(PROOF_NOT_FOUND, partial=proofs, plan=[increase_budget, decompose(g)])
    proofs[g] ← res
  art ← assemble(proofs, ob.spec)
  verdicts ← [k.check(art.cert) for k in VFC.checkers(≥2, EIM_independent)]
  if not all(verdicts): return VFC_INCIDENT(art, verdicts)   # never ADMIT on disagreement (MFA-INV-084)
  Lib ← Lib ⊕ art ; CC.assert(proved(ob), cert=art.cert, cost=B_used)
  return art
```

### Guided_Search (best-first με πολιτική/αξία) — πολυπλοκότητα: O(B · (|tactics| · cost(π_θ) + cost(kernel step)))

```
function Guided_Search(goal, Lib, π, V, budget):
  frontier ← PQ({state0(goal)}, key = −V(state))
  while budget > 0 and frontier ≠ ∅:
    s ← frontier.pop() ; budget −= 1
    for (tac, p) in top_k(π(· | s, Lib), k):
      s' ← apply(tac, s)                                     # Lean elaborator step; failures are negative examples for PRR
      if s'.goals = ∅: return extract_term(s')
      frontier.push(s', key = −(V(s') + log p))
  return ⊥
```

### Library-Compress (epoch) — πολυπλοκότητα: O(|Lib|² · anti-unification) ανά epoch· re-check O(|Lib| · kernel)

```
procedure Library_Compress(Lib):
  candidates ← anti_unify_pairs(Lib, min_uses=3)              # common subterms across proofs/programs (DreamCoder-style)
  for c in candidates.sorted_by(compression_gain):
    Lib' ← refactor(Lib, abstraction=c)
    if all(VFC.verify(a) for a in Lib'.artifacts) and total_length(Lib') < total_length(Lib): Lib ← Lib'
  Stats.record(sealed_obligations: success_rate_per_budget, mean_proof_length)   # MFA-VO-071 growth record
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| TGPS-E1 | Σφραγισμένο σύνολο 500 υποχρεώσεων (miniF2F-class + 50 VO specs)· καμπύλη επιτυχίας vs budget ανά epoch (πριν/μετά compress+PRR) | Μετά 3 epochs: success@B αυξάνει ≥ 10 pp ΚΑΙ μέσο μήκος απόδειξης μειώνεται ≥ 20 %· 0 ADMIT με checker διαφωνία |
| TGPS-E2 | Σύνθεση 100 προγραμμάτων Skill Library από spec+tests (raw επεισόδια)· CEGIS + guided | ≥ 70 % με πιστοποιητικό (refinement ή πλήρης test+contract)· 0 ψευδώς πιστοποιημένα σε adversarial tests |

## Επιστημική κατάσταση (§5) — συνολικά: **NOVEL SYNTHESIS**

| Ισχυρισμός | Κατάσταση |
|---|---|
| Neural-guided proof search σε Lean πετυχαίνει σε ανταγωνιστικά σύνολα | EMPIRICALLY SUPPORTED |
| Library learning μειώνει μήκος/κόστος σύνθεσης | EMPIRICALLY SUPPORTED |
| Ενιαία βιβλιοθήκη αποδείξεων+προγραμμάτων υπό 2-checker VFC με obligation-tier budgets | NOVEL SYNTHESIS |
| Μετρήσιμη αυτο-βελτίωση της αναζήτησης σε σφραγισμένες υποχρεώσεις του GRAIL | RESEARCH HYPOTHESIS |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή (tools/twin): Obligation/Artifact/2-checker ADMIT, growth record
2. F2: Lean 4 + LeanDojo-class υποδομή ως αντικαταστάσιμη υλοποίηση· TGPS-E1 σε DEP-1/2
3. F3: PRR πολιτική, compress, TGPS-E2
4. F4: παραγωγή Δόση 1–3
