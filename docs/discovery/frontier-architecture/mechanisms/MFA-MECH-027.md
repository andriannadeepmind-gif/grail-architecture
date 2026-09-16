# MFA-MECH-027 — Causal Discovery & Counterfactual Engine (CDCE) — το ledger ως παρεμβατικό σύνολο δεδομένων

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-027.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-053 · MFA-OBJ-050 · MFA-CAP-014 (αιτιακή/αντιπαραγοντική συλλογιστική) · MFA-TEL-08

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-027 |
| **2. Όνομα** | Causal Discovery & Counterfactual Engine (CDCE) — το ledger ως παρεμβατικό σύνολο δεδομένων |
| **3. Ικανότητα** | MFA-CAP-090, MFA-CAP-091 — Αιτιακή ανακάλυψη (§8 #5) από παρατηρήσεις ΚΑΙ παρεμβάσεις που το ίδιο το σύστημα προτείνει και εκτελεί υπό RET· πλήρης αντιπαραγοντική προσομοίωση (§8 #6) με τυπωμένη αβεβαιότητα. |
| **4. Πρόβλημα** | Το 0.3.0 (MFA-ELM-022) υποθέτει ΔΕΔΟΜΕΝΟ SCM και κάνει do-calculus· δεν ανακαλύπτει δομή. Γνωστές αφετηρίες: PC/FCI (Spirtes, Glymour & Scheines 2000), GES (Chickering 2002), NOTEARS (Zheng et al. 2018), interventional discovery (Eberhardt 2007· Hauser & Bühlmann 2012 GIES), causal representation learning (Schölkopf et al. 2021), twin networks για αντιπαραγοντικά (Balke & Pearl 1994), active intervention selection (Tong & Koller 2001). Όρια: υποθέσεις faithfulness/sufficiency χωρίς επιστημική σήμανση ανά ακμή· οι παρεμβάσεις δεν υπόκεινται σε αρχή εξουσίας/αναστρεψιμότητας (ένα σύστημα με Effect plane ΔΕΝ μπορεί να «κάνει do» ελεύθερα)· καμία δεν χρησιμοποιεί ένα append-only ledger με receipts ως φυσικό παρεμβατικό dataset με χρονική διάταξη ως περιορισμό προσανατολισμού· καμία δεν επιστρέφει UNKNOWN(reason) όταν η δομή είναι υποπροσδιορισμένη. |
| **5. Πρώτη αρχή** | Το ledger είναι παρεμβατικό dataset: κάθε Effect με receipt είναι do(X=x) με γνωστό στόχο και χρόνο· κάθε Genesis-plane διακλάδωση είναι παρατηρησιακό στρώμα· η αιτιακή δομή είναι ΔΕΣΜΕΥΣΗ (CausalGraphCommitment) με επιστημική κατάσταση ανά ακμή (OBSERVATIONAL / INTERVENTION-SUPPORTED / REFUTED / UNDETERMINED)· οι νέες παρεμβάσεις προτείνονται ως Effects με VOI/κόστος και περνούν από RET (πρώτα Genesis/LWM, μετά REVERSIBLE στο Effect plane, ποτέ IRREVERSIBLE χωρίς AutonomyEnvelope)· κάθε αντιπαραγοντική απάντηση φέρει τύπο αβεβαιότητας και επιστρέφει UNKNOWN(CAUSAL_UNDERDETERMINED) με σχέδιο παρεμβάσεων όταν το ερώτημα δεν ταυτοποιείται. |
| **6. Οντολογία** | SCM M = ⟨V, E, F, P_U⟩ με V από έννοιες OGE· E ⊆ V×V με EdgeStatus ∈ {OBS, INT, REF, UND} και posterior p_e· InterventionRecord ι = ⟨target X, value x, time τ, receipt, RET class⟩ — εξάγεται από το ledger (Effect plane) ή από DST/LWM (Genesis)· InterventionProposal = ⟨X, x, VOI = E[ΔH(E)], cost, RET_class, envelope⟩· CounterfactualQuery q = ⟨evidence e, do(X=x′), outcome Y⟩ → απάντηση ⟨P(Y_{x′} ∣ e), uncertainty_type ∈ {IDENTIFIED, PARTIAL-BOUNDS, UNKNOWN(reason)}⟩· TwinNetwork(M, e): factual+counterfactual αντίγραφο με κοινές U (Balke–Pearl)· CausalGraphCommitment = H(M, evidence_cut, per-edge status) — ASSERT στο CC με provenance |
| **7. Κατάσταση** | Μεταβλητές: M_t (τρέχον SCM ensemble, B bootstrap δείγματα)· EdgeStatus_t· I_t (παρεμβάσεις που εκτελέστηκαν/εκκρεμούν)· Budget_t (παρεμβάσεις ανά RET class, MFA-DEC-025)· OpenQueries_t (αντιπαραγοντικά ερωτήματα UNKNOWN με σχέδιο) ‖ Μεταβάσεις: INGEST: νέο cut → ενημέρωση παρατηρησιακών στρωμάτων και InterventionRecords από receipts· DISCOVER: M_t ← FCI+GIES με χρονικούς περιορισμούς → ensemble· EdgeStatus από υποστήριξη· PROPOSE: π ← argmax VOI/cost υπό RET· Genesis-first (LWM/DST)· EXECUTE: Effect-plane παρέμβαση μόνο με AutonomyGrant REVERSIBLE ή ρητή έγκριση· receipt → I_{t+1}· UPDATE: p_e ανανεώνεται· ακμές που διαψεύδονται → REF (δεν διαγράφονται)· ANSWER: αντιπαραγοντικό μέσω TwinNetwork· αν μη-ταυτοποιήσιμο → UNKNOWN(reason, plan=proposals) |
| **8. Είσοδοι/έξοδοι** | CDCE.discover(cut)→CausalGraphCommitment· CDCE.edges(cid)→[(edge, p, status)]· CDCE.propose(budget)→[InterventionProposal]· CDCE.counterfactual(evidence, do, Y)→TypedAnswer· CDCE.explain(answer)→trace (ποιες ακμές/παρεμβάσεις στήριξαν) |
| **9. Αλγόριθμος** | **CDCE-Discover** [FCI: O(n^{d+2}) για μέγιστο βαθμό d (φραγμένος από πολιτική d≤4)· GIES ανά παρέμβαση O(n²·∣I∣)· ensemble ×B (B=50)· ανά cut]· **CDCE-ProposeIntervention** [O(∣UND∣·B·cost(sim)) — VOI εκτίμηση με LWM/DST rollouts· φραγμένη από Budget]· **CDCE-Counterfactual** [Abduction O(∣U∣·inference)· predict O(∣V∣)· επί B για bounds] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-027.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-055 (Causal Discovery & Counterfactual: discover/propose/counterfactual με typed uncertainty)· MFA-CON-034 (RET) για κάθε παρέμβαση· MFA-CON-050 (LWM) για Genesis-first προσομοίωση ‖ Εξουσία: Ανακάλυψη = Genesis plane χωρίς εξουσία· προτάσεις παρεμβάσεων = Effects μέσω PDP + RET + AutonomyEnvelope· προϋπολογισμοί ανά κλάση = MFA-DEC-025· αντιπαραγοντικά προς LPA ως ΠΡΟΒΛΕΨΕΙΣ (Prediction Doctrine MFA-CAP-072), ποτέ ως γεγονότα. |
| **11. Εξαρτήσεις** | Γνωστές: MFA-ELM-022 (SCM/do-calculus — επεκτείνεται)· MFA-ELM-109 OGE (μεταβλητές)· MFA-ELM-105 LWM· MFA-ELM-098 World Twin· MFA-MECH-006 RET· MFA-ELM-001/002 ledger· MFA-ELM-023 forks ‖ Άγνωστες: MFA-UNK-116: πυκνότητα χρήσιμων παρεμβάσεων στο νομικό ledger (EPISTEMIC· CDCE-E2) |
| **12. Πόροι** | DEP-1: n≤50 μεταβλητές, B=20, CPU λεπτά/cut· DEP-2: n≤500, B=50, GPU για μηχανισμούς· DEP-3+: n≤10⁴ με sparsity (d≤4)· LWM rollouts ms/κόμβο |
| **13. Κλιμάκωση** | SHD μειώνεται ~ 1/√(∣D∣) παρατηρησιακά και ~ γραμμικά με ∣I∣ παρεμβάσεις σε UND ακμές (GIES θεωρία)· το κόστος FCI πολυωνυμικό για φραγμένο d· μετριέται ως MFA-VO-069. |
| **14. Αποτυχίες** | Παραβίαση faithfulness (ακυρωτικές διαδρομές) → ανίχνευση: ασυμφωνία ensemble > θ σε ακμή με INT υποστήριξη → απόκριση: ακμή UND· προτείνεται παρέμβαση· ποτέ σημειακή απάντηση· Λανθάνοντες συγχυτές → ανίχνευση: FCI bidirected ακμές → απόκριση: PARTIAL_BOUNDS· αναζήτηση proxy μεταβλητών από OGE· Παρέμβαση με ανεπιθύμητη επίδραση → ανίχνευση: RET presimulation διαφωνεί με LWM → απόκριση: Both → Court· παρέμβαση αναβάλλεται· Data dredging (πολλαπλοί έλεγχοι) → ανίχνευση: FDR > q → απόκριση: Benjamini–Hochberg ανά cut· ακμές OBS με FDR-διορθωμένο p· Αντιπαλικό ledger (ψεύτικα receipts) → ανίχνευση: receipt χωρίς επαληθεύσιμη προέλευση → απόκριση: παρέμβαση εξαιρείται (taint)· MFA-INV-070 |
| **15. Αντιπαλικοί** | Περιορισμός: Genesis-first πάντα· Effect παρεμβάσεις μόνο REVERSIBLE εντός AutonomyEnvelope· προϋπολογισμός· Emergency-stop ακυρώνει εκκρεμείς προτάσεις. ‖ Κλάση αναστρεψιμότητας: Ανακάλυψη: REVERSIBLE (δεσμεύσεις)· παρεμβάσεις: η κλάση της παρέμβασης (RET), ποτέ IRREVERSIBLE αυτόνομα |
| **16. Επαλήθευση** | MFA-VO-069: CDCE-E1 (συνθετικά SCM, SHD) F2· CDCE-E2 (νομικά dockets, World Twin) F3· property test: κάθε Effect-παρέμβαση έχει receipt+RET (F1 tools/twin)· ID-test ορθότητα έναντι γνωστών ταυτοποιήσιμων/μη ερωτημάτων (Lean ή property) ‖ Invariants: MFA-INV-080: καμία παρέμβαση στο Effect plane χωρίς RET κλάση + receipt· IRREVERSIBLE μόνο με AutonomyEnvelope ή δημιουργό· MFA-INV-081: κάθε αντιπαραγοντική απάντηση φέρει τύπο αβεβαιότητας· μη-ταυτοποιήσιμο ⇒ UNKNOWN(reason) με σχέδιο, ποτέ σημειακή εκτίμηση |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή (tools/twin): SCM, EdgeStatus, RET-gated intervention, typed counterfactual answer |
| **18. Ελάχιστο πείραμα** | **CDCE-E1**: DST: 100 τυχαία SCM (n=30, d≤3)· ledger με 10³ παρατηρήσεις + k παρεμβάσεις που το CDCE ΕΠΙΛΕΓΕΙ (VOI) έναντι τυχαίων — κριτήριο (προκαταχωρισμένο): SHD(VOI) < SHD(random) με διακριτικό περιθώριο για k∈{5,10,20}· 0 σημειακές απαντήσεις σε μη-ταυτοποιήσιμα ερωτήματα· **CDCE-E2**: World Twin δρώντες από docket· αντιπαραγοντικά «αν είχε κατατεθεί X» σε HELD_OUT υποθέσεις με γνωστή έκβαση — κριτήριο (προκαταχωρισμένο): Brier score IDENTIFIED απαντήσεων < LWM-only baseline· PARTIAL_BOUNDS καλύπτουν την έκβαση ≥ 90 % |
| **19. Διάψευση** | SHD με VOI-παρεμβάσεις όχι καλύτερο από τυχαίες σε καμία ρύθμιση (ο επιλογέας δεν προσθέτει)· Αντιπαραγοντικά IDENTIFIED με Brier χειρότερο από LWM-only σε 2 δόσεις· Οποιαδήποτε Effect-παρέμβαση χωρίς RET receipt (σφάλμα υλοποίησης) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 1: CDCE-lite (PC με χρονικούς περιορισμούς, αντιπαραγοντικά μόνο IDENTIFIED/UNKNOWN)· Δόση 2: GIES από receipts + VOI προτάσεις Genesis-only + CDCE-E1· Δόση 3: Effect REVERSIBLE παρεμβάσεις υπό envelope + CDCE-E2· Δόση 4: υπό RVSI L2. |
| **21. Εξέλιξη** | Δομική μάθηση (μη-παραμετρική) + μηχανισμοί F μαθημένοι παραμετρικά (SMF) με provenance ανά ακμή· ενεργητική μάθηση παρεμβάσεων (VOI)· υπό RVSI L2: α, d, B, VOI-εκτιμητής. |
| **22. Αλληλεπιδράσεις** | MFA-ELM-110 (νέο στοιχείο CDCE, S2)· MFA-ELM-022 (γίνεται ο do-calculus πυρήνας του CDCE)· MFA-ELM-111 AHE (υποθέσεις για UND ακμές)· MFA-ELM-019 Deliberation (αντιπαραγοντικά ως value)· MFA-ELM-007/MFA-ELM-010 PDP/RET· MFA-ELM-126 Twin (branching worlds = παρεμβάσεις) |

**AI Contribution Ledger:** `CROSS-SOURCE SYNTHESIS`

## Αλγόριθμοι (πλήρες pseudocode)

### CDCE-Discover — πολυπλοκότητα: FCI: O(n^{d+2}) για μέγιστο βαθμό d (φραγμένος από πολιτική d≤4)· GIES ανά παρέμβαση O(n²·|I|)· ensemble ×B (B=50)· ανά cut

```
procedure CDCE_Discover(cut, O):
  V ← variables_from_ontology(O, cut)                       # concepts with measurable extension in this cut
  strata ← observational_strata(cut)                       # Genesis branches + pre-intervention windows
  I ← intervention_records(cut)                            # every Effect receipt: do(X=x) at τ
  M_ens ← []
  for b in 1..B:
    D_b ← bootstrap(strata) ; I_b ← bootstrap(I)
    G ← FCI(D_b, α, max_degree=d, order_constraints=ledger_time_order)   # τ(X) < τ(Y) ⇒ ¬(Y→X)
    G ← GIES_orient(G, I_b)                                # interventions orient/undirected edges (Hauser–Bühlmann)
    M_ens.append(G)
  for e in candidate_edges(M_ens):
    p_e ← freq(e ∈ M_ens)
    status_e ← INT if supported_by_intervention(e, I) else OBS if p_e > θ_obs else UND
    if refuted_by_intervention(e, I): status_e ← REF        # kept, never deleted
  M ← ⟨V, {e : status_e ∈ {INT, OBS}}, F ← fit_mechanisms(M_ens, strata, I), P_U⟩
  return CC.assert(CausalGraphCommitment(M, cut, {e: (p_e, status_e)}))
```

### CDCE-ProposeIntervention — πολυπλοκότητα: O(|UND|·B·cost(sim)) — VOI εκτίμηση με LWM/DST rollouts· φραγμένη από Budget

```
procedure CDCE_ProposeIntervention(M, budget):
  props ← []
  for X in variables_with_undetermined_edges(M):
    for x in candidate_values(X):
      ΔH ← expected_entropy_reduction(EdgeStatus, do(X=x), M_ens)      # over ensemble disagreement
      cls ← RET.classify(do(X=x))                                      # REVERSIBLE / IRREVERSIBLE / DISCLOSE
      if cls = IRREVERSIBLE and not AutonomyEnvelope.covers(do(X=x)): cls ← FORBIDDEN_WITHOUT_CREATOR
      cost ← resource_cost(X, x) + risk_penalty(cls)
      props.append(InterventionProposal(X, x, VOI=ΔH, cost, cls))
  props ← sort_by(VOI/cost) ; plan ← []
  for p in props:
    if p.cls = FORBIDDEN_WITHOUT_CREATOR: plan.append(escalate(p)) ; continue
    if budget.allows(p.cls):                                             # MFA-DEC-025 budgets per RET class
      first ← simulate(LWM, DST, p)                                      # Genesis-first: never skip
      if first.informative: plan.append(p) ; budget.consume(p)
  return plan                                                            # each executed as Effect with receipt (MFA-INV-080)
```

### CDCE-Counterfactual — πολυπλοκότητα: Abduction O(|U|·inference)· predict O(|V|)· επί B για bounds

```
function CDCE_Counterfactual(M_ens, e, do(X=x'), Y):
  results ← []
  for M in M_ens:
    if not identifiable(M, e, X, Y): continue                            # Shpitser–Pearl ID / IDC test
    T ← TwinNetwork(M, e)
    U* ← abduce(T, e)                                                    # step 1: posterior over exogenous
    T' ← intervene(T.cf_branch, X=x')                                    # step 2: action
    results.append(predict(T', Y, U*))                                   # step 3: prediction
  if results = ∅: return UNKNOWN(reason=CAUSAL_UNDERDETERMINED, plan=CDCE_ProposeIntervention(M, budget))
  if len(results) < B·θ_id: return PARTIAL_BOUNDS(min(results), max(results), coverage=len(results)/B)
  return IDENTIFIED(mean(results), CI=bootstrap_CI(results))              # typed uncertainty always attached (MFA-INV-081)
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| CDCE-E1 | DST: 100 τυχαία SCM (n=30, d≤3)· ledger με 10³ παρατηρήσεις + k παρεμβάσεις που το CDCE ΕΠΙΛΕΓΕΙ (VOI) έναντι τυχαίων | SHD(VOI) < SHD(random) με διακριτικό περιθώριο για k∈{5,10,20}· 0 σημειακές απαντήσεις σε μη-ταυτοποιήσιμα ερωτήματα |
| CDCE-E2 | World Twin δρώντες από docket· αντιπαραγοντικά «αν είχε κατατεθεί X» σε HELD_OUT υποθέσεις με γνωστή έκβαση | Brier score IDENTIFIED απαντήσεων < LWM-only baseline· PARTIAL_BOUNDS καλύπτουν την έκβαση ≥ 90 % |

## Επιστημική κατάσταση (§5) — συνολικά: **NOVEL SYNTHESIS**

| Ισχυρισμός | Κατάσταση |
|---|---|
| FCI/GIES ανακτούν δομή από παρατηρήσεις+παρεμβάσεις υπό faithfulness | PROVEN |
| Ledger receipts = έγκυρες do-παρεμβάσεις με χρονική διάταξη | IMPLEMENTABLE FROM KNOWN COMPONENTS |
| VOI-επιλογή παρεμβάσεων υπό RET υπερέχει τυχαίας | EMPIRICALLY SUPPORTED |
| Κέρδος αντιπαραγοντικών στο νομικό πεδίο | RESEARCH HYPOTHESIS |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή (tools/twin): SCM, EdgeStatus, RET-gated intervention, typed counterfactual answer
2. F2: DST CDCE-E1 (pgmpy/causal-learn ως αντικαταστάσιμες υλοποιήσεις υπό VFC)
3. F3: World Twin CDCE-E2 σε DEP-2
4. F4: παραγωγή Δόση 2–3
