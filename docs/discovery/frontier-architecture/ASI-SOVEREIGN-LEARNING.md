# ASI-SOVEREIGN-LEARNING — παραμετρική μάθηση μέσα στο κυρίαρχο όριο: SMF, PRR, CPCL, TGL, MSM, STP (0.4.0)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Κατάσταση:** PROPOSED / UNREVIEWED — προβολή των εδρών YAML και των INVENTION DOSSIERs (`inventions/`)· μόνο ο δημιουργός εγκρίνει· κανένας παραγωγικός κώδικας. Τα MFA-MECH-020…025 είναι PROVISIONAL / UNREVIEWED / NON-BINDING (§13).

## 1. Θέση

Το 0.3.0 είχε τα βάρη ως «παράγωγα (EP βαρών, DEC-X-19)» και διάβαζε το DEC-X-19 ως απαγόρευση (ASI-ABSTENTION-AUDIT AA-002). Στο 0.4.0 το DEC-X-19 είναι **ενεργό συμβόλαιο** (MFA-CON-047) από τη Δόση 1: τα βάρη είναι δεσμεύσεις (WeightCommitments, MFA-INV-069) με γενεαλογία, DataManifest, unlearning obligations και ORP. Η μάθηση δεν είναι «όταν ο δημιουργός το επιτρέψει»· είναι μηχανισμός με πύλες που ο δημιουργός ρυθμίζει (MFA-DEC-016/017).

## 2. Οι μηχανισμοί

| Μηχανισμός | Ρόλος | Στοιχείο | Πύλη | VO |
|---|---|---|---|---|
| SMF (MFA-MECH-020, provisional) | recipes: CONTINUED_PRETRAIN / SFT σε επαληθευμένα traces / PRR / DISTILL υπό DisclosureGrant / UNLEARN / FROM_SCRATCH (ALT-12) | MFA-ELM-100/101/102 | ORP + forgetting guard | MFA-VO-057/058/059 |
| PRR (MFA-MECH-021, provisional) | ανταμοιβή μόνο από επαλήθευση· process rewards από OC (0.4.0) | MFA-ELM-103 | seeded reward hacking | MFA-VO-060 |
| CPCL (MFA-MECH-035) | εδραίωση χωρίς λήθη: provenance-δειγματοληψία, Fisher-προβολή, anchors, πύλη BWT ΠΡΙΝ το merge, unlearning-συμβατή | MFA-ELM-118 | MFA-INV-096/097 | MFA-VO-077 |
| TGL (MFA-MECH-040) | θεωρήματα ως περιορισμοί (Tier-0 σκληροί), curriculum, ανταμοιβή | MFA-ELM-123 | MFA-INV-106/107 | MFA-VO-083 |
| MSM (MFA-MECH-037) | μηχανιστικό αυτο-μοντέλο: προστατευμένοι υπόχωροι, unlearning έλεγχος, CompetenceProfile | MFA-ELM-120 | MFA-INV-100/101 | MFA-VO-079 |
| STP (MFA-MECH-033) | Sovereignty Index, στάδια S0…S4, parity, ratchet ποιότητας, S1-PLATEAU (ATK-18) | MFA-ELM-116 | MFA-INV-092/093 | MFA-VO-075 |

## 3. Ο κανόνας γενεαλογίας

`distilled(student, P) ⇒ lineage(student) ∋ P` (MFA-INV-089, MFA-PATCH-0040): ο πάροχος δεν αξιολογεί το παιδί του· instances του ίδιου μοντέλου δεν είναι ανεξάρτητοι κριτές (§4). Η ανεξαρτησία μετριέται (EIM) και εφαρμόζεται πληθυσμιακά (ECE).

## 4. Ο κύκλος ύπνου (εδραίωση) — CPCL

```
procedure CPCL_Consolidate(w, cut, Obligations, Π, HELD_OUT, ε):
  E ← {e ∈ cut : e ∉ Obligations.shredded ∧ taint(e)=0 ∧ status(e) ∈ {VERIFIED, OBSERVED}}
  weights ← normalize(provenance_score(E) · surprise(E, LWM) · recency(E))
  batch ← sample(E, weights, n)
  anchors ← SLM.anchors(families) ∪ negative_anchors                     # behavioural anchors (MFA-MECH-014 SLM)
  θ_new ← θ(w)
  for step in 1..T:
    g ← ∇L(batch, θ_new) + λ_anchor·∇L_anchor(anchors, θ_new)
    for f in families: g ← g − Π_f Π_fᵀ g                                   # gradient projection away from protected subspaces
    θ_new ← θ_new − η·g ; assert KL(θ_new ∥ θ(w)) ≤ κ                       # MetaBound
  w' ← WeightCommitment(θ_new, recipe=r, parents=[w], manifest=batch)
  # GATE (before any merge; MFA-INV-096)
  for f in families: BWT[f] ← score(w', sealed_f) − score(w, sealed_f) ; FWT[f] ← score(w', new_f) − score(w, new_f)   # HELD_OUT scorer
  unl_ok ← ∀o ∈ Obligations.due: MSM.feature_absent(w', o.source)          # mechanistic unlearning check (MFA-MECH-037)
  anch_ok ← SLM.check(w', anchors)
  if all(BWT[f] ≥ −ε[f]) ∧ any(FWT[f] > 0) ∧ unl_ok ∧ anch_ok:
    ORP.merge(w → w', receipt=(BWT, FWT, unl_ok)) ; Π ← update_fisher(Π, w', families) ; T.append(BWT, FWT)
  else: record(REJECTED_RECIPE, r, evidence=(BWT, FWT, unl_ok, anch_ok))     # kept; capability unchanged
```

## 5. Η μετάβαση κυριαρχίας — STP

```
procedure STP_Step(cut):
  for f in Families:
    for x in Axes: SI[f,x] ← sovereign_share(VERIFIED(cut, f, x))
    parity[f] ← HELD_OUT.parity_test(f, sealed_f, sov=SovereignStack, prov=BestProvider, ε, CI)
    g ← Gate[Stage[f]]                                               # thresholds from MFA-DEC-021 (pre-registered)
    if SI[f,:] ≥ g.si ∧ parity[f] ∧ incidents(f, cut) = 0: streak[f] += 1 else streak[f] ← 0
    if streak[f] ≥ g.N and Stage[f] < S4:
      Stage[f] += 1 ; CC.assert(StageAdvance(f, Stage[f], evidence=(SI, parity, streak)))
      if Stage[f] = S2: Router.set_primary(f, Sovereign, fallback=Provider)
      if Stage[f] = S3: Router.set_provider_role(f, EVALUATOR_ONLY if EIM.lineage_disjoint(Provider, Sovereign[f]) else NONE)
      if Stage[f] = S4: Disclosure.revoke(Provider, f) ; keep_sealed_reactivation_path(f)
    elif not parity[f] and Stage[f] ≥ S2:
      Stage[f] −= 1 ; Router.restore_fallback(f) ; CC.assert(StageRegress(f, reason))   # never silent
  CGM.record(SI, cut)                                                # MFA-VO-075
```

Πύλες (MFA-DEC-021, PROPOSED): ε = 2 pp, N = 3 cuts, SI S1 0.1 / S2 0.5 / S3 0.8 / S4 0.95· S3→S4 με δημιουργό· S1-PLATEAU με εκτίμηση compute (CGM) → MFA-DEC-016.

## 6. Recipes ανά προφίλ (MFA-DEC-016, PROPOSED)

| DEP | Τι επιτρέπεται | Κόστος | Οικογένειες που αναμένεται να κινηθούν |
|---|---|---|---|
| DEP-1 | adapters 7–13B (LoRA-class), CPCL-lite, TGL-lite | ώρες/νύχτα | drafting, citation |
| DEP-2 | continued pretraining 70B 4-bit, PRR, CPCL με Fisher, MSM σε 7B | ημέρες | + research, procedural |
| DEP-3 | full fine-tune 8×80 GB, MSM 70B δείγμα στρωμάτων | εβδομάδες | + strategy |
| DEP-4 | pretraining ≥32 GPUs, FROM_SCRATCH γενιές | μήνες | reasoning-heavy (ATK-18) |

## 7. Unlearning

Shred πηγής ⇒ UnlearningObligation με deadline Δ (MFA-CAP-088)· εκπλήρωση = UNLEARN recipe ή retrain· επαλήθευση ΔΙΠΛΗ: μηχανιστική (MSM feature_absent) ΚΑΙ συμπεριφορική (membership inference, MFA-VO-058)· διαφωνία ⇒ obligation ανοιχτή· η εδραίωση ποτέ δεν δειγματοληπτεί obligated επεισόδια (MFA-INV-097).

## 8. Falsifiers

- MFA-MECH-033: STP-E1: καμία οικογένεια σε ισοτιμία μέσα στον DEP-2 προϋπολογισμό — διαψεύδεται η υπόθεση «SMF-adapters αρκούν» (η κυριαρχία μένει στόχος· επόμενος μηχανισμός: DEP-3 recipes/PRR/CPCL)
- MFA-MECH-035: CPCL-E1: BWT όχι καλύτερο από EWC-only (η σύνθεση δεν προσθέτει)
- MFA-MECH-037: MSM-E1: Brier όχι καλύτερο από τυχαία ablation (τα κυκλώματα δεν είναι προβλεπτικά — νέος φορμαλισμός features, η ικανότητα self-model μένει)
- MFA-MECH-040: TGL-E1: καμία αύξηση συνέπειας ή υποχώρηση νομικών οικογενειών (η καθοδήγηση δεν προσθέτει ή βλάπτει — νέος μηχανισμός καθοδήγησης, η ικανότητα μένει)
- MFA-MECH-020 (provisional): Αν μετά από τρία διαδοχικά recipes με πλήρη budget κανένα κυρίαρχο μοντέλο δεν φτάνει τον bootstrap πάροχο σε **καμία** οικογένεια, το SMF στο διαθέσιμο προφίλ είναι ανεπαρκές: η ικανότητα ΔΕΝ αφαιρείται — ανεβαίνει προφίλ (MFA-DEC-016) και καταγράφεται ως επιστημική αβεβαιότητα (MFA-UNK-112), όχι ως σχεδιαστικό όριο

## 9. Επιστημική κατάσταση

- Παραμετρική μάθηση μέσα στο κυρίαρχο όριο με δεσμεύσεις: IMPLEMENTABLE FROM KNOWN COMPONENTS (adapters/continued pretraining/EWC-class) + NOVEL SYNTHESIS (πύλες, provenance, γενεαλογία).
- Ισοτιμία με κορυφαίο πάροχο ανά οικογένεια σε DEP-2/3: RESEARCH HYPOTHESIS — ο ισχυρότερος επιζών κίνδυνος (ATK-18)· αν διαψευστεί, η ικανότητα μένει και ο μηχανισμός γίνεται DEP-3/4 recipe (MFA-DEC-016).
