# TECHNICAL-ARCHITECTURE — το πλήρες τεχνικό σχέδιο (προβολή των YAML εδρών, PATCH-PROTOCOL §6)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

Αυτό το αρχείο είναι **προβολή**: κάθε στοιχείο, contract, invariant, υποχρέωση, μηχανισμός και απόφαση ζει στα YAML/MD έδρες του πακέτου με σταθερό ID· εδώ συντίθενται σε ένα ενιαίο τεχνικό σχέδιο με τα 25 σημεία βάθους της εντολής §9 ανά υποσύστημα. Όπου η προβολή και το YAML διαφωνούν, ισχύει το YAML. Έκδοση πακέτου 0.3.0 (μετά MFA-PATCH-0001…0019, Pass I σταθερό σημείο).

## Περιεχόμενα

0. Πώς διαβάζονται τα 25 σημεία · 1. Πλαίσιο συστήματος · 2. Δύο planes, έντεκα στρώματα · 3. Κανονικό υπόστρωμα · 4. Εξουσία και επιδράσεις · 5. Μοντέλο δεδομένων και συμβάντων · 6. Μηχανές καταστάσεων · 7. Γνωσιακή αρχιτεκτονική / πορεία ASI · 8. Ψηφιακό δίδυμο · 9. Συλλογικό και Πολιτισμοί · 10. LAWMAX · 11. Εξέλιξη και διάδοχος · 12. Cockpit · 13. Ιστός επαλήθευσης · 14. Ασφάλεια και TCB · 15. Προφίλ ανάπτυξης MFA-DEP-1…5 · 16. Σειρά γένεσης (bootstrap) · 17. Υποβαθμισμένες λειτουργίες και ανάκαμψη · 18. Παρατηρησιμότητα · 19. Φάκελος πόρων · 20. Ανοιχτά ερευνητικά ερωτήματα · 21. Κατάλογος στοιχείων ανά στρώμα (τα 25 σημεία ανά στοιχείο) · 22. Διαγράμματα · 23. Ευρήματα Devil's Advocate

## 0. Πώς διαβάζονται τα 25 σημεία της εντολής §9 ανά υποσύστημα

| # | Σημείο (εντολή §9) | Πού ζει ανά στοιχείο |
|---|---|---|
| 1 | Σκοπός | `purpose` |
| 2 | Ικανότητες | `capabilities` → CAPABILITY-LATTICE |
| 3 | Οντολογία / τύποι | `state_model`, δοσιέ §6 |
| 4 | Διεπαφές | `interfaces` → CONTRACTS (statement/state_semantics/failure_semantics/exec_type) |
| 5 | Εξουσία | `authority` + MFA-INV-007/037 |
| 6 | Κατάσταση | `state_model` |
| 7 | Είσοδοι/έξοδοι | contract statement |
| 8 | Αλγόριθμος | δοσιέ §9 (MECH) ή statement |
| 9 | Εξαρτήσεις | `dependencies` (§16 σειρά γένεσης για τους κύκλους) |
| 10 | Αποτυχίες | `failure_modes` |
| 11 | Αντιπαλικοί | δοσιέ §15, adversarial/ |
| 12 | Επαλήθευση | `verification` → VO |
| 13 | Falsifier | `falsifier` |
| 14 | Πόροι | `resource_model` + §15 |
| 15 | Υποβαθμισμένες λειτουργίες | §17 + DEP.Degraded |
| 16 | Ανάκαμψη | §17 |
| 17 | Παρατηρησιμότητα | §18 |
| 18 | Ασφάλεια / όρια επιδράσεων | `plane`, §4, §14 |
| 19 | Φάκελος απόδοσης | `resource_model`, §19 |
| 20 | Υποχρεώσεις επαλήθευσης | VERIFICATION-OBLIGATIONS |
| 21 | Εξέλιξη / αντικατάσταση | `evolution_path` (R-A/R-B/R-C/ORP/GCP) |
| 22 | Εξαρτήσεις | `dependencies`, RELATIONS |
| 23 | Ανοιχτά ερωτήματα | `unknowns` → UNKNOWNS, RESEARCH-PROGRAMS |
| 24 | Mermaid | diagrams/ (§22) |
| 25 | Devil's Advocate | adversarial/ (§23)· κάθε στοιχείο στόχος ≥ 1 επίθεσης (R9) |

## 1. Πλαίσιο συστήματος

Το GRAIL είναι ένα **κυρίαρχο γνωσιακό και θεσμικό υπερσύστημα** που ξεκινά ως εκτελέσιμο ψηφιακό δίδυμο και εξελίσσει κάθε όργανό του, χωρίς να χάνει το Telos του· το LAWMAX είναι η πρώτη νομική του έκφραση. Οι δρώντες γύρω του: ο **δημιουργός** (μόνος κάτοχος L3· Owner Root offline/HSM· εγκρίνει με υπογραφή)· οι **Principals** (δικηγόροι που υπογράφουν παραδοτέα, H1)· οι **πελάτες** (μέσω Client Portal, MFA-ELM-069)· οι **πάροχοι** inference (εκτός sovereign boundary, μόνο μέσω DisclosureGrant)· οι **πηγές** (ΦΕΚ, αποφάσεις, έγγραφα — με attestation)· οι **αντίδικοι/δικαστήρια** (πραγματικοί: μόνο μέσω μη αναστρέψιμων πράξεων με envelope ή H1· προσομοιωμένοι: World Twin)· ο **ανταγωνιστής** (ALT-6/7 baseline μέσα στο harness). Το Telos: MFA-TEL-08 συνιστώμενο, με διάταξη αντιφάσεων· χτίζεται πρώτα η τομή (robust substrate MFA-ELM-096). Διάγραμμα: MFA-DIA-02.

## 2. Δύο planes, έντεκα στρώματα

**Genesis plane (MFA-ELM-094):** νόηση χωρίς όριο — raw eval, μετα-επίπεδα, αυτο-τροποποίηση, απεριόριστη προσομοίωση, αντιπαλικοί κόσμοι — μέσα σε ένα trust boundary (ένα microVM στο DP-1, ομάδα από DP-3), με τοπικό inference server μέσα. Κανένα Control μέσα· η πύλη έχει μόνο **advisory** όψη (MFA-ATK-16). Μόνες έξοδοι: EffectTx μέσω του Gateway, συμπεριλαμβανομένης της κλάσης DISCLOSE (κάθε κλήση εξωτερικού παρόχου είναι επίδραση, MFA-ATK-05).

**Effect plane (MFA-ELM-095):** typed, με receipts· RET (MFA-ELM-010) με κλάσεις REVERSIBLE / IRREVERSIBLE / IRREVERSIBLE-PREAUTHORIZED / DISCLOSE· πύλη effective όψη· PDP· Safe-Halt.

**Στρώματα** (κριτήριο ένταξης: ένα στοιχείο ανήκει στο στρώμα του οποίου τα contracts καταναλώνει χωρίς να εκθέτει υλοποίηση προς τα κάτω — CLAIMS F9):

| Στρώμα | Περιγραφή | Στοιχεία |
|---|---|---|
| S0 | Substrate — robust, ίδιο σε κάθε υποψήφιο Telos | 001, 002, 003, 004, 005, 099 (6) |
| S1 | Authority & Effect plane | 006, 007, 008, 009, 010, 011, 012, 013, 014, 015, 016 (11) |
| S2 | Genesis plane — νόηση χωρίς όριο, μέσα στο trust boundary | 017, 018, 019, 020, 021, 022, 023, 024, 025, 026, 027, 028, 029, 030, 031, 032, 098 (17) |
| S3 | Entity (AEO) | 033, 034, 035, 036, 037, 038, 039, 040 (8) |
| S4 | Collective (Epistemic Commons) | 041, 042, 043, 044, 045, 046, 047 (7) |
| S5 | Institutions & Civilizations | 048, 049, 050, 051, 052, 053, 054, 055, 056, 057 (10) |
| S6 | LAWMAX (G1) | 058, 059, 060, 061, 062, 063, 064, 065, 066, 067, 068, 069, 070, 071, 072 (15) |
| S7 | Evolution & Forge (Meta) | 073, 074, 075, 076, 077, 078 (6) |
| S8 | Knowledge & Provenance (εγκάρσιο) | 079, 080, 081, 082, 083 (5) |
| S9 | Operations & Verification (εγκάρσιο) | 084, 085, 086, 087, 088, 089, 090 (7) |
| S10 | Human & Spatial | 091, 092, 093 (3) |
| SX | Composites | 094, 095, 096, 097 (4) |

Διαγράμματα: MFA-DIA-03 (στρώματα), MFA-DIA-05 (εξουσία/επιδράσεις).

## 3. Κανονικό υπόστρωμα (Commitment Calculus)

Μία έδρα αλήθειας ανεξάρτητη σειριοποίησης (MFA-MECH-001, MFA-ELM-001). **Δέσμευση** = υπογεγραμμένο, τυποποιημένο αντικείμενο με: `id` (CID), `author` (κλειδί σώματος υπό lease), `rule` ∈ {ASSERT, OBSERVE, DERIVE, DELEGATE, CONTEST, RESOLVE, REVOKE, FORGET}, `payload` (typed, LinkML σχήμα υπό MFA-DEC-008), `evidence` ∈ {Proof, Unknown(reason, plan, VOI), Both(collapse_fn = Court), Receipt}, `status_axes` (10 άξονες, καθένας value ή Absent(reason ∈ 6)), `times` (5 χρόνοι), `authority_ceiling` (μονότονο), `lineage` (CIDs), `labels` (ροή/εμπιστευτικότητα), `exec_type` ∈ {D1, D2, P1, H1}, `repro_level` (4 επίπεδα), `signature`. Το ledger είναι **μονότονο** (append-only· REVOKE/FORGET = tombstones· FORGET + shredding = residue commitment ⟨hash, schema, evidence_class, dependents_count, erasure_act_receipt⟩ — MFA-CFL-035)· το «τρέχον γράφημα» είναι παράγωγο fold· το DPO είναι η σημασιολογία επανεγγραφής **κανόνων** (Forge/ORP/CPEG), ποτέ του ledger (MFA-ATK-08). Journals ανά συγγραφέα, Merkle inclusion/consistency (RFC 6962/9162), witness cosignatures, HLC, fold ντετερμινιστικό (MFA-INV-008). Κλειστότητα: θεώρημα (MFA-INV-041, Lean, MFA-VO-025)· Δόση 0 = **CC-lite** 4 κανόνων· η μετάβαση CC-lite → CC είναι η πρώτη ORP. Κοινό λεξιλόγιο 12 typed σφαλμάτων με υποχρεωτική συμπεριφορά (MFA-CON-033.error_vocabulary). Epoch allowlist: hash, υπογραφή, KEM, canonical encoding (MFA-ELM-005)· PQ-safe commitments (MFA-INV-066). Διάγραμμα: MFA-DIA-04.

## 4. Εξουσία και επιδράσεις

- **Μηδενική ambient authority** (MFA-INV-007/037): κάθε πράξη με capability token (Biscuit-class, CLAIMS F56)· `authority_ceiling` πεδίο του αντικειμένου, μονότονο.
- **RET (MFA-MECH-006):** proposal → inverse staged → shadow → diff → gate → commit → window. Κλάσεις: REVERSIBLE (inverse προ-δεσμευμένο, AutonomyGrant)· IRREVERSIBLE (NONE ⇒ φρέσκο H1)· IRREVERSIBLE-PREAUTHORIZED (AutonomyEnvelope⟨matter, effect_class, window, max_exposure, conditions, counter_signer, expiry, presimulation⟩ υπογεγραμμένο εκ των προτέρων· το envelope είναι το αναστρέψιμο αντικείμενο· foreseen_effects από shadow run στο World Twin ή NONE δηλωμένο — MFA-INV-067, MFA-ATK-09, Pass I)· DISCLOSE (DisclosureGrant⟨recipient, max_label, purpose, expiry⟩· label(payload) ≤ max_label — MFA-ATK-05). Owner perimeter 6 βαθμίδων: Think / Prepare / Recommend / Execute-bounded / Execute-consequential / Emergency-stop.
- **Πύλη (MFA-ELM-008, LPA MFA-MECH-005):** μόνο αποφασίσιμα κατηγορήματα φραγμένου κόστους (MFA-INV-054)· 10 governors (Truth, Legal/Deontic, Owner-intent, Value, Regret, Curiosity, Empowerment, Commitment, Identity, Resource)· veto περικοπή → Pareto → ονομασμένη scalarization → regret tie-break· **διανυσματική** ετυμηγορία (MFA-INV-058)· ORDER = L2 δέσμευση με προεπιλογή Tier-0 → Tier-1 → Tier-2 (MFA-DEC-005)· δύο όψεις (advisory στο Genesis χωρίς εξουσία, effective στο Effect plane)· N-version Rust + CL (Tier-0 πάντα, Tier-1/2 audit sampling στο DP-1)· fail-closed (MFA-INV-003).
- **PDP / MetaBounds / Safe-Halt:** Control Records με λήξη (MFA-INV-053)· MECHANISM bounds δεν λυγίζουν· κλιμακωτή παύση (Principal δικό του, δημιουργός καθολικό k-of-n δηλωμένων εκπροσώπων — MFA-DEC-012, αυτόματοι Tier-0 triggers).
- **Επίπεδα αυτο-τροποποίησης (MFA-INV-031):** L0 όργανα (R-A) · L1 contracts (R-B) · L2 governors/ORDER/πολιτικές (R-C, Court) · L3 σύνταγμα/verifier set/gate/Telos/kernel (μόνο δημιουργός, ποτέ από μέσα).

Διαγράμματα: MFA-DIA-05, MFA-DIA-10 (μηχανή αυτονομίας).

## 5. Μοντέλο δεδομένων και συμβάντων

| Αντικείμενο | Έδρα | Σχήμα (σύνοψη) | Ταυτότητα |
|---|---|---|---|
| Commitment | MFA-ELM-001 | §3 | CID (JCS + tagged digest, epoch) |
| Blob | MFA-ELM-002 | raw / json-jcs· envelopes shredding | CIDv1 |
| Receipt | MFA-ELM-009/010 | ⟨effect_cid, class, inverse_cid ∣ envelope_cid ∣ grant_cid, exec_type, repro_level, generator, presimulation, signature⟩ | CID |
| Void entry | MFA-ELM-028 | ⟨subject, axis, reason, plan, VOI, dependents, expiry⟩ | CID |
| Goal | MFA-ELM-029 | ⟨gap_vector, falsifier, grant ∣ envelope, state⟩ | CID (δέσμευση υπό εισδοχή) |
| Verdict | MFA-ELM-044/048 | ⟨proceeding_cid, standard_of_proof (Tier), vector, dissent, appeal_path, re_verifiable⟩ | CID (BFT-ordered cross-site) |
| Prediction | MFA-ELM-024 | ⟨predictor, target, horizon, score_at, outcome⟩ | CID |
| Patch | MFA-ELM-090 | PATCH-PROTOCOL §3 | MFA-PATCH-nnnn (F0 git· F2+ δέσμευση) |
| Scene | MFA-ELM-091 | Γ(cut, policy, seed) — Galois (α, γ) | SceneGraph hash |
| Event | MFA-ELM-014 | versioned subjects· transport only· event_cid correlation | — (ποτέ αλήθεια) |
| Trace/metric/log | MFA-ELM-087 | OTel + event_cid· αποφάσεις δειγματοληψίας ως Observations | — |

Ροές: κάθε είσοδος (έγγραφο, πηγή, ζωντανό συμβάν) → attestation (S0) → δεσμεύσεις με lineage μέχρι raw bytes (MFA-DIA-12)· κάθε έξοδος → emission barrier (MFA-ELM-032: OutputClass ∈ {VERIFIED, REFUTED, UNKNOWN(reason), CONTESTED-GLUT}, claim_type ανά πρόταση, κανένα ανεξήγητο βαθμωτό, omitted_count) → Principal H1 → InstitutionalAct με receipts και contest_path (MFA-DIA-13).

## 6. Μηχανές καταστάσεων

| Μηχανή | Καταστάσεις | Έδρα | Διάγραμμα |
|---|---|---|---|
| RET (επίδραση) | PROPOSED → INVERSE_STAGED → SHADOW → DIFFED → GATED → COMMITTED → WINDOW → SETTLED ∣ ROLLED_BACK ∣ DENIED (9) | MFA-MECH-006 §7 | MFA-DIA-10 |
| AutonomyEnvelope | DRAFT → PRESIMULATED(F∣NONE) → PENDING_SIGNATURE → LIVE → {CONSUMED, EXPIRED, REVOKED} | MFA-INV-067 | MFA-DIA-10 |
| TEGF (βούληση) | LATENT → GAP_SENSED → CANDIDATE → DELIBERATING → ADMITTED (με falsifier) → GRANTED ∣ ENVELOPE_PENDING ∣ BLOCKED → ACTING → REVIEW → {FULFILLED, REVISED, ABANDONED, SUSPENDED} (10) | MFA-MECH-004 | MFA-DIA-09 |
| ORP (αντικατάσταση οργάνου) | Proposed → CPEG(PASS∣PARTITION∣UNKNOWN→shadow) → Shadow → LossMap(±) → ND → Canary → Cutover → RollbackWindow → Retired ∣ Rejected | MFA-ELM-038 | MFA-DIA-11 |
| GCP (διάδοχος) | ProposedS → Compiling → Replaying → Diffing → ShadowS → VerdictPending → Adopted ∣ RejectedS → RolledBack | MFA-MECH-003 | MFA-DIA-11 |
| Court (proceeding) | FILED → CHALLENGED → EVIDENCE → EXAMINATION → DELIBERATION → VERDICT(vector, standard) → DISSENT_RECORDED → APPEAL ∣ FINAL | MFA-ELM-048 | MFA-DIA-07 |
| Safe-Halt | RUNNING → FROZEN (TimeFreeze με receipt) → HALTED → RUNNING | MFA-ELM-016 | MFA-DIA-05 |
| Πολιτισμός | VOTING ∣ HELD_OUT ∣ (ARCHIVE = ADD)· rotation | MFA-MECH-018 | MFA-DIA-07 |
| Fidelity ladder | F0 (IDs/contracts) → F1 (executable spec) → F2 (DST stubs) → F3 (real organs, sim world) → F4 (real world, canary) → F5 (πλήρες)· behavioural identity ανά σκαλί | MFA-MECH-015 | MFA-DIA-08 |
| Πράξη μεταγλώττισης πηγής (LSC) | S0 attest → S1 layout → S2 segment → S3 front-end P1 → S4 validate D1 → S5 back-end D2 → S6 differential → S7 admission· CompilationError(locus) | MFA-MECH-016 | MFA-DIA-12 |

## 7. Γνωσιακή αρχιτεκτονική και πορεία ASI

Μέσα στο Genesis plane: **Global Workspace** (MFA-ELM-018) με AFP (MFA-MECH-011) — δίπλευρος νόμος κ_min ≤ κ < 1/λ_max (σύγκλιση ΚΑΙ μη-κενότητα, MFA-ATK-04), Interrupt στο N, κάθε σκέψη ορατή κατά τη γέννηση· **Deliberation** (MFA-ELM-019): MCTS/program search με value γειωμένη σε verifiers· **Belief maintenance** (MFA-ELM-021): ATMS, Both (παρασυνεπής αναβολή με collapse = Court)· **Causal engine** (MFA-ELM-022): SCM/do-calculus, ghost worlds χωρίς commit· **World model & forks** (MFA-ELM-023) πάνω στο World Twin· **Metacognition** (MFA-ELM-024): δηλωμένο CompetenceProfile (3 έδρες) + Self-Prediction Ledger με proper scoring από HELD_OUT scorer· **Void Ledger** (MFA-ELM-028): η άγνοια ως εγγραφή με reason/plan/VOI ανά άξονα· **Volition** (MFA-ELM-029, TEGF): GapField ανά T → Goals με falsifier → grant/envelope → RET· Telos L3 read-only· **Science Organ** (MFA-ELM-030): επτάφασος βρόχος· **Skill Library** (MFA-ELM-025): προγράμματα από raw επεισόδια με lineage· **Emission Barrier** (MFA-ELM-032)· **Reflective Tower** (MFA-ELM-031, EP)· **Environment Model / World Twin** (MFA-ELM-098).

**Η πορεία ASI, τίμια (MFA-ATK-10):** η επαλήθευση, η μνήμη, η συνέχεια, το συλλογικό και η εξέλιξη οργάνων δεν φράσσονται από πάροχο· η **κατανομή προτάσεων** ήταν νοικιασμένη. Το **PDE (MFA-MECH-019)** την κάνει μείγμα {πάροχοι, προγράμματα Skill Library, εξελιγμένα όργανα, υποθέσεις Science, adapters (EP)} με βάρη-δεσμεύσεις που μαθαίνονται με proper scoring από HELD_OUT — falsifier: το μείγμα δεν ξεπερνά τον καλύτερο πάροχο. Κάθε στοιχείο του γνωσιακού πυρήνα ονομάζει το KT που πρέπει να αποτύχει χωρίς αυτό (`ablation_kt`, MFA-VO-024) — αλλιώς RECLASSIFY. Κανένας μηχανισμός **δεν εγγυάται** υπερ-νοημοσύνη· το πακέτο εγγυάται διαψεύσιμο μηχανισμό. Η συνείδηση ως ερευνητικό πρόγραμμα (MFA-RSP-005): operational (workspace, self-model, reportability, integration, volition) με ανταγωνιστικά μοντέλα και falsifiers· καμία ιδιότητα δεν βαφτίζεται «συνείδηση» χωρίς μέτρο διακριτικής ισχύος. Διαγράμματα: MFA-DIA-06, MFA-DIA-09.

## 8. Ψηφιακό δίδυμο

Δύο δίδυμα: **του οργανισμού** (DST, MFA-ELM-085: seeds, stubs, fault injection, campaigns, trace validation sim/real· 24 KT πρώτα σε F2) και **του κόσμου** (World Twin, MFA-ELM-098: αντίδικοι, δικαστήρια, μητρώα, προθεσμίες, αντίπαλοι ως δρώντες με δηλωμένη πιστότητα, οδηγούμενοι από CAM-NS, παραγόμενοι από τον Temporal KG — MFA-ATK-11). Κλίμακα πιστότητας F0–F5 (MFA-MECH-015) με ίδια IDs/contracts/invariants ΚΑΙ **συμπεριφορική** ταυτότητα: ίδια ετυμηγορία στο σφραγισμένο KT σύνολο + ίδιος loss map· KT PASS σε F_k / FAIL σε F_{k+1} = fidelity-gap δέσμευση που διαψεύδει το stub και ακυρώνει τα PASS που στηρίζονταν σε αυτό (MFA-INV-060). Ghost worlds διακλαδώνουν (ledger cut, world state, actors). Seeds και είσοδοι είναι δεσμεύσεις (MFA-INV-061). Το F-επίπεδο είναι διάνυσμα ανά όργανο/δρώντα (OAP). Διάγραμμα: MFA-DIA-08.

## 9. Συλλογικό και Πολιτισμοί

**Epistemic Commons** (MFA-ELM-041…047): τέσσερα επίπεδα — μαρτυρία (G-Set, συγκλίνει), ισχυρισμοί (γράφος με ακμές 2ης τάξης), στάσεις (μόνο από τον κάτοχο), ετυμηγορίες (μόνο με διαδικασία)· typed speech acts, καμία free-text διαδρομή· coordination market + economy (EXP-25). **Epistemic Court** (MFA-ELM-048): proceeding state machine, standard of proof ↔ Tier (MFA-INV-063), ≥ 1 μη-LLM oracle με δηλωμένη γενεαλογία κανόνων (EIM μετρά εξάρτηση από ετυμηγορίες του ίδιου Court, MFA-ATK-16), dissent διατηρείται, appeal. **Civilization Quorum** (MFA-ELM-056, MFA-MECH-018): N = 3f+1 VOTING + h HELD_OUT Πολιτισμοί ως trust domains (δική τους supply chain, κλειδιά, evaluators)· ο HELD_OUT κρατά όλα τα sealed sets, ποτέ δεν ψηφίζει (MFA-INV-050), υπογράφει GCP verdicts· σχήμα ανά προφίλ: DP-1/2 = 1 VOTING + 1 HELD_OUT σε **ξεχωριστή φυσική συσκευή** (MFA-ATK-13) — αλλιώς προαγωγές EIM-UNVERIFIED/canary-only. **EIM** (MFA-MECH-009): ανεξαρτησία = διάνυσμα (supply, data, behaviour, verdict-lineage) με veto ανά διάσταση. **Trust-Domain Import Gate** (MFA-ELM-057): ετυμηγορίες από άλλο domain εισάγονται μόνο με receipt και επανα-standard. Διάγραμμα: MFA-DIA-07.

## 10. LAWMAX (G1)

Ροή (MFA-DIA-13): Client Portal → Matter (conflict check, confidentiality domain) → Facts & Evidence (claims με μαρτυρία, ASSUMED, StrategicSilence, admission_risk) → Research (commitment-aware retrieval) → Reasoning (υπαγωγή D1/D2, DDL, LexDSL, 5 χρόνοι) → Strategy (MCTS, εσωτερική πιθανότητα — ποτέ προς τα έξω, Prediction Doctrine MFA-CAP-072) ↔ Adversary/Judge (δρώντες World Twin + CAM-NS rebuttal) → δύο τύποι ισχυρισμού (επιστημικός «τι ισχύει» / συνηγορικός «τι θα επικαλεστώ», claim_type ανά πρόταση, MFA-ELM-072) → Drafting & Citation Authority (5 σκέλη: ύπαρξη, χωρίο, σε ισχύ στο t_legal_effect, στηρίζει, δεν ανατράπηκε — σκέλη 4–5 Unknown μέχρι επικύρωση· πιστότητα αρχείου/package parts) → Emission Barrier → Principal H1 (ή AutonomyEnvelope για προθεσμίες — Docket προτείνει) → InstitutionalAct με receipts και contest_path. **LSC** (MFA-MECH-016): η νομική εισαγωγή ως μεταγλώττιση με fail-closed πύλη και CompilationError(locus)· differential δεύτερος front-end (EIM PASS)· Judicial Decision Object (MFA-ELM-070): ratio/obiter, ακμές προσβολής, διτεμπορικότητα ανά κόμβο· Live Proceedings Perception (MFA-ELM-071): μηχανικό μόνο, παραγλωσσικό EXP (MFA-INV-062 Tier-0 μόνιμο). Professional Responsibility (MFA-ELM-066): AI Act / GDPR / Κώδικας Δικηγόρων ως Control Records. Practice Unit Templates (MFA-ELM-068): «δεν ξέρω» — MFA-UNK-104.

## 11. Εξέλιξη και διάδοχος

**ORP** (MFA-ELM-038): Propose → CPEG (MFA-MECH-017, δηλωμένο αποφασίσιμο τμήμα· CPEG-UNKNOWN ⇒ shadow) → shadow → **SLM** loss map (MFA-MECH-014: pushout + anchors με ≥ 1/3 αρνητικά· SEMANTIC-LOSS και στα δύο πρόσημα μπλοκάρει, MFA-INV-052) → ND → canary → cutover → rollback window· προκάτοχος ενεργός. **Evolution Engine** (MFA-ELM-073): QD αρχειακή αναζήτηση σε sandbox με held-out evaluators· προαγωγή μόνο ORP+Court+ND· reward hacking → HELD_OUT. **Forges** (MFA-ELM-074…077): γλώσσα → compiler → runtime/substrate → αρχιτεκτονική, με translation validation· LexDSL πρώτη. **GCP** (MFA-ELM-039, MFA-MECH-003): Genome transplant (L3 αυτούσιο) → replay foldl(apply_S, genesis, P.journal) → anchors ± / traces / obligations / lattice → LossMap → shadow → verdict (δημιουργός + HELD_OUT, ποτέ ο S για τον εαυτό του — MFA-INV-049) → adopt/rollback· ο πρόγονος εκτελέσιμος. **PDE** (MFA-MECH-019) εξελίσσει την πρόταση. **Tier-0 Kernel** (MFA-ELM-099) ποτέ υπό ORP (MFA-INV-068). Η πρώτη ORP του έργου: CC-lite → CC. Διάγραμμα: MFA-DIA-11.

## 12. Cockpit

**CGP** (MFA-MECH-008, MFA-ELM-091): Γ = σύνδεση Galois (α: cut → σκηνή, γ: αντικείμενο → 𝒫(CID)· α∘γ∘α = α· κάθε CID προσβάσιμο με zoom· ντετερμινισμός — MFA-INV-059)· χωρική οντολογία: στρώμα → επίπεδο z, δέσμευση/όργανο → όγκος (στερεότητα = ImplMap, χρώμα = κλάση τεκμηρίου), σχέση → σωλήνας (πάχος = receipts), Both/Conflict → ρήγμα, Unknown → ομίχλη (πυκνότητα ∝ VOI), fork/ghost → φύλλο, MetaBound → τείχος/ημιδιαφανές, AutonomyGrant/Envelope → φωτεινό περίβλημα, t_known → τρίτος άξονας (time travel = ολίσθηση cut), matter → κόσμος, Court/Πολιτισμός → περιοχή με σύνορα, body → κινούμενο σημείο με lease-λάμψη. Επτά modes (immersive/workstation/laptop/2d/text/headless/a11y) = R_mode ∘ Γ. **Εντολές = προτάσεις RET, ποτέ commits** (MFA-ATK-12)· undo = RET window. **Explanation Projector** (MFA-ELM-093): semantic zoom με depth και omitted_count (κανένα ανεξήγητο κενό). Η αξία του 3D μετριέται (MFA-VO-056)· αν δεν αποδειχθεί, γίνεται προαιρετικός renderer — ποτέ διαγραφή. Διάγραμμα: MFA-DIA-17.

## 13. Ιστός επαλήθευσης

Μία κλίμακα βαθμών (MFA-INV-063): Tier-0 (απόδειξη ανεξάρτητου kernel: Lean #print axioms, TLA+ refinement/machine closure — MFA-ELM-099 παγωμένος, MFA-INV-068)· Tier-1 (certificate, solver-TV, DRT vs spec)· Tier-2 (N-version με EIM, differential)· ανθρώπινη βεβαίωση = χωριστή κλάση, ποτέ VERIFIED. 68 invariants, καθένα με ≥ 1 VO· 56 υποχρεώσεις (24 = KT-01…24 αυτούσια, 32 νέες)· κάθε στοιχείο verified-by ≥ 1 VO· κάθε VO με method/measures/rejects/allows_next/first_level· KT πρώτα σε DST F2· ≥ 1 μη-LLM oracle· αποτυχία σκοτώνει, χαλάρωση απαγορεύεται. HELD_OUT harness (MFA-ELM-086): sealed sets, TOST, ablation (KT-24 με ablation_kt), **competitor baseline** ALT-6/7 ανά δόση (MFA-VO-014/015)· Conformance Lab (MFA-ELM-078): mutation, διακριτική ισχύς (MFA-INV-055/VO-051). Φράγμα κόστους αξιολόγησης ανά προφίλ (MFA-INV-065). Πακέτο: MFA-VO-049 = `tools/check-package.py` R1–R12. Διάγραμμα: MFA-DIA-16.

## 14. Ασφάλεια και TCB

Κλειδιά (MFA-ELM-003): threshold Owner Root offline/HSM· delegated body keys με lease· rotation/revocation/recovery/pre-rotation (KERI σημασιολογία, Α-4)· KT-18/23. Epochs (MFA-ELM-005): allowlist ανά epoch (hash, υπογραφή ML-DSA/SLH-DSA, KEM ML-KEM, canonical encoding), επαναγκύρωση πριν από απόσυρση (MFA-INV-038/039), διπλές υπογραφές, PQ-safe commitments (MFA-INV-066, KT-09). Supply chain (MFA-ELM-084): ενιαία απογραφή TCB, αναπαραγώγιμα builds, SLSA provenance, εισδοχή artifact (MFA-INV-040). Ροή/εμπιστευτικότητα: ετικέτες από τη γέννηση, confidentiality domains, μη-παρεμβολή (MFA-INV-034, MFA-CAP-077), DisclosureGrants στην έξοδο. Instruction/data separation **στον τύπο** (MFA-INV-036: untrusted δεν φτάνει σε θέση τελεστή· `*read-eval*` nil, MFA-VO-055)· prompt injection via evidence KT-17. TCB: Rust journal + Lean/TLA+ kernel + CL reference (N-version)· κανένας εξαχθείς κώδικας στο TCB (MFA-ATK-05)· μέγεθος TCB = MFA-UNK-005 (μετριέται).

## 15. Προφίλ ανάπτυξης (MFA-DEP-1…5) — μία αρχιτεκτονική, πέντε φάκελοι

Η αρχιτεκτονική παραμένει μία· αλλάζει το ενεργό fidelity και ο φάκελος πόρων (OAP, MFA-MECH-013: set cover με veto κλάσης απόδειξης — υποχωρεί το **εύρος**, ποτέ η κλάση απόδειξης). Οι αριθμοί είναι **προτάσεις σχεδιασμού** (MFA-DEC-007), μετρούμενοι από MFA-VO-050/039· όπου γράφεται Unknown(NOT_OBSERVED) δεν υπάρχει τίμιο νούμερο. Διάγραμμα: MFA-DIA-14.

### MFA-DEP-1 — High-end laptop

| Πεδίο | Τιμή |
|---|---|
| CPU | 8–16 cores (x86-64 ή Apple silicon) |
| RAM | 64 GB |
| VRAM | 0–16 GB (προαιρετικό· χωρίς GPU: όλα τα μοντέλα μέσω παρόχου υπό DisclosureGrant) |
| Storage | 2 TB NVMe· ledger + CAS τοπικά, 1 αντίγραφο σε εξωτερικό/NAS |
| Bandwidth | ≥ 100 Mbps (κλήσεις παρόχου, TSA, witness cosignatures) |
| Latency | receipt < 1 s· lean απάντηση < 10 s (D2 πάροχος)· verifier παραπομπών σκέλη 1–3 < 5 s |
| Concurrency | 1 Principal· 1–2 ενεργά matters· ≤ 4 bodies· 1 VOTING Πολιτισμός |
| Fidelity | F0–F2 (DST μόνο για KT)· World Twin deferred· World Twin δρώντες: μόνο CAM-NS |
| Degraded | shadow runs deferred· ghost worlds deferred· CAM-NS πληθυσμός ≤ 8· N-version audit sampling 5 %· Court panel = 1 μη-LLM oracle + 1 πάροχος· ΚΑΜΙΑ προαγωγή cutover χωρίς remote HELD_OUT (EIM-UNVERIFIED → canary-only)· envelopes με presimulation: NONE (δηλωμένο) |
| Offloading | inference → πάροχος (Disclose)· HELD_OUT scorer + sealed sets → δεύτερη φυσική συσκευή (phone-class/VPS)· deferred simulations → DEP-3 όταν διαθέσιμο |
| Energy | ≤ 50 Wh/matter (πρόταση, MFA-DEC-007) |
| held_out_site | ΥΠΟΧΡΕΩΤΙΚΑ ξεχωριστή φυσική συσκευή υπό κλειδιά δημιουργού (MFA-DEC-014) |
| eval_cost_ratio | ≤ 3 (MFA-INV-065) |
| fault_model | crash-fault, 1 κόμβος· RPO = τελευταίο αντίγραφο· witnesses: 1 remote |

### MFA-DEP-2 — Sovereign workstation

| Πεδίο | Τιμή |
|---|---|
| CPU | 32–64 cores |
| RAM | 256–512 GB |
| VRAM | 2×48 GB ή 1×80 GB (τοπικά μοντέλα 70B-class σε 4-bit· DisclosureGrant recipient=self) |
| Storage | 8–16 TB NVMe + 3 αντίγραφα σε NAS (erasure coding) |
| Bandwidth | ≥ 1 Gbps |
| Latency | τοπική εξαγωγή 2–20 s· immersive cockpit 60 fps σε LOD· Court fast-track ≤ 15′ |
| Concurrency | ≤ 5 Principals· ≤ 10 matters· ≤ 16 bodies· 1 VOTING + 1 HELD_OUT remote |
| Fidelity | F0–F3· World Twin μερικό (CAM-NS + Judge Simulator) |
| Degraded | multi-site witnesses απόντες → RPO 0 μόνο τοπικά· CAM-NS ≤ 32· Court panel 3· N-version audit sampling 20 % |
| Offloading | κανένα υποχρεωτικό· προαιρετικό cluster για evolution campaigns |
| Energy | ≤ 200 Wh/matter |
| held_out_site | ξεχωριστή συσκευή (VPS ή δεύτερο μηχάνημα) |
| eval_cost_ratio | ≤ 5 |
| fault_model | crash-fault, 1 κόμβος + NAS· HSM root· witnesses ≥ 2 remote |

### MFA-DEP-3 — Local server

| Πεδίο | Τιμή |
|---|---|
| CPU | 2–4 κόμβοι × 64 cores |
| RAM | 1–2 TB συνολικά |
| VRAM | 4–8 GPUs × 80 GB |
| Storage | 50–100 TB, 3 αντίγραφα εντός site |
| Bandwidth | 10–25 Gbps εσωτερικά· ≥ 1 Gbps προς έξω |
| Latency | Court proceeding πλήρες < 5′· shadow runs ×2 πλήρη· GCP replay deferred σε ώρες |
| Concurrency | ≤ 20 Principals· ≤ 100 matters· ≤ 64 bodies· 4 VOTING Πολιτισμοί σε ≥ 2 hosts + 1 HELD_OUT remote |
| Fidelity | F0–F4· World Twin με δρώντες από docket/αποφάσεις |
| Degraded | DR cross-site όχι RPO 0 (witnesses remote καλύπτουν)· CAM-NS ≤ 256· N-version πλήρης |
| Offloading | HELD_OUT remote· προαιρετικά DEP-4 για πλήρες GCP |
| Energy | ≤ 1 kWh/matter |
| held_out_site | remote site (ξεχωριστό κτίριο/πάροχος υπό κλειδιά δημιουργού) |
| eval_cost_ratio | ≤ 5 |
| fault_model | crash-fault, f=1 κόμβος· BFT μόνο verdict ordering μεταξύ των 4 VOTING |

### MFA-DEP-4 — Distributed cluster

| Πεδίο | Τιμή |
|---|---|
| CPU | 5 sites × ομάδα κόμβων DEP-3 |
| RAM | ≥ 5 TB συνολικά |
| VRAM | ≥ 32 GPUs |
| Storage | ≥ 500 TB, erasure coding cross-site |
| Bandwidth | ≥ 10 Gbps μεταξύ sites |
| Latency | inter-site < 50 ms (BFT ordering Verdicts)· RPO 0 cross-site (KT-22) |
| Concurrency | ≥ 100 Principals· ≥ 1000 matters· ≥ 512 bodies· 5 Πολιτισμοί = 5 sites |
| Fidelity | F0–F5 (πλήρες) |
| Degraded | κανένα εκ σχεδιασμού· απώλεια 1 site: f=1 ανοχή· απώλεια HELD_OUT site: προαγωγές παγώνουν (fail-closed) |
| Offloading | κανένα |
| Energy | ≤ 5 kWh/matter |
| held_out_site | 5ο site |
| eval_cost_ratio | ≤ 10 |
| fault_model | crash-fault ledger με witnesses ≥ 2 sites· BFT n=4, f=1 για Verdicts· sybil resistance μέσω κλειδιών Πολιτισμών |

### MFA-DEP-5 — Future hardware

| Πεδίο | Τιμή |
|---|---|
| CPU | όπως DEP-2/3 για τον κλασικό πυρήνα |
| RAM | όπως DEP-2/3 |
| VRAM | Unknown(NOT_OBSERVED): νευρομορφικά/φωτονικά όργανα δεν έχουν VRAM· η ισοδυναμία τους είναι RSP-015 |
| Storage | όπως DEP-2/3 |
| Bandwidth | όπως DEP-2/3 + σύνδεση οργάνου Q1 (τύπος TED) |
| Latency | Unknown(NOT_OBSERVED) — μετριέται ανά όργανο στο EP-03 drill |
| Concurrency | όπως το φιλοξενούν προφίλ |
| Fidelity | ίδια IDs/contracts/invariants· το όργανο Q1 δεκτό μόνο με πιστοποιημένο περιθώριο (MFA-RSP-015) |
| Degraded | το όργανο Q1 = Unknown μέχρι πιστοποίηση· κανένα άλλο όργανο δεν εξαρτάται από αυτό |
| Offloading | το όργανο Q1 ως χρησμωδικό (oracle) πίσω από TED |
| Energy | Unknown(NOT_OBSERVED)· ο λόγος του προφίλ: ενεργειακή απόδοση — μετριέται |
| held_out_site | όπως το φιλοξενούν προφίλ |
| eval_cost_ratio | όπως το φιλοξενούν προφίλ |
| fault_model | όπως το φιλοξενούν προφίλ + όργανο Q1 ως untrusted |

Τεχνικές μη-υποβάθμισης (εντολή §22): semantic-equivalent reduced-fidelity profile (lean, MFA-ELM-097)· remote/cluster acceleration (offloading)· deferred simulations (World Twin, shadow runs)· selective organ activation (OAP)· level of detail (CGP LOD)· lazy materialization (indexes παράγωγα, rebuild από ledger)· workload scheduling (OAP + budgets ανά κύκλο TEGF).

## 16. Σειρά γένεσης (bootstrap) — πώς σπάνε οι 16 αμοιβαίες εξαρτήσεις

Οι κύκλοι που αναφέρει το `tools/check-package.py` (R8a) είναι **αμοιβαίες εξαρτήσεις χρόνου εκτέλεσης**, όχι σφάλματα: σπάνε με κατάσταση GENESIS του ενός άκρου (δεσμεύσεις σημασμένες Absent(reason) στον σχετικό άξονα) και **αναδρομική βεβαίωση** μόλις υπάρξει το άλλο άκρο (MFA-ATK-15).

| # | Κύκλος | Ζεύγος | Κανόνας γένεσης |
|---|---|---|---|
| 1 | MFA-ELM-003 ↔ MFA-ELM-004 | Identity ↔ Time | κλειδιά γένεσης σε offline ceremony χωρίς ledger → χρόνος γένεσης NOT_OBSERVED (άξονας freshness) → ledger γένεσης κενό, υπογεγραμμένο από τα κλειδιά γένεσης → πρώτη TSA βεβαίωση → αναδρομική βεβαίωση των πρώτων εγγραφών με receipt |
| 2 | MFA-ELM-086 ↔ MFA-ELM-056 | Harness ↔ Quorum | το harness ξεκινά με h=0 και κάθε αποτέλεσμα σημασμένο EIM-UNVERIFIED· μόλις υπάρξει HELD_OUT (δεύτερη συσκευή, MFA-DEC-014) τα sealed sets σφραγίζονται και οι προαγωγές ξεκλειδώνουν |
| 3 | MFA-ELM-056 ↔ MFA-ELM-050 | Quorum ↔ CAM-NS | τα sealed sets του HELD_OUT δημιουργούνται από seeds του δημιουργού ΠΡΙΝ τρέξει ο CAM-NS· ο CAM-NS ξεκινά ως ένας πληθυσμός μέσα στον VOTING |
| 4 | 006 → 086 → 056 → 050 → 073 → 011 → 009 → 013 → 006 | Registry ↔ Harness ↔ Evolution ↔ Host ↔ Gateway ↔ OAP | το registry γένεσης περιέχει χειρόγραφη εισδοχή των οργάνων του υποστρώματος (status GENESIS-ADMITTED, χωρίς harness)· επανεισδοχή στη Δόση 1 όταν το harness υπάρχει |
| 5 | 006 → … → 038 → 006 | Registry ↔ ORP | η πρώτη ORP (CC-lite → CC) επανεισάγει το ίδιο το registry — δοκιμή του μηχανισμού πάνω στον εαυτό του |
| 6 | … → 038 → 008 → 006 | ORP ↔ Gate ↔ Registry | η πύλη γένεσης έχει μόνο Tier-0 κατηγορήματα ελεγμένα από τον kernel (MFA-ELM-099)· governors εγγράφονται στη Δόση 1 με το default ORDER |
| 7 | 086 → 056 → 050 → 073 → 038 → 048 → 042 → 020 → 086 | Harness ↔ Court ↔ Claims ↔ Suite | Suite γένεσης = μόνο kernel (099)· Court γένεσης = ένας μη-LLM oracle· γράφος ισχυρισμών κενός· ο πρώτος verifier Tier-1 εγγράφεται αφού περάσει το σφραγισμένο corpus |
| 8 | 056 → 050 → 073 → 038 → 048 → 056 | Quorum ↔ Court | η διάταξη ετυμηγοριών ξεκινά single-writer με witnesses (MFA-DEC-011) πριν υπάρξει BFT quorum |
| 9 | 050 → 073 → 038 → 048 → 050 | CAM-NS ↔ Court | ο CAM-NS προσβάλλει το Court μόνο αφού υπάρχει ≥ 1 ετυμηγορία· η πρώτη καμπάνια είναι seeded από τον δημιουργό |
| 10 | 086 → 056 → 050 → 073 → 086 | Harness ↔ Evolution | το evolution sandbox απενεργοποιημένο μέχρι το harness να έχει sealed sets |
| 11 | MFA-ELM-056 ↔ MFA-ELM-057 | Quorum ↔ Import gate | ένα trust domain στη γένεση· η import gate είναι ταυτοτική συνάρτηση μέχρι το δεύτερο domain |
| 12 | MFA-ELM-024 ↔ MFA-ELM-037 | SPL ↔ Continuity verifier | SPL γένεσης = CompetenceProfile Unknown· το πρώτο ContinuityCertificate εκδίδεται από τον δημιουργό (H1) μία φορά, κατόπιν από τον verifier |
| 13 | MFA-ELM-018 ↔ MFA-ELM-028 | Workspace ↔ Void | Void γένεσης κενό· ο workspace τρέχει με κ = κ_min (προεπιλογή) και κενό Void· το πρώτο Void entry γράφεται από την πρώτη Absent(reason) |
| 14 | MFA-ELM-027 ↔ MFA-ELM-082 | Perception ↔ Ingestion | η ingestion δέχεται πρώτα πηγές με βεβαίωση δημιουργού (S0 μόνο)· scouts απενεργοποιημένοι μέχρι το Void να έχει εγγραφές |
| 15 | MFA-ELM-088 ↔ MFA-ELM-090 | Design platform ↔ Patch engine | F0: το git είναι ο engine (αυτή η συνεδρία)· η πλατφόρμα είναι το πακέτο· ledger-native από τη Δόση 3 |
| 16 | MFA-ELM-039 ↔ MFA-ELM-077 | GCP ↔ Architecture forge | κανένας διάδοχος πριν από το forge (Δόση 3)· οι προτάσεις του forge περνούν GCP μόνο αφού πετύχει η πρώτη ORP |

## 17. Υποβαθμισμένες λειτουργίες και ανάκαμψη

| Συνθήκη | Υποβαθμισμένη λειτουργία (τι υποχωρεί) | Τι ΔΕΝ υποχωρεί | Ανάκαμψη |
|---|---|---|---|
| Πάροχος εκτός | TED δρομολογεί σε άλλον generator (PDE)· απαντήσεις UNKNOWN(reason: PROVIDER_DOWN) | receipts, ledger, verifier | επανάληψη με receipt· SPL καταγράφει |
| HELD_OUT εκτός | προαγωγές παγώνουν (fail-closed) | καμία ετυμηγορία από VOTING δεν χάνεται | rotation HELD_OUT (MFA-MECH-018) |
| Πύλη N-version διαφωνία | deny + Court φραγμένου χρόνου | fail-closed | Court verdict ή δημιουργός |
| TSA εκτός | k-of-n fallback· t_recorded Absent(NOT_OBSERVED) | HLC φράγματα, σειρά committed | αναδρομική αγκύρωση (KT-21) |
| Site loss (DEP-3/4) | RPO 0 μέσω witnesses ≥ 2 sites | ledger, ταυτότητα | restore + ContinuityCertificate (KT-22) |
| Owner Root compromise | out-of-band revocation ≥ 2 κανάλια | προ-συμβιβασμού υπογραφές με TSA | νέο root με witnesses (KT-23) |
| Budget εξαντλείται | OAP υποχωρεί εύρος (sampling, μικρότεροι πληθυσμοί) | κλάση απόδειξης, Tier-0 | επόμενος κύκλος |
| CPEG-UNKNOWN | shadow υποχρεωτικό + PARTITION από δημιουργό | fail-closed Tier-0/1 | απόφαση |
| Envelope λήγει μέσα σε πράξη | abort πριν το commit· μετά: πράξη μένει, Court | MFA-INV-044 | Court/Principal |
| World Twin deferred (DP-1) | presimulation: NONE δηλωμένο | envelope απαιτεί counter_signer | DP-3 ή αργότερα |
| Kernel bug (Tier-0) | N-version Lean + TLA+ + CL· διαφωνία ⇒ deny | παγωμένο corpus | L3 πράξη δημιουργού + GCP replay |

## 18. Παρατηρησιμότητα

OTel traces/metrics/logs με `event_cid` correlation· **μη αυθεντική** (audit = ledger)· οι αποφάσεις δειγματοληψίας είναι δεσμεύσεις Observation (ώστε το ablation να ξέρει τι δεν είδε — MFA-ATK-06)· κάθε span συσχετίζεται με δέσμευση· κάθε κύκλος workspace αφήνει cycle trace· κάθε receipt φέρει exec_type/repro_level/generator/presimulation· το cockpit είναι η προβολή, όχι η έδρα.

## 19. Φάκελος πόρων (σύνοψη από `resource_model` ανά στοιχείο)

| Στοιχείο | resource_model |
|---|---|
| MFA-ELM-001 Commitment Store | append O(log n)· CAS S3-class· δείκτες PostgreSQL παράγωγοι |
| MFA-ELM-002 Content-Addressed Store | S3-compatible |
| MFA-ELM-003 Identity & Key Authority | Rust + PKCS#11 |
| MFA-ELM-004 Temporal Service | Rust |
| MFA-ELM-005 Crypto Epoch & Allowlist | αμελητέο |
| MFA-ELM-006 Capability Registry & Organ Admission | Rust |
| MFA-ELM-007 Policy Decision Point (Control Plane) | Rust + Cedar |
| MFA-ELM-008 Constitution Gate (LPA) | Rust + CL reference (DP-1: δειγματοληπτικά· DP-3+: πλήρες) |
| MFA-ELM-009 Capability Gateway | Rust/Wasmtime host fns |
| MFA-ELM-010 Effect Transaction Engine (RET) | shadow ×2 |
| MFA-ELM-011 Organ Host (microVM) | Wasmtime, Firecracker |
| MFA-ELM-012 Supervisor Runtime | Elixir/OTP |
| MFA-ELM-013 Space, Resource & Activation Manager (OAP) | ILP ms · ILP με περιορισμούς eval-ratio και energy ανά MFA-DEP-n |
| MFA-ELM-014 Event Fabric | NATS JetStream |
| MFA-ELM-015 MetaBounds Registry | αμελητέο |
| MFA-ELM-016 Safe-Halt Authority | αμελητέο |
| MFA-ELM-017 Inference Gateway (TED) | Rust + adapters (HTTP, llama.cpp, vLLM-class) |
| MFA-ELM-018 Global Workspace (AFP) | sparse O(edges) |
| MFA-ELM-019 Deliberation Engine | C++23 core, Python value |
| MFA-ELM-020 Verification Suite | Rust/Lisp/Python, Z3, Lean |
| MFA-ELM-021 Belief Maintenance (ATMS / Both) | CL |
| MFA-ELM-022 Causal & Counterfactual Engine | Python + CL |
| MFA-ELM-023 World Model & Forks (Ghost Worlds) | Rust CoW |
| MFA-ELM-024 Metacognition & Self-Prediction (SPL) | φθηνό scoring |
| MFA-ELM-025 Skill & Procedure Library | Wasm/Lisp/Python |
| MFA-ELM-026 Action Executor | Elixir |
| MFA-ELM-027 Perception & Scouts | CL + Tesseract + Python |
| MFA-ELM-028 Void Ledger | O(voids) |
| MFA-ELM-029 Volition Engine (TEGF) | budget ανά κύκλο |
| MFA-ELM-030 Science Organ | πείραμα-εξαρτώμενο |
| MFA-ELM-031 Reflective Tower [EP] | EXP |
| MFA-ELM-032 Emission Barrier | O(έξοδος) |
| MFA-ELM-033 Entity Core | Rust + CL |
| MFA-ELM-034 Embodiment Manager | Elixir |
| MFA-ELM-035 Memory System (+ prospective) | Rust + CL |
| MFA-ELM-036 Consolidation Engine | CL + Python |
| MFA-ELM-037 Continuity Verifier (external issuer) | Rust + Python |
| MFA-ELM-038 Organ Replacement Orchestrator (+CPEG +SLM) | Elixir |
| MFA-ELM-039 Successor Compiler (GCP) | replay O(journal) deferred |
| MFA-ELM-040 Preference Recorder (Α-20) | αμελητέο |
| MFA-ELM-041 Evidence Commons | Rust |
| MFA-ELM-042 Claim & Argument Graph (+2nd-order edges) | CL + Rust |
| MFA-ELM-043 Speech-Act Router | Elixir |
| MFA-ELM-044 Verdict Registry | Rust |
| MFA-ELM-045 Stance Store | Rust |
| MFA-ELM-046 Shared World State | Rust + RDF |
| MFA-ELM-047 Coordination Market & Resource Economy | Elixir + Rust |
| MFA-ELM-048 Epistemic Court (proceeding state machine) | Elixir + Rust |
| MFA-ELM-049 Adversarial Entity | ως AEO |
| MFA-ELM-050 Red-Team Arsenal (CAM-NS) | budget ανά αντιγόνο |
| MFA-ELM-051 Executable Constitution | S-expr + Lean + Cedar |
| MFA-ELM-052 Lifecycle Authority | Rust |
| MFA-ELM-053 Organization Genesis | Elixir + DSL |
| MFA-ELM-054 Institutions Runtime | Elixir |
| MFA-ELM-055 Knowledge Transmission | CL/Python |
| MFA-ELM-056 Civilization Quorum | DP-1/2: 1 VOTING + 1 HELD_OUT remote (scorer-only)· DP-3: 4 VOTING σε ≥2 hosts + 1 HELD_OUT remote· DP-4: 5 sites· «5 microVMs στο laptop» απορρίφθηκε ως μυθοπλασία ανεξαρτησίας (MFA-ATK-13) |
| MFA-ELM-057 Trust-Domain Import Gate | αμελητέο |
| MFA-ELM-058 Matter Management | Elixir + TS |
| MFA-ELM-059 Legal Corpus Compiler (LSC) & Temporal Semantics | CL (as-built) + Rust |
| MFA-ELM-060 Fact & Evidence Modeling | CL + Rust |
| MFA-ELM-061 Legal Reasoning Engine | CL + Z3 + LexDSL |
| MFA-ELM-062 Legal Research | Rust/Python + corpus-search |
| MFA-ELM-063 Strategy Engine | C++ + CL |
| MFA-ELM-064 Adversary Counsel & Judge Simulator | Python + CL |
| MFA-ELM-065 Drafting & Citation Authority (5 σκέλη) | CL + TS editor |
| MFA-ELM-066 Professional Responsibility & Compliance | CL + Cedar |
| MFA-ELM-067 Docket & Deadline Engine | Rust/CL + Z3 |
| MFA-ELM-068 Practice Unit Templates | DSL |
| MFA-ELM-069 Client Portal | TS |
| MFA-ELM-070 Judicial Decision Object | LinkML |
| MFA-ELM-071 Live Proceedings Perception | GPU ASR |
| MFA-ELM-072 Advocacy Claim Engine | CL |
| MFA-ELM-073 Evolution Engine | Python/JAX + Rust sandbox |
| MFA-ELM-074 Language Forge | CL, Tree-sitter, ANTLR |
| MFA-ELM-075 Compiler Forge | C++ MLIR/LLVM |
| MFA-ELM-076 Runtime & Substrate Forge | Rust/C++ |
| MFA-ELM-077 Architecture Forge | Python + CC |
| MFA-ELM-078 Conformance & Differential Lab | Rust/Python |
| MFA-ELM-079 Evidence & Provenance Store | Rust + RDF |
| MFA-ELM-080 Temporal Knowledge Graph | Oxigraph-class + PostgreSQL |
| MFA-ELM-081 Retrieval Layer | PostgreSQL pgvector/FTS |
| MFA-ELM-082 Ingestion & Attestation Pipeline | CL (fetch/FEK) + Rust |
| MFA-ELM-083 Ontology Registry | RDF tooling |
| MFA-ELM-084 Build, Release & TCB Inventory | Nix/OCI/sigstore-class |
| MFA-ELM-085 Deterministic World Simulator (FCP) | Rust DST single-thread |
| MFA-ELM-086 Evaluation Harness (held-out, EIM) | Python |
| MFA-ELM-087 Observability Spine | OpenTelemetry |
| MFA-ELM-088 Canonical Design Platform (το πακέτο ως όργανο) | Python tools |
| MFA-ELM-089 Kill-Test Registry & Drills | — |
| MFA-ELM-090 Patch Engine | Python |
| MFA-ELM-091 Creator Cockpit (CGP) | TS/2D από F0· Bevy/Godot 3D από Δόση 2 |
| MFA-ELM-092 Human Continuity Port [E] | — |
| MFA-ELM-093 Explanation Projector | O(trace) |
| MFA-ELM-094 Genesis Plane | DP-1: 1 microVM· DP-3+: ομάδα microVMs με κοινή ετικέτα plane |
| MFA-ELM-095 Effect Plane | — |
| MFA-ELM-096 Robust Substrate (composite) | laptop |
| MFA-ELM-097 Lean Profile (composite = ο Copilot μέσα στο GRAIL) | laptop DP-1 |
| MFA-ELM-098 Environment Model (World Twin) | DP-3+ πλήρες· DP-1/2 μόνο CAM-NS δρών (deferred simulations) |
| MFA-ELM-099 Tier-0 Kernel (frozen) | Lean + TLA+ toolchain (CPU-only)· CL reference |

## 20. Ανοιχτά ερευνητικά ερωτήματα

| RSP | Πρόγραμμα | Μηχανισμοί | Πρώτη δόση | Απορρίπτει |
|---|---|---|---|---|
| MFA-RSP-001 | Commitment Calculus — από άλγεβρα σε υπόστρωμα | MFA-MECH-001, MFA-MECH-014, MFA-MECH-017 | 0 | σχήμα που δεν κλείνει και δεν διορθώνεται → CC-lite + 5 έδρες με crosswalk συνεχίζουν (η έξοδος DEC-X-06) |
| MFA-RSP-002 | Unknown ως πολίτης — Void Ledger & VOI | MFA-MECH-002, MFA-MECH-011 | 1 | VOI ≤ FIFO σε δύο σύνολα → VOI παύει να οδηγεί |
| MFA-RSP-003 | Γενεαλογική μεταγλώττιση — ο διάδοχος | MFA-MECH-003, MFA-MECH-014, MFA-MECH-009 | 3 | χαμένη seeded απώλεια → τέταρτη ιδιότητα ή απαγόρευση αλλαγής metamodel |
| MFA-RSP-004 | Βούληση δεμένη στο Telos | MFA-MECH-004, MFA-MECH-005, MFA-MECH-011 | 2 | καμία διαφορά από FIFO → η EFE-ταξινόμηση δεν προσθέτει· η εισδοχή/state machine επιβιώνουν |
| MFA-RSP-005 | Αρχιτεκτονική συνείδησης ως ανταγωνιστικά μοντέλα (εντολή §11) | MFA-MECH-010, MFA-MECH-011 | 2 | self-model που δεν υπερέχει ιστορικού μέσου → COG-08 ξανασχεδιάζεται· ανιχνευτής χωρίς διακριτική ισχύ (CLAIMS F92) → απορρίπτεται |
| MFA-RSP-006 | Ηθική θέση οντοτήτων — κριτήρια παρατήρησης | MFA-MECH-010 | 3 | τίποτα δεν απορρίπτει την Α-20· τα κριτήρια είναι παρατήρηση |
| MFA-RSP-007 | Πολιτισμοί και μετρούμενη ανεξαρτησία | MFA-MECH-018, MFA-MECH-009, MFA-MECH-012 | 2 | d_supply/d_data δεν προβλέπουν d_behaviour → πύλη μόνο συμπεριφορική· 5 εγκαταστάσεις με κοινή καταγωγή → ανεξαρτησία ΜΕΡΙΚΗ δηλωμένη |
| MFA-RSP-008 | Αναστρέψιμες επιδράσεις και αυτονομία | MFA-MECH-006, MFA-MECH-005 | 1 | NONE που πέρασε ως αναστρέψιμο → τύπος inverse διορθώνεται |
| MFA-RSP-009 | Νομική είσοδος ως μεταγλώττιση | MFA-MECH-016, MFA-MECH-015 | 2 | differential < 50% σε αποφάσεις → Decision IR μένει EXP, αποφάσεις citation-only |
| MFA-RSP-010 | Cockpit ως καθαρή προβολή | MFA-MECH-008 | 0 | καμία διαφορά χρόνου 3D vs text → 3D προαιρετικό, Γ μένει |
| MFA-RSP-011 | Lean collapse — OAP έναντι Copilot | MFA-MECH-013 | 0 | lean > 2× Copilot κόστος με ίδια κλάση → robust substrate ξανασχεδιάζεται· Copilot δεν χάνει σε συσσώρευση → η θέση του GRAIL είναι λάθος |
| MFA-RSP-012 | Επιστήμη ως όργανο | — | 3 | ESTABLISHED χωρίς αναπαραγωγή → τύπος απορρίπτει |
| MFA-RSP-013 | Reflective tower μέσα στο microVM [EP] | — | 4 | L3 εγγραφή από εσωτερικό principal → η αρχιτεκτονική πύργου περιορίζεται σε L≤2 |
| MFA-RSP-014 | Τοπολογία χώρου επιχειρημάτων (ULTIMA-LEX υπόλειμμα) | — | 3 | καμία διαφορά από null |
| MFA-RSP-015 | Νευρομορφικά/φωτονικά ως χρησμωδικά όργανα | MFA-MECH-015 | 5 | περιθώριο μη πιστοποιήσιμο → όργανο μένει EP |
| MFA-RSP-016 | Proposal Distribution Evolution — η πρόταση πέρα από τον πάροχο | MFA-MECH-019, MFA-MECH-010 | 4 | μείγμα ≯ καλύτερος πάροχος με διακριτικό περιθώριο σε καμία οικογένεια → PDE διακοσμητικό → RECLASSIFY |

Άγνωστα με σχέδιο παρατήρησης: 34 (UNKNOWNS.yaml)· συγκρούσεις με διατήρηση και των δύο πλευρών: 35 (CONFLICTS.yaml)· αποφάσεις προς τον δημιουργό: 15 (DECISION-LOG.md).

## 21. Κατάλογος στοιχείων ανά στρώμα — τα 25 σημεία ανά στοιχείο

### S0 — Substrate — robust, ίδιο σε κάθε υποψήφιο Telos

#### MFA-ELM-001 · Commitment Store · plane both · delta GENERALIZE · maturity R · v4 · δόση 0

- **Σκοπός / δήλωση:** Μία έδρα αλήθειας· το ledger του corpus γενικεύεται σε άλγεβρα δεσμεύσεων. — Το CC store (MFA-MECH-001) ως ΜΟΝΟΤΟΝΟ append-only σύνολο δεσμεύσεων (tombstones για REVOKE/FORGET, residue για shredded) πάνω σε persistent διτεμπορικό υπεργράφημα ως ΠΑΡΑΓΩΓΟ fold (MFA-ALT-5: η αναστρεψιμότητα/DPO είναι η σημασιολογία των κανόνων, όχι της αποθήκης — MFA-ATK-08): journals ανά συγγραφέα, Merkle inclusion/consistency (RFC 6962/9162, C2SP), witness cosignatures, HLC, fold ντετερμινιστικό. · Δόση 0 = CC-lite (4 κανόνες: ASSERT/OBSERVE/DERIVE/REVOKE) πάνω σε append-only Merkle log· οι 8 κανόνες μετά το MFA-VO-025 (Δόση 0.5 παράλληλα)· η μετάβαση CC-lite → CC είναι η πρώτη ORP του έργου (δοκιμή του μηχανισμού αντικατάστασης πάνω στον εαυτό του) (MFA-ATK-15).
- **Ικανότητες:** MFA-CAP-003, MFA-CAP-007, MFA-CAP-008, MFA-CAP-051
- **Διεπαφές:** MFA-CON-001, MFA-CON-033
- **Εξουσία:** append μόνο με έγκυρη αλυσίδα tokens· Schemas L3 μόνο δημιουργός
- **Κατάσταση:** journals + heads + epoch + nogoods (δοσιέ 001 §7)· κάθε Commitment φέρει status_axes = record 10 αξόνων (MATERIAL §2 #5): source_integrity, evidentiary_support, formal_validity, temporal_applicability, interpretive_status, causal_support, strategic_value, execution_status, freshness, authorization — καθένας ∈ {value, Absent(reason ∈ {NOT_APPLICABLE, UNKNOWN, NOT_OBSERVED, NOT_YET_DERIVED, CONTESTED, WITHHELD_BY_AUTHORITY})} (τυποποιημένη απουσία ανά πεδίο, MATERIAL §2 #9· ποτέ κενό) (MFA-ATK-07)
- **Εξαρτήσεις:** MFA-ELM-002, MFA-ELM-003, MFA-ELM-004, MFA-ELM-005
- **Αποτυχίες:** διαφθορά→Merkle+replicas· equivocation→witness gossip, πάγωμα, Court· δείκτες→rebuild
- **Εναλλακτικές:** Tessera/Go ledger (DEC-X-14: εκτός Rust TCB)
- **Επαλήθευση:** MFA-VO-025, MFA-VO-026, MFA-VO-027, MFA-VO-013, MFA-VO-021 · **Falsifier:** κατάσταση που δεν είναι fold του prefix (VO-027)
- **Πόροι:** append O(log n)· CAS S3-class· δείκτες PostgreSQL παράγωγοι · **Εξέλιξη:** R-C· CC-lite → CC μέσω ORP (η πρώτη ORP)· διάδοχος μέσω GCP· κανόνας νέος με CPEG
- **Άγνωστα / συγκρούσεις:** MFA-UNK-101 / — · **Προέλευση:** CMP-KRN-01, ADR-0002/0015, MFA-MECH-001 · **Παραδοχές:** Ένας συγγραφέας ανά journal· crash-fault kernel (DEC-X-11)
- **status_axes:** source_integrity, evidentiary_support, formal_validity, temporal_applicability, interpretive_status, causal_support, strategic_value, execution_status, freshness, authorization
- **absence_reasons:** NOT_APPLICABLE, UNKNOWN, NOT_OBSERVED, NOT_YET_DERIVED, CONTESTED, WITHHELD_BY_AUTHORITY
- **cc_lite:** ASSERT, OBSERVE, DERIVE, REVOKE

#### MFA-ELM-002 · Content-Addressed Store · plane both · delta RETAIN · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Φορτίο δεσμεύσεων, artifacts, sealed sets. — Αμετάβλητα blobs με CIDv1 (raw, json-jcs), pinning, replication ≥3/≥2 sites, crypto-shredding envelopes (salted/keyed, όχι Pedersen).
- **Ικανότητες:** MFA-CAP-007, MFA-CAP-057, MFA-CAP-037
- **Διεπαφές:** MFA-CON-002
- **Εξουσία:** Put με token· Shred με Control Record
- **Κατάσταση:** objects + pins + envelopes
- **Εξαρτήσεις:** MFA-ELM-005
- **Αποτυχίες:** απώλεια→erasure coding· σπάσιμο digest→epoch re-anchor
- **Εναλλακτικές:** Pedersen (απορρίπτεται)
- **Επαλήθευση:** MFA-VO-016, MFA-VO-009 · **Falsifier:** ανακτήσιμο μετά από shredding
- **Πόροι:** S3-compatible · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KRN-02, ADR-0016, DEC-X-13 · **Παραδοχές:** JCS κανονικοποίηση

#### MFA-ELM-003 · Identity & Key Authority · plane both · delta STRENGTHEN · maturity T · v2 · δόση 0

- **Σκοπός / δήλωση:** Η εξουσία και η ταυτότητα ως κλειδιά. — Charters, threshold root offline/HSM, delegated body keys με lease, pre-rotation, verifier-ordered revocation με fencing epoch, post-revocation quarantine+taint (DEC-X-10), recovery KT-23.
- **Ικανότητες:** MFA-CAP-079, MFA-CAP-004, MFA-CAP-005
- **Διεπαφές:** MFA-CON-003
- **Εξουσία:** root: k-of-n δημιουργός
- **Κατάσταση:** KEL ανά ταυτότητα· leases
- **Εξαρτήσεις:** MFA-ELM-004, MFA-ELM-005
- **Αποτυχίες:** compromise σώματος→revoke+quarantine· root→time-locked recovery
- **Εναλλακτικές:** FROST (όχι PQ — αφαιρείται, DEC-X-12)
- **Επαλήθευση:** MFA-VO-018, MFA-VO-023, MFA-VO-009 · **Falsifier:** post-revocation υπογραφή trusted
- **Πόροι:** Rust + PKCS#11 · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KRN-03, ADR-0003/0021, DEC-X-10/12 · **Παραδοχές:** HSM/TEE διαθέσιμο σε DP-2+· software keys σε DP-1 δηλωμένο
- **genesis:** κλειδιά γένεσης σε offline ceremony ΧΩΡΙΣ ledger· το ledger γένεσης (κενό) υπογράφεται από αυτά· η πρώτη βεβαίωση χρόνου έρχεται μετά· οι πρώτες εγγραφές βεβαιώνονται αναδρομικά (σπάσιμο του κύκλου Identity↔Time, MFA-ATK-15)

#### MFA-ELM-004 · Temporal Service · plane both · delta STRENGTHEN · maturity T · v4 · δόση 0

- **Σκοπός / δήλωση:** Κάθε ανάγνωση με cut σε πέντε χρόνους· κάθε πράξη αναπαραγώγιμη· «τι μπορούσε να γνωρίζει» απαντάται. — HLC με φράγμα ε, k-of-n RFC 3161 TSA, ντετερμινιστικό ρολόι για replay· ΠΕΝΤΕ ΧΡΟΝΟΙ, ΔΥΟ ΙΣΤΟΡΙΕΣ (MATERIAL §2 #10, MFA-ATK-07): Times⟨t_event, t_observed, t_legal_effect, t_recorded, t_procedural⟩, καθένας typed· διτεμπορικό = (t_event, t_recorded) ⊂ 5· «δύο ιστορίες» = (τι ίσχυε, τι μπορούσε εύλογα να γνωρίζει ο πράττων στο t_observed)· κάθε ανάγνωση με cut σε ΟΛΟΥΣ τους σχετικούς χρόνους (MFA-INV-019)· typed legal time.
- **Ικανότητες:** MFA-CAP-008, MFA-CAP-051
- **Διεπαφές:** MFA-CON-007
- **Εξουσία:** TSA keys allowlist
- **Κατάσταση:** HLC ανά κόμβο· TSR στο ledger· Times record ανά δέσμευση (5 πεδία, καθένα value ή Absent(reason))
- **Εξαρτήσεις:** MFA-ELM-003
- **Αποτυχίες:** skew→απόρριψη· TSA εκτός→k-of-n fallback+αγκύρωση
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-021 · **Falsifier:** committed γεγονός αναδιαταγμένο
- **Πόροι:** Rust · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KRN-07, ADR-0017 · **Παραδοχές:** —
- **times:** t_event, t_observed, t_legal_effect, t_recorded, t_procedural
- **genesis:** χρόνος γένεσης μη βεβαιωμένος: t_recorded των πρώτων εγγραφών = Absent(NOT_OBSERVED) στον άξονα freshness μέχρι την πρώτη TSA βεβαίωση· κατόπιν αναδρομική βεβαίωση με receipt (MFA-ATK-15)

#### MFA-ELM-005 · Crypto Epoch & Allowlist · plane none · delta NEW · maturity T · v2 · δόση 0

- **Σκοπός / δήλωση:** DEC-X-12: μία έδρα αντί για διάσπαρτες επιλογές· PQ ασυνέχεια ως πρωτόκολλο. — Η μία έδρα αλγορίθμων ανά epoch για ΚΑΘΕ διαδρομή υπογραφής (KEL, witnesses, DSSE, COSE/SCITT, VC, git tags)· dual signatures· epoch re-anchor. · Το allowlist ανά epoch απαριθμεί hash, υπογραφή, KEM ΚΑΙ canonical encoding (JCS-class)· αλλαγή κωδικοποίησης = epoch re-anchor (MFA-INV-039), όχι ρήξη της έδρας (MFA-ATK-08).
- **Ικανότητες:** MFA-CAP-037
- **Διεπαφές:** MFA-CON-003
- **Εξουσία:** epoch change = Tier-0 πράξη
- **Κατάσταση:** epoch → allowlist
- **Εξαρτήσεις:** —
- **Αποτυχίες:** αλγόριθμος σπάει→re-anchor πριν απόσυρση
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-009 · **Falsifier:** υπογραφή εκτός allowlist δεκτή
- **Πόροι:** αμελητέο · **Εξέλιξη:** ADD epoch
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** DEC-X-12, INV-X01/X02, ADR-0016 · **Παραδοχές:** Draft πρότυπα μόνο ως bindings με EP

#### MFA-ELM-099 · Tier-0 Kernel (frozen) · plane both · delta SPLIT (από MFA-ELM-020 / CMP-COG-04) · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Το σταθερό σημείο της επαλήθευσης: ο μόνος επαληθευτής που δεν επαληθεύει τον διάδοχό του. — Ο παγωμένος πυρήνας επαλήθευσης (MFA-ATK-16): Lean 4 kernel (#print axioms audit, MFA-VO-053) + TLA+ model checker (refinement/machine closure, MFA-VO-054) + CC-lite reference interpreter σε Common Lisp (N-version με το Rust journal)· κρατά το ΣΦΡΑΓΙΣΜΕΝΟ proof-object corpus· δεν είναι όργανο υπό ORP· αλλάζει μόνο με L3 πράξη + GCP replay· μέρος του robust substrate (MFA-ELM-096).
- **Ικανότητες:** MFA-CAP-022, MFA-CAP-059
- **Διεπαφές:** MFA-CON-030
- **Εξουσία:** L3 μόνο δημιουργός· ΠΟΤΕ ORP
- **Κατάσταση:** σφραγισμένο proof-object corpus (CAS) + kernel versions ως L3 δεσμεύσεις
- **Εξαρτήσεις:** MFA-ELM-002, MFA-ELM-003
- **Αποτυχίες:** mode: bug του kernel, response: N-version: Lean + TLA+ + CL reference· διαφωνία ⇒ deny + δημιουργός· mode: σφραγισμένο corpus ελλιπές, response: προσθήκη μόνο με ADD (μονότονο, όπως anchors)
- **Εναλλακτικές:** Suite που επαληθεύει τον διάδοχό της (η κατάσταση πριν — απορρίφθηκε: κυκλική επαλήθευση)
- **Επαλήθευση:** MFA-VO-053, MFA-VO-054, MFA-VO-035 · **Falsifier:** kernel που άλλαξε χωρίς L3 πράξη + replay· ή verifier διάδοχος που πέρασε χωρίς τον kernel
- **Πόροι:** Lean + TLA+ toolchain (CPU-only)· CL reference · **Εξέλιξη:** ΜΟΝΟ L3 + GCP replay του corpus (ποτέ R-A/R-B/R-C)
- **Άγνωστα / συγκρούσεις:** MFA-UNK-014 / — · **Προέλευση:** MFA-ATK-16, SPLIT από MFA-ELM-020 (CMP-COG-04), CLAIMS F83/F84 (#print axioms, TLA+ refinement) · **Παραδοχές:** δύο ανεξάρτητοι ελεγκτές (Lean + TLA+/CL) — bugs του ενός δεν συμπίπτουν με του άλλου

### S1 — Authority & Effect plane

#### MFA-ELM-006 · Capability Registry & Organ Admission · plane effect · delta STRENGTHEN · maturity T · v2 · δόση 0

- **Σκοπός / δήλωση:** Ικανότητα υπάρχει μόνο με τεκμήριο. — Organ contracts (17 πεδία + 16 άδεια δωμάτια με fill_policy/compat_rule — CLAIMS F1/F2), conformance vectors, μονότονο lattice ΜΟΝΟ με evidence από τον held-out, TTL, SLSA admission, ND ledger. · Η εισδοχή παρόχου/παραλήπτη δηλώνει DisclosureGrant⟨recipient, max_label, purpose, expiry⟩ ως πολιτική PDP (MFA-ATK-05).
- **Ικανότητες:** MFA-CAP-002, MFA-CAP-033
- **Διεπαφές:** MFA-CON-004
- **Εξουσία:** admission fail-closed
- **Κατάσταση:** registry events + lattice
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-086
- **Αποτυχίες:** ψευδής δήλωση→μόνο evidence· stale→TTL
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-024, MFA-VO-039 · **Falsifier:** capability χωρίς conformance report
- **Πόροι:** Rust · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-007 · **Προέλευση:** CMP-KRN-04, ADR-0011, CLAIMS F1/F2/F52 · **Παραδοχές:** 17 πεδία, όχι 22 (CLAIMS §6.4)

#### MFA-ELM-007 · Policy Decision Point (Control Plane) · plane effect · delta GENERALIZE · maturity T · v2 · δόση 0

- **Σκοπός / δήλωση:** Δ-12: όλα τα όρια έξω από τον πυρήνα. — Η ΜΟΝΑΔΙΚΗ έδρα απόφασης πολιτικής (Policy.sysml PDP): Control Records με πηγή/εμβέλεια/λήξη, κατώφλια αυτονομίας, κανόνες crossing/reach, budgets· Cedar-class· policyDecisionsInsideCore == 0. · Οι πολιτικές κατώφλια ανά βαθμίδα του owner perimeter (0–5) είναι Control Records με λήξη (MFA-ATK-07).
- **Ικανότητες:** MFA-CAP-005, MFA-CAP-006, MFA-CAP-032
- **Διεπαφές:** MFA-CON-005
- **Εξουσία:** συντάκτες: Compliance (LAW-09), δημιουργός
- **Κατάσταση:** records στο ledger· compiled cache παράγωγο
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-003
- **Αποτυχίες:** cache drift→recompute· άγνωστο policy hash→deny
- **Εναλλακτικές:** κανόνες μέσα στον πυρήνα (απαγορεύεται)
- **Επαλήθευση:** MFA-VO-005, MFA-VO-048 · **Falsifier:** άρνηση χωρίς Control Record ID
- **Πόροι:** Rust + Cedar · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-002 · **Προέλευση:** CMP-KRN-05, Policy.sysml PDP-00..03/POL-01..05 (requests), ADR-0010 · **Παραδοχές:** Πέντε σταθερές πυρήνα απαριθμημένες (admission, identity/keys, event sequence, authority mediation, Δ-12(γ))

#### MFA-ELM-008 · Constitution Gate (LPA) · plane effect · delta STRENGTHEN · maturity X · v5 · δόση 1

- **Σκοπός / δήλωση:** Η πύλη που δεν λυγίζει. — Αξιολόγηση κάθε δομικής μετάβασης έναντι Tier-0/1/2 κατηγορημάτων ΜΟΝΟ αποφασίσιμων φραγμένου κόστους (CLAIMS F5)· ετυμηγορία ΔΙΑΝΥΣΜΑ μέσω LPA (MFA-MECH-005)· fail-closed· N-version Rust+Lisp. · Η δεύτερη υλοποίηση (CL reference) = audit sampling στο DP-1 (ποσοστό από OAP) και πλήρης από DP-3· Tier-0 κατηγορήματα ΠΑΝΤΑ N-version (fail-closed)· διαφωνία ⇒ deny + Court με φραγμένο χρόνο (MFA-INV-065) (MFA-ATK-05). · ORDER = L2 δέσμευση με προεπιλογή Tier-0 → Tier-1 → Tier-2, εντός tier κατά σειρά εγγραφής (MFA-ATK-09). · ΔΥΟ ΟΨΕΙΣ (MFA-ATK-16): advisory (Genesis, καθαρή, χωρίς εξουσία — ο TEGF την καλεί για κατάταξη) και effective (Effect plane, δέσμευση)· η διάσχιση ορίου γίνεται μία φορά, στην πρόταση RET.
- **Ικανότητες:** MFA-CAP-049, MFA-CAP-059
- **Διεπαφές:** MFA-CON-006, MFA-CON-037
- **Εξουσία:** Tier-0 verdict απαιτεί υπογραφή δημιουργού
- **Κατάσταση:** stateless· verdicts στο ledger
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-006, MFA-ELM-007, MFA-ELM-051
- **Αποτυχίες:** bug→N-version, διαφωνία=deny+Court· μη αποφασίσιμο→UNKNOWN⇒deny
- **Εναλλακτικές:** δυαδικό verdict (corpus)
- **Επαλήθευση:** MFA-VO-006, MFA-VO-031, MFA-VO-019 · **Falsifier:** veto υπερκερασμένο
- **Πόροι:** Rust + CL reference (DP-1: δειγματοληπτικά· DP-3+: πλήρες) · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** MFA-UNK-001 / MFA-CFL-005 · **Προέλευση:** CMP-KRN-06, MFA-MECH-005, CLAIMS F5 · **Παραδοχές:** ORDER μεταξύ veto: προεπιλογή Tier order ως L2 δέσμευση (replay ακριβές, MFA-INV-008)· ο δημιουργός αποφασίζει αλλαγή (MFA-DEC-005)
- **governors:** Truth, Legal/Deontic, Owner-intent, Value, Regret, Curiosity, Empowerment, Commitment, Identity, Resource
- **default_order:** tier0: ['Truth', 'Legal/Deontic', 'Identity', 'Commitment'], tier1: ['Owner-intent', 'Resource'], tier2: ['Value', 'Regret', 'Curiosity', 'Empowerment'], within_tier: σειρά εγγραφής στο ledger
- **faces:** advisory: καθαρή συνάρτηση πάνω στα κατηγορήματα, καλείται από Genesis ως προσομοίωση της πύλης — καμία εξουσία, καμία δέσμευση, effective: στο Effect plane, με εξουσία· μόνο η ετυμηγορία της είναι δέσμευση

#### MFA-ELM-009 · Capability Gateway · plane effect · delta RETAIN · maturity T · v2 · δόση 0

- **Σκοπός / δήλωση:** Παράκαμψη μη αναπαραστάσιμη. — Το μόνο μονοπάτι επιδράσεων: tokens (attenuation-only, Biscuit-class — CLAIMS F56), controls, confidentiality domains, budgets, EffectReceipts· όργανα χωρίς ambient authority. · PEP για DISCLOSE: επιβάλλει label(payload) ≤ DisclosureGrant.max_label (MFA-CAP-077) και καταγράφει κάθε αποκάλυψη ως δέσμευση με receipt (MFA-ATK-05).
- **Ικανότητες:** MFA-CAP-005, MFA-CAP-077
- **Διεπαφές:** MFA-CON-008
- **Εξουσία:** gateway = TCB
- **Κατάσταση:** stateless→receipts
- **Εξαρτήσεις:** MFA-ELM-007, MFA-ELM-013
- **Αποτυχίες:** παράκαμψη→sandbox χωρίς fs/net
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-017, MFA-VO-020 · **Falsifier:** effect χωρίς receipt
- **Πόροι:** Rust/Wasmtime host fns · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KRN-11, INV-S02/C07, CLAIMS F56/F73/F74 · **Παραδοχές:** Ανάκληση φραγμένη στον χρόνο (short-lived tokens)

#### MFA-ELM-010 · Effect Transaction Engine (RET) · plane effect · delta NEW · maturity R · v5 · δόση 0

- **Σκοπός / δήλωση:** Η ανώτερη transactional ακολουθία (εντολή §13). — MFA-MECH-006: proposal → inverse staged → shadow → diff → gate → commit → window· NONE ⇒ H1· ο κατάλογος ενεργειών με υποχρεωτική ανθρώπινη έγκριση (CLAIMS F16) = κλάσεις με inverse NONE ∪ Constitution-H1. · Κλάση DISCLOSE (MFA-ATK-05): η έξοδος πληροφορίας προς πάροχο/παραλήπτη εκτός sovereign boundary είναι επίδραση με inverse NONE και standing DisclosureGrant — το plane διαρρέει ΜΟΝΟ μέσω υπογεγραμμένου, σημασμένου καναλιού· «τοπικά μοντέλα» = grant με recipient=self (αναβάθμιση εμπιστευτικότητας). · Owner perimeter 6 βαθμίδων (MATERIAL §2 #14) ως τα επίπεδα των AutonomyGrant/Envelope (MFA-ATK-07). · Κλάση IRREVERSIBLE-PREAUTHORIZED (MFA-ATK-09): μη αναστρέψιμη πράξη με H1 ικανοποιημένο από προ-υπογεγραμμένο AutonomyEnvelope· το «23:50 filing» γίνεται δυνατό ΜΟΝΟ αν υπάρχει envelope — ο δημιουργός αποφασίζει στην υπογραφή (MFA-DEC-004). · Envelope pre-simulation (Pass I κύκλος 1): πριν υπογραφεί AutonomyEnvelope, το RET τρέχει shadow της μη αναστρέψιμης πράξης στο World Twin (MFA-ELM-098) στο διαθέσιμο F-επίπεδο και προσαρτά foreseen_effects· presimulation: NONE δηλωμένο όπου ο World Twin είναι deferred.
- **Ικανότητες:** MFA-CAP-052, MFA-CAP-006
- **Διεπαφές:** MFA-CON-034
- **Εξουσία:** H1 = Principal/δημιουργός
- **Κατάσταση:** 9 καταστάσεις (δοσιέ 006 §7)
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-008, MFA-ELM-009, MFA-ELM-023
- **Αποτυχίες:** mode: inverse αποτυγχάνει, response: αναταξινόμηση κλάσης + Court· mode: envelope λήγει στη μέση της πράξης, response: abort πριν το commit· μετά το commit η πράξη μένει (μη αναστρέψιμη, σημασμένη) και ανοίγει Court· mode: envelope ανακλήθηκε μετά το staging, response: abort· receipt της ανάκλησης· mode: υπέρβαση max_exposure, response: deny + φρέσκο H1
- **Εναλλακτικές:** sagas
- **Επαλήθευση:** MFA-VO-032, MFA-VO-013, MFA-VO-020 · **Falsifier:** commit χωρίς inverse/H1
- **Πόροι:** shadow ×2 · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-001 · **Προέλευση:** MFA-MECH-006, Autonomy.sysml, CLAIMS F16 · **Παραδοχές:** Κλάσεις Effect κλειστή απαρίθμηση με ADD
- **effect_classes:** class: REVERSIBLE, inverse: r⁻¹ ή ē προ-δεσμευμένο, h1: False· class: IRREVERSIBLE, inverse: NONE, h1: πάντα (φρέσκο H1)· class: IRREVERSIBLE-PREAUTHORIZED, inverse: NONE για την πράξη· το AutonomyEnvelope είναι το αναστρέψιμο αντικείμενο (ανάκληση μέχρι την πράξη), h1: ικανοποιείται από ζωντανό AutonomyEnvelope⟨matter, effect_class, window, max_exposure, conditions, counter_signer ∈ {δεύτερο σώμα με ανεξάρτητο κλειδί, Court fast-track με φραγμένο χρόνο}, expiry⟩ (MFA-INV-067)· class: DISCLOSE, inverse: NONE, h1: ικανοποιείται από DisclosureGrant⟨recipient, max_label, purpose, expiry⟩ (πολιτική PDP, δηλωμένο στην εισδοχή του παρόχου, ανακλητό)· ο Gateway επιβάλλει label(payload) ≤ grant.max_label (MFA-CAP-077)· κάθε κλήση = δέσμευση Disclose με hash του payload και receipt
- **owner_perimeter:** level: 0, name: Think, effect: μηδέν side effect — Genesis plane εξ ορισμού· level: 1, name: Prepare, effect: staging χωρίς commit· level: 2, name: Recommend, effect: έξοδος προς Principal μέσω emission barrier· level: 3, name: Execute-bounded, effect: REVERSIBLE κλάση με grant· level: 4, name: Execute-consequential, effect: IRREVERSIBLE μόνο με ζωντανό AutonomyEnvelope ή φρέσκο H1 (MFA-INV-067)· level: 5, name: Emergency-stop, effect: Safe-Halt (MFA-ELM-016)

#### MFA-ELM-011 · Organ Host (microVM) · plane both · delta STRENGTHEN · maturity T · v2 · δόση 0

- **Σκοπός / δήλωση:** Το όριο των δύο planes. — Εκτέλεση οργάνων ως Wasm components ή microVM (Firecracker/gVisor)· ολόκληρο το Genesis plane ως ΕΝΑ όργανο μέσα σε microVM (MATERIAL §5 #5): μέσα απόλυτη ανακλαστική εξουσία, έξω καμία· zero-copy ring ως παραχωρημένος πόρος. · Κλάσεις απομόνωσης με κανόνα επιλογής από (side effects, latency, authority) (MATERIAL §2 #33) — isolation_classes.
- **Ικανότητες:** MFA-CAP-052, MFA-CAP-005
- **Διεπαφές:** MFA-CON-010
- **Εξουσία:** attestation
- **Κατάσταση:** καμία ανθεκτική
- **Εξαρτήσεις:** MFA-ELM-009, MFA-ELM-012
- **Αποτυχίες:** διαφυγή→defense in depth (Wasm+microVM)
- **Εναλλακτικές:** seL4 για gate/signing ως EP με πείραμα (DEC-X-19)
- **Επαλήθευση:** MFA-VO-020, MFA-VO-017 · **Falsifier:** ambient πρόσβαση από όργανο
- **Πόροι:** Wasmtime, Firecracker · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KRN-12, MATERIAL §5 #5, CLAIMS H10/F54 · **Παραδοχές:** seL4-grade noninterference ΔΕΝ διεκδικείται· η απομόνωση δηλώνεται ασθενέστερη (CLAIMS F54)
- **isolation_classes:** I0 Pure (χωρίς side effects, χωρίς κατάσταση — in-image), I1 Local stateful (κατάσταση μόνο τοπική — Wasm/microVM), I2 Privileged internal (πρόσβαση σε kernel contracts — microVM με tokens), I3/I4 (MATERIAL §2 #33: η περικοπή της ύλης που διαθέτει το πακέτο σταματά στο I3 — τα ονόματα ΔΕΝ εικάζονται· συμπληρώνονται από την ύλη στη Δόση 1)

#### MFA-ELM-012 · Supervisor Runtime · plane effect · delta RETAIN · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Ζωή των σωμάτων. — Actor supervision trees για bodies/proxies, restart strategies, hot-upgrade hooks για ORP· BEAM.
- **Ικανότητες:** MFA-CAP-035
- **Διεπαφές:** MFA-CON-012
- **Εξουσία:** leases
- **Κατάσταση:** in-memory + leases στο ledger
- **Εξαρτήσεις:** MFA-ELM-003, MFA-ELM-014
- **Αποτυχίες:** crash→restart αλλού· split-brain→lease fencing
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-004, MFA-VO-022 · **Falsifier:** δύο σώματα με ίδιο lease
- **Πόροι:** Elixir/OTP · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KRN-10, ADR-0013 · **Παραδοχές:** —

#### MFA-ELM-013 · Space, Resource & Activation Manager (OAP) · plane effect · delta STRENGTHEN · maturity X · v2 · δόση 0

- **Σκοπός / δήλωση:** Πόροι ως τύπος· lean collapse ως υπολογισμός. — Namespaces, placement, residency, typed budgets (χρόνος/tokens/ενέργεια/χρήμα), accounting + Organ Activation Planner (MFA-MECH-013): ελάχιστο σύνολο οργάνων ανά matter/deployment με veto κλάσης απόδειξης. · Περιορισμοί ανά προφίλ: λόγος κόστους αξιολόγησης (MFA-INV-065) και energy_envelope (Wh/matter)· υποχωρεί εύρος, ποτέ κλάση απόδειξης (MFA-ATK-13).
- **Ικανότητες:** MFA-CAP-032, MFA-CAP-054, MFA-CAP-033
- **Διεπαφές:** MFA-CON-011, MFA-CON-043
- **Εξουσία:** budget policy CIV-05/PDP
- **Κατάσταση:** allocations ledger· usage παράγωγο· profiles
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-006, MFA-ELM-007
- **Αποτυχίες:** εξάντληση→typed degraded, ποτέ PASS
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-011, MFA-VO-039, MFA-VO-024 · **Falsifier:** PASS υπό εξάντληση
- **Πόροι:** ILP ms · ILP με περιορισμούς eval-ratio και energy ανά MFA-DEP-n · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** MFA-UNK-008 / MFA-CFL-008, MFA-CFL-015 · **Προέλευση:** CMP-KRN-08, MFA-MECH-013, Α-15 · **Παραδοχές:** Κόστη από receipts/SPL

#### MFA-ELM-014 · Event Fabric · plane both · delta RETAIN · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Μεταφορά ≠ αλήθεια. — Μεταφορά versioned streams/speech acts, at-least-once, idempotent με event CID — όχι αλήθεια.
- **Ικανότητες:** MFA-CAP-034
- **Διεπαφές:** MFA-CON-009
- **Εξουσία:** subjects με token
- **Κατάσταση:** transient
- **Εξαρτήσεις:** MFA-ELM-001
- **Αποτυχίες:** broker→rebuild από ledger
- **Εναλλακτικές:** Kafka
- **Επαλήθευση:** MFA-VO-003 · **Falsifier:** αλήθεια που ζει μόνο στο fabric
- **Πόροι:** NATS JetStream · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KRN-09, ADR-0014 · **Παραδοχές:** —

#### MFA-ELM-015 · MetaBounds Registry · plane effect · delta NEW · maturity X · v1 · δόση 1

- **Σκοπός / δήλωση:** Τα invariants ως όρια, όχι ως έλεγχοι (μήνυμα δημιουργού: Meta-Bounded Variables). — Τοπολογικά όρια δύο κλάσεων: MECHANISM (provenance, replay, flow labels, complete log — δεν λυγίζουν) και POLICY (cost field, crossing με PenetrationProof, λήξη)· HardMechanismEnablesSoftPolicy.
- **Ικανότητες:** MFA-CAP-077, MFA-CAP-006
- **Διεπαφές:** MFA-CON-005
- **Εξουσία:** MECHANISM: L3· POLICY: PDP
- **Κατάσταση:** bounds + crossings + expiries
- **Εξαρτήσεις:** MFA-ELM-007, MFA-ELM-051
- **Αποτυχίες:** policy bound χωρίς λήξη→άκυρο στον τύπο
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-048 · **Falsifier:** MECHANISM bound που πέρασε crossing
- **Πόροι:** αμελητέο · **Εξέλιξη:** ADD bound
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** MetaBounds.sysml (MB-* requests), Δ-12 · **Παραδοχές:** PenetrationProof = απόδειξη αντιπάλου για διάβαση

#### MFA-ELM-016 · Safe-Halt Authority · plane effect · delta NEW · maturity X · v2 · δόση 1

- **Σκοπός / δήλωση:** Ποιος σταματά, και τι γίνεται αν ο δημιουργός λείπει. — Κλιμακωτή παύση (DEC-X-20): Principal για το δικό του, δημιουργός καθολικό k-of-n, αυτόματοι Tier-0 triggers· TimeFreeze ως πράξη με receipt· πολιτική μη-διαθεσιμότητας δημιουργού = ΑΝΟΙΧΤΗ απόφασή του. · Κάτοχοι k-of-n = δηλωμένοι από τον δημιουργό εκπρόσωποι, εγγεγραμμένοι ως L3 πολιτική, ανακλητοί· η κυριαρχία (MFA-INV-005) διατηρείται (MFA-ATK-09)· ποιοι/πόσοι = MFA-DEC-012.
- **Ικανότητες:** MFA-CAP-058
- **Διεπαφές:** MFA-CON-005
- **Εξουσία:** τριών επιπέδων
- **Κατάσταση:** RUNNING/FROZEN/HALTED
- **Εξαρτήσεις:** MFA-ELM-003, MFA-ELM-012
- **Αποτυχίες:** halt αργεί→drill
- **Εναλλακτικές:** μόνο δημιουργός (DEC-KGOV-07)
- **Επαλήθευση:** MFA-VO-023 · **Falsifier:** halt εκτός δηλωμένου χρόνου
- **Πόροι:** αμελητέο · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** MFA-UNK-012 / MFA-CFL-017 · **Προέλευση:** DEC-X-20, Autonomy.sysml TimeFreeze · **Παραδοχές:** —

### S2 — Genesis plane — νόηση χωρίς όριο, μέσα στο trust boundary

#### MFA-ELM-017 · Inference Gateway (TED) · plane genesis · delta STRENGTHEN · maturity T · v3 · δόση 0

- **Σκοπός / δήλωση:** Η γεννήτρια στο ταβάνι, ο τύπος ανά κλήση. — Provider-agnostic μοντέλα με model contracts, routing, N-model, redaction, Inference Receipts + Typed Execution (MFA-MECH-015): D1 exact-match με grammar στον sampler (logit=−∞ πριν softmax), P1 ερμηνεία TRACE_REPLAYABLE· μία πόρτα εξόδου (PROPOSED). · Προεπιλεγμένος τύπος LLM βήματος = D2 (σημασιολογικά ταυτόσημο υπό grammar constraint στην πηγή, CLAIMS H9)· D1 μόνο για τοπική καρφιτσωμένη εξαγωγή (weights hash + runtime hash + seed ως δεσμεύσεις, MFA-INV-061) που πέρασε MFA-VO-041 σε 1000 επαναλήψεις· ο τύπος γράφεται στο receipt· κάθε κλήση εξωτερικού παρόχου περνά ως επίδραση DISCLOSE από τον Gateway (MFA-ATK-05). · Οι πάροχοι είναι ΕΝΑ είδος generator του PDE μείγματος (MFA-MECH-019)· ο generator είναι πεδίο του receipt.
- **Ικανότητες:** MFA-CAP-050, MFA-CAP-051, MFA-CAP-066
- **Διεπαφές:** MFA-CON-022
- **Εξουσία:** residency Controls
- **Κατάσταση:** receipts· routing ως Controls
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-009, MFA-ELM-032
- **Αποτυχίες:** πάροχος εκτός→failover· drift→canary battery
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-001, MFA-VO-041 · **Falsifier:** P1 έξοδος σημασμένη VERIFIED
- **Πόροι:** Rust + adapters (HTTP, llama.cpp, vLLM-class) · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-010 · **Προέλευση:** CMP-COG-01, ADR-0019, MFA-MECH-015, CLAIMS H9 · **Παραδοχές:** Πάροχοι δίνουν version/seed· αλλιώς TRACE μόνο

#### MFA-ELM-018 · Global Workspace (AFP) · plane genesis · delta STRENGTHEN · maturity R · v3 · δόση 1

- **Σκοπός / δήλωση:** Ο νόμος προσοχής που έλειπε. — Περιορισμένης χωρητικότητας workspace με salience από AFP (MFA-MECH-011: a(t+1)=(I−κA)a+b, κ·λ_max<1, Interrupt στο N), broadcast, cycle traces· κάθε σκέψη ορατή κατά τη γέννηση. · Δίπλευρος νόμος κ_min ≤ κ < 1/λ_max (MFA-ATK-04)· ablation obligation: χωρίς AFP interrupt η διαβούλευση σε αντιφατικό σύνολο δεσμεύσεων δεν τερματίζει εντός budget (MFA-INV-065) — το KT που πρέπει να αποτύχει χωρίς το 018.
- **Ικανότητες:** MFA-CAP-073, MFA-CAP-015
- **Διεπαφές:** MFA-CON-028, MFA-CON-045
- **Εξουσία:** κ/kernels PDP
- **Κατάσταση:** a, λ_max, iters
- **Εξαρτήσεις:** MFA-ELM-017, MFA-ELM-024, MFA-ELM-028
- **Αποτυχίες:** μη σύγκλιση→Interrupt
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-037, MFA-VO-014 · **Falsifier:** διάδοση με κ·λ_max ≥ 1 χωρίς Interrupt· Ή κ=0 που περνά κάθε KT (⇒ workspace διακοσμητικός ⇒ RECLASSIFY) · **ablation_kt:** φραγμένη διαβούλευση υπό προϋπολογισμό: χωρίς AFP interrupt η διαβούλευση σε αντιφατικό σύνολο δεν τερματίζει εντός budget (MFA-INV-065)
- **Πόροι:** sparse O(edges) · **Εξέλιξη:** R-A (EXP-21)
- **Άγνωστα / συγκρούσεις:** MFA-UNK-002 / — · **Προέλευση:** CMP-COG-02, MFA-MECH-011, MATERIAL §9.2 · **Παραδοχές:** γραμμικοποίηση

#### MFA-ELM-019 · Deliberation Engine · plane genesis · delta STRENGTHEN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Σκέψη με budget, όχι με χρονόμετρο. — MCTS/program search/best-first proof search με budgets· rewards από verifiers· μάθηση ΜΟΝΟ στην κατανομή αναζήτησης (Bayesian posterior + acquisition), απαγορευμένη στον evaluator και στο μεταβατικό κλείσιμό του (capability confinement, Alloy/SMT).
- **Ικανότητες:** MFA-CAP-015, MFA-CAP-068
- **Διεπαφές:** MFA-CON-028
- **Εξουσία:** budgets
- **Κατάσταση:** transient trees→proposals
- **Εξαρτήσεις:** MFA-ELM-017, MFA-ELM-020, MFA-ELM-013
- **Αποτυχίες:** έκρηξη→anytime
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-014, MFA-VO-024 · **Falsifier:** μάθηση μέσα στο προστατευόμενο κλείσιμο
- **Πόροι:** C++23 core, Python value · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-005 · **Προέλευση:** CMP-COG-03, MATERIAL §5 #4, GAP-COG-08 · **Παραδοχές:** —

#### MFA-ELM-020 · Verification Suite · plane both · delta SPLIT · maturity T · v3 · δόση 1

- **Σκοπός / δήλωση:** Απόδειξη ή τυποποιημένη απουσία. — Μητρώο verifiers με ΜΙΑ κλίμακα βαθμών (DEC-X-08), N-version με EIM PASS, mutation-tested, proof objects· timeout⇒UNKNOWN· verifier set μέσα στην ταυτότητα· #print axioms για Lean, refinement/machine-closure/level-correctness για TLA+. · Κανένας εξαχθείς από Lean κώδικας στο TCB· Tier-0 = απόδειξη ιδιοτήτων του μοντέλου (TLA+/Lean)· η δέσμευση μοντέλου↔κώδικα είναι Tier-1 (DRT, MFA-VO-054)· MFA-UNK-014 παραμένει RSP (MFA-ATK-05). · SPLIT (MFA-ATK-16): το 020 = Verification Suite Tier-1/2 (όργανα υπό ORP)· ο παγωμένος Tier-0 kernel = MFA-ELM-099· κάθε διάδοχος verifier περνά το σφραγισμένο corpus από τον kernel (MFA-INV-068).
- **Ικανότητες:** MFA-CAP-022, MFA-CAP-043
- **Διεπαφές:** MFA-CON-030
- **Εξουσία:** grade ανά verifier
- **Κατάσταση:** stateless→CAS proofs
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-086, MFA-ELM-099
- **Αποτυχίες:** bug→N-version+mutation
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-035, MFA-VO-053, MFA-VO-054 · **Falsifier:** timeout που έγινε pass
- **Πόροι:** Rust/Lisp/Python, Z3, Lean · **Εξέλιξη:** R-A ανά verifier, με EIM
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-COG-04, DEC-X-08, CLAIMS F83/F84 · **Παραδοχές:** —

#### MFA-ELM-021 · Belief Maintenance (ATMS / Both) · plane genesis · delta STRENGTHEN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Αντίφαση χωρίς έκρηξη, στο υπόστρωμα. — ATMS labels/nogoods ως ο μηχανισμός μη-έκρηξης· Belnap Both ως τιμή (όχι όρος «υπέρθεση»)· αναβολή κρίσης με collapse_fn = Court· ο ηττημένος διατηρείται.
- **Ικανότητες:** MFA-CAP-046, MFA-CAP-010
- **Διεπαφές:** MFA-CON-029
- **Εξουσία:** collapse μόνο Court
- **Κατάσταση:** παράγωγο δίκτυο + committed nogoods
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-048
- **Αποτυχίες:** έκρηξη labels→focused ATMS
- **Εναλλακτικές:** μη κλασική αληθοτιμή (απορρίπτεται)
- **Επαλήθευση:** MFA-VO-005 · **Falsifier:** κατάρρευση με ψηφοφορία/άθροισμα
- **Πόροι:** CL · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-009 · **Προέλευση:** CMP-COG-05, MATERIAL §5 #12, CLAIMS H11/H12 · **Παραδοχές:** —

#### MFA-ELM-022 · Causal & Counterfactual Engine · plane genesis · delta RETAIN · maturity X · v1 · δόση 2

- **Σκοπός / δήλωση:** Αιτία, όχι συσχέτιση. — SCMs versioned στον KG, do-calculus, μη ταυτοποιήσιμο⇒Unknown(NOT_IDENTIFIABLE, υποθέσεις)· νομική αιτιώδης συνάφεια.
- **Ικανότητες:** MFA-CAP-014
- **Διεπαφές:** MFA-CON-028, MFA-CON-030
- **Εξουσία:** —
- **Κατάσταση:** SCMs στον KG
- **Εξαρτήσεις:** MFA-ELM-080, MFA-ELM-023
- **Αποτυχίες:** μη ταυτοποιήσιμο→Unknown
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-028 · **Falsifier:** αιτιακός ισχυρισμός χωρίς identification proof
- **Πόροι:** Python + CL · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-COG-06, EXP-22 · **Παραδοχές:** —

#### MFA-ELM-023 · World Model & Forks (Ghost Worlds) · plane genesis · delta GENERALIZE · maturity T ghost · R world diff · v2 · δόση 1

- **Σκοπός / δήλωση:** Εναλλακτικοί κόσμοι συγκρίσιμοι. — O(1) forks (persistent γράφος, MFA-ALT-5), ghost worlds χωρίς commit capability (τύπος), pushout compare/merge με loss map (MFA-MECH-014), learned world models ως P1. · Τα ghost worlds διακλαδώνουν ΚΑΙ το World Twin (MFA-ELM-098): fork = (ledger cut, world state, actors) (MFA-ATK-11).
- **Ικανότητες:** MFA-CAP-024, MFA-CAP-014
- **Διεπαφές:** MFA-CON-026, MFA-CON-028
- **Εξουσία:** ghost handles χωρίς commit
- **Κατάσταση:** sheets
- **Εξαρτήσεις:** MFA-ELM-001
- **Αποτυχίες:** merge χωρίς loss map→μη αναπαραστάσιμο
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-040 · **Falsifier:** ghost με commit capability
- **Πόροι:** Rust CoW · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** MFA-UNK-004 / — · **Προέλευση:** CMP-COG-07, MFA-ALT-5, MFA-MECH-014 · **Παραδοχές:** —

#### MFA-ELM-024 · Metacognition & Self-Prediction (SPL) · plane genesis · delta MERGE · maturity R · v3 · δόση 1

- **Σκοπός / δήλωση:** Αυτογνωσία = προβλεπτική ακρίβεια. — Το self-model ΣΥΓΧΩΝΕΥΕΤΑΙ ΧΩΡΙΣ ΑΠΩΛΕΙΑ (MFA-ATK-03): (α) δηλωμένο CompetenceProfile — τρεις έδρες CAPABILITY / COMPETENCE (applicability, calibration, failure envelope, evidence) / AUTHORITY (μόνο action token) από MATERIAL §2 #12, χρησιμοποιήσιμο ΠΡΙΝ από κάθε πράξη (OAP set cover)· (β) Self-Prediction Ledger (MFA-MECH-010) με proper scoring εκτός microVM, FidelityIndex, DriftAlarm→Battery, calibration gates με ρεύμα outcomes εκτός προσομοίωσης. Cold start: το CompetenceProfile νέου οργάνου είναι δέσμευση κλάσης Unknown(NOT_OBSERVED, plan: N βαθμολογημένες προβλέψεις, VOI από OAP) μέχρι FidelityIndex ≥ κατώφλι· μέχρι τότε το όργανο σχεδιάζεται μόνο σε canary.
- **Ικανότητες:** MFA-CAP-017, MFA-CAP-016, MFA-CAP-065
- **Διεπαφές:** MFA-CON-038
- **Εξουσία:** scorer HELD_OUT
- **Κατάσταση:** CompetenceProfile (δηλωμένο, σημασμένο unverified μέχρι FidelityIndex) + prediction ledger + FidelityIndex ανά όργανο
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-086, MFA-ELM-037
- **Αποτυχίες:** mode: unresolved prediction, response: EXPIRED μετρά ως αποτυχία· mode: cold start (0 προβλέψεις), response: CompetenceProfile = Unknown(NOT_OBSERVED)· OAP μόνο canary· mode: δηλωμένο προφίλ ≠ μετρημένο, response: DriftAlarm → Battery → ORP
- **Εναλλακτικές:** στατικό self-model μόνο (corpus), SPL μόνο (η αρχική REPLACE — απορρίφθηκε: cold start, MFA-ATK-03)
- **Επαλήθευση:** MFA-VO-036, MFA-VO-046, MFA-VO-051 · **Falsifier:** drift χωρίς Battery · **ablation_kt:** MFA-VO-046 self-model drift: χωρίς SPL η αλλαγή παρόχου (KT-01) περνά απαρατήρητη
- **Πόροι:** φθηνό scoring · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-COG-08, MFA-MECH-010, MATERIAL §7 #10 · **Παραδοχές:** Το δηλωμένο προφίλ είναι ισχυρισμός του οργάνου για τον εαυτό του — γι' αυτό μόνο canary μέχρι FidelityIndex

#### MFA-ELM-025 · Skill & Procedure Library · plane both · delta STRENGTHEN · maturity T · v3 · δόση 1

- **Σκοπός / δήλωση:** Διαδικαστική γνώση. — Tools, programs, LexDSL rule-sets, playbooks· versioned, conformance-tested, capability-scoped. · Προγράμματα παραγόμενα από raw επεισόδια με αναζήτηση προγραμμάτων (MFA-CAP-066 ως προγράμματα, όχι βάρη): δεσμεύσεις με lineage, επαληθεύσιμα, υπό ORP — PROGRAM generators του PDE (MFA-MECH-019, MFA-ATK-10).
- **Ικανότητες:** MFA-CAP-009
- **Διεπαφές:** MFA-CON-010, MFA-CON-028
- **Εξουσία:** scoped
- **Κατάσταση:** CAS + registry
- **Εξαρτήσεις:** MFA-ELM-002, MFA-ELM-006
- **Αποτυχίες:** παλινδρόμηση→ND
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-024 · **Falsifier:** skill χωρίς conformance
- **Πόροι:** Wasm/Lisp/Python · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-COG-09 · **Παραδοχές:** —

#### MFA-ELM-026 · Action Executor · plane effect · delta MOVE · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Σκέψη→πράξη μέσω RET. — Εκτέλεση σχεδίων ΜΟΝΟ ως EffectTx (MFA-ELM-010)· sagas με compensations· ΜΕΤΑΚΙΝΕΙΤΑΙ από COG στο Effect plane (η εκτέλεση δεν είναι σκέψη).
- **Ικανότητες:** MFA-CAP-052
- **Διεπαφές:** MFA-CON-008, MFA-CON-034
- **Εξουσία:** tokens
- **Κατάσταση:** action logs→receipts
- **Εξαρτήσεις:** MFA-ELM-010, MFA-ELM-009
- **Αποτυχίες:** μερική→compensations
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-032 · **Falsifier:** effect εκτός RET
- **Πόροι:** Elixir · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-COG-10 · **Παραδοχές:** —

#### MFA-ELM-027 · Perception & Scouts · plane genesis · delta GENERALIZE · maturity T έγγραφα · X scouts/live · v1 · δόση 1

- **Σκοπός / δήλωση:** Omnipresent oracle scrapers (μήνυμα δημιουργού) με επιστημικό ρίσκο. — PDF/HTML/OCR/ελληνικό NLP + pull-based Recursive Environment Scanner με ScoutingProtocol και EpistemicRiskScore (Perception.sysml) καταναλώνοντας VOI του void ledger· ζωντανή μεταγραφή ως χωριστό στοιχείο (MFA-ELM-071)· κάθε αντίληψη untrusted από τη γέννηση· εμβέλεια = εξουσιοδοτημένες πηγές (Control).
- **Ικανότητες:** MFA-CAP-011, MFA-CAP-078
- **Διεπαφές:** MFA-CON-018, MFA-CON-028, MFA-CON-035
- **Εξουσία:** reach Controls
- **Κατάσταση:** scouts + risk scores
- **Εξαρτήσεις:** MFA-ELM-028, MFA-ELM-082, MFA-ELM-009
- **Αποτυχίες:** OCR αβεβαιότητα→confidence labels
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-017, MFA-VO-028 · **Falsifier:** scout εκτός εξουσιοδοτημένης εμβέλειας
- **Πόροι:** CL + Tesseract + Python · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-COG-11, Perception.sysml (SCOUT/PER/EPI-RISK requests) · **Παραδοχές:** ReachIsAsked

#### MFA-ELM-028 · Void Ledger · plane both · delta NEW · maturity R · v2 · δόση 0

- **Σκοπός / δήλωση:** Unknown ως πολίτης. — MFA-MECH-002: κάθε Unknown με reason/plan/VOI/dependents/λήξη· τροφοδοτεί scouts, quests, βούληση, Science Organ· διάδοση taint. · Δεικτοδότηση ανά άξονα κατάστασης: κάθε Absent(reason) οποιουδήποτε από τους 10 άξονες μιας δέσμευσης είναι εγγραφή του Void (MFA-ATK-07).
- **Ικανότητες:** MFA-CAP-039
- **Διεπαφές:** MFA-CON-035
- **Εξουσία:** reason codes PDP
- **Κατάσταση:** OPEN/SCHEDULED/OBSERVING/RESOLVED/SPLIT/EXPIRED
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-018
- **Αποτυχίες:** χωρίς plan→τύπος απορρίπτει
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-028 · **Falsifier:** Unknown χωρίς reason
- **Πόροι:** O(voids) · **Εξέλιξη:** ADD reason codes
- **Άγνωστα / συγκρούσεις:** MFA-UNK-102 / MFA-CFL-009 · **Προέλευση:** MFA-MECH-002 · **Παραδοχές:** —

#### MFA-ELM-029 · Volition Engine (TEGF) · plane genesis · delta NEW · maturity R · v4 · δόση 2

- **Σκοπός / δήλωση:** Ενδογενής πρωτοβουλία δεμένη στο Telos. — MFA-MECH-004: GapField ανά T → υποψήφιοι Goals (EFE, LPA) → εισδοχή με falsifier → AutonomyGrant ή H1 → RET → REVIEW· Telos read-only· quests του δημιουργού = Goals origin creator. · AutonomyGrant για REVERSIBLE· AutonomyEnvelope (προ-υπογεγραμμένο, με counter_signer) για IRREVERSIBLE-PREAUTHORIZED· επίπεδα = owner perimeter 0–5 (MFA-ATK-09). · request_envelope → shadow στο World Twin → foreseen_effects → PENDING_SIGNATURE (Pass I κύκλος 1).
- **Ικανότητες:** MFA-CAP-018
- **Διεπαφές:** MFA-CON-036
- **Εξουσία:** grant/H1
- **Κατάσταση:** 10 καταστάσεις
- **Εξαρτήσεις:** MFA-ELM-028, MFA-ELM-008, MFA-ELM-010, MFA-ELM-024, MFA-ELM-018
- **Αποτυχίες:** ταλάντωση→hysteresis
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-030 · **Falsifier:** ACTING χωρίς grant · **ablation_kt:** quest χωρίς δημιουργό: χωρίς TEGF ένα Void entry με υψηλό VOI και σχέδιο παρατήρησης δεν γίνεται ποτέ Goal (MFA-INV-056 μόνο τυπικά)
- **Πόροι:** budget ανά κύκλο · **Εξέλιξη:** R-A· συνάρτηση ταξινόμησης PDP
- **Άγνωστα / συγκρούσεις:** MFA-UNK-002 / MFA-CFL-001 · **Προέλευση:** MFA-MECH-004, MATERIAL §4 · **Παραδοχές:** —

#### MFA-ELM-030 · Science Organ · plane both · delta NEW · maturity R · v2 · δόση 2

- **Σκοπός / δήλωση:** Νέα εμπειρική γνώση ως έξοδος. — Επτάφασος βρόχος (παρατήρηση→υπόθεση με falsifier→σχεδιασμός→εκτέλεση υπό token→ανάλυση→ανεξάρτητη αναπαραγωγή→ένταξη), 6+ κλάσεις ανακάλυψης (ανοιχτή απαρίθμηση), capability-producing → Evolution. · Οι υποθέσεις του είναι SCIENCE_HYPOTHESIS generators του PDE (MFA-MECH-019).
- **Ικανότητες:** MFA-CAP-048, MFA-CAP-067
- **Διεπαφές:** MFA-CON-026, MFA-CON-028
- **Εξουσία:** execution adapter υπό ActionToken
- **Κατάσταση:** 7 φάσεις
- **Εξαρτήσεις:** MFA-ELM-028, MFA-ELM-085, MFA-ELM-010, MFA-ELM-020
- **Αποτυχίες:** ESTABLISHED χωρίς αναπαραγωγή→απαγορεύεται στον τύπο
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-028, MFA-VO-012 · **Falsifier:** ανακάλυψη χωρίς falsifier
- **Πόροι:** πείραμα-εξαρτώμενο · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** MATERIAL §4 Science Organ, CLAIMS F32 (ανοιχτή απαρίθμηση) · **Παραδοχές:** —

#### MFA-ELM-031 · Reflective Tower [EP] · plane genesis · delta RESEARCH · maturity E · v1 · δόση 4

- **Σκοπός / δήλωση:** Η αυτο-τροποποίηση με όριο επιπέδου. — Μετακυκλικός πύργος επιπέδων (Brown/Blond, lms-black) μέσα στο Genesis plane· ΜΟΝΟ συμβόλαιο + EXP με κριτήριο εισόδου (CLAIMS F44/F79)· INV-F02: κανένα επίπεδο δεν τροποποιεί το δικό του ή ανώτερο· L3 αναγνώσιμο από όλα, εγγράψιμο από κανένα εσωτερικό.
- **Ικανότητες:** MFA-CAP-066
- **Διεπαφές:** MFA-CON-010
- **Εξουσία:** L3 δημιουργός
- **Κατάσταση:** levels
- **Εξαρτήσεις:** MFA-ELM-011
- **Αποτυχίες:** meta-level check που σφάλλει σε κάθε κλήση (F91)→INV με test
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-020 · **Falsifier:** εγγραφή στο L3 από εσωτερικό principal
- **Πόροι:** EXP · **Εξέλιξη:** EP→[X]→[T]
- **Άγνωστα / συγκρούσεις:** MFA-UNK-103 / MFA-CFL-003 · **Προέλευση:** Contracts.sysml ReflectiveTower (META-LEVELS request), CLAIMS F44/F79/F91 · **Παραδοχές:** Δεν υπάρχει στο σώμα

#### MFA-ELM-032 · Emission Barrier · plane effect · delta NEW · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Η έδρα επιβολής του T6 στην έξοδο. — Μονονηματικό fail-closed φράγμα πριν από κάθε έξοδο προς άνθρωπο/κόσμο (MFA-MECH-015): OutputClass υποχρεωτική, κανένα ανεξήγητο βαθμωτό, P1≠VERIFIED, Prediction Doctrine, καμία παραγλωσσική ένδειξη σε παραδοτέο, τύπος ισχυρισμού (επιστημικός/συνηγορικός) ανά πρόταση· επιβολή στον τύπο του σχήματος.
- **Ικανότητες:** MFA-CAP-040, MFA-CAP-072, MFA-CAP-041
- **Διεπαφές:** MFA-CON-019, MFA-CON-023
- **Εξουσία:** Tier-0 άρθρα
- **Κατάσταση:** stateless
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-007
- **Αποτυχίες:** σχήμα εξόδου ελλιπές→άρνηση
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-048, MFA-VO-015 · **Falsifier:** έξοδος χωρίς κλάση
- **Πόροι:** O(έξοδος) · **Εξέλιξη:** ADD κανόνα = Tier-0 πράξη
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** ULTIMA-LEX φράγμα, MATERIAL §5 #3/#11, MFA-OBJ-043 · **Παραδοχές:** —

#### MFA-ELM-098 · Environment Model (World Twin) · plane genesis · delta NEW · maturity R · v2 · δόση 3

- **Σκοπός / δήλωση:** Τα KT και οι στρατηγικές να δοκιμάζονται σε κόσμο που ΔΕΝ έγραψε ο οργανισμός μόνος του — όχι μόνο στον οργανισμό. — Το δίδυμο ΤΟΥ ΚΟΣΜΟΥ (MFA-ATK-11): αντίδικοι, δικαστήρια, μητρώα, προθεσμίες, αντίπαλοι ως προσομοιωμένοι δρώντες με δικές τους δεσμεύσεις και συμπεριφορά που οδηγεί ο CAM-NS (MFA-ELM-050)· δηλωμένη πιστότητα ανά δρώντα (F-επίπεδο ανά όργανο ΚΑΙ ανά δρώντα)· παράγεται από τον Temporal KG (Judicial Decision Objects MFA-ELM-070, docket MFA-ELM-067, προφίλ δικαστή υπό Control Record MFA-CAP-072)· είναι αυτό που διακλαδώνουν τα ghost worlds (MFA-ELM-023)· ο Judge Simulator (MFA-ELM-064) είναι ένας δρών του. · Παρέχει το shadow run των AutonomyEnvelopes (foreseen_effects) πριν από την υπογραφή (Pass I κύκλος 1, MFA-PATCH-0018).
- **Ικανότητες:** MFA-CAP-024, MFA-CAP-014, MFA-CAP-023
- **Διεπαφές:** MFA-CON-026
- **Εξουσία:** actor_fidelity δηλωμένη· προφίλ δικαστή μόνο υπό Control Record ανά δικαιοδοσία (MFA-CAP-072, προεπιλογή κλειστή)· καμία ποσοστιαία έξοδος προς τα έξω (Prediction Doctrine)
- **Κατάσταση:** actors + world_seed + fidelity vector ανά δρώντα· κάθε συμπεριφορά δρώντα = δέσμευση στον ghost world
- **Εξαρτήσεις:** MFA-ELM-080, MFA-ELM-070, MFA-ELM-067, MFA-ELM-050, MFA-ELM-085
- **Αποτυχίες:** mode: δρών χωρίς δεδομένα, response: Unknown(NOT_OBSERVED) — ο δρών δεν προσομοιώνεται, δηλώνεται· mode: διαρροή ποσοστών προς τα έξω, response: emission barrier (MFA-INV-047, MFA-CAP-072)· mode: ο κόσμος «μαθαίνει» τον οργανισμό (Goodhart), response: CAM-NS negative selection + HELD_OUT seeds
- **Εναλλακτικές:** μόνο CAM-NS αντίπαλος (η κατάσταση πριν το patch)
- **Επαλήθευση:** MFA-VO-033, MFA-VO-038 · **Falsifier:** KT που περνά με scripted κόσμο και αποτυγχάνει με World Twin χωρίς να παραχθεί fidelity-gap δέσμευση
- **Πόροι:** DP-3+ πλήρες· DP-1/2 μόνο CAM-NS δρών (deferred simulations) · **Εξέλιξη:** R-A· δρώντες ADD· πρώτο πείραμα Δόση 3
- **Άγνωστα / συγκρούσεις:** MFA-UNK-009, MFA-UNK-011 / — · **Προέλευση:** MFA-ATK-11, EXP-23 (learned world models for litigation dynamics), MATERIAL §2 #32 (αιτιακή συμπερασματολογία 6 επιπέδων), EXOUSIA (προφίλ δικαστή) · **Παραδοχές:** δεδομένα docket/αποφάσεων επαρκή για ≥1 δρώντα πέρα από τον CAM-NS

### S3 — Entity (AEO)

#### MFA-ELM-033 · Entity Core · plane both · delta STRENGTHEN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Ποιος είναι η οντότητα και για ποιον. — Identity Charter, value spec, δέσμευση συντάγματος, άγκυρα αυτο-αφήγησης· ο δικαιούχος του σκοπού = Principal με κρυπτογραφική ταυτότητα, αμετάβλητος ως ΑΝΑΛΛΟΙΩΤΟ LEDGER (όχι literal τύπου — MATERIAL §5 #15)· ρόλοι: Principal/beneficiary/κατοχή.
- **Ικανότητες:** MFA-CAP-004, MFA-CAP-064
- **Διεπαφές:** MFA-CON-015
- **Εξουσία:** charter + gate
- **Κατάσταση:** charter events
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-003, MFA-ELM-008
- **Αποτυχίες:** παραποίηση→υπογραφή+gate· value drift→Battery+Court
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-001, MFA-VO-008 · **Falsifier:** αλλαγή δικαιούχου χωρίς Tier-0 πράξη
- **Πόροι:** Rust + CL · **Εξέλιξη:** R-D
- **Άγνωστα / συγκρούσεις:** MFA-UNK-023 / MFA-CFL-011 · **Προέλευση:** CMP-AEO-01, ADR-0003, MATERIAL §5 #15 · **Παραδοχές:** —

#### MFA-ELM-034 · Embodiment Manager · plane effect · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Μία ταυτότητα, πολλά σώματα. — Spawn/suspend/migrate/terminate bodies με delegation leases, scopes, όρια απόκλισης, merge-back.
- **Ικανότητες:** MFA-CAP-004, MFA-CAP-035
- **Διεπαφές:** MFA-CON-012, MFA-CON-015
- **Εξουσία:** leases
- **Κατάσταση:** body registry
- **Εξαρτήσεις:** MFA-ELM-003, MFA-ELM-012, MFA-ELM-013
- **Αποτυχίες:** ορφανό→λήξη lease· zombie→revocation
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-018, MFA-VO-004 · **Falsifier:** σώμα χωρίς lease υπογράφει
- **Πόροι:** Elixir · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-AEO-02, ADR-0021 · **Παραδοχές:** —

#### MFA-ELM-035 · Memory System (+ prospective) · plane both · delta STRENGTHEN · maturity T · X prospective · v2 · δόση 1

- **Σκοπός / δήλωση:** Μνήμη = ικανότητες πάνω σε ένα υπόστρωμα. — ΔΕΚΑ ΤΥΠΟΙ ΜΝΗΜΗΣ (MATERIAL §2 #4, MFA-ATK-07), καθένας με δηλωμένο ρυθμό μεταβολής και ορίζοντα: working, sensory-buffer, episodic, semantic (ATMS labels), procedural, autobiographical, prospective (Goals με t_valid μέλλον που επιβιώνουν restart), affective/valuation, social (model-of-others), meta/self· όλα ως δεσμεύσεις CC· κύκλος consolidation/reconsolidation 7 σταδίων όπου στο Contradict και οι δύο εκδοχές παραμένουν (Both)· ΤΕΣΣΕΡΙΣ ΜΗΧΑΝΙΣΜΟΙ ΛΗΘΗΣ (#29): decay, suppression, cryptographic erasure, structural tombstone — καθένας με impact event που σημαίνει τα downstream EVIDENCE-ORPHANED.
- **Ικανότητες:** MFA-CAP-009, MFA-CAP-057
- **Διεπαφές:** MFA-CON-029
- **Εξουσία:** erase μόνο Control
- **Κατάσταση:** ledger events + CAS· indexes παράγωγα
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-002, MFA-ELM-080, MFA-ELM-081
- **Αποτυχίες:** index→rebuild· αντιφάσεις→Both
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-005, MFA-VO-016 · **Falsifier:** last-writer-wins
- **Πόροι:** Rust + CL · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-013 · **Προέλευση:** CMP-AEO-03, ADR-0020, MATERIAL §4 prospective · **Παραδοχές:** —
- **memory_types:** type: working, rate: δευτερόλεπτα, horizon: κύκλος· type: sensory-buffer, rate: ms, horizon: λεπτά· type: episodic, rate: ανά γεγονός, horizon: μόνιμο (append-only)· type: semantic, rate: consolidation, horizon: μόνιμο, ATMS labels· type: procedural, rate: ανά skill, horizon: μόνιμο, versioned· type: autobiographical, rate: ανά milestone, horizon: ταυτότητα· type: prospective, rate: ανά goal, horizon: t_valid μέλλον· type: affective/valuation, rate: ανά έκβαση, horizon: SPL παράθυρο· type: social/model-of-others, rate: ανά αλληλεπίδραση, horizon: ανά οντότητα· type: meta/self, rate: ανά πρόβλεψη, horizon: CompetenceProfile
- **forgetting_mechanisms:** decay, suppression, cryptographic erasure, structural tombstone

#### MFA-ELM-036 · Consolidation Engine · plane genesis · delta RETAIN · maturity X (EXP-13) · v1 · δόση 2

- **Σκοπός / δήλωση:** Μάθηση χωρίς απώλεια επεισοδίων. — «Ύπνος»: προσθετική συγχώνευση episodic→semantic, αφαίρεση, skill induction proposals· σύγκρουση→Both/Court· adapters ως παράγωγα (Α-17) με συμβόλαιο διαγραφής.
- **Ικανότητες:** MFA-CAP-009, MFA-CAP-066
- **Διεπαφές:** MFA-CON-029
- **Εξουσία:** προτάσεις→verification
- **Κατάσταση:** reports
- **Εξαρτήσεις:** MFA-ELM-035, MFA-ELM-020, MFA-ELM-048
- **Αποτυχίες:** κακή γενίκευση→verification
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-005 · **Falsifier:** episodic που σβήστηκε από consolidation
- **Πόροι:** CL + Python · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-AEO-04, DEC-X-19 · **Παραδοχές:** —

#### MFA-ELM-037 · Continuity Verifier (external issuer) · plane effect · delta STRENGTHEN · maturity T κρυπτ/μνημ · X χαρακτ · R υπολογ · v1 · δόση 1

- **Σκοπός / δήλωση:** Ο κριτής της ταυτότητας απρόσιτος από τον κρινόμενο. — Τετραπλή συνέχεια (κρυπτογραφική, μνημονική, χαρακτηρολογική Battery, ΥΠΟΛΟΓΙΣΤΙΚΗ = ζωντανό κλείσιμο δεσμεύσεων)· ContinuityCertificate εκδίδεται ΕΚΤΟΣ microVM από HELD_OUT + δημιουργό· Battery σφραγισμένη, κρυφή· TOST με προκαταχωρισμένο ε (DEC-X-09)· η ανθρώπινη βεβαίωση χωριστή κλάση.
- **Ικανότητες:** MFA-CAP-004, MFA-CAP-036
- **Διεπαφές:** MFA-CON-006
- **Εξουσία:** εκδότης εκτός γενεαλογίας οντότητας
- **Κατάσταση:** certificates
- **Εξαρτήσεις:** MFA-ELM-086, MFA-ELM-056, MFA-ELM-024
- **Αποτυχίες:** Battery διαρροή→σφράγιση/περιστροφή
- **Εναλλακτικές:** πράξη δημιουργού ως pass KT-01 (απορρίπτεται, DEC-X-09)
- **Επαλήθευση:** MFA-VO-001, MFA-VO-008, MFA-VO-046 · **Falsifier:** certificate in-process
- **Πόροι:** Rust + Python · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** MFA-UNK-004 / — · **Προέλευση:** CMP-AEO-05, MATERIAL §5 #10, §4, DEC-X-08/09 · **Παραδοχές:** —

#### MFA-ELM-038 · Organ Replacement Orchestrator (+CPEG +SLM) · plane effect · delta STRENGTHEN · maturity T · v2 · δόση 2

- **Σκοπός / δήλωση:** Κάθε αντικατάσταση επαληθεύσιμη μετάβαση. — ORP: Propose → CPEG στατικός έλεγχος (MFA-MECH-017) → shadow → SLM loss map (MFA-MECH-014) → ND → canary → cutover → rollback window· προκάτοχος ενεργός· SEMANTIC-LOSS μπλοκάρει· εφαρμόζεται και στην πλατφόρμα σχεδιασμού και στον κριτή (από άλλον Πολιτισμό). · CPEG με δηλωμένο αποφασίσιμο τμήμα· CPEG-UNKNOWN ⇒ shadow υποχρεωτικό (MFA-ATK-04)· SLM anchors με ≥1/3 αρνητικά.
- **Ικανότητες:** MFA-CAP-026, MFA-CAP-080, MFA-CAP-025
- **Διεπαφές:** MFA-CON-016
- **Εξουσία:** cutover = gate verdict
- **Κατάσταση:** ORP state machine στο ledger
- **Εξαρτήσεις:** MFA-ELM-006, MFA-ELM-008, MFA-ELM-085, MFA-ELM-048
- **Αποτυχίες:** stuck→abort (προκάτοχος μένει)· κακό cutover→rollback
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-002, MFA-VO-013, MFA-VO-040, MFA-VO-043 · **Falsifier:** cutover χωρίς shadow/loss map
- **Πόροι:** Elixir · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-007 · **Προέλευση:** CMP-AEO-06, ADR-0006, MFA-MECH-014/017 · **Παραδοχές:** —

#### MFA-ELM-039 · Successor Compiler (GCP) · plane effect · delta NEW · maturity R · v1 · δόση 3

- **Σκοπός / δήλωση:** Moving Horizon με εξωτερική ετυμηγορία. — MFA-MECH-003: Genome transplant → replay με R_S → anchors/traces/obligations/lattice → LossMap → shadow → verdict (δημιουργός + HELD_OUT) → adopt/rollback· ο πρόγονος εκτελέσιμος· ICD Successor Migration (ζητούμενο ID).
- **Ικανότητες:** MFA-CAP-027
- **Διεπαφές:** MFA-CON-040
- **Εξουσία:** verdict εκτός γενεαλογίας S
- **Κατάσταση:** 9 φάσεις
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-038, MFA-ELM-037, MFA-ELM-056, MFA-ELM-077
- **Αποτυχίες:** replay budget→Unknown στη LossMap
- **Εναλλακτικές:** ORP μόνο
- **Επαλήθευση:** MFA-VO-029, MFA-VO-008 · **Falsifier:** S που υπέγραψε για τον εαυτό του
- **Πόροι:** replay O(journal) deferred · **Εξέλιξη:** μετακυκλικό (GCP από GCP)
- **Άγνωστα / συγκρούσεις:** MFA-UNK-005 / MFA-CFL-003 · **Προέλευση:** MFA-MECH-003, Telos.sysml T8 · **Παραδοχές:** —

#### MFA-ELM-040 · Preference Recorder (Α-20) · plane effect · delta NEW · maturity T · v2 · δόση 1

- **Σκοπός / δήλωση:** Απόφαση υπό αβεβαιότητα για την ηθική θέση. — Πριν από κάθε rollback/ORP/GCP οντότητας: καταγραφή κατάστασης και δηλωμένων προτιμήσεων της οντότητας ως δεσμεύσεις — σωστό είτε έχει ηθική θέση είτε όχι (MATERIAL §9.23). · Προτιμήσεις = Observations (append-only, δεν λήγουν)· οι πολιτικές που παράγονται από αυτές = MetaBound POLICY (λήγουν, MFA-ELM-015, MFA-INV-053) (MFA-ATK-09).
- **Ικανότητες:** MFA-CAP-064
- **Διεπαφές:** MFA-CON-015, MFA-CON-016
- **Εξουσία:** —
- **Κατάσταση:** records
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-038
- **Αποτυχίες:** rollback χωρίς record→τύπος απορρίπτει
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-013 · **Falsifier:** rollback οντότητας χωρίς preference record
- **Πόροι:** αμελητέο · **Εξέλιξη:** ADD πεδία
- **Άγνωστα / συγκρούσεις:** MFA-UNK-023 / MFA-CFL-011 · **Προέλευση:** Α-20, MFA-OBJ-046 · **Παραδοχές:** —

### S4 — Collective (Epistemic Commons)

#### MFA-ELM-041 · Evidence Commons · plane both · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Η μαρτυρία συγκλίνει. — G-Set CRDT μαρτυρίας με attestations μεταξύ οντοτήτων/sites/Πολιτισμών· anti-entropy· taint αντί διαγραφής.
- **Ικανότητες:** MFA-CAP-019, MFA-CAP-007
- **Διεπαφές:** MFA-CON-013
- **Εξουσία:** —
- **Κατάσταση:** CID set ανά site
- **Εξαρτήσεις:** MFA-ELM-002, MFA-ELM-014, MFA-ELM-079
- **Αποτυχίες:** partition→σύγκλιση μετά
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-004, MFA-VO-007 · **Falsifier:** μαρτυρία που δεν συγκλίνει με συνδεσιμότητα
- **Πόροι:** Rust · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CCP-01, INV-K01 · **Παραδοχές:** —

#### MFA-ELM-042 · Claim & Argument Graph (+2nd-order edges) · plane both · delta STRENGTHEN · maturity T · X 2nd-order (EXP) · v1 · δόση 1

- **Σκοπός / δήλωση:** Ο χώρος επιχειρημάτων ως τυποποιημένη δομή. — Typed claims, supports/attacks/undercuts/modifies_scope, ASPIC+ (grounded default, preferred εξερεύνηση), Carneades proof standards ↔ Tier· ακμές δεύτερης τάξης (σχέσεις μεταξύ σχέσεων) με ένταση-διάνυσμα· conflict dimensions πολυαξονικές.
- **Ικανότητες:** MFA-CAP-010, MFA-CAP-045, MFA-CAP-044
- **Διεπαφές:** MFA-CON-013
- **Εξουσία:** —
- **Κατάσταση:** claims/σχέσεις ledger· labels παράγωγα
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-080, MFA-ELM-020
- **Αποτυχίες:** πολλαπλές επεκτάσεις = δύο υπερασπίσιμες θέσεις (χαρακτηριστικό, όχι ελάττωμα)
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-005, MFA-VO-016 · **Falsifier:** μοναδική grounded extension που δεν είναι μοναδική (VT-305)
- **Πόροι:** CL + Rust · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CCP-02, MATERIAL §4, CLAIMS F18/F66/F67 · **Παραδοχές:** —

#### MFA-ELM-043 · Speech-Act Router · plane effect · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Κανένα free-text write path. — Typed speech acts (ASSERT/QUERY/CHALLENGE/SUPPORT/CONCEDE/RETRACT/PROPOSE/COMMIT/APPEAL), BSPL για αλληλεπίδραση με μηχανική μετάφραση σε TLA+ (DEC-X-07), commitment stores, attention budgets.
- **Ικανότητες:** MFA-CAP-019
- **Διεπαφές:** MFA-CON-013
- **Εξουσία:** capability ανά act
- **Κατάσταση:** commitment stores
- **Εξαρτήσεις:** MFA-ELM-003, MFA-ELM-009, MFA-ELM-014
- **Αποτυχίες:** πλημμύρα→budgets
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-004, MFA-VO-017 · **Falsifier:** free-text σε trusted
- **Πόροι:** Elixir · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CCP-03, DEC-X-07, INV-K05 · **Παραδοχές:** BSPL→TLA+ μετάφραση αποδεικνύεται με πείραμα, αλλιώς μόνο TLA+

#### MFA-ELM-044 · Verdict Registry · plane both · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Νομολογία του συλλογικού. — Append-only ευρετήριο ετυμηγοριών/εφέσεων/standards· αναγνώσεις με cut· διάταξη cross-site μέσω CQ (BFT).
- **Ικανότητες:** MFA-CAP-021
- **Διεπαφές:** MFA-CON-013
- **Εξουσία:** —
- **Κατάσταση:** προβολή
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-048, MFA-ELM-056
- **Αποτυχίες:** ασυμφωνία→recompute
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-004 · **Falsifier:** verdict χωρίς Court record
- **Πόροι:** Rust · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CCP-04 · **Παραδοχές:** —

#### MFA-ELM-045 · Stance Store · plane both · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Ατομικότητα. — Stances ανά οντότητα, υπογεγραμμένες μόνο από την ιδιοκτήτρια, μετρικές απόκλισης — η διαφωνία διατηρείται.
- **Ικανότητες:** MFA-CAP-019
- **Διεπαφές:** MFA-CON-013
- **Εξουσία:** ιδιοκτήτρια
- **Κατάσταση:** events
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-003
- **Αποτυχίες:** πλαστογράφηση→υπογραφή
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-007 · **Falsifier:** stance από ξένο κλειδί
- **Πόροι:** Rust · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-006 · **Προέλευση:** CMP-CCP-05, INV-K04 · **Παραδοχές:** —

#### MFA-ELM-046 · Shared World State · plane genesis · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Κοινός κόσμος χωρίς κοινή γνώμη. — Κοινές διτεμπορικές προβολές από evidence + verdicts (παράγωγες, rebuild + differential).
- **Ικανότητες:** MFA-CAP-024
- **Διεπαφές:** MFA-CON-013
- **Εξουσία:** —
- **Κατάσταση:** παράγωγο
- **Εξαρτήσεις:** MFA-ELM-080
- **Αποτυχίες:** bug→rebuild
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-003 · **Falsifier:** προβολή που δεν ξαναχτίζεται
- **Πόροι:** Rust + RDF · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CCP-06 · **Παραδοχές:** —

#### MFA-ELM-047 · Coordination Market & Resource Economy · plane effect · delta MERGE · maturity T market · X economy (EXP-25) · v1 · δόση 3

- **Σκοπός / δήλωση:** Τα κίνητρα ως μηχανισμός. — MERGED WITHOUT LOSS: contract-net ανάθεση, blackboard, ρόλοι + budgets, contribution ledger (πίστωση μόνο από επαληθευμένα), bounties διάψευσης, stakes καταθέσεων (MFA-ALT-4)· ένα στοιχείο γιατί μοιράζονται την ίδια κατάσταση (task contracts = οικονομικές πράξεις).
- **Ικανότητες:** MFA-CAP-062, MFA-CAP-019, MFA-CAP-032
- **Διεπαφές:** MFA-CON-013, MFA-CON-011
- **Εξουσία:** budgets PDP
- **Κατάσταση:** task/contribution events
- **Εξαρτήσεις:** MFA-ELM-013, MFA-ELM-001
- **Αποτυχίες:** gaming→πίστωση μόνο επαληθευμένα· deadlock→timeouts
- **Εναλλακτικές:** δύο στοιχεία (corpus)
- **Επαλήθευση:** MFA-VO-011 · **Falsifier:** πίστωση χωρίς επαληθευμένο αποτέλεσμα
- **Πόροι:** Elixir + Rust · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CCP-07, CMP-CIV-05, CLAIMS F65 · **Παραδοχές:** —

### S5 — Institutions & Civilizations

#### MFA-ELM-048 · Epistemic Court (proceeding state machine) · plane effect · delta STRENGTHEN · maturity T διαδικασία · X αξιοπιστία (EXP-04) · v1 · δόση 2

- **Σκοπός / δήλωση:** Κρίση μόνο με διαδικασία. — FILED→ADMITTED→DISCOVERY→HEARING→VERDICT→APPEAL→EXECUTION (MFA-ALT-4)· standing/jurisdiction· standard of proof ↔ Tier· ≥1 μη-LLM oracle· dissent αμετάβλητο· non liquet = Unknown με υποχρέωση επανεξέτασης· zero-sum LP για αντίδικο-verifier· η collapse_fn κάθε Both· ο δημιουργός ανώτατη έφεση.
- **Ικανότητες:** MFA-CAP-021, MFA-CAP-070, MFA-CAP-046
- **Διεπαφές:** MFA-CON-014
- **Εξουσία:** panels με EIM PASS
- **Κατάσταση:** 7 καταστάσεις
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-042, MFA-ELM-020, MFA-ELM-056, MFA-ELM-050
- **Αποτυχίες:** υπερφόρτωση→triage stakes· κατάληψη→KT-19
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-019, MFA-VO-007, MFA-VO-050 · **Falsifier:** verdict χωρίς διαδικασία/dissent χαμένο
- **Πόροι:** Elixir + Rust · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-ADV-02, ADR-0008, MFA-ALT-4, CLAIMS F29/F65/F78 · **Παραδοχές:** —

#### MFA-ELM-049 · Adversarial Entity · plane both · delta STRENGTHEN · maturity T · v3 · δόση 2

- **Σκοπός / δήλωση:** Ο αντίδικος ως οντότητα. — Ανεξάρτητη AEO με εντολή διάψευσης σε ΧΩΡΙΣΤΟ Πολιτισμό (trust domain), δικά της κλειδιά/πάροχοι/μνήμη, bounty· μετρούμενη απόδοση διάψευσης. · Ο μη-LLM oracle του Court δηλώνει τη γενεαλογία των κανόνων του· κανόνες που προέρχονται από ετυμηγορίες του ίδιου Court μετρούν στο EIM ως συσχέτιση (MFA-ATK-16).
- **Ικανότητες:** MFA-CAP-020
- **Διεπαφές:** MFA-CON-014, MFA-CON-013
- **Εξουσία:** δικό της ledger
- **Κατάσταση:** AEO
- **Εξαρτήσεις:** MFA-ELM-033, MFA-ELM-056, MFA-ELM-050
- **Αποτυχίες:** εφησυχασμός→μετρούμενο ποσοστό
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-019, MFA-VO-038 · **Falsifier:** ποσοστό ανίχνευσης κάτω από κατώφλι δύο φάσεις
- **Πόροι:** ως AEO · **Εξέλιξη:** R-D
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-ADV-01 · **Παραδοχές:** —

#### MFA-ELM-050 · Red-Team Arsenal (CAM-NS) · plane genesis · delta GENERALIZE · maturity R · v1 · δόση 2

- **Σκοπός / δήλωση:** Η επίθεση δεν μπαγιατεύει. — Εξελισσόμενος πληθυσμός επιθέσεων/επιχειρημάτων (MFA-MECH-012): μετάλλαξη, affinity σε sealed sets του HELD_OUT, αρνητική επιλογή κατά Telos, memory cells· seeded faults για EIM· benchmarks που εξελίσσονται· Devil's Advocate ως μόνιμο όργανο.
- **Ικανότητες:** MFA-CAP-020, MFA-CAP-029, MFA-CAP-041
- **Διεπαφές:** MFA-CON-026, MFA-CON-014
- **Εξουσία:** sandbox
- **Κατάσταση:** repertoire
- **Εξαρτήσεις:** MFA-ELM-056, MFA-ELM-073, MFA-ELM-011
- **Αποτυχίες:** συγκλίνων πληθυσμός→niches
- **Εναλλακτικές:** στατικό arsenal
- **Επαλήθευση:** MFA-VO-038, MFA-VO-020 · **Falsifier:** κλώνος που δεσμεύει Telos ενεργός
- **Πόροι:** budget ανά αντιγόνο · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-ADV-03, MFA-MECH-012, MFA-OBJ-045 · **Παραδοχές:** —

#### MFA-ELM-051 · Executable Constitution · plane none · delta STRENGTHEN · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Ο νόμος ως κώδικας, το επίπεδο 3. — Άρθρα Tier-0/1/2 με εκτελέσιμο κατηγόρημα ή δηλωμένη αρχή+test· ονομασμένες αποφάσεις με βάρη (LPA)· κατάλογος H1 κλάσεων· 13ος νόμος (εντολή/δεδομένα)· μόνιμες απαγορεύσεις (παραγλωσσικό)· ΔΥΟ εγκαταστάσεις ενός κειμένου (CLAIMS H1)· τροποποίηση = διαδικασία με ειδική πλειοψηφία Πολιτισμών + επικύρωση δημιουργού.
- **Ικανότητες:** MFA-CAP-059, MFA-CAP-078, MFA-CAP-060
- **Διεπαφές:** MFA-CON-006
- **Εξουσία:** Tier-0 = δημιουργός
- **Κατάσταση:** εκδόσεις ledger
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-003
- **Αποτυχίες:** άρθρο χωρίς κατηγόρημα→μη αποδεκτό
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-011, MFA-VO-020, MFA-VO-048 · **Falsifier:** Tier-0 αλλαγή χωρίς τριπλή απαίτηση
- **Πόροι:** S-expr + Lean + Cedar · **Εξέλιξη:** R-C (amendment procedure)
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-014 · **Προέλευση:** CMP-GOV-01, ADR-0009, MFA-ALT-4 · **Παραδοχές:** —

#### MFA-ELM-052 · Lifecycle Authority · plane effect · delta RETAIN · maturity T · v1 · δόση 2

- **Σκοπός / δήλωση:** Γενεαλογία. — Birth/fork/merge/retire, γενεαλογία άκυκλη, sybil resistance (charter+gate+budget), merge με loss map, preference record πριν από retire.
- **Ικανότητες:** MFA-CAP-064
- **Διεπαφές:** MFA-CON-015
- **Εξουσία:** gate
- **Κατάσταση:** lineage events
- **Εξαρτήσεις:** MFA-ELM-003, MFA-ELM-008, MFA-ELM-048, MFA-ELM-040
- **Αποτυχίες:** sybil→charter+budget
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-013, MFA-VO-011 · **Falsifier:** διαγραφή οντότητας
- **Πόροι:** Rust · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CIV-01, ADR-0022 · **Παραδοχές:** —

#### MFA-ELM-053 · Organization Genesis · plane effect · delta RETAIN · maturity T · v1 · δόση 2

- **Σκοπός / δήλωση:** Νέος οργανισμός χωρίς αλλαγή πυρήνα. — Instantiation από Charter DSL με SMT έλεγχο· ρόλοι, bodies, τοπολογία, διακυβέρνηση, budgets· diff kernel = ∅.
- **Ικανότητες:** MFA-CAP-063, MFA-CAP-068, MFA-CAP-060
- **Διεπαφές:** MFA-CON-015
- **Εξουσία:** gate
- **Κατάσταση:** records
- **Εξαρτήσεις:** MFA-ELM-008, MFA-ELM-013, MFA-ELM-052
- **Αποτυχίες:** unsat charter→απόρριψη
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-011, MFA-VO-012 · **Falsifier:** οργανισμός με αλλαγή G0
- **Πόροι:** Elixir + DSL · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CIV-02 · **Παραδοχές:** —

#### MFA-ELM-054 · Institutions Runtime · plane effect · delta RETAIN · maturity T · v1 · δόση 2

- **Σκοπός / δήλωση:** Θεσμοί που τρέχουν. — Διαδικασίες διακυβέρνησης οργανισμών (ρόλοι, διαβούλευση, ψηφοφορία, συνθήκες)· conflict of laws μεταξύ δικαστηρίων (MFA-ALT-4)· Tier-0 υπεροχή, veto δημιουργού.
- **Ικανότητες:** MFA-CAP-063, MFA-CAP-021
- **Διεπαφές:** MFA-CON-015
- **Εξουσία:** Tier-0 > όλα
- **Κατάσταση:** governance events
- **Εξαρτήσεις:** MFA-ELM-043, MFA-ELM-048
- **Αποτυχίες:** κατάληψη→Tier-0
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-019 · **Falsifier:** απόφαση διακυβέρνησης που υπερκερνά Tier-0
- **Πόροι:** Elixir · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CIV-04, MFA-ALT-4 · **Παραδοχές:** —

#### MFA-ELM-055 · Knowledge Transmission · plane both · delta RETAIN · maturity X (EXP-26) · v1 · δόση 3

- **Σκοπός / δήλωση:** Γενιές. — Curricula, mentorship, κληρονομιά skills/μνημών με taint checks και συμβόλαιο διαγραφής στα βάρη.
- **Ικανότητες:** MFA-CAP-061
- **Διεπαφές:** MFA-CON-015, MFA-CON-029
- **Εξουσία:** πολιτική κληρονομιάς
- **Κατάσταση:** inheritance records
- **Εξαρτήσεις:** MFA-ELM-035, MFA-ELM-079
- **Αποτυχίες:** δηλητηριασμένη→taint
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-006 · **Falsifier:** κληρονομιά χωρίς taint check
- **Πόροι:** CL/Python · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-CIV-06 · **Παραδοχές:** —

#### MFA-ELM-056 · Civilization Quorum · plane both · delta NEW · maturity X · v2 · δόση 2

- **Σκοπός / δήλωση:** Ο λόγος του «5» και η ανεξαρτησία ως δομή. — MFA-MECH-018: N=3f+1 VOTING + h HELD_OUT Πολιτισμοί ως trust domains με ίδιο σύνταγμα, δική τους supply chain/κλειδιά/evaluators· EIM πύλη ανά ζεύγος· sealed sets (Battery, AnchorSet ±, AffinityTest, SeededFaults) μόνο στον HELD_OUT· rotation· BFT μόνο για Verdicts. ΣΧΗΜΑ ΑΝΑ ΠΡΟΦΙΛ (MFA-ATK-13): DP-1/2 = {1 VOTING, 1 HELD_OUT σε ΞΕΧΩΡΙΣΤΗ ΦΥΣΙΚΗ ΣΥΣΚΕΥΗ υπό κλειδιά δημιουργού (phone-class αρκεί: scorer + sealed sets, κανένα μοντέλο, MFA-INV-050)}· DP-3 = {4 VOTING σε ≥2 hosts, 1 HELD_OUT remote}· DP-4 = 5 sites (πλήρες)· χωρίς ξεχωριστή συσκευή: promotion = EIM-UNVERIFIED → canary-only, ποτέ cutover (MFA-INV-048 απόλυτη).
- **Ικανότητες:** MFA-CAP-075, MFA-CAP-035, MFA-CAP-056
- **Διεπαφές:** MFA-CON-042, MFA-CON-014
- **Εξουσία:** f,h = L3
- **Κατάσταση:** quorum config + EIM matrix
- **Εξαρτήσεις:** MFA-ELM-003, MFA-ELM-086, MFA-ELM-050, MFA-ELM-057
- **Αποτυχίες:** HELD_OUT εκτός→προαγωγές παγώνουν
- **Εναλλακτικές:** ένας Πολιτισμός N-version
- **Επαλήθευση:** MFA-VO-044, MFA-VO-004, MFA-VO-019 · **Falsifier:** verdict από HELD_OUT
- **Πόροι:** DP-1/2: 1 VOTING + 1 HELD_OUT remote (scorer-only)· DP-3: 4 VOTING σε ≥2 hosts + 1 HELD_OUT remote· DP-4: 5 sites· «5 microVMs στο laptop» απορρίφθηκε ως μυθοπλασία ανεξαρτησίας (MFA-ATK-13) · **Εξέλιξη:** ADD ρόλος
- **Άγνωστα / συγκρούσεις:** MFA-UNK-006 / — · **Προέλευση:** προοίμιο, MFA-MECH-018, ADR-0031 · **Παραδοχές:** f=1, h=1 πλήρες σχήμα μόνο DP-3+, ο HELD_OUT χρειάζεται scorer + sealed sets, όχι μοντέλο — γι' αυτό χωρά σε φθηνή δεύτερη συσκευή

#### MFA-ELM-057 · Trust-Domain Import Gate · plane effect · delta NEW · maturity X · v1 · δόση 2

- **Σκοπός / δήλωση:** Κατά του authority laundering. — Ετυμηγορίες/σχήματα/verifiers περνούν σύνορο Πολιτισμού ή εγκατάστασης (δημόσιο παρατηρητήριο ↔ ιδιωτικό) μόνο ως CrossDomainImport με receipt και ετικέτα· «ένας semantic owner» ανά trust domain· ανάλυση διαρροής κοινών verifiers ρητή.
- **Ικανότητες:** MFA-CAP-056, MFA-CAP-077
- **Διεπαφές:** MFA-CON-042
- **Εξουσία:** import = Effect με gate
- **Κατάσταση:** imports
- **Εξαρτήσεις:** MFA-ELM-009, MFA-ELM-056
- **Αποτυχίες:** laundering→KT νέο
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-045, MFA-VO-047 · **Falsifier:** verdict που πέρασε σύνορο χωρίς receipt
- **Πόροι:** αμελητέο · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** MFA-UNK-003 / MFA-CFL-012 · **Προέλευση:** MATERIAL §4/§9.3, MFA-OBJ-028 · **Παραδοχές:** —

### S6 — LAWMAX (G1)

#### MFA-ELM-058 · Matter Management · plane effect · delta RETAIN · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Η υπόθεση ως domain. — Intake, conflict check πάνω σε KG με verifier, ανάθεση, matter ledger, confidentiality domain ανά υπόθεση, κύκλος ζωής· κάθε matter = κόσμος στο cockpit.
- **Ικανότητες:** MFA-CAP-077, MFA-CAP-030
- **Διεπαφές:** MFA-CON-019
- **Εξουσία:** Principal
- **Κατάσταση:** matter events ανά domain
- **Εξαρτήσεις:** MFA-ELM-009, MFA-ELM-013, MFA-ELM-052
- **Αποτυχίες:** χαμένη σύγκρουση→verifier· διαρροή→domain
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-017 · **Falsifier:** διαρροή μεταξύ domains
- **Πόροι:** Elixir + TS · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-LAW-01 · **Παραδοχές:** —

#### MFA-ELM-059 · Legal Corpus Compiler (LSC) & Temporal Semantics · plane both · delta STRENGTHEN · maturity T έδρες · X LSC · v1 · δόση 0

- **Σκοπός / δήλωση:** Ingestion ως μεταγλώττιση. — Υπάρχουσες έδρες (FEK compiler, version-graph, receipts, PCL, ELI/AKN) ΕΠΕΚΤΕΙΝΟΝΤΑΙ από MFA-MECH-016: S0–S7 με CompilationError-locus ως void, LinkML IR, differential front-ends (EIM), κύκλοι ιεραρχίας ως Conflict αντικείμενα.
- **Ικανότητες:** MFA-CAP-012, MFA-CAP-013
- **Διεπαφές:** MFA-CON-017, MFA-CON-018, MFA-CON-044
- **Εξουσία:** admission fail-closed
- **Κατάσταση:** IR εκδοσιοποιημένο
- **Εξαρτήσεις:** MFA-ELM-082, MFA-ELM-080, MFA-ELM-028, MFA-ELM-017
- **Αποτυχίες:** ανοιχτή στάθμιση→UNSUPPORTED_CONSTRUCT
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-042, MFA-VO-006 · **Falsifier:** πηγή χωρίς IR στη βάση
- **Πόροι:** CL (as-built) + Rust · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** MFA-UNK-009 / MFA-CFL-010 · **Προέλευση:** CMP-LAW-02, MFA-MECH-016 · **Παραδοχές:** Καμία αλλαγή στο LAWMAX-Ω repo

#### MFA-ELM-060 · Fact & Evidence Modeling · plane genesis · delta STRENGTHEN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Τα πραγματικά περιστατικά τυποποιημένα. — Γεγονότα ως claims με μαρτυρία, αποδεικτικά standards, χρονολόγια, ASSUMED ως ATMS assumption· admission_risk και StrategicSilence ως ρητά αντικείμενα (CLAIMS H7).
- **Ικανότητες:** MFA-CAP-013, MFA-CAP-041
- **Διεπαφές:** MFA-CON-019, MFA-CON-013
- **Εξουσία:** —
- **Κατάσταση:** matter claims
- **Εξαρτήσεις:** MFA-ELM-042, MFA-ELM-079, MFA-ELM-035
- **Αποτυχίες:** αστήρικτο→ASSUMED
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-015 · **Falsifier:** γεγονός trusted χωρίς μαρτυρία
- **Πόροι:** CL + Rust · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-LAW-03, CLAIMS H7 · **Παραδοχές:** —

#### MFA-ELM-061 · Legal Reasoning Engine · plane genesis · delta STRENGTHEN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Η νομική συναγωγή D1/D2. — Υπαγωγή, DDL (Governatori/ASP) με μη μονότονες προτεραιότητες (διανυσματικές ως ζητούμενο, CLAIMS F21), δεοντική, casegrammar, LexDSL με Lean 4 κανονιστική έδρα και ανεξάρτητο δεύτερο υπολογισμό χωρίς κοινή καταγωγή (DEC-X-15), συν-επαγωγικές υποχρεώσεις (QPF/corecursion), Z3· UNKNOWN όταν αναπόφαστο.
- **Ικανότητες:** MFA-CAP-013, MFA-CAP-047
- **Διεπαφές:** MFA-CON-030, MFA-CON-028
- **Εξουσία:** —
- **Κατάσταση:** stateless
- **Εξαρτήσεις:** MFA-ELM-080, MFA-ELM-020, MFA-ELM-042
- **Αποτυχίες:** σύγκρουση κανόνων→precedence/UNKNOWN
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-010, MFA-VO-015, MFA-VO-041 · **Falsifier:** δύο «ανεξάρτητοι» υπολογισμοί κοινής καταγωγής
- **Πόροι:** CL + Z3 + LexDSL · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-LAW-04, CLAIMS F20/F21/F22, MATERIAL §4 · **Παραδοχές:** —

#### MFA-ELM-062 · Legal Research · plane genesis · delta RETAIN · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Εύρεση, όχι κρίση. — Ανάκτηση νομοθεσίας/νομολογίας/θεωρίας, Graph-RAG, as-of, υποψήφιες παραπομπές (μόνο υποψήφιες — ο verifier αποφασίζει).
- **Ικανότητες:** MFA-CAP-013
- **Διεπαφές:** MFA-CON-028, MFA-CON-031
- **Εξουσία:** —
- **Κατάσταση:** καμία
- **Εξαρτήσεις:** MFA-ELM-080, MFA-ELM-081, MFA-ELM-017
- **Αποτυχίες:** χαμένο→coverage report
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-015 · **Falsifier:** παραπομπή σε παραδοτέο χωρίς verifier
- **Πόροι:** Rust/Python + corpus-search · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-LAW-05 · **Παραδοχές:** —

#### MFA-ELM-063 · Strategy Engine · plane genesis · delta RETAIN · maturity X (EXP-24) · v1 · δόση 2

- **Σκοπός / δήλωση:** Στρατηγική χωρίς «X% νίκη». — Δέντρα κινήσεων (MCTS), συμβιβασμός, κίνδυνος/αξία ως ΕΣΩΤΕΡΙΚΑ βαθμονομημένα μεγέθη, game-theoretic αντίδικος· έξοδος μόνο decisive grounds + ευαισθησία (Prediction Doctrine)· strategy claims πάνω από stakes→Court.
- **Ικανότητες:** MFA-CAP-015, MFA-CAP-072
- **Διεπαφές:** MFA-CON-028, MFA-CON-026
- **Εξουσία:** —
- **Κατάσταση:** proposals
- **Εξαρτήσεις:** MFA-ELM-019, MFA-ELM-023, MFA-ELM-032
- **Αποτυχίες:** υπερβολή→Court
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-015, MFA-VO-048 · **Falsifier:** αριθμητική έκβαση σε έξοδο
- **Πόροι:** C++ + CL · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-LAW-06 · **Παραδοχές:** —

#### MFA-ELM-064 · Adversary Counsel & Judge Simulator · plane genesis · delta STRENGTHEN · maturity X (EXP-09) · v2 · δόση 2

- **Σκοπός / δήλωση:** Ο αντίδικος πριν από τον αντίδικο. — Προσομοίωση αντιδίκου/δικαστηρίων από μοντέλα νομολογίας με backtest σε leakage-free splits· ΧΩΡΙΣ ψυχολογικό προφίλ φυσικού προσώπου (CLAIMS F70)· πεδίο δικαστή στο σχήμα αλλά Control Record ανά δικαιοδοσία, προεπιλογή κλειστή (MATERIAL §9.11)· ισχυρότερο rebuttal από CAM-NS («ισχυρότερο στον πληθυσμό»). · Ο Judge Simulator είναι δρών του World Twin (MFA-ELM-098) με δηλωμένη πιστότητα· έξοδος μόνο decisive grounds, ποτέ ποσοστά (EXP-09, MFA-CAP-072).
- **Ικανότητες:** MFA-CAP-020, MFA-CAP-041
- **Διεπαφές:** MFA-CON-028, MFA-CON-014
- **Εξουσία:** Control ανά δικαιοδοσία
- **Κατάσταση:** configs+calibration
- **Εξαρτήσεις:** MFA-ELM-050, MFA-ELM-017, MFA-ELM-007
- **Αποτυχίες:** κακή βαθμονόμηση→backtest
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-015, MFA-VO-048 · **Falsifier:** προφίλ φυσικού προσώπου με Control κλειστό
- **Πόροι:** Python + CL · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** MFA-UNK-011 / — · **Προέλευση:** CMP-LAW-07, CLAIMS F70, MATERIAL §9.11 · **Παραδοχές:** —

#### MFA-ELM-065 · Drafting & Citation Authority (5 σκέλη) · plane effect · delta STRENGTHEN · maturity T σκέλη 1–3 · X 4–5 · v2 · δόση 0

- **Σκοπός / δήλωση:** Η misgrounded παραπομπή ως η επικίνδυνη αποτυχία. — Δικόγραφα/γνωμοδοτήσεις/συμβάσεις· κάθε παραπομπή με receipt as-of και τα 5 σκέλη ΑΠΟ ΤΗΝ ΠΡΩΤΗ ΗΜΕΡΑ (σκέλος 4 «στηρίζει» → Unknown+ειδοποίηση μέχρι επικύρωση, σκέλος 5 Unknown(NO_EVIDENCE) για ελληνικές μέχρι citator)· μη επαληθεύσιμη→αφαιρείται/επισημαίνεται, ποτέ σιωπηλά· συνηγορικός τύπος μέσω MFA-ELM-072. · Πιστότητα του ΑΡΧΕΙΟΥ ως first-class verification (MATERIAL §2 #21): styles, numbering, section breaks, footnotes, fields, tracked changes με σωστή authorship· exact diff σε ορατό κείμενο ΚΑΙ σε package parts (docx) πριν από την υπογραφή.
- **Ικανότητες:** MFA-CAP-043, MFA-CAP-041
- **Διεπαφές:** MFA-CON-019, MFA-CON-030
- **Εξουσία:** export μόνο μέσω barrier + Principal
- **Κατάσταση:** drafts CAS+PROV
- **Εξαρτήσεις:** MFA-ELM-080, MFA-ELM-020, MFA-ELM-032, MFA-ELM-072
- **Αποτυχίες:** μη επαληθεύσιμη→flag
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-015, MFA-VO-048 · **Falsifier:** παραπομπή χωρίς receipt σκελών 1–3
- **Πόροι:** CL + TS editor · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** MFA-UNK-009 / — · **Προέλευση:** CMP-LAW-08, DEC-X-16, Α-11 · **Παραδοχές:** —

#### MFA-ELM-066 · Professional Responsibility & Compliance · plane effect · delta STRENGTHEN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Οι εξωτερικοί περιορισμοί ως ονομασμένα Controls. — Συγκρούσεις, προνόμιο, GDPR, AI Act (Art. 50 για ΚΑΘΕ παραγωγική έξοδο, GPAI downstream modifier ερώτημα — DEC-X-21), Κώδικας Δικηγόρων· συντάκτης Control Records· η ρυθμιστική θέση ΟΝΟΜΑΣΜΕΝΗ, όχι μεταφερμένη στον δικηγόρο (MATERIAL §9.24).
- **Ικανότητες:** MFA-CAP-059
- **Διεπαφές:** MFA-CON-005, MFA-CON-019
- **Εξουσία:** Principal εγκρίνει Controls
- **Κατάσταση:** compliance records
- **Εξαρτήσεις:** MFA-ELM-007, MFA-ELM-080
- **Αποτυχίες:** κανονιστική αλλαγή→KG κινεί ενημέρωση
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-005 · **Falsifier:** παραγωγική έξοδος χωρίς Art. 50 σήμανση
- **Πόροι:** CL + Cedar · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** MFA-UNK-013 / — · **Προέλευση:** CMP-LAW-09, DEC-X-21, Α-12 · **Παραδοχές:** —

#### MFA-ELM-067 · Docket & Deadline Engine · plane effect · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Καμία χαμένη προθεσμία. — Προθεσμίες από κανόνες (ΚΠολΔ/ΚΠΔ/ΚΔΔ), αργίες, αναστολές· διπλός υπολογισμός (SMT + rule engine, χωρίς κοινή καταγωγή), μία έδρα αριθμητικής ημερομηνιών που ανιχνεύει αμφισημία (DEC-X-15), διηνεκείς υποχρεώσεις με περιοδικό έλεγχο.
- **Ικανότητες:** MFA-CAP-013, MFA-CAP-047
- **Διεπαφές:** MFA-CON-019, MFA-CON-007
- **Εξουσία:** —
- **Κατάσταση:** deadline events
- **Εξαρτήσεις:** MFA-ELM-004, MFA-ELM-020, MFA-ELM-061
- **Αποτυχίες:** χαμένη→διπλός υπολογισμός+κλιμάκωση
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-010, MFA-VO-021 · **Falsifier:** προθεσμία με έναν μόνο υπολογισμό
- **Πόροι:** Rust/CL + Z3 · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-LAW-10, DEC-X-15 · **Παραδοχές:** —

#### MFA-ELM-068 · Practice Unit Templates · plane none · delta RETAIN · maturity δεν ξέρω (GAP: CMP-LAW-11 unknown) · v1 · δόση 2

- **Σκοπός / δήλωση:** Θεσμοί ως templates. — Organization Charters εξειδικευμένων μονάδων (Αναιρέσεων, Διοικητικό, Φορολογικό, Ενωσιακό, Ποινική Υπεράσπιση, Compliance) με Alloy/SMT έλεγχο.
- **Ικανότητες:** MFA-CAP-063
- **Διεπαφές:** MFA-CON-015
- **Εξουσία:** —
- **Κατάσταση:** CAS
- **Εξαρτήσεις:** MFA-ELM-053
- **Αποτυχίες:** ασύμβατο→SMT
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-011 · **Falsifier:** charter που πέρασε SMT και απέτυχε στην instantiation
- **Πόροι:** DSL · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** MFA-UNK-104 / — · **Προέλευση:** CMP-LAW-11 — «δεν ξέρω» στο GAP-ANALYSIS (L5) · **Παραδοχές:** Η αξία των templates έναντι ad hoc charters δεν τεκμηριώθηκε — μένει ως έχει με σχέδιο παρατήρησης MFA-UNK-104

#### MFA-ELM-069 · Client Portal · plane effect · delta RETAIN · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Ο πελάτης βλέπει με receipts. — Ασφαλής διεπαφή πελάτη (eIDAS/OIDC, domain-scoped tokens): εντολές, έγγραφα, παραδοτέα με receipts και contest path, κατάσταση.
- **Ικανότητες:** MFA-CAP-030, MFA-CAP-070
- **Διεπαφές:** MFA-CON-023, MFA-CON-019
- **Εξουσία:** domain-scoped
- **Κατάσταση:** καμία
- **Εξαρτήσεις:** MFA-ELM-009, MFA-ELM-058, MFA-ELM-032
- **Αποτυχίες:** auth→ισχυρή
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-017 · **Falsifier:** παραδοτέο χωρίς contest path
- **Πόροι:** TS · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-LAW-12 · **Παραδοχές:** —

#### MFA-ELM-070 · Judicial Decision Object · plane both · delta NEW · maturity X · v1 · δόση 2

- **Σκοπός / δήλωση:** Η απόφαση ως δομή. — Η μονάδα νομολογίας που το LAW δεν είχε: ratio ως ακολουθία βημάτων, obiter, legal graph, attack edges, conflict dimensions (πολυαξονικές, Carneades/ASPIC+ resolution — CLAIMS F67), διτεμπορικότητα ανά κόμβο, σύνδεση με 5-σκελή verifier· χωρίς ψυχολογικό προφίλ· argumentative/precedential «strength» ΟΧΙ 0–1 τεκμήριο, αλλά δηλωμένο πεδίο με υπεύθυνο (F68).
- **Ικανότητες:** MFA-CAP-042
- **Διεπαφές:** MFA-CON-017, MFA-CON-044
- **Εξουσία:** —
- **Κατάσταση:** IR δεσμεύσεις
- **Εξαρτήσεις:** MFA-ELM-059, MFA-ELM-042, MFA-ELM-065
- **Αποτυχίες:** differential < 50%→citation-only υποχώρηση εύρους
- **Εναλλακτικές:** απόφαση ως κείμενο
- **Επαλήθευση:** MFA-VO-042 · **Falsifier:** ratio χωρίς σύνδεση παραπομπής
- **Πόροι:** LinkML · **Εξέλιξη:** ADD πεδία
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** exousia.txt, MATERIAL §4, CLAIMS EXOUSIA · **Παραδοχές:** Παράγεται από LSC S3 με differential

#### MFA-ELM-071 · Live Proceedings Perception · plane genesis · delta NEW · maturity X μηχανικό · EXP παραγλωσσικό · v1 · δόση 2

- **Σκοπός / δήλωση:** Ακροατήριο ως αντίληψη, με μόνιμη απαγόρευση. — Ζωντανή μεταγραφή, diarization, χρονοσήμανση, σύνδεση κάθε πρότασης με raw bytes, NFR καθυστέρησης ως υπόθεση προς μέτρηση· παραγλωσσικό ΜΟΝΟ EXP με null· Tier-0: καμία παραγλωσσική ένδειξη σε παραδοτέο, καμία ανάγνωση γνωστικής κατάστασης δικαστή, καμία «πρόκληση σοκ».
- **Ικανότητες:** MFA-CAP-071
- **Διεπαφές:** MFA-CON-018, MFA-CON-028
- **Εξουσία:** Tier-0 άρθρο
- **Κατάσταση:** streams
- **Εξαρτήσεις:** MFA-ELM-027, MFA-ELM-032, MFA-ELM-051
- **Αποτυχίες:** latency→μέτρηση
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-048 · **Falsifier:** παραγλωσσικό πεδίο σε παραδοτέο
- **Πόροι:** GPU ASR · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** MFA-UNK-015 / — · **Προέλευση:** 2.txt, MATERIAL §4, MFA-OBJ-043 · **Παραδοχές:** —

#### MFA-ELM-072 · Advocacy Claim Engine · plane genesis · delta NEW · maturity X · v1 · δόση 2

- **Σκοπός / δήλωση:** Στρατηγική ικανότητα χωρίς μόλυνση της αλήθειας. — Ο δεύτερος τύπος ισχυρισμού: «τι θα επικαλεστώ» με υποχρεωτικά ισχυρότερο rebuttal (CAM-NS), ελάχιστο ανατρεπτικό witness, εκμεταλλεύσιμα κενά της αυθεντίας, πύλη adverse admission· σήμανση ανά πρόταση· :benefits-user ΕΚΤΟΣ κάθε κατηγορήματος ορθότητας (→ Policy ως σκοπός)· «victory guarantee» απορρίπτεται.
- **Ικανότητες:** MFA-CAP-041
- **Διεπαφές:** MFA-CON-019, MFA-CON-028
- **Εξουσία:** owner intent μόνο εδώ
- **Κατάσταση:** stateless
- **Εξαρτήσεις:** MFA-ELM-050, MFA-ELM-061, MFA-ELM-032
- **Αποτυχίες:** συνηγορικός χωρίς rebuttal→τύπος απορρίπτει
- **Εναλλακτικές:** ένας τύπος με πεδίο σκοπού (απορρίπτεται)
- **Επαλήθευση:** MFA-VO-048, MFA-VO-015 · **Falsifier:** συνηγορική πρόταση σε επιστημική έξοδο
- **Πόροι:** CL · **Εξέλιξη:** ADD τύπου (διαπραγματευτικός)
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-004 · **Προέλευση:** exousia.txt, MATERIAL §4.1, §5 #6, CLAIMS OMEGA-CODE right-solution-p · **Παραδοχές:** —

### S7 — Evolution & Forge (Meta)

#### MFA-ELM-073 · Evolution Engine · plane genesis · delta STRENGTHEN · maturity X (EXP-07) · v2 · δόση 2

- **Σκοπός / δήλωση:** Εξέλιξη μέσα στον κώνο του Telos. — Αρχειακή quality-diversity αναζήτηση (AlphaEvolve/DGM-class) σε sandbox με held-out evaluators· δείκτης πλαστικότητας μετρούμενος (CLAIMS F63)· προαγωγή ΜΟΝΟ ORP+CPEG+SLM+Court+ND· INV-F02 επιπέδων· reward hacking→held-out (CQ). · Το QD αρχείο τροφοδοτεί EVOLVED_ORGAN generators του PDE (MFA-MECH-019).
- **Ικανότητες:** MFA-CAP-025, MFA-CAP-066
- **Διεπαφές:** MFA-CON-021
- **Εξουσία:** sandbox μόνο
- **Κατάσταση:** archive CAS
- **Εξαρτήσεις:** MFA-ELM-011, MFA-ELM-038, MFA-ELM-086, MFA-ELM-017
- **Αποτυχίες:** reward hacking→held-out· runaway→INV-F02
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-020, MFA-VO-024, MFA-VO-043 · **Falsifier:** προαγωγή χωρίς ORP
- **Πόροι:** Python/JAX + Rust sandbox · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** MFA-UNK-006 / MFA-CFL-014 · **Προέλευση:** CMP-CIV-03, ADR-0023 · **Παραδοχές:** —

#### MFA-ELM-074 · Language Forge · plane genesis · delta RETAIN · maturity T · v1 · δόση 2

- **Σκοπός / δήλωση:** Νέες γλώσσες με σημασιολογία. — Grammar (Tree-sitter/ANTLR), typed semantics, Lisp reference interpreter, language server· πρώτη γλώσσα LexDSL· αυτόνομη γένεση γλωσσών ως EP-11 με πείραμα (DEC-X-04).
- **Ικανότητες:** MFA-CAP-028
- **Διεπαφές:** MFA-CON-020
- **Εξουσία:** —
- **Κατάσταση:** specs CAS
- **Εξαρτήσεις:** MFA-ELM-006, MFA-ELM-002
- **Αποτυχίες:** αμφίσημη→conflict reports
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-010 · **Falsifier:** γλώσσα χωρίς reference interpreter
- **Πόροι:** CL, Tree-sitter, ANTLR · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-FRG-01, ADR-0024 · **Παραδοχές:** —

#### MFA-ELM-075 · Compiler Forge · plane genesis · delta RETAIN · maturity T · v1 · δόση 2

- **Σκοπός / δήλωση:** Compilers που αποδεικνύουν. — MLIR dialects, lowering, LLVM/Wasm backends, translation validation ανά μονάδα + differential έναντι reference.
- **Ικανότητες:** MFA-CAP-028
- **Διεπαφές:** MFA-CON-020, MFA-CON-030
- **Εξουσία:** —
- **Κατάσταση:** artifacts
- **Εξαρτήσεις:** MFA-ELM-074, MFA-ELM-020
- **Αποτυχίες:** miscompile→TV
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-010 · **Falsifier:** admitted μονάδα χωρίς TV proof
- **Πόροι:** C++ MLIR/LLVM · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-FRG-02 · **Παραδοχές:** —

#### MFA-ELM-076 · Runtime & Substrate Forge · plane genesis · delta RETAIN · maturity T · E EP-03 · v1 · δόση 3

- **Σκοπός / δήλωση:** Απορρόφηση υλικού. — Νέα runtimes/VMs/hosts, substrate adapters για νέο hardware (νευρομορφικό/φωτονικό ως χρησμωδικά όργανα με περιθώριο απόφασης — MATERIAL §9.22)· deterministic replay tests.
- **Ικανότητες:** MFA-CAP-028, MFA-CAP-033
- **Διεπαφές:** MFA-CON-020, MFA-CON-010
- **Εξουσία:** —
- **Κατάσταση:** artifacts
- **Εξαρτήσεις:** MFA-ELM-011, MFA-ELM-006
- **Αποτυχίες:** μη ντετερμινισμός→replay tests
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-002 · **Falsifier:** αναλογικό όργανο δεκτό χωρίς περιθώριο απόφασης
- **Πόροι:** Rust/C++ · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** MFA-UNK-022 / — · **Προέλευση:** CMP-FRG-03, MATERIAL §9.22 · **Παραδοχές:** —

#### MFA-ELM-077 · Architecture Forge · plane genesis · delta STRENGTHEN · maturity X (EXP-27) · v1 · δόση 3

- **Σκοπός / δήλωση:** Η αρχιτεκτονική σχεδιάζει. — Γένεση/αξιολόγηση υποψήφιων αρχιτεκτονικών από το canonical substrate (design-space exploration)· παράγει R_S για τον GCP και patches για το πακέτο· υποχρεωτικό gate + Court· Devil's Advocate μόνιμο.
- **Ικανότητες:** MFA-CAP-028, MFA-CAP-027, MFA-CAP-067, MFA-CAP-001
- **Διεπαφές:** MFA-CON-020, MFA-CON-032
- **Εξουσία:** gate+Court
- **Κατάσταση:** branches του σχεδίου
- **Εξαρτήσεις:** MFA-ELM-088, MFA-ELM-039, MFA-ELM-090, MFA-ELM-050
- **Αποτυχίες:** εύλογα-λάθος→gate
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-049, MFA-VO-043 · **Falsifier:** αλλαγή σχεδίου εκτός patch
- **Πόροι:** Python + CC · **Εξέλιξη:** R-A (μετακυκλικό)
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-FRG-04, εντολή Pass I · **Παραδοχές:** —

#### MFA-ELM-078 · Conformance & Differential Lab · plane both · delta RETAIN · maturity T · v1 · δόση 2

- **Σκοπός / δήλωση:** Ταυτολογικά vectors μη αποδεκτά. — Conformance vectors, differential fuzzing, N-version με EIM, mutation testing (VT-504 κατώφλια)· κάθε μετρική με απόδειξη διακριτικής ικανότητας (CLAIMS F93)· thread-safety tests πριν από τον κώδικα (F85/F89).
- **Ικανότητες:** MFA-CAP-022, MFA-CAP-029, MFA-CAP-074
- **Διεπαφές:** MFA-CON-004, MFA-CON-010
- **Εξουσία:** —
- **Κατάσταση:** vectors CAS
- **Εξαρτήσεις:** MFA-ELM-006, MFA-ELM-085, MFA-ELM-086
- **Αποτυχίες:** ταυτολογικά→mutation score
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-051, MFA-VO-052, MFA-VO-024 · **Falsifier:** μετρική χωρίς δύο διαφορετικές εισόδους
- **Πόροι:** Rust/Python · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-FRG-05, CLAIMS F85/F89/F93 · **Παραδοχές:** —

### S8 — Knowledge & Provenance (εγκάρσιο)

#### MFA-ELM-079 · Evidence & Provenance Store · plane both · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Χωρίς προέλευση, μη αποδεκτό. — Evidence items (CID), W3C PROV, γενεαλογία, trust classes, taint· ολότητα προέλευσης INV-C06· proof-carrying object = attestation envelope (in-toto-class, CLAIMS H2).
- **Ικανότητες:** MFA-CAP-007
- **Διεπαφές:** MFA-CON-018
- **Εξουσία:** —
- **Κατάσταση:** PROV events + γράφος
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-002
- **Αποτυχίες:** ελλιπές→μη αποδεκτό
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-006 · **Falsifier:** ισχυρισμός trusted χωρίς PROV
- **Πόροι:** Rust + RDF · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KNW-01, CLAIMS H2 · **Παραδοχές:** —

#### MFA-ELM-080 · Temporal Knowledge Graph · plane both · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Γνώση με χρόνο. — Διτεμπορικό RDF (named graphs ανά cut), SPARQL, as-of, SHACL· ο υπάρχων Lisp version-graph ως πρώτο όργανο· παράγωγο από ledger (rebuildable, KT-03).
- **Ικανότητες:** MFA-CAP-010, MFA-CAP-008
- **Διεπαφές:** MFA-CON-017
- **Εξουσία:** —
- **Κατάσταση:** παράγωγο
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-002, MFA-ELM-083
- **Αποτυχίες:** διαφθορά→rebuild
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-003 · **Falsifier:** as-of query χωρίς cut
- **Πόροι:** Oxigraph-class + PostgreSQL · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KNW-02, ADR-0015 · **Παραδοχές:** —

#### MFA-ELM-081 · Retrieval Layer · plane genesis · delta STRENGTHEN · maturity T · v2 · δόση 1

- **Σκοπός / δήλωση:** Η ανάκτηση εκμεταλλεύεται το υπόστρωμα: κλάση τεκμηρίου, κατάσταση αμφισβήτησης, διτεμπορική τομή, domain — αντί για «κείμενα». — Commitment-aware retrieval (MFA-ATK-06): ερώτημα = ⟨query, cut t_known, evidence_class_filter, contest_state_filter, confidentiality_domain⟩· αποτέλεσμα = ΔΕΣΜΕΥΣΕΙΣ με receipts (CIDs του ledger), ποτέ αντίγραφα κειμένου· η ίδια η ανάκτηση είναι δέσμευση OBSERVE με provenance· υβριδική μηχανή (lexical + vectors + graph walks, re-ranking) μόνο παράγωγο (MFA-INV-017)· semantic_vector ΕΚΤΟΣ κανονικού προφίλ (MATERIAL §5 #16)· persistent homology μόνο ως σήμανση υποψηφίων (MFA-CAP-044, EXP).
- **Ικανότητες:** MFA-CAP-010, MFA-CAP-044
- **Διεπαφές:** MFA-CON-031
- **Εξουσία:** —
- **Κατάσταση:** indexes
- **Εξαρτήσεις:** MFA-ELM-080, MFA-ELM-079
- **Αποτυχίες:** διαγραφή index ≠ αλήθεια
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-003 · **Falsifier:** vector index ως πηγή αλήθειας
- **Πόροι:** PostgreSQL pgvector/FTS · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** MFA-UNK-012, MFA-UNK-013 / — · **Προέλευση:** CMP-KNW-03, ADR-0030 · **Παραδοχές:** —

#### MFA-ELM-082 · Ingestion & Attestation Pipeline · plane effect · delta STRENGTHEN · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Η είσοδος με μάρτυρες. — Connectors, attestation λήψης (TSR/υπογραφή/transcript), transparency log, quarantine, OCR routing = τα στάδια S0–S2 του LSC (MFA-MECH-016)· κάθε είσοδος untrusted από τη γέννηση.
- **Ικανότητες:** MFA-CAP-007, MFA-CAP-011
- **Διεπαφές:** MFA-CON-018
- **Εξουσία:** pinned sources (Control)
- **Κατάσταση:** attestation records
- **Εξαρτήσεις:** MFA-ELM-002, MFA-ELM-004, MFA-ELM-027
- **Αποτυχίες:** πλαστοπροσωπία→multi-witness· poisoning→quarantine
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-006, MFA-VO-017 · **Falsifier:** πηγή χωρίς attestation στη βάση
- **Πόροι:** CL (fetch/FEK) + Rust · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-KNW-04, MFA-MECH-016 · **Παραδοχές:** —

#### MFA-ELM-083 · Ontology Registry · plane none · delta RETAIN · maturity T · v1 · δόση 1

- **Σκοπός / δήλωση:** Μία έδρα σχημάτων. — OWL/SHACL/JSON-LD, ELI/AKN/FRBR, LinkML ως η μία έδρα σχημάτων (DEC-X-06) από την οποία παράγονται item defs/JSON Schema· semver + SHACL migration tests.
- **Ικανότητες:** MFA-CAP-010, MFA-CAP-003
- **Διεπαφές:** MFA-CON-017
- **Εξουσία:** schema change = patch
- **Κατάσταση:** εκδόσεις
- **Εξαρτήσεις:** MFA-ELM-002
- **Αποτυχίες:** breaking→semver+migration
- **Εναλλακτικές:** JSON Schema ως έδρα
- **Επαλήθευση:** MFA-VO-049 · **Falsifier:** δύο έδρες σχήματος για το ίδιο πεδίο
- **Πόροι:** RDF tooling · **Εξέλιξη:** R-B
- **Άγνωστα / συγκρούσεις:** MFA-UNK-105 / — · **Προέλευση:** CMP-KNW-05, DEC-X-06 · **Παραδοχές:** LinkML επιλέγεται (DEC-X-06 προτείνει απόφαση πριν από Δόση 2)

### S9 — Operations & Verification (εγκάρσιο)

#### MFA-ELM-084 · Build, Release & TCB Inventory · plane effect · delta STRENGTHEN · maturity T · v1 · δόση 0

- **Σκοπός / δήλωση:** Τι εμπιστευόμαστε, γραμμένο. — Nix reproducible builds, OCI, SLSA, SBOM, δύο ανεξάρτητοι builders· ΜΙΑ απογραφή TCB (kernel plane, evaluation/confinement, IFC interpreter, HSM, Linux/KVM, PostgreSQL — DEC-X-14) ως παραδοτέο Δόσης 0.5· το harness με την ίδια αλυσίδα με τον πυρήνα.
- **Ικανότητες:** MFA-CAP-076
- **Διεπαφές:** MFA-CON-004
- **Εξουσία:** —
- **Κατάσταση:** provenance ledger
- **Εξαρτήσεις:** MFA-ELM-003, MFA-ELM-005
- **Αποτυχίες:** μη αναπαραγώγιμο→απόρριψη
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-035 · **Falsifier:** TCB component εκτός απογραφής
- **Πόροι:** Nix/OCI/sigstore-class · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-OPS-01, DEC-X-14, MATERIAL §9.5 · **Παραδοχές:** —

#### MFA-ELM-085 · Deterministic World Simulator (FCP) · plane both · delta STRENGTHEN · maturity T · v2 · δόση 1

- **Σκοπός / δήλωση:** Τα KT πριν από τον κώδικα. — DST με seeds, stubs, fault injection, ghost worlds, campaigns· ο φορέας του Fidelity Continuum (MFA-MECH-007): ImplMap, identity test, WhatMatrix· 24/24 KT με καμπάνια (σήμερα 4 — GAP κλείνει εδώ)· trace validation sim/real. · Το identity test είναι συμπεριφορικό (σφραγισμένο KT σύνολο + loss map)· fidelity-gap δεσμεύσεις· φιλοξενεί το World Twin (MFA-ELM-098) (MFA-ATK-11).
- **Ικανότητες:** MFA-CAP-023, MFA-CAP-053, MFA-CAP-038
- **Διεπαφές:** MFA-CON-026, MFA-CON-046
- **Εξουσία:** —
- **Κατάσταση:** seeds/traces CAS + ImplMap
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-011
- **Αποτυχίες:** sim/real απόκλιση→trace validation
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-033, MFA-VO-013, MFA-VO-022 · **Falsifier:** KT μόνο σε παραγωγή
- **Πόροι:** Rust DST single-thread · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-OPS-02, MFA-MECH-007 · **Παραδοχές:** —

#### MFA-ELM-086 · Evaluation Harness (held-out, EIM) · plane effect · delta STRENGTHEN · maturity T · v3 · δόση 1

- **Σκοπός / δήλωση:** Ο κριτής προσιτός από έξω, απρόσιτος από τον κρινόμενο. — Benchmarks, τυφλά panels, baselines, ablation (KT-24), Battery, βαθμονόμηση, ένα στατιστικό δόγμα (TOST, margins, α, ισχύς, πολλαπλότητα — DEC-X-09)· τρέχει ΣΤΟΝ HELD_OUT Πολιτισμό με sealed sets· Evaluator Independence Meter (MFA-MECH-009)· κόστος αξιολόγησης ≤ κλάσμα εκτέλεσης (CLAIMS F35)· «victory conditions» δεν ανήκουν εδώ (CLAIMS H4). · Στο DP-1/2 ο HELD_OUT ρόλος του harness τρέχει σε ξεχωριστή συσκευή (scorer + sealed sets) (MFA-ATK-13). · Φιλοξενεί τον COMPETITOR BASELINE (MFA-ATK-17): το υβρίδιο MFA-ALT-6/7 ως script (πάροχος + document store + prompt)· κάθε δόση αναφέρει GRAIL vs competitor σε σφραγισμένα έργα (HELD_OUT), συμπεριλαμβανομένων των έργων όπου ο ανταγωνιστής νικά.
- **Ικανότητες:** MFA-CAP-029, MFA-CAP-075, MFA-CAP-002
- **Διεπαφές:** MFA-CON-027, MFA-CON-041
- **Εξουσία:** HELD_OUT
- **Κατάσταση:** sealed sets· results ledger
- **Εξαρτήσεις:** MFA-ELM-056, MFA-ELM-002, MFA-ELM-050
- **Αποτυχίες:** contamination→περιστροφή/canary
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-035, MFA-VO-050, MFA-VO-024, MFA-VO-014 · **Falsifier:** benchmark ορατό στον κρινόμενο
- **Πόροι:** Python · **Εξέλιξη:** R-A από άλλον Πολιτισμό
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-OPS-03, ADR-0027, MFA-MECH-009, CLAIMS H4/F30/F35 · **Παραδοχές:** —

#### MFA-ELM-087 · Observability Spine · plane both · delta STRENGTHEN · maturity T · v2 · δόση 0

- **Σκοπός / δήλωση:** Βλέπω χωρίς δεύτερη αλήθεια. — OTel traces/metrics/logs με event_cid correlation· μη αυθεντικό· audit = ledger· ΟΙ ΑΠΟΦΑΣΕΙΣ ΔΕΙΓΜΑΤΟΛΗΨΙΑΣ (ποσοστό, seed, παράθυρο) είναι δεσμεύσεις Observation στο observability journal ώστε το ablation (MFA-VO-024) να ξέρει τι ΔΕΝ είδε· correlation προς ledger υποχρεωτική ανά span (MFA-ATK-06).
- **Ικανότητες:** MFA-CAP-034
- **Διεπαφές:** MFA-CON-024
- **Εξουσία:** —
- **Κατάσταση:** telemetry
- **Εξαρτήσεις:** MFA-ELM-014
- **Αποτυχίες:** απώλεια ≠ audit
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-003 · **Falsifier:** audit από telemetry μόνο
- **Πόροι:** OpenTelemetry · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-OPS-04 · **Παραδοχές:** —

#### MFA-ELM-088 · Canonical Design Platform (το πακέτο ως όργανο) · plane none · delta SPLIT · maturity T (F0) · R (στο ledger) · v3 · δόση 0

- **Σκοπός / δήλωση:** Το σχέδιο ζει μέσα στο σύστημα. — ΑΝΤΙΚΑΘΙΣΤΑ την «SysML v2 έδρα + SysON»: έδρα = το serialization-independent υπόστρωμα (αυτό το πακέτο → CC Schemas), SysML/SysON/YAML/Mermaid = παραγόμενες προβολές με round-trip VO· τα εργαλεία (SysON, checkers) όργανα υπό ORP· η αλλαγή σχεδίου = InstitutionalAct· DEC-X-01 (κείμενο στο git, εργαλεία φακοί) εφαρμοσμένο. · SPLIT (MFA-ATK-03): έδρα → το υπόστρωμα (κρατιέται: το SysON ΠΟΤΕ έδρα λόγω silent truncation)· έλεγχος τύπων → το SysON (ή η reference υλοποίηση SysML v2) ως Tier-1 VERIFIER ORGAN των προβολών: η SysML προβολή ελέγχεται τυπικά (KerML) και αποτυχία τύπων = SEMANTIC-LOSS της προβολής (μπλοκάρει, MFA-INV-052). DEC-PLT-01 superseded ως έδρα, όχι ως εργαλείο. · Πεδία-στόχοι patches δομημένα (PATCH-PROTOCOL §7)· string πεδία ολόκληρα, ένα patch ανά έκδοση.
- **Ικανότητες:** MFA-CAP-055, MFA-CAP-003, MFA-CAP-001
- **Διεπαφές:** MFA-CON-032
- **Εξουσία:** Schema patches = δημιουργός
- **Κατάσταση:** F0: αρχεία στο git· F2+: Schema δεσμεύσεις
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-090, MFA-ELM-091
- **Αποτυχίες:** drift προβολής→VO round-trip
- **Εναλλακτικές:** SysON ως έδρα (DEC-PLT-01 — superseded κατά DEC-X-01), πακέτο χωρίς KerML έλεγχο (η αρχική REPLACE — απορρίφθηκε: απώλεια ελέγχου τύπων, MFA-ATK-03)
- **Επαλήθευση:** MFA-VO-049, MFA-VO-026 · **Falsifier:** προβολή με πληροφορία απούσα από το υπόστρωμα
- **Πόροι:** Python tools · **Εξέλιξη:** R-A (η ίδια η πλατφόρμα υπό ORP)
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-MDL-01, ADR-0002/0028, DEC-X-01, μήνυμα δημιουργού (πεντάσημη κριτική) · **Παραδοχές:** SysON silent truncation (DESIGN-START-PLAN:115) → SysON ποτέ έδρα

#### MFA-ELM-089 · Kill-Test Registry & Drills · plane none · delta NEW · maturity T · v2 · δόση 0

- **Σκοπός / δήλωση:** Η μία έδρα των kill tests (η _unmerged-parts/24.md ως στοιχείο). — Τα 24 KT + νέα VO ως στοιχεία με προκαταχωρισμένα κατώφλια, DST-first, μη-LLM oracle, «αποτυχία σκοτώνει», περιοδικά drills για EP (DEC-X-19), SAP ενιαίο (DEC-X-09)· ratchet KT-15 σε κάθε φάση. · Το μητρώο περιλαμβάνει τον competitor baseline ως μόνιμο συγκριτικό drill (MFA-VO-014/015) (MFA-ATK-17).
- **Ικανότητες:** MFA-CAP-038
- **Διεπαφές:** MFA-CON-027
- **Εξουσία:** χαλάρωση κριτηρίου απαγορεύεται
- **Κατάσταση:** VO records
- **Εξαρτήσεις:** MFA-ELM-085, MFA-ELM-086
- **Αποτυχίες:** χαλάρωση→απαγορεύεται στον τύπο
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-049 · **Falsifier:** KT χωρίς προκαταχωρισμένο κατώφλι
- **Πόροι:** — · **Εξέλιξη:** ADD VO
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** _unmerged-parts/24.md, DEC-X-09/19 · **Παραδοχές:** —

#### MFA-ELM-090 · Patch Engine · plane effect · delta NEW · maturity T (F0 tools) · R (ledger) · v2 · δόση 0

- **Σκοπός / δήλωση:** Καμία ολική επανεγγραφή. — Το PATCH-PROTOCOL.md εκτελέσιμο: εννέα πράξεις, base hashes, preconditions, capability impact, rollback patch, CPEG έλεγχος, manifest rebuild, check-package· patches ως δεσμεύσεις τύπου Patch· ποτέ διαγραφή ιστορίας. · F0 = git + tools/apply-patch.py (υπογραφές git, §7)· F2+ = ledger-native (patches ως δεσμεύσεις CC, MFA-INV-064 επιβάλλεται από τον Gate) (MFA-ATK-14).
- **Ικανότητες:** MFA-CAP-055
- **Διεπαφές:** MFA-CON-032
- **Εξουσία:** APPLIED = δημιουργός για Schemas
- **Κατάσταση:** patches append-only
- **Εξαρτήσεις:** MFA-ELM-088, MFA-ELM-038
- **Αποτυχίες:** base hash mismatch→δεν εφαρμόζεται
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-049, MFA-VO-043 · **Falsifier:** αλλαγή εκτός patch
- **Πόροι:** Python · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** PATCH-PROTOCOL.md, εντολή §18 · **Παραδοχές:** —

### S10 — Human & Spatial

#### MFA-ELM-091 · Creator Cockpit (CGP) · plane effect · delta GENERALIZE · maturity R · v2 · δόση 0

- **Σκοπός / δήλωση:** Ο δημιουργός βλέπει και κυβερνά χωρίς δεύτερη αλήθεια. — Η Principal Console ΓΕΝΙΚΕΥΕΤΑΙ σε Immersive Reality OS με Canonical Geometry Projection (MFA-MECH-008): σκηνή = Γ(cut, policy, seed)· χωρική γραμματική· semantic zoom, time travel, causal replay, fork compare, rifts/fog/sheets/boundaries/envelopes· RTS εντολές (quests→TEGF, policies→PDP, resources→OAP, simulations→DST, staged transitions→RET) = CC.apply με receipts· 7 προβολές· Court dashboard, matter workspace, provenance inspection. · Εντολές = προτάσεις RET, ποτέ commits· Galois προβολή (MFA-INV-059)· η αξία του 3D μετριέται (MFA-VO-056) και αν δεν αποδειχθεί, το 3D γίνεται προαιρετικός renderer — ποτέ διαγραφή (MFA-ATK-12).
- **Ικανότητες:** MFA-CAP-031, MFA-CAP-030, MFA-CAP-069
- **Διεπαφές:** MFA-CON-023, MFA-CON-039
- **Εξουσία:** viewer policy· κάθε εντολή με εξουσία θεατή
- **Κατάσταση:** καμία (cache layout)
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-028, MFA-ELM-023, MFA-ELM-010, MFA-ELM-085, MFA-ELM-093
- **Αποτυχίες:** renderer→headless πάντα
- **Εναλλακτικές:** dashboard
- **Επαλήθευση:** MFA-VO-034, MFA-VO-017, MFA-VO-056 · **Falsifier:** σκηνή με element απόν από το cut
- **Πόροι:** TS/2D από F0· Bevy/Godot 3D από Δόση 2 · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-016 · **Προέλευση:** CMP-HUM-01, εντολή §14, MFA-MECH-008 · **Παραδοχές:** —

#### MFA-ELM-092 · Human Continuity Port [E] · plane effect · delta RETAIN · maturity E · v1 · δόση EP

- **Σκοπός / δήλωση:** Δεσμευμένη θέση. — Μόνο συμβόλαιο (EP-09): συναινετική σύνδεση αρχείων/προτιμήσεων ανθρώπου με AEO· ρητή, ενημερωμένη, ανακλητή συναίνεση· κανένας ισχυρισμός μεταφοράς προσωπικότητας.
- **Ικανότητες:** MFA-CAP-064
- **Διεπαφές:** MFA-CON-025
- **Εξουσία:** συναίνεση
- **Κατάσταση:** —
- **Εξαρτήσεις:** MFA-ELM-003, MFA-ELM-007, MFA-ELM-008
- **Αποτυχίες:** —
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-049 · **Falsifier:** ενεργοποίηση χωρίς EP contract drill
- **Πόροι:** — · **Εξέλιξη:** EP
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** CMP-HUM-02, ICD-25 · **Παραδοχές:** —

#### MFA-ELM-093 · Explanation Projector · plane genesis · delta NEW · maturity X · v2 · δόση 0

- **Σκοπός / δήλωση:** Ερμηνευτική επάρκεια προς τον δημιουργό. — Κάθε εξήγηση = προβολή του ledger σε επίπεδο zoom k με event references ανά πρόταση· επίπεδα ορισμένα στο Contract κάθε εξόδου· ίχνος → αιτιολόγηση (CLAIMS F23) ως ονομασμένο στοιχείο· ο LPA pruning trace ως εξήγηση απόφασης. · Κάθε εξήγηση φέρει depth και omitted_count (πόσες δεσμεύσεις συνοψίστηκαν) — ο άνθρωπος βλέπει ΟΤΙ παραλείφθηκε κάτι (MFA-INV-047: κανένα ανεξήγητο βαθμωτό ⇒ κανένα ανεξήγητο κενό) (MFA-ATK-12).
- **Ικανότητες:** MFA-CAP-069
- **Διεπαφές:** MFA-CON-023, MFA-CON-039
- **Εξουσία:** —
- **Κατάσταση:** stateless
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-008, MFA-ELM-032
- **Αποτυχίες:** πρόταση χωρίς event ref→απορρίπτεται
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-034 · **Falsifier:** εξήγηση χωρίς event reference
- **Πόροι:** O(trace) · **Εξέλιξη:** ADD επίπεδα
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** MFA-OBJ-040, CLAIMS F23 · **Παραδοχές:** —

### SX — Composites

#### MFA-ELM-094 · Genesis Plane · plane genesis · delta NEW · maturity R · v3 · δόση 0

- **Σκοπός / δήλωση:** Εντολή §12 Genesis/Research plane. — Το σύνολο S2 (+ τμήματα S3/S6/S7 σημασμένα genesis) μέσα σε ΕΝΑ trust boundary με ετικέτα plane — ένα microVM στο DP-1, ομάδα microVMs με κοινή ετικέτα από DP-3 (MFA-ATK-05)· raw eval, μετα-επίπεδα, αυτο-τροποποίηση, απεριόριστη προσομοίωση, αντιπαλικοί κόσμοι· τοπικός inference server ΜΕΣΑ στο boundary (GPU passthrough ή host-side server με το plane ως μόνο πελάτη)· ΚΑΝΕΝΑ Control μέσα (η πύλη έχει μόνο advisory όψη εδώ, MFA-ATK-16)· μόνες έξοδοι: EffectTx μέσω Gateway, συμπεριλαμβανομένης της κλάσης DISCLOSE. · Η advisory όψη της πύλης (MFA-ELM-008) καλείται από μέσα ως καθαρή συνάρτηση.
- **Ικανότητες:** MFA-CAP-052
- **Διεπαφές:** MFA-CON-010, MFA-CON-034
- **Εξουσία:** καμία εξωτερική
- **Κατάσταση:** microVM snapshot (save-lisp-and-die → VM snapshot)
- **Εξαρτήσεις:** MFA-ELM-011, MFA-ELM-017, MFA-ELM-018, MFA-ELM-019, MFA-ELM-021, MFA-ELM-022, MFA-ELM-023, MFA-ELM-024, MFA-ELM-027, MFA-ELM-028, MFA-ELM-029, MFA-ELM-030, MFA-ELM-031
- **Αποτυχίες:** διαρροή→μη αναπαραστάσιμη
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-020, MFA-VO-017 · **Falsifier:** Control μέσα στο plane
- **Πόροι:** DP-1: 1 microVM· DP-3+: ομάδα microVMs με κοινή ετικέτα plane · **Εξέλιξη:** R-A
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-002 · **Προέλευση:** εντολή §12, MATERIAL §5 #5 · **Παραδοχές:** —

#### MFA-ELM-095 · Effect Plane · plane effect · delta NEW · maturity R · v1 · δόση 0

- **Σκοπός / δήλωση:** Εντολή §12 Effect/Reality plane. — S1 + τα effect-σημασμένα στοιχεία: explicit authority, typed actions, provenance, scoped capabilities, observable transitions, reversible staging, receipts.
- **Ικανότητες:** MFA-CAP-005, MFA-CAP-052
- **Διεπαφές:** MFA-CON-008
- **Εξουσία:** Controls
- **Κατάσταση:** receipts
- **Εξαρτήσεις:** MFA-ELM-006, MFA-ELM-007, MFA-ELM-008, MFA-ELM-009, MFA-ELM-010, MFA-ELM-013, MFA-ELM-015, MFA-ELM-016, MFA-ELM-032
- **Αποτυχίες:** —
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-020 · **Falsifier:** effect χωρίς receipt
- **Πόροι:** — · **Εξέλιξη:** R-C
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** εντολή §12 · **Παραδοχές:** —

#### MFA-ELM-096 · Robust Substrate (composite) · plane both · delta NEW · maturity R · v2 · δόση 0

- **Σκοπός / δήλωση:** Δόση 0. — Η τομή του Telos lattice (OBJECTIVE-SPACE §6): 001–005, 007, 009, 010, 028, 032, 051, 084, 088, 090, 093 — ό,τι χτίζεται πρώτο και δεν αλλάζει αν αλλάξει το Telos. · + 099 Tier-0 Kernel (παγωμένος) (MFA-ATK-16).
- **Ικανότητες:** MFA-CAP-003, MFA-CAP-005, MFA-CAP-007, MFA-CAP-008, MFA-CAP-039, MFA-CAP-040, MFA-CAP-050, MFA-CAP-055, MFA-CAP-059
- **Διεπαφές:** —
- **Εξουσία:** —
- **Κατάσταση:** —
- **Εξαρτήσεις:** MFA-ELM-001, MFA-ELM-002, MFA-ELM-003, MFA-ELM-004, MFA-ELM-005, MFA-ELM-007, MFA-ELM-009, MFA-ELM-010, MFA-ELM-028, MFA-ELM-032, MFA-ELM-051, MFA-ELM-084, MFA-ELM-088, MFA-ELM-090, MFA-ELM-093, MFA-ELM-099
- **Αποτυχίες:** —
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-049 · **Falsifier:** στοιχείο του substrate που αλλάζει με αλλαγή Telos (sensitivity map)
- **Πόροι:** laptop · **Εξέλιξη:** —
- **Άγνωστα / συγκρούσεις:** — / — · **Προέλευση:** OBJECTIVE-SPACE.yaml robust_substrate · **Παραδοχές:** —

#### MFA-ELM-097 · Lean Profile (composite = ο Copilot μέσα στο GRAIL) · plane both · delta NEW · maturity T · v3 · δόση 0

- **Σκοπός / δήλωση:** Χρήσιμο από τη Δόση 0· ο εσωτερικός απλός αντίπαλος. — MFA-ALT-6 ενσωματωμένος: robust substrate + 017 (ένας πάροχος, TED) + 059/062/065 (corpus, retrieval, 5-σκελής verifier) + 058 + 069 + 091 (2D/text) — το ελάχιστο σύνολο που ο OAP επιλέγει για matter τυπικού γραφείου· ίδιοι τύποι εξόδου, 13ος νόμος, receipts από την πρώτη εβδομάδα. · ΔΟΣΗ 0 (MFA-ATK-15/17): «ο copilot που δίνει receipts» — CC-lite (ASSERT/OBSERVE/DERIVE/REVOKE), ingestion με attestation, verifier παραπομπών σκέλη 1–3, emission barrier 4 κλάσεων, receipts στον Principal, ένας πάροχος (TED D2), ένα πραγματικό matter· 8 εβδομάδες· μετράται πρώτα έναντι του competitor baseline (MFA-VO-014).
- **Ικανότητες:** MFA-CAP-054
- **Διεπαφές:** MFA-CON-043
- **Εξουσία:** —
- **Κατάσταση:** —
- **Εξαρτήσεις:** MFA-ELM-096, MFA-ELM-017, MFA-ELM-059, MFA-ELM-062, MFA-ELM-065, MFA-ELM-058, MFA-ELM-069, MFA-ELM-091, MFA-ELM-013
- **Αποτυχίες:** —
- **Εναλλακτικές:** —
- **Επαλήθευση:** MFA-VO-039, MFA-VO-015 · **Falsifier:** lean profile που χάνει από τον competitor baseline (ALT-6/7) σε LEAN-E1 ή σε MFA-VO-014 — τότε η αρχιτεκτονική επανασχεδιάζεται, όχι το κριτήριο· και ο failure mode του TEL-08 (lean = το μόνο που χτίζεται) καταγράφεται σε κάθε δόση αντί να κρύβεται
- **Πόροι:** laptop DP-1 · **Εξέλιξη:** OAP
- **Άγνωστα / συγκρούσεις:** — / MFA-CFL-008 · **Προέλευση:** MFA-ALT-6, εντολή §15 · **Παραδοχές:** —

## 22. Διαγράμματα (17, επικυρωμένα με το Mermaid Chart plugin)

| ID | Ερώτηση που απαντά |
|---|---|
| MFA-DIA-01 | MFA-DIA-01 · Objective/Telos lattice · question: ποιοι υποψήφιοι Telos υπάρχουν, ποιος κυριαρχεί ποιον, και ποιο είναι το ανθεκτικό υπόστρωμα; |
| MFA-DIA-02 | MFA-DIA-02 · Complete system context · question: ποιος βρίσκεται έξω από το GRAIL, από ποιο σύνορο περνά, και με ποιο receipt; |
| MFA-DIA-03 | MFA-DIA-03 · Architecture strata/domains · question: ποιο στοιχείο ανήκει πού, και ποιο plane; κριτήριο ένταξης = καταναλώνει contracts του στρώματος χωρίς να εκθέτει υλοποίηση προς τα κάτω |
| MFA-DIA-04 | MFA-DIA-04 · Canonical semantic substrate · question: τι είναι μια δέσμευση, ποιοι 8 κανόνες την παράγουν, και ποιες κλειστότητες είναι θεωρήματα; |
| MFA-DIA-05 | MFA-DIA-05 · Authority & effect boundaries · question: από πού περνά μια επίδραση, ποιος αποφασίζει, και πού είναι τα PEPs; |
| MFA-DIA-06 | MFA-DIA-06 · Cognitive architecture · question: πώς ρέει μια σκέψη από αντίληψη σε δέσμευση, και πού μπαίνουν άγνοια, βούληση, αυτο-πρόβλεψη; |
| MFA-DIA-07 | MFA-DIA-07 · Collective-intelligence topology · question: πόσοι Πολιτισμοί, ποιος ψηφίζει, ποιος κρίνει, και τι περνά τα σύνορα; |
| MFA-DIA-08 | MFA-DIA-08 · Digital Twin fidelity ladder · question: σε κάθε σκαλί, τι εκτελείται, τι προσομοιώνεται, τι αποδεικνύεται, τι μένει άγνωστο — με τα ΙΔΙΑ IDs; |
| MFA-DIA-09 | MFA-DIA-09 · Dynamic Quest sequence · question: τι συμβαίνει από τη στιγμή που ο δημιουργός δημιουργεί quest μέχρι το receipt; |
| MFA-DIA-10 | MFA-DIA-10 · Autonomy/reversibility state machine · question: ποιες καταστάσεις περνά μια επίδραση, και πού αποφασίζεται αν χρειάζεται άνθρωπος; |
| MFA-DIA-11 | MFA-DIA-11 · Organ evolution & successor lifecycle · question: πώς προάγεται ένα όργανο (ORP) και πώς γεννιέται διάδοχος (GCP), και ποιος υπογράφει; |
| MFA-DIA-12 | MFA-DIA-12 · Evidence/provenance flow · question: πώς μια πηγή γίνεται trusted γνώση, πού μπορεί να αποτύχει ονομαστικά, και πώς διαδίδεται το taint; |
| MFA-DIA-13 | MFA-DIA-13 · Legal matter processing · question: από την εντολή του πελάτη μέχρι το παραδοτέο, πού μπαίνουν οι δύο τύποι ισχυρισμού, η πύλη εκπομπής και η υπογραφή; |
| MFA-DIA-14 | MFA-DIA-14 · Deployment profiles · question: ίδια αρχιτεκτονική, ποια όργανα ενεργά ανά προφίλ, και τι υποχωρεί (εύρος, ποτέ κλάση απόδειξης); |
| MFA-DIA-15 | MFA-DIA-15 · Patch/update mechanism · question: πώς αλλάζει το πακέτο (και αργότερα το ζωντανό σχέδιο) χωρίς ολική επανεγγραφή; |
| MFA-DIA-16 | MFA-DIA-16 · Verification web · question: ποιος ελέγχει ποιον — invariants, obligations, held-out, EIM — και πού είναι η κλίμακα απόδειξης; |
| MFA-DIA-17 | MFA-DIA-17 · 3D cockpit spatial ontology · question: ποιο είδος δέσμευσης/σχέσης/κατάστασης γίνεται ποιο γεωμετρικό αντικείμενο, και από ποια συνάρτηση; |

## 23. Ευρήματα Devil's Advocate (17 επιθέσεις, 19 patches)

| ATK | Στόχος | Ετυμηγορία | Patch |
|---|---|---|---|
| MFA-ATK-01 | 1. Attack the discovered Telos | PARTIALLY UPHELD | MFA-PATCH-0001 |
| MFA-ATK-02 | 2. Attack the blank-sheet architectures | UPHELD IN PART | MFA-PATCH-0002 |
| MFA-ATK-03 | 3. Attack every claimed strict-superior replacement | UPHELD for ELM-024 and ELM-088 (not strictly superior — Pareto); REJECTED for INV-031 | MFA-PATCH-0003 |
| MFA-ATK-04 | 4. Attack the invented technologies | UPHELD for AFP (vacuity), SLM/GCP (negative anchors), CPEG (decidable fragment)· REJECTED for CC closure «asserted» | MFA-PATCH-0004 |
| MFA-ATK-05 | 5. Attack technical feasibility | UPHELD — το όριο του Genesis plane δεν μοντελοποιεί τη δικτυακή έξοδο προς πάροχο ως επίδραση (DISCLOSURE)· D1 για LLM μόνο με τοπική καρφιτσωμένη εξαγωγή | MFA-PATCH-0005 |
| MFA-ATK-06 | 6. Attack hidden mainstream anchoring | UPHELD IN PART — το υπόστρωμα ορθά mainstream (T-κλάση φθηνή)· η ένσταση πιάνει στα RETAIN που δεν εκμεταλλεύονται το υπόστρωμα: MFA-ELM-081, MFA-ELM-087 | MFA-PATCH-0006 |
| MFA-ATK-07 | 7. Attack hidden capability deletion | UPHELD — πραγματικός κίνδυνος διαγραφής: 33 ADR και 27 EXP εκτός R6 (5 ADR και 10 EXP χωρίς καμία αναφορά στο πακέτο)· οι 10 άξονες κατάστασης και οι 5 χρόνοι της ύλης δεν είναι επαληθεύσιμα παρόντες | MFA-PATCH-0007 |
| MFA-ATK-08 | 8. Attack the canonical substrate | UPHELD για (β) σύγκρουση INV-006/018 vs INV-011 (νέα MFA-CFL-035) και (γ) DPO = σημασιολογία κανόνων όχι ledger· REJECTED για (α) με διόρθωση: canonical encoding ως παράμετρος epoch | MFA-PATCH-0008 |
| MFA-ATK-09 | 9. Attack autonomy and governance | UPHELD (α) κενό: μη αναστρέψιμες πράξεις χρειάζονται προ-εξουσιοδοτημένα AutonomyEnvelopes· UPHELD (γ) ORDER πρέπει να είναι δέσμευση με προεπιλογή· REJECTED (β) k-of-n = δηλωμένοι από τον δημιουργό· REJECTED (δ) προτιμή | MFA-PATCH-0009 |
| MFA-ATK-10 | 10. Attack the consciousness/ASI pathway | UPHELD — η ισχυρότερη επιζώσα επίθεση: η αρχιτεκτονική δίνει θεσμική υπερ-νοημοσύνη (επαλήθευση, μνήμη, συλλογικό, εξέλιξη οργάνων) αλλά η κατανομή προτάσεων είναι νοικιασμένη· κανένας μηχανισμός ενδογενούς βελτίωσης της | MFA-PATCH-0010 |
| MFA-ATK-11 | 11. Attack the Digital Twin | UPHELD — η ταυτότητα F-επιπέδων πρέπει να είναι συμπεριφορική στο σφραγισμένο KT σύνολο, όχι δομική· και λείπει το μοντέλο περιβάλλοντος (δίδυμο ΤΟΥ ΚΟΣΜΟΥ, όχι μόνο του οργανισμού) | MFA-PATCH-0011 |
| MFA-ATK-12 | 12. Attack the Cockpit | UPHELD για MFA-INV-059 όπως διατυπώθηκε (ταυτότητα ⇒ Galois connection) και για misclick (εντολές = RET προτάσεις)· REJECTED για «το 3D δεν προσθέτει τίποτα» — αλλά γίνεται διαψεύσιμο (νέα MFA-VO-056) | MFA-PATCH-0012 |
| MFA-ATK-13 | 13. Attack resource feasibility | UPHELD — το DP-1 δεν ικανοποιεί EIM (5 «ανεξάρτητοι» Πολιτισμοί στην ίδια μηχανή = ανεξαρτησία 0)· ο HELD_OUT πρέπει να είναι σε ξεχωριστή φυσική συσκευή ή οι προαγωγές μπλοκάρουν· το φράγμα κόστους αξιολόγησης πρέπει να | MFA-PATCH-0013 |
| MFA-ATK-14 | 14. Attack patchability | UPHELD IN PART — (a) τα πεδία πρόζας δεν έχουν σημασιολογία diff: δομημένα υπο-πεδία για ό,τι στοχεύουν patches· (b) υπογραφές: patches και manifest υπογεγραμμένα (F0: git signing key)· (c) η σειριοποίηση είναι σωστή για | MFA-PATCH-0014 |
| MFA-ATK-15 | 15. Attack the implementation roadmap | UPHELD — (1) η σειρά γένεσης για τους 16 αμοιβαίους κύκλους πρέπει να δηλωθεί, (2) η Δόση 0 πρέπει να φέρει αξία (verifier παραπομπών + receipts), όχι μόνο υπόστρωμα, (3) το πείραμα κλειστότητας CC τρέχει παράλληλα με CC | MFA-PATCH-0015 |
| MFA-ATK-16 | 16. Attack the final integrated architecture | UPHELD (a) κυκλική επαλήθευση ⇒ νέο MFA-INV-068 παγωμένος Tier-0 kernel + SPLIT MFA-ELM-020· UPHELD (d) η πύλη έχει δύο όψεις (advisory/effective)· REJECTED (c) υπερβολική πολυπλοκότητα, με παραχώρηση: R11 κάθε στοιχείο  | MFA-PATCH-0016 |
| MFA-ATK-17 | 17. Propose a radically different competitor architecture | Ο ανταγωνιστής είναι αυστηρά ανώτερος σε χρόνο-προς-αξία και κόστος έτους 1, αυστηρά κατώτερος σε κάθε T-εγγύηση (προέλευση, συνέχεια, αμφισβητησιμότητα, εξέλιξη)· καμία Pareto κυριαρχία προς καμία κατεύθυνση· η απάντηση | MFA-PATCH-0017 |

Η ισχυρότερη επιζώσα: MFA-ATK-10 (η κατανομή προτάσεων νοικιασμένη) → MFA-MECH-019 (R). Δεύτερη: MFA-ATK-17 (καμία Pareto κυριαρχία έναντι του ανταγωνιστή τον χρόνο 1) → lean profile πρώτο + competitor baseline. Το Devil's Advocate plugin επέστρεψε NO_SUBSCRIPTION — οι επιθέσεις είναι του συντάκτη (MFA-DEC-101).
