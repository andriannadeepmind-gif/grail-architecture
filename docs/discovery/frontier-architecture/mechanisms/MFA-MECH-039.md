# MFA-MECH-039 — Obligation Calculus (OC) — τύποι υποχρέωσης για κάθε γνωσιακό βήμα (proof-carrying cognition)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-039.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-056 (proof-carrying cognition) · MFA-OBJ-007 (αλήθεια) · MFA-CAP-022 · MFA-INV-072 (RSI υπό πύλη) · MFA-TEL-08

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-039 |
| **2. Όνομα** | Obligation Calculus (OC) — τύποι υποχρέωσης για κάθε γνωσιακό βήμα (proof-carrying cognition) |
| **3. Ικανότητα** | MFA-CAP-103 — Proof-carrying cognition (§6 #3, §8 #11 υποδομή): κάθε βήμα σκέψης/ανάκτησης/γένεσης/πρότασης φέρει τύπο υποχρέωσης (τι τεκμήριο οφείλει, ποιου tier, μέχρι πότε, πώς εκπληρώνεται)· οι υποχρεώσεις είναι γραμμικές — δεν χάνονται σιωπηλά. |
| **4. Πρόβλημα** | Το Commitment Calculus (MFA-MECH-001) τυπώνει ΔΕΣΜΕΥΣΕΙΣ· τα exec types (TED) τυπώνουν εκτέλεση· δεν υπάρχει τύπος που να λέει τι ΟΦΕΙΛΕΙ κάθε γνωσιακό βήμα (AA-028). Αφετηρίες: proof-carrying code (Necula 1997), refinement types (Liquid Haskell, Vazou 2014), effect systems (Lucassen & Gifford 1988), linear/session types (Wadler 1990· Honda 1993), gradual verification, typed holes/obligations σε proof assistants, evidence-based programming. Όρια: αφορούν κώδικα, όχι βήματα νόησης πάνω σε εξόδους γεννητριών· δεν έχουν tiers/προθεσμίες/reason-typed αναβολή· δεν συνδέονται με VFC checkers και Court· καμία γραμμικότητα υποχρέωσης (discharge ∣ defer(reason) ∣ escalate) ως θεώρημα. |
| **5. Πρώτη αρχή** | Κάθε έκφραση e του γνωσιακού βρόχου έχει κρίση Γ ⊢ e : τ ! O — τύπο τ και ΕΚΚΡΕΜΕΙΣ ΥΠΟΧΡΕΩΣΕΙΣ O (πολυσύνολο Ob⟨claim, tier, evidence_class, deadline, method⟩)· τιμή τύπου Verified[τ] κατασκευάζεται ΜΟΝΟ με discharge· οι υποχρεώσεις είναι γραμμικοί πόροι: κάθε μία καταλήγει σε DISCHARGED(cert) ∣ DEFERRED(reason, plan, deadline) ∣ ESCALATED(to) — ποτέ dropped· θεώρημα ορθότητας: αν ⊢ p : τ ! ∅ τότε κάθε ισχυρισμός στο p φέρει τεκμήριο της απαιτούμενης κλάσης (ή ρητή αναβολή)· ο έλεγχος είναι αμφίδρομος και το κόστος discharge δρομολογείται ανά tier. |
| **6. Οντολογία** | Ob = ⟨claim c, tier ∈ {0,1,2}, evidence_class ∈ {PROOF, CHECK, TEST, WITNESS}, deadline, method ∈ {PROOF(Lean), CHECK(verifier), TEST(sealed), WITNESS(receipt), DEFER(reason)}⟩· Types τ ::= Base ∣ Verified[τ] ∣ Claimed[τ] ∣ Unknown[reason] ∣ τ → τ′ ! O· Judgment Γ ⊢ e : τ ! O· κανόνες: T-Gen (γεννήτρια: Claimed[τ] ! {Ob(c, tier(c), class(tier))}), T-Discharge (Claimed[τ] ! O ∪ {ob} + cert(ob) ⇒ Verified[τ] ! O), T-Seq (O₁ ⊎ O₂), T-Defer (ob ⇒ DEFERRED(reason, plan) — παραμένει στο O ως marked), T-Escalate· Linear discipline: O ως πολυσύνολο γραμμικών πόρων· weakening απαγορεύεται (καμία απόρριψη υποχρέωσης)· DischargeScheduler: ουρές ανά tier με budgets (TGPS για PROOF, verifiers για CHECK, CGM sealed για TEST)· Soundness theorem (Lean): ⊢ p : τ ! ∅ ⟹ ∀ claim ∈ p: evidence(claim) ⊒ class(tier(claim)) ∨ deferred_with_reason(claim) |
| **7. Κατάσταση** | Μεταβλητές: Context Γ· Obligation ledger O_t (γραμμικό)· Certificates· Deferred with deadlines· Escalations ‖ Μεταβάσεις: GEN: γεννήτρια παράγει Claimed[τ] με υποχρεώσεις κατά tier του claim (Tier από LPA/Constitution)· DISCHARGE: cert από method ⇒ Verified· DEFER: reason ∈ {BUDGET, NOT_YET_OBSERVABLE, AWAITING_CREATOR} με plan+deadline· ESCALATE: deadline πέρασε ⇒ Court/δημιουργός· ACT: Effect plane δέχεται μόνο τιμές Verified[τ] ή Claimed με DEFER εγκεκριμένο για την κλάση επίδρασης (RET)· NEVER_DROP: type checker απορρίπτει προγράμματα με weakening σε O |
| **8. Είσοδοι/έξοδοι** | OC.infer(program)→(type, obligations)· OC.check(program)→OK ∣ error· OC.discharge(ob, cert)→Receipt· OC.defer(ob, reason, plan)→Receipt· OC.ledger(cut)→O_t· OC.schedule(budgets)→Report |
| **9. Αλγόριθμος** | **OC-TypeCheck (αμφίδρομος)** [Γραμμικός στο μέγεθος του προγράμματος/ίχνους O(∣e∣)· discharge = κόστος method]· **DischargeScheduler** [O(∣O∣ log ∣O∣) priority queue· κόστος ανά method] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-039.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-071 (Obligation Calculus: infer/check/discharge/defer/ledger)· MFA-CON-003 (CC — επέκταση τύπων)· MFA-CON-052 (VFC certs)· MFA-CON-057 (TGPS) ‖ Εξουσία: Tier από Constitution/LPA· budgets ανά tier = πολιτική· ESCALATE → Court (Tier ≤1) ή owner· ο checker είναι μέρος του σταθερού σημείου (FP, L3)· η γλώσσα επεκτείνεται μόνο μέσω GG με Lean απόδειξη διατήρησης ορθότητας. |
| **11. Εξαρτήσεις** | Γνωστές: MFA-MECH-001 CC· MFA-ELM-017 TED· MFA-ELM-099 VFC· MFA-ELM-112 TGPS· MFA-ELM-119 CGM· MFA-ELM-007/MFA-ELM-010 PDP/RET· MFA-ELM-048 Court· MFA-ELM-020 Lean ‖ Άγνωστες: MFA-UNK-128: η σωστή κοκκομετρία (granularity) των claims σε φυσική γλώσσα (EPISTEMIC· OC-E1 σε πραγματικές ροές) |
| **12. Πόροι** | Type checking γραμμικό (ms)· discharge = κόστος verifiers/TGPS/tests· DEP-1: Tier-0 PROOF μόνο για CC κανόνες· DEP-2+: PROOF ευρύτερα |
| **13. Κλιμάκωση** | Κόστος ~ ∣O∣·mean(cost(method))· η βιβλιοθήκη TGPS μειώνει το PROOF κόστος· η CGM οικογένεια «obligation discharge rate» = MFA-VO-082. |
| **14. Αποτυχίες** | Έκρηξη υποχρεώσεων (κάθε token ένα claim) → ανίχνευση: ∣O∣ > RateBound → απόκριση: granularity policy: claims ανά πρόταση/δέσμευση, όχι ανά token· batching· Deferred που δεν λήγουν ποτέ → ανίχνευση: deadline → απόκριση: ESCALATE (MFA-INV-104)· Cert από checker ίδιας γενεαλογίας με γεννήτρια → ανίχνευση: EIM → απόκριση: cert άκυρο· Type checker bug → ανίχνευση: Lean soundness + 2 checkers (VFC) → απόκριση: FP incident· Πρόγραμμα παρακάμπτει τον checker → ανίχνευση: TED: εκτέλεση μόνο type-checked IR → απόκριση: αδύνατο εξ ορισμού |
| **15. Αντιπαλικοί** | Περιορισμός: Checker στο FP· Effect plane δέχεται μόνο Verified/approved-DEFER· Court escalation. ‖ Κλάση αναστρεψιμότητας: REVERSIBLE (υποχρεώσεις = δεσμεύσεις) |
| **16. Επαλήθευση** | MFA-VO-082: OC-E1 (κωδικοποίηση 8 κανόνων CC + Think–Recommend ροή· απόρριψη ροών με dropped υποχρεώσεις) F1/F2· OC-E2 (Lean μηχανοποίηση ορθότητας πυρήνα) F1· property: check ⇒ no live obligations (tools/twin) ‖ Invariants: MFA-INV-104: καμία υποχρέωση δεν απορρίπτεται (γραμμικότητα)· κάθε μία DISCHARGED ∣ DEFERRED(reason, plan, deadline) ∣ ESCALATED — ο type checker απορρίπτει weakening· MFA-INV-105: το Effect plane δέχεται μόνο Verified τιμές ή DEFER εγκεκριμένο από RET για την κλάση επίδρασης (επέκταση NoActWithoutAnswer) |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή του type checker (tools/twin/oc.py) + OC-E1 test set |
| **18. Ελάχιστο πείραμα** | **OC-E1**: 50 ροές Think–Recommend (25 σωστές, 25 με σιωπηλή απόρριψη/ανεπαρκές τεκμήριο/unverified effect) — κριτήριο (προκαταχωρισμένο): 25/25 λανθασμένες απορρίπτονται με σωστό λόγο· 25/25 σωστές περνούν· 0 ψευδώς θετικά/αρνητικά· **OC-E2**: Lean 4: πυρήνας OC (Gen, Discharge, Defer, Seq, Act) + θεώρημα ορθότητας· #print axioms — κριτήριο (προκαταχωρισμένο): Θεώρημα ελέγχεται από 2 checkers· μόνο standard axioms |
| **19. Διάψευση** | OC-E1: ψευδώς αρνητικά (ροή με dropped υποχρέωση περνά) — ο φορμαλισμός ελλιπής, αναθεωρείται (η ικανότητα proof-carrying cognition μένει)· Granularity policy που κάνει το κόστος ελέγχου > 10 % του κόστους σκέψης σε DEP-2 (τότε νέα granularity, όχι κατάργηση) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 0.5: OC-lite (Claimed/Verified, WITNESS/CHECK) στον copilot· Δόση 1: πλήρες με DEFER/ESCALATE + OC-E1· Δόση 2: Lean OC-E2 + PROOF method μέσω TGPS· FP από τη Δόση 1. |
| **21. Εξέλιξη** | Ο OC δεν μαθαίνει· τροφοδοτεί μάθηση: obligation traces = process rewards για PRR (βήματα που εκπληρώνουν υποχρεώσεις), TGL (θεωρήματα ως constraints)· τα default methods ανά tier υπό RVSI L2 μόνο προς αυστηρότερα. |
| **22. Αλληλεπιδράσεις** | MFA-ELM-122 (νέο στοιχείο OC, S0/S3)· MFA-ELM-017 TED (εκτέλεση μόνο type-checked)· MFA-ELM-103 PRR (process rewards)· MFA-ELM-123 TGL· MFA-ELM-104 RVSI (κάθε πρόταση με υποχρεώσεις)· MFA-ELM-127 Ω-loop (φάση VERIFY) |

**AI Contribution Ledger:** `NEW FORMALISM`

## Αλγόριθμοι (πλήρες pseudocode)

### OC-TypeCheck (αμφίδρομος) — πολυπλοκότητα: Γραμμικός στο μέγεθος του προγράμματος/ίχνους O(|e|)· discharge = κόστος method

```
function infer(Γ, e):
  match e:
    Gen(g, x):        (τ, _) ← infer(Γ, x) ; c ← claim_of(g, x)
                      return (Claimed[τ], {Ob(c, tier(c), required_class(tier(c)), deadline(c), method=default(tier(c)))})
    Discharge(e1, cert): (τ, O) ← infer(Γ, e1) ; ob ← O.find(cert.claim)
                      if ob = ⊥: error(NO_SUCH_OBLIGATION)
                      if not VFC.verify(cert) or class(cert) < ob.evidence_class: error(INSUFFICIENT_EVIDENCE)
                      return (Verified[τ] if O \ {ob} = ∅ else Claimed[τ], O \ {ob})
    Defer(e1, ob, reason, plan): (τ, O) ← infer(Γ, e1)
                      return (τ, (O \ {ob}) ∪ {ob.marked(DEFERRED, reason, plan, deadline)})     # stays in O, never dropped
    Seq(e1, e2):      (τ1, O1) ← infer(Γ, e1) ; (τ2, O2) ← infer(Γ + (x:τ1), e2) ; return (τ2, O1 ⊎ O2)
    Act(e1):          (τ, O) ← infer(Γ, e1)
                      if τ ≠ Verified[_] and not RET.allows_deferred(O, effect_class(e1)): error(UNVERIFIED_EFFECT)
                      return (Unit, O)
function check_program(p):
  (τ, O) ← infer(∅, p)
  live ← {ob ∈ O : ob.status ∉ {DISCHARGED, DEFERRED, ESCALATED}}
  if live ≠ ∅: error(DROPPED_OBLIGATIONS, live)                        # linear discipline (MFA-INV-104)
  return (τ, O)
```

### DischargeScheduler — πολυπλοκότητα: O(|O| log |O|) priority queue· κόστος ανά method

```
procedure DischargeScheduler(O, budgets):
  for ob in O.sorted_by(tier asc, deadline asc):
    match ob.method:
      PROOF:   cert ← TGPS.solve(ob.claim, budget=budgets[ob.tier])
      CHECK:   cert ← Verifier.check(ob.claim)
      TEST:    cert ← CGM.sealed_test(ob.claim)
      WITNESS: cert ← Ledger.receipt(ob.claim)
    if cert: ob.status ← DISCHARGED(cert)
    elif budgets[ob.tier] exhausted: ob.status ← DEFERRED(BUDGET, plan=retry_next_cut, deadline=ob.deadline)
    if now > ob.deadline and ob.status ≠ DISCHARGED: ob.status ← ESCALATED(Court if ob.tier ≤ 1 else Owner)
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| OC-E1 | 50 ροές Think–Recommend (25 σωστές, 25 με σιωπηλή απόρριψη/ανεπαρκές τεκμήριο/unverified effect) | 25/25 λανθασμένες απορρίπτονται με σωστό λόγο· 25/25 σωστές περνούν· 0 ψευδώς θετικά/αρνητικά |
| OC-E2 | Lean 4: πυρήνας OC (Gen, Discharge, Defer, Seq, Act) + θεώρημα ορθότητας· #print axioms | Θεώρημα ελέγχεται από 2 checkers· μόνο standard axioms |

## Επιστημική κατάσταση (§5) — συνολικά: **NEW FORMALISM**

| Ισχυρισμός | Κατάσταση |
|---|---|
| Γραμμικοί/effect τύποι επιβάλλουν μη-απόρριψη πόρων | PROVEN |
| Obligation Calculus ως τύποι γνωσιακών βημάτων με tiers/deadlines/reason-typed defer | NEW FORMALISM |
| Θεώρημα ορθότητας του πυρήνα | RESEARCH HYPOTHESIS |
| Κόστος ελέγχου αμελητέο έναντι σκέψης | ACTIVE UNKNOWN |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή του type checker (tools/twin/oc.py) + OC-E1 test set
2. F2: Lean μηχανοποίηση OC-E2
3. F3: ενσωμάτωση σε TED IR σε DEP-1
4. F4: παραγωγή Δόση 1


## 0.4.0 — Ευρήματα της F1 εκτελέσιμης προδιαγραφής (tools/twin/oc.py, MFA-PATCH-0058)

1. **Act αυστηρότερο από το pseudocode:** ο κανόνας `Act(e1)` δέχεται μόνο `Verified[τ]` ή `Claimed[τ]` με DEFER εγκεκριμένο από RET για ΑΝΑΣΤΡΕΨΙΜΗ/αντισταθμίσιμη κλάση επίδρασης· τιμή τύπου `Unknown[reason]` ή `Base` που φτάνει στο Effect plane είναι `UNVERIFIED_EFFECT`. Η κυριολεκτική συνθήκη του πεδίου `algorithms[0]` άφηνε μία λανθασμένη ροή (OC-E1) να περάσει· η αυστηρή μορφή είναι η ισχύουσα (MFA-INV-105).
2. **Κοκκομετρία:** μία υποχρέωση ανά δέσμευση/κλάση επίδρασης (MFA-PATCH-0050, ATK-25) — επιβεβαιώνεται στο OC-E1 (≈10 υποχρεώσεις ανά ροή).
3. **Πιστοποιητικά:** ο stub VFC με δύο ανεξάρτητους checkers και τον κανόνα γενεαλογίας (MFA-INV-089) απορρίπτει cert από checker ίδιας γενεαλογίας με τη γεννήτρια.
4. **Μετρήσεις F1:** 25/25 σωστές ροές δεκτές, 25/25 λανθασμένες απορριφθείσες με λόγο (DROPPED_OBLIGATIONS, INSUFFICIENT_EVIDENCE, INVALID_DEFER, NO_SUCH_OBLIGATION, UNVERIFIED_EFFECT)· 0 ψευδώς θετικά/αρνητικά (MFA-VO-082, επίπεδο F1).
