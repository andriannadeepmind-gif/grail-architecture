# MFA-MECH-026 — Ontology Genesis Engine (OGE) — αυτόνομος σχηματισμός εννοιών με NON-COLLAPSE

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-026.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-053 (αυτόνομη οντολογία και αιτιακό κοσμομοντέλο) · MFA-OBJ-050 (ASI ενδογενής) · MFA-TEL-08 · ΝΟΜΟΣ ΜΗ ΥΠΟΒΑΘΜΙΣΗΣ: «μία έδρα ανά έννοια»

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-026 |
| **2. Όνομα** | Ontology Genesis Engine (OGE) — αυτόνομος σχηματισμός εννοιών με NON-COLLAPSE |
| **3. Ικανότητα** | MFA-CAP-089 — Αυτόνομος σχηματισμός οντολογίας (§8 #3): το σύστημα γεννά, διασπά, συγχωνεύει και αποσύρει έννοιες από τα δικά του δεδομένα/αποτυχίες πρόβλεψης, με γενεαλογία και χωρίς σιωπηλή κατάρρευση εννοιών. |
| **4. Πρόβλημα** | Το 0.3.0 έχει μόνο μητρώο (MFA-ELM-083 LinkML Ontology Registry) και loss map — καμία γένεση. Γνωστές αφετηρίες: (α) ontology learning από κείμενο (Text2Onto, DL-Learner, Lehmann 2009) — εξαρτάται από ανθρώπινο corpus και δεν μετρά κέρδος πρόβλεψης· (β) Formal Concept Analysis (Ganter & Wille 1999) — ακριβής αλλά εκθετική και χωρίς μάθηση intension· (γ) DreamCoder library learning (Ellis et al. 2021) — γεννά αφαιρέσεις προγραμμάτων, όχι έννοιες με σχέσεις/σχήμα· (δ) VQ/discrete representation learning και concept bottleneck (Koh et al. 2020) — έννοιες χωρίς ονόματα, χωρίς provenance, με συχνή κατάρρευση κωδίκων (codebook collapse)· (ε) symbol emergence (Taniguchi et al. 2016) — αναπτυξιακό, χωρίς εγγύηση μη-κατάρρευσης. Καμία δεν δίνει: μία έδρα ανά έννοια με γενεαλογία, κέρδος μετρημένο σε σφραγισμένα δεδομένα, συγχώνευση/διάσπαση ως προσφυγή με LossMap ανακτήσιμο (NON-COLLAPSE, MATERIAL §2 #16), και σχήμα που μεταναστεύει στο Commitment Calculus. |
| **5. Πρώτη αρχή** | Η έννοια είναι δέσμευση: γεννιέται όταν ένα υποψήφιο intension (πρόγραμμα ή λογικός ορισμός) πάνω σε extension (σύνολο δεσμεύσεων) αποδίδει μετρήσιμο κέρδος περιγραφής+πρόβλεψης G>θ σε σφραγισμένο split· κάθε συγχώνευση/διάσπαση είναι ΠΡΟΣΦΥΓΗ (Court-lite, EIM-ανεξάρτητοι αξιολογητές) με LossMap δεσμευμένο, ώστε η έκταση κάθε καταργημένης έννοιας να είναι ανακτήσιμη — NON-COLLAPSE ως θεώρημα της γενεαλογίας, όχι ως ελπίδα. |
| **6. Οντολογία** | Ontology O = ⟨C, ≤, R, Σ, L⟩: έννοιες C, υπαγωγή ≤ (μερική διάταξη), σχέσεις R ⊆ C×C×Names, σχήμα Σ (LinkML), γενεαλογία L (DAG γεννήσεων/συγχωνεύσεων/διασπάσεων)· Concept c = ⟨cid, intension I_c (πρόγραμμα στο Skill Library ή DL-ορισμός), extension E_c ⊆ Commitments (δείγμα + predicate), birth_gain, provenance⟩· GainFunctional G(O→O′ ∣ D_sealed) = [MDL(D∣O) − MDL(D∣O′)] + λ·[PredLoss(D∣O) − PredLoss(D∣O′)] − μ·∣Σ′ − Σ∣ (κόστος σχήματος)· LossMap(merge c₁,c₂→c) = ⟨διαμερισμός E_c σε E_{c₁}, E_{c₂}, διακρίνον predicate δ⟩ ώστε E_{c₁} = {x∈E_c : δ(x)} — δεσμευμένο· AnomalyQueue: residuals από LWM (MFA-ELM-105), Void Ledger (MFA-ELM-028), Self-Prediction Ledger (MFA-ELM-024), αποτυχίες schema validation· FormalContext K = ⟨X, A, I⟩ (αντικείμενα, ιδιότητες, incidence) με A = top-k ιδιότητες κατά αμοιβαία πληροφορία με το residual |
| **7. Κατάσταση** | Μεταβλητές: O_t (τρέχουσα οντολογία ως δέσμευση)· Q_t (ουρά ανωμαλιών με VOI)· Cand_t (υποψήφιες έννοιες με G, split ids)· Pending_t (προσφυγές συγχώνευσης/διάσπασης)· L_t (γενεαλογία)· θ_birth, θ_merge (κατώφλια — πολιτική, MFA-DEC-005 ORDER) ‖ Μεταβάσεις: OBSERVE: residual r εισέρχεται στην Q_t με VOI(r) = αναμενόμενη μείωση PredLoss· PROPOSE: Cand ← FCA-lattice(K(r)) ∪ ProgramInduction(E) · κάθε υποψήφια με G σε σφραγισμένο split· BIRTH: G(c) > θ_birth ∧ ¬∃c′∈C: sim(I_c, I_c′) > 1−ε ⇒ c ∈ C_{t+1}, L += birth(c)· MERGE/SPLIT: μόνο ως Proceeding με LossMap· PASS ⇒ O_{t+1}, L += merge/split, Σ migration μέσω CC schema lineage· RETIRE: έννοια χωρίς χρήση σε N cuts ΚΑΙ χωρίς κέρδος ⇒ status RETIRED (η έδρα μένει· extension ανακτήσιμη)· ROLLBACK: κάθε μετάβαση αναστρέψιμη διά L (RET REVERSIBLE) |
| **8. Είσοδοι/έξοδοι** | OGE.observe(residual)→AnomalyId· OGE.propose(cut)→[ConceptCandidate]· OGE.birth(candidate, gain_receipt)→ConceptCommitment· OGE.merge(c1,c2)→Proceeding· OGE.split(c, δ)→Proceeding· OGE.recover(cid)→Extension· OGE.lineage(cid)→DAG· OGE.schema(cut)→LinkML |
| **9. Αλγόριθμος** | **OGE-Cycle** [ανά κύκλο O(∣Q∣·(n·2^k + P(depth))) με k ≤ 20 ιδιότητες (top-k MI) και P το κόστος program induction φραγμένο από depth/budget· FCA με k=20: 2^20 ≈ 10⁶ concepts max, πρακτικά ≪ λόγω αραιότητας]· **Gain (σφραγισμένη μέτρηση)** [O(∣D_sealed∣·∣O∣) ανά υποψήφια· cache ανά cut]· **compute_LossMap / recover** [O(∣E_c∣) · ανάκτηση O(∣E_c∣)] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-026.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-054 (Ontology Genesis: propose/birth/merge/split/recover με state & failure semantics)· MFA-CON-032 (Canonical Design API — Ontology Registry σχήματα, MFA-ELM-083) ως καταναλωτής· MFA-CON-033 (CC schema lineage) ‖ Εξουσία: Γένεση/απόσυρση = Genesis plane, χωρίς εξουσία επίδρασης· merge/split = Proceeding (Court-lite) με EIM-ανεξάρτητους αξιολογητές· τα κατώφλια θ = πολιτική (LPA Tier ORDER)· ο δημιουργός μπορεί να παγώσει έννοιες (L3 pin). |
| **11. Εξαρτήσεις** | Γνωστές: MFA-ELM-083 (registry)· MFA-ELM-025 (Skill Library / program induction)· MFA-ELM-105 (LWM residuals)· MFA-ELM-028 (Void)· MFA-ELM-048 (Court-lite)· MFA-MECH-009 (EIM)· MFA-MECH-001 (CC schema lineage)· MFA-ELM-086 (HELD_OUT scorer) ‖ Άγνωστες: MFA-UNK-115: αν το MDL+pred κέρδος συσχετίζεται με χρησιμότητα εννοιών στο νομικό πεδίο (EPISTEMIC· OGE-E2 το κρίνει) |
| **12. Πόροι** | DEP-1: k≤12, 10² ανωμαλίες/ημέρα, CPU· DEP-2: k≤20, 10³/ημέρα, program induction σε GPU (ώρες)· DEP-3+: συνεχής· μνήμη O(∣C∣·∣E∣ δείγμα) |
| **13. Κλιμάκωση** | Κέρδος ≈ γραμμικό στα residuals μέχρι κορεσμό της οντολογίας· κόστος FCA 2^k (ελεγχόμενο από k)· η γενεαλογία αυξάνει γραμμικά — μετριέται ως MFA-VO-068 (έννοιες/κέρδος ανά compute). |
| **14. Αποτυχίες** | Έκρηξη εννοιών (over-birth) → ανίχνευση: ρυθμός γεννήσεων > RateBound ή G οριακά → απόκριση: θ_birth αυξάνεται (RateBounds MFA-DEC-019)· batch ως Proceeding· Codebook-style collapse (πολλές έννοιες ↦ μία) → ανίχνευση: LossMap ⊥ ή δ ανακριβής → απόκριση: merge απορρίπτεται εξ ορισμού (MFA-INV-078)· Έννοιες που μαθαίνουν sealed δεδομένα → ανίχνευση: canary strings στο extension → απόκριση: MFA-VO-063 FAIL, υποψήφια απορρίπτεται, cut μολυσμένο· Σχήμα που σπάει καταναλωτές → ανίχνευση: CC schema migration αποτυγχάνει → απόκριση: BIRTH αναβάλλεται· η έννοια ζει ως draft χωρίς Σ· Αντιπαλική ανωμαλία (τεχνητό residual για να γεννηθεί έννοια-δούρειος) → ανίχνευση: provenance της ανωμαλίας taint>0 ή προέλευση Effect-plane εισόδου → απόκριση: Court-lite με CAM-NS· γέννηση σε quarantine namespace |
| **15. Αντιπαλικοί** | Περιορισμός: Όλα στο Genesis plane· η οντολογία που βλέπει ο Effect plane είναι ένα cut με receipt· quarantine namespace για έννοιες με taint· Emergency-stop παγώνει O_t. ‖ Κλάση αναστρεψιμότητας: REVERSIBLE (κάθε μετάβαση αναστρέψιμη διά γενεαλογίας L· καμία διαγραφή) |
| **16. Επαλήθευση** | MFA-VO-068: OGE-E1/E2 σε F2 (DST) και F3 (σφραγισμένο νομικό corpus)· property test NON-COLLAPSE (100 τυχαίες συγχωνεύσεις → 100 ακριβείς ανακτήσεις)· Lean lemma: recover∘merge = id στο extension (F1 εκτελέσιμη προδιαγραφή tools/twin) ‖ Invariants: MFA-INV-078 NON-COLLAPSE: κάθε συγχώνευση έχει LossMap με ακριβή ανάκτηση· καμία έννοια δεν χάνει την έκτασή της· MFA-INV-079: γέννηση μόνο με κέρδος σε σφραγισμένο split από HELD_OUT scorer, ποτέ στο train split |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή (tools/twin): O, Gain, LossMap, recover∘merge=id ως property test |
| **18. Ελάχιστο πείραμα** | **OGE-E1**: DST με κρυφή οντολογία 50 εννοιών που παράγει τα δεδομένα· το OGE ξεκινά από κενή O· μετράμε ανάκτηση (ARI) και G — κριτήριο (προκαταχωρισμένο): ARI ≥ 0.8 σε ≤ 10⁴ επεισόδια ΚΑΙ G>0 σε κάθε γέννηση· αλλιώς FAIL· **OGE-E2**: Σφραγισμένο νομικό corpus· O₀ = CMP-LAW registry· OGE γεννά έννοιες· downstream QA/drafting σε HELD_OUT — κριτήριο (προκαταχωρισμένο): MDL κέρδος ≥ 10 % ΚΑΙ καμία υποχώρηση στο sealed QA (Δ ≤ 0 με CI) — ≥1 νέα έννοια που χρησιμοποιείται σε ≥ 5 % των έργων· **OGE-E3 (NON-COLLAPSE drill)**: 100 τυχαίες συγχωνεύσεις + 100 διασπάσεις σε O με 10³ έννοιες· ανάκτηση — κριτήριο (προκαταχωρισμένο): 100 % ακριβής ανάκτηση extension· 0 συγχωνεύσεις χωρίς LossMap |
| **19. Διάψευση** | Μετά από 10⁴ ανωμαλίες καμία γέννηση με G>θ σε σφραγισμένο split (ο μηχανισμός δεν βρίσκει έννοιες)· Γεννημένες έννοιες χωρίς χρήση σε downstream έργα (χρήση < 1 %) σε 2 δόσεις· Οποιαδήποτε συγχώνευση με μη-ανακτήσιμη έκταση (παραβίαση MFA-INV-078 = σφάλμα υλοποίησης, όχι του μηχανισμού) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 1: OGE-lite (FCA + DL intension, χωρίς program induction) πάνω στο registry· Δόση 2: program induction + LWM residuals + OGE-E1/E2· Δόση 3: υπό RVSI L2· τα κατώφλια από MFA-DEC-005 ORDER. |
| **21. Εξέλιξη** | Η γένεση εννοιών είναι μάθηση δομής (μη-παραμετρική) που τροφοδοτεί την παραμετρική (SMF: έννοιες ως tokens/heads) και το CDCE (μεταβλητές)· το ίδιο το OGE βελτιώνεται σε RVSI L2 (θ, k, οικογένεια intension) με CapabilityGrowthRecord. |
| **22. Αλληλεπιδράσεις** | MFA-ELM-109 (νέο στοιχείο OGE, S2)· MFA-ELM-083 (καταναλωτής)· MFA-ELM-110 CDCE (μεταβλητές από έννοιες)· MFA-ELM-100 SMF (έννοιες ως δεδομένα εκπαίδευσης/tokens)· MFA-ELM-111 AHE (υποθέσεις πάνω σε έννοιες)· MFA-ELM-098 World Twin (σχήμα δρώντων) |

**AI Contribution Ledger:** `NEW ARCHITECTURAL INVENTION`

## Αλγόριθμοι (πλήρες pseudocode)

### OGE-Cycle — πολυπλοκότητα: ανά κύκλο O(|Q|·(n·2^k + P(depth))) με k ≤ 20 ιδιότητες (top-k MI) και P το κόστος program induction φραγμένο από depth/budget· FCA με k=20: 2^20 ≈ 10⁶ concepts max, πρακτικά ≪ λόγω αραιότητας

```
procedure OGE_Cycle(O, Q, D_train, D_sealed, budget):
  Cand ← ∅
  for r in Q.top_by_VOI(budget.anomalies):
    X ← commitments_touched_by(r)                      # extension seed from ledger cut
    A ← top_k_attributes(X, D_train, k=20, score=MI_with(r))
    K ← FormalContext(X, A)
    for (ext, int) in FCA_concepts(K):                 # Ganter NextClosure, lazy, pruned by support ≥ s_min
      I_sym ← DL_definition(int)                        # symbolic intension
      I_prg ← ProgramInduction(ext, library=SkillLibrary, depth≤d)   # DreamCoder-style, returns program or ⊥
      for I in {I_sym, I_prg} \ {⊥}:
        c ← Concept(intension=I, extension=ext, provenance=receipt(r, X, A))
        g ← Gain(O ⊕ c, D_sealed)                      # MDL + λ·pred − μ·schema cost, on SEALED split only
        if g > θ_birth and not near_duplicate(c, O): Cand.add((c, g))
  for (c, g) in Cand.sorted_desc():
    if dominated_by_existing(c, O): continue
    O ← O ⊕ c ; L.append(BIRTH(c, g, cut_id))          # birth is a commitment (CC ASSERT with evidence)
    Σ ← LinkML_extend(Σ, c) ; CC.schema_migrate(Σ)     # schema lineage in Commitment Calculus
  for p in merge_split_candidates(O):                  # pairs with overlap(E1,E2) > θ_merge or bimodal extension
    lossmap ← compute_LossMap(p)
    if lossmap = ⊥: continue                            # NON-COLLAPSE: no merge without recoverable partition
    verdict ← CourtLite.adjudicate(p, lossmap, evaluators=EIM_independent(≥2))
    if verdict = PASS: O ← apply(p, O) ; L.append(p, lossmap)
  return O, L
```

### Gain (σφραγισμένη μέτρηση) — πολυπλοκότητα: O(|D_sealed|·|O|) ανά υποψήφια· cache ανά cut

```
function Gain(O', D_sealed):
  mdl  ← codelength(D_sealed | O_prev) − codelength(D_sealed | O')     # two-part MDL: schema + data given schema
  pred ← PredLoss(LWM(O_prev), D_sealed) − PredLoss(LWM(O'), D_sealed)  # proper scoring rule, HELD_OUT scorer
  cost ← μ · |Σ(O') − Σ(O_prev)|
  return mdl + λ·pred − cost                              # λ, μ = policy (MFA-DEC-005 ORDER); recorded in the birth commitment
```

### compute_LossMap / recover — πολυπλοκότητα: O(|E_c|) · ανάκτηση O(|E_c|)

```
function compute_LossMap(merge(c1, c2 → c)):
  δ ← learn_discriminator(E_c1, E_c2, family=DecisionList, max_len=8)   # must be exact on the recorded extensions
  if accuracy(δ, E_c1 ∪ E_c2) < 1.0: return ⊥                           # NON-COLLAPSE: exactness required, no approximate merge
  return LossMap(partition=(E_c1, E_c2), discriminator=δ, hash=H(E_c1, E_c2, δ))
function recover(c_retired):                                              # invariant MFA-INV-078
  lm ← L.lossmap_of(c_retired) ; return {x ∈ E_parent(lm) : lm.δ(x)}
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| OGE-E1 | DST με κρυφή οντολογία 50 εννοιών που παράγει τα δεδομένα· το OGE ξεκινά από κενή O· μετράμε ανάκτηση (ARI) και G | ARI ≥ 0.8 σε ≤ 10⁴ επεισόδια ΚΑΙ G>0 σε κάθε γέννηση· αλλιώς FAIL |
| OGE-E2 | Σφραγισμένο νομικό corpus· O₀ = CMP-LAW registry· OGE γεννά έννοιες· downstream QA/drafting σε HELD_OUT | MDL κέρδος ≥ 10 % ΚΑΙ καμία υποχώρηση στο sealed QA (Δ ≤ 0 με CI) — ≥1 νέα έννοια που χρησιμοποιείται σε ≥ 5 % των έργων |
| OGE-E3 (NON-COLLAPSE drill) | 100 τυχαίες συγχωνεύσεις + 100 διασπάσεις σε O με 10³ έννοιες· ανάκτηση | 100 % ακριβής ανάκτηση extension· 0 συγχωνεύσεις χωρίς LossMap |

## Επιστημική κατάσταση (§5) — συνολικά: **NOVEL SYNTHESIS**

| Ισχυρισμός | Κατάσταση |
|---|---|
| FCA + MDL + program induction παράγουν έννοιες με κέρδος σε συνθετικά δεδομένα | EMPIRICALLY SUPPORTED |
| NON-COLLAPSE διά LossMap με ακριβή ανάκτηση | IMPLEMENTABLE FROM KNOWN COMPONENTS |
| Οι γεννημένες έννοιες βελτιώνουν σφραγισμένα νομικά έργα | RESEARCH HYPOTHESIS |
| Ο συνδυασμός (έννοιες ως δεσμεύσεις με Court-lite συγχώνευση) είναι νέος | NOVEL SYNTHESIS |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή (tools/twin): O, Gain, LossMap, recover∘merge=id ως property test
2. F2: DST OGE-E1 με συνθετική οντολογία
3. F3: σφραγισμένο corpus OGE-E2 σε DEP-2
4. F4: παραγωγή στη Δόση 2 με Court-lite merges· F5: RVSI L2 βελτίωση θ/k
