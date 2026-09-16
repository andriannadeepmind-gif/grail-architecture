# MFA-MECH-033 — Sovereignty Transition Protocol (STP) & Sovereignty Index (SI) — από δανεική σε κυρίαρχη νοημοσύνη με πύλες

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-033.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-054 (κυριαρχική μετάβαση) · MFA-OBJ-050 · MFA-OBJ-010 (κυριαρχία) · MFA-CAP-081 · MFA-TEL-08

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-033 |
| **2. Όνομα** | Sovereignty Transition Protocol (STP) & Sovereignty Index (SI) — από δανεική σε κυρίαρχη νοημοσύνη με πύλες |
| **3. Ικανότητα** | MFA-CAP-097 — Μετάβαση από δανεική σε κυρίαρχη νοημοσύνη (§8 #18): σταδιακή, ανά οικογένεια ικανοτήτων, μετρημένη με δείκτη, με πύλες ισοτιμίας ποιότητας και rollback, μέχρι την πλήρη ανεξαρτησία από παρόχους. |
| **4. Πρόβλημα** | Το 0.3.0/0.4.0-provisional λέει «ο πάροχος γίνεται baseline μετά το SMF-E1» (μία πρόταση, AA-025). Αφετηρίες: distillation (Hinton, Vinyals & Dean 2015), self-hosting μεταναστεύσεις παρόχων (πρακτική μηχανικής), canary/blue-green cutovers, "model routing" (§4: ≠ κυριαρχία). Όρια: κανένας ορισμός δείκτη κυριαρχίας· καμία σταδιακή πύλη ισοτιμίας σε σφραγισμένα σύνολα ανά οικογένεια· καμία καταγραφή ότι το distilled παιδί κληρονομεί γενεαλογία (ώστε ο πάροχος να μην «αξιολογεί» το παιδί του)· καμία διάκριση μεταξύ κυριαρχίας πρότασης, αξιολόγησης, μνήμης, εργαλείων. |
| **5. Πρώτη αρχή** | Sovereignty Index SI ∈ [0,1]^{families×axes}: ανά οικογένεια ικανοτήτων f και άξονα ∈ {proposal, evaluation, memory, tools}, το ποσοστό VERIFIED εξόδων που παρήχθησαν από κυρίαρχες πηγές (WeightCommitments/προγράμματα ιδιόκτητα) ΧΩΡΙΣ απώλεια ποιότητας έναντι του καλύτερου παρόχου σε σφραγισμένο σύνολο (ισοτιμία εντός CI). Στάδια ανά οικογένεια S0 (πάροχος) → S1 (κυρίαρχη σκιά) → S2 (κυρίαρχη κύρια, πάροχος fallback) → S3 (πάροχος μόνο ως εξωτερικός αντίπαλος/αξιολογητής όπου lineage-disjoint) → S4 (χωρίς πάροχο)· προκαταχωρισμένες πύλες (MFA-DEC-021) σε N συνεχόμενα cuts· ratchet στην ΠΟΙΟΤΗΤΑ (ποτέ υποχώρηση), όχι στο στάδιο (υποχώρηση σταδίου επιτρεπτή και καταγράφεται)· ο πάροχος καταγράφεται στη γενεαλογία κάθε distilled βάρους. |
| **6. Οντολογία** | Family f ∈ F (από capability lattice concerns)· Axis x ∈ {proposal, evaluation, memory, tools}· SI_{f,x}(cut) = ∣{o ∈ VERIFIED_{f,x}(cut) : source(o) ∈ Sovereign}∣ / ∣VERIFIED_{f,x}(cut)∣ υπό συνθήκη parity_{f}(cut) = true· parity_f(cut): q_sov(f, sealed) ≥ q_prov(f, sealed) − ε με CI (HELD_OUT scorer)· Stage_f ∈ {S0..S4}· Gate(S_i→S_{i+1}) = προκαταχωρισμένα κατώφλια SI, parity, N cuts, incident-free· ProviderDependencyRecord: κλήσεις παρόχου/έργο, DisclosureGrants, unlearning obligations από distillation· SI_total = weighted mean (βάρη = πολιτική) |
| **7. Κατάσταση** | Μεταβλητές: Stage_f,t· SI_t πίνακας· Parity_t· Streak_t (συνεχόμενα cuts που πληρούν πύλη)· Fallback log· Lineage flags (distilled από P) ‖ Μεταβάσεις: MEASURE: κάθε cut → SI, parity από HELD_OUT· ADVANCE: Gate(S_i→S_{i+1}) για N cuts ⇒ Stage_f += 1· receipt· REGRESS: parity χάνεται ή incident ⇒ Stage_f −= 1 (fallback ενεργό)· ποιότητα ratchet ισχύει· S3 rule: πάροχος ως αξιολογητής μόνο αν EIM lineage-disjoint από το κυρίαρχο μοντέλο (MFA-INV-089)· S4: DisclosureGrants προς πάροχο ανακαλούνται· διατήρηση δυνατότητας επαναφοράς (σφραγισμένη) |
| **8. Είσοδοι/έξοδοι** | STP.index(cut)→SI matrix· STP.stage(family)→Stage· STP.gates()→Gate table (MFA-DEC-021)· STP.advance/regress receipts· STP.dependency(cut)→ProviderDependencyRecord· STP.reactivation(family)→sealed path |
| **9. Αλγόριθμος** | **STP-Step (ανά οικογένεια, ανά cut)** [O(∣F∣·∣X∣·∣sealed∣) ανά cut· αμελητέο έναντι εκτέλεσης]· **sovereign_share / parity_test** [O(∣outputs∣) / O(∣sealed∣)] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-033.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-061 (Sovereignty Transition: index/stage/gates/advance/regress)· MFA-CON-047 (SMF)· MFA-CON-041 (EIM)· MFA-CON-005 (PDP / DisclosureGrant) ‖ Εξουσία: Πύλες = MFA-DEC-021 (δημιουργός)· advance S3→S4 = δημιουργός (ανάκληση grants)· regress αυτόματο (fail-safe προς ποιότητα)· ο router (PDE, MFA-MECH-019) εκτελεί, δεν αποφασίζει. |
| **11. Εξαρτήσεις** | Γνωστές: MFA-ELM-100 SMF· MFA-ELM-103 PRR· MFA-ELM-118 CPCL· MFA-ELM-086 HELD_OUT· MFA-MECH-019 PDE (router)· MFA-MECH-009 EIM· MFA-ELM-102 lineage· MFA-ELM-119 CGM ‖ Άγνωστες: MFA-UNK-122: το compute που απαιτεί η ισοτιμία ανά οικογένεια (EPISTEMIC· STP-E1 δίνει την πρώτη μέτρηση) |
| **12. Πόροι** | Μέτρηση αμελητέα· το κόστος είναι της κυρίαρχης στοίβας (SMF DEP-2+)· parity tests ανά cut O(∣sealed∣) |
| **13. Κλιμάκωση** | SI αναμένεται σιγμοειδές ανά οικογένεια με το compute της SMF· οι «εύκολες» οικογένειες (drafting) πρώτες· MFA-VO-075 = SI καμπύλη ανά δόση. |
| **14. Αποτυχίες** | Ψευδής ισοτιμία (sealed set μολυσμένο) → ανίχνευση: canaries + DataManifest → απόκριση: MFA-VO-063· stage παγώνει· Πάροχος «αξιολογεί» το distilled παιδί του → ανίχνευση: EIM lineage → απόκριση: απαγορεύεται S3 ρόλος· Ταλάντωση σταδίων → ανίχνευση: advance/regress > k σε M cuts → απόκριση: hysteresis: N αυξάνεται· Πάροχος καταργείται εξωτερικά πριν S2 → ανίχνευση: KT-01 → απόκριση: S1 σκιά ενεργοποιείται με typed degraded mode· Κυριαρχία σε proposal αλλά όχι σε evaluation → ανίχνευση: SI ανά άξονα → απόκριση: δηλώνεται ανά άξονα· καμία ολική δήλωση |
| **15. Αντιπαλικοί** | Περιορισμός: Fallback πάντα διαθέσιμο μέχρι S4· S4 με σφραγισμένη διαδρομή επαναφοράς· ποιότητα ratchet. ‖ Κλάση αναστρεψιμότητας: REVERSIBLE μέχρι S3· S4 (ανάκληση grants) IRREVERSIBLE-PREAUTHORIZED από δημιουργό με διαδρομή επαναφοράς |
| **16. Επαλήθευση** | MFA-VO-075: STP-E1 (μία οικογένεια σε S2 με parity) F3· STP-E2 (SI μονότονο ανά δόση) F3/F4· property: advance ⇒ parity ∧ streak (F1)· KT-01 drill σε κάθε στάδιο ‖ Invariants: MFA-INV-092: προαγωγή σταδίου μόνο με parity σε σφραγισμένο σύνολο από HELD_OUT + N συνεχόμενα cuts· υποχώρηση σταδίου ποτέ σιωπηλή· MFA-INV-093: το ratchet ισχύει στην ποιότητα ανά οικογένεια — η κυριαρχία δεν αγοράζεται με υποβάθμιση ποιότητας |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή SI/stage machine/gates (tools/twin) |
| **18. Ελάχιστο πείραμα** | **STP-E1**: Οικογένεια drafting: κυρίαρχη στοίβα (SMF adapters+PRR) έναντι καλύτερου παρόχου σε 500 σφραγισμένα έργα, HELD_OUT scorer — κριτήριο (προκαταχωρισμένο): non-inferiority ε=2 pp με 95 % CI για N=3 cuts ⇒ S2· αλλιώς FAIL με απόσταση καταγεγραμμένη· **STP-E2**: SI ανά οικογένεια/άξονα ανά δόση 1→4 — κριτήριο (προκαταχωρισμένο): SI_total μη-φθίνον ανά δόση ΚΑΙ ≥ 3 οικογένειες σε S3+ μέχρι τη Δόση 4· ποιότητα ratchet 0 παραβιάσεις |
| **19. Διάψευση** | STP-E1: καμία οικογένεια σε ισοτιμία μέσα στον DEP-2 προϋπολογισμό — διαψεύδεται η υπόθεση «SMF-adapters αρκούν» (η κυριαρχία μένει στόχος· επόμενος μηχανισμός: DEP-3 recipes/PRR/CPCL)· SI αυξάνει ενώ η ποιότητα πέφτει χωρίς regress (παραβίαση MFA-INV-093 = σφάλμα υλοποίησης) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 1: SI μέτρηση + S1 σκιά για drafting· Δόση 2: STP-E1 → S2· Δόση 3: ≥3 οικογένειες S2/S3· Δόση 4: S4 για ώριμες οικογένειες με απόφαση δημιουργού. |
| **21. Εξέλιξη** | Το SMF/PRR/CPCL παράγουν την κυρίαρχη στοίβα· το STP μετρά και ρυθμίζει· τα κατώφλια/ε υπό RVSI L2 μόνο προς αυστηρότερα. |
| **22. Αλληλεπιδράσεις** | MFA-ELM-116 (νέο στοιχείο STP, S7)· MFA-ELM-017 TED/router· MFA-ELM-100/102· MFA-ELM-114 ECE (πάροχος ως αξιολογητής μόνο lineage-disjoint)· MFA-ELM-091 cockpit (SI ορατό) |

**AI Contribution Ledger:** `NEW FORMALISM`

## Αλγόριθμοι (πλήρες pseudocode)

### STP-Step (ανά οικογένεια, ανά cut) — πολυπλοκότητα: O(|F|·|X|·|sealed|) ανά cut· αμελητέο έναντι εκτέλεσης

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

### sovereign_share / parity_test — πολυπλοκότητα: O(|outputs|) / O(|sealed|)

```
function sovereign_share(outputs):
  return |{o : lineage(source(o)) ⊆ SovereignWeights ∪ SovereignPrograms}| / |outputs|     # distilled weights count as sovereign for share, but lineage keeps P (MFA-INV-089)
function parity_test(f, sealed, sov, prov, ε, CI):
  q_s ← score(sov, sealed, scorer=HELD_OUT) ; q_p ← score(prov, sealed, scorer=HELD_OUT)
  return lower_CI(q_s − q_p) ≥ −ε                                                   # one-sided non-inferiority
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| STP-E1 | Οικογένεια drafting: κυρίαρχη στοίβα (SMF adapters+PRR) έναντι καλύτερου παρόχου σε 500 σφραγισμένα έργα, HELD_OUT scorer | non-inferiority ε=2 pp με 95 % CI για N=3 cuts ⇒ S2· αλλιώς FAIL με απόσταση καταγεγραμμένη |
| STP-E2 | SI ανά οικογένεια/άξονα ανά δόση 1→4 | SI_total μη-φθίνον ανά δόση ΚΑΙ ≥ 3 οικογένειες σε S3+ μέχρι τη Δόση 4· ποιότητα ratchet 0 παραβιάσεις |

## Επιστημική κατάσταση (§5) — συνολικά: **NEW FORMALISM**

| Ισχυρισμός | Κατάσταση |
|---|---|
| Sovereignty Index ως μετρήσιμο διάνυσμα ανά οικογένεια/άξονα με parity συνθήκη | NEW FORMALISM |
| Distillation μεταφέρει ικανότητα σε μικρότερα μοντέλα | EMPIRICALLY SUPPORTED |
| Σταδιακή μετάβαση με fallback διατηρεί ποιότητα | IMPLEMENTABLE FROM KNOWN COMPONENTS |
| Ισοτιμία με κορυφαίο πάροχο επιτεύξιμη ανά οικογένεια στον DEP-2/3 | RESEARCH HYPOTHESIS |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή SI/stage machine/gates (tools/twin)
2. F2: DST με συνθετικές οικογένειες
3. F3: STP-E1 σε DEP-2
4. F4: παραγωγή Δόση 1–4
