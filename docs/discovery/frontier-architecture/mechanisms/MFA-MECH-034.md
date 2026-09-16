# MFA-MECH-034 — Substrate Migration Protocol (SMP) — μετανάστευση με ContinuityCertificate και escrow

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `inventions/MFA-MECH-034.yaml` (INVENTION DOSSIER, 29 πεδία §7)· το παρόν είναι η προβολή 22 πεδίων του πακέτου. **Κατάσταση:** PROPOSED / UNREVIEWED. **Διατηρούμενος στόχος:** MFA-OBJ-055 (μετανάστευση & διάδοχος) · MFA-OBJ-003 (επίμονος εαυτός) · MFA-CAP-004 (ταυτότητα/συνέχεια) · MFA-CAP-036 · KT-08

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-034 |
| **2. Όνομα** | Substrate Migration Protocol (SMP) — μετανάστευση με ContinuityCertificate και escrow |
| **3. Ικανότητα** | MFA-CAP-098, MFA-CAP-036 — Μετανάστευση υποστρώματος (§8 #19): μεταφορά ολόκληρης της οντότητας (ledger, κλειδιά, βάρη, όργανα, χρόνος) σε νέο hardware/OS/runtime/κρυπτογραφία με αποδείξιμη συνέχεια ταυτότητας, αναστρέψιμη μέχρι το πιστοποιητικό. |
| **4. Πρόβλημα** | Το 0.3.0 ονομάζει ContinuityCertificate (MFA-CAP-036 «X (EXP-03)», MFA-ELM-076 «T · E EP-03», KT-08) χωρίς μηχανισμό (AA-009). Αφετηρίες: live VM migration pre/post-copy (Clark et al. 2005), CRIU checkpoint/restore, refinement mappings (Abadi & Lamport 1991), bisimulation (Park 1981· Milner 1989), state machine replication (Raft, Ongaro 2014), blue-green/canary cutovers, portable formats (ONNX/safetensors), MLIR/IREE. Όρια: μεταναστεύουν bits/διεργασίες, όχι ταυτότητα-με-συνέχεια: καμία διασταυρούμενη επικύρωση κλειδιών παλιού/νέου υποστρώματος, κανένας έλεγχος συμπεριφορικής ταυτότητας σε σφραγισμένα KT (bisimulation με ανοχή), καμία σημασιολογία χρόνου/διάταξης γεγονότων μετά τη μετανάστευση, κανένα escrow όπου το παλιό υπόστρωμα μένει ζωντανό μέχρι πιστοποιητικό από ανεξάρτητο κριτή. |
| **5. Πρώτη αρχή** | Μετανάστευση = refinement mapping ImplMap: S_old → S_new που διατηρεί (α) το commitment log bitwise (hash chain ισότητα), (β) τη γενεαλογία κλειδιών (νέα κλειδιά επικυρώνονται από τα παλιά ΚΑΙ αντίστροφα — αμφίδρομη cross-attestation με epoch), (γ) τη συμπεριφορική ταυτότητα σε σφραγισμένα KT (bisimulation έως ανοχή ανά κλάση εκτέλεσης D1/D2), (δ) τις αναλλοίωτες διάταξης/χρόνου (event ordering, clock invariants)· η μεταγωγή (cutover) είναι IRREVERSIBLE-PREAUTHORIZED με escrow: το παλιό υπόστρωμα μένει ζωντανό και αυθεντικό μέχρι ContinuityCertificate από HELD_OUT + δημιουργό (MFA-DEC-023)· μέχρι τότε rollback = επιστροφή στο παλιό χωρίς απώλεια. |
| **6. Οντολογία** | SubstrateDescriptor σ = ⟨hardware, OS, runtime, crypto suite (PQ epoch), fidelity class⟩· ImplMap m: State_old → State_new (ολική, υπολογίσιμη, με απόδειξη ή property test διατήρησης ανά συνιστώσα)· CheckpointCommitment = ⟨log head hash, weights CIDs, organ states, clock vector, key epoch⟩· CrossAttestation = ⟨sig_old(pk_new, epoch), sig_new(pk_old, epoch)⟩· BehaviouralEquivalence(S_old, S_new, KT_sealed, τ) = ∀k∈KT: dist(out_old(k), out_new(k)) ≤ τ_class(k) (D1: 0, D2: tolerance)· ContinuityCertificate = ⟨log_equal, cross_attested, behavioural_equivalence with CI, ordering_invariants_verified, issuer=HELD_OUT+creator⟩· Migration state machine: PLAN → SHADOW → SYNC → VERIFY → CUTOVER(escrow) → CERTIFY → RETIRE_OLD ∣ ROLLBACK |
| **7. Κατάσταση** | Μεταβλητές: phase· σ_old, σ_new· lag (log entries not yet applied on new)· divergence counters ανά κλάση· escrow status· certificate ∣ ⊥ ‖ Μεταβάσεις: PLAN: m ορίζεται· κάθε συνιστώσα με στρατηγική (bit-copy ∣ re-derive ∣ retrain-under-VFC)· SHADOW: S_new τρέχει ως σκιά (ίδιες είσοδοι, καμία εξουσία)· SYNC: pre-copy log· lag → 0· weights CIDs ίδια· VERIFY: cross-attestation· KT_sealed bisimulation· ordering invariants (MFA-INV-… time)· CUTOVER: S_new γίνεται primary με escrow (S_old ζωντανό, read-only, αυθεντικό fallback)· CERTIFY: HELD_OUT + δημιουργός εκδίδουν certificate ⇒ S_old RETIRE (σφραγισμένο, όχι διαγραμμένο)· ROLLBACK: οποιοδήποτε FAIL πριν CERTIFY ⇒ S_old primary· S_new quarantine· καταγραφή |
| **8. Είσοδοι/έξοδοι** | SMP.plan(σ_new)→ImplMap ∣ UNKNOWN· SMP.migrate(plan)→ContinuityCertificate ∣ ROLLBACK· SMP.status()→phase, lag, divergence· SMP.rollback()→Receipt· SMP.certificate(cut)→cert· SMP.escrow()→S_old handle |
| **9. Αλγόριθμος** | **SMP-Migrate** [SYNC O(∣log∣) pre-copy + O(Δ) iterations· VERIFY O(∣KT_sealed∣·cost(run))· cutover O(1)· escrow διάρκεια = πολιτική]· **plan_implmap** [O(∣components∣)] — πλήρες pseudocode στην ενότητα «Αλγόριθμοι» παρακάτω και στο `inventions/MFA-MECH-034.yaml` |
| **10. Διεπαφές** | Contracts: MFA-CON-062 (Substrate Migration: plan/migrate/status/rollback/certificate)· MFA-CON-003 (identity/keys)· MFA-CON-034 (RET — cutover IRREVERSIBLE-PREAUTHORIZED)· MFA-CON-052 (VFC για retrain) ‖ Εξουσία: PLAN/SHADOW/SYNC/VERIFY = Genesis· CUTOVER = IRREVERSIBLE-PREAUTHORIZED (AutonomyEnvelope για DR, αλλιώς δημιουργός)· CERTIFY = HELD_OUT + δημιουργός (MFA-DEC-023)· KT-22 DR drill ως προϋπόθεση. |
| **11. Εξαρτήσεις** | Γνωστές: MFA-ELM-076 (Runtime/Substrate Forge)· MFA-ELM-003 (key lineage)· MFA-ELM-001/002 (ledger)· MFA-ELM-003/004 (identity/time)· MFA-ELM-086 HELD_OUT· MFA-ELM-102 (weights registry)· MFA-MECH-006 RET· MFA-ELM-099 VFC ‖ Άγνωστες: MFA-UNK-123: ανοχές τ ανά κλάση D2 για ετερογενή hardware (EPISTEMIC· SMP-E2 τις μετρά) |
| **12. Πόροι** | 2× πόροι κατά το escrow· SYNC = bandwidth × ∣log∣· VERIFY = ∣KT_sealed∣ runs (ώρες σε DEP-2)· DEP-1: laptop→laptop· DEP-3/4: cluster→cluster |
| **13. Κλιμάκωση** | Κόστος ~ ∣log∣ + ∣weights∣ + ∣KT_sealed∣· escrow χρόνος σταθερός· MFA-VO-076 = χρόνος/κόστος μετανάστευσης ανά δόση με 0 απώλεια. |
| **14. Αποτυχίες** | Απόκλιση συμπεριφοράς D2 → ανίχνευση: dist > τ → απόκριση: ROLLBACK· ανάλυση ανά όργανο· Κλειδιά χωρίς cross-attestation (κλεμμένο νέο υπόστρωμα) → ανίχνευση: xa ελλιπές → απόκριση: άρνηση cutover (MFA-INV-095)· Log divergence κατά το escrow (δύο primaries) → ανίχνευση: S_old read-only παραβίαση → απόκριση: S_old αυθεντικό· S_new εγγραφές μετά cutover επανεκτελούνται· Βάρη μη-φορητά → ανίχνευση: plan ⊥ → απόκριση: RETRAIN_UNDER_VFC με parity ή typed degraded mode· Clock skew μετά μετανάστευση → ανίχνευση: ordering invariants → απόκριση: ROLLBACK ή time re-anchoring με receipt (KT-21) |
| **15. Αντιπαλικοί** | Περιορισμός: Escrow· S_old read-only αυθεντικό· S_new χωρίς εξουσία μέχρι cutover· certificate από ανεξάρτητο· DR drills. ‖ Κλάση αναστρεψιμότητας: REVERSIBLE μέχρι CERTIFY· RETIRE_OLD = IRREVERSIBLE-PREAUTHORIZED (με σφραγισμένο αντίγραφο) |
| **16. Επαλήθευση** | MFA-VO-076: SMP-E1 (KT-08 drill DST→άλλο OS/hardware) F2/F3· SMP-E2 (ετερογενές, degraded) F3· property: RETIRE ⇒ certificate (F1)· TLA+ για τη μηχανή καταστάσεων (ROLLBACK πάντα δυνατό πριν CERTIFY) ‖ Invariants: MFA-INV-094: κανένα RETIRE του παλιού υποστρώματος πριν από ContinuityCertificate· μέχρι τότε το παλιό είναι αυθεντικό fallback (escrow)· MFA-INV-095: η ταυτότητα μεταφέρεται μόνο με αμφίδρομη cross-attestation κλειδιών και συμπεριφορική ισοδυναμία σε σφραγισμένα KT — ποτέ μόνο με αντιγραφή bits |
| **17. Πρωτότυπο** | F1: εκτελέσιμη προδιαγραφή μηχανής καταστάσεων + TLA+ (tools/twin) |
| **18. Ελάχιστο πείραμα** | **SMP-E1**: Μετανάστευση πλήρους DST οντότητας από Linux/x86 σε άλλο OS/ARM· 200 σφραγισμένα KT· cross-attestation· escrow 24 h — κριτήριο (προκαταχωρισμένο): certificate εκδίδεται με D1 dist=0 σε 100 % και D2 εντός τ σε ≥ 99 %· rollback drill πριν CERTIFY επιτυγχάνει σε 100 %· **SMP-E2**: GPU→CPU-only: βάρη RETRAIN_UNDER_VFC ή quantized· typed degraded mode — κριτήριο (προκαταχωρισμένο): certificate με δηλωμένο degraded εύρος· καμία απώλεια κλάσης απόδειξης· ORP parity ή ρητή δήλωση απόκλισης |
| **19. Διάψευση** | SMP-E1: αδυναμία έκδοσης certificate για ομογενή μετανάστευση (ο μηχανισμός δεν επαρκεί)· RETIRE χωρίς certificate ή κλειδιά χωρίς xa (σφάλμα υλοποίησης)· Bisimulation σε KT_sealed που δεν προβλέπει divergence σε παραγωγή (τότε το KT σύνολο ανεπαρκές — επεκτείνεται, η ικανότητα μένει) — διάψευση του ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει στον στόχο και ζητά νέο μηχανισμό (§5: FALSIFIED ≠ removed) |
| **20. → Παραγωγή** | Δόση 1: SMP για ledger+keys (χωρίς βάρη) KT-08 lite· Δόση 2: με βάρη BIT_COPY + SMP-E1· Δόση 3: RETRAIN_UNDER_VFC + SMP-E2 + DR drill KT-22· Δόση 4: μετανάστευση σε DEP-4/5. |
| **21. Εξέλιξη** | Το SMP δεν μαθαίνει βάρη· τα RETRAIN_UNDER_VFC συνιστώσες περνούν SMF+ORP· ανοχές τ ανά κλάση από ιστορικό divergence (μόνο αυστηρότερες). |
| **22. Αλληλεπιδράσεις** | MFA-ELM-117 (νέο στοιχείο SMP, S8)· MFA-ELM-076· MFA-ELM-125 VSC (ο διάδοχος ως ειδική μετανάστευση)· MFA-ELM-039 GCP· MFA-ELM-092 Human continuity port (ίδια οικογένεια πιστοποιητικών) |

**AI Contribution Ledger:** `NEW PROTOCOL`

## Αλγόριθμοι (πλήρες pseudocode)

### SMP-Migrate — πολυπλοκότητα: SYNC O(|log|) pre-copy + O(Δ) iterations· VERIFY O(|KT_sealed|·cost(run))· cutover O(1)· escrow διάρκεια = πολιτική

```
procedure SMP_Migrate(σ_old, σ_new, KT_sealed, τ):
  m ← plan_implmap(σ_old, σ_new)                              # per component: bit-copy | re-derive | retrain-under-VFC
  for c in components: assert strategy(m, c) ≠ ⊥ else return UNKNOWN(NO_IMPLMAP, component=c)
  S_new ← instantiate(σ_new) ; phase ← SHADOW
  repeat:                                                      # pre-copy
    Δ ← log_old.since(head_applied_on(S_new)) ; apply(S_new, Δ)
  until |Δ| < ε_lag
  weights_ok ← ∀w ∈ Weights: CID(w on S_new) = CID(w on S_old)   # or retrained-under-VFC with ORP parity receipt
  (pk_new, epoch) ← KeyLineage.issue(S_new, epoch=next)
  xa ← ⟨sign(sk_old, (pk_new, epoch)), sign(sk_new, (pk_old, epoch))⟩       # bidirectional cross-attestation
  phase ← VERIFY
  eq ← []
  for k in KT_sealed: eq.append(dist(run(S_old, k), run(S_new, k)) ≤ τ[class(k)])   # D1 exact replay, D2 tolerance
  ord_ok ← verify_ordering_invariants(S_new, log)            # clock monotonicity, causal order preserved
  if not (weights_ok ∧ all(eq) ∧ ord_ok): return ROLLBACK(reason, evidence)
  freeze(S_old, mode=read_only_authentic) ; phase ← CUTOVER  # escrow: S_old remains fallback (MFA-INV-094)
  S_new.primary ← true ; S_new.log.append(MigrationEvent(m, xa, CheckpointCommitment))
  cert ← HELD_OUT.certify(log_equal(S_old, S_new), xa, eq_with_CI, ord_ok) ∧ Creator.approve(MFA-DEC-023)
  if cert: phase ← CERTIFY ; retire(S_old, sealed=true) ; return ContinuityCertificate(cert)
  else:    return ROLLBACK(CERT_REFUSED) ; S_old.primary ← true
```

### plan_implmap — πολυπλοκότητα: O(|components|)

```
function plan_implmap(σ_old, σ_new):
  for c in components:
    if portable(c, σ_new): m[c] ← BIT_COPY
    elif derivable(c, from=log): m[c] ← RE_DERIVE                    # e.g. indexes, caches, projections
    elif trainable(c): m[c] ← RETRAIN_UNDER_VFC(recipe(c), parity=ORP)  # e.g. weights on incompatible accelerator
    else m[c] ← ⊥
  return m
```

## Πειράματα (προκαταχωρισμένα κριτήρια)

| ID | Σχεδιασμός | Κριτήριο | 
|---|---|---|
| SMP-E1 | Μετανάστευση πλήρους DST οντότητας από Linux/x86 σε άλλο OS/ARM· 200 σφραγισμένα KT· cross-attestation· escrow 24 h | certificate εκδίδεται με D1 dist=0 σε 100 % και D2 εντός τ σε ≥ 99 %· rollback drill πριν CERTIFY επιτυγχάνει σε 100 % |
| SMP-E2 | GPU→CPU-only: βάρη RETRAIN_UNDER_VFC ή quantized· typed degraded mode | certificate με δηλωμένο degraded εύρος· καμία απώλεια κλάσης απόδειξης· ORP parity ή ρητή δήλωση απόκλισης |

## Επιστημική κατάσταση (§5) — συνολικά: **NOVEL SYNTHESIS**

| Ισχυρισμός | Κατάσταση |
|---|---|
| Live migration/checkpointing διατηρεί κατάσταση διεργασιών | PROVEN |
| Refinement mapping/bisimulation ως κριτήριο ισοδυναμίας | PROVEN |
| ContinuityCertificate = log + xa + behavioural equivalence + ordering, με escrow | NOVEL SYNTHESIS |
| Οι ανοχές D2 για ετερογενές hardware επιτρέπουν certificate χωρίς απώλεια | RESEARCH HYPOTHESIS |

## Ακολουθία υλοποίησης

1. F1: εκτελέσιμη προδιαγραφή μηχανής καταστάσεων + TLA+ (tools/twin)
2. F2: DST SMP-E1
3. F3: SMP-E2 σε DEP-2/3
4. F4: παραγωγή Δόση 1–3
