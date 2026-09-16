# MFA-MECH-028 — Abductive Hypothesis Engine (AHE) — εφεύρεση υποθέσεων με τύπο falsifier και Expected Falsification Value

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-028.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-053 · MFA-OBJ-050 · MFA-CAP-020 (αντιπαλική συλλογιστική) · MFA-ELM-030 Science Organ (συμπληρώνεται, δεν αντικαθίσταται)

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-028 |
| **2. Όνομα** | Abductive Hypothesis Engine (AHE) — εφεύρεση υποθέσεων με τύπο falsifier και Expected Falsification Value |
| **3. Ικανότητα** | MFA-CAP-092 — Εφεύρεση υποθέσεων (§8 #8): από ανωμαλία σε σύνολο ανταγωνιστικών, διαψεύσιμων υποθέσεων με σχεδιασμένο πείραμα, χωρίς ανθρώπινη πρόταση. |
| **4. Πρόβλημα** | Το 0.3.0 Science Organ (MFA-ELM-030) έχει «φάση υπόθεσης» χωρίς γεννήτρια. Αφετηρίες: abductive logic programming (Kakas, Kowalski & Toni 1992), ILP (Muggleton 1991· Popper, Cropper & Morel 2021· ILASP), LLM-driven discovery (FunSearch, Romera-Paredes et al. 2024· AI Scientist, Lu et al. 2024), Bayesian model selection/experimental design (Lindley 1956· MacKay 1992), automated science (ADAM/EVE robot scientist, King et al. 2009). Όρια: οι υποθέσεις δεν είναι τυπωμένα αντικείμενα με υποχρεωτικό falsifier· η επιλογή πειράματος δεν είναι δεμένη με εξουσία/αναστρεψιμότητα· οι γεννήτριες είναι ομογενείς (ένα μοντέλο) — καμία ανεξαρτησία· δεν μαθαίνεται βιβλιοθήκη εξηγητικών σχημάτων με provenance· καμία δεν προάγει επιζώσες υποθέσεις σε έννοιες/αιτιακές ακμές μηχανικά. |
| **5. Πρώτη αρχή** | Υπόθεση = τυπωμένη δέσμευση H = ⟨explanandum, μοντέλο/πρόγραμμα, falsifier, νέες προβλέψεις, κόστος ελέγχου⟩· χωρίς falsifier δεν εισάγεται (η απόρριψη καταγράφεται). Τρεις EIM-ανεξάρτητες γεννήτριες (ILP πάνω στην οντολογία, αναζήτηση προγραμμάτων στο Skill Library, παραμετρική πρόταση από κυρίαρχο μοντέλο) ανταγωνίζονται· κατάταξη με Expected Falsification Value EFV(H) = P(διάψευση)·InfoGain / cost· έλεγχος Genesis-first (LWM/World Twin/DST) και μετά υπό RET· επιζώσες υποθέσεις προάγονται μηχανικά σε OGE (έννοιες) ή CDCE (ακμές)· επαναλαμβανόμενα εξηγητικά σχήματα συμπιέζονται (anti-unification) σε βιβλιοθήκη. |
| **6. Οντολογία** | Anomaly a = ⟨observation, prediction, residual, provenance⟩· Hypothesis H = ⟨cid, explanandum a, model m (λογικό πρόγραμμα ∣ Skill program ∣ παραμετρικό), falsifier φ (εκτελέσιμο test με προκαταχωρισμένο κριτήριο), novel_predictions N_H, cost c_H, generator_lineage⟩· EFV(H) = P_refute(H)·IG(H) / c_H, IG = H(posterior over competing hypotheses) − E[H ∣ test outcome]· HypothesisSet S_a: ανταγωνιστικές υποθέσεις για την ίδια ανωμαλία με posterior· ExplanationSchema σ: anti-unified πρότυπο υποθέσεων (βιβλιοθήκη)· TestPlan = ⟨H, φ, venue ∈ {DST, LWM, WorldTwin, Effect(RET)}, budget⟩ |
| **7. Κατάσταση** | Μεταβλητές: A_t ουρά ανωμαλιών· S_t σύνολα υποθέσεων ανά ανωμαλία με posterior· Lib_t βιβλιοθήκη σχημάτων· Tests_t (προγραμματισμένα/εκτελεσμένα)· GenStats_t (calibration ανά γεννήτρια — proper scoring από HELD_OUT) ‖ Μεταβάσεις: ANOMALY: residual > θ ή Void entry ⇒ a ∈ A_t· GENERATE: S_a ← ∪_g Gen_g(a, Lib) με g EIM-ανεξάρτητες· type-check φ (χωρίς falsifier ⇒ REJECTED_UNFALSIFIABLE, καταγράφεται)· RANK: EFV· schedule top-k υπό budget· TEST: venue Genesis-first· Effect μόνο RET REVERSIBLE/envelope· UPDATE: Bayesian posterior· διαψευσμένες → FALSIFIED (μένουν)· επιζώσες με N_H επιβεβαιωμένες → PROMOTE· PROMOTE: υπόθεση-έννοια → OGE.birth· υπόθεση-αιτία → CDCE edge INT· υπόθεση-νόμος → Skill Library + TGPS απόδειξη· COMPRESS: anti-unify επιζώσες → Lib_{t+1} |
| **8. Είσοδοι/έξοδοι** | AHE.submit(anomaly)→AnomalyId· AHE.hypotheses(anomaly)→[Hypothesis with EFV, status]· AHE.test(H)→TestPlan· AHE.promote(H)→{ConceptCommitment ∣ CausalEdge ∣ SkillProgram}· AHE.schemas()→Lib· AHE.generator_calibration()→[(generator, score)] |
| **9. Αλγόριθμος** | **AHE-Loop** [Ανά ανωμαλία: γεννήτριες O(G·budget_g)· ILP NP-hard φραγμένο από μέγεθος χώρου υποθέσεων (Popper: constraint pruning)· κατάταξη O(∣S∣ log ∣S∣)· έλεγχος = κόστος venue]· **derive_novel_predictions** [O(∣model∣ · forward chaining depth)] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-028.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-056 (Abductive Hypothesis: submit/hypotheses/test/promote)· MFA-CON-034 (RET)· MFA-CON-054/055 (OGE/CDCE promote) ‖ Εξουσία: Γένεση/κατάταξη = Genesis plane· έλεγχοι στο Effect plane μόνο υπό RET + envelope· PROMOTE = Proceeding-lite όταν αγγίζει Tier-0/1 έννοιες· ο δημιουργός βλέπει κάθε υπόθεση στο cockpit (MFA-ELM-091). |
| **11. Εξαρτήσεις** | Γνωστές: MFA-ELM-030 Science Organ· MFA-ELM-109 OGE· MFA-ELM-110 CDCE· MFA-ELM-025 Skill Library· MFA-ELM-100 SMF (παραμετρική γεννήτρια)· MFA-MECH-009 EIM· MFA-MECH-019 PDE (βάρη)· MFA-ELM-028 Void· MFA-ELM-050 CAM-NS ‖ Άγνωστες: MFA-UNK-117: αν οι ILP γεννήτριες κλιμακώνουν σε νομικές οντολογίες 10³+ predicates (EPISTEMIC· AHE-E2) |
| **12. Πόροι** | DEP-1: ILP (Popper) CPU λεπτά/ανωμαλία, 10 υποθέσεις/ημέρα· DEP-2: παραμετρική γεννήτρια GPU, 10² ανωμαλίες/ημέρα· DEP-3+: 10⁴· βιβλιοθήκη O(∣Lib∣²) ανά epoch συμπίεσης |
| **13. Κλιμάκωση** | Ρυθμός επιζωσών υποθέσεων ανά compute (MFA-VO-070)· αναμένεται υπο-γραμμικός στις ανωμαλίες (οι εύκολες πρώτα)· η βιβλιοθήκη μειώνει το κόστος γέννησης ~ log(∣Lib∣). |
| **14. Αποτυχίες** | Ad hoc υποθέσεις (εξηγούν μόνο το explanandum) → ανίχνευση: N_H = ∅ → απόκριση: REJECTED_AD_HOC (MFA-INV-082)· Γεννήτρια που κυριαρχεί (mode collapse) → ανίχνευση: diversity(S) < θ → απόκριση: quota ανά γεννήτρια· EIM έλεγχος· P-hacking μέσω πολλών ελέγχων → ανίχνευση: FDR → απόκριση: προκαταχωρισμένο κριτήριο + BH διόρθωση· Επικίνδυνο πείραμα → ανίχνευση: RET IRREVERSIBLE → απόκριση: μόνο Genesis venues ή δημιουργός· Αντιπαλική ανωμαλία (σπρώχνει προς επιθυμητή υπόθεση) → ανίχνευση: taint προέλευσης → απόκριση: CAM-NS ως αντίπαλος στο S· quarantine |
| **15. Αντιπαλικοί** | Περιορισμός: Genesis-first· Effect ελέγχοι υπό RET· budgets· κάθε PROMOTE αναστρέψιμο (OGE/CDCE γενεαλογία)· Emergency-stop. ‖ Κλάση αναστρεψιμότητας: REVERSIBLE (υποθέσεις = δεσμεύσεις· PROMOTE αναστρέψιμο)· ελέγχοι = η RET κλάση του venue |
| **16. Επαλήθευση** | MFA-VO-070: AHE-E1 (seeded κρυφοί μηχανισμοί σε DST) F2· AHE-E2 (νομικές ανωμαλίες, HELD_OUT dockets) F3· property: κάθε H έχει φ εκτελέσιμο (F1)· calibration των γεννητριών με proper scoring ‖ Invariants: MFA-INV-082: καμία υπόθεση χωρίς εκτελέσιμο falsifier και ≥1 νέα πρόβλεψη· η απόρριψη καταγράφεται· MFA-INV-083: διαψευσμένες υποθέσεις παραμένουν (FALSIFIED) — μόνο ο μηχανισμός τους κρίνεται, η ικανότητα μένει |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή: Hypothesis type με υποχρεωτικό falsifier, EFV, bayes update (tools/twin) |
| **18. Ελάχιστο πείραμα** | **AHE-E1**: DST με 50 κρυφούς μηχανισμούς που παράγουν ανωμαλίες· AHE έναντι (α) τυχαίων υποθέσεων ίδιου τύπου, (β) μίας γεννήτριας — κριτήριο (προκαταχωρισμένο): ανάκτηση ≥ 60 % μηχανισμών σε budget· EFV-κατάταξη μειώνει ελέγχους ανά ανάκτηση ≥ 30 % έναντι τυχαίας· **AHE-E2**: Ανωμαλίες = απροσδόκητες εκβάσεις δικαστηρίου σε HELD_OUT dockets· υποθέσεις για κρυφές μεταβλητές· επαλήθευση σε μεταγενέστερα dockets — κριτήριο (προκαταχωρισμένο): ≥ 1 επιζώσα υπόθεση με επιβεβαιωμένη νέα πρόβλεψη σε μεταγενέστερα δεδομένα· Brier των N_H < baseline |
| **19. Διάψευση** | AHE-E1: ανάκτηση όχι καλύτερη από τυχαίες υποθέσεις· Καμία επιζώσα υπόθεση με επιβεβαιωμένη νέα πρόβλεψη σε 2 δόσεις· Οι τρεις γεννήτριες δεν είναι EIM-ανεξάρτητες (τότε ο μηχανισμός τρέχει ως μονή γεννήτρια — ο ισχυρισμός ανεξαρτησίας διαψεύδεται, όχι η ικανότητα) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 1: ILP γεννήτρια + Genesis venues + EFV· Δόση 2: παραμετρική γεννήτρια (SMF) + AHE-E1· Δόση 3: Effect ελέγχοι υπό envelope + AHE-E2 + βιβλιοθήκη σχημάτων· Δόση 4: υπό RVSI L2. |
| **21. Εξέλιξη** | Calibration ανά γεννήτρια με proper scoring (HELD_OUT) → βάρη PDE· βιβλιοθήκη σχημάτων (μη-παραμετρική)· η παραμετρική γεννήτρια εκπαιδεύεται με PRR όπου η ανταμοιβή = επιβεβαιωμένες νέες προβλέψεις (όχι αποδοχή). |
| **22. Αλληλεπιδράσεις** | MFA-ELM-111 (νέο στοιχείο AHE, S2)· MFA-ELM-030 (η φάση «υπόθεση» υλοποιείται από το AHE)· MFA-ELM-109/110 (PROMOTE)· MFA-ELM-112 TGPS (υπόθεση-νόμος → απόδειξη)· MFA-ELM-106 curriculum (ανωμαλίες ως έργα)· MFA-ELM-091 cockpit (ορατότητα) |

**AI Contribution Ledger:** `NEW ARCHITECTURAL INVENTION`

## Αλγόριθμοι (πλήρες pseudocode)

### AHE-Loop — πολυπλοκότητα: Ανά ανωμαλία: γεννήτριες O(G·budget_g)· ILP NP-hard φραγμένο από μέγεθος χώρου υποθέσεων (Popper: constraint pruning)· κατάταξη O(|S| log |S|)· έλεγχος = κόστος venue

```
procedure AHE_Loop(A, Lib, budget):
  for a in A.top_by(VOI, budget.anomalies):
    S ← ∅
    for g in [ILP_Gen, ProgramSearch_Gen, Parametric_Gen]:       # lineage-disjoint under EIM (MFA-MECH-009)
      for H in g.generate(a, Lib, k=budget.per_gen):
        if H.falsifier = ⊥ or not executable(H.falsifier): record(REJECTED_UNFALSIFIABLE, H) ; continue
        if not predicts(H, a.observation): continue               # must explain the explanandum
        H.novel_predictions ← derive_novel_predictions(H, exclude=a)   # at least one prediction not used to build H
        if H.novel_predictions = ∅: record(REJECTED_AD_HOC, H) ; continue
        S.add(H)
    S ← dedupe_by_extension(S) ; prior ← generator_calibrated_prior(S, GenStats)
    for H in S: H.EFV ← P_refute(H, prior) · IG(H, S, prior) / cost(H)
    for H in top_k(S, by=EFV, k=budget.tests):
      venue ← first_informative([DST, LWM, WorldTwin, Effect]) s.t. RET_allows(venue, H.falsifier)
      outcome ← run(H.falsifier, venue)                           # pre-registered criterion, receipt
      posterior ← bayes_update(prior, S, outcome)
      if outcome = REFUTED: H.status ← FALSIFIED (kept)
    survivors ← {H ∈ S : posterior(H) > θ_promote ∧ confirmed(H.novel_predictions) ≥ 1}
    for H in survivors: PROMOTE(H)                                # OGE / CDCE / SkillLibrary+TGPS, with provenance
    GenStats.update(proper_score(each generator, outcomes))       # HELD_OUT scorer; feeds PDE weights (MFA-MECH-019)
  Lib ← Lib ∪ anti_unify(survivors)                               # explanation schemas; compression measured
```

### derive_novel_predictions — πολυπλοκότητα: O(|model| · forward chaining depth)

```
function derive_novel_predictions(H, exclude):
  preds ← forward_chain(H.model, facts=ledger_cut \ exclude, depth ≤ d)
  return {p ∈ preds : p ∉ used_to_build(H) ∧ testable(p) ∧ p ∉ known_facts}   # Popperian content: risky predictions only
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| AHE-E1 | DST με 50 κρυφούς μηχανισμούς που παράγουν ανωμαλίες· AHE έναντι (α) τυχαίων υποθέσεων ίδιου τύπου, (β) μίας γεννήτριας | ανάκτηση ≥ 60 % μηχανισμών σε budget· EFV-κατάταξη μειώνει ελέγχους ανά ανάκτηση ≥ 30 % έναντι τυχαίας |
| AHE-E2 | Ανωμαλίες = απροσδόκητες εκβάσεις δικαστηρίου σε HELD_OUT dockets· υποθέσεις για κρυφές μεταβλητές· επαλήθευση σε μεταγενέστερα dockets | ≥ 1 επιζώσα υπόθεση με επιβεβαιωμένη νέα πρόβλεψη σε μεταγενέστερα δεδομένα· Brier των N_H < baseline |

## Επιστημική κατάσταση (§5) — συνολικά: **NOVEL SYNTHESIS**

| Ισχυρισμός | Κατάσταση |
|---|---|
| ILP/abductive LP παράγουν εξηγητικές υποθέσεις σε συμβολικά πεδία | EMPIRICALLY SUPPORTED |
| EFV (P_refute·IG/cost) ως κατάταξη μειώνει ελέγχους ανά ανάκτηση | RESEARCH HYPOTHESIS |
| Τυπωμένες υποθέσεις με υποχρεωτικό falsifier + PROMOTE σε OGE/CDCE | NOVEL SYNTHESIS |
| Κέρδος σε νομικές ανωμαλίες | RESEARCH HYPOTHESIS |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή: Hypothesis type με υποχρεωτικό falsifier, EFV, bayes update (tools/twin)
2. F2: DST AHE-E1 με Popper ως αντικαταστάσιμη ILP υλοποίηση
3. F3: AHE-E2 σε HELD_OUT dockets, DEP-2
4. F4: παραγωγή Δόση 2–3
