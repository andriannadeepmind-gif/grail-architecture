# MFA-MECH-041 — Active-Inference Developmental Core (AIDC) — ένας στόχος για αντίληψη/δράση/μάθηση και μια πιστοποιημένη αναπτυξιακή κλίμακα

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-041.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-058 (αναπτυξιακή ανοιχτή μάθηση) · MFA-OBJ-050 · MFA-CAP-085 · MFA-CAP-018 (βούληση) · MFA-TEL-08

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-041 |
| **2. Όνομα** | Active-Inference Developmental Core (AIDC) — ένας στόχος για αντίληψη/δράση/μάθηση και μια πιστοποιημένη αναπτυξιακή κλίμακα |
| **3. Ικανότητα** | MFA-CAP-105, MFA-CAP-085 — Developmental/open-ended learning υπό ενεργητική συμπερασματολογία (§6 #4, #9· §8 #7): εξερεύνηση με expected free energy πάνω στο μαθημένο κοσμομοντέλο, με Telos-διαμορφωμένες προτιμήσεις, αναπτυξιακά στάδια με πιστοποιημένες μεταβάσεις και όρια εξουσίας. |
| **4. Πρόβλημα** | Το 0.4.0-provisional OEC (MFA-MECH-023) έχει setter/solver + POET χωρίς αναπτυξιακή κλίμακα και χωρίς ενοποίηση υπό ενεργητική συμπερασματολογία (AA-030)· το TEGF έχει EFE ως φράγμα. Αφετηρίες: active inference (Friston 2010· Parr, Pezzulo & Friston 2022), intrinsic motivation (Schmidhuber 1991· Oudeyer, Kaplan & Hafner 2007), curiosity RL (Pathak et al. 2017), developmental robotics (Cangelosi & Schlesinger 2015), open-endedness (Stanley, Lehman & Soros 2017· OMNI, Zhang et al. 2023· Voyager, Wang et al. 2023), Piaget-class στάδια. Όρια: η ενεργητική συμπερασματολογία κλιμακώνει σε μικρούς χώρους καταστάσεων· τα στάδια είναι χειροποίητα χωρίς πιστοποίηση μετάβασης· η εξερεύνηση δεν υπόκειται σε RET/εξουσία· δεν ενοποιεί OGE/CDCE/AHE/TGPS/MSM ως ΣΤΑΔΙΑ ενός ίδιου βρόχου. |
| **5. Πρώτη αρχή** | Ένας στόχος εξερεύνησης: expected free energy G(π) = risk(π) + ambiguity(π) υπολογισμένη με rollouts στο LWM (MFA-MECH-023), όπου οι προτιμήσεις (prior over outcomes) είναι ο κώνος του Telos + TEGF· η πολιτική με ελάχιστο G επιλέγεται στη ζώνη εγγύτερης ανάπτυξης του τρέχοντος σταδίου· η Developmental Ladder D0…D8 ορίζει στάδια ικανότητας (D0 ledger grounding → D1 concept permanence/OGE → D2 causal/CDCE → D3 hypothesis/AHE → D4 theory/TGPS → D5 self/MSM → D6 social/institutions → D7 sovereignty/STP → D8 successor/VSC) με ΠΙΣΤΟΠΟΙΗΜΕΝΕΣ μεταβάσεις (CGM records σε σταδιακές σφραγισμένες οικογένειες)· παλινδρόμηση επιτρέπεται και καταγράφεται· εξερεύνηση μόνο εντός RET/AutonomyEnvelope (MFA-DEC-027). |
| **6. Οντολογία** | Policy π (ακολουθία πράξεων Genesis/Effect)· G(π) = E_q[log q(s∣π) − log p(o,s∣π)] = risk + ambiguity (Parr et al.)· Preference prior p(o) = softmax(Telos cone utility + TEGF)· Stage D_k = ⟨competences, sealed families F_k, gate thresholds, allowed mechanisms⟩· StageCertificate = ⟨k, CGM records ∀f∈F_k with lower_CI ≥ θ_k, HELD_OUT⟩· ExplorationEnvelope (MFA-DEC-027): budgets ανά RET class ανά στάδιο· ZPD(k) = έργα με δυσκολία ∈ [θ̂ − δ, θ̂ + δ] στο στάδιο k |
| **7. Κατάσταση** | Μεταβλητές: k_t τρέχον στάδιο· θ̂ ανά F_k· π candidates & G· Envelope usage· Regression log ‖ Μεταβάσεις: PLAN: candidates π από OEC/curriculum + AHE tests + CDCE interventions· G(π) με LWM rollouts (ensemble)· SELECT: arg min G υπό envelope· Genesis πρώτα· EXECUTE: πράξεις με RET· receipts· LEARN: SMF/PRR/CPCL/OGE/CDCE ενημερώσεις· CERTIFY: ∀f∈F_k lower_CI ≥ θ_k για N cuts ⇒ StageCertificate ⇒ k+1· REGRESS: CGM ratchet FAIL σε F_k ⇒ k−1 (καταγράφεται)· ENVELOPE: υπέρβαση ⇒ Emergency-stop της εξερεύνησης (όχι του συστήματος) |
| **8. Είσοδοι/έξοδοι** | AIDC.step()→stage· AIDC.stage()→(k, certificate)· AIDC.candidates()→[(π, G)]· AIDC.envelope()→usage· AIDC.ladder()→[D_k specs]· AIDC.regressions(cut)→log |
| **9. Αλγόριθμος** | **AIDC-Step** [O(∣Π∣·B·H) rollouts (B ensemble, H ορίζοντας)· φραγμένο από budget· ανά κύκλο Ω-loop] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-041.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-066 (Developmental Core: step/stage/candidates/envelope/ladder)· MFA-CON-050 (LWM/curriculum)· MFA-CON-034 (RET)· MFA-CON-064 (CGM) ‖ Εξουσία: Envelope = MFA-DEC-027 (δημιουργός)· θ_k, N = πολιτική· Effect πράξεις μέσω PDP/RET· D7/D8 στάδια απαιτούν δημιουργό (STP S4, VSC). |
| **11. Εξαρτήσεις** | Γνωστές: MFA-ELM-105 LWM· MFA-ELM-106 OEC· MFA-ELM-109/110/111/112/120 (στάδια)· MFA-ELM-119 CGM· MFA-ELM-010 RET· MFA-MECH-004 TEGF· MFA-ELM-029 Volition ‖ Άγνωστες: MFA-UNK-130: κλιμάκωση EFE σε ορίζοντες H>20 με LWM ensemble (EPISTEMIC) |
| **12. Πόροι** | DEP-1: B=4, H=5, ∣Π∣≤20, CPU· DEP-2: B=16, H=20, GPU rollouts ms/κόμβο· DEP-3+: παράλληλα |
| **13. Κλιμάκωση** | Κόστος ~ ∣Π∣·B·H· η πρόοδος σταδίων ~ compute με κορεσμό ανά στάδιο (CGM law)· MFA-VO-084 = χρόνος ανά στάδιο και εξερευνητική αποδοτικότητα (πληροφορία/Wh). |
| **14. Αποτυχίες** | G ελάχιστο σε «ασφαλή ανία» (καμία εξερεύνηση) → ανίχνευση: epistemic gain ≈ 0 για M cuts → απόκριση: ZPD διεύρυνση· curriculum injection· Dark room (ambiguity ελαχιστοποίηση με αδράνεια) → ανίχνευση: IDLE συχνότητα → απόκριση: preference prior με Telos utility (όχι μόνο ambiguity)· LWM εκμετάλλευση (φανταστικά κέρδη) → ανίχνευση: World Twin/verifier διαφωνία → απόκριση: Both → πραγματική μέτρηση· LWM retrain· Στάδιο πιστοποιείται με μολυσμένα sealed → ανίχνευση: CGM contamination → απόκριση: certificate άκυρο· Envelope υπέρβαση → ανίχνευση: MFA-INV-109 → απόκριση: Emergency-stop εξερεύνησης |
| **15. Αντιπαλικοί** | Περιορισμός: Genesis-first· envelope· RET· στάδια D7/D8 με δημιουργό. ‖ Κλάση αναστρεψιμότητας: REVERSIBLE (στάδια = δεσμεύσεις)· πράξεις = RET κλάση |
| **16. Επαλήθευση** | MFA-VO-084: AIDC-E1 (αναπτυξιακό DST περιβάλλον — ακολουθία σταδίων πιστοποιείται) F2· AIDC-E2 (EFE curriculum > novelty-only/random σε sealed) F2/F3· property: stage advance ⇒ certificate (F1) ‖ Invariants: MFA-INV-108: μετάβαση σταδίου μόνο με StageCertificate από CGM records (HELD_OUT) σε N συνεχόμενα cuts· παλινδρόμηση καταγράφεται, ποτέ σιωπηλή· MFA-INV-109: η εξερεύνηση δεν υπερβαίνει το ExplorationEnvelope ανά RET κλάση· Effect-plane εξερεύνηση μόνο REVERSIBLE εντός envelope |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή ladder/certificate/envelope (tools/twin) |
| **18. Ελάχιστο πείραμα** | **AIDC-E1**: DST περιβάλλον με κρυφές έννοιες/αιτίες/νόμους· AIDC από D0· καταγραφή σταδίων — κριτήριο (προκαταχωρισμένο): D0→D4 πιστοποιούνται στη σειρά σε ≤ budget· 0 μεταβάσεις χωρίς certificate· παλινδρομήσεις καταγεγραμμένες· **AIDC-E2**: EFE επιλογή έναντι (α) novelty-only (β) τυχαίας (γ) task-loss-greedy, ίδιο budget· sealed οικογένειες D1–D3 — κριτήριο (προκαταχωρισμένο): EFE ≥ όλες τις baselines σε ≥ 2 από 3 οικογένειες με διακριτικό περιθώριο |
| **19. Διάψευση** | AIDC-E2: EFE όχι καλύτερο από novelty-only (η ενοποίηση υπό EFE δεν προσθέτει — η αναπτυξιακή κλίμακα μένει με άλλον επιλογέα)· AIDC-E1: αδυναμία πιστοποίησης D2 σε budget (η κλίμακα ή τα κατώφλια αναθεωρούνται) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 2: AIDC D0–D2 σε DST με envelope Genesis-only + AIDC-E1· Δόση 3: D3–D5 + Effect REVERSIBLE + AIDC-E2· Δόση 4: D6–D8 με δημιουργό. |
| **21. Εξέλιξη** | Ο ίδιος ο AIDC μαθαίνει τη συνάρτηση προτίμησης εντός του κώνου Telos (TEGF) και τον εκτιμητή G (LWM ensemble)· τα στάδια/κατώφλια υπό RVSI L2 μόνο προς αυστηρότερα. |
| **22. Αλληλεπιδράσεις** | MFA-ELM-124 (νέο στοιχείο AIDC, S2)· MFA-ELM-106· MFA-ELM-029 (βούληση: G ως στόχος)· MFA-ELM-127 Ω-loop (ACT/EXPERIMENT φάση)· MFA-ELM-116 STP (D7)· MFA-ELM-125 VSC (D8) |

**AI Contribution Ledger:** `NEW ARCHITECTURAL INVENTION`

## Αλγόριθμοι (πλήρες pseudocode)

### AIDC-Step — πολυπλοκότητα: O(|Π|·B·H) rollouts (B ensemble, H ορίζοντας)· φραγμένο από budget· ανά κύκλο Ω-loop

```
procedure AIDC_Step(k, LWM, Telos, envelope, CGM):
  Π ← candidate_policies(stage=k)                                      # from OEC tasks, AHE tests, CDCE interventions, curriculum
  Π ← {π ∈ Π : difficulty(π) ∈ ZPD(k) ∧ RET.class(π) allowed_by envelope}
  for π in Π:
    rollouts ← LWM.rollout(π, ensemble=B, horizon=H)
    risk ← KL(q(o|π) ∥ p(o | Telos, TEGF))                             # divergence from preferred outcomes
    ambiguity ← E_q[H(o | s, π)]                                       # expected observation entropy (epistemic value when low)
    G[π] ← risk + ambiguity − epistemic_gain(rollouts)                  # info gain over LWM/CDCE parameters
  π* ← argmin_π G[π]
  if π* = ⊥: return IDLE(reason=NO_POLICY_IN_ENVELOPE, plan=escalate_envelope)
  outcome ← execute(π*, plane=GENESIS_FIRST, ret=RET.class(π*)) ; envelope.consume(π*)
  learn(outcome)                                                       # SMF/PRR/CPCL + OGE/CDCE/AHE updates
  for f in F_k: rec[f] ← CGM.measure(f)
  if all(lower_CI(rec[f]) ≥ θ_k for f in F_k) for N consecutive cuts: k ← k + 1 ; CC.assert(StageCertificate(k, rec))
  elif any(RATCHET_FAIL(rec[f])): k ← max(0, k − 1) ; CC.assert(StageRegression(k, rec))     # never silent
  return k
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| AIDC-E1 | DST περιβάλλον με κρυφές έννοιες/αιτίες/νόμους· AIDC από D0· καταγραφή σταδίων | D0→D4 πιστοποιούνται στη σειρά σε ≤ budget· 0 μεταβάσεις χωρίς certificate· παλινδρομήσεις καταγεγραμμένες |
| AIDC-E2 | EFE επιλογή έναντι (α) novelty-only (β) τυχαίας (γ) task-loss-greedy, ίδιο budget· sealed οικογένειες D1–D3 | EFE ≥ όλες τις baselines σε ≥ 2 από 3 οικογένειες με διακριτικό περιθώριο |

## Επιστημική κατάσταση (§5) — συνολικά: **NOVEL SYNTHESIS**

| Ισχυρισμός | Κατάσταση |
|---|---|
| EFE ενοποιεί εξερεύνηση/εκμετάλλευση σε μικρούς χώρους | EMPIRICALLY SUPPORTED |
| Curiosity/open-endedness παράγουν ικανότητες χωρίς εξωτερικά έργα | EMPIRICALLY SUPPORTED |
| Πιστοποιημένη αναπτυξιακή κλίμακα D0…D8 με CGM πύλες και envelope | NOVEL SYNTHESIS |
| EFE κλιμακώνει στο LWM του GRAIL | RESEARCH HYPOTHESIS |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή ladder/certificate/envelope (tools/twin)
2. F2: DST AIDC-E1/E2
3. F3: DEP-2 με LWM
4. F4: παραγωγή Δόση 2–4
