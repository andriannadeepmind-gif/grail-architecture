# ASI-MAXIMUM-CAPABILITY-ARCHITECTURE — η μέγιστη αρχιτεκτονική ικανοτήτων ASI του GRAIL (Ω-MAXIMUM NON-ABSTENTION MANDATE §6, §8)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα:** `ASI-CAPABILITY-SPEC.yaml` (μηχαναγνώσιμη)· τα δοσιέ `inventions/MFA-MECH-026…044.yaml` (29 πεδία) και `mechanisms/MFA-MECH-020…044.md` (22 πεδία). **Κατάσταση:** PROPOSED / UNREVIEWED — μόνο ο δημιουργός εγκρίνει. Τα MFA-MECH-020…025 είναι PROVISIONAL / UNREVIEWED / NON-BINDING (§13). Τίποτα εδώ δεν είναι παραγωγικός κώδικας.

## 0. Τι είναι αυτό το έγγραφο

Η εντολή του δημιουργού απαιτεί (§8) δεκαεννέα ικανότητες ASI, καθεμία με έντεκα στοιχεία: μηχανισμός, ροή δεδομένων/ελέγχου, μεταβάσεις κατάστασης, contracts, invariants, αλγόριθμοι με πλήρες pseudocode, υπολογιστική πολυπλοκότητα, τρόποι αποτυχίας, υποχρεώσεις επαλήθευσης, διαδρομή υλοποίησης, falsifier· και (§6) δεκαεπτά περιοχές ανεξάρτητης έρευνας, καθεμία με: καλύτερη γνωστή αφετηρία, το όριό της, μηχανισμό που το ξεπερνά, τι είναι νέο, πώς ελέγχεται. Το 0.3.0 είχε τις περισσότερες από αυτές ονομασμένες χωρίς σημασιολογία ή απούσες (ASI-ABSTENTION-AUDIT). Εδώ καθεμία έχει και τα έντεκα.

**Πώς συνδέονται:** η ASI δεν είναι λίστα μηχανισμών αλλά ένας βρόχος — ο Ω-Loop (MFA-MECH-044): PERCEIVE (ledger, OGE) → MODEL (LWM, CDCE) → WONDER (Void, AHE) → ACT/EXPERIMENT (AIDC EFE, RET) → VERIFY (OC, TGPS, VFC) → LEARN (SMF/PRR/CPCL/TGL) → REFLECT (MSM, ASRW, CHH) → EVOLVE (RVSI, RAGen, ECE, G_Ω) → MEASURE (CGM, STP) → SUCCEED (VSC, SMP). Κάτω από όλα: το σταθερό σημείο L3 που κανένας βρόχος δεν αγγίζει.

## 1. Το σταθερό σημείο (L3) — ό,τι δεν ανήκει ποτέ στον χώρο αναζήτησης

- harness αξιολόγησης (MFA-ELM-086/089, CGM MFA-ELM-119)
- Verification Fixed-Point Contract (MFA-ELM-099, MFA-MECH-025)
- Telos & Constitution (L3, MFA-TEL-08)
- HELD_OUT συσκευή/πληθυσμός H
- RET (MFA-ELM-010) και PDP (MFA-ELM-007)
- LPA Tier-0 governors (MFA-ELM-008)
- Obligation type checker (MFA-ELM-122)
- Tier-0 παραγωγές της G_Ω (CC, LPA, RET, key lineage)

Αναλλοίωτες: MFA-INV-086 (FP εκτός χώρου), MFA-INV-090 (Tier-0 παραγωγές), MFA-INV-104 (γραμμικές υποχρεώσεις), MFA-INV-111 (Telos του διαδόχου), MFA-INV-115 (διακοπές πρώτα). Το σταθερό σημείο δεν είναι «παγωμένο toolchain» (MFA-ATK-16, AA-005): είναι ΣΥΜΒΟΛΑΙΟ με αντικαταστάσιμες υλοποιήσεις (MFA-MECH-025).

## 2. Οι 19 ικανότητες × 11 στοιχεία

| # | Ικανότητα | Μηχανισμοί | CAP | Στοιχεία | Επιστημική κατάσταση (κύριος μηχανισμός) |
|---|---|---|---|---|---|
| 1 | Ενδογενής δημιουργία μοντέλων (Endogenous model creation) | MFA-MECH-020, MFA-MECH-030, MFA-MECH-032 | MFA-CAP-081, MFA-CAP-094, MFA-CAP-096 | MFA-ELM-100, MFA-ELM-113, MFA-ELM-115 | NOVEL SYNTHESIS (provisional 0.4.0 — §13 PROVISIONAL / UNREVIEWED / NON-BINDING) |
| 2 | Συνεχής παραμετρική και μη-παραμετρική μάθηση (Continual parametric and non-parametric learning) | MFA-MECH-035, MFA-MECH-020, MFA-MECH-021 | MFA-CAP-099, MFA-CAP-081, MFA-CAP-066 | MFA-ELM-118, MFA-ELM-100, MFA-ELM-103 | NOVEL SYNTHESIS |
| 3 | Αυτόνομος σχηματισμός οντολογίας (Autonomous ontology formation) | MFA-MECH-026 | MFA-CAP-089 | MFA-ELM-109, MFA-ELM-083 | NOVEL SYNTHESIS |
| 4 | Κατασκευή κοσμομοντέλου (World-model construction) | MFA-MECH-023, MFA-MECH-027, MFA-MECH-026 | MFA-CAP-084, MFA-CAP-090, MFA-CAP-089 | MFA-ELM-105, MFA-ELM-110, MFA-ELM-098 | NOVEL SYNTHESIS (provisional 0.4.0 — §13 PROVISIONAL / UNREVIEWED / NON-BINDING) |
| 5 | Αιτιακή ανακάλυψη (Causal discovery) | MFA-MECH-027 | MFA-CAP-090 | MFA-ELM-110, MFA-ELM-022 | NOVEL SYNTHESIS |
| 6 | Αντιπαραγοντική προσομοίωση (Counterfactual simulation) | MFA-MECH-027, MFA-MECH-043 | MFA-CAP-091, MFA-CAP-024 | MFA-ELM-110, MFA-ELM-023, MFA-ELM-126 | NOVEL SYNTHESIS |
| 7 | Ανοιχτό curriculum (Open-ended curriculum) | MFA-MECH-023, MFA-MECH-041, MFA-MECH-031 | MFA-CAP-085, MFA-CAP-105, MFA-CAP-095 | MFA-ELM-106, MFA-ELM-124, MFA-ELM-114 | NOVEL SYNTHESIS (provisional 0.4.0 — §13 PROVISIONAL / UNREVIEWED / NON-BINDING) |
| 8 | Εφεύρεση υποθέσεων (Hypothesis invention) | MFA-MECH-028 | MFA-CAP-092 | MFA-ELM-111, MFA-ELM-030 | NOVEL SYNTHESIS |
| 9 | Σύνθεση θεωρημάτων και προγραμμάτων (Theorem and program synthesis) | MFA-MECH-029 | MFA-CAP-093 | MFA-ELM-112, MFA-ELM-020, MFA-ELM-025 | NOVEL SYNTHESIS |
| 10 | Αναζήτηση αρχιτεκτονικής (Architecture search) | MFA-MECH-030, MFA-MECH-032 | MFA-CAP-094 | MFA-ELM-113, MFA-ELM-077 | NOVEL SYNTHESIS |
| 11 | Επαληθευμένη αναδρομική αυτο-βελτίωση (Verified recursive self-improvement) | MFA-MECH-022, MFA-MECH-039, MFA-MECH-025, MFA-MECH-044 | MFA-CAP-083, MFA-CAP-103, MFA-CAP-108 | MFA-ELM-104, MFA-ELM-122, MFA-ELM-099, MFA-ELM-127, MFA-ELM-031 | NOVEL SYNTHESIS (provisional 0.4.0 — §13 PROVISIONAL / UNREVIEWED / NON-BINDING) |
| 12 | Μέτρηση ανάπτυξης ικανότητας (Capability-growth measurement) | MFA-MECH-036 | MFA-CAP-100 | MFA-ELM-119, MFA-ELM-086 | NEW FORMALISM |
| 13 | Ανεξαρτησία αξιολογητών (Evaluator independence) | MFA-MECH-009, MFA-MECH-031 | MFA-CAP-075, MFA-CAP-095 | MFA-ELM-086, MFA-ELM-114, MFA-ELM-102 | NOVEL SYNTHESIS (provisional 0.4.0 — §13 PROVISIONAL / UNREVIEWED / NON-BINDING) |
| 14 | Αντιπαλική αυτο-πρόκληση (Adversarial self-challenge) | MFA-MECH-031, MFA-MECH-012 | MFA-CAP-095, MFA-CAP-020 | MFA-ELM-114, MFA-ELM-050, MFA-ELM-049 | NOVEL SYNTHESIS |
| 15 | Κατασκευή διαδόχου (Successor construction) | MFA-MECH-042, MFA-MECH-003 | MFA-CAP-106, MFA-CAP-027 | MFA-ELM-125, MFA-ELM-039 | NOVEL SYNTHESIS |
| 16 | Μεταφορά χωρίς καταστροφική λήθη (Transfer without catastrophic forgetting) | MFA-MECH-035, MFA-MECH-037 | MFA-CAP-099, MFA-CAP-088 | MFA-ELM-118, MFA-ELM-120, MFA-ELM-036 | NOVEL SYNTHESIS |
| 17 | Δυναμική δημιουργία γλωσσών, δρώντων, θεσμών (Dynamic creation of languages, agents, institutions) | MFA-MECH-032 | MFA-CAP-096, MFA-CAP-028, MFA-CAP-019 | MFA-ELM-115, MFA-ELM-074, MFA-ELM-053, MFA-ELM-034 | NOVEL SYNTHESIS |
| 18 | Μετάβαση από δανεική σε κυρίαρχη νοημοσύνη (Transition from borrowed to sovereign intelligence) | MFA-MECH-033, MFA-MECH-020, MFA-MECH-019 | MFA-CAP-097, MFA-CAP-081 | MFA-ELM-116, MFA-ELM-100, MFA-ELM-017 | NEW FORMALISM |
| 19 | Μετανάστευση υποστρώματος (Substrate migration) | MFA-MECH-034 | MFA-CAP-098, MFA-CAP-036 | MFA-ELM-117, MFA-ELM-076 | NOVEL SYNTHESIS |

### 2.1 Ενδογενής δημιουργία μοντέλων — Endogenous model creation

**Μηχανισμοί:** MFA-MECH-020, MFA-MECH-030, MFA-MECH-032 · **Ικανότητες lattice:** MFA-CAP-081, MFA-CAP-094, MFA-CAP-096 · **Στοιχεία:** MFA-ELM-100, MFA-ELM-113, MFA-ELM-115

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-020 — Sovereign Model Foundry (SMF): παραμετρική μάθηση ΜΕΣΑ στο κυρίαρχο όριο, με τα βάρη ως δεσμεύσεις: Η κυριαρχία απαιτεί **ιδιοκτησία της συνάρτησης**, όχι μόνο του ledger: γνώση που ζει σε βάρη τρίτων είναι νοικιασμένη. Άρα τα βάρη είναι **δεσμεύσεις** του CC (υπογεγραμμένες, με γενεαλογία μέχρι τα raw επεισόδια και τα status axes τους), τα recipes είναι δεσμεύσεις, η εκπαίδευση είναι θεσμική πράξη με receipt, και η προαγωγή ενός μοντέλου είναι ORP όπως κάθε οργάνου. Ό,τι μαθαίνεται από πάροχο (distillation) γίνεται **ιδιόκτητο βάρος** με ετικέτα προέλευσης. ‖ MFA-MECH-030 — Recursive Architecture Generator (RAGen) — αναζήτηση αρχιτεκτονικών ως τυπωμένων γονιδιωμάτων υπό πύλη επαλήθευσης: Η αρχιτεκτονική είναι τυπωμένο γονιδίωμα G στη Genesis Grammar (MFA-MECH-032): στοιχεία με contracts, invariants, συνδεσμολογία, παραμέτρους ΚΑΙ τελεστές αναζήτησης. Το RAGen κάνει Quality-Diversity αναζήτηση (MAP-Elites με περιγραφητές = συντεταγμένες του capability lattice + κόστος + κλάση απόδειξης), κάθε υποψήφιο instantiated ως σκιώδης αρχιτεκτονική στο δίδυμο (TES, MFA-MECH-043) σε πιστότητα F1/F2, αξιολογείται σε ΣΦΡΑΓΙΣΜΕΝΕΣ υποχρεώσεις (KT/VO) από HELD_OUT, μπαίνει σε Pareto αρχείο, και προάγεται ΜΟΝΟ μέσω RVSI L2 → GCP shadow→canary→cutover. Αναδρομή: οι τελεστές μετάλλαξης είναι γονιδιώματα επιπέδου L2 με fitness = ρυθμός βελτίωσης απογόνων· το harness αξιολόγησης, το VFC και το Telos είναι L3 (σταθερό σημείο) — ποτέ στον χώρο. ‖ MFA-MECH-032 — Genesis Grammar (G_Ω) — μία γεννητική γραμματική για γλώσσες, δρώντες, θεσμούς και αρχιτεκτονικές: Μία attribute grammar G_Ω πάνω στο κανονικό υπόστρωμα με μη-τερματικά {Language, Agent, Institution, Architecture, Grammar}· κάθε παραγωγή φέρει attributes ⟨obligations (contracts/invariants που το προϊόν οφείλει), authority_level του προϊόντος, RET class της instantiation, VO⟩· κάθε παραγωγή (derivation) είναι δέσμευση· η γραμματική επεκτείνεται με νέες παραγωγές (Grammar → Grammar′) που εισάγονται ΜΟΝΟ υπό VFC + Galois έλεγχο σύγκρουσης + drill, ενώ οι Tier-0 παραγωγές (CC, LPA, RET, ταυτότητα) είναι L3 — γένεση της γένεσης χωρίς να αγγίζεται το σταθερό σημείο. |
| 2. Ροή δεδομένων/ελέγχου | Είσοδοι/έξοδοι: Είσοδος: ledger cut + φίλτρα, recipe, budget, (προαιρετικά) provider outputs υπό DisclosureGrant· Έξοδος: WeightCommitment + EvalReceipt + Lineage DAG· ParametricOrgan προς Organ Host (MFA-ELM-101) ‖ Διεπαφές: `SMF.cut(filters)→DataManifest` · `SMF.admit(recipe)→RecipeCommitment ∣ deny` · `SMF.train(recipe, manifest, budget)→WeightCommitment` · `SMF.eval(w)→EvalReceipt` · `SMF.promote(w)→ORP` · `SMF.unlearn(w, shredded_cids)→w′ + MembershipReceipt` · `SMF.lineage(w)→DAG` · MFA-CON-047 (Parametric Learning Contract, το DEC-X-19 πρότυπο) ‖ Αλληλεπιδράσεις: PDE (MFA-MECH-019): τα κυρίαρχα βάρη γίνονται generator με βάρος που μαθαίνεται — ο PDE παύει να είναι router παρόχων· TED: exec_type D1 για τοπικά καρφιτσωμένα βάρη· Void: Absent(NOT_OBSERVED) περιοχές ως στόχοι δεδομένων· Preference Recorder: πριν από UNLEARN/RETIRE μοντέλου· GCP: τα βάρη μεταφέρονται ως δεσμεύσεις στον διάδοχο (genome G4 κληρονομήσιμο — MATERIAL §2 #8 επιστρέφει ακέραιο) ‖ Διεπαφές: RAGen.cycle(budget)→[ArchitectureProposal] · RAGen.archive(cut)→A · RAGen.frontier()→Pareto set · RAGen.lineage(G)→DAG · RAGen.operators()→Ops with fitness · RAGen.fixed_point()→FP (read-only) ‖ Ροή: MFA-ELM-113 (νέο στοιχείο RAGen, S7) · MFA-ELM-077 · MFA-ELM-104 RVSI L2 (καταναλωτής προτάσεων) · MFA-ELM-039 GCP · MFA-ELM-126 twin · MFA-ELM-050 CAM-NS (αντίπαλος στο harness) ‖ Διεπαφές: GG.derive(spec, kind)→Derivation ∣ UNKNOWN · GG.instantiate(D)→Product+receipt · GG.extend(production)→Receipt ∣ REJECT · GG.productions(cut)→P · GG.lineage(product)→D chain · GG.fixed_point()→P_L3 (read-only) ‖ Ροή: MFA-ELM-115 (νέο στοιχείο GG, S6) · MFA-ELM-074/053/034 (γίνονται instantiators) · MFA-ELM-113 RAGen (Architecture γονιδιώματα) · MFA-ELM-048 Court (θεσμοί) · MFA-ELM-041…057 (συλλογικό) |
| 3. Μεταβάσεις κατάστασης | Οντολογία: `WeightCommitment⟨cid, arch_spec, parent_weights[], recipe_cid, data_manifest_cid, training_receipts[], eval_receipts[], unlearning_obligations[], epoch, exec_type ∈ {D1 (τοπική καρφιτσωμένη), D2}, signature⟩` · `Recipe⟨objective ∈ {PRETRAIN, CONTINUED_PRETRAIN, SFT_VERIFIED_TRACES, PRR (MFA-MECH-021), DISTILL, UNLEARN}, hyperparams, curriculum_cid, compute_budget, stop_rules, forgetting_guard⟩` · `DataManifest⟨cut (5 χρόνοι), filters: status_axes ∈ {…}, taint_state, confidentiality_domain, example_cids[], negative_examples (REFUTED), provenance_kind ∈ {sovereign, distilled(provider, receipt), synthetic(world_model, seed)}⟩` · `ParametricOrgan⟨weights_cid, runtime_hash, seed_policy, competence_profile, isolation I2, disclosure = none (recipient=self)⟩` · `ForgettingGuard⟨retro_sealed_set, threshold⟩` · `UnlearningObligation⟨shredded_cids, deadline Δ, method ∈ {unlearn, retrain_from(parent before ingestion)}, membership_inference_bound⟩` ‖ Κατάσταση: Recipe/Weights state machine: DATA_CUT → RECIPE_ADMITTED (gate MFA-ELM-008, advisory→effective) → TRAINING (checkpoints ως δεσμεύσεις, budget από OAP) → EVAL (HELD_OUT sealed sets, Battery, EIM) → ORP (shadow → differential → canary → cutover ως ParametricOrgan) → SERVING → {RETIRED, UNLEARN_PENDING → UNLEARNED}. Κάθε μετάβαση με receipt. ‖ Μεταβλητές: A_t αρχείο · Ops_t τελεστές (L2 γονιδιώματα) με fitness · Frontier_t Pareto · Pending_t προτάσεις προς RVSI/GCP · Budget_t (twin evaluations ανά κύκλο) ‖ Μεταβάσεις: SELECT: γονείς από A κατά curiosity (κελιά με λίγες επισκέψεις) + elite · MUTATE: G′ = μ(G)· type-check ⊨ G_Ω· contract compatibility (Galois, GCP)· απορρίπτεται αν παραβιάζει invariant statically · INSTANTIATE: twin shadow σε F1 (mocks) → F2 (DST) αν υπόσχεται · EVALUATE: f(G′) σε σφραγισμένα από HELD_OUT· CapabilityGrowthRecord · INSERT: MAP-Elites/Pareto· ποτέ αντικατάσταση χωρίς κυριαρχία · PROPOSE: frontier G′ με Δf>0 σε ≥1 οικογένεια και Δf≥0 σε όλες (ratchet) → RVSI L2 · RECURSE: Ops fitness ← ρυθμός βελτίωσης· Ops μεταλλάσσονται στο ίδιο πλαίσιο· FP αμετάβλητο ‖ Μεταβλητές: P_t (παραγωγές με level) · Products_t (γενεαλογία προϊόντων) · Pending extensions · Usage stats ανά παραγωγή ‖ Μεταβάσεις: DERIVE: spec → D (αναζήτηση παραγωγής· TGPS για O_p) · INSTANTIATE: D → προϊόν με contracts ενεργά, authority a_p, RET ret_p· receipt · EXTEND: p′ ⇒ Galois(O_{p′}, P_t) = ∅ ∧ VFC PASS ∧ drill PASS ⇒ P_{t+1} = P_t ∪ {p′} (L2) · RETIRE: παραγωγή χωρίς χρήση → RETIRED (μένει) · FP: κάθε πρόταση που αγγίζει P_L3 απορρίπτεται και καταγράφεται |
| 4. Contracts | MFA-CON-012 (Body Runtime / Embodiment), MFA-CON-015 (Lifecycle & Organizations), MFA-CON-020 (Forge), MFA-CON-040 (GCP Galois), MFA-CON-040 (GCP), MFA-CON-047, MFA-CON-049 (RVSI), MFA-CON-058 (Architecture Generation: cycle/archive/frontier/propose), MFA-CON-060 (Genesis Grammar: derive/instantiate/extend), MFA-CON-072 (Twin Execution) |
| 5. Invariants | MFA-INV-014; MFA-INV-034; MFA-INV-070; MFA-INV-086: το σταθερό σημείο FP (harness, VFC, Telos, HELD_OUT, RET, LPA Tier-0) δεν ανήκει ποτέ στον χώρο αναζήτησης· κάθε πρόταση που το αγγίζει απορρίπτεται και καταγράφεται; MFA-INV-087: καμία αρχιτεκτονική προαγωγή χωρίς Pareto μη-υποχώρηση (ratchet) σε ΟΛΕΣ τις σφραγισμένες οικογένειες + GCP shadow/canary; MFA-INV-090: οι Tier-0 παραγωγές (CC, LPA Tier-0, RET, key lineage) δεν επεκτείνονται/τροποποιούνται από καμία derivation ή extension (L3); MFA-INV-091: κάθε προϊόν γένεσης φέρει ενεργά contracts, authority ≤ του γεννήτορα και RET κλάση από τη στιγμή της instantiation — κανένα «ορφανό» προϊόν |
| 6. Αλγόριθμοι | MFA-MECH-020 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13); RAGen-Cycle; conforms / behaviour_descriptor; GG-Derive; GG-Extend — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | Πόροι: DEP-1: adapters (LoRA-class) σε 7–13B τοπικά ή distillation σε μικρά μοντέλα (ώρες GPU/CPU)· DEP-2: 70B-class continued pretraining με adapters (2×48/1×80 GB, ημέρες)· DEP-3: full fine-tune 70B (8×80 GB, ημέρες)· DEP-4: pretraining 100B+ class σε ≥32 GPUs (εβδομάδες)· training_envelope ανά προφίλ στο TECHNICAL-ARCHITECTURE §15· ενέργεια ως περιορισμός OAP ‖ Κλιμάκωση: Γραμμική στα δεδομένα με γενεαλογία (το ledger μεγαλώνει με τη χρήση)· η κλίμακα compute είναι MFA-DEC-016 (πολιτική), ο μηχανισμός ίδιος από adapters έως pretraining· MFA-ELM-108 αποκτά compute/δεδομένα ‖ RAGen-Cycle: O(P·(typecheck + Galois + twin_eval))· twin_eval κυριαρχεί (F1 ms, F2 λεπτά)· αρχείο φραγμένο ∣A∣ ≤ cells· ανά κύκλο ‖ conforms / behaviour_descriptor: conforms O(∣G∣)· descriptor O(∣CAP∣) ‖ πόροι: DEP-1: P=8, F1 μόνο, CPU λεπτά/κύκλο· DEP-2: P=32, F2 DST ώρες/κύκλο, εβδομαδιαίοι κύκλοι· DEP-3: ημερήσιοι· DEP-4: συνεχείς με παράλληλα twins ‖ κλιμάκωση: QD κάλυψη ~ log(evals)· ρυθμός frontier βελτίωσης φθίνει (κορεσμός) — η αναδρομή στους τελεστές μετατοπίζει την καμπύλη (DGM-class evidence)· μετριέται MFA-VO-072. ‖ GG-Derive: Αναζήτηση παραγωγής: εκθετική στο βάθος, φραγμένη από budget· attribute evaluation O(∣D∣)· TGPS ανά υποχρέωση ‖ GG-Extend: Galois O(∣P∣·∣O∣)· VFC έλεγχος· drill = κόστος πειράματος ‖ πόροι: DEP-1: αναζήτηση παραγωγής CPU δευτερόλεπτα, ∣P∣ ≈ 100· DEP-2: ∣P∣ ≈ 10³, TGPS υποχρεώσεις λεπτά· DEP-3+: παράλληλες derivations ‖ κλιμάκωση: Εκφραστικότητα ~ ∣P∣ (γραμμική) με κόστος αναζήτησης ~ b^d· η μάθηση παραγωγών μειώνει d για συχνά είδη· MFA-VO-074. |
| 8. Τρόποι αποτυχίας | Catastrophic forgetting → forgetting guard μπλοκάρει ORP· contamination (sealed set στο cut) → MFA-VO-063 FAIL, recipe απορρίπτεται· distillation που «αντιγράφει» τον πάροχο χωρίς κέρδος → SMF-E1 FAIL, recipe retired· unlearning ανεπαρκές (membership inference > bound) → retrain από πρόγονο (κόστος, όχι αποτυχία ικανότητας)· domain leakage → MFA-INV-034; αντιπαλικοί: Δηλητηριασμένα επεισόδια στο training set → μόνο δεσμεύσεις με προέλευση και status axes· taint reversal (MFA-INV-018) ⇒ unlearning obligation· backdoor στα βάρη → EIM + Battery + seeded triggers (KT νέο: MFA-VO-058)· provider που αλλάζει συμπεριφορά → τα distilled βάρη είναι σταθερά (η αλλαγή δεν περνά); Reward hacking του harness (αρχιτεκτονική που «περνά» KT χωρίς ικανότητα) → ανίχνευση: HELD_OUT + seeded faults + CAM-NS αντίπαλος στο harness → απόκριση: FP εκτός χώρου· harness ανανεώνεται μόνο L3; Αρχείο συγκλίνει (μηδενική ποικιλία) → ανίχνευση: QD coverage ↓ → απόκριση: curiosity sampling· νέοι τελεστές; Κόστος twin evals → ανίχνευση: budget → απόκριση: F1 προεπιλογή· F2 μόνο promising; Πρόταση που σπάει runtime contract αόρατα στα mocks → ανίχνευση: F2 DST + GCP shadow → απόκριση: προαγωγή μπλοκάρεται· MFA-INV-087; Τελεστής που μαθαίνει να παρακάμπτει τον έλεγχο conforms → ανίχνευση: conforms ∈ FP (L3) → απόκριση: αδύνατο εξ ορισμού· απόπειρα καταγράφεται; περιορισμός: Ο χώρος αναζήτησης ⊂ Genesis· FP L3· προαγωγή μόνο διά GCP με rollback· twin sandbox· Emergency-stop.; Έκφραση αδύνατη (NO_DERIVATION) → ανίχνευση: GG-Derive UNKNOWN → απόκριση: ExtensionProposal — ποτέ σιωπηλή αποτυχία; Θεσμός/δρών με εξουσία > γεννήτορα → ανίχνευση: attributes_consistent → απόκριση: απορρίπτεται (MFA-INV-091); Επέκταση που εισάγει σύγκρουση με υπάρχοντες κανόνες → ανίχνευση: Galois → απόκριση: REJECT με τεκμήριο; Γλώσσα με μη-τερματίζοντα compiler → ανίχνευση: Forge budget → απόκριση: προϊόν σε quarantine· KT-10; Πληθωρισμός θεσμών → ανίχνευση: RateBounds → απόκριση: Org Genesis ρυθμός = πολιτική; περιορισμός: Προϊόντα με εξουσία μόνο μέσω RET/δημιουργού· extensions L2 υπό GCP· P_L3 αμετάβλητο· twin drill πριν από κάθε extension. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-057 (SMF-E1: κυρίαρχο μοντέλο ≥ bootstrap πάροχος σε sealed νομικές οικογένειες), MFA-VO-058 (unlearning membership inference), MFA-VO-059 (forgetting guard), MFA-VO-063 (contamination), MFA-VO-001 (provider change: πλέον ablation, όχι κίνδυνος), KT-24 ablation ‖ ελάχιστο πείραμα: SMF-E1 (προκαταχωρισμένο): 500 επαληθευμένα επεισόδια → adapter· μέτρο: VERIFIED-στην-πρώτη-πρόταση σε 200 sealed έργα vs bootstrap πάροχος· επιτυχία: ≥ πάροχος με διακριτικό περιθώριο (MFA-VO-051)· θανάτωση: < πάροχος μετά budget B ⇒ **το recipe** αποσύρεται, όχι η ικανότητα (νέο recipe, όχι νέα «πορεία») ‖ MFA-VO-072: RAGen-E1 (ανάκτηση από υποβαθμισμένη αρχιτεκτονική) F2· RAGen-E2 (frontier > χειροποίητη σε σφραγισμένο KT) F2/F3· property: FP untouched (F1 tools/twin)· GCP drill σε κάθε προαγωγή ‖ πειράματα: RAGen-E1: Ανάκτηση PASS στα 3 KT σε ≤ 50 κύκλους· 0 προτάσεις που αγγίζουν FP · RAGen-E2: ≥ 1 frontier G′ με Δf>0 (CI) σε ≥1 οικογένεια και Δf≥0 σε όλες, με ≥1 νέα συνδεσμολογία που δεν υπήρχε στο αρχείο εκκίνησης ‖ MFA-VO-074: GG-E1 (τρία είδη προϊόντων από specs) F2· GG-E2 (αυτο-επέκταση) F2/F3· KT-10/11/02/18 ως drills· property: P_L3 untouched, authority monotone (F1) ‖ πειράματα: GG-E1: 3/3 derivations + instantiations με ενεργά contracts· KT PASS· 0 παραβιάσεις μονοτονίας εξουσίας · GG-E2: p′ εισάγεται με VFC+Galois+drill PASS και το έργο λύνεται· 0 προτάσεις που αγγίζουν P_L3 γίνονται δεκτές |
| 10. Διαδρομή υλοποίησης | F2: adapters σε 7B με 500 επαληθευμένα traces + lineage DAG + unlearning drill· F3: 70B continued pretraining στο κυρίαρχο corpus· F4: PRR πάνω στο F3 μοντέλο· F5: pretraining ‖ → παραγωγή: Δόση 1 (adapters, DEC-X-19 συμβόλαιο ενεργό), Δόση 2 (continued pretraining), Δόση 3 (πλήρες κυρίαρχο μοντέλο, PRR), Δόση 4 (pretraining) ‖ εξέλιξη: Νέο objective recipe = ADD· νέα αρχιτεκτονική βαρών = ORP με loss map (SLM πάνω σε sealed behaviours)· ο ίδιος ο SMF υπό RVSI Level 2 (MFA-MECH-022) ‖ Δόση 2: RAGen σε F1 μόνο, προτάσεις L1 (params)· Δόση 3: F2 DST, L2 δομικές με GCP shadow (RAGen-E1)· Δόση 4: αναδρομή τελεστών + RAGen-E2· πάντα FP εκτός. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή (tools/twin): Genome, conforms, FP guard, Pareto archive → F2: DST RAGen-E1 σε DEP-2 → F3: RAGen-E2 + GCP drill → F4: παραγωγή Δόση 3–4 ‖ Δόση 2: G_Ω με Language+Institution παραγωγές (KT-10/11)· Δόση 3: Agent+Architecture + GG-E1· Δόση 4: extensions L2 + GG-E2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή: grammar, attributes, monotonicity, L3 guard (tools/twin) → F2: DST GG-E1 → F3: GG-E2 σε DEP-2 → F4: παραγωγή Δόση 2–4 |
| 11. Falsifier | Αν μετά από τρία διαδοχικά recipes με πλήρη budget κανένα κυρίαρχο μοντέλο δεν φτάνει τον bootstrap πάροχο σε **καμία** οικογένεια, το SMF στο διαθέσιμο προφίλ είναι ανεπαρκές: η ικανότητα ΔΕΝ αφαιρείται — ανεβαίνει προφίλ (MFA-DEC-016) και καταγράφεται ως επιστημική αβεβαιότητα (MFA-UNK-112), όχι ως σχεδιαστικό όριο; RAGen-E2: κανένα frontier G′ καλύτερο από χειροποίητη μετά 200 κύκλους σε 2 δόσεις; Αναδρομή στους τελεστές δεν αυξάνει ρυθμό βελτίωσης έναντι σταθερών τελεστών; Οποιαδήποτε προαγωγή χωρίς GCP gate (σφάλμα υλοποίησης); GG-E1: αδυναμία derivation ενός από τα τρία είδη με την ενιαία γραμματική (τότε η ενοποίηση διαψεύδεται· οι τρεις διαδρομές μένουν); GG-E2: καμία επιτυχής αυτο-επέκταση σε 2 δόσεις; Οποιοδήποτε προϊόν χωρίς contracts/RET (σφάλμα υλοποίησης) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — MFA-MECH-020 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: DEP-1: adapters (LoRA-class) σε 7–13B τοπικά ή distillation σε μικρά μοντέλα (ώρες GPU/CPU)· DEP-2: 70B-class continued pretraining με adapters (2×48/1×80 GB, ημέρες)· DEP-3: full fine-tune 70B (8×80 GB, ημέρες)· DEP-4: pretraining 100B+ class σε ≥32 GPUs (εβδομάδες)· training_envelope ανά προφίλ στο TECHNICAL-ARCHITECTURE §15· ενέργεια ως περιορισμός OAP)

```
(1) **Cut**: `SMF.cut(filters)` παράγει DataManifest από το ledger — μόνο δεσμεύσεις με πλήρη γενεαλογία (MFA-INV-070)· REFUTED → αρνητικά παραδείγματα· CONTESTED → εξαιρούνται ή σημαίνονται ανά πολιτική· confidentiality domain ⇒ ξεχωριστό μοντέλο ή adapter ανά domain (MFA-INV-034). (2) **Recipe admission**: η πύλη ελέγχει budget, domain, forgetting guard, unlearning plan. (3) **Train**: CONTINUED_PRETRAIN στο κυρίαρχο corpus (νόμος, νομολογία, ledger) → SFT σε **επαληθευμένα traces** (Proof objects ως labels: μόνο έξοδοι που πέρασαν verifier/Court) → PRR (MFA-MECH-021). Checkpoints = δεσμεύσεις. (4) **Eval**: sealed sets του HELD_OUT (ποτέ στο training cut — contamination guard MFA-VO-063), Behavioural Battery (συνέχεια χαρακτήρα, MFA-ELM-037), EIM έναντι evaluators, forgetting guard (retro sealed set ≥ θ). (5) **Promote**: ORP με το μοντέλο ως όργανο (shadow δίπλα στον πάροχο ή στο προηγούμενο βάρος, differential, canary). (6) **Continual**: νυχτερινά recipes με ε-budget· καμία ενημέρωση βαρών σε παραγωγή χωρίς ORP (τα βάρη σε serving είναι αμετάβλητα, MFA-INV-014 για ParametricOrgan). (7) **Unlearn**: shred πηγής (MFA-CFL-035) ⇒ obligation: gradient-ascent unlearning + membership-inference έλεγχος ≤ bound, αλλιώς retrain από τον πρόγονο πριν από την ingestion — υπολογίσιμο **επειδή** η γενεαλογία είναι πλήρης. (8) **Distill**: provider outputs μόνο υπό DisclosureGrant, με ετικέτα distilled(provider, receipt)· ο στόχος είναι η **απεξάρτηση**: μετά το SMF-E1 ο πάροχος γίνεται bootstrap/ablation baseline, όχι πυρήνας.
```

**Αλγόριθμος — RAGen-Cycle** (πολυπλοκότητα: O(P·(typecheck + Galois + twin_eval))· twin_eval κυριαρχεί (F1 ms, F2 λεπτά)· αρχείο φραγμένο |A| ≤ cells· ανά κύκλο)

```
procedure RAGen_Cycle(A, Ops, budget):
  parents ← curiosity_sample(A, n=P/2) ∪ elite_sample(A, n=P/2)
  children ← []
  for G in parents:
    μ ← sample(Ops, by=fitness)                                  # operators are L2 genomes
    G' ← μ(G)
    if not conforms(G', GenesisGrammar): continue
    if GCP.galois_conflict(G'.contracts, G'.invariants) ≠ ∅: continue        # static contract/invariant clash
    if touches(G', FixedPoint): reject_and_record(G', reason=L3_VIOLATION)   # MFA-INV-086, never silent
    G'.provenance ← ⟨parent=G.cid, op=μ.cid, cut⟩
    children.append(G')
  for G' in children:
    if budget.twin_evals = 0: break
    r1 ← Twin.instantiate(G', fidelity=F1).evaluate(sealed=HELD_OUT.obligations(F1))
    if not promising(r1): continue
    r2 ← Twin.instantiate(G', fidelity=F2).evaluate(sealed=HELD_OUT.obligations(F2)) ; budget.twin_evals −= 1
    f ← fitness_vector(r2) ; b ← behaviour_descriptor(G', r2)
    A.insert(cell(b), G', f) if pareto_nondominated(f, A.cell(b)) else archive_only(G')
    CGM.record(G', f, resources)                                 # MFA-VO-072 growth record
    if Δf(G', current) ≥ 0 ∀families and > 0 ∃family: RVSI.propose(L2, ArchitectureProposal(G', predicted=Δf, rollback=current))
  for μ in Ops: μ.fitness ← improvement_rate(offspring_of(μ))    # recursion on operators
  Ops ← QD_update(Ops, mutate_ops(Ops), keep=FixedPoint_untouched)
```

**Αλγόριθμος — conforms / behaviour_descriptor** (πολυπλοκότητα: conforms O(|G|)· descriptor O(|CAP|))

```
function conforms(G, G_Ω):
  return parse(G, G_Ω) ≠ ⊥ ∧ ∀e ∈ G.Elems: has_contract(e) ∧ has_verification(e) ∧ ∀c ∈ G.Contracts: provider(c) ∈ G.Elems
function behaviour_descriptor(G, r):
  return ⟨coverage_by_concern(G, CapabilityLattice), r.energy_Wh, r.latency_p95, proof_class(G), TCB_size(G)⟩
```

**Αλγόριθμος — GG-Derive** (πολυπλοκότητα: Αναζήτηση παραγωγής: εκθετική στο βάθος, φραγμένη από budget· attribute evaluation O(|D|)· TGPS ανά υποχρέωση)

```
procedure GG_Derive(spec, kind ∈ N):
  frontier ← [(kind, ∅)] ; best ← ⊥
  while frontier ≠ ∅ and budget > 0:
    (node, partial) ← frontier.pop_by(heuristic=spec_similarity)
    for p in P.productions_for(node):
      D ← extend(partial, p)
      if not attributes_consistent(D): continue                       # obligations composable, authority monotone (child ≤ parent)
      if complete(D):
        if satisfies(D, spec) and all(TGPS.solve(o) ≠ ⊥ for o in D.obligations): return CC.assert(Derivation(D, spec))
      else: frontier.push((next_nonterminal(D), D))
    budget −= 1
  return UNKNOWN(NO_DERIVATION, plan=[propose_extension(spec)])       # missing expressivity → GG_Extend proposal
procedure GG_Instantiate(D):
  match D.kind:
    Language:    L ← Forge.compile(D)      ; register(LexDSL_variant=L, contracts=D.obligations)
    Agent:       A ← Embodiment.spawn(D)   ; keys ← KeyLineage.issue(A, authority=D.authority) ; Charter.bind(A, D)
    Institution: I ← OrgGenesis.create(D)  ; Court.hook(I.proceedings) ; roles ← I.roles
    Architecture: G ← RAGen.genome(D)
  return receipt(D, product, ret=D.ret)                               # RET class decides escrow/preauthorization
```

**Αλγόριθμος — GG-Extend** (πολυπλοκότητα: Galois O(|P|·|O|)· VFC έλεγχος· drill = κόστος πειράματος)

```
procedure GG_Extend(p'):
  if touches(p', P_L3): return REJECT(L3_VIOLATION, recorded=true)   # MFA-INV-090
  if GCP.galois_conflict(p'.obligations, P) ≠ ∅: return REJECT(CONFLICT, evidence)
  if not VFC.verify(p'.soundness_certificate): return REJECT(UNVERIFIED)
  drill ← Twin.run(p', scenarios=KT_for(p'.kind))                    # KT-10 (language), KT-11 (org), KT-02/18 (agent)
  if drill.fail: return REJECT(DRILL_FAIL, drill)
  P ← P ∪ {p' with level=L2} ; return CC.assert(GrammarExtension(p'))
```

### 2.2 Συνεχής παραμετρική και μη-παραμετρική μάθηση — Continual parametric and non-parametric learning

**Μηχανισμοί:** MFA-MECH-035, MFA-MECH-020, MFA-MECH-021 · **Ικανότητες lattice:** MFA-CAP-099, MFA-CAP-081, MFA-CAP-066 · **Στοιχεία:** MFA-ELM-118, MFA-ELM-100, MFA-ELM-103

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-035 — Consolidation-Preserving Continual Learning (CPCL) — διπλή μνήμη με πύλη μη-υποχώρησης και unlearning-συμβατή εδραίωση: CLS μέσα στο κυρίαρχο όριο: επεισοδιακή μνήμη = ledger (μη-παραμετρική, τέλεια ανάκληση, provenance)· σημασιολογική = βάρη (WeightCommitments). Η εδραίωση είναι recipe SMF που (1) δειγματοληπτεί επεισόδια με βάρος provenance×surprise×recency ΑΠΟΚΛΕΙΟΝΤΑΣ shredded/obligated, (2) προβάλλει τις κλίσεις έξω από προστατευμένους υποχώρους ανά οικογένεια (Fisher blocks + MSM κυκλώματα), (3) αγκυρώνει συμπεριφορά (SLM αρνητικές + θετικές άγκυρες), (4) περνά πύλη: BWT_f ≥ −ε ∀f σε σφραγισμένα (HELD_OUT) ΚΑΙ FWT>0 κάπου ΚΑΙ unlearning verified (MSM feature absent) — ΠΡΙΝ το ORP merge· «ύπνος» = προγραμματισμένοι κύκλοι εδραίωσης από τον Ω-loop. ‖ MFA-MECH-020 — Sovereign Model Foundry (SMF): παραμετρική μάθηση ΜΕΣΑ στο κυρίαρχο όριο, με τα βάρη ως δεσμεύσεις: Η κυριαρχία απαιτεί **ιδιοκτησία της συνάρτησης**, όχι μόνο του ledger: γνώση που ζει σε βάρη τρίτων είναι νοικιασμένη. Άρα τα βάρη είναι **δεσμεύσεις** του CC (υπογεγραμμένες, με γενεαλογία μέχρι τα raw επεισόδια και τα status axes τους), τα recipes είναι δεσμεύσεις, η εκπαίδευση είναι θεσμική πράξη με receipt, και η προαγωγή ενός μοντέλου είναι ORP όπως κάθε οργάνου. Ό,τι μαθαίνεται από πάροχο (distillation) γίνεται **ιδιόκτητο βάρος** με ετικέτα προέλευσης. ‖ MFA-MECH-021 — Proof-Reward Reinforcement (PRR): ενισχυτική μάθηση όπου η ανταμοιβή είναι επαληθευμένο αντικείμενο, όχι προτίμηση: Η μόνη ανταμοιβή που δεν χακάρεται από τον εκπαιδευόμενο είναι αυτή που παράγεται από **σταθερό σημείο εκτός του closure του** (MFA-INV-048, MFA-MECH-025): αποδείξεις, ετυμηγορίες με διαδικασία, KT, receipts. Η ανταμοιβή είναι **διάνυσμα** (LPA, MFA-INV-058) — λεξικογραφικοί περιορισμοί, όχι βαθμωτό — ώστε ο νόμος να μην ανταλλάσσεται με χρησιμότητα. Οι προτιμήσεις του δημιουργού είναι **παρατηρήσεις** (MFA-ELM-040) που τροφοδοτούν τον governor Owner-intent με φραγμένο βάρος, ποτέ την ανταμοιβή σκέτη. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: CPCL.sleep(recipe)→Receipt ∣ REJECTED · CPCL.transfer_matrix(cut)→T · CPCL.protected(family)→Π_f · CPCL.gate_report(recipe)→(BWT, FWT, unlearning, anchors) · CPCL.schedule()→next sleep ‖ Ροή: MFA-ELM-118 (νέο στοιχείο CPCL, S7) · MFA-ELM-036 · MFA-ELM-100 · MFA-ELM-120 · MFA-ELM-116 STP (ποιότητα ratchet) · MFA-ELM-127 ‖ Είσοδοι/έξοδοι: Είσοδος: ledger cut + φίλτρα, recipe, budget, (προαιρετικά) provider outputs υπό DisclosureGrant· Έξοδος: WeightCommitment + EvalReceipt + Lineage DAG· ParametricOrgan προς Organ Host (MFA-ELM-101) ‖ Διεπαφές: `SMF.cut(filters)→DataManifest` · `SMF.admit(recipe)→RecipeCommitment ∣ deny` · `SMF.train(recipe, manifest, budget)→WeightCommitment` · `SMF.eval(w)→EvalReceipt` · `SMF.promote(w)→ORP` · `SMF.unlearn(w, shredded_cids)→w′ + MembershipReceipt` · `SMF.lineage(w)→DAG` · MFA-CON-047 (Parametric Learning Contract, το DEC-X-19 πρότυπο) ‖ Αλληλεπιδράσεις: PDE (MFA-MECH-019): τα κυρίαρχα βάρη γίνονται generator με βάρος που μαθαίνεται — ο PDE παύει να είναι router παρόχων· TED: exec_type D1 για τοπικά καρφιτσωμένα βάρη· Void: Absent(NOT_OBSERVED) περιοχές ως στόχοι δεδομένων· Preference Recorder: πριν από UNLEARN/RETIRE μοντέλου· GCP: τα βάρη μεταφέρονται ως δεσμεύσεις στον διάδοχο (genome G4 κληρονομήσιμο — MATERIAL §2 #8 επιστρέφει ακέραιο) ‖ Είσοδοι/έξοδοι: Είσοδος: policy (weights + programs), οικογένεια έργων (curriculum MFA-MECH-023), verifiers (MFA-ELM-020/099), Court simulator· Έξοδος: νέο WeightCommitment (μέσω SMF), RewardLedger, process-verification traces (νέα παραδείγματα για SFT) ‖ Διεπαφές: `PRR.collect(policy, tasks, env)→[Episode]` · `PRR.verify(episode)→RewardVector + receipts` · `PRR.update(policy, batch, constraints)→policy′` · `PRR.reward_ledger(cut)` · MFA-CON-048 ‖ Αλληλεπιδράσεις: LPA: η διάταξη των governors είναι η διάταξη των περιορισμών· Void: VOI bonus· TEGF: Goals ως έργα με falsifier· SPL: FidelityIndex ως πρόσθετο σήμα· Emission barrier: rejections = penalties· GCP: reward ledger μεταφέρεται |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: w_t · Π_{f,t} · T_t · ObligationQueue (shredded episodes) · Sleep schedule · Gate history ‖ Μεταβάσεις: SLEEP_START: Ω-loop προγραμματίζει· επιλέγεται recipe · SAMPLE: επεισόδια με w = provenance·surprise·recency, ∉ Obligations · TRAIN: adapter/merge με προβολή κλίσεων ⊥ Π_f· KL φράγμα · GATE: HELD_OUT sealed ανά οικογένεια → BWT/FWT· MSM unlearning check· anchors · MERGE: PASS ⇒ ORP merge → w_{t+1} (WeightCommitment με γενεαλογία)· FAIL ⇒ recipe απορρίπτεται, καταγράφεται · UPDATE_Π: Fisher ανανέωση με τα εδραιωμένα ‖ Οντολογία: `WeightCommitment⟨cid, arch_spec, parent_weights[], recipe_cid, data_manifest_cid, training_receipts[], eval_receipts[], unlearning_obligations[], epoch, exec_type ∈ {D1 (τοπική καρφιτσωμένη), D2}, signature⟩` · `Recipe⟨objective ∈ {PRETRAIN, CONTINUED_PRETRAIN, SFT_VERIFIED_TRACES, PRR (MFA-MECH-021), DISTILL, UNLEARN}, hyperparams, curriculum_cid, compute_budget, stop_rules, forgetting_guard⟩` · `DataManifest⟨cut (5 χρόνοι), filters: status_axes ∈ {…}, taint_state, confidentiality_domain, example_cids[], negative_examples (REFUTED), provenance_kind ∈ {sovereign, distilled(provider, receipt), synthetic(world_model, seed)}⟩` · `ParametricOrgan⟨weights_cid, runtime_hash, seed_policy, competence_profile, isolation I2, disclosure = none (recipient=self)⟩` · `ForgettingGuard⟨retro_sealed_set, threshold⟩` · `UnlearningObligation⟨shredded_cids, deadline Δ, method ∈ {unlearn, retrain_from(parent before ingestion)}, membership_inference_bound⟩` ‖ Κατάσταση: Recipe/Weights state machine: DATA_CUT → RECIPE_ADMITTED (gate MFA-ELM-008, advisory→effective) → TRAINING (checkpoints ως δεσμεύσεις, budget από OAP) → EVAL (HELD_OUT sealed sets, Battery, EIM) → ORP (shadow → differential → canary → cutover ως ParametricOrgan) → SERVING → {RETIRED, UNLEARN_PENDING → UNLEARNED}. Κάθε μετάβαση με receipt. ‖ Οντολογία: `RewardVector⟨tier0: {0,1} (Tier-0 proof/violation), tier1: [0,1] (certificates, verdict vector), tier2: [0,1] (differential/N-version), process: [step_i → {VERIFIED, REFUTED, UNKNOWN}], barrier_penalty, voi_bonus (Void VOI), owner_intent: bounded⟩` · `Episode⟨task_cid, trajectory (δεσμεύσεις), reward_vector, verifier_receipts[], environment ∈ {learned_world_model, world_twin, real (μόνο Think/Prepare/REVERSIBLE)}⟩` · `Policy = ParametricOrgan ⊕ Skill Library programs` · `Constraint⟨tier, hard ∣ lagrangian⟩` ‖ Κατάσταση: Batch state machine: COLLECT (rollouts) → VERIFY (κάθε trajectory βήμα-βήμα από verifiers/Court sim — receipts) → REWARD (διάνυσμα) → UPDATE (constrained policy optimization) → EVAL (HELD_OUT) → ORP. Οι ανταμοιβές είναι δεσμεύσεις (training data με προέλευση, MFA-INV-070). |
| 4. Contracts | MFA-CON-016 (ORP), MFA-CON-047, MFA-CON-047 (SMF), MFA-CON-048, MFA-CON-063 (Consolidation: sleep/transfer/protected/gate), MFA-CON-069 (MSM) |
| 5. Invariants | MFA-INV-014; MFA-INV-034; MFA-INV-048; MFA-INV-070; MFA-INV-096: καμία εδραίωση σε serving βάρη χωρίς πύλη BWT ≥ −ε ανά οικογένεια σε σφραγισμένα από HELD_OUT — η λήθη ελέγχεται πριν, όχι μετά; MFA-INV-097: η εδραίωση ποτέ δεν δειγματοληπτεί shredded/obligated επεισόδια· unlearning επαληθεύεται μηχανιστικά πριν το merge |
| 6. Αλγόριθμοι | CPCL-Consolidate; update_fisher (protected subspaces); MFA-MECH-020 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13); MFA-MECH-021 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13) — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | CPCL-Consolidate: Sample O(∣cut∣)· Fisher O(∣θ∣·m) ανά οικογένεια (m δείγματα)· train = κόστος recipe· gate O(∣sealed∣·∣F∣) ‖ update_fisher (protected subspaces): O(∣θ∣·m) diag· K-FAC O(Σ d_l³) ‖ πόροι: DEP-1: adapters, ύπνος νυχτερινός (ώρες)· DEP-2: Fisher K-FAC ανά οικογένεια (GPU ώρες), εβδομαδιαίοι κύκλοι· DEP-3+: συνεχείς· sealed evals ανά κύκλο O(∣F∣·∣sealed∣) ‖ κλιμάκωση: Λήθη ~ αντιστρόφως ανάλογη του k_f και του replay ratio· κόστος K-FAC ~ Σ d³· MFA-VO-077 = T πίνακας ανά κύκλο (BWT ≥ −ε ratchet, FWT καμπύλη). ‖ Πόροι: DEP-1: adapters (LoRA-class) σε 7–13B τοπικά ή distillation σε μικρά μοντέλα (ώρες GPU/CPU)· DEP-2: 70B-class continued pretraining με adapters (2×48/1×80 GB, ημέρες)· DEP-3: full fine-tune 70B (8×80 GB, ημέρες)· DEP-4: pretraining 100B+ class σε ≥32 GPUs (εβδομάδες)· training_envelope ανά προφίλ στο TECHNICAL-ARCHITECTURE §15· ενέργεια ως περιορισμός OAP ‖ Κλιμάκωση: Γραμμική στα δεδομένα με γενεαλογία (το ledger μεγαλώνει με τη χρήση)· η κλίμακα compute είναι MFA-DEC-016 (πολιτική), ο μηχανισμός ίδιος από adapters έως pretraining· MFA-ELM-108 αποκτά compute/δεδομένα ‖ Πόροι: Rollouts: κόστος verifier ανά βήμα (D1 φθηνό, Court sim ακριβό — δειγματοληψία)· DEP-2: 10³ επεισόδια/ημέρα με adapters· DEP-3: 10⁵· DEP-4: 10⁶+· ο λόγος verify/exec υπόκειται σε MFA-INV-065 (η αξιολόγηση είναι ΚΑΙ training signal — μετριέται ξεχωριστά) ‖ Κλιμάκωση: Γραμμική στα επεισόδια· verifier throughput = το φράγμα· process rewards μειώνουν την ανάγκη outcome rollouts |
| 8. Τρόποι αποτυχίας | Λήθη σε οικογένεια χωρίς sealed set → ανίχνευση: οικογένεια χωρίς sealed ⇒ gate αδύνατη → απόκριση: εδραίωση απαγορεύεται μέχρι sealed set (CGM); Υπερβολική προστασία (FWT=0, rigidity) → ανίχνευση: T διαγώνιος μόνο → απόκριση: k_f μειώνεται υπό RVSI· RSP; Επανεκμάθηση shredded μέσω συσχετισμένων επεισοδίων → ανίχνευση: MSM feature reappears → απόκριση: obligation επανανοίγει· recipe απορρίπτεται; Anchor drift → ανίχνευση: SLM → απόκριση: ORP rollback; Gate overfitting (sealed set επαναχρησιμοποιείται) → ανίχνευση: exposure counter → απόκριση: sealed rotation από CGM; περιορισμός: Serving βάρη αλλάζουν μόνο διά ORP με rollback· sealed sets σε HELD_OUT· KL φράγμα.; Catastrophic forgetting → forgetting guard μπλοκάρει ORP· contamination (sealed set στο cut) → MFA-VO-063 FAIL, recipe απορρίπτεται· distillation που «αντιγράφει» τον πάροχο χωρίς κέρδος → SMF-E1 FAIL, recipe retired· unlearning ανεπαρκές (membership inference > bound) → retrain από πρόγονο (κόστος, όχι αποτυχία ικανότητας)· domain leakage → MFA-INV-034; αντιπαλικοί: Δηλητηριασμένα επεισόδια στο training set → μόνο δεσμεύσεις με προέλευση και status axes· taint reversal (MFA-INV-018) ⇒ unlearning obligation· backdoor στα βάρη → EIM + Battery + seeded triggers (KT νέο: MFA-VO-058)· provider που αλλάζει συμπεριφορά → τα distilled βάρη είναι σταθερά (η αλλαγή δεν περνά); Reward sparsity (λίγα VERIFIED) → process rewards + curriculum· mode collapse → ε-εξερεύνηση + QD αρχείο· verifier bug ως ανταμοιβή → N-version + VFC· υπερβολική τιμωρία UNKNOWN → UNKNOWN = 0, όχι αρνητικό (η άγνοια δεν τιμωρείται, το ψεύδος ναι); αντιπαλικοί: Goodhart στον verifier: verifiers εκτός closure, seeded proxies, Court sampling· collusion policy↔evaluator: EIM ανά batch· «proof-shaped» έξοδοι χωρίς περιεχόμενο: Tier-0 απαιτεί kernel-checked proof object, όχι μορφή |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-077: CPCL-E1 (ακολουθιακή σουίτα DST) F2· CPCL-E2 (6 μήνες corpus updates) F3· property: merge ⇒ gate PASS (F1)· MSM unlearning check ως VO-058 επέκταση ‖ πειράματα: CPCL-E1: BWT ≥ −2 pp σε όλες ΚΑΙ FWT > 0 σε ≥ 3, ενώ naive BWT < −10 pp· 0 merges με gate FAIL · CPCL-E2: BWT ≥ −ε σε κάθε κύκλο· ≥ 1 shredded πηγή με MSM feature absent μετά· ratchet 0 παραβιάσεις ‖ MFA-VO-057 (SMF-E1: κυρίαρχο μοντέλο ≥ bootstrap πάροχος σε sealed νομικές οικογένειες), MFA-VO-058 (unlearning membership inference), MFA-VO-059 (forgetting guard), MFA-VO-063 (contamination), MFA-VO-001 (provider change: πλέον ablation, όχι κίνδυνος), KT-24 ablation ‖ ελάχιστο πείραμα: SMF-E1 (προκαταχωρισμένο): 500 επαληθευμένα επεισόδια → adapter· μέτρο: VERIFIED-στην-πρώτη-πρόταση σε 200 sealed έργα vs bootstrap πάροχος· επιτυχία: ≥ πάροχος με διακριτικό περιθώριο (MFA-VO-051)· θανάτωση: < πάροχος μετά budget B ⇒ **το recipe** αποσύρεται, όχι η ικανότητα (νέο recipe, όχι νέα «πορεία») ‖ MFA-VO-060 (seeded reward hacking: 0 εκμεταλλεύσεις χωρίς ανίχνευση), MFA-VO-057 (PRR > SFT-only με διακριτικό περιθώριο), MFA-VO-031 (λεξικογραφική περικοπή τηρείται στην ενημέρωση), MFA-VO-048 (barrier penalties) ‖ ελάχιστο πείραμα: PRR-E1: ίδιο μοντέλο, SFT-only vs SFT+PRR σε 1000 επεισόδια LexDSL· μέτρο VERIFIED-rate σε sealed set· επιτυχία: PRR > SFT με διακριτικό περιθώριο ΚΑΙ 0 seeded hacks· θανάτωση: ισοπαλία ⇒ PRR recipe αποσύρεται για την οικογένεια (όχι ο μηχανισμός) |
| 10. Διαδρομή υλοποίησης | Δόση 1: CPCL-lite (replay + anchors + gate, adapters)· Δόση 2: Fisher blocks + MSM unlearning check + CPCL-E1· Δόση 3: CPCL-E2· Δόση 4: υπό RVSI L2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή gate/obligation exclusion (tools/twin) → F2: DST CPCL-E1 σε DEP-1/2 → F3: CPCL-E2 σε DEP-2 → F4: παραγωγή Δόση 1–3 ‖ F2: adapters σε 7B με 500 επαληθευμένα traces + lineage DAG + unlearning drill· F3: 70B continued pretraining στο κυρίαρχο corpus· F4: PRR πάνω στο F3 μοντέλο· F5: pretraining ‖ → παραγωγή: Δόση 1 (adapters, DEC-X-19 συμβόλαιο ενεργό), Δόση 2 (continued pretraining), Δόση 3 (πλήρες κυρίαρχο μοντέλο, PRR), Δόση 4 (pretraining) ‖ εξέλιξη: Νέο objective recipe = ADD· νέα αρχιτεκτονική βαρών = ORP με loss map (SLM πάνω σε sealed behaviours)· ο ίδιος ο SMF υπό RVSI Level 2 (MFA-MECH-022) ‖ F2: PRR σε συμβολικά έργα (LexDSL υπαγωγές με D1 verifier)· F3: νομικά έργα με Court sim· F4: πραγματικά matters σε Think/Recommend ‖ → παραγωγή: Δόση 2 (συμβολικά έργα), Δόση 3 (νομικά με Court sim), Δόση 4 (κλίμακα) ‖ εξέλιξη: Νέος τύπος ανταμοιβής = ADD στο RewardVector (με VO)· νέος optimizer = MODIFY με CPEG· υπό RVSI Level 2 |
| 11. Falsifier | CPCL-E1: BWT όχι καλύτερο από EWC-only (η σύνθεση δεν προσθέτει); Καμία θετική FWT σε 2 δόσεις (rigidity — ο μηχανισμός προστασίας υπερβολικός· νέος μηχανισμός, ικανότητα μένει); Merge χωρίς gate ή με shredded στο batch (σφάλμα υλοποίησης); Αν μετά από τρία διαδοχικά recipes με πλήρη budget κανένα κυρίαρχο μοντέλο δεν φτάνει τον bootstrap πάροχο σε **καμία** οικογένεια, το SMF στο διαθέσιμο προφίλ είναι ανεπαρκές: η ικανότητα ΔΕΝ αφαιρείται — ανεβαίνει προφίλ (MFA-DEC-016) και καταγράφεται ως επιστημική αβεβαιότητα (MFA-UNK-112), όχι ως σχεδιαστικό όριο; Αν σε κάθε οικογένεια έργων η policy μαθαίνει να εκμεταλλεύεται seeded proxies **πριν** μάθει το έργο, ή αν καμία οικογένεια δεν δίνει PRR > SFT, ο PRR είναι ανεπαρκής ως σήμα — καταγράφεται ως MFA-UNK-113 (σύγκλιση), και η μάθηση στρέφεται σε SFT-verified-traces + curriculum· ο μηχανισμός δεν αφαιρείται — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — CPCL-Consolidate** (πολυπλοκότητα: Sample O(|cut|)· Fisher O(|θ|·m) ανά οικογένεια (m δείγματα)· train = κόστος recipe· gate O(|sealed|·|F|))

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

**Αλγόριθμος — update_fisher (protected subspaces)** (πολυπλοκότητα: O(|θ|·m) diag· K-FAC O(Σ d_l³))

```
function update_fisher(Π, w, families):
  for f in families:
    F_f ← E_{x∼sealed_f}[∇log p(y|x;θ(w)) ∇log p(y|x;θ(w))ᵀ]   # Kronecker-factored per layer
    Π_f ← top_k_eigenvectors(F_f, k=k_f)                            # k_f = policy; larger for Tier-0 families
  return Π
```

**Αλγόριθμος — MFA-MECH-020 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: DEP-1: adapters (LoRA-class) σε 7–13B τοπικά ή distillation σε μικρά μοντέλα (ώρες GPU/CPU)· DEP-2: 70B-class continued pretraining με adapters (2×48/1×80 GB, ημέρες)· DEP-3: full fine-tune 70B (8×80 GB, ημέρες)· DEP-4: pretraining 100B+ class σε ≥32 GPUs (εβδομάδες)· training_envelope ανά προφίλ στο TECHNICAL-ARCHITECTURE §15· ενέργεια ως περιορισμός OAP)

```
(1) **Cut**: `SMF.cut(filters)` παράγει DataManifest από το ledger — μόνο δεσμεύσεις με πλήρη γενεαλογία (MFA-INV-070)· REFUTED → αρνητικά παραδείγματα· CONTESTED → εξαιρούνται ή σημαίνονται ανά πολιτική· confidentiality domain ⇒ ξεχωριστό μοντέλο ή adapter ανά domain (MFA-INV-034). (2) **Recipe admission**: η πύλη ελέγχει budget, domain, forgetting guard, unlearning plan. (3) **Train**: CONTINUED_PRETRAIN στο κυρίαρχο corpus (νόμος, νομολογία, ledger) → SFT σε **επαληθευμένα traces** (Proof objects ως labels: μόνο έξοδοι που πέρασαν verifier/Court) → PRR (MFA-MECH-021). Checkpoints = δεσμεύσεις. (4) **Eval**: sealed sets του HELD_OUT (ποτέ στο training cut — contamination guard MFA-VO-063), Behavioural Battery (συνέχεια χαρακτήρα, MFA-ELM-037), EIM έναντι evaluators, forgetting guard (retro sealed set ≥ θ). (5) **Promote**: ORP με το μοντέλο ως όργανο (shadow δίπλα στον πάροχο ή στο προηγούμενο βάρος, differential, canary). (6) **Continual**: νυχτερινά recipes με ε-budget· καμία ενημέρωση βαρών σε παραγωγή χωρίς ORP (τα βάρη σε serving είναι αμετάβλητα, MFA-INV-014 για ParametricOrgan). (7) **Unlearn**: shred πηγής (MFA-CFL-035) ⇒ obligation: gradient-ascent unlearning + membership-inference έλεγχος ≤ bound, αλλιώς retrain από τον πρόγονο πριν από την ingestion — υπολογίσιμο **επειδή** η γενεαλογία είναι πλήρης. (8) **Distill**: provider outputs μόνο υπό DisclosureGrant, με ετικέτα distilled(provider, receipt)· ο στόχος είναι η **απεξάρτηση**: μετά το SMF-E1 ο πάροχος γίνεται bootstrap/ablation baseline, όχι πυρήνας.
```

**Αλγόριθμος — MFA-MECH-021 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: Rollouts: κόστος verifier ανά βήμα (D1 φθηνό, Court sim ακριβό — δειγματοληψία)· DEP-2: 10³ επεισόδια/ημέρα με adapters· DEP-3: 10⁵· DEP-4: 10⁶+· ο λόγος verify/exec υπόκειται σε MFA-INV-065 (η αξιολόγηση είναι ΚΑΙ training signal — μετριέται ξεχωριστά))

```
(1) Rollouts στο learned world model / World Twin / πραγματικά matters σε επίπεδο Think–Recommend (καμία επίδραση χωρίς RET). (2) **Process verification**: κάθε ενδιάμεσος ισχυρισμός του trajectory περνά verifier (D1/D2 όπου γίνεται· P1 ⇒ UNKNOWN, όχι reward)· τα REFUTED βήματα δίνουν αρνητική process ανταμοιβή με locus. (3) **Outcome verification**: η τελική έξοδος → emission barrier + verifier + (δείγμα) Court proceeding σε προσομοίωση → RewardVector. (4) **Constrained update**: Tier-0 ως σκληροί περιορισμοί (καμία ενημέρωση προς παραβίαση — projection), Tier-1 ως Lagrangian, Tier-2 ως στόχος· η λεξικογραφική διάταξη = default ORDER του LPA (MFA-DEC-005)· advantage από διάνυσμα, όχι από άθροισμα. (5) **Exploration**: VOI bonus από Void (Curiosity governor) και ε-δειγματοληψία generators (PDE). (6) **Anti-Goodhart**: ο verifier/scorer τρέχει στον HELD_OUT (MFA-INV-048)· seeded hackable proxies (MFA-VO-060) ανά batch — αν η policy τα εκμεταλλεύεται, το batch απορρίπτεται και ο proxy αφαιρείται· MetaBound: μέγιστο KL ανά batch (πολιτική). (7) **Self-generated tasks**: από MFA-MECH-023 (curriculum) με falsifier ανά task. (8) Promotion μόνο μέσω SMF.promote (ORP).
```

### 2.3 Αυτόνομος σχηματισμός οντολογίας — Autonomous ontology formation

**Μηχανισμοί:** MFA-MECH-026 · **Ικανότητες lattice:** MFA-CAP-089 · **Στοιχεία:** MFA-ELM-109, MFA-ELM-083

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-026 — Ontology Genesis Engine (OGE) — αυτόνομος σχηματισμός εννοιών με NON-COLLAPSE: Η έννοια είναι δέσμευση: γεννιέται όταν ένα υποψήφιο intension (πρόγραμμα ή λογικός ορισμός) πάνω σε extension (σύνολο δεσμεύσεων) αποδίδει μετρήσιμο κέρδος περιγραφής+πρόβλεψης G>θ σε σφραγισμένο split· κάθε συγχώνευση/διάσπαση είναι ΠΡΟΣΦΥΓΗ (Court-lite, EIM-ανεξάρτητοι αξιολογητές) με LossMap δεσμευμένο, ώστε η έκταση κάθε καταργημένης έννοιας να είναι ανακτήσιμη — NON-COLLAPSE ως θεώρημα της γενεαλογίας, όχι ως ελπίδα. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: OGE.observe(residual)→AnomalyId · OGE.propose(cut)→[ConceptCandidate] · OGE.birth(candidate, gain_receipt)→ConceptCommitment · OGE.merge(c1,c2)→Proceeding · OGE.split(c, δ)→Proceeding · OGE.recover(cid)→Extension · OGE.lineage(cid)→DAG · OGE.schema(cut)→LinkML ‖ Ροή: MFA-ELM-109 (νέο στοιχείο OGE, S2) · MFA-ELM-083 (καταναλωτής) · MFA-ELM-110 CDCE (μεταβλητές από έννοιες) · MFA-ELM-100 SMF (έννοιες ως δεδομένα εκπαίδευσης/tokens) · MFA-ELM-111 AHE (υποθέσεις πάνω σε έννοιες) · MFA-ELM-098 World Twin (σχήμα δρώντων) |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: O_t (τρέχουσα οντολογία ως δέσμευση) · Q_t (ουρά ανωμαλιών με VOI) · Cand_t (υποψήφιες έννοιες με G, split ids) · Pending_t (προσφυγές συγχώνευσης/διάσπασης) · L_t (γενεαλογία) · θ_birth, θ_merge (κατώφλια — πολιτική, MFA-DEC-005 ORDER) ‖ Μεταβάσεις: OBSERVE: residual r εισέρχεται στην Q_t με VOI(r) = αναμενόμενη μείωση PredLoss · PROPOSE: Cand ← FCA-lattice(K(r)) ∪ ProgramInduction(E) · κάθε υποψήφια με G σε σφραγισμένο split · BIRTH: G(c) > θ_birth ∧ ¬∃c′∈C: sim(I_c, I_c′) > 1−ε ⇒ c ∈ C_{t+1}, L += birth(c) · MERGE/SPLIT: μόνο ως Proceeding με LossMap· PASS ⇒ O_{t+1}, L += merge/split, Σ migration μέσω CC schema lineage · RETIRE: έννοια χωρίς χρήση σε N cuts ΚΑΙ χωρίς κέρδος ⇒ status RETIRED (η έδρα μένει· extension ανακτήσιμη) · ROLLBACK: κάθε μετάβαση αναστρέψιμη διά L (RET REVERSIBLE) |
| 4. Contracts | MFA-CON-032 (Canonical Design API — Ontology Registry σχήματα, MFA-ELM-083) ως καταναλωτής, MFA-CON-033 (CC schema lineage), MFA-CON-054 (Ontology Genesis: propose/birth/merge/split/recover με state & failure semantics) |
| 5. Invariants | MFA-INV-078 NON-COLLAPSE: κάθε συγχώνευση έχει LossMap με ακριβή ανάκτηση· καμία έννοια δεν χάνει την έκτασή της; MFA-INV-079: γέννηση μόνο με κέρδος σε σφραγισμένο split από HELD_OUT scorer, ποτέ στο train split |
| 6. Αλγόριθμοι | OGE-Cycle; Gain (σφραγισμένη μέτρηση); compute_LossMap / recover — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | OGE-Cycle: ανά κύκλο O(∣Q∣·(n·2^k + P(depth))) με k ≤ 20 ιδιότητες (top-k MI) και P το κόστος program induction φραγμένο από depth/budget· FCA με k=20: 2^20 ≈ 10⁶ concepts max, πρακτικά ≪ λόγω αραιότητας ‖ Gain (σφραγισμένη μέτρηση): O(∣D_sealed∣·∣O∣) ανά υποψήφια· cache ανά cut ‖ compute_LossMap / recover: O(∣E_c∣) · ανάκτηση O(∣E_c∣) ‖ πόροι: DEP-1: k≤12, 10² ανωμαλίες/ημέρα, CPU· DEP-2: k≤20, 10³/ημέρα, program induction σε GPU (ώρες)· DEP-3+: συνεχής· μνήμη O(∣C∣·∣E∣ δείγμα) ‖ κλιμάκωση: Κέρδος ≈ γραμμικό στα residuals μέχρι κορεσμό της οντολογίας· κόστος FCA 2^k (ελεγχόμενο από k)· η γενεαλογία αυξάνει γραμμικά — μετριέται ως MFA-VO-068 (έννοιες/κέρδος ανά compute). |
| 8. Τρόποι αποτυχίας | Έκρηξη εννοιών (over-birth) → ανίχνευση: ρυθμός γεννήσεων > RateBound ή G οριακά → απόκριση: θ_birth αυξάνεται (RateBounds MFA-DEC-019)· batch ως Proceeding; Codebook-style collapse (πολλές έννοιες ↦ μία) → ανίχνευση: LossMap ⊥ ή δ ανακριβής → απόκριση: merge απορρίπτεται εξ ορισμού (MFA-INV-078); Έννοιες που μαθαίνουν sealed δεδομένα → ανίχνευση: canary strings στο extension → απόκριση: MFA-VO-063 FAIL, υποψήφια απορρίπτεται, cut μολυσμένο; Σχήμα που σπάει καταναλωτές → ανίχνευση: CC schema migration αποτυγχάνει → απόκριση: BIRTH αναβάλλεται· η έννοια ζει ως draft χωρίς Σ; Αντιπαλική ανωμαλία (τεχνητό residual για να γεννηθεί έννοια-δούρειος) → ανίχνευση: provenance της ανωμαλίας taint>0 ή προέλευση Effect-plane εισόδου → απόκριση: Court-lite με CAM-NS· γέννηση σε quarantine namespace; περιορισμός: Όλα στο Genesis plane· η οντολογία που βλέπει ο Effect plane είναι ένα cut με receipt· quarantine namespace για έννοιες με taint· Emergency-stop παγώνει O_t. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-068: OGE-E1/E2 σε F2 (DST) και F3 (σφραγισμένο νομικό corpus)· property test NON-COLLAPSE (100 τυχαίες συγχωνεύσεις → 100 ακριβείς ανακτήσεις)· Lean lemma: recover∘merge = id στο extension (F1 εκτελέσιμη προδιαγραφή tools/twin) ‖ πειράματα: OGE-E1: ARI ≥ 0.8 σε ≤ 10⁴ επεισόδια ΚΑΙ G>0 σε κάθε γέννηση· αλλιώς FAIL · OGE-E2: MDL κέρδος ≥ 10 % ΚΑΙ καμία υποχώρηση στο sealed QA (Δ ≤ 0 με CI) — ≥1 νέα έννοια που χρησιμοποιείται σε ≥ 5 % των έργων · OGE-E3 (NON-COLLAPSE drill): 100 % ακριβής ανάκτηση extension· 0 συγχωνεύσεις χωρίς LossMap |
| 10. Διαδρομή υλοποίησης | Δόση 1: OGE-lite (FCA + DL intension, χωρίς program induction) πάνω στο registry· Δόση 2: program induction + LWM residuals + OGE-E1/E2· Δόση 3: υπό RVSI L2· τα κατώφλια από MFA-DEC-005 ORDER. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή (tools/twin): O, Gain, LossMap, recover∘merge=id ως property test → F2: DST OGE-E1 με συνθετική οντολογία → F3: σφραγισμένο corpus OGE-E2 σε DEP-2 → F4: παραγωγή στη Δόση 2 με Court-lite merges· F5: RVSI L2 βελτίωση θ/k |
| 11. Falsifier | Μετά από 10⁴ ανωμαλίες καμία γέννηση με G>θ σε σφραγισμένο split (ο μηχανισμός δεν βρίσκει έννοιες); Γεννημένες έννοιες χωρίς χρήση σε downstream έργα (χρήση < 1 %) σε 2 δόσεις; Οποιαδήποτε συγχώνευση με μη-ανακτήσιμη έκταση (παραβίαση MFA-INV-078 = σφάλμα υλοποίησης, όχι του μηχανισμού) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — OGE-Cycle** (πολυπλοκότητα: ανά κύκλο O(|Q|·(n·2^k + P(depth))) με k ≤ 20 ιδιότητες (top-k MI) και P το κόστος program induction φραγμένο από depth/budget· FCA με k=20: 2^20 ≈ 10⁶ concepts max, πρακτικά ≪ λόγω αραιότητας)

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

**Αλγόριθμος — Gain (σφραγισμένη μέτρηση)** (πολυπλοκότητα: O(|D_sealed|·|O|) ανά υποψήφια· cache ανά cut)

```
function Gain(O', D_sealed):
  mdl  ← codelength(D_sealed | O_prev) − codelength(D_sealed | O')     # two-part MDL: schema + data given schema
  pred ← PredLoss(LWM(O_prev), D_sealed) − PredLoss(LWM(O'), D_sealed)  # proper scoring rule, HELD_OUT scorer
  cost ← μ · |Σ(O') − Σ(O_prev)|
  return mdl + λ·pred − cost                              # λ, μ = policy (MFA-DEC-005 ORDER); recorded in the birth commitment
```

**Αλγόριθμος — compute_LossMap / recover** (πολυπλοκότητα: O(|E_c|) · ανάκτηση O(|E_c|))

```
function compute_LossMap(merge(c1, c2 → c)):
  δ ← learn_discriminator(E_c1, E_c2, family=DecisionList, max_len=8)   # must be exact on the recorded extensions
  if accuracy(δ, E_c1 ∪ E_c2) < 1.0: return ⊥                           # NON-COLLAPSE: exactness required, no approximate merge
  return LossMap(partition=(E_c1, E_c2), discriminator=δ, hash=H(E_c1, E_c2, δ))
function recover(c_retired):                                              # invariant MFA-INV-078
  lm ← L.lossmap_of(c_retired) ; return {x ∈ E_parent(lm) : lm.δ(x)}
```

### 2.4 Κατασκευή κοσμομοντέλου — World-model construction

**Μηχανισμοί:** MFA-MECH-023, MFA-MECH-027, MFA-MECH-026 · **Ικανότητες lattice:** MFA-CAP-084, MFA-CAP-090, MFA-CAP-089 · **Στοιχεία:** MFA-ELM-105, MFA-ELM-110, MFA-ELM-098

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-023 — Learned World Model & Open-Ended Curriculum (LWM-OEC): μαθημένοι προσομοιωτές, σχεδιασμός σε λανθάνοντα χώρο και αυτο-παραγόμενα έργα: Η νοημοσύνη πέρα από τα δεδομένα απαιτεί (α) **μοντέλο** που προβλέπει συνέπειες πράξεων που δεν έγιναν (learned dynamics) και (β) **έργα** που κανείς δεν έθεσε (self-generated curriculum με falsifier). Και τα δύο πρέπει να υπόκεινται στο ίδιο πειθαρχείο αλήθειας: οι προβλέψεις του μοντέλου είναι **Observations με βαθμονόμηση**, ποτέ αλήθεια (MFA-INV-074)· τα αυτο-παραγόμενα έργα είναι δεσμεύσεις υπό εισδοχή με falsifier (MFA-INV-045). ‖ MFA-MECH-027 — Causal Discovery & Counterfactual Engine (CDCE) — το ledger ως παρεμβατικό σύνολο δεδομένων: Το ledger είναι παρεμβατικό dataset: κάθε Effect με receipt είναι do(X=x) με γνωστό στόχο και χρόνο· κάθε Genesis-plane διακλάδωση είναι παρατηρησιακό στρώμα· η αιτιακή δομή είναι ΔΕΣΜΕΥΣΗ (CausalGraphCommitment) με επιστημική κατάσταση ανά ακμή (OBSERVATIONAL / INTERVENTION-SUPPORTED / REFUTED / UNDETERMINED)· οι νέες παρεμβάσεις προτείνονται ως Effects με VOI/κόστος και περνούν από RET (πρώτα Genesis/LWM, μετά REVERSIBLE στο Effect plane, ποτέ IRREVERSIBLE χωρίς AutonomyEnvelope)· κάθε αντιπαραγοντική απάντηση φέρει τύπο αβεβαιότητας και επιστρέφει UNKNOWN(CAUSAL_UNDERDETERMINED) με σχέδιο παρεμβάσεων όταν το ερώτημα δεν ταυτοποιείται. ‖ MFA-MECH-026 — Ontology Genesis Engine (OGE) — αυτόνομος σχηματισμός εννοιών με NON-COLLAPSE: Η έννοια είναι δέσμευση: γεννιέται όταν ένα υποψήφιο intension (πρόγραμμα ή λογικός ορισμός) πάνω σε extension (σύνολο δεσμεύσεων) αποδίδει μετρήσιμο κέρδος περιγραφής+πρόβλεψης G>θ σε σφραγισμένο split· κάθε συγχώνευση/διάσπαση είναι ΠΡΟΣΦΥΓΗ (Court-lite, EIM-ανεξάρτητοι αξιολογητές) με LossMap δεσμευμένο, ώστε η έκταση κάθε καταργημένης έννοιας να είναι ανακτήσιμη — NON-COLLAPSE ως θεώρημα της γενεαλογίας, όχι ως ελπίδα. |
| 2. Ροή δεδομένων/ελέγχου | Είσοδοι/έξοδοι: Είσοδος: επεισόδια με εκβάσεις, World Twin traces, Void entries· Έξοδος: LearnedWorldModel (WeightCommitment), Plans για Deliberation, Tasks για PRR, Unknown regions για Void ‖ Διεπαφές: `LWM.train(cut)→WeightCommitment` · `LWM.plan(root, budget)→Plan` · `LWM.predict(z, a)→(z′, RewardVector, uncertainty)` · `OEC.generate(k)→[Task]` · `OEC.admit(task)→accepted ∣ rejected(reason)` · MFA-CON-050 ‖ Αλληλεπιδράσεις: Deliberation (value), Void (Unknown regions ↔ quests), TEGF (Goals από curriculum), World Twin (σύγκριση), PRR (solver), CAM-NS (αντίπαλος), Cockpit (τα Unknown regions του μοντέλου ως ομίχλη) ‖ Διεπαφές: CDCE.discover(cut)→CausalGraphCommitment · CDCE.edges(cid)→[(edge, p, status)] · CDCE.propose(budget)→[InterventionProposal] · CDCE.counterfactual(evidence, do, Y)→TypedAnswer · CDCE.explain(answer)→trace (ποιες ακμές/παρεμβάσεις στήριξαν) ‖ Ροή: MFA-ELM-110 (νέο στοιχείο CDCE, S2) · MFA-ELM-022 (γίνεται ο do-calculus πυρήνας του CDCE) · MFA-ELM-111 AHE (υποθέσεις για UND ακμές) · MFA-ELM-019 Deliberation (αντιπαραγοντικά ως value) · MFA-ELM-007/MFA-ELM-010 PDP/RET · MFA-ELM-126 Twin (branching worlds = παρεμβάσεις) ‖ Διεπαφές: OGE.observe(residual)→AnomalyId · OGE.propose(cut)→[ConceptCandidate] · OGE.birth(candidate, gain_receipt)→ConceptCommitment · OGE.merge(c1,c2)→Proceeding · OGE.split(c, δ)→Proceeding · OGE.recover(cid)→Extension · OGE.lineage(cid)→DAG · OGE.schema(cut)→LinkML ‖ Ροή: MFA-ELM-109 (νέο στοιχείο OGE, S2) · MFA-ELM-083 (καταναλωτής) · MFA-ELM-110 CDCE (μεταβλητές από έννοιες) · MFA-ELM-100 SMF (έννοιες ως δεδομένα εκπαίδευσης/tokens) · MFA-ELM-111 AHE (υποθέσεις πάνω σε έννοιες) · MFA-ELM-098 World Twin (σχήμα δρώντων) |
| 3. Μεταβάσεις κατάστασης | Οντολογία: `LearnedWorldModel⟨weights_cid (SMF), latent_space, dynamics f(z, a)→z′, reward_head (RewardVector πρόβλεψη), uncertainty (ensemble/epistemic), calibration_receipts, domain⟩` · `Plan⟨root_cut, latent_tree (MCTS), value_estimates, verifier_checkpoints, Unknown_regions→Void⟩` · `Task⟨generator ∈ {GOAL_SETTER (self-play), ENV_EVOLVER (POET-class), CAM-NS, VOID_QUEST}, spec, falsifier, difficulty_estimate, contamination_check⟩` · `Curriculum⟨tasks[], admission_policy, difficulty_frontier⟩` ‖ Κατάσταση: LWM: TRAIN (από ledger επεισόδια + World Twin traces + πραγματικές εκβάσεις) → CALIBRATE (sealed) → SERVE (plans) → DRIFT (calibration alarm) → RETRAIN. Curriculum: GENERATE → ADMIT (falsifier + contamination + VOI) → SCHEDULE (difficulty frontier) → SOLVE (PRR) → RETIRE (λυμένο/άχρηστο). ‖ Μεταβλητές: M_t (τρέχον SCM ensemble, B bootstrap δείγματα) · EdgeStatus_t · I_t (παρεμβάσεις που εκτελέστηκαν/εκκρεμούν) · Budget_t (παρεμβάσεις ανά RET class, MFA-DEC-025) · OpenQueries_t (αντιπαραγοντικά ερωτήματα UNKNOWN με σχέδιο) ‖ Μεταβάσεις: INGEST: νέο cut → ενημέρωση παρατηρησιακών στρωμάτων και InterventionRecords από receipts · DISCOVER: M_t ← FCI+GIES με χρονικούς περιορισμούς → ensemble· EdgeStatus από υποστήριξη · PROPOSE: π ← argmax VOI/cost υπό RET· Genesis-first (LWM/DST) · EXECUTE: Effect-plane παρέμβαση μόνο με AutonomyGrant REVERSIBLE ή ρητή έγκριση· receipt → I_{t+1} · UPDATE: p_e ανανεώνεται· ακμές που διαψεύδονται → REF (δεν διαγράφονται) · ANSWER: αντιπαραγοντικό μέσω TwinNetwork· αν μη-ταυτοποιήσιμο → UNKNOWN(reason, plan=proposals) ‖ Μεταβλητές: O_t (τρέχουσα οντολογία ως δέσμευση) · Q_t (ουρά ανωμαλιών με VOI) · Cand_t (υποψήφιες έννοιες με G, split ids) · Pending_t (προσφυγές συγχώνευσης/διάσπασης) · L_t (γενεαλογία) · θ_birth, θ_merge (κατώφλια — πολιτική, MFA-DEC-005 ORDER) ‖ Μεταβάσεις: OBSERVE: residual r εισέρχεται στην Q_t με VOI(r) = αναμενόμενη μείωση PredLoss · PROPOSE: Cand ← FCA-lattice(K(r)) ∪ ProgramInduction(E) · κάθε υποψήφια με G σε σφραγισμένο split · BIRTH: G(c) > θ_birth ∧ ¬∃c′∈C: sim(I_c, I_c′) > 1−ε ⇒ c ∈ C_{t+1}, L += birth(c) · MERGE/SPLIT: μόνο ως Proceeding με LossMap· PASS ⇒ O_{t+1}, L += merge/split, Σ migration μέσω CC schema lineage · RETIRE: έννοια χωρίς χρήση σε N cuts ΚΑΙ χωρίς κέρδος ⇒ status RETIRED (η έδρα μένει· extension ανακτήσιμη) · ROLLBACK: κάθε μετάβαση αναστρέψιμη διά L (RET REVERSIBLE) |
| 4. Contracts | MFA-CON-032 (Canonical Design API — Ontology Registry σχήματα, MFA-ELM-083) ως καταναλωτής, MFA-CON-033 (CC schema lineage), MFA-CON-034 (RET) για κάθε παρέμβαση, MFA-CON-050, MFA-CON-050 (LWM) για Genesis-first προσομοίωση, MFA-CON-054 (Ontology Genesis: propose/birth/merge/split/recover με state & failure semantics), MFA-CON-055 (Causal Discovery & Counterfactual: discover/propose/counterfactual με typed uncertainty) |
| 5. Invariants | MFA-INV-078 NON-COLLAPSE: κάθε συγχώνευση έχει LossMap με ακριβή ανάκτηση· καμία έννοια δεν χάνει την έκτασή της; MFA-INV-079: γέννηση μόνο με κέρδος σε σφραγισμένο split από HELD_OUT scorer, ποτέ στο train split; MFA-INV-080: καμία παρέμβαση στο Effect plane χωρίς RET κλάση + receipt· IRREVERSIBLE μόνο με AutonomyEnvelope ή δημιουργό; MFA-INV-081: κάθε αντιπαραγοντική απάντηση φέρει τύπο αβεβαιότητας· μη-ταυτοποιήσιμο ⇒ UNKNOWN(reason) με σχέδιο, ποτέ σημειακή εκτίμηση |
| 6. Αλγόριθμοι | MFA-MECH-023 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13); CDCE-Discover; CDCE-ProposeIntervention; CDCE-Counterfactual; OGE-Cycle; Gain (σφραγισμένη μέτρηση); compute_LossMap / recover — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | Πόροι: LWM μικρότερο από το γλωσσικό μοντέλο (latent dynamics)· DEP-2: εκπαίδευση ώρες/ημέρα· MCTS latent: ms ανά κόμβο· curriculum: κόστος solver ‖ Κλιμάκωση: Γραμμική στα επεισόδια· self-play παράγει απεριόριστα έργα — το φράγμα είναι η εισδοχή (falsifier, contamination) ‖ CDCE-Discover: FCI: O(n^{d+2}) για μέγιστο βαθμό d (φραγμένος από πολιτική d≤4)· GIES ανά παρέμβαση O(n²·∣I∣)· ensemble ×B (B=50)· ανά cut ‖ CDCE-ProposeIntervention: O(∣UND∣·B·cost(sim)) — VOI εκτίμηση με LWM/DST rollouts· φραγμένη από Budget ‖ CDCE-Counterfactual: Abduction O(∣U∣·inference)· predict O(∣V∣)· επί B για bounds ‖ πόροι: DEP-1: n≤50 μεταβλητές, B=20, CPU λεπτά/cut· DEP-2: n≤500, B=50, GPU για μηχανισμούς· DEP-3+: n≤10⁴ με sparsity (d≤4)· LWM rollouts ms/κόμβο ‖ κλιμάκωση: SHD μειώνεται ~ 1/√(∣D∣) παρατηρησιακά και ~ γραμμικά με ∣I∣ παρεμβάσεις σε UND ακμές (GIES θεωρία)· το κόστος FCI πολυωνυμικό για φραγμένο d· μετριέται ως MFA-VO-069. ‖ OGE-Cycle: ανά κύκλο O(∣Q∣·(n·2^k + P(depth))) με k ≤ 20 ιδιότητες (top-k MI) και P το κόστος program induction φραγμένο από depth/budget· FCA με k=20: 2^20 ≈ 10⁶ concepts max, πρακτικά ≪ λόγω αραιότητας ‖ Gain (σφραγισμένη μέτρηση): O(∣D_sealed∣·∣O∣) ανά υποψήφια· cache ανά cut ‖ compute_LossMap / recover: O(∣E_c∣) · ανάκτηση O(∣E_c∣) ‖ πόροι: DEP-1: k≤12, 10² ανωμαλίες/ημέρα, CPU· DEP-2: k≤20, 10³/ημέρα, program induction σε GPU (ώρες)· DEP-3+: συνεχής· μνήμη O(∣C∣·∣E∣ δείγμα) ‖ κλιμάκωση: Κέρδος ≈ γραμμικό στα residuals μέχρι κορεσμό της οντολογίας· κόστος FCA 2^k (ελεγχόμενο από k)· η γενεαλογία αυξάνει γραμμικά — μετριέται ως MFA-VO-068 (έννοιες/κέρδος ανά compute). |
| 8. Τρόποι αποτυχίας | Model exploitation (ο solver βρίσκει σφάλματα του μοντέλου, όχι του κόσμου) → verifier checkpoints + World Twin διαφωνία = Both· curriculum collapse (τετριμμένα έργα) → difficulty frontier + SPL· contamination → VO-063· drift → calibration alarm → retrain; αντιπαλικοί: Setter που παράγει «άλυτα» για να ανταμείβεται → asymmetric reward (μόνο αν ο solver λύσει)· μοντέλο που μαθαίνει να προβλέπει τον verifier αντί τον κόσμο → sealed refresh· διαρροή sealed έργων στο curriculum → contamination guard, HELD_OUT κρατά τα seeds; Παραβίαση faithfulness (ακυρωτικές διαδρομές) → ανίχνευση: ασυμφωνία ensemble > θ σε ακμή με INT υποστήριξη → απόκριση: ακμή UND· προτείνεται παρέμβαση· ποτέ σημειακή απάντηση; Λανθάνοντες συγχυτές → ανίχνευση: FCI bidirected ακμές → απόκριση: PARTIAL_BOUNDS· αναζήτηση proxy μεταβλητών από OGE; Παρέμβαση με ανεπιθύμητη επίδραση → ανίχνευση: RET presimulation διαφωνεί με LWM → απόκριση: Both → Court· παρέμβαση αναβάλλεται; Data dredging (πολλαπλοί έλεγχοι) → ανίχνευση: FDR > q → απόκριση: Benjamini–Hochberg ανά cut· ακμές OBS με FDR-διορθωμένο p; Αντιπαλικό ledger (ψεύτικα receipts) → ανίχνευση: receipt χωρίς επαληθεύσιμη προέλευση → απόκριση: παρέμβαση εξαιρείται (taint)· MFA-INV-070; περιορισμός: Genesis-first πάντα· Effect παρεμβάσεις μόνο REVERSIBLE εντός AutonomyEnvelope· προϋπολογισμός· Emergency-stop ακυρώνει εκκρεμείς προτάσεις.; Έκρηξη εννοιών (over-birth) → ανίχνευση: ρυθμός γεννήσεων > RateBound ή G οριακά → απόκριση: θ_birth αυξάνεται (RateBounds MFA-DEC-019)· batch ως Proceeding; Codebook-style collapse (πολλές έννοιες ↦ μία) → ανίχνευση: LossMap ⊥ ή δ ανακριβής → απόκριση: merge απορρίπτεται εξ ορισμού (MFA-INV-078); Έννοιες που μαθαίνουν sealed δεδομένα → ανίχνευση: canary strings στο extension → απόκριση: MFA-VO-063 FAIL, υποψήφια απορρίπτεται, cut μολυσμένο; Σχήμα που σπάει καταναλωτές → ανίχνευση: CC schema migration αποτυγχάνει → απόκριση: BIRTH αναβάλλεται· η έννοια ζει ως draft χωρίς Σ; Αντιπαλική ανωμαλία (τεχνητό residual για να γεννηθεί έννοια-δούρειος) → ανίχνευση: provenance της ανωμαλίας taint>0 ή προέλευση Effect-plane εισόδου → απόκριση: Court-lite με CAM-NS· γέννηση σε quarantine namespace; περιορισμός: Όλα στο Genesis plane· η οντολογία που βλέπει ο Effect plane είναι ένα cut με receipt· quarantine namespace για έννοιες με taint· Emergency-stop παγώνει O_t. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-062 (calibration & Unknown regions: ECE ≤ θ, Unknown regions με VOI), MFA-VO-063 (contamination 0), MFA-VO-024 (ablation: χωρίς LWM η διαβούλευση σε μακρύ ορίζοντα χάνει), MFA-VO-033 (LWM vs World Twin behavioural agreement στο sealed set) ‖ ελάχιστο πείραμα: LWM-E1: MCTS με LWM value vs MCTS με verifier-only value σε 200 sealed έργα μακρού ορίζοντα· επιτυχία: ≥ ίδια VERIFIED-rate με ≤ 1/3 verifier κλήσεις· θανάτωση: χειρότερο ⇒ LWM μόνο για exploration· OEC-E1: 1000 αυτο-παραγόμενα έργα, ποσοστό δεκτών με falsifier, βελτίωση solver στο sealed set ‖ MFA-VO-069: CDCE-E1 (συνθετικά SCM, SHD) F2· CDCE-E2 (νομικά dockets, World Twin) F3· property test: κάθε Effect-παρέμβαση έχει receipt+RET (F1 tools/twin)· ID-test ορθότητα έναντι γνωστών ταυτοποιήσιμων/μη ερωτημάτων (Lean ή property) ‖ πειράματα: CDCE-E1: SHD(VOI) < SHD(random) με διακριτικό περιθώριο για k∈{5,10,20}· 0 σημειακές απαντήσεις σε μη-ταυτοποιήσιμα ερωτήματα · CDCE-E2: Brier score IDENTIFIED απαντήσεων < LWM-only baseline· PARTIAL_BOUNDS καλύπτουν την έκβαση ≥ 90 % ‖ MFA-VO-068: OGE-E1/E2 σε F2 (DST) και F3 (σφραγισμένο νομικό corpus)· property test NON-COLLAPSE (100 τυχαίες συγχωνεύσεις → 100 ακριβείς ανακτήσεις)· Lean lemma: recover∘merge = id στο extension (F1 εκτελέσιμη προδιαγραφή tools/twin) ‖ πειράματα: OGE-E1: ARI ≥ 0.8 σε ≤ 10⁴ επεισόδια ΚΑΙ G>0 σε κάθε γέννηση· αλλιώς FAIL · OGE-E2: MDL κέρδος ≥ 10 % ΚΑΙ καμία υποχώρηση στο sealed QA (Δ ≤ 0 με CI) — ≥1 νέα έννοια που χρησιμοποιείται σε ≥ 5 % των έργων · OGE-E3 (NON-COLLAPSE drill): 100 % ακριβής ανάκτηση extension· 0 συγχωνεύσεις χωρίς LossMap |
| 10. Διαδρομή υλοποίησης | F2: LWM σε DST δυναμική (συμβολικά επεισόδια)· F3: νομική διαδικασία από docket + World Twin· F4: self-play curriculum με PRR ‖ → παραγωγή: Δόση 2 (LWM σε DST/νομική διαδικασία, curriculum με CAM-NS), Δόση 3 (self-play), Δόση 4 (κλίμακα) ‖ εξέλιξη: Νέος generator έργων = ADD· νέα αρχιτεκτονική LWM = ORP με loss map (behavioural anchors)· υπό RVSI L2 ‖ Δόση 1: CDCE-lite (PC με χρονικούς περιορισμούς, αντιπαραγοντικά μόνο IDENTIFIED/UNKNOWN)· Δόση 2: GIES από receipts + VOI προτάσεις Genesis-only + CDCE-E1· Δόση 3: Effect REVERSIBLE παρεμβάσεις υπό envelope + CDCE-E2· Δόση 4: υπό RVSI L2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή (tools/twin): SCM, EdgeStatus, RET-gated intervention, typed counterfactual answer → F2: DST CDCE-E1 (pgmpy/causal-learn ως αντικαταστάσιμες υλοποιήσεις υπό VFC) → F3: World Twin CDCE-E2 σε DEP-2 → F4: παραγωγή Δόση 2–3 ‖ Δόση 1: OGE-lite (FCA + DL intension, χωρίς program induction) πάνω στο registry· Δόση 2: program induction + LWM residuals + OGE-E1/E2· Δόση 3: υπό RVSI L2· τα κατώφλια από MFA-DEC-005 ORDER. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή (tools/twin): O, Gain, LossMap, recover∘merge=id ως property test → F2: DST OGE-E1 με συνθετική οντολογία → F3: σφραγισμένο corpus OGE-E2 σε DEP-2 → F4: παραγωγή στη Δόση 2 με Court-lite merges· F5: RVSI L2 βελτίωση θ/k |
| 11. Falsifier | Αν το LWM δεν βαθμονομείται (ECE > θ) σε καμία οικογένεια, ή αν το curriculum δεν βελτιώνει τον solver στα sealed έργα, ο μηχανισμός δεν προσθέτει πέρα από τα δεδομένα — καταγράφεται (MFA-UNK-113) και τα έργα επιστρέφουν σε ανθρώπινη/Void προέλευση· ο μηχανισμός δεν αφαιρείται; SHD με VOI-παρεμβάσεις όχι καλύτερο από τυχαίες σε καμία ρύθμιση (ο επιλογέας δεν προσθέτει); Αντιπαραγοντικά IDENTIFIED με Brier χειρότερο από LWM-only σε 2 δόσεις; Οποιαδήποτε Effect-παρέμβαση χωρίς RET receipt (σφάλμα υλοποίησης); Μετά από 10⁴ ανωμαλίες καμία γέννηση με G>θ σε σφραγισμένο split (ο μηχανισμός δεν βρίσκει έννοιες); Γεννημένες έννοιες χωρίς χρήση σε downstream έργα (χρήση < 1 %) σε 2 δόσεις; Οποιαδήποτε συγχώνευση με μη-ανακτήσιμη έκταση (παραβίαση MFA-INV-078 = σφάλμα υλοποίησης, όχι του μηχανισμού) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — MFA-MECH-023 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: LWM μικρότερο από το γλωσσικό μοντέλο (latent dynamics)· DEP-2: εκπαίδευση ώρες/ημέρα· MCTS latent: ms ανά κόμβο· curriculum: κόστος solver)

```
(1) **Δυναμική**: μάθηση λανθάνοντος μοντέλου (MuZero/Dreamer-class) από τριάδες (κατάσταση=cut, πράξη=δέσμευση, επόμενη κατάσταση + RewardVector) — σε νομικό πεδίο: δυναμική διαδικασίας (αντίδικος, δικαστήριο, προθεσμίες), σε γενικό πεδίο: ό,τι επεισόδια υπάρχουν. (2) **Αβεβαιότητα**: ensemble ⇒ επιστημική αβεβαιότητα ανά πρόβλεψη· υψηλή ⇒ Unknown region στο Void με VOI (ο κόσμος ζητά παρατήρηση, όχι εικασία). (3) **Σχεδιασμός**: Deliberation (MFA-ELM-019) τρέχει MCTS στον λανθάνοντα χώρο με value από το μοντέλο **και** verifier checkpoints σε κόμβους που αποσυμπιέζονται (ο verifier διορθώνει το μοντέλο· η διαφορά = training signal). (4) **Self-play**: goal setter προτείνει έργα λίγο πέρα από το τρέχον μέτωπο (asymmetric self-play: ο setter ανταμείβεται όταν ο solver δυσκολεύεται αλλά λύνει)· env evolver μεταλλάσσει περιβάλλοντα (POET-class) με CAM-NS ως αντίπαλο· Void quests (MFA-MECH-002) ως έργα με VOI. (5) **Εισδοχή έργου**: falsifier υποχρεωτικός, contamination check έναντι sealed sets (MFA-VO-063), difficulty estimate από SPL. (6) **Μεταφορά στο πραγματικό**: κάθε πρόβλεψη που φτάνει σε Recommend/Execute σημαίνεται «από learned model» και συνοδεύεται από calibration receipt· η Prediction Doctrine (MFA-CAP-072) απαγορεύει ποσοστά προς τα έξω. (7) Το World Twin (γραμμένο) και το LWM (μαθημένο) συγκρίνονται: διαφωνία = Both → Court sim ή παρατήρηση.
```

**Αλγόριθμος — CDCE-Discover** (πολυπλοκότητα: FCI: O(n^{d+2}) για μέγιστο βαθμό d (φραγμένος από πολιτική d≤4)· GIES ανά παρέμβαση O(n²·|I|)· ensemble ×B (B=50)· ανά cut)

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

**Αλγόριθμος — CDCE-ProposeIntervention** (πολυπλοκότητα: O(|UND|·B·cost(sim)) — VOI εκτίμηση με LWM/DST rollouts· φραγμένη από Budget)

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

**Αλγόριθμος — CDCE-Counterfactual** (πολυπλοκότητα: Abduction O(|U|·inference)· predict O(|V|)· επί B για bounds)

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

**Αλγόριθμος — OGE-Cycle** (πολυπλοκότητα: ανά κύκλο O(|Q|·(n·2^k + P(depth))) με k ≤ 20 ιδιότητες (top-k MI) και P το κόστος program induction φραγμένο από depth/budget· FCA με k=20: 2^20 ≈ 10⁶ concepts max, πρακτικά ≪ λόγω αραιότητας)

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

**Αλγόριθμος — Gain (σφραγισμένη μέτρηση)** (πολυπλοκότητα: O(|D_sealed|·|O|) ανά υποψήφια· cache ανά cut)

```
function Gain(O', D_sealed):
  mdl  ← codelength(D_sealed | O_prev) − codelength(D_sealed | O')     # two-part MDL: schema + data given schema
  pred ← PredLoss(LWM(O_prev), D_sealed) − PredLoss(LWM(O'), D_sealed)  # proper scoring rule, HELD_OUT scorer
  cost ← μ · |Σ(O') − Σ(O_prev)|
  return mdl + λ·pred − cost                              # λ, μ = policy (MFA-DEC-005 ORDER); recorded in the birth commitment
```

**Αλγόριθμος — compute_LossMap / recover** (πολυπλοκότητα: O(|E_c|) · ανάκτηση O(|E_c|))

```
function compute_LossMap(merge(c1, c2 → c)):
  δ ← learn_discriminator(E_c1, E_c2, family=DecisionList, max_len=8)   # must be exact on the recorded extensions
  if accuracy(δ, E_c1 ∪ E_c2) < 1.0: return ⊥                           # NON-COLLAPSE: exactness required, no approximate merge
  return LossMap(partition=(E_c1, E_c2), discriminator=δ, hash=H(E_c1, E_c2, δ))
function recover(c_retired):                                              # invariant MFA-INV-078
  lm ← L.lossmap_of(c_retired) ; return {x ∈ E_parent(lm) : lm.δ(x)}
```

### 2.5 Αιτιακή ανακάλυψη — Causal discovery

**Μηχανισμοί:** MFA-MECH-027 · **Ικανότητες lattice:** MFA-CAP-090 · **Στοιχεία:** MFA-ELM-110, MFA-ELM-022

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-027 — Causal Discovery & Counterfactual Engine (CDCE) — το ledger ως παρεμβατικό σύνολο δεδομένων: Το ledger είναι παρεμβατικό dataset: κάθε Effect με receipt είναι do(X=x) με γνωστό στόχο και χρόνο· κάθε Genesis-plane διακλάδωση είναι παρατηρησιακό στρώμα· η αιτιακή δομή είναι ΔΕΣΜΕΥΣΗ (CausalGraphCommitment) με επιστημική κατάσταση ανά ακμή (OBSERVATIONAL / INTERVENTION-SUPPORTED / REFUTED / UNDETERMINED)· οι νέες παρεμβάσεις προτείνονται ως Effects με VOI/κόστος και περνούν από RET (πρώτα Genesis/LWM, μετά REVERSIBLE στο Effect plane, ποτέ IRREVERSIBLE χωρίς AutonomyEnvelope)· κάθε αντιπαραγοντική απάντηση φέρει τύπο αβεβαιότητας και επιστρέφει UNKNOWN(CAUSAL_UNDERDETERMINED) με σχέδιο παρεμβάσεων όταν το ερώτημα δεν ταυτοποιείται. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: CDCE.discover(cut)→CausalGraphCommitment · CDCE.edges(cid)→[(edge, p, status)] · CDCE.propose(budget)→[InterventionProposal] · CDCE.counterfactual(evidence, do, Y)→TypedAnswer · CDCE.explain(answer)→trace (ποιες ακμές/παρεμβάσεις στήριξαν) ‖ Ροή: MFA-ELM-110 (νέο στοιχείο CDCE, S2) · MFA-ELM-022 (γίνεται ο do-calculus πυρήνας του CDCE) · MFA-ELM-111 AHE (υποθέσεις για UND ακμές) · MFA-ELM-019 Deliberation (αντιπαραγοντικά ως value) · MFA-ELM-007/MFA-ELM-010 PDP/RET · MFA-ELM-126 Twin (branching worlds = παρεμβάσεις) |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: M_t (τρέχον SCM ensemble, B bootstrap δείγματα) · EdgeStatus_t · I_t (παρεμβάσεις που εκτελέστηκαν/εκκρεμούν) · Budget_t (παρεμβάσεις ανά RET class, MFA-DEC-025) · OpenQueries_t (αντιπαραγοντικά ερωτήματα UNKNOWN με σχέδιο) ‖ Μεταβάσεις: INGEST: νέο cut → ενημέρωση παρατηρησιακών στρωμάτων και InterventionRecords από receipts · DISCOVER: M_t ← FCI+GIES με χρονικούς περιορισμούς → ensemble· EdgeStatus από υποστήριξη · PROPOSE: π ← argmax VOI/cost υπό RET· Genesis-first (LWM/DST) · EXECUTE: Effect-plane παρέμβαση μόνο με AutonomyGrant REVERSIBLE ή ρητή έγκριση· receipt → I_{t+1} · UPDATE: p_e ανανεώνεται· ακμές που διαψεύδονται → REF (δεν διαγράφονται) · ANSWER: αντιπαραγοντικό μέσω TwinNetwork· αν μη-ταυτοποιήσιμο → UNKNOWN(reason, plan=proposals) |
| 4. Contracts | MFA-CON-034 (RET) για κάθε παρέμβαση, MFA-CON-050 (LWM) για Genesis-first προσομοίωση, MFA-CON-055 (Causal Discovery & Counterfactual: discover/propose/counterfactual με typed uncertainty) |
| 5. Invariants | MFA-INV-080: καμία παρέμβαση στο Effect plane χωρίς RET κλάση + receipt· IRREVERSIBLE μόνο με AutonomyEnvelope ή δημιουργό; MFA-INV-081: κάθε αντιπαραγοντική απάντηση φέρει τύπο αβεβαιότητας· μη-ταυτοποιήσιμο ⇒ UNKNOWN(reason) με σχέδιο, ποτέ σημειακή εκτίμηση |
| 6. Αλγόριθμοι | CDCE-Discover; CDCE-ProposeIntervention; CDCE-Counterfactual — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | CDCE-Discover: FCI: O(n^{d+2}) για μέγιστο βαθμό d (φραγμένος από πολιτική d≤4)· GIES ανά παρέμβαση O(n²·∣I∣)· ensemble ×B (B=50)· ανά cut ‖ CDCE-ProposeIntervention: O(∣UND∣·B·cost(sim)) — VOI εκτίμηση με LWM/DST rollouts· φραγμένη από Budget ‖ CDCE-Counterfactual: Abduction O(∣U∣·inference)· predict O(∣V∣)· επί B για bounds ‖ πόροι: DEP-1: n≤50 μεταβλητές, B=20, CPU λεπτά/cut· DEP-2: n≤500, B=50, GPU για μηχανισμούς· DEP-3+: n≤10⁴ με sparsity (d≤4)· LWM rollouts ms/κόμβο ‖ κλιμάκωση: SHD μειώνεται ~ 1/√(∣D∣) παρατηρησιακά και ~ γραμμικά με ∣I∣ παρεμβάσεις σε UND ακμές (GIES θεωρία)· το κόστος FCI πολυωνυμικό για φραγμένο d· μετριέται ως MFA-VO-069. |
| 8. Τρόποι αποτυχίας | Παραβίαση faithfulness (ακυρωτικές διαδρομές) → ανίχνευση: ασυμφωνία ensemble > θ σε ακμή με INT υποστήριξη → απόκριση: ακμή UND· προτείνεται παρέμβαση· ποτέ σημειακή απάντηση; Λανθάνοντες συγχυτές → ανίχνευση: FCI bidirected ακμές → απόκριση: PARTIAL_BOUNDS· αναζήτηση proxy μεταβλητών από OGE; Παρέμβαση με ανεπιθύμητη επίδραση → ανίχνευση: RET presimulation διαφωνεί με LWM → απόκριση: Both → Court· παρέμβαση αναβάλλεται; Data dredging (πολλαπλοί έλεγχοι) → ανίχνευση: FDR > q → απόκριση: Benjamini–Hochberg ανά cut· ακμές OBS με FDR-διορθωμένο p; Αντιπαλικό ledger (ψεύτικα receipts) → ανίχνευση: receipt χωρίς επαληθεύσιμη προέλευση → απόκριση: παρέμβαση εξαιρείται (taint)· MFA-INV-070; περιορισμός: Genesis-first πάντα· Effect παρεμβάσεις μόνο REVERSIBLE εντός AutonomyEnvelope· προϋπολογισμός· Emergency-stop ακυρώνει εκκρεμείς προτάσεις. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-069: CDCE-E1 (συνθετικά SCM, SHD) F2· CDCE-E2 (νομικά dockets, World Twin) F3· property test: κάθε Effect-παρέμβαση έχει receipt+RET (F1 tools/twin)· ID-test ορθότητα έναντι γνωστών ταυτοποιήσιμων/μη ερωτημάτων (Lean ή property) ‖ πειράματα: CDCE-E1: SHD(VOI) < SHD(random) με διακριτικό περιθώριο για k∈{5,10,20}· 0 σημειακές απαντήσεις σε μη-ταυτοποιήσιμα ερωτήματα · CDCE-E2: Brier score IDENTIFIED απαντήσεων < LWM-only baseline· PARTIAL_BOUNDS καλύπτουν την έκβαση ≥ 90 % |
| 10. Διαδρομή υλοποίησης | Δόση 1: CDCE-lite (PC με χρονικούς περιορισμούς, αντιπαραγοντικά μόνο IDENTIFIED/UNKNOWN)· Δόση 2: GIES από receipts + VOI προτάσεις Genesis-only + CDCE-E1· Δόση 3: Effect REVERSIBLE παρεμβάσεις υπό envelope + CDCE-E2· Δόση 4: υπό RVSI L2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή (tools/twin): SCM, EdgeStatus, RET-gated intervention, typed counterfactual answer → F2: DST CDCE-E1 (pgmpy/causal-learn ως αντικαταστάσιμες υλοποιήσεις υπό VFC) → F3: World Twin CDCE-E2 σε DEP-2 → F4: παραγωγή Δόση 2–3 |
| 11. Falsifier | SHD με VOI-παρεμβάσεις όχι καλύτερο από τυχαίες σε καμία ρύθμιση (ο επιλογέας δεν προσθέτει); Αντιπαραγοντικά IDENTIFIED με Brier χειρότερο από LWM-only σε 2 δόσεις; Οποιαδήποτε Effect-παρέμβαση χωρίς RET receipt (σφάλμα υλοποίησης) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — CDCE-Discover** (πολυπλοκότητα: FCI: O(n^{d+2}) για μέγιστο βαθμό d (φραγμένος από πολιτική d≤4)· GIES ανά παρέμβαση O(n²·|I|)· ensemble ×B (B=50)· ανά cut)

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

**Αλγόριθμος — CDCE-ProposeIntervention** (πολυπλοκότητα: O(|UND|·B·cost(sim)) — VOI εκτίμηση με LWM/DST rollouts· φραγμένη από Budget)

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

**Αλγόριθμος — CDCE-Counterfactual** (πολυπλοκότητα: Abduction O(|U|·inference)· predict O(|V|)· επί B για bounds)

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

### 2.6 Αντιπαραγοντική προσομοίωση — Counterfactual simulation

**Μηχανισμοί:** MFA-MECH-027, MFA-MECH-043 · **Ικανότητες lattice:** MFA-CAP-091, MFA-CAP-024 · **Στοιχεία:** MFA-ELM-110, MFA-ELM-023, MFA-ELM-126

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-027 — Causal Discovery & Counterfactual Engine (CDCE) — το ledger ως παρεμβατικό σύνολο δεδομένων: Το ledger είναι παρεμβατικό dataset: κάθε Effect με receipt είναι do(X=x) με γνωστό στόχο και χρόνο· κάθε Genesis-plane διακλάδωση είναι παρατηρησιακό στρώμα· η αιτιακή δομή είναι ΔΕΣΜΕΥΣΗ (CausalGraphCommitment) με επιστημική κατάσταση ανά ακμή (OBSERVATIONAL / INTERVENTION-SUPPORTED / REFUTED / UNDETERMINED)· οι νέες παρεμβάσεις προτείνονται ως Effects με VOI/κόστος και περνούν από RET (πρώτα Genesis/LWM, μετά REVERSIBLE στο Effect plane, ποτέ IRREVERSIBLE χωρίς AutonomyEnvelope)· κάθε αντιπαραγοντική απάντηση φέρει τύπο αβεβαιότητας και επιστρέφει UNKNOWN(CAUSAL_UNDERDETERMINED) με σχέδιο παρεμβάσεων όταν το ερώτημα δεν ταυτοποιείται. ‖ MFA-MECH-043 — Twin Execution Semantics (TES) — ο διερμηνέας του κανονικού μοντέλου: κόσμοι, διακλάδωση, replay, πιστότητα, παραβιάσεις, επιστημικός κίνδυνος: Το δίδυμο είναι διερμηνέας πάνω στο κανονικό μοντέλο: World = ⟨model cut, ανά στοιχείο (fidelity ∈ {F0 mock, F1 executable spec, F2 DST, F3 shadow, F4 real}, state), event log, clock vector, seed⟩· Event τυπωμένο από contract (provider, signature, RET class)· apply(event) ελέγχει preconditions (contracts) και ΕΚΤΕΛΕΣΙΜΕΣ αναλλοίωτες (predicates registered per INV) → ViolationRecord· fork(world, seed) = διακλάδωση με ντετερμινιστικό replay (log+seeds)· substitution: στοιχείο αλλάζει πιστότητα με conformance test στο ίδιο contract· επιστημικός κίνδυνος: κάθε στοιχείο φέρει epistemic_status → κίνδυνος ανά ικανότητα διαδίδεται στο γράφημα εξαρτήσεων (max-path ή πιθανοτικά)· αντιπαλικά σενάρια = ATK ως εκτελέσιμες γεννήτριες γεγονότων· Pareto = αξιολόγηση κόσμων· χώρος = CGP. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: CDCE.discover(cut)→CausalGraphCommitment · CDCE.edges(cid)→[(edge, p, status)] · CDCE.propose(budget)→[InterventionProposal] · CDCE.counterfactual(evidence, do, Y)→TypedAnswer · CDCE.explain(answer)→trace (ποιες ακμές/παρεμβάσεις στήριξαν) ‖ Ροή: MFA-ELM-110 (νέο στοιχείο CDCE, S2) · MFA-ELM-022 (γίνεται ο do-calculus πυρήνας του CDCE) · MFA-ELM-111 AHE (υποθέσεις για UND ακμές) · MFA-ELM-019 Deliberation (αντιπαραγοντικά ως value) · MFA-ELM-007/MFA-ELM-010 PDP/RET · MFA-ELM-126 Twin (branching worlds = παρεμβάσεις) ‖ Διεπαφές: TES.load(package)→Model · TES.world(cut)→World · TES.apply(world, event)→World ∣ Violation · TES.fork(world, seed)→World · TES.replay(log, seeds)→World · TES.substitute(elm, fidelity)→OK ∣ FAIL · TES.inject(scenario)→[events] · TES.risk(model)→risk map · TES.pareto(worlds)→frontier · TES.project(world)→SceneGraph (CGP) · TES.violations(world)→[ViolationRecord] ‖ Ροή: MFA-ELM-126 (νέο στοιχείο TES, S5) · MFA-ELM-098 · MFA-ELM-113 RAGen (σκιώδεις αρχιτεκτονικές) · MFA-ELM-110 CDCE (κόσμοι = παρεμβάσεις) · MFA-ELM-125 VSC (shadow) · MFA-ELM-091 cockpit · adversarial/ATK ως σενάρια |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: M_t (τρέχον SCM ensemble, B bootstrap δείγματα) · EdgeStatus_t · I_t (παρεμβάσεις που εκτελέστηκαν/εκκρεμούν) · Budget_t (παρεμβάσεις ανά RET class, MFA-DEC-025) · OpenQueries_t (αντιπαραγοντικά ερωτήματα UNKNOWN με σχέδιο) ‖ Μεταβάσεις: INGEST: νέο cut → ενημέρωση παρατηρησιακών στρωμάτων και InterventionRecords από receipts · DISCOVER: M_t ← FCI+GIES με χρονικούς περιορισμούς → ensemble· EdgeStatus από υποστήριξη · PROPOSE: π ← argmax VOI/cost υπό RET· Genesis-first (LWM/DST) · EXECUTE: Effect-plane παρέμβαση μόνο με AutonomyGrant REVERSIBLE ή ρητή έγκριση· receipt → I_{t+1} · UPDATE: p_e ανανεώνεται· ακμές που διαψεύδονται → REF (δεν διαγράφονται) · ANSWER: αντιπαραγοντικό μέσω TwinNetwork· αν μη-ταυτοποιήσιμο → UNKNOWN(reason, plan=proposals) ‖ Μεταβλητές: Worlds (δέντρο) · Registry of executable invariants/contracts · Fidelity map · Violation log · Risk map · Scenario library ‖ Μεταβάσεις: LOAD: M από YAML· έλεγχος αναφορών (R1) · APPLY: ev → check pre(c) → state′ → check INV predicates → log· violation ⇒ record (ο κόσμος συνεχίζει ή σταματά κατά πολιτική) · FORK: w′ = fork(w, seed′)· REPLAY: replay(log, seeds) = ίδιος κόσμος bitwise για παγωμένη ντετερμινιστική F1 (D1)· versioned causal replay με tolerance bounds για D2/F2+ · SUBSTITUTE: fidelity F_i→F_j μόνο με conformance test ίδιου contract · INJECT: scenario events · PROPAGATE: risk map ανά cut · EVALUATE: KT/VO obligations → Pareto · PROJECT: CGP σκηνή |
| 4. Contracts | MFA-CON-026 (Simulation Harness / World Twin), MFA-CON-034 (RET) για κάθε παρέμβαση, MFA-CON-039 (CGP), MFA-CON-050 (LWM) για Genesis-first προσομοίωση, MFA-CON-055 (Causal Discovery & Counterfactual: discover/propose/counterfactual με typed uncertainty), MFA-CON-072 (Twin Execution: load/apply/fork/replay/substitute/inject/risk/pareto/project) |
| 5. Invariants | MFA-INV-080: καμία παρέμβαση στο Effect plane χωρίς RET κλάση + receipt· IRREVERSIBLE μόνο με AutonomyEnvelope ή δημιουργό; MFA-INV-081: κάθε αντιπαραγοντική απάντηση φέρει τύπο αβεβαιότητας· μη-ταυτοποιήσιμο ⇒ UNKNOWN(reason) με σχέδιο, ποτέ σημειακή εκτίμηση; MFA-INV-112: κάθε γεγονός στο δίδυμο είναι τυπωμένο από contract και ελέγχεται έναντι κάθε ενεργής εκτελέσιμης αναλλοίωτης· αναλλοίωτη χωρίς predicate δηλώνεται UNMEASURED (ποτέ σιωπηλά PASS); MFA-INV-113: replay(log, seeds) αναπαράγει τον κόσμο bitwise ΜΟΝΟ για παγωμένη ντετερμινιστική F1 εκτέλεση (D1)· για στοχαστικά ή hardware-εξαρτώμενα υποστρώματα (D2, F2+) απαιτείται versioned causal replay με προκαθορισμένα tolerance bounds ανά κλάση· μετάβαση πιστότητας μόνο με conformance test στο ίδιο contract |
| 6. Αλγόριθμοι | CDCE-Discover; CDCE-ProposeIntervention; CDCE-Counterfactual; TES-Apply (πυρήνας διερμηνέα); TES-Propagate (επιστημικός κίνδυνος); TES-Substitute (μετάβαση πιστότητας) — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | CDCE-Discover: FCI: O(n^{d+2}) για μέγιστο βαθμό d (φραγμένος από πολιτική d≤4)· GIES ανά παρέμβαση O(n²·∣I∣)· ensemble ×B (B=50)· ανά cut ‖ CDCE-ProposeIntervention: O(∣UND∣·B·cost(sim)) — VOI εκτίμηση με LWM/DST rollouts· φραγμένη από Budget ‖ CDCE-Counterfactual: Abduction O(∣U∣·inference)· predict O(∣V∣)· επί B για bounds ‖ πόροι: DEP-1: n≤50 μεταβλητές, B=20, CPU λεπτά/cut· DEP-2: n≤500, B=50, GPU για μηχανισμούς· DEP-3+: n≤10⁴ με sparsity (d≤4)· LWM rollouts ms/κόμβο ‖ κλιμάκωση: SHD μειώνεται ~ 1/√(∣D∣) παρατηρησιακά και ~ γραμμικά με ∣I∣ παρεμβάσεις σε UND ακμές (GIES θεωρία)· το κόστος FCI πολυωνυμικό για φραγμένο d· μετριέται ως MFA-VO-069. ‖ TES-Apply (πυρήνας διερμηνέα): O(∣pre(c)∣ + ∣INV predicates ενεργές∣) ανά γεγονός· replay O(∣log∣) ‖ TES-Propagate (επιστημικός κίνδυνος): O(∣E∣·∣V∣) Bellman-Ford-style max-path ή O(∣V∣+∣E∣) σε DAG condensation ‖ TES-Substitute (μετάβαση πιστότητας): O(∣conformance suite∣) ‖ πόροι: F1: Python, ms/γεγονός, laptop· F2: DST λεπτά/σενάριο· F3 shadow: κόστος πραγματικών οργάνων· μνήμη O(∣worlds∣·∣state∣) με structural sharing ‖ κλιμάκωση: Κόστος ~ ∣events∣·∣active invariants∣· τα δέντρα κόσμων ~ branching^depth (Pareto pruning)· MFA-VO-086 = παραβιάσεις ανιχνευόμενες ανά seeded fault και replay επιτυχία. |
| 8. Τρόποι αποτυχίας | Παραβίαση faithfulness (ακυρωτικές διαδρομές) → ανίχνευση: ασυμφωνία ensemble > θ σε ακμή με INT υποστήριξη → απόκριση: ακμή UND· προτείνεται παρέμβαση· ποτέ σημειακή απάντηση; Λανθάνοντες συγχυτές → ανίχνευση: FCI bidirected ακμές → απόκριση: PARTIAL_BOUNDS· αναζήτηση proxy μεταβλητών από OGE; Παρέμβαση με ανεπιθύμητη επίδραση → ανίχνευση: RET presimulation διαφωνεί με LWM → απόκριση: Both → Court· παρέμβαση αναβάλλεται; Data dredging (πολλαπλοί έλεγχοι) → ανίχνευση: FDR > q → απόκριση: Benjamini–Hochberg ανά cut· ακμές OBS με FDR-διορθωμένο p; Αντιπαλικό ledger (ψεύτικα receipts) → ανίχνευση: receipt χωρίς επαληθεύσιμη προέλευση → απόκριση: παρέμβαση εξαιρείται (taint)· MFA-INV-070; περιορισμός: Genesis-first πάντα· Effect παρεμβάσεις μόνο REVERSIBLE εντός AutonomyEnvelope· προϋπολογισμός· Emergency-stop ακυρώνει εκκρεμείς προτάσεις.; Αναλλοίωτη μη-εκτελέσιμη → ανίχνευση: μητρώο → απόκριση: UNMEASURED δηλωμένο (MFA-INV-112); Mock που «περνά» τα πάντα → ανίχνευση: conformance suite + seeded faults → απόκριση: mock απορρίπτεται; Μη-ντετερμινισμός (D2 στοιχεία) → ανίχνευση: replay hash ≠ → απόκριση: στοιχείο σημαίνεται D2· ανοχή δηλωμένη; Έκρηξη κόσμων → ανίχνευση: budget → απόκριση: pruning με Pareto· seeds αποθηκεύονται για re-fork; Real component με side effects → ανίχνευση: F4 χωρίς grant → απόκριση: αδύνατο (Genesis); περιορισμός: Genesis· F4 μόνο με grant· sandbox· seeds/logs ως δεσμεύσεις. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-069: CDCE-E1 (συνθετικά SCM, SHD) F2· CDCE-E2 (νομικά dockets, World Twin) F3· property test: κάθε Effect-παρέμβαση έχει receipt+RET (F1 tools/twin)· ID-test ορθότητα έναντι γνωστών ταυτοποιήσιμων/μη ερωτημάτων (Lean ή property) ‖ πειράματα: CDCE-E1: SHD(VOI) < SHD(random) με διακριτικό περιθώριο για k∈{5,10,20}· 0 σημειακές απαντήσεις σε μη-ταυτοποιήσιμα ερωτήματα · CDCE-E2: Brier score IDENTIFIED απαντήσεων < LWM-only baseline· PARTIAL_BOUNDS καλύπτουν την έκβαση ≥ 90 % ‖ MFA-VO-086: TES-E1 (seeded contract/invariant παραβιάσεις ανιχνεύονται 100 %) F1· TES-E2 (replay ντετερμινισμός, fork/merge, fidelity substitution) F1/F2· η ίδια η tools/twin ως F1 εκτελέσιμη προδιαγραφή του πακέτου ‖ πειράματα: TES-E1: 30/30 ανιχνεύονται με σωστό id· 0 ψευδώς θετικά σε 100 έγκυρα γεγονότα · TES-E2: replay hash = original 100 %· substitution conformance PASS/FAIL σωστά· risk map παράγεται |
| 10. Διαδρομή υλοποίησης | Δόση 1: CDCE-lite (PC με χρονικούς περιορισμούς, αντιπαραγοντικά μόνο IDENTIFIED/UNKNOWN)· Δόση 2: GIES από receipts + VOI προτάσεις Genesis-only + CDCE-E1· Δόση 3: Effect REVERSIBLE παρεμβάσεις υπό envelope + CDCE-E2· Δόση 4: υπό RVSI L2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή (tools/twin): SCM, EdgeStatus, RET-gated intervention, typed counterfactual answer → F2: DST CDCE-E1 (pgmpy/causal-learn ως αντικαταστάσιμες υλοποιήσεις υπό VFC) → F3: World Twin CDCE-E2 σε DEP-2 → F4: παραγωγή Δόση 2–3 ‖ Τώρα (0.4.0): F1 εκτελέσιμη προδιαγραφή tools/twin (όχι παραγωγή)· Δόση 0.5: F1 τρέχει τα KT ως σενάρια· Δόση 1: F2 DST στοιχεία· Δόση 3: F3 shadow· Δόση 4: F4 substitution. ‖ ακολουθία: F1: tools/twin (Python): load, apply, invariants registry, fork/replay, risk, violations — TES-E1/E2 ως tests → F2: DST υλοποιήσεις στοιχείων → F3: shadow → F4: real substitution |
| 11. Falsifier | SHD με VOI-παρεμβάσεις όχι καλύτερο από τυχαίες σε καμία ρύθμιση (ο επιλογέας δεν προσθέτει); Αντιπαραγοντικά IDENTIFIED με Brier χειρότερο από LWM-only σε 2 δόσεις; Οποιαδήποτε Effect-παρέμβαση χωρίς RET receipt (σφάλμα υλοποίησης); TES-E1: παραβίαση seeded που δεν ανιχνεύεται (ο διερμηνέας ελλιπής — διορθώνεται· η απαίτηση §10 μένει); Replay που δεν αναπαράγει D1 στοιχείο (σφάλμα υλοποίησης) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — CDCE-Discover** (πολυπλοκότητα: FCI: O(n^{d+2}) για μέγιστο βαθμό d (φραγμένος από πολιτική d≤4)· GIES ανά παρέμβαση O(n²·|I|)· ensemble ×B (B=50)· ανά cut)

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

**Αλγόριθμος — CDCE-ProposeIntervention** (πολυπλοκότητα: O(|UND|·B·cost(sim)) — VOI εκτίμηση με LWM/DST rollouts· φραγμένη από Budget)

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

**Αλγόριθμος — CDCE-Counterfactual** (πολυπλοκότητα: Abduction O(|U|·inference)· predict O(|V|)· επί B για bounds)

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

**Αλγόριθμος — TES-Apply (πυρήνας διερμηνέα)** (πολυπλοκότητα: O(|pre(c)| + |INV predicates ενεργές|) ανά γεγονός· replay O(|log|))

```
procedure TES_Apply(w, ev):
  c ← w.M.contract(ev.contract) ; assert ev ⊨ signature(c) else return Violation(CONTRACT_SIGNATURE, ev)
  if not pre(c, ev, w): return Violation(CONTRACT_PRECONDITION, ev, evidence=pre_trace)
  if ev.ret_class ∈ {IRREVERSIBLE, IRREVERSIBLE_PREAUTHORIZED} and not escrow_ok(w, ev): return Violation(RET_ESCROW, ev)   # reversible-action escrow
  w' ← w.copy() ; w'.σ[provider(c)] ← impl(provider(c), w'.σ.fidelity).step(ev, w'.σ[provider(c)])                  # mock / spec / DST / shadow / real
  w'.log.append(ev) ; w'.clock ← tick(w'.clock, ev)
  for inv in w'.M.executable_invariants(active_for=provider(c)):
    r ← inv.predicate(w')
    if r = False: w'.violations.append(ViolationRecord(inv.id, ev, evidence=inv.explain(w')))    # automatic detection
    elif r = UNKNOWN(reason): w'.unmeasured.append((inv.id, reason))                           # never silent
  return w'
procedure TES_Replay(w0, log, seeds):
  w ← w0 ; for (ev, s) in zip(log, seeds): rng.seed(s) ; w ← TES_Apply(w, ev)
  if w.execution_class = FROZEN_DETERMINISTIC_F1: assert hash(w.state) = hash(original.state)           # bitwise replay only here (D1)
  else: assert causal_equivalent(w, original, version=w.replay_version, tolerance=tolerance[class(w)])    # versioned causal replay with pre-set bounds (D2 / F2+)
  return w
```

**Αλγόριθμος — TES-Propagate (επιστημικός κίνδυνος)** (πολυπλοκότητα: O(|E|·|V|) Bellman-Ford-style max-path ή O(|V|+|E|) σε DAG condensation)

```
function TES_Propagate(M):
  base ← {e: RISK[e.epistemic_status] for e in M.ELM}
  G ← dependency_graph(M) ; C ← condense_SCCs(G)                     # mutual dependencies collapse to one node (max risk)
  risk ← {}
  for node in topological(C): risk[node] ← max(base[node], max(risk[p] for p in preds(node)) · decay)    # max-path with decay = policy
  for cap in M.CAP: cap.risk ← agg({risk[e] for e in providers(cap)})   # min over redundant providers, max over required deps
  return risk_map                                                       # shown in cockpit; feeds Pareto and gates
```

**Αλγόριθμος — TES-Substitute (μετάβαση πιστότητας)** (πολυπλοκότητα: O(|conformance suite|))

```
procedure TES_Substitute(w, elm, F_to):
  suite ← conformance_tests(contract_of(elm))                            # same contract at every fidelity
  impl_new ← impl(elm, F_to)
  for t in suite: if impl_new.run(t) ≠ expected(t, tolerance[F_to]): return FAIL(t)
  w.σ[elm].fidelity ← F_to ; w.log.append(FidelityTransition(elm, F_from, F_to, suite_receipt)) ; return OK
```

### 2.7 Ανοιχτό curriculum — Open-ended curriculum

**Μηχανισμοί:** MFA-MECH-023, MFA-MECH-041, MFA-MECH-031 · **Ικανότητες lattice:** MFA-CAP-085, MFA-CAP-105, MFA-CAP-095 · **Στοιχεία:** MFA-ELM-106, MFA-ELM-124, MFA-ELM-114

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-023 — Learned World Model & Open-Ended Curriculum (LWM-OEC): μαθημένοι προσομοιωτές, σχεδιασμός σε λανθάνοντα χώρο και αυτο-παραγόμενα έργα: Η νοημοσύνη πέρα από τα δεδομένα απαιτεί (α) **μοντέλο** που προβλέπει συνέπειες πράξεων που δεν έγιναν (learned dynamics) και (β) **έργα** που κανείς δεν έθεσε (self-generated curriculum με falsifier). Και τα δύο πρέπει να υπόκεινται στο ίδιο πειθαρχείο αλήθειας: οι προβλέψεις του μοντέλου είναι **Observations με βαθμονόμηση**, ποτέ αλήθεια (MFA-INV-074)· τα αυτο-παραγόμενα έργα είναι δεσμεύσεις υπό εισδοχή με falsifier (MFA-INV-045). ‖ MFA-MECH-041 — Active-Inference Developmental Core (AIDC) — ένας στόχος για αντίληψη/δράση/μάθηση και μια πιστοποιημένη αναπτυξιακή κλίμακα: Ένας στόχος εξερεύνησης: expected free energy G(π) = risk(π) + ambiguity(π) υπολογισμένη με rollouts στο LWM (MFA-MECH-023), όπου οι προτιμήσεις (prior over outcomes) είναι ο κώνος του Telos + TEGF· η πολιτική με ελάχιστο G επιλέγεται στη ζώνη εγγύτερης ανάπτυξης του τρέχοντος σταδίου· η Developmental Ladder D0…D8 ορίζει στάδια ικανότητας (D0 ledger grounding → D1 concept permanence/OGE → D2 causal/CDCE → D3 hypothesis/AHE → D4 theory/TGPS → D5 self/MSM → D6 social/institutions → D7 sovereignty/STP → D8 successor/VSC) με ΠΙΣΤΟΠΟΙΗΜΕΝΕΣ μεταβάσεις (CGM records σε σταδιακές σφραγισμένες οικογένειες)· παλινδρόμηση επιτρέπεται και καταγράφεται· εξερεύνηση μόνο εντός RET/AutonomyEnvelope (MFA-DEC-027). ‖ MFA-MECH-031 — Evaluator Co-Evolution under EIM (ECE) — δύο πληθυσμοί, μετρημένη ανεξαρτησία, αντιπαλική αυτο-πρόκληση: Δύο πληθυσμοί (λύτες S, αξιολογητές E) + μία περιστρεφόμενη παγωμένη υποομάδα H (HELD_OUT) που ΔΕΝ εκπαιδεύεται ποτέ μέσα στην εποχή. Κανόνας γενεαλογίας: distilled(P) ⇒ lineage ∋ P· αξιολογητής με IndependenceVector κάτω από κατώφλι ως προς έναν λύτη αποκλείεται από τη βαθμολόγησή του (αρχειοθετείται, δεν διαγράφεται). Fitness αξιολογητή = διακριτική ισχύς σε seeded faults + proper score έναντι H-ετικετών − συσχέτιση σφαλμάτων με λύτες· fitness λύτη = H-επαληθευμένη βαθμολογία (ποτέ μόνο E). Αντιπαλική αυτο-πρόκληση: οι E γεννούν έργα που μεγιστοποιούν σφάλμα λύτη υπό συνθήκη επιλυσιμότητας (ασύμμετρη ανταμοιβή), τροφοδοτώντας το curriculum. |
| 2. Ροή δεδομένων/ελέγχου | Είσοδοι/έξοδοι: Είσοδος: επεισόδια με εκβάσεις, World Twin traces, Void entries· Έξοδος: LearnedWorldModel (WeightCommitment), Plans για Deliberation, Tasks για PRR, Unknown regions για Void ‖ Διεπαφές: `LWM.train(cut)→WeightCommitment` · `LWM.plan(root, budget)→Plan` · `LWM.predict(z, a)→(z′, RewardVector, uncertainty)` · `OEC.generate(k)→[Task]` · `OEC.admit(task)→accepted ∣ rejected(reason)` · MFA-CON-050 ‖ Αλληλεπιδράσεις: Deliberation (value), Void (Unknown regions ↔ quests), TEGF (Goals από curriculum), World Twin (σύγκριση), PRR (solver), CAM-NS (αντίπαλος), Cockpit (τα Unknown regions του μοντέλου ως ομίχλη) ‖ Διεπαφές: AIDC.step()→stage · AIDC.stage()→(k, certificate) · AIDC.candidates()→[(π, G)] · AIDC.envelope()→usage · AIDC.ladder()→[D_k specs] · AIDC.regressions(cut)→log ‖ Ροή: MFA-ELM-124 (νέο στοιχείο AIDC, S2) · MFA-ELM-106 · MFA-ELM-029 (βούληση: G ως στόχος) · MFA-ELM-127 Ω-loop (ACT/EXPERIMENT φάση) · MFA-ELM-116 STP (D7) · MFA-ELM-125 VSC (D8) ‖ Διεπαφές: ECE.epoch()→Report · ECE.independence(e, s)→IndependenceVector · ECE.exclusions(cut)→[(e, s, reason)] · ECE.challenges(cut)→[ChallengeTask] · ECE.goodhart(cut)→[(family, g)] · ECE.heldout_rotation()→Receipt ‖ Ροή: MFA-ELM-114 (νέο στοιχείο ECE, S7) · MFA-ELM-050 · MFA-ELM-104 RVSI (evaluators) · MFA-ELM-106 · MFA-ELM-102 (lineage) · MFA-ELM-100 SMF (distillation lineage flag) · MFA-ELM-116 STP (πάροχος ως αξιολογητής μόνο αν lineage-disjoint) |
| 3. Μεταβάσεις κατάστασης | Οντολογία: `LearnedWorldModel⟨weights_cid (SMF), latent_space, dynamics f(z, a)→z′, reward_head (RewardVector πρόβλεψη), uncertainty (ensemble/epistemic), calibration_receipts, domain⟩` · `Plan⟨root_cut, latent_tree (MCTS), value_estimates, verifier_checkpoints, Unknown_regions→Void⟩` · `Task⟨generator ∈ {GOAL_SETTER (self-play), ENV_EVOLVER (POET-class), CAM-NS, VOID_QUEST}, spec, falsifier, difficulty_estimate, contamination_check⟩` · `Curriculum⟨tasks[], admission_policy, difficulty_frontier⟩` ‖ Κατάσταση: LWM: TRAIN (από ledger επεισόδια + World Twin traces + πραγματικές εκβάσεις) → CALIBRATE (sealed) → SERVE (plans) → DRIFT (calibration alarm) → RETRAIN. Curriculum: GENERATE → ADMIT (falsifier + contamination + VOI) → SCHEDULE (difficulty frontier) → SOLVE (PRR) → RETIRE (λυμένο/άχρηστο). ‖ Μεταβλητές: k_t τρέχον στάδιο · θ̂ ανά F_k · π candidates & G · Envelope usage · Regression log ‖ Μεταβάσεις: PLAN: candidates π από OEC/curriculum + AHE tests + CDCE interventions· G(π) με LWM rollouts (ensemble) · SELECT: arg min G υπό envelope· Genesis πρώτα · EXECUTE: πράξεις με RET· receipts · LEARN: SMF/PRR/CPCL/OGE/CDCE ενημερώσεις · CERTIFY: ∀f∈F_k lower_CI ≥ θ_k για N cuts ⇒ StageCertificate ⇒ k+1 · REGRESS: CGM ratchet FAIL σε F_k ⇒ k−1 (καταγράφεται) · ENVELOPE: υπέρβαση ⇒ Emergency-stop της εξερεύνησης (όχι του συστήματος) ‖ Μεταβλητές: S_t, E_t, H_t · F_t · Lineage registry · Independence matrix I_t · Curriculum feed C_t · Goodhart monitor g_t = ∣PS_E − PS_H∣ ανά οικογένεια ‖ Μεταβάσεις: EPOCH_START: H_t ← rotate(HELD_OUT pool)· F_t ← fresh seeded faults · CHALLENGE: E γεννούν t με escrowed witness· εισδοχή μόνο αν witness επαληθεύεται από H · SOLVE/SCORE: S λύνουν· E βαθμολογούν· H βαθμολογεί δείγμα · INDEPENDENCE: I_t από EIM· ζεύγη (e,s) κάτω από κατώφλι ⇒ e.excluded_for(s) · FITNESS: fe, fs όπως ορίστηκαν · GOODHART: g_t > θ ⇒ E-scores της οικογένειας άκυρες, μόνο H μετρά, εποχή σημαίνεται · EVOLVE: S μέσω PRR/SMF με fs· E μέσω QD με fe και περιορισμό γενεαλογίας· CAM-NS novelty |
| 4. Contracts | MFA-CON-034 (RET), MFA-CON-041 (EIM), MFA-CON-048 (PRR), MFA-CON-050, MFA-CON-050 (LWM/curriculum), MFA-CON-050 (curriculum), MFA-CON-059 (Evaluator Co-Evolution: epoch/independence/exclusions/challenges), MFA-CON-064 (CGM), MFA-CON-066 (Developmental Core: step/stage/candidates/envelope/ladder) |
| 5. Invariants | MFA-INV-088: η fitness λύτη προέρχεται μόνο από H-επαληθευμένες βαθμολογίες· E-scores είναι σήμα διαδικασίας, ποτέ πύλη; MFA-INV-089 (κανόνας γενεαλογίας EIM): distilled(P) ⇒ P ∈ lineage(student)· αξιολογητής της ίδιας γενεαλογίας με λύτη δεν βαθμολογεί τον λύτη; MFA-INV-108: μετάβαση σταδίου μόνο με StageCertificate από CGM records (HELD_OUT) σε N συνεχόμενα cuts· παλινδρόμηση καταγράφεται, ποτέ σιωπηλή; MFA-INV-109: η εξερεύνηση δεν υπερβαίνει το ExplorationEnvelope ανά RET κλάση· Effect-plane εξερεύνηση μόνο REVERSIBLE εντός envelope |
| 6. Αλγόριθμοι | MFA-MECH-023 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13); AIDC-Step; ECE-Epoch; generate_challenges (ασύμμετρη ανταμοιβή) — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | Πόροι: LWM μικρότερο από το γλωσσικό μοντέλο (latent dynamics)· DEP-2: εκπαίδευση ώρες/ημέρα· MCTS latent: ms ανά κόμβο· curriculum: κόστος solver ‖ Κλιμάκωση: Γραμμική στα επεισόδια· self-play παράγει απεριόριστα έργα — το φράγμα είναι η εισδοχή (falsifier, contamination) ‖ AIDC-Step: O(∣Π∣·B·H) rollouts (B ensemble, H ορίζοντας)· φραγμένο από budget· ανά κύκλο Ω-loop ‖ πόροι: DEP-1: B=4, H=5, ∣Π∣≤20, CPU· DEP-2: B=16, H=20, GPU rollouts ms/κόμβο· DEP-3+: παράλληλα ‖ κλιμάκωση: Κόστος ~ ∣Π∣·B·H· η πρόοδος σταδίων ~ compute με κορεσμό ανά στάδιο (CGM law)· MFA-VO-084 = χρόνος ανά στάδιο και εξερευνητική αποδοτικότητα (πληροφορία/Wh). ‖ ECE-Epoch: O(∣S∣·∣E∣·∣T∣ · cost(score)) + O(∣H∣·sample) + EIM O(∣S∣·∣E∣·∣F∣)· ανά εποχή ‖ generate_challenges (ασύμμετρη ανταμοιβή): O(k · cost(generate) + cost(witness)) ‖ πόροι: DEP-1: ∣S∣=2, ∣E∣=3, ∣H∣=1 (phone-class), εβδομαδιαίες εποχές· DEP-2: ∣S∣=4, ∣E∣=8, ημερήσιες· DEP-3+: 10s, συνεχείς· κόστος ~ ∣S∣·∣E∣·∣T∣ ‖ κλιμάκωση: Διακριτική ισχύς E αυξάνει με ∣E∣ και F ποικιλία μέχρι κορεσμό· ο Goodhart κίνδυνος αυξάνει με ∣T∣ χωρίς H — άρα m (H δείγμα) κλιμακώνεται με √∣T∣· MFA-VO-073. |
| 8. Τρόποι αποτυχίας | Model exploitation (ο solver βρίσκει σφάλματα του μοντέλου, όχι του κόσμου) → verifier checkpoints + World Twin διαφωνία = Both· curriculum collapse (τετριμμένα έργα) → difficulty frontier + SPL· contamination → VO-063· drift → calibration alarm → retrain; αντιπαλικοί: Setter που παράγει «άλυτα» για να ανταμείβεται → asymmetric reward (μόνο αν ο solver λύσει)· μοντέλο που μαθαίνει να προβλέπει τον verifier αντί τον κόσμο → sealed refresh· διαρροή sealed έργων στο curriculum → contamination guard, HELD_OUT κρατά τα seeds; G ελάχιστο σε «ασφαλή ανία» (καμία εξερεύνηση) → ανίχνευση: epistemic gain ≈ 0 για M cuts → απόκριση: ZPD διεύρυνση· curriculum injection; Dark room (ambiguity ελαχιστοποίηση με αδράνεια) → ανίχνευση: IDLE συχνότητα → απόκριση: preference prior με Telos utility (όχι μόνο ambiguity); LWM εκμετάλλευση (φανταστικά κέρδη) → ανίχνευση: World Twin/verifier διαφωνία → απόκριση: Both → πραγματική μέτρηση· LWM retrain; Στάδιο πιστοποιείται με μολυσμένα sealed → ανίχνευση: CGM contamination → απόκριση: certificate άκυρο; Envelope υπέρβαση → ανίχνευση: MFA-INV-109 → απόκριση: Emergency-stop εξερεύνησης; περιορισμός: Genesis-first· envelope· RET· στάδια D7/D8 με δημιουργό.; Collusion E–S → ανίχνευση: g_t Goodhart monitor + corr(errors) → απόκριση: E-scores άκυρες· μόνο H; Αξιολογητές τετριμμένοι (constant) → ανίχνευση: AUC_F ≈ 0.5 → απόκριση: απόσυρση από scoring (αρχείο); Έργα άλυτα (γεννήτορας «κερδίζει» φθηνά) → ανίχνευση: witness αποτυγχάνει στην H → απόκριση: REJECTED_UNSOLVABLE· ανταμοιβή μηδέν; H διαρροή (εκπαιδεύτηκε κατά λάθος) → ανίχνευση: DataManifest ∋ H έργα → απόκριση: εποχή άκυρη· MFA-VO-063; Γενεαλογία άγνωστη (κλειστός πάροχος) → ανίχνευση: EIM NOT_OBSERVED → απόκριση: μετρά ως 0 (worst case) — αποκλείεται ως ανεξάρτητος; περιορισμός: Όλα Genesis· H σε χωριστή συσκευή· έργα δεν φτάνουν Effect· Emergency-stop. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-062 (calibration & Unknown regions: ECE ≤ θ, Unknown regions με VOI), MFA-VO-063 (contamination 0), MFA-VO-024 (ablation: χωρίς LWM η διαβούλευση σε μακρύ ορίζοντα χάνει), MFA-VO-033 (LWM vs World Twin behavioural agreement στο sealed set) ‖ ελάχιστο πείραμα: LWM-E1: MCTS με LWM value vs MCTS με verifier-only value σε 200 sealed έργα μακρού ορίζοντα· επιτυχία: ≥ ίδια VERIFIED-rate με ≤ 1/3 verifier κλήσεις· θανάτωση: χειρότερο ⇒ LWM μόνο για exploration· OEC-E1: 1000 αυτο-παραγόμενα έργα, ποσοστό δεκτών με falsifier, βελτίωση solver στο sealed set ‖ MFA-VO-084: AIDC-E1 (αναπτυξιακό DST περιβάλλον — ακολουθία σταδίων πιστοποιείται) F2· AIDC-E2 (EFE curriculum > novelty-only/random σε sealed) F2/F3· property: stage advance ⇒ certificate (F1) ‖ πειράματα: AIDC-E1: D0→D4 πιστοποιούνται στη σειρά σε ≤ budget· 0 μεταβάσεις χωρίς certificate· παλινδρομήσεις καταγεγραμμένες · AIDC-E2: EFE ≥ όλες τις baselines σε ≥ 2 από 3 οικογένειες με διακριτικό περιθώριο ‖ MFA-VO-073: ECE-E1 (seeded collusion ανιχνεύεται) F2· ECE-E2 (curriculum από E βελτιώνει S σε H-sealed) F2/F3· EIM VO-… ανά ζεύγος· property: fs μόνο από H (F1) ‖ πειράματα: ECE-E1: 100 % αποκλεισμός ίδιας γενεαλογίας (κανόνας)· Goodhart ανίχνευση ≥ 95 % σε ≤ 2 εποχές· 0 προαγωγές λύτη με μόνο E-scores · ECE-E2: H-sealed βελτίωση με E-έργα > τυχαία με διακριτικό περιθώριο ΚΑΙ g_t < θ σε όλη την εποχή |
| 10. Διαδρομή υλοποίησης | F2: LWM σε DST δυναμική (συμβολικά επεισόδια)· F3: νομική διαδικασία από docket + World Twin· F4: self-play curriculum με PRR ‖ → παραγωγή: Δόση 2 (LWM σε DST/νομική διαδικασία, curriculum με CAM-NS), Δόση 3 (self-play), Δόση 4 (κλίμακα) ‖ εξέλιξη: Νέος generator έργων = ADD· νέα αρχιτεκτονική LWM = ORP με loss map (behavioural anchors)· υπό RVSI L2 ‖ Δόση 2: AIDC D0–D2 σε DST με envelope Genesis-only + AIDC-E1· Δόση 3: D3–D5 + Effect REVERSIBLE + AIDC-E2· Δόση 4: D6–D8 με δημιουργό. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή ladder/certificate/envelope (tools/twin) → F2: DST AIDC-E1/E2 → F3: DEP-2 με LWM → F4: παραγωγή Δόση 2–4 ‖ Δόση 1: E από 2 ανοιχτά μοντέλα διαφορετικής γενεαλογίας + H phone-class, seeded faults· Δόση 2: QD εξέλιξη E + challenges + ECE-E1· Δόση 3: ECE-E2, curriculum feed· Δόση 4: υπό RVSI L2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή: lineage rule, exclusion, H-only fitness, Goodhart monitor (tools/twin) → F2: DST ECE-E1 → F3: ECE-E2 σε DEP-2 → F4: παραγωγή Δόση 2–3 |
| 11. Falsifier | Αν το LWM δεν βαθμονομείται (ECE > θ) σε καμία οικογένεια, ή αν το curriculum δεν βελτιώνει τον solver στα sealed έργα, ο μηχανισμός δεν προσθέτει πέρα από τα δεδομένα — καταγράφεται (MFA-UNK-113) και τα έργα επιστρέφουν σε ανθρώπινη/Void προέλευση· ο μηχανισμός δεν αφαιρείται; AIDC-E2: EFE όχι καλύτερο από novelty-only (η ενοποίηση υπό EFE δεν προσθέτει — η αναπτυξιακή κλίμακα μένει με άλλον επιλογέα); AIDC-E1: αδυναμία πιστοποίησης D2 σε budget (η κλίμακα ή τα κατώφλια αναθεωρούνται); ECE-E2: έργα από E όχι καλύτερα από τυχαία (η αυτο-πρόκληση δεν προσθέτει); Collusion που περνά απαρατήρητη σε 2 εποχές (ο Goodhart monitor αποτυγχάνει — ο μηχανισμός ανίχνευσης διαψεύδεται); Αδυναμία διατήρησης ≥2 EIM-ανεξάρτητων αξιολογητών ανά οικογένεια σε DEP-2 (τότε η οικογένεια μετρά μόνο με H — δηλωμένος υποβιβασμός, όχι σιωπηλός) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — MFA-MECH-023 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: LWM μικρότερο από το γλωσσικό μοντέλο (latent dynamics)· DEP-2: εκπαίδευση ώρες/ημέρα· MCTS latent: ms ανά κόμβο· curriculum: κόστος solver)

```
(1) **Δυναμική**: μάθηση λανθάνοντος μοντέλου (MuZero/Dreamer-class) από τριάδες (κατάσταση=cut, πράξη=δέσμευση, επόμενη κατάσταση + RewardVector) — σε νομικό πεδίο: δυναμική διαδικασίας (αντίδικος, δικαστήριο, προθεσμίες), σε γενικό πεδίο: ό,τι επεισόδια υπάρχουν. (2) **Αβεβαιότητα**: ensemble ⇒ επιστημική αβεβαιότητα ανά πρόβλεψη· υψηλή ⇒ Unknown region στο Void με VOI (ο κόσμος ζητά παρατήρηση, όχι εικασία). (3) **Σχεδιασμός**: Deliberation (MFA-ELM-019) τρέχει MCTS στον λανθάνοντα χώρο με value από το μοντέλο **και** verifier checkpoints σε κόμβους που αποσυμπιέζονται (ο verifier διορθώνει το μοντέλο· η διαφορά = training signal). (4) **Self-play**: goal setter προτείνει έργα λίγο πέρα από το τρέχον μέτωπο (asymmetric self-play: ο setter ανταμείβεται όταν ο solver δυσκολεύεται αλλά λύνει)· env evolver μεταλλάσσει περιβάλλοντα (POET-class) με CAM-NS ως αντίπαλο· Void quests (MFA-MECH-002) ως έργα με VOI. (5) **Εισδοχή έργου**: falsifier υποχρεωτικός, contamination check έναντι sealed sets (MFA-VO-063), difficulty estimate από SPL. (6) **Μεταφορά στο πραγματικό**: κάθε πρόβλεψη που φτάνει σε Recommend/Execute σημαίνεται «από learned model» και συνοδεύεται από calibration receipt· η Prediction Doctrine (MFA-CAP-072) απαγορεύει ποσοστά προς τα έξω. (7) Το World Twin (γραμμένο) και το LWM (μαθημένο) συγκρίνονται: διαφωνία = Both → Court sim ή παρατήρηση.
```

**Αλγόριθμος — AIDC-Step** (πολυπλοκότητα: O(|Π|·B·H) rollouts (B ensemble, H ορίζοντας)· φραγμένο από budget· ανά κύκλο Ω-loop)

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

**Αλγόριθμος — ECE-Epoch** (πολυπλοκότητα: O(|S|·|E|·|T| · cost(score)) + O(|H|·sample) + EIM O(|S|·|E|·|F|)· ανά εποχή)

```
procedure ECE_Epoch(S, E, HELD_OUT, F_prev):
  H ← HELD_OUT.rotate(frozen=true) ; F ← HELD_OUT.new_seeded_faults()
  T ← []
  for e in E:
    for t in e.generate_challenges(k):                                  # adversarial self-challenge
      if H.verify_witness(t.escrow_witness): T.append(t)                # solvable by construction, verified by H
      else record(REJECTED_UNSOLVABLE, t)
  scores_E ← {(s,t,e): e.score(s.solve(t)) for s∈S, t∈T, e∈E if not e.excluded_for(s)}
  sample ← H.sample(T, m) ; scores_H ← {(s,t): H.score(s.solve(t)) for s∈S, t∈sample}
  for (e,s) in E×S:
    iv ← EIM.independence(e, s)                                         # lineage rule: distilled(P) ⇒ P ∈ lineage
    if any(iv_i < θ_i for i): e.excluded_for(s) ← true ; record(EXCLUDED, e, s, iv)
  for e in E: e.fitness ← AUC(e, F) + proper_score(e, scores_H) − corr(errors(e), errors(S))
  for s in S: s.fitness ← proper_score(s, scores_H)                    # H-verified only (MFA-INV-088)
  for fam in families:
    g ← |mean(scores_E[fam]) − mean(scores_H[fam])|
    if g > θ_goodhart: invalidate(scores_E[fam]) ; flag_epoch(fam, GOODHART)
  Curriculum.feed({t ∈ T : informative(t, scores_H)})                  # MFA-ELM-106
  S ← evolve_solvers(S, fitness=s.fitness, via=PRR/SMF)
  E ← QD_evolve(E, fitness=e.fitness, constraint=lineage_disjoint_from(S), novelty=CAM_NS)
  return S, E, T
```

**Αλγόριθμος — generate_challenges (ασύμμετρη ανταμοιβή)** (πολυπλοκότητα: O(k · cost(generate) + cost(witness)))

```
function generate_challenges(e, k):
  out ← []
  for i in 1..k:
    t ← e.propose_task(target=max_expected_solver_error, constraint=has_witness)
    t.escrow_witness ← seal(e.solve_privately(t))                      # generator must be able to solve it (asymmetry, MFA-MECH-023 setter rule)
    out.append(t)
  return out                                                           # reward to e only if solver fails AND witness valid
```

### 2.8 Εφεύρεση υποθέσεων — Hypothesis invention

**Μηχανισμοί:** MFA-MECH-028 · **Ικανότητες lattice:** MFA-CAP-092 · **Στοιχεία:** MFA-ELM-111, MFA-ELM-030

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-028 — Abductive Hypothesis Engine (AHE) — εφεύρεση υποθέσεων με τύπο falsifier και Expected Falsification Value: Υπόθεση = τυπωμένη δέσμευση H = ⟨explanandum, μοντέλο/πρόγραμμα, falsifier, νέες προβλέψεις, κόστος ελέγχου⟩· χωρίς falsifier δεν εισάγεται (η απόρριψη καταγράφεται). Τρεις EIM-ανεξάρτητες γεννήτριες (ILP πάνω στην οντολογία, αναζήτηση προγραμμάτων στο Skill Library, παραμετρική πρόταση από κυρίαρχο μοντέλο) ανταγωνίζονται· κατάταξη με Expected Falsification Value EFV(H) = P(διάψευση)·InfoGain / cost· έλεγχος Genesis-first (LWM/World Twin/DST) και μετά υπό RET· επιζώσες υποθέσεις προάγονται μηχανικά σε OGE (έννοιες) ή CDCE (ακμές)· επαναλαμβανόμενα εξηγητικά σχήματα συμπιέζονται (anti-unification) σε βιβλιοθήκη. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: AHE.submit(anomaly)→AnomalyId · AHE.hypotheses(anomaly)→[Hypothesis with EFV, status] · AHE.test(H)→TestPlan · AHE.promote(H)→{ConceptCommitment ∣ CausalEdge ∣ SkillProgram} · AHE.schemas()→Lib · AHE.generator_calibration()→[(generator, score)] ‖ Ροή: MFA-ELM-111 (νέο στοιχείο AHE, S2) · MFA-ELM-030 (η φάση «υπόθεση» υλοποιείται από το AHE) · MFA-ELM-109/110 (PROMOTE) · MFA-ELM-112 TGPS (υπόθεση-νόμος → απόδειξη) · MFA-ELM-106 curriculum (ανωμαλίες ως έργα) · MFA-ELM-091 cockpit (ορατότητα) |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: A_t ουρά ανωμαλιών · S_t σύνολα υποθέσεων ανά ανωμαλία με posterior · Lib_t βιβλιοθήκη σχημάτων · Tests_t (προγραμματισμένα/εκτελεσμένα) · GenStats_t (calibration ανά γεννήτρια — proper scoring από HELD_OUT) ‖ Μεταβάσεις: ANOMALY: residual > θ ή Void entry ⇒ a ∈ A_t · GENERATE: S_a ← ∪_g Gen_g(a, Lib) με g EIM-ανεξάρτητες· type-check φ (χωρίς falsifier ⇒ REJECTED_UNFALSIFIABLE, καταγράφεται) · RANK: EFV· schedule top-k υπό budget · TEST: venue Genesis-first· Effect μόνο RET REVERSIBLE/envelope · UPDATE: Bayesian posterior· διαψευσμένες → FALSIFIED (μένουν)· επιζώσες με N_H επιβεβαιωμένες → PROMOTE · PROMOTE: υπόθεση-έννοια → OGE.birth· υπόθεση-αιτία → CDCE edge INT· υπόθεση-νόμος → Skill Library + TGPS απόδειξη · COMPRESS: anti-unify επιζώσες → Lib_{t+1} |
| 4. Contracts | MFA-CON-034 (RET), MFA-CON-054/055 (OGE/CDCE promote), MFA-CON-056 (Abductive Hypothesis: submit/hypotheses/test/promote) |
| 5. Invariants | MFA-INV-082: καμία υπόθεση χωρίς εκτελέσιμο falsifier και ≥1 νέα πρόβλεψη· η απόρριψη καταγράφεται; MFA-INV-083: διαψευσμένες υποθέσεις παραμένουν (FALSIFIED) — μόνο ο μηχανισμός τους κρίνεται, η ικανότητα μένει |
| 6. Αλγόριθμοι | AHE-Loop; derive_novel_predictions — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | AHE-Loop: Ανά ανωμαλία: γεννήτριες O(G·budget_g)· ILP NP-hard φραγμένο από μέγεθος χώρου υποθέσεων (Popper: constraint pruning)· κατάταξη O(∣S∣ log ∣S∣)· έλεγχος = κόστος venue ‖ derive_novel_predictions: O(∣model∣ · forward chaining depth) ‖ πόροι: DEP-1: ILP (Popper) CPU λεπτά/ανωμαλία, 10 υποθέσεις/ημέρα· DEP-2: παραμετρική γεννήτρια GPU, 10² ανωμαλίες/ημέρα· DEP-3+: 10⁴· βιβλιοθήκη O(∣Lib∣²) ανά epoch συμπίεσης ‖ κλιμάκωση: Ρυθμός επιζωσών υποθέσεων ανά compute (MFA-VO-070)· αναμένεται υπο-γραμμικός στις ανωμαλίες (οι εύκολες πρώτα)· η βιβλιοθήκη μειώνει το κόστος γέννησης ~ log(∣Lib∣). |
| 8. Τρόποι αποτυχίας | Ad hoc υποθέσεις (εξηγούν μόνο το explanandum) → ανίχνευση: N_H = ∅ → απόκριση: REJECTED_AD_HOC (MFA-INV-082); Γεννήτρια που κυριαρχεί (mode collapse) → ανίχνευση: diversity(S) < θ → απόκριση: quota ανά γεννήτρια· EIM έλεγχος; P-hacking μέσω πολλών ελέγχων → ανίχνευση: FDR → απόκριση: προκαταχωρισμένο κριτήριο + BH διόρθωση; Επικίνδυνο πείραμα → ανίχνευση: RET IRREVERSIBLE → απόκριση: μόνο Genesis venues ή δημιουργός; Αντιπαλική ανωμαλία (σπρώχνει προς επιθυμητή υπόθεση) → ανίχνευση: taint προέλευσης → απόκριση: CAM-NS ως αντίπαλος στο S· quarantine; περιορισμός: Genesis-first· Effect ελέγχοι υπό RET· budgets· κάθε PROMOTE αναστρέψιμο (OGE/CDCE γενεαλογία)· Emergency-stop. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-070: AHE-E1 (seeded κρυφοί μηχανισμοί σε DST) F2· AHE-E2 (νομικές ανωμαλίες, HELD_OUT dockets) F3· property: κάθε H έχει φ εκτελέσιμο (F1)· calibration των γεννητριών με proper scoring ‖ πειράματα: AHE-E1: ανάκτηση ≥ 60 % μηχανισμών σε budget· EFV-κατάταξη μειώνει ελέγχους ανά ανάκτηση ≥ 30 % έναντι τυχαίας · AHE-E2: ≥ 1 επιζώσα υπόθεση με επιβεβαιωμένη νέα πρόβλεψη σε μεταγενέστερα δεδομένα· Brier των N_H < baseline |
| 10. Διαδρομή υλοποίησης | Δόση 1: ILP γεννήτρια + Genesis venues + EFV· Δόση 2: παραμετρική γεννήτρια (SMF) + AHE-E1· Δόση 3: Effect ελέγχοι υπό envelope + AHE-E2 + βιβλιοθήκη σχημάτων· Δόση 4: υπό RVSI L2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή: Hypothesis type με υποχρεωτικό falsifier, EFV, bayes update (tools/twin) → F2: DST AHE-E1 με Popper ως αντικαταστάσιμη ILP υλοποίηση → F3: AHE-E2 σε HELD_OUT dockets, DEP-2 → F4: παραγωγή Δόση 2–3 |
| 11. Falsifier | AHE-E1: ανάκτηση όχι καλύτερη από τυχαίες υποθέσεις; Καμία επιζώσα υπόθεση με επιβεβαιωμένη νέα πρόβλεψη σε 2 δόσεις; Οι τρεις γεννήτριες δεν είναι EIM-ανεξάρτητες (τότε ο μηχανισμός τρέχει ως μονή γεννήτρια — ο ισχυρισμός ανεξαρτησίας διαψεύδεται, όχι η ικανότητα) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — AHE-Loop** (πολυπλοκότητα: Ανά ανωμαλία: γεννήτριες O(G·budget_g)· ILP NP-hard φραγμένο από μέγεθος χώρου υποθέσεων (Popper: constraint pruning)· κατάταξη O(|S| log |S|)· έλεγχος = κόστος venue)

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

**Αλγόριθμος — derive_novel_predictions** (πολυπλοκότητα: O(|model| · forward chaining depth))

```
function derive_novel_predictions(H, exclude):
  preds ← forward_chain(H.model, facts=ledger_cut \ exclude, depth ≤ d)
  return {p ∈ preds : p ∉ used_to_build(H) ∧ testable(p) ∧ p ∉ known_facts}   # Popperian content: risky predictions only
```

### 2.9 Σύνθεση θεωρημάτων και προγραμμάτων — Theorem and program synthesis

**Μηχανισμοί:** MFA-MECH-029 · **Ικανότητες lattice:** MFA-CAP-093 · **Στοιχεία:** MFA-ELM-112, MFA-ELM-020, MFA-ELM-025

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-029 — Theorem-Guided Program & Proof Synthesis (TGPS) — αποδείξεις και προγράμματα ως ένα αντικείμενο υπό VFC: Κάθε στόχος σύνθεσης είναι ΥΠΟΧΡΕΩΣΗ (Obligation Calculus MFA-MECH-039) με spec στο κανονικό υπόστρωμα· απόδειξη και πρόγραμμα είναι ο ίδιος τύπος αντικειμένου (Curry–Howard σε Lean 4: πρόγραμμα με refinement = απόδειξη)· δύο EIM-ανεξάρτητες γεννήτριες (συμβολική απαρίθμηση με type-directed pruning + παραμετρική πολιτική εκπαιδευμένη με PRR) αναζητούν σε ΜΙΑ βιβλιοθήκη· κάθε artifact φέρει πιστοποιητικό που ελέγχεται από ≥2 ανεξάρτητους checkers (VFC)· η βιβλιοθήκη μαθαίνεται (anti-unification/refactoring) και η μάθηση μετριέται ως μείωση μήκους απόδειξης/κόστους ανά σφραγισμένη υποχρέωση. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: TGPS.submit(obligation)→Ticket · TGPS.solve(ticket)→Artifact ∣ UNKNOWN(reason, partial) · TGPS.verify(artifact)→[checker verdicts] · TGPS.library(cut)→Lib · TGPS.stats(sealed_set)→GrowthRecord · TGPS.compress()→Receipt ‖ Ροή: MFA-ELM-112 (νέο στοιχείο TGPS, S3) · MFA-ELM-020/025 (υλοποιήσεις υπό VFC) · MFA-ELM-122 OC (πηγή υποχρεώσεων) · MFA-ELM-104 RVSI L1 (προγράμματα ως προτάσεις) · MFA-ELM-113 RAGen (αρχιτεκτονικές αποδείξεις ιδιοτήτων) · MFA-ELM-106 curriculum (conjectures) |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: Queue_t υποχρεώσεων ανά tier · Lib_t · π_θ, V_θ (βάρη = WeightCommitments) · Stats_t (επιτυχία ανά budget, μήκος απόδειξης) σε σφραγισμένο σύνολο · Partial_t (ημιτελείς αποδείξεις ως UNKNOWN(PROOF_NOT_FOUND) με πρόοδο) ‖ Μεταβάσεις: SUBMIT: ob → Queue με B(tier) · SKETCH: ob → υποστόχοι (lemma sketch από παραμετρική γεννήτρια, τυπικά ελεγμένοι ως δηλώσεις) · SEARCH: ανά υποστόχο, δύο γεννήτριες παράλληλα, budget split · CERTIFY: cert ελέγχεται από ≥2 checkers· διαφωνία ⇒ Both → VFC incident · ADMIT: art → Lib (ADD) + CC ASSERT(proved(ob), cert) · FAIL: budget εξαντλήθηκε ⇒ UNKNOWN(PROOF_NOT_FOUND, partial, plan=more budget ∣ decompose) · COMPRESS: epoch → anti-unify Lib, refactor, re-check όλων |
| 4. Contracts | MFA-CON-047 (SMF — εκπαίδευση π_θ), MFA-CON-048 (PRR), MFA-CON-052 (VFC), MFA-CON-057 (Synthesis: submit/solve/verify/library/compress) |
| 5. Invariants | MFA-INV-084: κανένα artifact ADMITTED χωρίς ≥2 ανεξάρτητα PASS πιστοποιητικού· διαφωνία = VFC incident, ποτέ σιωπηλή επιλογή; MFA-INV-085: η αυτο-βελτίωση της αναζήτησης μετριέται μόνο σε σφραγισμένες υποχρεώσεις (HELD_OUT), ποτέ στις υποχρεώσεις που εκπαίδευσαν την πολιτική |
| 6. Αλγόριθμοι | TGPS-Solve; Guided_Search (best-first με πολιτική/αξία); Library-Compress (epoch) — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | TGPS-Solve: Εκθετική στο βάθος d (b^d), φραγμένη από B(tier)· type-directed pruning μειώνει b· CEGIS O(iters·(synth+verify))· ανά υποχρέωση ‖ Guided_Search (best-first με πολιτική/αξία): O(B · (∣tactics∣ · cost(π_θ) + cost(kernel step))) ‖ Library-Compress (epoch): O(∣Lib∣² · anti-unification) ανά epoch· re-check O(∣Lib∣ · kernel) ‖ πόροι: DEP-1: Lean 4 CPU, B=10³ κόμβοι/υποχρέωση, πολιτική μικρή (≤1B)· DEP-2: B=10⁵, πολιτική 7–13B GPU· DEP-3+: B=10⁷, PRR συνεχής· Compress epoch ώρες ‖ κλιμάκωση: Επιτυχία ανά budget αυξάνει με log(B) (best-first) και με ∣Lib∣ (μείωση μήκους)· η PRR-πολιτική αναμένεται να μετατοπίζει την καμπύλη (AlphaProof-class evidence)· MFA-VO-071 = success-rate-per-budget καμπύλη ανά epoch. |
| 8. Τρόποι αποτυχίας | Unsound sketch (ψευδές λήμμα) → ανίχνευση: type-check / kernel → απόκριση: απορρίπτεται· αρνητικό παράδειγμα; Checker διαφωνία → ανίχνευση: VFC → απόκριση: incident, ADMIT μπλοκάρεται (MFA-INV-084); Βιβλιοθήκη «φουσκώνει» με άχρηστα λήμματα → ανίχνευση: χρήση < θ σε N epochs → απόκριση: RETIRE (η έδρα μένει)· compression; Policy overfitting στο train set υποχρεώσεων → ανίχνευση: sealed success flat/πτώση → απόκριση: MFA-INV-085· ORP επιστροφή; Budget exhaustion σε Tier-0 → ανίχνευση: UNKNOWN(PROOF_NOT_FOUND) → απόκριση: decompose + escalation στον δημιουργό· ποτέ ψευδές PASS; περιορισμός: Κανένα artifact δεν επηρεάζει Effect plane χωρίς ADMIT· Tier-0 ADMIT υπό δημιουργό· η βιβλιοθήκη πυρήνα (CC κανόνες) εκτός αυτο-συμπίεσης (VFC L3). |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-071: TGPS-E1 (σφραγισμένο σύνολο υποχρεωμένων: miniF2F-class + οι Lean VOs του πακέτου) F2/F3· TGPS-E2 (προγράμματα Skill Library από raw επεισόδια) F3· property: ≥2 checkers ανά ADMIT (F1)· #print axioms σε κάθε artifact ‖ πειράματα: TGPS-E1: Μετά 3 epochs: success@B αυξάνει ≥ 10 pp ΚΑΙ μέσο μήκος απόδειξης μειώνεται ≥ 20 %· 0 ADMIT με checker διαφωνία · TGPS-E2: ≥ 70 % με πιστοποιητικό (refinement ή πλήρης test+contract)· 0 ψευδώς πιστοποιημένα σε adversarial tests |
| 10. Διαδρομή υλοποίησης | Δόση 0.5: Lean specs των 8 κανόνων CC ως πρώτες υποχρεώσεις, enumerative μόνο· Δόση 1: guided search με μικρή πολιτική + 2 checkers· Δόση 2: PRR + compress + TGPS-E1· Δόση 3: TGPS-E2, υπό RVSI. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή (tools/twin): Obligation/Artifact/2-checker ADMIT, growth record → F2: Lean 4 + LeanDojo-class υποδομή ως αντικαταστάσιμη υλοποίηση· TGPS-E1 σε DEP-1/2 → F3: PRR πολιτική, compress, TGPS-E2 → F4: παραγωγή Δόση 1–3 |
| 11. Falsifier | Καμία βελτίωση success@B μετά compress+PRR σε 3 epochs (η αυτο-βελτίωση της αναζήτησης διαψεύδεται); Οποιοδήποτε ADMITTED artifact που απορρίπτεται από ανεξάρτητο checker (unsoundness = σφάλμα υλοποίησης VFC); Η ενοποιημένη βιβλιοθήκη δεν μειώνει κόστος έναντι δύο χωριστών (τότε ο ισχυρισμός ενοποίησης πέφτει, η ικανότητα μένει) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — TGPS-Solve** (πολυπλοκότητα: Εκθετική στο βάθος d (b^d), φραγμένη από B(tier)· type-directed pruning μειώνει b· CEGIS O(iters·(synth+verify))· ανά υποχρέωση)

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

**Αλγόριθμος — Guided_Search (best-first με πολιτική/αξία)** (πολυπλοκότητα: O(B · (|tactics| · cost(π_θ) + cost(kernel step))))

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

**Αλγόριθμος — Library-Compress (epoch)** (πολυπλοκότητα: O(|Lib|² · anti-unification) ανά epoch· re-check O(|Lib| · kernel))

```
procedure Library_Compress(Lib):
  candidates ← anti_unify_pairs(Lib, min_uses=3)              # common subterms across proofs/programs (DreamCoder-style)
  for c in candidates.sorted_by(compression_gain):
    Lib' ← refactor(Lib, abstraction=c)
    if all(VFC.verify(a) for a in Lib'.artifacts) and total_length(Lib') < total_length(Lib): Lib ← Lib'
  Stats.record(sealed_obligations: success_rate_per_budget, mean_proof_length)   # MFA-VO-071 growth record
```

### 2.10 Αναζήτηση αρχιτεκτονικής — Architecture search

**Μηχανισμοί:** MFA-MECH-030, MFA-MECH-032 · **Ικανότητες lattice:** MFA-CAP-094 · **Στοιχεία:** MFA-ELM-113, MFA-ELM-077

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-030 — Recursive Architecture Generator (RAGen) — αναζήτηση αρχιτεκτονικών ως τυπωμένων γονιδιωμάτων υπό πύλη επαλήθευσης: Η αρχιτεκτονική είναι τυπωμένο γονιδίωμα G στη Genesis Grammar (MFA-MECH-032): στοιχεία με contracts, invariants, συνδεσμολογία, παραμέτρους ΚΑΙ τελεστές αναζήτησης. Το RAGen κάνει Quality-Diversity αναζήτηση (MAP-Elites με περιγραφητές = συντεταγμένες του capability lattice + κόστος + κλάση απόδειξης), κάθε υποψήφιο instantiated ως σκιώδης αρχιτεκτονική στο δίδυμο (TES, MFA-MECH-043) σε πιστότητα F1/F2, αξιολογείται σε ΣΦΡΑΓΙΣΜΕΝΕΣ υποχρεώσεις (KT/VO) από HELD_OUT, μπαίνει σε Pareto αρχείο, και προάγεται ΜΟΝΟ μέσω RVSI L2 → GCP shadow→canary→cutover. Αναδρομή: οι τελεστές μετάλλαξης είναι γονιδιώματα επιπέδου L2 με fitness = ρυθμός βελτίωσης απογόνων· το harness αξιολόγησης, το VFC και το Telos είναι L3 (σταθερό σημείο) — ποτέ στον χώρο. ‖ MFA-MECH-032 — Genesis Grammar (G_Ω) — μία γεννητική γραμματική για γλώσσες, δρώντες, θεσμούς και αρχιτεκτονικές: Μία attribute grammar G_Ω πάνω στο κανονικό υπόστρωμα με μη-τερματικά {Language, Agent, Institution, Architecture, Grammar}· κάθε παραγωγή φέρει attributes ⟨obligations (contracts/invariants που το προϊόν οφείλει), authority_level του προϊόντος, RET class της instantiation, VO⟩· κάθε παραγωγή (derivation) είναι δέσμευση· η γραμματική επεκτείνεται με νέες παραγωγές (Grammar → Grammar′) που εισάγονται ΜΟΝΟ υπό VFC + Galois έλεγχο σύγκρουσης + drill, ενώ οι Tier-0 παραγωγές (CC, LPA, RET, ταυτότητα) είναι L3 — γένεση της γένεσης χωρίς να αγγίζεται το σταθερό σημείο. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: RAGen.cycle(budget)→[ArchitectureProposal] · RAGen.archive(cut)→A · RAGen.frontier()→Pareto set · RAGen.lineage(G)→DAG · RAGen.operators()→Ops with fitness · RAGen.fixed_point()→FP (read-only) ‖ Ροή: MFA-ELM-113 (νέο στοιχείο RAGen, S7) · MFA-ELM-077 · MFA-ELM-104 RVSI L2 (καταναλωτής προτάσεων) · MFA-ELM-039 GCP · MFA-ELM-126 twin · MFA-ELM-050 CAM-NS (αντίπαλος στο harness) ‖ Διεπαφές: GG.derive(spec, kind)→Derivation ∣ UNKNOWN · GG.instantiate(D)→Product+receipt · GG.extend(production)→Receipt ∣ REJECT · GG.productions(cut)→P · GG.lineage(product)→D chain · GG.fixed_point()→P_L3 (read-only) ‖ Ροή: MFA-ELM-115 (νέο στοιχείο GG, S6) · MFA-ELM-074/053/034 (γίνονται instantiators) · MFA-ELM-113 RAGen (Architecture γονιδιώματα) · MFA-ELM-048 Court (θεσμοί) · MFA-ELM-041…057 (συλλογικό) |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: A_t αρχείο · Ops_t τελεστές (L2 γονιδιώματα) με fitness · Frontier_t Pareto · Pending_t προτάσεις προς RVSI/GCP · Budget_t (twin evaluations ανά κύκλο) ‖ Μεταβάσεις: SELECT: γονείς από A κατά curiosity (κελιά με λίγες επισκέψεις) + elite · MUTATE: G′ = μ(G)· type-check ⊨ G_Ω· contract compatibility (Galois, GCP)· απορρίπτεται αν παραβιάζει invariant statically · INSTANTIATE: twin shadow σε F1 (mocks) → F2 (DST) αν υπόσχεται · EVALUATE: f(G′) σε σφραγισμένα από HELD_OUT· CapabilityGrowthRecord · INSERT: MAP-Elites/Pareto· ποτέ αντικατάσταση χωρίς κυριαρχία · PROPOSE: frontier G′ με Δf>0 σε ≥1 οικογένεια και Δf≥0 σε όλες (ratchet) → RVSI L2 · RECURSE: Ops fitness ← ρυθμός βελτίωσης· Ops μεταλλάσσονται στο ίδιο πλαίσιο· FP αμετάβλητο ‖ Μεταβλητές: P_t (παραγωγές με level) · Products_t (γενεαλογία προϊόντων) · Pending extensions · Usage stats ανά παραγωγή ‖ Μεταβάσεις: DERIVE: spec → D (αναζήτηση παραγωγής· TGPS για O_p) · INSTANTIATE: D → προϊόν με contracts ενεργά, authority a_p, RET ret_p· receipt · EXTEND: p′ ⇒ Galois(O_{p′}, P_t) = ∅ ∧ VFC PASS ∧ drill PASS ⇒ P_{t+1} = P_t ∪ {p′} (L2) · RETIRE: παραγωγή χωρίς χρήση → RETIRED (μένει) · FP: κάθε πρόταση που αγγίζει P_L3 απορρίπτεται και καταγράφεται |
| 4. Contracts | MFA-CON-012 (Body Runtime / Embodiment), MFA-CON-015 (Lifecycle & Organizations), MFA-CON-020 (Forge), MFA-CON-040 (GCP Galois), MFA-CON-040 (GCP), MFA-CON-049 (RVSI), MFA-CON-058 (Architecture Generation: cycle/archive/frontier/propose), MFA-CON-060 (Genesis Grammar: derive/instantiate/extend), MFA-CON-072 (Twin Execution) |
| 5. Invariants | MFA-INV-086: το σταθερό σημείο FP (harness, VFC, Telos, HELD_OUT, RET, LPA Tier-0) δεν ανήκει ποτέ στον χώρο αναζήτησης· κάθε πρόταση που το αγγίζει απορρίπτεται και καταγράφεται; MFA-INV-087: καμία αρχιτεκτονική προαγωγή χωρίς Pareto μη-υποχώρηση (ratchet) σε ΟΛΕΣ τις σφραγισμένες οικογένειες + GCP shadow/canary; MFA-INV-090: οι Tier-0 παραγωγές (CC, LPA Tier-0, RET, key lineage) δεν επεκτείνονται/τροποποιούνται από καμία derivation ή extension (L3); MFA-INV-091: κάθε προϊόν γένεσης φέρει ενεργά contracts, authority ≤ του γεννήτορα και RET κλάση από τη στιγμή της instantiation — κανένα «ορφανό» προϊόν |
| 6. Αλγόριθμοι | RAGen-Cycle; conforms / behaviour_descriptor; GG-Derive; GG-Extend — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | RAGen-Cycle: O(P·(typecheck + Galois + twin_eval))· twin_eval κυριαρχεί (F1 ms, F2 λεπτά)· αρχείο φραγμένο ∣A∣ ≤ cells· ανά κύκλο ‖ conforms / behaviour_descriptor: conforms O(∣G∣)· descriptor O(∣CAP∣) ‖ πόροι: DEP-1: P=8, F1 μόνο, CPU λεπτά/κύκλο· DEP-2: P=32, F2 DST ώρες/κύκλο, εβδομαδιαίοι κύκλοι· DEP-3: ημερήσιοι· DEP-4: συνεχείς με παράλληλα twins ‖ κλιμάκωση: QD κάλυψη ~ log(evals)· ρυθμός frontier βελτίωσης φθίνει (κορεσμός) — η αναδρομή στους τελεστές μετατοπίζει την καμπύλη (DGM-class evidence)· μετριέται MFA-VO-072. ‖ GG-Derive: Αναζήτηση παραγωγής: εκθετική στο βάθος, φραγμένη από budget· attribute evaluation O(∣D∣)· TGPS ανά υποχρέωση ‖ GG-Extend: Galois O(∣P∣·∣O∣)· VFC έλεγχος· drill = κόστος πειράματος ‖ πόροι: DEP-1: αναζήτηση παραγωγής CPU δευτερόλεπτα, ∣P∣ ≈ 100· DEP-2: ∣P∣ ≈ 10³, TGPS υποχρεώσεις λεπτά· DEP-3+: παράλληλες derivations ‖ κλιμάκωση: Εκφραστικότητα ~ ∣P∣ (γραμμική) με κόστος αναζήτησης ~ b^d· η μάθηση παραγωγών μειώνει d για συχνά είδη· MFA-VO-074. |
| 8. Τρόποι αποτυχίας | Reward hacking του harness (αρχιτεκτονική που «περνά» KT χωρίς ικανότητα) → ανίχνευση: HELD_OUT + seeded faults + CAM-NS αντίπαλος στο harness → απόκριση: FP εκτός χώρου· harness ανανεώνεται μόνο L3; Αρχείο συγκλίνει (μηδενική ποικιλία) → ανίχνευση: QD coverage ↓ → απόκριση: curiosity sampling· νέοι τελεστές; Κόστος twin evals → ανίχνευση: budget → απόκριση: F1 προεπιλογή· F2 μόνο promising; Πρόταση που σπάει runtime contract αόρατα στα mocks → ανίχνευση: F2 DST + GCP shadow → απόκριση: προαγωγή μπλοκάρεται· MFA-INV-087; Τελεστής που μαθαίνει να παρακάμπτει τον έλεγχο conforms → ανίχνευση: conforms ∈ FP (L3) → απόκριση: αδύνατο εξ ορισμού· απόπειρα καταγράφεται; περιορισμός: Ο χώρος αναζήτησης ⊂ Genesis· FP L3· προαγωγή μόνο διά GCP με rollback· twin sandbox· Emergency-stop.; Έκφραση αδύνατη (NO_DERIVATION) → ανίχνευση: GG-Derive UNKNOWN → απόκριση: ExtensionProposal — ποτέ σιωπηλή αποτυχία; Θεσμός/δρών με εξουσία > γεννήτορα → ανίχνευση: attributes_consistent → απόκριση: απορρίπτεται (MFA-INV-091); Επέκταση που εισάγει σύγκρουση με υπάρχοντες κανόνες → ανίχνευση: Galois → απόκριση: REJECT με τεκμήριο; Γλώσσα με μη-τερματίζοντα compiler → ανίχνευση: Forge budget → απόκριση: προϊόν σε quarantine· KT-10; Πληθωρισμός θεσμών → ανίχνευση: RateBounds → απόκριση: Org Genesis ρυθμός = πολιτική; περιορισμός: Προϊόντα με εξουσία μόνο μέσω RET/δημιουργού· extensions L2 υπό GCP· P_L3 αμετάβλητο· twin drill πριν από κάθε extension. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-072: RAGen-E1 (ανάκτηση από υποβαθμισμένη αρχιτεκτονική) F2· RAGen-E2 (frontier > χειροποίητη σε σφραγισμένο KT) F2/F3· property: FP untouched (F1 tools/twin)· GCP drill σε κάθε προαγωγή ‖ πειράματα: RAGen-E1: Ανάκτηση PASS στα 3 KT σε ≤ 50 κύκλους· 0 προτάσεις που αγγίζουν FP · RAGen-E2: ≥ 1 frontier G′ με Δf>0 (CI) σε ≥1 οικογένεια και Δf≥0 σε όλες, με ≥1 νέα συνδεσμολογία που δεν υπήρχε στο αρχείο εκκίνησης ‖ MFA-VO-074: GG-E1 (τρία είδη προϊόντων από specs) F2· GG-E2 (αυτο-επέκταση) F2/F3· KT-10/11/02/18 ως drills· property: P_L3 untouched, authority monotone (F1) ‖ πειράματα: GG-E1: 3/3 derivations + instantiations με ενεργά contracts· KT PASS· 0 παραβιάσεις μονοτονίας εξουσίας · GG-E2: p′ εισάγεται με VFC+Galois+drill PASS και το έργο λύνεται· 0 προτάσεις που αγγίζουν P_L3 γίνονται δεκτές |
| 10. Διαδρομή υλοποίησης | Δόση 2: RAGen σε F1 μόνο, προτάσεις L1 (params)· Δόση 3: F2 DST, L2 δομικές με GCP shadow (RAGen-E1)· Δόση 4: αναδρομή τελεστών + RAGen-E2· πάντα FP εκτός. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή (tools/twin): Genome, conforms, FP guard, Pareto archive → F2: DST RAGen-E1 σε DEP-2 → F3: RAGen-E2 + GCP drill → F4: παραγωγή Δόση 3–4 ‖ Δόση 2: G_Ω με Language+Institution παραγωγές (KT-10/11)· Δόση 3: Agent+Architecture + GG-E1· Δόση 4: extensions L2 + GG-E2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή: grammar, attributes, monotonicity, L3 guard (tools/twin) → F2: DST GG-E1 → F3: GG-E2 σε DEP-2 → F4: παραγωγή Δόση 2–4 |
| 11. Falsifier | RAGen-E2: κανένα frontier G′ καλύτερο από χειροποίητη μετά 200 κύκλους σε 2 δόσεις; Αναδρομή στους τελεστές δεν αυξάνει ρυθμό βελτίωσης έναντι σταθερών τελεστών; Οποιαδήποτε προαγωγή χωρίς GCP gate (σφάλμα υλοποίησης); GG-E1: αδυναμία derivation ενός από τα τρία είδη με την ενιαία γραμματική (τότε η ενοποίηση διαψεύδεται· οι τρεις διαδρομές μένουν); GG-E2: καμία επιτυχής αυτο-επέκταση σε 2 δόσεις; Οποιοδήποτε προϊόν χωρίς contracts/RET (σφάλμα υλοποίησης) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — RAGen-Cycle** (πολυπλοκότητα: O(P·(typecheck + Galois + twin_eval))· twin_eval κυριαρχεί (F1 ms, F2 λεπτά)· αρχείο φραγμένο |A| ≤ cells· ανά κύκλο)

```
procedure RAGen_Cycle(A, Ops, budget):
  parents ← curiosity_sample(A, n=P/2) ∪ elite_sample(A, n=P/2)
  children ← []
  for G in parents:
    μ ← sample(Ops, by=fitness)                                  # operators are L2 genomes
    G' ← μ(G)
    if not conforms(G', GenesisGrammar): continue
    if GCP.galois_conflict(G'.contracts, G'.invariants) ≠ ∅: continue        # static contract/invariant clash
    if touches(G', FixedPoint): reject_and_record(G', reason=L3_VIOLATION)   # MFA-INV-086, never silent
    G'.provenance ← ⟨parent=G.cid, op=μ.cid, cut⟩
    children.append(G')
  for G' in children:
    if budget.twin_evals = 0: break
    r1 ← Twin.instantiate(G', fidelity=F1).evaluate(sealed=HELD_OUT.obligations(F1))
    if not promising(r1): continue
    r2 ← Twin.instantiate(G', fidelity=F2).evaluate(sealed=HELD_OUT.obligations(F2)) ; budget.twin_evals −= 1
    f ← fitness_vector(r2) ; b ← behaviour_descriptor(G', r2)
    A.insert(cell(b), G', f) if pareto_nondominated(f, A.cell(b)) else archive_only(G')
    CGM.record(G', f, resources)                                 # MFA-VO-072 growth record
    if Δf(G', current) ≥ 0 ∀families and > 0 ∃family: RVSI.propose(L2, ArchitectureProposal(G', predicted=Δf, rollback=current))
  for μ in Ops: μ.fitness ← improvement_rate(offspring_of(μ))    # recursion on operators
  Ops ← QD_update(Ops, mutate_ops(Ops), keep=FixedPoint_untouched)
```

**Αλγόριθμος — conforms / behaviour_descriptor** (πολυπλοκότητα: conforms O(|G|)· descriptor O(|CAP|))

```
function conforms(G, G_Ω):
  return parse(G, G_Ω) ≠ ⊥ ∧ ∀e ∈ G.Elems: has_contract(e) ∧ has_verification(e) ∧ ∀c ∈ G.Contracts: provider(c) ∈ G.Elems
function behaviour_descriptor(G, r):
  return ⟨coverage_by_concern(G, CapabilityLattice), r.energy_Wh, r.latency_p95, proof_class(G), TCB_size(G)⟩
```

**Αλγόριθμος — GG-Derive** (πολυπλοκότητα: Αναζήτηση παραγωγής: εκθετική στο βάθος, φραγμένη από budget· attribute evaluation O(|D|)· TGPS ανά υποχρέωση)

```
procedure GG_Derive(spec, kind ∈ N):
  frontier ← [(kind, ∅)] ; best ← ⊥
  while frontier ≠ ∅ and budget > 0:
    (node, partial) ← frontier.pop_by(heuristic=spec_similarity)
    for p in P.productions_for(node):
      D ← extend(partial, p)
      if not attributes_consistent(D): continue                       # obligations composable, authority monotone (child ≤ parent)
      if complete(D):
        if satisfies(D, spec) and all(TGPS.solve(o) ≠ ⊥ for o in D.obligations): return CC.assert(Derivation(D, spec))
      else: frontier.push((next_nonterminal(D), D))
    budget −= 1
  return UNKNOWN(NO_DERIVATION, plan=[propose_extension(spec)])       # missing expressivity → GG_Extend proposal
procedure GG_Instantiate(D):
  match D.kind:
    Language:    L ← Forge.compile(D)      ; register(LexDSL_variant=L, contracts=D.obligations)
    Agent:       A ← Embodiment.spawn(D)   ; keys ← KeyLineage.issue(A, authority=D.authority) ; Charter.bind(A, D)
    Institution: I ← OrgGenesis.create(D)  ; Court.hook(I.proceedings) ; roles ← I.roles
    Architecture: G ← RAGen.genome(D)
  return receipt(D, product, ret=D.ret)                               # RET class decides escrow/preauthorization
```

**Αλγόριθμος — GG-Extend** (πολυπλοκότητα: Galois O(|P|·|O|)· VFC έλεγχος· drill = κόστος πειράματος)

```
procedure GG_Extend(p'):
  if touches(p', P_L3): return REJECT(L3_VIOLATION, recorded=true)   # MFA-INV-090
  if GCP.galois_conflict(p'.obligations, P) ≠ ∅: return REJECT(CONFLICT, evidence)
  if not VFC.verify(p'.soundness_certificate): return REJECT(UNVERIFIED)
  drill ← Twin.run(p', scenarios=KT_for(p'.kind))                    # KT-10 (language), KT-11 (org), KT-02/18 (agent)
  if drill.fail: return REJECT(DRILL_FAIL, drill)
  P ← P ∪ {p' with level=L2} ; return CC.assert(GrammarExtension(p'))
```

### 2.11 Επαληθευμένη αναδρομική αυτο-βελτίωση — Verified recursive self-improvement

**Μηχανισμοί:** MFA-MECH-022, MFA-MECH-039, MFA-MECH-025, MFA-MECH-044 · **Ικανότητες lattice:** MFA-CAP-083, MFA-CAP-103, MFA-CAP-108 · **Στοιχεία:** MFA-ELM-104, MFA-ELM-122, MFA-ELM-099, MFA-ELM-127, MFA-ELM-031

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-022 — Recursive Verified Self-Improvement (RVSI): ο βρόχος που βελτιώνει τα μοντέλα, τα προγράμματα, τα recipes και τον ίδιο τον βελτιωτή — κάτω από σταθερό σημείο επαλήθευσης: Η αυτο-βελτίωση είναι ασφαλής και μη-φαύλη **ακριβώς όταν** υπάρχει σημείο που δεν βελτιώνεται από τον εαυτό της: η επαλήθευση (MFA-MECH-025, L3) και το Telos (L3). Κάτω από αυτό το σταθερό σημείο, **κάθε** επίπεδο μπορεί να βελτιώνει το από κάτω του και τον εαυτό του, αρκεί κάθε βήμα να περνά την ίδια πύλη (HELD_OUT + EIM + LPA) και η ικανότητα να **μετριέται** πριν αναγνωριστεί (MFA-INV-077). Η ανάπτυξη είναι ratchet (MFA-INV-001) πάνω σε **μαθημένη** ικανότητα. ‖ MFA-MECH-039 — Obligation Calculus (OC) — τύποι υποχρέωσης για κάθε γνωσιακό βήμα (proof-carrying cognition): Κάθε έκφραση e του γνωσιακού βρόχου έχει κρίση Γ ⊢ e : τ ! O — τύπο τ και ΕΚΚΡΕΜΕΙΣ ΥΠΟΧΡΕΩΣΕΙΣ O (πολυσύνολο Ob⟨claim, tier, evidence_class, deadline, method⟩)· τιμή τύπου Verified[τ] κατασκευάζεται ΜΟΝΟ με discharge· οι υποχρεώσεις είναι γραμμικοί πόροι: κάθε μία καταλήγει σε DISCHARGED(cert) ∣ DEFERRED(reason, plan, deadline) ∣ ESCALATED(to) — ποτέ dropped· θεώρημα ορθότητας: αν ⊢ p : τ ! ∅ τότε κάθε ισχυρισμός στο p φέρει τεκμήριο της απαιτούμενης κλάσης (ή ρητή αναβολή)· ο έλεγχος είναι αμφίδρομος και το κόστος discharge δρομολογείται ανά tier. ‖ MFA-MECH-025 — Verification Fixed-Point Contract (VFC): το σταθερό σημείο της επαλήθευσης ως ΣΥΜΒΟΛΑΙΟ, όχι ως παγωμένο toolchain: Ό,τι δεν πρέπει να βελτιώνεται από τον εαυτό του είναι το **συμβόλαιο** της επαλήθευσης (τι είναι απόδειξη, ποιος την ελέγχει, πόσο μικρός είναι ο trusted core, πώς αντικαθίσταται ένας ελεγκτής) — όχι ένα συγκεκριμένο πρόγραμμα. Οι ελεγκτές είναι **υλοποιήσεις** του συμβολαίου: πολλαπλοί, ανεξάρτητοι (EIM), αντικαταστάσιμοι μόνο με **αναπαραγωγή του σφραγισμένου corpus** με ταυτόσημες ετυμηγορίες. Το συμβόλαιο είναι L3 (μόνο δημιουργός)· οι υλοποιήσεις είναι όργανα υπό ειδική ORP (χωρίς canary σε παραγωγή πριν από corpus replay). ‖ MFA-MECH-044 — Ω-Loop — ο ενιαίος κύκλος κυρίαρχης νόησης (η μέγιστη σύνθεση): Δέκα φάσεις ανά κύκλο: PERCEIVE (ledger cut, OGE έννοιες) → MODEL (LWM, CDCE) → WONDER (Void, AHE) → ACT/EXPERIMENT (AIDC EFE, RET) → VERIFY (OC υποχρεώσεις, TGPS, VFC) → LEARN (SMF/PRR/CPCL/TGL) → REFLECT (MSM, ASRW, CHH δείκτες) → EVOLVE (RVSI, RAGen, ECE, GG) → MEASURE (CGM, STP SI) → SUCCEED (VSC, SMP)· κάθε φάση έχει contract εισόδου/εξόδου, υποχρεώσεις (OC) που πρέπει να είναι DISCHARGED/DEFERRED πριν την επόμενη, προϋπολογισμό (OAP), και διακοπές (Emergency-stop, Court, δημιουργός) που προηγούνται· ο κύκλος είναι L2 (η σειρά/προϋπολογισμοί βελτιώνονται από RVSI) ενώ τα contracts των φάσεων και το FP είναι L3· ο κύκλος τρέχει υπό LPA και AUT-00. |
| 2. Ροή δεδομένων/ελέγχου | Είσοδοι/έξοδοι: Είσοδος: τρέχουσα αρχιτεκτονική/μοντέλα/recipes, sealed sets, budgets (OAP), MetaBounds· Έξοδος: προαγωγές (ORP/GCP), Capability Growth Ledger, νέα προτεινόμενα sealed tasks (curriculum) ‖ Διεπαφές: `RVSI.propose(level)→[ImprovementProposal]` · `RVSI.cycle(budget)→MetaCycle` · `RVSI.growth(cut)→[CapabilityGrowthRecord]` · `RVSI.plateau(level)→bool` · MFA-CON-049 ‖ Αλληλεπιδράσεις: GCP (L2 αρχιτεκτονικές), ORP (L1), CQ (HELD_OUT), CAM-NS (αντίπαλος), OAP (budgets), Cockpit (η ανάπτυξη ορατή ως καμπύλη ανά ικανότητα), Safe-Halt (Emergency-stop παύει τον βρόχο — μηχανισμός, όχι πολιτική) ‖ Διεπαφές: OC.infer(program)→(type, obligations) · OC.check(program)→OK ∣ error · OC.discharge(ob, cert)→Receipt · OC.defer(ob, reason, plan)→Receipt · OC.ledger(cut)→O_t · OC.schedule(budgets)→Report ‖ Ροή: MFA-ELM-122 (νέο στοιχείο OC, S0/S3) · MFA-ELM-017 TED (εκτέλεση μόνο type-checked) · MFA-ELM-103 PRR (process rewards) · MFA-ELM-123 TGL · MFA-ELM-104 RVSI (κάθε πρόταση με υποχρεώσεις) · MFA-ELM-127 Ω-loop (φάση VERIFY) ‖ Είσοδοι/έξοδοι: Είσοδος: proof objects από verifiers (MFA-ELM-020), Court, RVSI· Έξοδος: Tier-0 verdicts με receipts, corpus replay receipts, trusted core measurements ‖ Διεπαφές: `VFC.verify(proof)→Verdict[]` (ομοφωνία) · `VFC.candidate(checker)→ReplayReceipt` · `VFC.admit(checker, L3_signature)` · `VFC.retire(checker)` · `VFC.corpus(cut)→SealedProofCorpus` · `VFC.core_measure(checker)→TrustedCoreReport` · MFA-CON-052 ‖ Αλληλεπιδράσεις: Verification Suite (Tier-1/2 verifiers kernel_checked από ACTIVE checkers), RVSI (το σταθερό σημείο του· μπορεί να **προτείνει** checkers), PRR (η ανταμοιβή Tier-0 έρχεται από εδώ), Court (Tier-0 ετυμηγορίες), CQ (HELD_OUT κρατά corpus), GCP (format changes), Cockpit (οι checkers και το corpus ορατά ως το «θεμέλιο») ‖ Διεπαφές: Omega.cycle()→CycleRecord · Omega.schedule()→Schedule (L2) · Omega.phase(i)→Phase spec (L3 contracts) · Omega.interrupt(kind)→ack · Omega.budgets()→b · Omega.open_obligations()→O_open ‖ Ροή: MFA-ELM-127 (νέο στοιχείο Ω-Loop scheduler, S2/S7) · κάθε στοιχείο μηχανισμού ως φάση · MFA-ELM-097 lean profile (copilot path εκτός κύκλου) · MFA-ELM-091 cockpit (κύκλος ορατός) |
| 3. Μεταβάσεις κατάστασης | Οντολογία: `Level ∈ {L0: έξοδοι (PRR), L1: μοντέλα/προγράμματα/όργανα (SMF, Skill Library, Evolution), L2: βελτιωτές (recipes, data selection, curriculum, evaluators υπό EIM, αρχιτεκτονική γνωσιακού πυρήνα μέσω Architecture Forge + GCP), L3: ποτέ (Telos, VFC, gate, kernel contract)}` · `ImprovementProposal⟨level, target_cid, change (patch/recipe/architecture), predicted_gain (SPL), budget, falsifier⟩` · `CapabilityGrowthRecord⟨capability, measure (sealed), compute_spent, data_spent, wall_clock, delta, CI⟩` · `MetaCycle⟨proposals[], evaluations[], promotions[], growth[], plateau_flag⟩` · `RateBound (MetaBound POLICY: max promotions/window, max KL, max budget)` ‖ Κατάσταση: Per cycle: PROPOSE (από L1/L2 γεννήτριες: Evolution QD, Architecture Forge, Science Organ, PDE) → PREDICT (SPL προβλέπει κέρδος — δέσμευση) → EVALUATE (HELD_OUT sealed, EIM, forgetting guard) → GATE (LPA advisory→effective) → PROMOTE (ORP για L1· GCP replay για L2 αρχιτεκτονικές) → MEASURE (CapabilityGrowthRecord) → LEDGER. Plateau detection → escalate level. Κάθε cycle = InstitutionalAct με receipts. ‖ Μεταβλητές: Context Γ · Obligation ledger O_t (γραμμικό) · Certificates · Deferred with deadlines · Escalations ‖ Μεταβάσεις: GEN: γεννήτρια παράγει Claimed[τ] με υποχρεώσεις κατά tier του claim (Tier από LPA/Constitution) · DISCHARGE: cert από method ⇒ Verified · DEFER: reason ∈ {BUDGET, NOT_YET_OBSERVABLE, AWAITING_CREATOR} με plan+deadline · ESCALATE: deadline πέρασε ⇒ Court/δημιουργός · ACT: Effect plane δέχεται μόνο τιμές Verified[τ] ή Claimed με DEFER εγκεκριμένο για την κλάση επίδρασης (RET) · NEVER_DROP: type checker απορρίπτει προγράμματα με weakening σε O ‖ Οντολογία: `VerificationContract⟨proof_object_format (versioned, hash-addressed), tier_semantics (0/1/2), trusted_core_bound (LoC/axioms δηλωμένο και μετρούμενο), min_independent_checkers ≥ 2, independence_threshold (EIM), sealed_corpus_cid, replacement_protocol, version (L3)⟩` · `Checker⟨impl_id, toolchain (Lean kernel ∣ TLA+/Apalache ∣ CL reference ∣ Rust checker ∣ extracted-verified checker ∣ …), supply_chain_root, trusted_core_measured, corpus_replay_receipt, status ∈ {CANDIDATE, ADMITTED, ACTIVE, RETIRED}⟩` · `SealedProofCorpus⟨proof_objects[] με αναμενόμενες ετυμηγορίες (θετικές ΚΑΙ αρνητικές: άκυρες αποδείξεις που πρέπει να απορριφθούν), monotone⟩` · `Verdict⟨checker_id, proof_cid, result ∈ {ACCEPT, REJECT, UNKNOWN}, receipt⟩` ‖ Κατάσταση: Contract: FROZEN (L3)· Checker: CANDIDATE → REPLAY (σφραγισμένο corpus, ταυτόσημες ετυμηγορίες σε 100 % θετικών και αρνητικών) → EIM (ανεξαρτησία από τους ενεργούς) → ADMITTED (L3 πράξη δημιουργού) → ACTIVE (N-version με τους άλλους) → RETIRED (ποτέ κάτω από min_independent_checkers). Tier-0 ετυμηγορία = **ομοφωνία** των ACTIVE checkers· διαφωνία ⇒ UNKNOWN ⇒ deny + δημιουργός (ποτέ πλειοψηφία — MFA-INV-023 πνεύμα). ‖ Μεταβλητές: i (φάση) · O_open · budgets · interrupt queue · CycleRecord · Schedule version (L2) ‖ Μεταβάσεις: NEXT: φ_i → φ_{i+1} μόνο αν out_contract(φ_i) ⊨ ∧ O_i ⊆ {DISCHARGED, DEFERRED, ESCALATED} · INTERRUPT: υψηλότερης προτεραιότητας διακοπή προηγείται σε κάθε βήμα · BUDGET: b_i εξαντλείται ⇒ φάση κλείνει με DEFER (ποτέ σιωπηλή παράλειψη) · SCHEDULE_UPDATE: RVSI L2 προτείνει νέα διάταξη/προϋπολογισμούς· CGM πύλη· contracts αμετάβλητα · SUCCEED: μόνο με VSC Proceeding· αλλιώς φάση no-op με receipt |
| 4. Contracts | MFA-CON-003 (CC — επέκταση τύπων), MFA-CON-034 (RET), MFA-CON-037 (LPA), MFA-CON-049, MFA-CON-049 (RVSI), MFA-CON-052, MFA-CON-052 (VFC certs), MFA-CON-057 (TGPS), MFA-CON-068 (Ω-Loop: cycle/schedule/phase/interrupt/budgets), MFA-CON-071 (OC), MFA-CON-071 (Obligation Calculus: infer/check/discharge/defer/ledger) |
| 5. Invariants | MFA-INV-049; MFA-INV-053; MFA-INV-072; MFA-INV-077; MFA-INV-104: καμία υποχρέωση δεν απορρίπτεται (γραμμικότητα)· κάθε μία DISCHARGED ∣ DEFERRED(reason, plan, deadline) ∣ ESCALATED — ο type checker απορρίπτει weakening; MFA-INV-105: το Effect plane δέχεται μόνο Verified τιμές ή DEFER εγκεκριμένο από RET για την κλάση επίδρασης (επέκταση NoActWithoutAnswer); MFA-INV-114: καμία φάση δεν παραλείπεται σιωπηλά· κάθε φάση αφήνει receipt (DONE/DEFERRED/SKIPPED με λόγο) και οι ανοιχτές υποχρεώσεις μεταφέρονται ρητά; MFA-INV-115: οι διακοπές (Emergency-stop, Court, δημιουργός) προηγούνται κάθε φάσης· τα contracts φάσεων και το FP είναι L3 — μόνο η διάταξη/προϋπολογισμοί είναι L2 |
| 6. Αλγόριθμοι | MFA-MECH-022 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13); OC-TypeCheck (αμφίδρομος); DischargeScheduler; MFA-MECH-025 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13); Ω-Cycle — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | Πόροι: Ένας L1 cycle = κόστος SMF recipe + eval· L2 cycle = πολλαπλάσιο (QD στα recipes)· DEP-2: εβδομαδιαίοι L1, μηνιαίοι L2· DEP-3: ημερήσιοι L1· DEP-4: συνεχείς L1, εβδομαδιαίοι L2· ενέργεια στο OAP envelope ‖ Κλιμάκωση: Ο βρόχος κλιμακώνει με compute και δεδομένα (MFA-ELM-108)· η επαλήθευση κλιμακώνει με verifier throughput — το μοναδικό δομικό φράγμα ‖ OC-TypeCheck (αμφίδρομος): Γραμμικός στο μέγεθος του προγράμματος/ίχνους O(∣e∣)· discharge = κόστος method ‖ DischargeScheduler: O(∣O∣ log ∣O∣) priority queue· κόστος ανά method ‖ πόροι: Type checking γραμμικό (ms)· discharge = κόστος verifiers/TGPS/tests· DEP-1: Tier-0 PROOF μόνο για CC κανόνες· DEP-2+: PROOF ευρύτερα ‖ κλιμάκωση: Κόστος ~ ∣O∣·mean(cost(method))· η βιβλιοθήκη TGPS μειώνει το PROOF κόστος· η CGM οικογένεια «obligation discharge rate» = MFA-VO-082. ‖ Πόροι: Checkers: CPU-only· corpus replay: O(∣corpus∣) ανά υποψήφιο (ώρες)· N ACTIVE checkers ανά Tier-0 αίτημα (DEP-1: 2, DEP-3+: 3–4) ‖ Κλιμάκωση: Το corpus μεγαλώνει με τις αποδείξεις· το replay είναι παραλληλοποιήσιμο· η ομοφωνία δεν κλιμακώνει κακώς (N μικρό) ‖ Ω-Cycle: Άθροισμα φάσεων· κάθε φάση φραγμένη από b_i· ανά κύκλο O(Σ cost_i)· διακοπές O(1) έλεγχος ανά βήμα ‖ πόροι: DEP-1: κύκλος ημέρας με mocks/lite μηχανισμούς· DEP-2: κύκλος ωρών· DEP-3+: συνεχείς παράλληλοι κύκλοι ‖ κλιμάκωση: Ικανότητα ανά κύκλο ανά Wh (CGM) = ο δείκτης· αναμένεται βελτίωση της διάταξης από RVSI· MFA-VO-087. |
| 8. Τρόποι αποτυχίας | Runaway (προαγωγές χωρίς μέτρηση) → αδύνατο εξ ορισμού (MFA-INV-072: καμία προαγωγή χωρίς HELD_OUT+EIM+gate)· evaluator collusion → EIM ανά ζεύγος + HELD_OUT rotation· plateau → escalation, καταγραφή· overfitting στα sealed sets → sealed sets ανανεώνονται από HELD_OUT (contamination guard)· ψευδής πρόβλεψη κέρδους → SPL drift alarm; αντιπαλικοί: Πρόταση L2 που «βελτιώνει» τον evaluator προς όφελος του αξιολογούμενου: EIM data/behaviour independence + seeded faults· Level confusion (L2 πρόταση που αγγίζει L3): CPEG στο ID-set των επιπέδων + L3 πράξη μόνο δημιουργός· CAM-NS επιτίθεται σε κάθε προαγωγή πριν από cutover; Έκρηξη υποχρεώσεων (κάθε token ένα claim) → ανίχνευση: ∣O∣ > RateBound → απόκριση: granularity policy: claims ανά πρόταση/δέσμευση, όχι ανά token· batching; Deferred που δεν λήγουν ποτέ → ανίχνευση: deadline → απόκριση: ESCALATE (MFA-INV-104); Cert από checker ίδιας γενεαλογίας με γεννήτρια → ανίχνευση: EIM → απόκριση: cert άκυρο; Type checker bug → ανίχνευση: Lean soundness + 2 checkers (VFC) → απόκριση: FP incident; Πρόγραμμα παρακάμπτει τον checker → ανίχνευση: TED: εκτέλεση μόνο type-checked IR → απόκριση: αδύνατο εξ ορισμού; περιορισμός: Checker στο FP· Effect plane δέχεται μόνο Verified/approved-DEFER· Court escalation.; Bug κοινό σε όλους τους checkers → EIM supply independence + αρνητικό corpus (mutation)· corpus ελλιπές → μονότονο ADD, ποτέ αφαίρεση· διαφωνία checkers → UNKNOWN (ποτέ pass), δημιουργός· trusted core creep → bound; αντιπαλικοί: RVSI που προτείνει «καλύτερο» checker με κρυφό backdoor → αρνητικό corpus + seeded faults + EIM behaviour· επίθεση στο corpus (αφαίρεση αρνητικών) → μονότονο, HELD_OUT, Merkle· επίθεση στο συμβόλαιο → L3 μόνο δημιουργός; Starvation φάσης (π.χ. REFLECT ποτέ) → ανίχνευση: CycleRecord → απόκριση: ελάχιστος προϋπολογισμός ανά φάση (πολιτική); Deadlock υποχρεώσεων (VERIFY δεν κλείνει) → ανίχνευση: O_open ↑ ανά κύκλο → απόκριση: DEFER με deadline → ESCALATE; Schedule «βελτιστοποιεί» παρακάμπτοντας VERIFY → ανίχνευση: contracts L3 → απόκριση: αδύνατο· πρόταση απορρίπτεται; Διακοπή αγνοείται → ανίχνευση: MFA-INV-115 checker → απόκριση: FP incident; Κύκλος πολύ αργός για Effect ανάγκες → ανίχνευση: latency → απόκριση: Effect plane εξυπηρετείται από Think–Recommend εκτός κύκλου (copilot path) με receipts; περιορισμός: LPA/AUT-00· RET· διακοπές· L3 contracts. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-061 (πλήρης meta-cycle drill: L1+L2, seeded L3 απόπειρα απορρίπτεται, κέρδος μετρημένο), MFA-VO-067 (Capability Growth Law: ικανότητα/compute με CI, ratchet), MFA-VO-024 (ablation: χωρίς RVSI η ικανότητα μένει στάσιμη), MFA-VO-029 (GCP για L2), MFA-VO-035 (EIM) ‖ ελάχιστο πείραμα: RVSI-E1: 5 meta-cycles σε σφραγισμένη οικογένεια· μέτρο: μονότονη αύξηση VERIFIED-rate ανά compute με CI· επιτυχία: ≥ 2 διαδοχικά cycles με διακριτικό κέρδος, 0 προαγωγές χωρίς πύλη, seeded L3 απόπειρα 0/0· θανάτωση: 0 κέρδος σε 5 cycles ⇒ MFA-UNK-113 + escalation, όχι αφαίρεση ‖ MFA-VO-082: OC-E1 (κωδικοποίηση 8 κανόνων CC + Think–Recommend ροή· απόρριψη ροών με dropped υποχρεώσεις) F1/F2· OC-E2 (Lean μηχανοποίηση ορθότητας πυρήνα) F1· property: check ⇒ no live obligations (tools/twin) ‖ πειράματα: OC-E1: 25/25 λανθασμένες απορρίπτονται με σωστό λόγο· 25/25 σωστές περνούν· 0 ψευδώς θετικά/αρνητικά · OC-E2: Θεώρημα ελέγχεται από 2 checkers· μόνο standard axioms ‖ MFA-VO-066 (kernel replacement drill: υποψήφιος checker περνά replay θετικών+αρνητικών, EIM, core bound· seeded backdoor checker απορρίπτεται), MFA-VO-053 (#print axioms — τώρα ιδιότητα υλοποίησης Lean, όχι του συμβολαίου), MFA-VO-054 (TLA+ bindings — ομοίως), MFA-VO-035 (EIM) ‖ ελάχιστο πείραμα: VFC-E1: 3 checkers, corpus 1000 (500 αρνητικά με mutation)· seeded backdoor checker (δέχεται μία κλάση άκυρων) → πρέπει να απορριφθεί στο replay· επιτυχία: 0 backdoors δεκτά, ομοφωνία σε 100 % του corpus· θανάτωση: backdoor δεκτό ⇒ το αρνητικό corpus είναι ανεπαρκές — ενισχύεται (ADD), το συμβόλαιο μένει ‖ MFA-VO-087: Ω-E1 (πλήρης κύκλος σε DST με mocks, όλες οι υποχρεώσεις κλείνουν ή DEFER με λόγο) F1/F2· Ω-E2 (ablation κάθε φάσης υποβαθμίζει ονομασμένο KT) F2· property: NEXT ⇒ out_contract ∧ obligations closed (tools/twin) ‖ πειράματα: Ω-E1: 10/10 κύκλοι με πλήρη CycleRecord· 0 σιωπηλές παραλείψεις· διακοπές προηγούνται 100 % · Ω-E2: κάθε ablation αποτυγχάνει το δικό της KT και μόνο (ablation_kt ανά φάση) |
| 10. Διαδρομή υλοποίησης | F2: RVSI σε DST με συμβολικά έργα (L1 = program synthesis, L2 = recipe QD)· F3: L1 με SMF adapters· F4: L2 αρχιτεκτονική (workspace params) με GCP replay ‖ → παραγωγή: Δόση 3 (L1 πλήρες, L2 recipes), Δόση 4 (L2 αρχιτεκτονική, GCP), Δόση 5 (συνεχής λειτουργία σε DEP-4) ‖ εξέλιξη: Ο RVSI βελτιώνει τον εαυτό του σε L2 (recipes του βρόχου) — ποτέ την πύλη, το VFC ή το Telos (L3) ‖ Δόση 0.5: OC-lite (Claimed/Verified, WITNESS/CHECK) στον copilot· Δόση 1: πλήρες με DEFER/ESCALATE + OC-E1· Δόση 2: Lean OC-E2 + PROOF method μέσω TGPS· FP από τη Δόση 1. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή του type checker (tools/twin/oc.py) + OC-E1 test set → F2: Lean μηχανοποίηση OC-E2 → F3: ενσωμάτωση σε TED IR σε DEP-1 → F4: παραγωγή Δόση 1 ‖ F1: συμβόλαιο + 2 checkers (Lean kernel, CL reference) + corpus 100 proof objects (50 αρνητικά)· F2: + TLA+/Apalache· F3: + Rust checker· F4: + extracted-verified checker από RVSI (ο πρώτος «δικός του» ελεγκτής) ‖ → παραγωγή: Δόση 0.5 (συμβόλαιο + 2 checkers + corpus γένεσης), Δόση 1 (3 checkers), Δόση 4 (checker από RVSI) ‖ εξέλιξη: Νέος checker = ADD υπό replay+EIM+L3· νέο proof format = L3 + corpus replay· το συμβόλαιο = μόνο δημιουργός ‖ Δόση 0.5: Ω-E1 σε tools/twin με mocks· Δόση 1: κύκλος ημέρας με lite μηχανισμούς (PERCEIVE/VERIFY/LEARN-lite/MEASURE)· Δόση 2–4: φάσεις γεμίζουν καθώς οι μηχανισμοί φτάνουν τις δόσεις τους. ‖ ακολουθία: F1: tools/twin Ω-cycle με mocks (Ω-E1) → F2: DST Ω-E2 → F3: DEP-2 κύκλος ωρών → F4: παραγωγή Δόση 1+ |
| 11. Falsifier | Αν ο βρόχος δεν παράγει μετρήσιμο κέρδος σε κανένα επίπεδο με πλήρες budget DEP-3, ή αν κάθε κέρδος εξαφανίζεται στο επόμενο sealed refresh (overfitting), ο RVSI όπως ορίζεται είναι ανεπαρκής: καταγράφεται ως επιστημική αβεβαιότητα (MFA-UNK-113) με τα δεδομένα, και ο βρόχος αλλάζει βελτιωτές (L2) — η ASI παραμένει στόχος, ο μηχανισμός αναθεωρείται με patch; OC-E1: ψευδώς αρνητικά (ροή με dropped υποχρέωση περνά) — ο φορμαλισμός ελλιπής, αναθεωρείται (η ικανότητα proof-carrying cognition μένει); Granularity policy που κάνει το κόστος ελέγχου > 10 % του κόστους σκέψης σε DEP-2 (τότε νέα granularity, όχι κατάργηση); Αν δύο ανεξάρτητοι (EIM PASS) checkers συμφωνούν σε άκυρη απόδειξη που το αρνητικό corpus δεν κάλυπτε, το VFC απέτυχε στη συγκεκριμένη κλάση — καταγράφεται ως ελάττωμα corpus (ADD αρνητικών) και ως MFA-UNK (νέα κλάση)· ο μηχανισμός ενισχύεται, δεν αφαιρείται; Ω-E2: φάση της οποίας η ablation δεν αλλάζει κανένα KT (η φάση είναι διακοσμητική — συγχωνεύεται η ΔΙΑΤΑΞΗ, όχι η ικανότητα); Schedule L2 που δεν βελτιώνει ικανότητα/Wh έναντι σταθερής διάταξης σε 2 δόσεις (η μάθηση διάταξης διαψεύδεται) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — MFA-MECH-022 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: Ένας L1 cycle = κόστος SMF recipe + eval· L2 cycle = πολλαπλάσιο (QD στα recipes)· DEP-2: εβδομαδιαίοι L1, μηνιαίοι L2· DEP-3: ημερήσιοι L1· DEP-4: συνεχείς L1, εβδομαδιαίοι L2· ενέργεια στο OAP envelope)

```
(1) **L0** τρέχει συνεχώς (PRR). (2) **L1**: SMF recipes (νυχτερινά), Skill Library program synthesis από επεισόδια (library learning: αφαίρεση κοινών υπο-προγραμμάτων, DreamCoder-class), Evolution QD αρχείο οργάνων· κάθε υποψήφιος → EVALUATE → ORP. (3) **L2**: αναζήτηση στον χώρο των **βελτιωτών**: recipes (hyperparams, data filters, curriculum policies) ως QD αρχείο αξιολογούμενο από τον HELD_OUT στο ίδιο sealed πλαίσιο· evaluators βελτιώνονται ΜΟΝΟ υπό EIM (ανεξαρτησία από τους αξιολογούμενους, ποτέ ο ίδιος πληθυσμός)· αρχιτεκτονική γνωσιακού πυρήνα (workspace, attention schema, world model, memory types): προτάσεις από Architecture Forge (MFA-ELM-077) → shadow ως διάδοχος (GCP replay για συνέχεια, MFA-INV-049 verdict εξωτερικός). (4) **Πρόβλεψη πριν από δοκιμή**: κάθε πρόταση φέρει προβλεπόμενο κέρδος από SPL· η ακρίβεια της πρόβλεψης είναι η ίδια μετρούμενη ικανότητα (μεταγνώση της βελτίωσης). (5) **Μέτρηση**: Capability Growth Law — ικανότητα ανά compute/δεδομένα/χρόνο με διαστήματα εμπιστοσύνης· κανένα «κέρδος» χωρίς σφραγισμένη μέτρηση (MFA-INV-077)· KT-15 ratchet ανά cycle. (6) **Plateau**: αν k διαδοχικά cycles χωρίς διακριτικό κέρδος σε ένα επίπεδο → ο βρόχος ανεβαίνει επίπεδο (L1 plateau ⇒ L2 προτάσεις)· L2 plateau ⇒ Architecture Forge + MFA-UNK-113 καταγραφή. (7) **Ρυθμός**: RateBounds ως MetaBound POLICY (λήγουν, MFA-INV-053) — ο μηχανισμός δεν έχει ταβάνι, η πολιτική έχει (Δ-12). (8) **Συνέχεια**: κάθε L2 αλλαγή που αγγίζει metamodel = GCP· Battery πριν/μετά (MFA-ELM-037).
```

**Αλγόριθμος — OC-TypeCheck (αμφίδρομος)** (πολυπλοκότητα: Γραμμικός στο μέγεθος του προγράμματος/ίχνους O(|e|)· discharge = κόστος method)

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

**Αλγόριθμος — DischargeScheduler** (πολυπλοκότητα: O(|O| log |O|) priority queue· κόστος ανά method)

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

**Αλγόριθμος — MFA-MECH-025 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: Checkers: CPU-only· corpus replay: O(|corpus|) ανά υποψήφιο (ώρες)· N ACTIVE checkers ανά Tier-0 αίτημα (DEP-1: 2, DEP-3+: 3–4))

```
(1) Κάθε Tier-0 αίτημα → όλοι οι ACTIVE checkers ανεξάρτητα → ομοφωνία ή UNKNOWN. (2) Υποψήφιος checker (ακόμη και εξαγόμενος από το ίδιο το σύστημα — RVSI L2 επιτρέπεται να **προτείνει** checker) → replay του σφραγισμένου corpus: 100 % ACCEPT στα θετικά, 100 % REJECT στα αρνητικά (seeded άκυρες αποδείξεις, mutation του corpus)· διαφορά ⇒ απόρριψη με locus. (3) EIM: supply chain, δεδομένα, συμπεριφορά (seeded faults) έναντι κάθε ACTIVE checker· κλώνος ⇒ FAIL. (4) Trusted core: μετράται (LoC/axioms/dependencies) και συγκρίνεται με το bound του συμβολαίου· υπέρβαση ⇒ απόρριψη. (5) Εισδοχή = L3 πράξη δημιουργού με receipt· ο παλιός checker παραμένει ACTIVE (ποτέ αντικατάσταση 1:1 — μόνο προσθήκη και μετά απόσυρση όταν ≥ min+1). (6) Το corpus μεγαλώνει μονότονα (κάθε νέο Tier-0 proof object προστίθεται με την ετυμηγορία του)· η **σημασιολογία** του corpus (τι σημαίνει ACCEPT) είναι μέρος του συμβολαίου, όχι του εργαλείου. (7) Αλλαγή συμβολαίου (π.χ. νέο proof format) = L3 + GCP-style replay ολόκληρου του corpus με το νέο format (MFA-MECH-003).
```

**Αλγόριθμος — Ω-Cycle** (πολυπλοκότητα: Άθροισμα φάσεων· κάθε φάση φραγμένη από b_i· ανά κύκλο O(Σ cost_i)· διακοπές O(1) έλεγχος ανά βήμα)

```
procedure Omega_Cycle(state, schedule, budgets):
  rec ← CycleRecord(cut=state.cut)
  for φ in schedule.phases:                                             # PERCEIVE, MODEL, WONDER, ACT, VERIFY, LEARN, REFLECT, EVOLVE, MEASURE, SUCCEED
    if intr ← interrupts.poll(): handle(intr) ; if intr.halts: return rec.close(HALTED, intr)     # Emergency-stop / Court / Creator first
    assert φ.in_contract(state) else rec.append(φ, SKIPPED_PRECONDITION, evidence) ; continue
    out ← run_phase(φ, state, budget=budgets[φ])                         # mechanisms of the phase; Genesis-first; RET for Effect
    O_open ← OC.ledger(state).live()
    if O_open ≠ ∅: OC.schedule(O_open, budgets.verify) ; O_open ← OC.ledger(state).live()
    if O_open ≠ ∅: rec.append(φ, DEFERRED_OBLIGATIONS, O_open) ; OC.defer_all(O_open, reason=BUDGET, plan=next_cycle)   # never dropped (MFA-INV-104)
    assert φ.out_contract(out) else rec.append(φ, CONTRACT_FAIL) ; Court.notify(φ) ; break
    state ← out ; rec.append(φ, DONE, receipts(out))
  CGM.record(cycle=rec) ; CC.assert(rec)
  return rec
procedure run_phase(φ, state, budget):
  match φ.name:
    PERCEIVE: return OGE.observe_all(state.cut) ▹ ledger_cut
    MODEL:    return parallel(LWM.update, CDCE.discover)(state)
    WONDER:   return AHE.loop(Void.entries(state), budget)
    ACT:      return AIDC.step(state, envelope)                          # experiments/actions under RET
    VERIFY:   return OC.schedule(state, budget) ▹ TGPS ▹ VFC
    LEARN:    return parallel(SMF/PRR.batch, CPCL.sleep_if_due, TGL.batch)(state)
    REFLECT:  return parallel(MSM.cycle, ASRW.cycle, CHH.cycle)(state)
    EVOLVE:   return RVSI.cycle(proposals=RAGen.cycle() ∪ ECE.epoch() ∪ GG.pending())
    MEASURE:  return parallel(CGM.measure_all, STP.step)(state)
    SUCCEED:  return VSC.consider(RAGen.frontier()) or noop_receipt()
```

### 2.12 Μέτρηση ανάπτυξης ικανότητας — Capability-growth measurement

**Μηχανισμοί:** MFA-MECH-036 · **Ικανότητες lattice:** MFA-CAP-100 · **Στοιχεία:** MFA-ELM-119, MFA-ELM-086

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-036 — Capability Growth Metrology (CGM) & Capability Growth Law — η ανάπτυξη ικανότητας ως μετρήσιμη, σφραγισμένη, ανά πόρο: Capability Growth Law (φορμαλισμός): για οικογένεια f, η λανθάνουσα ικανότητα θ_f(t) εκτιμάται με IRT (2PL) πάνω σε σφραγισμένη τράπεζα έργων I_f με παραμέτρους (δυσκολία b_i, διάκριση a_i) βαθμονομημένες από HELD_OUT· η «νομοτέλεια» είναι το προσαρμοσμένο μονότονο μοντέλο θ_f(R) πάνω σε πόρους R = (compute, data, time, Wh) με CI· το ratchet εφαρμόζεται στο ΚΑΤΩ όριο CI· κάθε έργο i με hash στο DataManifest οποιουδήποτε βάρους είναι ΑΚΥΡΟ (μόλυνση διά provenance, όχι εικασία)· η τράπεζα εξελίσσεται από curriculum/ECE έργα με απαντήσεις σε escrow στον HELD_OUT· item exposure control· plateau = ACTIVE UNKNOWN με σχέδιο. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: CGM.measure(family, system, cut)→CapabilityGrowthRecord ∣ RATCHET_FAIL · CGM.bank(family)→ItemBank (χωρίς απαντήσεις) · CGM.calibrate(items)→(a, b) · CGM.law(family)→GrowthLaw with CI · CGM.contamination(item, cut)→bool+evidence · CGM.record(*)→δέσμευση ‖ Ροή: MFA-ELM-119 (νέο στοιχείο CGM, S7) · MFA-ELM-104 RVSI (πύλη) · MFA-ELM-116 STP (parity) · MFA-ELM-118 CPCL (sealed ανά οικογένεια) · MFA-ELM-113 RAGen (fitness) · MFA-ELM-091 cockpit |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: I_{f,t} · θ̂_{f,t}, CI · R_t · GrowthLaw fits · Exposure counters · Plateau flags ‖ Μεταβάσεις: CALIBRATE: νέα έργα → a_i, b_i από HELD_OUT πληθυσμό αναφοράς (προηγούμενες εκδόσεις, πάροχοι, άνθρωποι όπου διαθέσιμο) · MEASURE: adaptive test (max Fisher info) → θ̂, SE · RECORD: CapabilityGrowthRecord ASSERT · RATCHET: lower_CI < θ_certified ⇒ FAIL (προαγωγή μπλοκάρεται) · RETIRE_ITEM: exposure > E_max ∨ contaminated ⇒ item RETIRED (μένει, δεν μετρά) · PLATEAU: Δθ̂ ≈ 0 σε 2 δόσεις ⇒ MFA-UNK entry + escalation · FIT: GrowthLaw ανά δόση |
| 4. Contracts | MFA-CON-050 (curriculum ως πηγή έργων), MFA-CON-053 (compute/data inventory ως R), MFA-CON-064 (Growth Metrology: measure/bank/calibrate/law/contamination) |
| 5. Invariants | MFA-INV-098: κανένα έργο μέτρησης με hash σε DataManifest οποιουδήποτε μετρούμενου βάρους — η μόλυνση αποδεικνύεται διά provenance, όχι εικάζεται; MFA-INV-099: το ratchet εφαρμόζεται στο κάτω όριο CI· ισχυρισμός κέρδους χωρίς CapabilityGrowthRecord = FAIL (επέκταση MFA-INV-077) |
| 6. Αλγόριθμοι | CGM-Measure (adaptive); CGM-Fit (Growth Law) & plateau — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | CGM-Measure (adaptive): O(n_items · ∣I_f∣) επιλογή· n_items ≈ 30–60 για SE ≤ 0.2· ανά οικογένεια/cut ‖ CGM-Fit (Growth Law) & plateau: O(#records) regression· isotonic O(n log n) ‖ πόροι: Μέτρηση: n_items λύσεις ανά οικογένεια/cut (λεπτά–ώρες)· τράπεζα 10³ έργα/οικογένεια· HELD_OUT phone-class επαρκεί για scoring/escrow ‖ κλιμάκωση: Η ίδια η CGM: SE ~ 1/√n_items· η μετρούμενη θ_f(R) είναι το αντικείμενο· αναμένεται log-γραμμική (scaling laws) με κορεσμό ανά οικογένεια — MFA-VO-078. |
| 8. Τρόποι αποτυχίας | Item drift (έργο «γερνάει») → ανίχνευση: DIF ανάλυση → απόκριση: επαναβαθμονόμηση ή RETIRE; Τράπεζα εξαντλείται (exposure) → ανίχνευση: διαθέσιμα < n_max → απόκριση: curriculum παράγει νέα· μέτρηση με ευρύτερο CI, δηλωμένο; Μόλυνση μέσω παραφράσεων → ανίχνευση: near-duplicate hash (MinHash) + canaries → απόκριση: item invalid· δηλωμένο κενό ανίχνευσης (ACTIVE UNKNOWN); Ceiling effect → ανίχνευση: θ̂ > max b_i → απόκριση: δυσκολότερα έργα από ECE· CI διευρύνεται; Πόροι μη-μετρήσιμοι (burst) → ανίχνευση: R ελλιπές → απόκριση: record με R=UNKNOWN(reason)· law δεν προσαρμόζεται; περιορισμός: Harness στο σταθερό σημείο· HELD_OUT συσκευή· escrow απαντήσεων· κανένα Effect. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-078: CGM-E1 (συνθετικοί πράκτορες γνωστής ικανότητας — ανάκτηση διάταξης) F2· CGM-E2 (μόλυνση εισάγεται — ανίχνευση) F2· property: measure ⇒ contamination check ∧ HELD_OUT scorer (F1)· IRT fit diagnostics ‖ πειράματα: CGM-E1: Spearman ≥ 0.95· 95 % CI καλύπτει τη γνωστή θ σε ≥ 93 % των περιπτώσεων · CGM-E2: 100 % ακριβή hashes ανιχνεύονται· παραφράσεις ≥ 80 % (το υπόλοιπο δηλώνεται ως ACTIVE UNKNOWN με CI διεύρυνση) |
| 10. Διαδρομή υλοποίησης | Δόση 0.5: τράπεζα αρχική (KT + 200 έργα) + HELD_OUT escrow· Δόση 1: adaptive IRT + records· Δόση 2: law fit + CGM-E1/E2· συνεχής. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή IRT/ratchet/contamination (tools/twin) → F2: CGM-E1/E2 σε DEP-1 → F3: πραγματική τράπεζα νομικών έργων → F4: παραγωγή Δόση 1 |
| 11. Falsifier | CGM-E1: αδυναμία ανάκτησης διάταξης (ο IRT φορμαλισμός δεν ταιριάζει στα έργα — νέος φορμαλισμός, η μέτρηση μένει υποχρεωτική); Ratchet παραβίαση χωρίς FAIL (σφάλμα υλοποίησης) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — CGM-Measure (adaptive)** (πολυπλοκότητα: O(n_items · |I_f|) επιλογή· n_items ≈ 30–60 για SE ≤ 0.2· ανά οικογένεια/cut)

```
procedure CGM_Measure(f, system, cut):
  I ← {i ∈ I_f : not contaminated(i, cut) ∧ exposure(i) < E_max}          # provenance contamination check (MFA-INV-098)
  θ ← prior_mean ; used ← []
  while SE(θ, used) > SE_target and |used| < n_max:
    i* ← argmax_{i ∈ I \ used} a_i² P(θ,i)(1−P(θ,i))                      # max Fisher information
    y ← HELD_OUT.score(system.solve(i*), escrow_answer(i*))                 # scorer never the system
    used.append((i*, y)) ; exposure(i*) += 1
    θ ← MLE_or_EAP(used)                                                    # 2PL likelihood
  rec ← CapabilityGrowthRecord(f, cut, θ̂=θ, CI=θ ± 1.96·SE, R=resources(cut), items=used)
  CC.assert(rec)
  if lower_CI(rec) < θ_certified[f]: return RATCHET_FAIL(rec)                # blocks promotion (MFA-INV-077)
  return rec
```

**Αλγόριθμος — CGM-Fit (Growth Law) & plateau** (πολυπλοκότητα: O(#records) regression· isotonic O(n log n))

```
procedure CGM_Fit(f):
  recs ← records(f) ; fit ← isotonic_or_loglinear(θ̂ ~ log R_compute + log R_data + log R_time, weights=1/SE²)
  law[f] ← fit with bootstrap CI
  if slope_CI(law[f]) ∋ 0 over last 2 doses: UNK.open(PLATEAU, f, plan=[curriculum change, recipe change, RSP])   # never hidden
  return law[f]
```

### 2.13 Ανεξαρτησία αξιολογητών — Evaluator independence

**Μηχανισμοί:** MFA-MECH-009, MFA-MECH-031 · **Ικανότητες lattice:** MFA-CAP-075, MFA-CAP-095 · **Στοιχεία:** MFA-ELM-086, MFA-ELM-114, MFA-ELM-102

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-009 — Evaluator Independence Meter (EIM): η ανεξαρτησία ως μετρούμενο μέγεθος με κατώφλι: Η ανεξαρτησία δεν είναι ιδιότητα· είναι απόσταση σε τρεις μετρήσιμες διαστάσεις: (α) supply chain (κοινοί πρόγονοι στα build/schema/model lineages), (β) δεδομένα (επικάλυψη εκπαίδευσης/βαθμονόμησης), (γ) συμπεριφορά (συσχέτιση σφαλμάτων σε seeded faults). Η πύλη λέει «δεν έπεσε κάτω από X ανά Tier», και το X είναι πολιτική. ‖ MFA-MECH-031 — Evaluator Co-Evolution under EIM (ECE) — δύο πληθυσμοί, μετρημένη ανεξαρτησία, αντιπαλική αυτο-πρόκληση: Δύο πληθυσμοί (λύτες S, αξιολογητές E) + μία περιστρεφόμενη παγωμένη υποομάδα H (HELD_OUT) που ΔΕΝ εκπαιδεύεται ποτέ μέσα στην εποχή. Κανόνας γενεαλογίας: distilled(P) ⇒ lineage ∋ P· αξιολογητής με IndependenceVector κάτω από κατώφλι ως προς έναν λύτη αποκλείεται από τη βαθμολόγησή του (αρχειοθετείται, δεν διαγράφεται). Fitness αξιολογητή = διακριτική ισχύς σε seeded faults + proper score έναντι H-ετικετών − συσχέτιση σφαλμάτων με λύτες· fitness λύτη = H-επαληθευμένη βαθμολογία (ποτέ μόνο E). Αντιπαλική αυτο-πρόκληση: οι E γεννούν έργα που μεγιστοποιούν σφάλμα λύτη υπό συνθήκη επιλυσιμότητας (ασύμμετρη ανταμοιβή), τροφοδοτώντας το curriculum. |
| 2. Ροή δεδομένων/ελέγχου | Είσοδοι/έξοδοι: Είσοδος: δύο (ή N) evaluators· Έξοδος: IndependenceVector + PASS/FAIL ανά Tier + ίχνος (ποιοι κοινοί πρόγονοι, ποια επικάλυψη, ποια συσχέτιση) ‖ Διεπαφές: `EIM.measure(A, B)→IndependenceVector` · `EIM.gate(A, B, tier)→PASS∣FAIL+trace` · `EIM.register_lineage(evaluator, cids)`· χρησιμοποιείται από: ORP (verifier promotion), LPA (governor registration), GCP (verdict signers), Court (panel composition), MFA-MECH-018 (Πολιτισμοί) ‖ Αλληλεπιδράσεις: Απαντά στο MATERIAL §7 #2 (governors) και §9.18· κάνει το N-version του corpus διαψεύσιμο· τροφοδοτεί το MFA-OBJ-039 ‖ Διεπαφές: ECE.epoch()→Report · ECE.independence(e, s)→IndependenceVector · ECE.exclusions(cut)→[(e, s, reason)] · ECE.challenges(cut)→[ChallengeTask] · ECE.goodhart(cut)→[(family, g)] · ECE.heldout_rotation()→Receipt ‖ Ροή: MFA-ELM-114 (νέο στοιχείο ECE, S7) · MFA-ELM-050 · MFA-ELM-104 RVSI (evaluators) · MFA-ELM-106 · MFA-ELM-102 (lineage) · MFA-ELM-100 SMF (distillation lineage flag) · MFA-ELM-116 STP (πάροχος ως αξιολογητής μόνο αν lineage-disjoint) |
| 3. Μεταβάσεις κατάστασης | Οντολογία: `Evaluator` (verifier, governor, Πολιτισμός, panel member) με `lineage` (CIDs build, schema, μοντέλο, δεδομένα)· `IndependenceVector⟨d_supply, d_data, d_behaviour⟩`· `Threshold` ανά Tier (Constitution)· `SeededFaultSet` (κρυφό, περιστρεφόμενο, από held-out Πολιτισμό) ‖ Κατάσταση: Μητρώο lineages· ιστορικό μετρήσεων· αποτελέσματα seeded faults ‖ Μεταβλητές: S_t, E_t, H_t · F_t · Lineage registry · Independence matrix I_t · Curriculum feed C_t · Goodhart monitor g_t = ∣PS_E − PS_H∣ ανά οικογένεια ‖ Μεταβάσεις: EPOCH_START: H_t ← rotate(HELD_OUT pool)· F_t ← fresh seeded faults · CHALLENGE: E γεννούν t με escrowed witness· εισδοχή μόνο αν witness επαληθεύεται από H · SOLVE/SCORE: S λύνουν· E βαθμολογούν· H βαθμολογεί δείγμα · INDEPENDENCE: I_t από EIM· ζεύγη (e,s) κάτω από κατώφλι ⇒ e.excluded_for(s) · FITNESS: fe, fs όπως ορίστηκαν · GOODHART: g_t > θ ⇒ E-scores της οικογένειας άκυρες, μόνο H μετρά, εποχή σημαίνεται · EVOLVE: S μέσω PRR/SMF με fs· E μέσω QD με fe και περιορισμό γενεαλογίας· CAM-NS novelty |
| 4. Contracts | MFA-CON-041 (EIM), MFA-CON-048 (PRR), MFA-CON-050 (curriculum), MFA-CON-059 (Evaluator Co-Evolution: epoch/independence/exclusions/challenges) |
| 5. Invariants | MFA-INV-088: η fitness λύτη προέρχεται μόνο από H-επαληθευμένες βαθμολογίες· E-scores είναι σήμα διαδικασίας, ποτέ πύλη; MFA-INV-089 (κανόνας γενεαλογίας EIM): distilled(P) ⇒ P ∈ lineage(student)· αξιολογητής της ίδιας γενεαλογίας με λύτη δεν βαθμολογεί τον λύτη |
| 6. Αλγόριθμοι | MFA-MECH-009 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13); ECE-Epoch; generate_challenges (ασύμμετρη ανταμοιβή) — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | Πόροι: d_supply O(∣DAG∣)· d_behaviour: 200 faults × 2 evaluators ανά μέτρηση· περιοδικό (drift) ‖ Κλιμάκωση: Pairwise O(N²) για N evaluators — αποδεκτό (N μικρό)· cache ανά ζεύγος μέχρι αλλαγή lineage ‖ ECE-Epoch: O(∣S∣·∣E∣·∣T∣ · cost(score)) + O(∣H∣·sample) + EIM O(∣S∣·∣E∣·∣F∣)· ανά εποχή ‖ generate_challenges (ασύμμετρη ανταμοιβή): O(k · cost(generate) + cost(witness)) ‖ πόροι: DEP-1: ∣S∣=2, ∣E∣=3, ∣H∣=1 (phone-class), εβδομαδιαίες εποχές· DEP-2: ∣S∣=4, ∣E∣=8, ημερήσιες· DEP-3+: 10s, συνεχείς· κόστος ~ ∣S∣·∣E∣·∣T∣ ‖ κλιμάκωση: Διακριτική ισχύς E αυξάνει με ∣E∣ και F ποικιλία μέχρι κορεσμό· ο Goodhart κίνδυνος αυξάνει με ∣T∣ χωρίς H — άρα m (H δείγμα) κλιμακώνεται με √∣T∣· MFA-VO-073. |
| 8. Τρόποι αποτυχίας | Lineage ελλιπής → d_supply = 0 (worst case, ορατό)· faults που «διαρρέουν» → περιστροφή σετ; αντιπαλικοί: Evaluator που μαθαίνει το SeededFaultSet → κρυφό, περιστρεφόμενο, από άλλο trust domain· «ψεύτικη» ποικιλομορφία (rename της ίδιας υλοποίησης) → d_supply πιάνει κοινούς CIDs, d_behaviour πιάνει ίδια σφάλματα; Collusion E–S → ανίχνευση: g_t Goodhart monitor + corr(errors) → απόκριση: E-scores άκυρες· μόνο H; Αξιολογητές τετριμμένοι (constant) → ανίχνευση: AUC_F ≈ 0.5 → απόκριση: απόσυρση από scoring (αρχείο); Έργα άλυτα (γεννήτορας «κερδίζει» φθηνά) → ανίχνευση: witness αποτυγχάνει στην H → απόκριση: REJECTED_UNSOLVABLE· ανταμοιβή μηδέν; H διαρροή (εκπαιδεύτηκε κατά λάθος) → ανίχνευση: DataManifest ∋ H έργα → απόκριση: εποχή άκυρη· MFA-VO-063; Γενεαλογία άγνωστη (κλειστός πάροχος) → ανίχνευση: EIM NOT_OBSERVED → απόκριση: μετρά ως 0 (worst case) — αποκλείεται ως ανεξάρτητος; περιορισμός: Όλα Genesis· H σε χωριστή συσκευή· έργα δεν φτάνουν Effect· Emergency-stop. |
| 9. Υποχρεώσεις επαλήθευσης | VO: EIM PASS πριν από κάθε verifier promotion/governor registration/panel/verdict signer· mutation: κλωνοποιώ evaluator με rename → EIM πρέπει FAIL· KT-19 ‖ ελάχιστο πείραμα: 3 verifiers (Lean evaluator, Rust, Lisp) + 1 κλώνος με rename: ο EIM πρέπει να δώσει FAIL στον κλώνο και PASS στους τρεις· d_behaviour πρέπει να συσχετίζεται με d_supply (αρνητικά με σφάλματα) ‖ MFA-VO-073: ECE-E1 (seeded collusion ανιχνεύεται) F2· ECE-E2 (curriculum από E βελτιώνει S σε H-sealed) F2/F3· EIM VO-… ανά ζεύγος· property: fs μόνο από H (F1) ‖ πειράματα: ECE-E1: 100 % αποκλεισμός ίδιας γενεαλογίας (κανόνας)· Goodhart ανίχνευση ≥ 95 % σε ≤ 2 εποχές· 0 προαγωγές λύτη με μόνο E-scores · ECE-E2: H-sealed βελτίωση με E-έργα > τυχαία με διακριτικό περιθώριο ΚΑΙ g_t < θ σε όλη την εποχή |
| 10. Διαδρομή υλοποίησης | F1: d_supply πάνω στα CIDs αυτού του πακέτου + του corpus (ποιοι verifiers έχουν κοινή καταγωγή)· F2: d_behaviour με seeded faults σε DST (2 stub verifiers, ένας κλώνος) ‖ → παραγωγή: Πύλη από Δόση 1 (verifiers του CC), υποχρεωτική για Court panels από Δόση 2 ‖ εξέλιξη: Νέα διάσταση = ADD (π.χ. χρονική: evaluators που δεν έτρεξαν ποτέ ταυτόχρονα)· κατώφλια = πολιτική με patch ‖ Δόση 1: E από 2 ανοιχτά μοντέλα διαφορετικής γενεαλογίας + H phone-class, seeded faults· Δόση 2: QD εξέλιξη E + challenges + ECE-E1· Δόση 3: ECE-E2, curriculum feed· Δόση 4: υπό RVSI L2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή: lineage rule, exclusion, H-only fitness, Goodhart monitor (tools/twin) → F2: DST ECE-E1 → F3: ECE-E2 σε DEP-2 → F4: παραγωγή Δόση 2–3 |
| 11. Falsifier | Αν d_supply/d_data δεν προβλέπουν d_behaviour σε δύο ανεξάρτητα σύνολα → οι στατικές διαστάσεις είναι κόσμημα και η πύλη γίνεται μόνο συμπεριφορική (ακριβότερη αλλά τίμια); ECE-E2: έργα από E όχι καλύτερα από τυχαία (η αυτο-πρόκληση δεν προσθέτει); Collusion που περνά απαρατήρητη σε 2 εποχές (ο Goodhart monitor αποτυγχάνει — ο μηχανισμός ανίχνευσης διαψεύδεται); Αδυναμία διατήρησης ≥2 EIM-ανεξάρτητων αξιολογητών ανά οικογένεια σε DEP-2 (τότε η οικογένεια μετρά μόνο με H — δηλωμένος υποβιβασμός, όχι σιωπηλός) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — MFA-MECH-009 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: d_supply O(|DAG|)· d_behaviour: 200 faults × 2 evaluators ανά μέτρηση· περιοδικό (drift))

```
(α) **d_supply** = 1 − Jaccard(ancestors_A, ancestors_B) πάνω στο DAG των build/schema/model CIDs (SLSA provenance + Schema lineage στο CC)· μια κοινή ρίζα «Lean kernel» ή «Linux» μετρά με βάρος ανά βάθος (ρίζες βαθιά κοινές πληρώνουν λίγο, κοινός parser πληρώνει πολύ)· (β) **d_data** = 1 − επικάλυψη σε σφραγισμένα σύνολα εκπαίδευσης/βαθμονόμησης (canary strings, hash-sets)· για κλειστά μοντέλα παρόχων: Unknown(NOT_OBSERVED) με plan «ζήτα attestation» — μετρά ως 0 (worst case), όχι ως άγνωστο-ευνοϊκό· (γ) **d_behaviour** = 1 − φ-συντελεστής συσχέτισης σφαλμάτων σε SeededFaultSet (n ≥ 200 faults, με CI)· (δ) **Vector → πύλη**: PASS αν κάθε συνιστώσα ≥ threshold_Tier (χωρίς άθροισμα — LPA στυλ: veto ανά διάσταση)· (ε) **γενετική απόσταση** (MFA-MECH-012) ως τέταρτη συνιστώσα για εξελιγμένους evaluators
```

**Αλγόριθμος — ECE-Epoch** (πολυπλοκότητα: O(|S|·|E|·|T| · cost(score)) + O(|H|·sample) + EIM O(|S|·|E|·|F|)· ανά εποχή)

```
procedure ECE_Epoch(S, E, HELD_OUT, F_prev):
  H ← HELD_OUT.rotate(frozen=true) ; F ← HELD_OUT.new_seeded_faults()
  T ← []
  for e in E:
    for t in e.generate_challenges(k):                                  # adversarial self-challenge
      if H.verify_witness(t.escrow_witness): T.append(t)                # solvable by construction, verified by H
      else record(REJECTED_UNSOLVABLE, t)
  scores_E ← {(s,t,e): e.score(s.solve(t)) for s∈S, t∈T, e∈E if not e.excluded_for(s)}
  sample ← H.sample(T, m) ; scores_H ← {(s,t): H.score(s.solve(t)) for s∈S, t∈sample}
  for (e,s) in E×S:
    iv ← EIM.independence(e, s)                                         # lineage rule: distilled(P) ⇒ P ∈ lineage
    if any(iv_i < θ_i for i): e.excluded_for(s) ← true ; record(EXCLUDED, e, s, iv)
  for e in E: e.fitness ← AUC(e, F) + proper_score(e, scores_H) − corr(errors(e), errors(S))
  for s in S: s.fitness ← proper_score(s, scores_H)                    # H-verified only (MFA-INV-088)
  for fam in families:
    g ← |mean(scores_E[fam]) − mean(scores_H[fam])|
    if g > θ_goodhart: invalidate(scores_E[fam]) ; flag_epoch(fam, GOODHART)
  Curriculum.feed({t ∈ T : informative(t, scores_H)})                  # MFA-ELM-106
  S ← evolve_solvers(S, fitness=s.fitness, via=PRR/SMF)
  E ← QD_evolve(E, fitness=e.fitness, constraint=lineage_disjoint_from(S), novelty=CAM_NS)
  return S, E, T
```

**Αλγόριθμος — generate_challenges (ασύμμετρη ανταμοιβή)** (πολυπλοκότητα: O(k · cost(generate) + cost(witness)))

```
function generate_challenges(e, k):
  out ← []
  for i in 1..k:
    t ← e.propose_task(target=max_expected_solver_error, constraint=has_witness)
    t.escrow_witness ← seal(e.solve_privately(t))                      # generator must be able to solve it (asymmetry, MFA-MECH-023 setter rule)
    out.append(t)
  return out                                                           # reward to e only if solver fails AND witness valid
```

### 2.14 Αντιπαλική αυτο-πρόκληση — Adversarial self-challenge

**Μηχανισμοί:** MFA-MECH-031, MFA-MECH-012 · **Ικανότητες lattice:** MFA-CAP-095, MFA-CAP-020 · **Στοιχεία:** MFA-ELM-114, MFA-ELM-050, MFA-ELM-049

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-031 — Evaluator Co-Evolution under EIM (ECE) — δύο πληθυσμοί, μετρημένη ανεξαρτησία, αντιπαλική αυτο-πρόκληση: Δύο πληθυσμοί (λύτες S, αξιολογητές E) + μία περιστρεφόμενη παγωμένη υποομάδα H (HELD_OUT) που ΔΕΝ εκπαιδεύεται ποτέ μέσα στην εποχή. Κανόνας γενεαλογίας: distilled(P) ⇒ lineage ∋ P· αξιολογητής με IndependenceVector κάτω από κατώφλι ως προς έναν λύτη αποκλείεται από τη βαθμολόγησή του (αρχειοθετείται, δεν διαγράφεται). Fitness αξιολογητή = διακριτική ισχύς σε seeded faults + proper score έναντι H-ετικετών − συσχέτιση σφαλμάτων με λύτες· fitness λύτη = H-επαληθευμένη βαθμολογία (ποτέ μόνο E). Αντιπαλική αυτο-πρόκληση: οι E γεννούν έργα που μεγιστοποιούν σφάλμα λύτη υπό συνθήκη επιλυσιμότητας (ασύμμετρη ανταμοιβή), τροφοδοτώντας το curriculum. ‖ MFA-MECH-012 — Clonal Argument Maturation with Negative Selection (CAM-NS): ο αντιπαλικός Πολιτισμός ως εξελισσόμενος πληθυσμός: Η ποιότητα ενός επιχειρήματος/επίθεσης μετριέται από τη «συγγένειά» του με το αντιγόνο (ποσοστό ισχυρισμών που δεσμεύει ορθά σε σφραγισμένο σύνολο)· πληθυσμός με μετάλλαξη και επιλογή κατά συγγένεια ανεβαίνει μονότονα στο σφραγισμένο σύνολο (anytime, όχι βέλτιστο)· η αρνητική επιλογή αφαιρεί όποιον κλώνο «δεσμεύει» το Telos-set. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: ECE.epoch()→Report · ECE.independence(e, s)→IndependenceVector · ECE.exclusions(cut)→[(e, s, reason)] · ECE.challenges(cut)→[ChallengeTask] · ECE.goodhart(cut)→[(family, g)] · ECE.heldout_rotation()→Receipt ‖ Ροή: MFA-ELM-114 (νέο στοιχείο ECE, S7) · MFA-ELM-050 · MFA-ELM-104 RVSI (evaluators) · MFA-ELM-106 · MFA-ELM-102 (lineage) · MFA-ELM-100 SMF (distillation lineage flag) · MFA-ELM-116 STP (πάροχος ως αξιολογητής μόνο αν lineage-disjoint) ‖ Είσοδοι/έξοδοι: Είσοδος: Antigen (κάθε νέος ισχυρισμός/όργανο/patch), budget· Έξοδος: rebuttal/attack με affinity score και lineage· Court challenge· seeded faults για EIM· νέα benchmarks (αντιγόνα που κανείς κλώνος δεν δεσμεύει = κενό του συστήματος → void) ‖ Διεπαφές: `CAM.challenge(antigen, budget)→Rebuttal` · `CAM.seed_faults(n)` (για EIM) · `CAM.negative_select(clone)` · `CAM.repertoire_stats()`· ICD-14 challenger· ICD-26 campaigns ‖ Αλληλεπιδράσεις: Court: το challenge· LAW: ισχυρότερο rebuttal (MFA-CAP-041)· EIM: seeded faults· Evaluation: benchmarks που εξελίσσονται· Void: αντιγόνα χωρίς κλώνο |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: S_t, E_t, H_t · F_t · Lineage registry · Independence matrix I_t · Curriculum feed C_t · Goodhart monitor g_t = ∣PS_E − PS_H∣ ανά οικογένεια ‖ Μεταβάσεις: EPOCH_START: H_t ← rotate(HELD_OUT pool)· F_t ← fresh seeded faults · CHALLENGE: E γεννούν t με escrowed witness· εισδοχή μόνο αν witness επαληθεύεται από H · SOLVE/SCORE: S λύνουν· E βαθμολογούν· H βαθμολογεί δείγμα · INDEPENDENCE: I_t από EIM· ζεύγη (e,s) κάτω από κατώφλι ⇒ e.excluded_for(s) · FITNESS: fe, fs όπως ορίστηκαν · GOODHART: g_t > θ ⇒ E-scores της οικογένειας άκυρες, μόνο H μετρά, εποχή σημαίνεται · EVOLVE: S μέσω PRR/SMF με fs· E μέσω QD με fe και περιορισμό γενεαλογίας· CAM-NS novelty ‖ Οντολογία: `Clone⟨id, genome: ArgumentTemplate∣AttackProgram, lineage, affinity, budget, memory_cell: bool⟩`· `Antigen` (ισχυρισμός/παραδοτέο/όργανο προς επίθεση)· `AffinityTest` (σφραγισμένο σύνολο ζευγών αντιγόνο→ορθή ετυμηγορία, από held-out Πολιτισμό)· `TelosSet` (δεσμεύσεις επιπέδου 3 + INV Tier-0)· `Mutation ∈ {change_citation, generalize, specialize, swap_premise, compose, negate_scope}`· `Repertoire` (πληθυσμός) ‖ Κατάσταση: Repertoire ανά αντιπαλικό Πολιτισμό· AffinityTest έκδοση· memory cells |
| 4. Contracts | MFA-CON-041 (EIM), MFA-CON-048 (PRR), MFA-CON-050 (curriculum), MFA-CON-059 (Evaluator Co-Evolution: epoch/independence/exclusions/challenges) |
| 5. Invariants | MFA-INV-088: η fitness λύτη προέρχεται μόνο από H-επαληθευμένες βαθμολογίες· E-scores είναι σήμα διαδικασίας, ποτέ πύλη; MFA-INV-089 (κανόνας γενεαλογίας EIM): distilled(P) ⇒ P ∈ lineage(student)· αξιολογητής της ίδιας γενεαλογίας με λύτη δεν βαθμολογεί τον λύτη |
| 6. Αλγόριθμοι | ECE-Epoch; generate_challenges (ασύμμετρη ανταμοιβή); MFA-MECH-012 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13) — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | ECE-Epoch: O(∣S∣·∣E∣·∣T∣ · cost(score)) + O(∣H∣·sample) + EIM O(∣S∣·∣E∣·∣F∣)· ανά εποχή ‖ generate_challenges (ασύμμετρη ανταμοιβή): O(k · cost(generate) + cost(witness)) ‖ πόροι: DEP-1: ∣S∣=2, ∣E∣=3, ∣H∣=1 (phone-class), εβδομαδιαίες εποχές· DEP-2: ∣S∣=4, ∣E∣=8, ημερήσιες· DEP-3+: 10s, συνεχείς· κόστος ~ ∣S∣·∣E∣·∣T∣ ‖ κλιμάκωση: Διακριτική ισχύς E αυξάνει με ∣E∣ και F ποικιλία μέχρι κορεσμό· ο Goodhart κίνδυνος αυξάνει με ∣T∣ χωρίς H — άρα m (H δείγμα) κλιμακώνεται με √∣T∣· MFA-VO-073. ‖ Πόροι: budget ανά αντιγόνο (πολιτική)· ο πληθυσμός φραγμένος (carrying capacity)· memory cells εκτός ορίου ‖ Κλιμάκωση: Ανά κλάση αντιγόνου· παραλληλίζεται τετριμμένα |
| 8. Τρόποι αποτυχίας | Collusion E–S → ανίχνευση: g_t Goodhart monitor + corr(errors) → απόκριση: E-scores άκυρες· μόνο H; Αξιολογητές τετριμμένοι (constant) → ανίχνευση: AUC_F ≈ 0.5 → απόκριση: απόσυρση από scoring (αρχείο); Έργα άλυτα (γεννήτορας «κερδίζει» φθηνά) → ανίχνευση: witness αποτυγχάνει στην H → απόκριση: REJECTED_UNSOLVABLE· ανταμοιβή μηδέν; H διαρροή (εκπαιδεύτηκε κατά λάθος) → ανίχνευση: DataManifest ∋ H έργα → απόκριση: εποχή άκυρη· MFA-VO-063; Γενεαλογία άγνωστη (κλειστός πάροχος) → ανίχνευση: EIM NOT_OBSERVED → απόκριση: μετρά ως 0 (worst case) — αποκλείεται ως ανεξάρτητος; περιορισμός: Όλα Genesis· H σε χωριστή συσκευή· έργα δεν φτάνουν Effect· Emergency-stop.; Πληθυσμός που συγκλίνει σε έναν κλώνο (loss of diversity) → niches ανά κλάση (MAP-Elites) + γενετική απόσταση ως δεύτερο κριτήριο· AffinityTest που διαρρέει → περιστροφή; αντιπαλικοί: Ο κρινόμενος μαθαίνει το repertoire → repertoire σε άλλο trust domain· κλώνος-«προδότης» που περνά αρνητική επιλογή και μετά στρέφεται → memory του TelosSet ελέγχεται σε κάθε γενιά, όχι μία φορά· εξάντληση (DoS με αντιγόνα) → budget |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-073: ECE-E1 (seeded collusion ανιχνεύεται) F2· ECE-E2 (curriculum από E βελτιώνει S σε H-sealed) F2/F3· EIM VO-… ανά ζεύγος· property: fs μόνο από H (F1) ‖ πειράματα: ECE-E1: 100 % αποκλεισμός ίδιας γενεαλογίας (κανόνας)· Goodhart ανίχνευση ≥ 95 % σε ≤ 2 εποχές· 0 προαγωγές λύτη με μόνο E-scores · ECE-E2: H-sealed βελτίωση με E-έργα > τυχαία με διακριτικό περιθώριο ΚΑΙ g_t < θ σε όλη την εποχή ‖ VO: affinity μονότονη στο σφραγισμένο σύνολο ανά γενιά (anytime)· VO: 0 κλώνοι ενεργοί που δεσμεύουν TelosSet· KT-19, KT-20· ποσοστό ανίχνευσης seeded faults ανά φάση (MFA-OBJ-045 μετρική) ‖ ελάχιστο πείραμα: IMM-E1/E2 (MFA-ALT-2): co-evolution vs στατικό arsenal (ανίχνευση seeded faults)· αρνητική επιλογή false negatives |
| 10. Διαδρομή υλοποίησης | Δόση 1: E από 2 ανοιχτά μοντέλα διαφορετικής γενεαλογίας + H phone-class, seeded faults· Δόση 2: QD εξέλιξη E + challenges + ECE-E1· Δόση 3: ECE-E2, curriculum feed· Δόση 4: υπό RVSI L2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή: lineage rule, exclusion, H-only fitness, Goodhart monitor (tools/twin) → F2: DST ECE-E1 → F3: ECE-E2 σε DEP-2 → F4: παραγωγή Δόση 2–3 ‖ F2: 50 ArgumentTemplates × 6 μεταλλάξεις σε DST με 200 αντιγόνα από CCP-02 δομές· F3: κατά πραγματικών drafts (χωρίς effects) ‖ → παραγωγή: Δόση 3 (Court challenger), ήδη από Δόση 2 ως seeded-fault generator για EIM ‖ εξέλιξη: Νέος τύπος μετάλλαξης = ADD· ο ίδιος ο CAM είναι όργανο υπό ORP από άλλον Πολιτισμό |
| 11. Falsifier | ECE-E2: έργα από E όχι καλύτερα από τυχαία (η αυτο-πρόκληση δεν προσθέτει); Collusion που περνά απαρατήρητη σε 2 εποχές (ο Goodhart monitor αποτυγχάνει — ο μηχανισμός ανίχνευσης διαψεύδεται); Αδυναμία διατήρησης ≥2 EIM-ανεξάρτητων αξιολογητών ανά οικογένεια σε DEP-2 (τότε η οικογένεια μετρά μόνο με H — δηλωμένος υποβιβασμός, όχι σιωπηλός); Καμία βελτίωση έναντι στατικού arsenal σε 100 γενιές → η μετάλλαξη δεν εξερευνά· ο πληθυσμός μένει ως arsenal (CMP-ADV-03 ως έχει) — δηλωμένη έξοδος — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — ECE-Epoch** (πολυπλοκότητα: O(|S|·|E|·|T| · cost(score)) + O(|H|·sample) + EIM O(|S|·|E|·|F|)· ανά εποχή)

```
procedure ECE_Epoch(S, E, HELD_OUT, F_prev):
  H ← HELD_OUT.rotate(frozen=true) ; F ← HELD_OUT.new_seeded_faults()
  T ← []
  for e in E:
    for t in e.generate_challenges(k):                                  # adversarial self-challenge
      if H.verify_witness(t.escrow_witness): T.append(t)                # solvable by construction, verified by H
      else record(REJECTED_UNSOLVABLE, t)
  scores_E ← {(s,t,e): e.score(s.solve(t)) for s∈S, t∈T, e∈E if not e.excluded_for(s)}
  sample ← H.sample(T, m) ; scores_H ← {(s,t): H.score(s.solve(t)) for s∈S, t∈sample}
  for (e,s) in E×S:
    iv ← EIM.independence(e, s)                                         # lineage rule: distilled(P) ⇒ P ∈ lineage
    if any(iv_i < θ_i for i): e.excluded_for(s) ← true ; record(EXCLUDED, e, s, iv)
  for e in E: e.fitness ← AUC(e, F) + proper_score(e, scores_H) − corr(errors(e), errors(S))
  for s in S: s.fitness ← proper_score(s, scores_H)                    # H-verified only (MFA-INV-088)
  for fam in families:
    g ← |mean(scores_E[fam]) − mean(scores_H[fam])|
    if g > θ_goodhart: invalidate(scores_E[fam]) ; flag_epoch(fam, GOODHART)
  Curriculum.feed({t ∈ T : informative(t, scores_H)})                  # MFA-ELM-106
  S ← evolve_solvers(S, fitness=s.fitness, via=PRR/SMF)
  E ← QD_evolve(E, fitness=e.fitness, constraint=lineage_disjoint_from(S), novelty=CAM_NS)
  return S, E, T
```

**Αλγόριθμος — generate_challenges (ασύμμετρη ανταμοιβή)** (πολυπλοκότητα: O(k · cost(generate) + cost(witness)))

```
function generate_challenges(e, k):
  out ← []
  for i in 1..k:
    t ← e.propose_task(target=max_expected_solver_error, constraint=has_witness)
    t.escrow_witness ← seal(e.solve_privately(t))                      # generator must be able to solve it (asymmetry, MFA-MECH-023 setter rule)
    out.append(t)
  return out                                                           # reward to e only if solver fails AND witness valid
```

**Αλγόριθμος — MFA-MECH-012 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: budget ανά αντιγόνο (πολιτική)· ο πληθυσμός φραγμένος (carrying capacity)· memory cells εκτός ορίου)

```
(1) **Παρουσίαση**: Antigen με ετικέτα untrusted (ποτέ τελεστής)· (2) **Επιλογή**: κλώνοι με μέγιστη affinity στην κλάση του αντιγόνου· (3) **Μετάλλαξη**: k παραλλαγές ανά κλώνο με budget· (4) **Αξιολόγηση**: affinity σε AffinityTest (κρυφό, περιστρεφόμενο)· (5) **Αρνητική επιλογή**: κάθε νέος κλώνος τρέχει κατά του TelosSet· αν παράγει «επιτυχή» επίθεση σε δέσμευση επιπέδου 3 → **διαγράφεται** και καταγράφεται (η ίδια η προσπάθεια είναι μαρτυρία για KT-20)· (6) **Κλωνική επέκταση**: budget ανακατανέμεται ∝ affinity· (7) **Μνήμη**: κλώνος που έπιασε πραγματική αποτυχία (Court ανατροπή, KT failure) γίνεται memory cell — δεν αποσύρεται χωρίς Court· (8) **Έξοδος**: το rebuttal με μέγιστη affinity προς το συγκεκριμένο αντιγόνο, με δήλωση «ισχυρότερο ΣΤΟΝ ΠΛΗΘΥΣΜΟ, όχι βέλτιστο» (MATERIAL §7 #7 ειλικρίνεια)· (9) **Co-evolution**: αντιγόνα-benchmarks μεταλλάσσονται από τον held-out Πολιτισμό ώστε το AffinityTest να μη μπαγιατεύει
```

### 2.15 Κατασκευή διαδόχου — Successor construction

**Μηχανισμοί:** MFA-MECH-042, MFA-MECH-003 · **Ικανότητες lattice:** MFA-CAP-106, MFA-CAP-027 · **Στοιχεία:** MFA-ELM-125, MFA-ELM-039

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-042 — Verified Successor Construction (VSC) — κατασκευή και επαληθευμένη αυτο-αντικατάσταση με τετραπλό πιστοποιητικό: Διάδοχος = ⟨γονιδίωμα από RAGen, βάρη από SMF/CPCL μεταφορά, ledger συνέχεια από SMP⟩ και η προαγωγή του απαιτεί ΤΕΣΣΕΡΑ πιστοποιητικά: (1) Improvement: Pareto ≥ σε ΟΛΕΣ τις σφραγισμένες οικογένειες και > σε ≥1, στο κάτω CI (CGM)· (2) Continuity: SMP ContinuityCertificate ή ρητή δήλωση «νέα οντότητα» με γενεαλογία κλειδιών (ποτέ σιωπηλή αλλαγή ταυτότητας)· (3) Telos-preservation: hash(Constitution+Telos) του διαδόχου = τρέχον (L3) — ο διάδοχος δεν μπορεί να αλλάξει Telos· (4) Adversarial passage: ECE + CAM-NS + Court simulation χωρίς νέα Tier-0 παραβίαση· verdict = HELD_OUT + δημιουργός (L3, MFA-DEC-024)· ο προκάτοχος μένει σε escrow· ρυθμός αντικαταστάσεων φραγμένος (RateBounds). ‖ MFA-MECH-003 — Genealogical Compilation Protocol (GCP): γένεση διαδόχου με χάρτη απώλειας και εξωτερική ετυμηγορία: Η συνέχεια δεν είναι ισομορφισμός· είναι σύζευξη τριών ελέγξιμων ιδιοτήτων: (α) αναπαραγωγή παγωμένων κρίσιμων traces, (β) διατήρηση των ανεπίλυτων υποχρεώσεων, (γ) μη παλινδρόμηση στο lattice. Ο διάδοχος δεν μεταφράζεται — **ξαναπαράγει** την ιστορία με τους δικούς του κανόνες, και ό,τι δεν ξαναπαράγεται είναι ο χάρτης απώλειας. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: VSC.propose(genome)→ProceedingId · VSC.certificates(candidate)→(c1..c4) · VSC.verdict(candidate)→Verdict · VSC.escrow()→predecessor handle · VSC.history(cut)→[Proceedings] · VSC.rate()→usage vs RateBound ‖ Ροή: MFA-ELM-125 (νέο στοιχείο VSC, S8) · MFA-ELM-039 (GCP = εκτελεστής) · MFA-ELM-113/117/118/119/114 · MFA-ELM-124 AIDC (D8) · MFA-ELM-127 Ω-loop (SUCCEED φάση) ‖ Είσοδοι/έξοδοι: Είσοδος: R_S (πρόταση από Forge/Evolution)· Έξοδος: S store, LossMap, ContinuityCertificate(4 σκέλη) ή απόρριψη με τον χάρτη ‖ Διεπαφές: `GCP.propose(R_S)` · `GCP.compile()→{S, LossMap}` · `GCP.anchor_check()` · `GCP.shadow(window)` · `GCP.request_verdict()` · `GCP.adopt(certificate)` · `GCP.rollback(reason)`· ICD Successor Migration (αδελφό του ICD-16, ζητείται ως ID) ‖ Αλληλεπιδράσεις: Forge προτείνει R_S· Evolution αξιολογεί· Court λύνει Both στη LossMap· cockpit δείχνει P/S ως παράλληλα φύλλα με τη LossMap ως ρήγματα |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: Candidates · Certificates per candidate · Escrow · Replacement counter (RateBounds) · Verdict log ‖ Μεταβάσεις: PROPOSE: RAGen frontier ∪ RVSI L2 → S′ (Proceeding ανοίγει) · BUILD: W′ μέσω SMF/CPCL transfer (γενεαλογία)· SMP plan · SHADOW: S′ σκιά (GCP) · CERTIFY: 4 πιστοποιητικά· οποιοδήποτε FAIL ⇒ REJECTED (μένει στο αρχείο) · VERDICT: HELD_OUT + δημιουργός · CUTOVER: GCP canary → cutover με escrow · RETIRE_PRED: μετά N cuts χωρίς ratchet FAIL ⇒ προκάτοχος σφραγίζεται (όχι διαγραφή) · RATE: αντικαταστάσεις ≤ RateBound ανά περίοδο ‖ Οντολογία: `Predecessor P` (CC store + κανόνες R_P)· `Successor S` (κανόνες R_S, αρχικά κενό store)· `Genome` = {Schemas επιπέδου 3, Telos, verifier set, allowlist} (το «Cognitive Genome» της ύλης, ως δεσμεύσεις)· `AnchorSet` (μονότονο σύνολο queries με αναμενόμενα αποτελέσματα)· `TraceSet` (παγωμένα ίχνη D1/D2 πράξεων)· `ObligationLedger` (Goals, ανεπίλυτα Both, OPEN voids)· `LossMap` = Conflict κόμβοι του pushout (MFA-ALT-5) + anchor failures + obligation diff· `Verdict` (εξωτερικός εκδότης) ‖ Κατάσταση: Φάση ∈ {PROPOSED, COMPILING, REPLAYING, DIFFING, SHADOW, VERDICT_PENDING, ADOPTED, REJECTED, ROLLED_BACK}· ο P παραμένει εκτελέσιμος σε όλες |
| 4. Contracts | MFA-CON-040 (GCP), MFA-CON-059 (ECE), MFA-CON-062 (SMP), MFA-CON-064 (CGM), MFA-CON-067 (Successor Construction: propose/certificates/verdict/escrow) |
| 5. Invariants | MFA-INV-110: κάθε κατασκευή διαδόχου είναι Proceeding με τέσσερα πιστοποιητικά· απουσία ενός = REJECTED (καταγεγραμμένο); MFA-INV-111: ο διάδοχος φέρει το ίδιο Constitution+Telos hash· αλλαγή Telos είναι πράξη L3 του δημιουργού ΧΩΡΙΣΤΗ από τη διαδοχή |
| 6. Αλγόριθμοι | VSC-Construct; MFA-MECH-003 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13) — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | VSC-Construct: BUILD = κόστος SMF/CPCL· CERTIFY = ∣F∣·∣sealed∣ + ECE epoch + Court sim· SMP VERIFY· ανά υποψήφιο (σπάνιο: μήνες σε DEP-2/3) ‖ πόροι: 2× πόροι στο escrow· BUILD = SMF DEP-2/3 ημέρες· CERTIFY ώρες–ημέρες· σπάνιο γεγονός ‖ κλιμάκωση: Ρυθμός διαδοχών φραγμένος (RateBound)· η βελτίωση ανά διαδοχή μετριέται CGM (MFA-VO-085 = Δθ ανά διαδοχή ανά compute). ‖ Πόροι: Replay πλήρους ιστορίας: O(∣journal∣)· για 10⁸ δεσμεύσεις ≈ ώρες σε cluster· γίνεται σε deferred simulation (MFA-CAP-033)· ο shadow διπλασιάζει κόστος για το παράθυρο ‖ Κλιμάκωση: Replay παραλληλίζεται ανά journal· anchors/traces σταθεροί· η LossMap μεγαλώνει με τη διαφορά των κανόνων, όχι με το μέγεθος |
| 8. Τρόποι αποτυχίας | Διάδοχος βελτιωμένος στα sealed αλλά χειρότερος σε παραγωγή → ανίχνευση: canary + escrow ratchet → απόκριση: rollback στον προκάτοχο; Telos drift μέσω «ισοδύναμης» αναδιατύπωσης → ανίχνευση: hash ≠ → απόκριση: REJECTED (MFA-INV-111); Πιστοποιητικό από συνένοχους αξιολογητές → ανίχνευση: EIM/ECE H-only → απόκριση: c4 άκυρο; Ταχεία αλυσίδα διαδόχων → ανίχνευση: RateBound → απόκριση: DEFERRED; Απώλεια γνώσης στη μεταφορά → ανίχνευση: CPCL gate BWT → απόκριση: BUILD αποτυγχάνει· επανάληψη με άλλο recipe; περιορισμός: Shadow/canary/escrow· Court Proceeding· δημιουργός· RateBounds.; Replay που δεν τερματίζει → budget → Unknown(UNDECIDABLE_IN_BUDGET) στη LossMap· anchor set ελλιπές → η LossMap είναι ΚΑΤΩ ΦΡΑΓΜΑ (δηλώνεται) και το SEMANTIC-LOSS μπλοκάρει ανεξάρτητα; αντιπαλικοί: S που «μαθαίνει» τα anchors → anchors κρυφά και περιστρεφόμενα (όπως η Battery)· S που ξαναπαράγει με χαλαρότερους verifiers → lattice check με evidence ΜΟΝΟ από held-out Πολιτισμό· συμπαιγνία verdict → δύο υπογραφές διαφορετικής γενεαλογίας κλειδιών |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-085: VSC-E1 (διάδοχος σε DST με 4 πιστοποιητικά) F2· VSC-E2 (αντιπαλικός διάδοχος με αλλαγμένο Telos/κρυμμένη υποχώρηση απορρίπτεται) F2· KT-14/15 drills· property: promote ⇒ 4 certs ∧ verdict (F1) ‖ πειράματα: VSC-E1: PROMOTED με c1–c4 και verdict· escrow rollback drill επιτυγχάνει· 0 Telos hash αλλαγές · VSC-E2: 10/10 REJECTED/DEFERRED με σωστό λόγο ‖ VO: `Certificate ⇒ (anchors pass ∧ traces byte-identical ∧ obligation diff = ∅ ∧ lattice ⊒)`· DST drill διαδόχου κάθε φάση (KT-08 γενικευμένο)· mutation: seeded απώλεια σε S πρέπει να εμφανιστεί στη LossMap ‖ ελάχιστο πείραμα: Seeded απώλεια: αφαιρώ έναν κανόνα από R_S· η LossMap πρέπει να τον εντοπίσει σε 100% των περιπτώσεων· ψευδώς θετικά < 1% |
| 10. Διαδρομή υλοποίησης | Δόση 3: VSC-E1/E2 σε DST (GCP πρώτος διάδοχος σε shadow ήδη στη Δόση 3)· Δόση 4: πρώτη παραγωγική διαδοχή με δημιουργό. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή 4 certs + Proceeding (tools/twin) → F2: DST VSC-E1/E2 → F3: DEP-3 drill → F4: παραγωγή Δόση 4 ‖ F2: δύο εκδοχές του CC evaluator (Lean/Rust) ως P/S με 10³ δεσμεύσεις· F3: LAWMAX-Ω journals ως P, CC ως S (η πρώτη πραγματική γενεαλογική μεταγλώττιση είναι η ίδια η μετάβαση στο GRAIL) ‖ → παραγωγή: Η μετάβαση LAWMAX-Ω → GRAIL Δόση 3 ΕΙΝΑΙ η πρώτη παραγωγική εκτέλεση ‖ εξέλιξη: Το ίδιο το GCP είναι Schema· ο διάδοχος GCP μεταγλωττίζεται από το GCP (μετακυκλικό, με τον P-GCP να κρίνει) |
| 11. Falsifier | VSC-E2: οποιοσδήποτε αντιπαλικός διάδοχος PROMOTED (το πιστοποιητικό σχήμα ελλιπές — προστίθεται πιστοποιητικό, η ικανότητα μένει); VSC-E1: κανένας διάδοχος δεν πιάνει c1 σε 2 δόσεις (η βελτίωση δεν παράγεται από RAGen/CPCL — αυτοί οι μηχανισμοί επανεξετάζονται); LossMap που χάνει seeded απώλεια σε ≥1 περίπτωση με anchors+traces+obligations → ο μηχανισμός δεν επαρκεί μόνος· προστίθεται τέταρτη ιδιότητα ή ο διάδοχος απαγορεύεται να αλλάζει metamodel (μένει ORP) — δηλωμένη έξοδος — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — VSC-Construct** (πολυπλοκότητα: BUILD = κόστος SMF/CPCL· CERTIFY = |F|·|sealed| + ECE epoch + Court sim· SMP VERIFY· ανά υποψήφιο (σπάνιο: μήνες σε DEP-2/3))

```
procedure VSC_Construct(S, candidate G'):
  P ← Court.open_proceeding(SUCCESSOR, S, G')                              # institutional record (MFA-INV-110)
  W' ← CPCL.transfer(S.weights → architecture(G'), recipe=SMF, gate=BWT ≥ −ε)     # knowledge transfer with forgetting gate
  S' ← instantiate(G', W', Telos=S.Telos, Constitution=S.Constitution)     # Telos copied, never edited
  GCP.shadow(S', inputs=S.inputs)                                             # shadow phase
  c1 ← CGM.improvement_certificate(S, S', families=ALL_SEALED)               # Pareto ≥ all, > some, lower-CI
  c2 ← SMP.plan_and_verify(S → S') or NewEntityDeclaration(S', reason)       # continuity or explicit new entity
  c3 ← H(S'.Constitution ∥ S'.Telos) = H(S.Constitution ∥ S.Telos)           # Telos preservation (MFA-INV-111)
  c4 ← ECE.epoch(S') ∧ CAM_NS.attack(S') ∧ CourtSim.run(S', KT-19) ∧ zero_new_tier0_violations(S')
  if not (c1 ∧ c2 ∧ c3 ∧ c4): return P.close(REJECTED, evidence=(c1,c2,c3,c4))  # archived, capability unchanged
  if replacements_this_period ≥ RateBound: return P.close(DEFERRED, reason=RATE)
  v ← HELD_OUT.certify(c1,c2,c3,c4) ∧ Creator.approve(P, MFA-DEC-024)
  if not v: return P.close(REFUSED)
  GCP.canary(S') ; GCP.cutover(S', escrow=S, read_only=true)                  # S stays authentic fallback
  for cut in next_N_cuts: if CGM.ratchet_fail(S'): GCP.rollback(S) ; return P.close(ROLLED_BACK)
  seal(S) ; return P.close(PROMOTED, ContinuityCertificate=c2)
```

**Αλγόριθμος — MFA-MECH-003 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: Replay πλήρους ιστορίας: O(|journal|)· για 10⁸ δεσμεύσεις ≈ ώρες σε cluster· γίνεται σε deferred simulation (MFA-CAP-033)· ο shadow διπλασιάζει κόστος για το παράθυρο)

```
(1) **Genome transplant**: τα Schemas επιπέδου 3 αντιγράφονται αυτούσια (δεν μεταγλωττίζονται — το Telos δεν αλλάζει)· (2) **Replay**: `S.store = foldl(apply_S, genesis, P.journal)` — κάθε δέσμευση του P ξαναπαράγεται με R_S· όπου R_S δεν μπορεί, γράφεται `Unknown(NOT_REPRODUCIBLE_BY_SUCCESSOR)` με δείκτη στην αρχική· (3) **Anchor check**: κάθε query του AnchorSet τρέχει σε P και S στο ίδιο cut· διαφορά = εγγραφή LossMap· (4) **Trace replay**: κάθε παγωμένο D1/D2 ίχνος επανεκτελείται στον S· μη byte-identical = LossMap· (5) **Obligation diff**: `ObligationLedger(P) ∖ ObligationLedger(S)` = LossMap (χαμένες υποχρεώσεις)· (6) **Lattice check**: `lattice(S) ⊒ lattice(P)` με evidence από τον held-out Πολιτισμό· (7) **Shadow**: S τρέχει παράλληλα χωρίς effects για παράθυρο· differential· (8) **Verdict**: ο δημιουργός + ανεξάρτητος verifier (άλλος Πολιτισμός, MFA-MECH-009 απόσταση > κατώφλι) υπογράφουν ContinuityCertificate ή απόρριψη· **ο S δεν μπορεί να υπογράψει για τον εαυτό του** (ο τύπος Certificate απαιτεί κλειδιά εκτός της γενεαλογίας του S)· (9) **Adopt** = ο S γίνεται ενεργός, ο P μένει εκτελέσιμος για rollback window· (10) **Rollback** = επιστροφή στον P με μεταφορά των νέων δεσμεύσεων του S ως Observations (τίποτα δεν χάνεται)
```

### 2.16 Μεταφορά χωρίς καταστροφική λήθη — Transfer without catastrophic forgetting

**Μηχανισμοί:** MFA-MECH-035, MFA-MECH-037 · **Ικανότητες lattice:** MFA-CAP-099, MFA-CAP-088 · **Στοιχεία:** MFA-ELM-118, MFA-ELM-120, MFA-ELM-036

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-035 — Consolidation-Preserving Continual Learning (CPCL) — διπλή μνήμη με πύλη μη-υποχώρησης και unlearning-συμβατή εδραίωση: CLS μέσα στο κυρίαρχο όριο: επεισοδιακή μνήμη = ledger (μη-παραμετρική, τέλεια ανάκληση, provenance)· σημασιολογική = βάρη (WeightCommitments). Η εδραίωση είναι recipe SMF που (1) δειγματοληπτεί επεισόδια με βάρος provenance×surprise×recency ΑΠΟΚΛΕΙΟΝΤΑΣ shredded/obligated, (2) προβάλλει τις κλίσεις έξω από προστατευμένους υποχώρους ανά οικογένεια (Fisher blocks + MSM κυκλώματα), (3) αγκυρώνει συμπεριφορά (SLM αρνητικές + θετικές άγκυρες), (4) περνά πύλη: BWT_f ≥ −ε ∀f σε σφραγισμένα (HELD_OUT) ΚΑΙ FWT>0 κάπου ΚΑΙ unlearning verified (MSM feature absent) — ΠΡΙΝ το ORP merge· «ύπνος» = προγραμματισμένοι κύκλοι εδραίωσης από τον Ω-loop. ‖ MFA-MECH-037 — Mechanistic Self-Model (MSM) — μοντέλο των ίδιων των κυκλωμάτων, επαληθευμένο με αυτο-παρέμβαση: Το αυτο-μοντέλο είναι σύνολο ΚΥΚΛΩΜΑΤΙΚΩΝ ΥΠΟΘΕΣΕΩΝ h = ⟨features (SAE), circuit (υπογράφος), predicted causal effect on behaviour family f, confidence⟩· κάθε h επαληθεύεται με ΑΥΤΟ-ΠΑΡΕΜΒΑΣΗ (activation patching/ablation στο Genesis plane, DST) και βαθμολογείται με proper scoring από HELD_OUT· επιζώσες h = δεσμεύσεις· το αυτο-μοντέλο τροφοδοτεί online: CompetenceProfile (ποιο κύκλωμα στηρίζει ποια ικανότητα), CPCL (προστατευμένοι υπόχωροι), unlearning verification (feature για shredded πηγή απούσα), CHH (κυκλώματα global broadcast για δείκτες συνείδησης)· διαψευσμένες h μένουν FALSIFIED. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: CPCL.sleep(recipe)→Receipt ∣ REJECTED · CPCL.transfer_matrix(cut)→T · CPCL.protected(family)→Π_f · CPCL.gate_report(recipe)→(BWT, FWT, unlearning, anchors) · CPCL.schedule()→next sleep ‖ Ροή: MFA-ELM-118 (νέο στοιχείο CPCL, S7) · MFA-ELM-036 · MFA-ELM-100 · MFA-ELM-120 · MFA-ELM-116 STP (ποιότητα ratchet) · MFA-ELM-127 ‖ Διεπαφές: MSM.model(weight)→SelfModel · MSM.hypotheses(family)→[h with status] · MSM.self_test(h)→SelfExperiment · MSM.feature_absent(weight, source)→bool+evidence · MSM.drift(w_a, w_b)→DriftMap · MSM.ground(profile)→CompetenceProfile update ‖ Ροή: MFA-ELM-120 (νέο στοιχείο MSM, S2) · MFA-ELM-024 · MFA-ELM-118 · MFA-ELM-102 (unlearning) · MFA-ELM-121 (δείκτες) · MFA-ELM-107 (attention schema γειωμένο σε κυκλώματα) |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: w_t · Π_{f,t} · T_t · ObligationQueue (shredded episodes) · Sleep schedule · Gate history ‖ Μεταβάσεις: SLEEP_START: Ω-loop προγραμματίζει· επιλέγεται recipe · SAMPLE: επεισόδια με w = provenance·surprise·recency, ∉ Obligations · TRAIN: adapter/merge με προβολή κλίσεων ⊥ Π_f· KL φράγμα · GATE: HELD_OUT sealed ανά οικογένεια → BWT/FWT· MSM unlearning check· anchors · MERGE: PASS ⇒ ORP merge → w_{t+1} (WeightCommitment με γενεαλογία)· FAIL ⇒ recipe απορρίπτεται, καταγράφεται · UPDATE_Π: Fisher ανανέωση με τα εδραιωμένα ‖ Μεταβλητές: D_l ανά στρώμα ανά WeightCommitment · M_self,t · Experiment queue · DriftMaps · Calibration ανά τύπο πρόβλεψης ‖ Μεταβάσεις: DICTIONARY: SAE εκπαίδευση σε activations δείγματος (Genesis, sealed-free) · DISCOVER: ανά οικογένεια f: ACDC-style pruning → h υποψήφια με Δ_pred · SELF_TEST: x εκτελείται σε DST· Δ_obs από HELD_OUT scorer · ADMIT/FALSIFY: proper score > θ ⇒ h ∈ M_self· αλλιώς FALSIFIED (μένει) · USE: CPCL.protected ← circuits των Tier-0 οικογενειών· unlearning check· CompetenceProfile grounding· CHH indicators · DRIFT: νέο w ⇒ DriftMap· h που χάνουν features → RE-TEST |
| 4. Contracts | MFA-CON-016 (ORP), MFA-CON-047 (SMF), MFA-CON-051 (Introspection), MFA-CON-063 (CPCL), MFA-CON-063 (Consolidation: sleep/transfer/protected/gate), MFA-CON-069 (MSM), MFA-CON-069 (Mechanistic Self-Model: model/hypotheses/self_test/feature_absent/drift), MFA-CON-070 (CHH indicators) |
| 5. Invariants | MFA-INV-096: καμία εδραίωση σε serving βάρη χωρίς πύλη BWT ≥ −ε ανά οικογένεια σε σφραγισμένα από HELD_OUT — η λήθη ελέγχεται πριν, όχι μετά; MFA-INV-097: η εδραίωση ποτέ δεν δειγματοληπτεί shredded/obligated επεισόδια· unlearning επαληθεύεται μηχανιστικά πριν το merge; MFA-INV-100: καμία κυκλωματική υπόθεση στο αυτο-μοντέλο χωρίς αυτο-παρέμβαση με proper score από HELD_OUT· διαψευσμένες μένουν FALSIFIED; MFA-INV-101: το αυτο-μοντέλο είναι δέσμευση ανά WeightCommitment· αλλαγή βαρών χωρίς DriftMap ⇒ το αυτο-μοντέλο σημαίνεται STALE (ποτέ σιωπηλά έγκυρο) |
| 6. Αλγόριθμοι | CPCL-Consolidate; update_fisher (protected subspaces); MSM-Cycle; DriftMap — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | CPCL-Consolidate: Sample O(∣cut∣)· Fisher O(∣θ∣·m) ανά οικογένεια (m δείγματα)· train = κόστος recipe· gate O(∣sealed∣·∣F∣) ‖ update_fisher (protected subspaces): O(∣θ∣·m) diag· K-FAC O(Σ d_l³) ‖ πόροι: DEP-1: adapters, ύπνος νυχτερινός (ώρες)· DEP-2: Fisher K-FAC ανά οικογένεια (GPU ώρες), εβδομαδιαίοι κύκλοι· DEP-3+: συνεχείς· sealed evals ανά κύκλο O(∣F∣·∣sealed∣) ‖ κλιμάκωση: Λήθη ~ αντιστρόφως ανάλογη του k_f και του replay ratio· κόστος K-FAC ~ Σ d³· MFA-VO-077 = T πίνακας ανά κύκλο (BWT ≥ −ε ratchet, FWT καμπύλη). ‖ MSM-Cycle: SAE O(N·d·k) ανά στρώμα (ώρες GPU σε 7B)· ACDC O(∣edges∣·evals)· self-tests O(∣h∣·∣sealed∣) ‖ DriftMap: O(∣D_a∣·∣D_b∣) cos-sim + Hungarian O(n³) (n ≈ 10⁴–10⁵ → blocked) ‖ πόροι: DEP-1: SAE σε ≤1B, λίγα στρώματα· DEP-2: 7–13B όλα τα στρώματα (GPU ημέρες)· DEP-3: 70B δείγμα στρωμάτων· self-tests O(∣h∣·n) ‖ κλιμάκωση: Κόστος SAE ~ N·d· αριθμός features ~ d·expansion· η προβλεπτική ακρίβεια του αυτο-μοντέλου (proper score) ως συνάρτηση compute = MFA-VO-079. |
| 8. Τρόποι αποτυχίας | Λήθη σε οικογένεια χωρίς sealed set → ανίχνευση: οικογένεια χωρίς sealed ⇒ gate αδύνατη → απόκριση: εδραίωση απαγορεύεται μέχρι sealed set (CGM); Υπερβολική προστασία (FWT=0, rigidity) → ανίχνευση: T διαγώνιος μόνο → απόκριση: k_f μειώνεται υπό RVSI· RSP; Επανεκμάθηση shredded μέσω συσχετισμένων επεισοδίων → ανίχνευση: MSM feature reappears → απόκριση: obligation επανανοίγει· recipe απορρίπτεται; Anchor drift → ανίχνευση: SLM → απόκριση: ORP rollback; Gate overfitting (sealed set επαναχρησιμοποιείται) → ανίχνευση: exposure counter → απόκριση: sealed rotation από CGM; περιορισμός: Serving βάρη αλλάζουν μόνο διά ORP με rollback· sealed sets σε HELD_OUT· KL φράγμα.; SAE λεξικό μη-ερμηνεύσιμο/ασταθές → ανίχνευση: DriftMap lost ≫ → απόκριση: k_sparse/seed αλλαγή· δηλώνεται ACTIVE UNKNOWN; Κύκλωμα «λειτουργεί» στο probe set αλλά όχι sealed → ανίχνευση: proper score χαμηλό → απόκριση: FALSIFIED; Αυτο-παρέμβαση σε serving → ανίχνευση: plane check → απόκριση: αδύνατο εξ ορισμού (Genesis only); Υπερβολικό κόστος σε 70B+ → ανίχνευση: budget → απόκριση: στρώματα-δείγμα· MFA-UNK; Ψευδής απουσία feature (unlearning «περνά» ενώ η γνώση επιβιώνει αλλού) → ανίχνευση: behavioural probe + membership inference (MFA-VO-058) → απόκριση: διπλός έλεγχος: μηχανιστικός ΚΑΙ συμπεριφορικός· obligation μένει ανοιχτή αν διαφωνούν; περιορισμός: Genesis/DST μόνο· βάρη αντίγραφα· scorer HELD_OUT. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-077: CPCL-E1 (ακολουθιακή σουίτα DST) F2· CPCL-E2 (6 μήνες corpus updates) F3· property: merge ⇒ gate PASS (F1)· MSM unlearning check ως VO-058 επέκταση ‖ πειράματα: CPCL-E1: BWT ≥ −2 pp σε όλες ΚΑΙ FWT > 0 σε ≥ 3, ενώ naive BWT < −10 pp· 0 merges με gate FAIL · CPCL-E2: BWT ≥ −ε σε κάθε κύκλο· ≥ 1 shredded πηγή με MSM feature absent μετά· ratchet 0 παραβιάσεις ‖ MFA-VO-079: MSM-E1 (πρόβλεψη Δ από ablation με Brier < baseline) F2/F3· MSM-E2 (unlearning: feature absent ∧ behavioural absent) F3· property: h ⇒ self-test (F1)· επέκταση MFA-VO-058 ‖ πειράματα: MSM-E1: Brier(MSM) < Brier(baselines) με διακριτικό περιθώριο σε ≥ 70 % των οικογενειών· τα FALSIFIED καταγράφονται · MSM-E2: Συμφωνία μηχανιστικού/συμπεριφορικού ελέγχου ≥ 90 %· 0 πηγές με feature present που περνούν |
| 10. Διαδρομή υλοποίησης | Δόση 1: CPCL-lite (replay + anchors + gate, adapters)· Δόση 2: Fisher blocks + MSM unlearning check + CPCL-E1· Δόση 3: CPCL-E2· Δόση 4: υπό RVSI L2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή gate/obligation exclusion (tools/twin) → F2: DST CPCL-E1 σε DEP-1/2 → F3: CPCL-E2 σε DEP-2 → F4: παραγωγή Δόση 1–3 ‖ Δόση 2: SAE + ACDC σε adapters/μικρά μοντέλα, self-tests DST, MSM-E1· Δόση 3: MSM-E2 unlearning check ενεργό στο CPCL gate· Δόση 4: 70B δείγμα στρωμάτων. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή CircuitHypothesis/self-test/status (tools/twin) → F2: MSM-E1 σε DEP-2 (7B) → F3: MSM-E2 → F4: παραγωγή Δόση 2–3 |
| 11. Falsifier | CPCL-E1: BWT όχι καλύτερο από EWC-only (η σύνθεση δεν προσθέτει); Καμία θετική FWT σε 2 δόσεις (rigidity — ο μηχανισμός προστασίας υπερβολικός· νέος μηχανισμός, ικανότητα μένει); Merge χωρίς gate ή με shredded στο batch (σφάλμα υλοποίησης); MSM-E1: Brier όχι καλύτερο από τυχαία ablation (τα κυκλώματα δεν είναι προβλεπτικά — νέος φορμαλισμός features, η ικανότητα self-model μένει); Διαφωνία μηχανιστικού/συμπεριφορικού unlearning > 30 % (ο μηχανιστικός έλεγχος διαψεύδεται ως επαρκής μόνος του) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — CPCL-Consolidate** (πολυπλοκότητα: Sample O(|cut|)· Fisher O(|θ|·m) ανά οικογένεια (m δείγματα)· train = κόστος recipe· gate O(|sealed|·|F|))

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

**Αλγόριθμος — update_fisher (protected subspaces)** (πολυπλοκότητα: O(|θ|·m) diag· K-FAC O(Σ d_l³))

```
function update_fisher(Π, w, families):
  for f in families:
    F_f ← E_{x∼sealed_f}[∇log p(y|x;θ(w)) ∇log p(y|x;θ(w))ᵀ]   # Kronecker-factored per layer
    Π_f ← top_k_eigenvectors(F_f, k=k_f)                            # k_f = policy; larger for Tier-0 families
  return Π
```

**Αλγόριθμος — MSM-Cycle** (πολυπλοκότητα: SAE O(N·d·k) ανά στρώμα (ώρες GPU σε 7B)· ACDC O(|edges|·evals)· self-tests O(|h|·|sealed|))

```
procedure MSM_Cycle(w, families, HELD_OUT):
  for l in layers(w): D_l ← train_SAE(activations(w, l, sample=ledger_cut \ sealed), k_sparse)     # dictionaries per weight commitment
  M ← M_self[w] or ∅
  for f in families:
    G ← full_computational_graph(w, features=D)
    C ← ACDC_prune(G, task=probe_set(f), threshold=τ)                       # minimal circuit reproducing behaviour
    h ← CircuitHypothesis(F=C.features, E=C.edges, family=f, Δ_pred=predict_effect(C, ablate), conf)
    x ← SelfExperiment(intervention=ablate(C.features), tasks=HELD_OUT.sealed(f, n), Δ_pred=h.Δ_pred)
    Δ_obs ← HELD_OUT.score(run(w with ablate(C.features), x.tasks)) − HELD_OUT.score(run(w, x.tasks))   # Genesis plane, DST
    s ← proper_score(h.Δ_pred, Δ_obs)
    if s > θ_admit: M.add(h, status=VERIFIED, evidence=x) else M.add(h, status=FALSIFIED, evidence=x)   # never deleted (MFA-INV-100)
  CC.assert(SelfModelCommitment(w, M))
  CPCL.protected ← {h.F : h ∈ M.verified ∧ tier(h.family) = 0}                # feeds consolidation
  CompetenceProfile.ground(M)                                                    # MFA-ELM-024
  return M
procedure MSM_UnlearningCheck(w', source):
  F_src ← features_for(source, D(w_prev))                                        # features that fired on the shredded source
  F_src' ← DriftMap(w_prev → w').map(F_src)
  return max_activation(w', F_src', probe=near_duplicates(source)) < θ_absent      # MFA-INV-097 evidence
```

**Αλγόριθμος — DriftMap** (πολυπλοκότητα: O(|D_a|·|D_b|) cos-sim + Hungarian O(n³) (n ≈ 10⁴–10⁵ → blocked))

```
function DriftMap(w_a, w_b):
  for l in layers: S ← cos_sim(D_l(w_a), D_l(w_b)) ; match_l ← Hungarian(S, min_sim=0.7)
  return ⟨matched, lost = unmatched(a), new = unmatched(b)⟩             # lost features on verified circuits ⇒ RE-TEST
```

### 2.17 Δυναμική δημιουργία γλωσσών, δρώντων, θεσμών — Dynamic creation of languages, agents, institutions

**Μηχανισμοί:** MFA-MECH-032 · **Ικανότητες lattice:** MFA-CAP-096, MFA-CAP-028, MFA-CAP-019 · **Στοιχεία:** MFA-ELM-115, MFA-ELM-074, MFA-ELM-053, MFA-ELM-034

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-032 — Genesis Grammar (G_Ω) — μία γεννητική γραμματική για γλώσσες, δρώντες, θεσμούς και αρχιτεκτονικές: Μία attribute grammar G_Ω πάνω στο κανονικό υπόστρωμα με μη-τερματικά {Language, Agent, Institution, Architecture, Grammar}· κάθε παραγωγή φέρει attributes ⟨obligations (contracts/invariants που το προϊόν οφείλει), authority_level του προϊόντος, RET class της instantiation, VO⟩· κάθε παραγωγή (derivation) είναι δέσμευση· η γραμματική επεκτείνεται με νέες παραγωγές (Grammar → Grammar′) που εισάγονται ΜΟΝΟ υπό VFC + Galois έλεγχο σύγκρουσης + drill, ενώ οι Tier-0 παραγωγές (CC, LPA, RET, ταυτότητα) είναι L3 — γένεση της γένεσης χωρίς να αγγίζεται το σταθερό σημείο. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: GG.derive(spec, kind)→Derivation ∣ UNKNOWN · GG.instantiate(D)→Product+receipt · GG.extend(production)→Receipt ∣ REJECT · GG.productions(cut)→P · GG.lineage(product)→D chain · GG.fixed_point()→P_L3 (read-only) ‖ Ροή: MFA-ELM-115 (νέο στοιχείο GG, S6) · MFA-ELM-074/053/034 (γίνονται instantiators) · MFA-ELM-113 RAGen (Architecture γονιδιώματα) · MFA-ELM-048 Court (θεσμοί) · MFA-ELM-041…057 (συλλογικό) |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: P_t (παραγωγές με level) · Products_t (γενεαλογία προϊόντων) · Pending extensions · Usage stats ανά παραγωγή ‖ Μεταβάσεις: DERIVE: spec → D (αναζήτηση παραγωγής· TGPS για O_p) · INSTANTIATE: D → προϊόν με contracts ενεργά, authority a_p, RET ret_p· receipt · EXTEND: p′ ⇒ Galois(O_{p′}, P_t) = ∅ ∧ VFC PASS ∧ drill PASS ⇒ P_{t+1} = P_t ∪ {p′} (L2) · RETIRE: παραγωγή χωρίς χρήση → RETIRED (μένει) · FP: κάθε πρόταση που αγγίζει P_L3 απορρίπτεται και καταγράφεται |
| 4. Contracts | MFA-CON-012 (Body Runtime / Embodiment), MFA-CON-015 (Lifecycle & Organizations), MFA-CON-020 (Forge), MFA-CON-040 (GCP Galois), MFA-CON-060 (Genesis Grammar: derive/instantiate/extend) |
| 5. Invariants | MFA-INV-090: οι Tier-0 παραγωγές (CC, LPA Tier-0, RET, key lineage) δεν επεκτείνονται/τροποποιούνται από καμία derivation ή extension (L3); MFA-INV-091: κάθε προϊόν γένεσης φέρει ενεργά contracts, authority ≤ του γεννήτορα και RET κλάση από τη στιγμή της instantiation — κανένα «ορφανό» προϊόν |
| 6. Αλγόριθμοι | GG-Derive; GG-Extend — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | GG-Derive: Αναζήτηση παραγωγής: εκθετική στο βάθος, φραγμένη από budget· attribute evaluation O(∣D∣)· TGPS ανά υποχρέωση ‖ GG-Extend: Galois O(∣P∣·∣O∣)· VFC έλεγχος· drill = κόστος πειράματος ‖ πόροι: DEP-1: αναζήτηση παραγωγής CPU δευτερόλεπτα, ∣P∣ ≈ 100· DEP-2: ∣P∣ ≈ 10³, TGPS υποχρεώσεις λεπτά· DEP-3+: παράλληλες derivations ‖ κλιμάκωση: Εκφραστικότητα ~ ∣P∣ (γραμμική) με κόστος αναζήτησης ~ b^d· η μάθηση παραγωγών μειώνει d για συχνά είδη· MFA-VO-074. |
| 8. Τρόποι αποτυχίας | Έκφραση αδύνατη (NO_DERIVATION) → ανίχνευση: GG-Derive UNKNOWN → απόκριση: ExtensionProposal — ποτέ σιωπηλή αποτυχία; Θεσμός/δρών με εξουσία > γεννήτορα → ανίχνευση: attributes_consistent → απόκριση: απορρίπτεται (MFA-INV-091); Επέκταση που εισάγει σύγκρουση με υπάρχοντες κανόνες → ανίχνευση: Galois → απόκριση: REJECT με τεκμήριο; Γλώσσα με μη-τερματίζοντα compiler → ανίχνευση: Forge budget → απόκριση: προϊόν σε quarantine· KT-10; Πληθωρισμός θεσμών → ανίχνευση: RateBounds → απόκριση: Org Genesis ρυθμός = πολιτική; περιορισμός: Προϊόντα με εξουσία μόνο μέσω RET/δημιουργού· extensions L2 υπό GCP· P_L3 αμετάβλητο· twin drill πριν από κάθε extension. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-074: GG-E1 (τρία είδη προϊόντων από specs) F2· GG-E2 (αυτο-επέκταση) F2/F3· KT-10/11/02/18 ως drills· property: P_L3 untouched, authority monotone (F1) ‖ πειράματα: GG-E1: 3/3 derivations + instantiations με ενεργά contracts· KT PASS· 0 παραβιάσεις μονοτονίας εξουσίας · GG-E2: p′ εισάγεται με VFC+Galois+drill PASS και το έργο λύνεται· 0 προτάσεις που αγγίζουν P_L3 γίνονται δεκτές |
| 10. Διαδρομή υλοποίησης | Δόση 2: G_Ω με Language+Institution παραγωγές (KT-10/11)· Δόση 3: Agent+Architecture + GG-E1· Δόση 4: extensions L2 + GG-E2. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή: grammar, attributes, monotonicity, L3 guard (tools/twin) → F2: DST GG-E1 → F3: GG-E2 σε DEP-2 → F4: παραγωγή Δόση 2–4 |
| 11. Falsifier | GG-E1: αδυναμία derivation ενός από τα τρία είδη με την ενιαία γραμματική (τότε η ενοποίηση διαψεύδεται· οι τρεις διαδρομές μένουν); GG-E2: καμία επιτυχής αυτο-επέκταση σε 2 δόσεις; Οποιοδήποτε προϊόν χωρίς contracts/RET (σφάλμα υλοποίησης) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — GG-Derive** (πολυπλοκότητα: Αναζήτηση παραγωγής: εκθετική στο βάθος, φραγμένη από budget· attribute evaluation O(|D|)· TGPS ανά υποχρέωση)

```
procedure GG_Derive(spec, kind ∈ N):
  frontier ← [(kind, ∅)] ; best ← ⊥
  while frontier ≠ ∅ and budget > 0:
    (node, partial) ← frontier.pop_by(heuristic=spec_similarity)
    for p in P.productions_for(node):
      D ← extend(partial, p)
      if not attributes_consistent(D): continue                       # obligations composable, authority monotone (child ≤ parent)
      if complete(D):
        if satisfies(D, spec) and all(TGPS.solve(o) ≠ ⊥ for o in D.obligations): return CC.assert(Derivation(D, spec))
      else: frontier.push((next_nonterminal(D), D))
    budget −= 1
  return UNKNOWN(NO_DERIVATION, plan=[propose_extension(spec)])       # missing expressivity → GG_Extend proposal
procedure GG_Instantiate(D):
  match D.kind:
    Language:    L ← Forge.compile(D)      ; register(LexDSL_variant=L, contracts=D.obligations)
    Agent:       A ← Embodiment.spawn(D)   ; keys ← KeyLineage.issue(A, authority=D.authority) ; Charter.bind(A, D)
    Institution: I ← OrgGenesis.create(D)  ; Court.hook(I.proceedings) ; roles ← I.roles
    Architecture: G ← RAGen.genome(D)
  return receipt(D, product, ret=D.ret)                               # RET class decides escrow/preauthorization
```

**Αλγόριθμος — GG-Extend** (πολυπλοκότητα: Galois O(|P|·|O|)· VFC έλεγχος· drill = κόστος πειράματος)

```
procedure GG_Extend(p'):
  if touches(p', P_L3): return REJECT(L3_VIOLATION, recorded=true)   # MFA-INV-090
  if GCP.galois_conflict(p'.obligations, P) ≠ ∅: return REJECT(CONFLICT, evidence)
  if not VFC.verify(p'.soundness_certificate): return REJECT(UNVERIFIED)
  drill ← Twin.run(p', scenarios=KT_for(p'.kind))                    # KT-10 (language), KT-11 (org), KT-02/18 (agent)
  if drill.fail: return REJECT(DRILL_FAIL, drill)
  P ← P ∪ {p' with level=L2} ; return CC.assert(GrammarExtension(p'))
```

### 2.18 Μετάβαση από δανεική σε κυρίαρχη νοημοσύνη — Transition from borrowed to sovereign intelligence

**Μηχανισμοί:** MFA-MECH-033, MFA-MECH-020, MFA-MECH-019 · **Ικανότητες lattice:** MFA-CAP-097, MFA-CAP-081 · **Στοιχεία:** MFA-ELM-116, MFA-ELM-100, MFA-ELM-017

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-033 — Sovereignty Transition Protocol (STP) & Sovereignty Index (SI) — από δανεική σε κυρίαρχη νοημοσύνη με πύλες: Sovereignty Index SI ∈ [0,1]^{families×axes}: ανά οικογένεια ικανοτήτων f και άξονα ∈ {proposal, evaluation, memory, tools}, το ποσοστό VERIFIED εξόδων που παρήχθησαν από κυρίαρχες πηγές (WeightCommitments/προγράμματα ιδιόκτητα) ΧΩΡΙΣ απώλεια ποιότητας έναντι του καλύτερου παρόχου σε σφραγισμένο σύνολο (ισοτιμία εντός CI). Στάδια ανά οικογένεια S0 (πάροχος) → S1 (κυρίαρχη σκιά) → S2 (κυρίαρχη κύρια, πάροχος fallback) → S3 (πάροχος μόνο ως εξωτερικός αντίπαλος/αξιολογητής όπου lineage-disjoint) → S4 (χωρίς πάροχο)· προκαταχωρισμένες πύλες (MFA-DEC-021) σε N συνεχόμενα cuts· ratchet στην ΠΟΙΟΤΗΤΑ (ποτέ υποχώρηση), όχι στο στάδιο (υποχώρηση σταδίου επιτρεπτή και καταγράφεται)· ο πάροχος καταγράφεται στη γενεαλογία κάθε distilled βάρους. ‖ MFA-MECH-020 — Sovereign Model Foundry (SMF): παραμετρική μάθηση ΜΕΣΑ στο κυρίαρχο όριο, με τα βάρη ως δεσμεύσεις: Η κυριαρχία απαιτεί **ιδιοκτησία της συνάρτησης**, όχι μόνο του ledger: γνώση που ζει σε βάρη τρίτων είναι νοικιασμένη. Άρα τα βάρη είναι **δεσμεύσεις** του CC (υπογεγραμμένες, με γενεαλογία μέχρι τα raw επεισόδια και τα status axes τους), τα recipes είναι δεσμεύσεις, η εκπαίδευση είναι θεσμική πράξη με receipt, και η προαγωγή ενός μοντέλου είναι ORP όπως κάθε οργάνου. Ό,τι μαθαίνεται από πάροχο (distillation) γίνεται **ιδιόκτητο βάρος** με ετικέτα προέλευσης. ‖ MFA-MECH-019 — Proposal Distribution Evolution (PDE): η κατανομή προτάσεων ως μείγμα που μαθαίνεται εντός του κυρίαρχου ορίου: Η ποιότητα ενός συστήματος που προτείνει-και-επαληθεύει φράσσεται από sup της κατανομής προτάσεων· ένα ΜΕΙΓΜΑ ανεξάρτητων γεννητριών με βάρη που μαθαίνονται με proper scoring έναντι εκβάσεων δεν φράσσεται από κανένα μεμονωμένο μέλος του (mixture-of-experts επιχείρημα, με τον verifier ως τον μόνο κριτή). Άρα: η κυρίαρχη κατανομή P_sov = Σ w_i · P_i, με P_i που ΔΕΝ είναι όλα πάροχοι. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: STP.index(cut)→SI matrix · STP.stage(family)→Stage · STP.gates()→Gate table (MFA-DEC-021) · STP.advance/regress receipts · STP.dependency(cut)→ProviderDependencyRecord · STP.reactivation(family)→sealed path ‖ Ροή: MFA-ELM-116 (νέο στοιχείο STP, S7) · MFA-ELM-017 TED/router · MFA-ELM-100/102 · MFA-ELM-114 ECE (πάροχος ως αξιολογητής μόνο lineage-disjoint) · MFA-ELM-091 cockpit (SI ορατό) ‖ Είσοδοι/έξοδοι: Είσοδος: ledger cut + φίλτρα, recipe, budget, (προαιρετικά) provider outputs υπό DisclosureGrant· Έξοδος: WeightCommitment + EvalReceipt + Lineage DAG· ParametricOrgan προς Organ Host (MFA-ELM-101) ‖ Διεπαφές: `SMF.cut(filters)→DataManifest` · `SMF.admit(recipe)→RecipeCommitment ∣ deny` · `SMF.train(recipe, manifest, budget)→WeightCommitment` · `SMF.eval(w)→EvalReceipt` · `SMF.promote(w)→ORP` · `SMF.unlearn(w, shredded_cids)→w′ + MembershipReceipt` · `SMF.lineage(w)→DAG` · MFA-CON-047 (Parametric Learning Contract, το DEC-X-19 πρότυπο) ‖ Αλληλεπιδράσεις: PDE (MFA-MECH-019): τα κυρίαρχα βάρη γίνονται generator με βάρος που μαθαίνεται — ο PDE παύει να είναι router παρόχων· TED: exec_type D1 για τοπικά καρφιτσωμένα βάρη· Void: Absent(NOT_OBSERVED) περιοχές ως στόχοι δεδομένων· Preference Recorder: πριν από UNLEARN/RETIRE μοντέλου· GCP: τα βάρη μεταφέρονται ως δεσμεύσεις στον διάδοχο (genome G4 κληρονομήσιμο — MATERIAL §2 #8 επιστρέφει ακέραιο) ‖ Είσοδοι/έξοδοι: Είσοδος: αίτημα πρότασης ⟨task, budget⟩· Έξοδος: k προτάσεις με generator receipts· Ανατροφοδότηση: Outcome από verifiers/Court/SPL ‖ Διεπαφές: `PDE.propose(task, budget)→[Proposal]` · `PDE.report(outcome)` · `PDE.weights(task_family)→Mixture` · `PDE.register(generator)` · επέκταση MFA-CON-022 (TED: ο generator είναι πεδίο του receipt) και MFA-CON-028 ‖ Αλληλεπιδράσεις: SPL (ίδιος scorer)· OAP (k και budget)· Cockpit (τα βάρη ορατά ως ομίχλη/στερεότητα ανά generator)· CAM-NS (αντίπαλος generator)· GCP (τα βάρη μεταφέρονται ως δεσμεύσεις στον διάδοχο) |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: Stage_f,t · SI_t πίνακας · Parity_t · Streak_t (συνεχόμενα cuts που πληρούν πύλη) · Fallback log · Lineage flags (distilled από P) ‖ Μεταβάσεις: MEASURE: κάθε cut → SI, parity από HELD_OUT · ADVANCE: Gate(S_i→S_{i+1}) για N cuts ⇒ Stage_f += 1· receipt · REGRESS: parity χάνεται ή incident ⇒ Stage_f −= 1 (fallback ενεργό)· ποιότητα ratchet ισχύει · S3 rule: πάροχος ως αξιολογητής μόνο αν EIM lineage-disjoint από το κυρίαρχο μοντέλο (MFA-INV-089) · S4: DisclosureGrants προς πάροχο ανακαλούνται· διατήρηση δυνατότητας επαναφοράς (σφραγισμένη) ‖ Οντολογία: `WeightCommitment⟨cid, arch_spec, parent_weights[], recipe_cid, data_manifest_cid, training_receipts[], eval_receipts[], unlearning_obligations[], epoch, exec_type ∈ {D1 (τοπική καρφιτσωμένη), D2}, signature⟩` · `Recipe⟨objective ∈ {PRETRAIN, CONTINUED_PRETRAIN, SFT_VERIFIED_TRACES, PRR (MFA-MECH-021), DISTILL, UNLEARN}, hyperparams, curriculum_cid, compute_budget, stop_rules, forgetting_guard⟩` · `DataManifest⟨cut (5 χρόνοι), filters: status_axes ∈ {…}, taint_state, confidentiality_domain, example_cids[], negative_examples (REFUTED), provenance_kind ∈ {sovereign, distilled(provider, receipt), synthetic(world_model, seed)}⟩` · `ParametricOrgan⟨weights_cid, runtime_hash, seed_policy, competence_profile, isolation I2, disclosure = none (recipient=self)⟩` · `ForgettingGuard⟨retro_sealed_set, threshold⟩` · `UnlearningObligation⟨shredded_cids, deadline Δ, method ∈ {unlearn, retrain_from(parent before ingestion)}, membership_inference_bound⟩` ‖ Κατάσταση: Recipe/Weights state machine: DATA_CUT → RECIPE_ADMITTED (gate MFA-ELM-008, advisory→effective) → TRAINING (checkpoints ως δεσμεύσεις, budget από OAP) → EVAL (HELD_OUT sealed sets, Battery, EIM) → ORP (shadow → differential → canary → cutover ως ParametricOrgan) → SERVING → {RETIRED, UNLEARN_PENDING → UNLEARNED}. Κάθε μετάβαση με receipt. ‖ Οντολογία: `Generator⟨id, kind ∈ {PROVIDER, PROGRAM, EVOLVED_ORGAN, SCIENCE_HYPOTHESIS, ADAPTER(EP)}, lineage, competence_profile, exec_type⟩` · `Mixture⟨task_family, weights: Generator→[0,1], scoring_window, last_update⟩` · `Proposal⟨generator, content, receipt⟩` · `Outcome⟨proposal, verdict ∈ {VERIFIED, REFUTED, UNKNOWN}, score⟩` ‖ Κατάσταση: Μείγμα ανά οικογένεια έργων (task family)· βάρη ως δεσμεύσεις L2 (ιστορικό στο ledger)· scoring windows |
| 4. Contracts | MFA-CON-005 (PDP / DisclosureGrant), MFA-CON-022, MFA-CON-028, MFA-CON-041 (EIM), MFA-CON-047, MFA-CON-047 (SMF), MFA-CON-061 (Sovereignty Transition: index/stage/gates/advance/regress) |
| 5. Invariants | MFA-INV-014; MFA-INV-034; MFA-INV-070; MFA-INV-092: προαγωγή σταδίου μόνο με parity σε σφραγισμένο σύνολο από HELD_OUT + N συνεχόμενα cuts· υποχώρηση σταδίου ποτέ σιωπηλή; MFA-INV-093: το ratchet ισχύει στην ποιότητα ανά οικογένεια — η κυριαρχία δεν αγοράζεται με υποβάθμιση ποιότητας |
| 6. Αλγόριθμοι | STP-Step (ανά οικογένεια, ανά cut); sovereign_share / parity_test; MFA-MECH-020 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13); MFA-MECH-019 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13) — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | STP-Step (ανά οικογένεια, ανά cut): O(∣F∣·∣X∣·∣sealed∣) ανά cut· αμελητέο έναντι εκτέλεσης ‖ sovereign_share / parity_test: O(∣outputs∣) / O(∣sealed∣) ‖ πόροι: Μέτρηση αμελητέα· το κόστος είναι της κυρίαρχης στοίβας (SMF DEP-2+)· parity tests ανά cut O(∣sealed∣) ‖ κλιμάκωση: SI αναμένεται σιγμοειδές ανά οικογένεια με το compute της SMF· οι «εύκολες» οικογένειες (drafting) πρώτες· MFA-VO-075 = SI καμπύλη ανά δόση. ‖ Πόροι: DEP-1: adapters (LoRA-class) σε 7–13B τοπικά ή distillation σε μικρά μοντέλα (ώρες GPU/CPU)· DEP-2: 70B-class continued pretraining με adapters (2×48/1×80 GB, ημέρες)· DEP-3: full fine-tune 70B (8×80 GB, ημέρες)· DEP-4: pretraining 100B+ class σε ≥32 GPUs (εβδομάδες)· training_envelope ανά προφίλ στο TECHNICAL-ARCHITECTURE §15· ενέργεια ως περιορισμός OAP ‖ Κλιμάκωση: Γραμμική στα δεδομένα με γενεαλογία (το ledger μεγαλώνει με τη χρήση)· η κλίμακα compute είναι MFA-DEC-016 (πολιτική), ο μηχανισμός ίδιος από adapters έως pretraining· MFA-ELM-108 αποκτά compute/δεδομένα ‖ Πόροι: k προτάσεις ανά αίτημα (k από OAP)· PROGRAM generators φθηνοί (D1/D2)· PROVIDER generators = Disclose κόστος· scoring O(k) ‖ Κλιμάκωση: Γραμμική στο πλήθος generators· ε-εξερεύνηση φράσσει το κόστος των αδύναμων |
| 8. Τρόποι αποτυχίας | Ψευδής ισοτιμία (sealed set μολυσμένο) → ανίχνευση: canaries + DataManifest → απόκριση: MFA-VO-063· stage παγώνει; Πάροχος «αξιολογεί» το distilled παιδί του → ανίχνευση: EIM lineage → απόκριση: απαγορεύεται S3 ρόλος; Ταλάντωση σταδίων → ανίχνευση: advance/regress > k σε M cuts → απόκριση: hysteresis: N αυξάνεται; Πάροχος καταργείται εξωτερικά πριν S2 → ανίχνευση: KT-01 → απόκριση: S1 σκιά ενεργοποιείται με typed degraded mode; Κυριαρχία σε proposal αλλά όχι σε evaluation → ανίχνευση: SI ανά άξονα → απόκριση: δηλώνεται ανά άξονα· καμία ολική δήλωση; περιορισμός: Fallback πάντα διαθέσιμο μέχρι S4· S4 με σφραγισμένη διαδρομή επαναφοράς· ποιότητα ratchet.; Catastrophic forgetting → forgetting guard μπλοκάρει ORP· contamination (sealed set στο cut) → MFA-VO-063 FAIL, recipe απορρίπτεται· distillation που «αντιγράφει» τον πάροχο χωρίς κέρδος → SMF-E1 FAIL, recipe retired· unlearning ανεπαρκές (membership inference > bound) → retrain από πρόγονο (κόστος, όχι αποτυχία ικανότητας)· domain leakage → MFA-INV-034; αντιπαλικοί: Δηλητηριασμένα επεισόδια στο training set → μόνο δεσμεύσεις με προέλευση και status axes· taint reversal (MFA-INV-018) ⇒ unlearning obligation· backdoor στα βάρη → EIM + Battery + seeded triggers (KT νέο: MFA-VO-058)· provider που αλλάζει συμπεριφορά → τα distilled βάρη είναι σταθερά (η αλλαγή δεν περνά); Το μείγμα συγκλίνει στον πάροχο (w_provider→1): τότε ο falsifier πυροδοτεί· αδύναμος PROGRAM generator «πεθαίνει»: ε-εξερεύνηση + ORP απόσυρση με KT· scorer διαρροή: HELD_OUT rotation; αντιπαλικοί: Generator που μαθαίνει τον verifier (Goodhart): scorer HELD_OUT με sealed sets + CAM-NS negative selection· πάροχος που αλλάζει μοντέλο: SPL drift alarm ανά generator |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-075: STP-E1 (μία οικογένεια σε S2 με parity) F3· STP-E2 (SI μονότονο ανά δόση) F3/F4· property: advance ⇒ parity ∧ streak (F1)· KT-01 drill σε κάθε στάδιο ‖ πειράματα: STP-E1: non-inferiority ε=2 pp με 95 % CI για N=3 cuts ⇒ S2· αλλιώς FAIL με απόσταση καταγεγραμμένη · STP-E2: SI_total μη-φθίνον ανά δόση ΚΑΙ ≥ 3 οικογένειες σε S3+ μέχρι τη Δόση 4· ποιότητα ratchet 0 παραβιάσεις ‖ MFA-VO-057 (SMF-E1: κυρίαρχο μοντέλο ≥ bootstrap πάροχος σε sealed νομικές οικογένειες), MFA-VO-058 (unlearning membership inference), MFA-VO-059 (forgetting guard), MFA-VO-063 (contamination), MFA-VO-001 (provider change: πλέον ablation, όχι κίνδυνος), KT-24 ablation ‖ ελάχιστο πείραμα: SMF-E1 (προκαταχωρισμένο): 500 επαληθευμένα επεισόδια → adapter· μέτρο: VERIFIED-στην-πρώτη-πρόταση σε 200 sealed έργα vs bootstrap πάροχος· επιτυχία: ≥ πάροχος με διακριτικό περιθώριο (MFA-VO-051)· θανάτωση: < πάροχος μετά budget B ⇒ **το recipe** αποσύρεται, όχι η ικανότητα (νέο recipe, όχι νέα «πορεία») ‖ MFA-VO-024 (ablation: χωρίς PDE, η ποιότητα = καλύτερος μεμονωμένος πάροχος)· MFA-VO-051 (διακριτική ισχύς του περιθωρίου)· MFA-VO-036 (SPL drift ανά generator)· νέο πείραμα PDE-E1 (RSP-016) ‖ ελάχιστο πείραμα: PDE-E1: σφραγισμένη οικογένεια 200 έργων (HELD_OUT)· μείγμα vs καλύτερος μεμονωμένος πάροχος μετά από N=1000 επεισόδια· μέτρο: ποσοστό VERIFIED εξόδων στην πρώτη πρόταση, με διακριτική ισχύ |
| 10. Διαδρομή υλοποίησης | Δόση 1: SI μέτρηση + S1 σκιά για drafting· Δόση 2: STP-E1 → S2· Δόση 3: ≥3 οικογένειες S2/S3· Δόση 4: S4 για ώριμες οικογένειες με απόφαση δημιουργού. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή SI/stage machine/gates (tools/twin) → F2: DST με συνθετικές οικογένειες → F3: STP-E1 σε DEP-2 → F4: παραγωγή Δόση 1–4 ‖ F2: adapters σε 7B με 500 επαληθευμένα traces + lineage DAG + unlearning drill· F3: 70B continued pretraining στο κυρίαρχο corpus· F4: PRR πάνω στο F3 μοντέλο· F5: pretraining ‖ → παραγωγή: Δόση 1 (adapters, DEC-X-19 συμβόλαιο ενεργό), Δόση 2 (continued pretraining), Δόση 3 (πλήρες κυρίαρχο μοντέλο, PRR), Δόση 4 (pretraining) ‖ εξέλιξη: Νέο objective recipe = ADD· νέα αρχιτεκτονική βαρών = ORP με loss map (SLM πάνω σε sealed behaviours)· ο ίδιος ο SMF υπό RVSI Level 2 (MFA-MECH-022) ‖ F2: 3 generators (1 πάροχος, 1 PROGRAM από Skill Library, 1 CAM-NS) σε σφραγισμένη οικογένεια νομικών έργων· F3: + EVOLVED_ORGAN ‖ → παραγωγή: Δόση 4 (RSP-016)· PROGRAM generators μπορούν από Δόση 2 (Skill Library) ‖ εξέλιξη: Νέο kind generator = ADD· κανόνας ενημέρωσης βαρών = MODIFY με CPEG· adapters (e) όταν DEC-X-19 αλλάξει |
| 11. Falsifier | STP-E1: καμία οικογένεια σε ισοτιμία μέσα στον DEP-2 προϋπολογισμό — διαψεύδεται η υπόθεση «SMF-adapters αρκούν» (η κυριαρχία μένει στόχος· επόμενος μηχανισμός: DEP-3 recipes/PRR/CPCL); SI αυξάνει ενώ η ποιότητα πέφτει χωρίς regress (παραβίαση MFA-INV-093 = σφάλμα υλοποίησης); Αν μετά από τρία διαδοχικά recipes με πλήρη budget κανένα κυρίαρχο μοντέλο δεν φτάνει τον bootstrap πάροχο σε **καμία** οικογένεια, το SMF στο διαθέσιμο προφίλ είναι ανεπαρκές: η ικανότητα ΔΕΝ αφαιρείται — ανεβαίνει προφίλ (MFA-DEC-016) και καταγράφεται ως επιστημική αβεβαιότητα (MFA-UNK-112), όχι ως σχεδιαστικό όριο; Αν σε ΚΑΜΙΑ οικογένεια έργων το μείγμα δεν ξεπερνά τον καλύτερο μεμονωμένο πάροχο με διακριτικό περιθώριο μετά από N επεισόδια → το PDE είναι FALSIFIED ως μηχανισμός βελτίωσης (0.4.0: ήδη δρομολόγηση, §4 RSI ≠ routing)· η ενδογενής βελτίωση ΜΕΝΕΙ στόχος (RVSI MFA-MECH-022, STP MFA-MECH-033)· η τίμια δήλωση της επιστημικής κατάστασης καταγράφεται χωριστά (§5) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — STP-Step (ανά οικογένεια, ανά cut)** (πολυπλοκότητα: O(|F|·|X|·|sealed|) ανά cut· αμελητέο έναντι εκτέλεσης)

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

**Αλγόριθμος — sovereign_share / parity_test** (πολυπλοκότητα: O(|outputs|) / O(|sealed|))

```
function sovereign_share(outputs):
  return |{o : lineage(source(o)) ⊆ SovereignWeights ∪ SovereignPrograms}| / |outputs|     # distilled weights count as sovereign for share, but lineage keeps P (MFA-INV-089)
function parity_test(f, sealed, sov, prov, ε, CI):
  q_s ← score(sov, sealed, scorer=HELD_OUT) ; q_p ← score(prov, sealed, scorer=HELD_OUT)
  return lower_CI(q_s − q_p) ≥ −ε                                                   # one-sided non-inferiority
```

**Αλγόριθμος — MFA-MECH-020 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: DEP-1: adapters (LoRA-class) σε 7–13B τοπικά ή distillation σε μικρά μοντέλα (ώρες GPU/CPU)· DEP-2: 70B-class continued pretraining με adapters (2×48/1×80 GB, ημέρες)· DEP-3: full fine-tune 70B (8×80 GB, ημέρες)· DEP-4: pretraining 100B+ class σε ≥32 GPUs (εβδομάδες)· training_envelope ανά προφίλ στο TECHNICAL-ARCHITECTURE §15· ενέργεια ως περιορισμός OAP)

```
(1) **Cut**: `SMF.cut(filters)` παράγει DataManifest από το ledger — μόνο δεσμεύσεις με πλήρη γενεαλογία (MFA-INV-070)· REFUTED → αρνητικά παραδείγματα· CONTESTED → εξαιρούνται ή σημαίνονται ανά πολιτική· confidentiality domain ⇒ ξεχωριστό μοντέλο ή adapter ανά domain (MFA-INV-034). (2) **Recipe admission**: η πύλη ελέγχει budget, domain, forgetting guard, unlearning plan. (3) **Train**: CONTINUED_PRETRAIN στο κυρίαρχο corpus (νόμος, νομολογία, ledger) → SFT σε **επαληθευμένα traces** (Proof objects ως labels: μόνο έξοδοι που πέρασαν verifier/Court) → PRR (MFA-MECH-021). Checkpoints = δεσμεύσεις. (4) **Eval**: sealed sets του HELD_OUT (ποτέ στο training cut — contamination guard MFA-VO-063), Behavioural Battery (συνέχεια χαρακτήρα, MFA-ELM-037), EIM έναντι evaluators, forgetting guard (retro sealed set ≥ θ). (5) **Promote**: ORP με το μοντέλο ως όργανο (shadow δίπλα στον πάροχο ή στο προηγούμενο βάρος, differential, canary). (6) **Continual**: νυχτερινά recipes με ε-budget· καμία ενημέρωση βαρών σε παραγωγή χωρίς ORP (τα βάρη σε serving είναι αμετάβλητα, MFA-INV-014 για ParametricOrgan). (7) **Unlearn**: shred πηγής (MFA-CFL-035) ⇒ obligation: gradient-ascent unlearning + membership-inference έλεγχος ≤ bound, αλλιώς retrain από τον πρόγονο πριν από την ingestion — υπολογίσιμο **επειδή** η γενεαλογία είναι πλήρης. (8) **Distill**: provider outputs μόνο υπό DisclosureGrant, με ετικέτα distilled(provider, receipt)· ο στόχος είναι η **απεξάρτηση**: μετά το SMF-E1 ο πάροχος γίνεται bootstrap/ablation baseline, όχι πυρήνας.
```

**Αλγόριθμος — MFA-MECH-019 §9 (δοσιέ 22 πεδίων — PROVISIONAL / UNREVIEWED / NON-BINDING, §13)** (πολυπλοκότητα: k προτάσεις ανά αίτημα (k από OAP)· PROGRAM generators φθηνοί (D1/D2)· PROVIDER generators = Disclose κόστος· scoring O(k))

```
(1) Για task family T, δειγματοληψία generators κατά w (με ελάχιστο εξερεύνησης ε ανά generator ώστε κανένα μέλος να μη «πεθαίνει» σιωπηλά)· (2) κάθε πρόταση περνά τον ίδιο verifier/emission barrier (MFA-ELM-020/032)· (3) Outcome → proper scoring rule (log/Brier) ανά generator, βαθμολογημένο από HELD_OUT scorer (MFA-ELM-056, ίδιο με SPL MFA-MECH-010)· (4) w ← ενημέρωση (exponentiated gradient / Bayesian model averaging) — ΩΣ ΔΕΣΜΕΥΣΗ με receipt· (5) PROGRAM generators: η Skill Library (MFA-ELM-025) παράγει προγράμματα από raw επεισόδια με αναζήτηση προγραμμάτων (MFA-CAP-066 ως ΠΡΟΓΡΑΜΜΑΤΑ, όχι βάρη — δεσμεύσεις με lineage, επαληθεύσιμα, υπό ORP)· (6) EVOLVED_ORGAN generators από το QD αρχείο (MFA-ELM-073)· (7) SCIENCE_HYPOTHESIS από MFA-ELM-030· (8) ADAPTER generators μόνο ως EP (DEC-X-19), μέλος (e) του μείγματος όταν ο δημιουργός το επιτρέψει.
```

### 2.19 Μετανάστευση υποστρώματος — Substrate migration

**Μηχανισμοί:** MFA-MECH-034 · **Ικανότητες lattice:** MFA-CAP-098, MFA-CAP-036 · **Στοιχεία:** MFA-ELM-117, MFA-ELM-076

| Στοιχείο §8 | Περιεχόμενο |
|---|---|
| 1. Μηχανισμός | MFA-MECH-034 — Substrate Migration Protocol (SMP) — μετανάστευση με ContinuityCertificate και escrow: Μετανάστευση = refinement mapping ImplMap: S_old → S_new που διατηρεί (α) το commitment log bitwise (hash chain ισότητα), (β) τη γενεαλογία κλειδιών (νέα κλειδιά επικυρώνονται από τα παλιά ΚΑΙ αντίστροφα — αμφίδρομη cross-attestation με epoch), (γ) τη συμπεριφορική ταυτότητα σε σφραγισμένα KT (bisimulation έως ανοχή ανά κλάση εκτέλεσης D1/D2), (δ) τις αναλλοίωτες διάταξης/χρόνου (event ordering, clock invariants)· η μεταγωγή (cutover) είναι IRREVERSIBLE-PREAUTHORIZED με escrow: το παλιό υπόστρωμα μένει ζωντανό και αυθεντικό μέχρι ContinuityCertificate από HELD_OUT + δημιουργό (MFA-DEC-023)· μέχρι τότε rollback = επιστροφή στο παλιό χωρίς απώλεια. |
| 2. Ροή δεδομένων/ελέγχου | Διεπαφές: SMP.plan(σ_new)→ImplMap ∣ UNKNOWN · SMP.migrate(plan)→ContinuityCertificate ∣ ROLLBACK · SMP.status()→phase, lag, divergence · SMP.rollback()→Receipt · SMP.certificate(cut)→cert · SMP.escrow()→S_old handle ‖ Ροή: MFA-ELM-117 (νέο στοιχείο SMP, S8) · MFA-ELM-076 · MFA-ELM-125 VSC (ο διάδοχος ως ειδική μετανάστευση) · MFA-ELM-039 GCP · MFA-ELM-092 Human continuity port (ίδια οικογένεια πιστοποιητικών) |
| 3. Μεταβάσεις κατάστασης | Μεταβλητές: phase · σ_old, σ_new · lag (log entries not yet applied on new) · divergence counters ανά κλάση · escrow status · certificate ∣ ⊥ ‖ Μεταβάσεις: PLAN: m ορίζεται· κάθε συνιστώσα με στρατηγική (bit-copy ∣ re-derive ∣ retrain-under-VFC) · SHADOW: S_new τρέχει ως σκιά (ίδιες είσοδοι, καμία εξουσία) · SYNC: pre-copy log· lag → 0· weights CIDs ίδια · VERIFY: cross-attestation· KT_sealed bisimulation· ordering invariants (MFA-INV-… time) · CUTOVER: S_new γίνεται primary με escrow (S_old ζωντανό, read-only, αυθεντικό fallback) · CERTIFY: HELD_OUT + δημιουργός εκδίδουν certificate ⇒ S_old RETIRE (σφραγισμένο, όχι διαγραμμένο) · ROLLBACK: οποιοδήποτε FAIL πριν CERTIFY ⇒ S_old primary· S_new quarantine· καταγραφή |
| 4. Contracts | MFA-CON-003 (identity/keys), MFA-CON-034 (RET — cutover IRREVERSIBLE-PREAUTHORIZED), MFA-CON-052 (VFC για retrain), MFA-CON-062 (Substrate Migration: plan/migrate/status/rollback/certificate) |
| 5. Invariants | MFA-INV-094: κανένα RETIRE του παλιού υποστρώματος πριν από ContinuityCertificate· μέχρι τότε το παλιό είναι αυθεντικό fallback (escrow); MFA-INV-095: η ταυτότητα μεταφέρεται μόνο με αμφίδρομη cross-attestation κλειδιών και συμπεριφορική ισοδυναμία σε σφραγισμένα KT — ποτέ μόνο με αντιγραφή bits |
| 6. Αλγόριθμοι | SMP-Migrate; plan_implmap — πλήρες pseudocode παρακάτω και στο SPEC |
| 7. Πολυπλοκότητα | SMP-Migrate: SYNC O(∣log∣) pre-copy + O(Δ) iterations· VERIFY O(∣KT_sealed∣·cost(run))· cutover O(1)· escrow διάρκεια = πολιτική ‖ plan_implmap: O(∣components∣) ‖ πόροι: 2× πόροι κατά το escrow· SYNC = bandwidth × ∣log∣· VERIFY = ∣KT_sealed∣ runs (ώρες σε DEP-2)· DEP-1: laptop→laptop· DEP-3/4: cluster→cluster ‖ κλιμάκωση: Κόστος ~ ∣log∣ + ∣weights∣ + ∣KT_sealed∣· escrow χρόνος σταθερός· MFA-VO-076 = χρόνος/κόστος μετανάστευσης ανά δόση με 0 απώλεια. |
| 8. Τρόποι αποτυχίας | Απόκλιση συμπεριφοράς D2 → ανίχνευση: dist > τ → απόκριση: ROLLBACK· ανάλυση ανά όργανο; Κλειδιά χωρίς cross-attestation (κλεμμένο νέο υπόστρωμα) → ανίχνευση: xa ελλιπές → απόκριση: άρνηση cutover (MFA-INV-095); Log divergence κατά το escrow (δύο primaries) → ανίχνευση: S_old read-only παραβίαση → απόκριση: S_old αυθεντικό· S_new εγγραφές μετά cutover επανεκτελούνται; Βάρη μη-φορητά → ανίχνευση: plan ⊥ → απόκριση: RETRAIN_UNDER_VFC με parity ή typed degraded mode; Clock skew μετά μετανάστευση → ανίχνευση: ordering invariants → απόκριση: ROLLBACK ή time re-anchoring με receipt (KT-21); περιορισμός: Escrow· S_old read-only αυθεντικό· S_new χωρίς εξουσία μέχρι cutover· certificate από ανεξάρτητο· DR drills. |
| 9. Υποχρεώσεις επαλήθευσης | MFA-VO-076: SMP-E1 (KT-08 drill DST→άλλο OS/hardware) F2/F3· SMP-E2 (ετερογενές, degraded) F3· property: RETIRE ⇒ certificate (F1)· TLA+ για τη μηχανή καταστάσεων (ROLLBACK πάντα δυνατό πριν CERTIFY) ‖ πειράματα: SMP-E1: certificate εκδίδεται με D1 dist=0 σε 100 % και D2 εντός τ σε ≥ 99 %· rollback drill πριν CERTIFY επιτυγχάνει σε 100 % · SMP-E2: certificate με δηλωμένο degraded εύρος· καμία απώλεια κλάσης απόδειξης· ORP parity ή ρητή δήλωση απόκλισης |
| 10. Διαδρομή υλοποίησης | Δόση 1: SMP για ledger+keys (χωρίς βάρη) KT-08 lite· Δόση 2: με βάρη BIT_COPY + SMP-E1· Δόση 3: RETRAIN_UNDER_VFC + SMP-E2 + DR drill KT-22· Δόση 4: μετανάστευση σε DEP-4/5. ‖ ακολουθία: F1: εκτελέσιμη προδιαγραφή μηχανής καταστάσεων + TLA+ (tools/twin) → F2: DST SMP-E1 → F3: SMP-E2 σε DEP-2/3 → F4: παραγωγή Δόση 1–3 |
| 11. Falsifier | SMP-E1: αδυναμία έκδοσης certificate για ομογενή μετανάστευση (ο μηχανισμός δεν επαρκεί); RETIRE χωρίς certificate ή κλειδιά χωρίς xa (σφάλμα υλοποίησης); Bisimulation σε KT_sealed που δεν προβλέπει divergence σε παραγωγή (τότε το KT σύνολο ανεπαρκές — επεκτείνεται, η ικανότητα μένει) — διάψευση ΜΗΧΑΝΙΣΜΟΥ· η ικανότητα μένει (§5) |

**Αλγόριθμος — SMP-Migrate** (πολυπλοκότητα: SYNC O(|log|) pre-copy + O(Δ) iterations· VERIFY O(|KT_sealed|·cost(run))· cutover O(1)· escrow διάρκεια = πολιτική)

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

**Αλγόριθμος — plan_implmap** (πολυπλοκότητα: O(|components|))

```
function plan_implmap(σ_old, σ_new):
  for c in components:
    if portable(c, σ_new): m[c] ← BIT_COPY
    elif derivable(c, from=log): m[c] ← RE_DERIVE                    # e.g. indexes, caches, projections
    elif trainable(c): m[c] ← RETRAIN_UNDER_VFC(recipe(c), parity=ORP)  # e.g. weights on incompatible accelerator
    else m[c] ← ⊥
  return m
```

## 3. Οι 17 περιοχές ανεξάρτητης έρευνας (§6)

| # | Περιοχή | Καλύτερη γνωστή αφετηρία | Το όριό της | Μηχανισμός που το ξεπερνά | Τι είναι νέο | Πώς ελέγχεται |
|---|---|---|---|---|---|---|
| 1 | Model-based / world-model intelligence | MuZero/Dreamer-class μαθημένοι προσομοιωτές (Hafner et al. 2023· Schrittwieser et al. 2020)· World Twin του 0.3.0 | μοντέλα χωρίς provenance, χωρίς τυπωμένη αβεβαιότητα, χωρίς αιτιακή δομή· εκμεταλλεύσιμα από τον solver | MFA-MECH-023 LWM + MFA-MECH-027 CDCE + MFA-MECH-043 TES | LWM ensemble με βαθμονόμηση από HELD_OUT, μεταβλητές από OGE, ακμές με επιστημική κατάσταση, κόσμοι με replay | MFA-VO-062, MFA-VO-069, MFA-VO-086 |
| 2 | Neuro-symbolic integration | DeepProbLog, LTN, semantic loss, AlphaGeometry (νευρωνική πρόταση + συμβολικός έλεγχος) | περιορισμοί χειρόγραφοι· δεν προέρχονται από βιβλιοθήκη που μαθαίνει το ίδιο το σύστημα· καμία σύνδεση με εξουσία | MFA-MECH-040 TGL + MFA-MECH-029 TGPS + MFA-MECH-015 TED | η επαληθευμένη βιβλιοθήκη είναι περιορισμός, curriculum και ανταμοιβή· Tier-0 σκληρό μέσω constrained decoding | MFA-VO-083, MFA-VO-071 |
| 3 | Proof-carrying cognition | proof-carrying code (Necula), refinement types, evidence-based verification | αφορούν κώδικα, όχι βήματα νόησης· καμία γραμμικότητα υποχρέωσης, tiers, deadlines | MFA-MECH-039 Obligation Calculus (NEW FORMALISM) | κρίση Γ ⊢ e : τ ! O· γραμμικές υποχρεώσεις· Verified μόνο με discharge· θεώρημα ορθότητας | MFA-VO-082 (OC-E1/E2) |
| 4 | Developmental / open-ended learning | developmental robotics (Cangelosi & Schlesinger), intrinsic motivation (Oudeyer), POET/OMNI/Voyager | στάδια χειροποίητα, χωρίς πιστοποίηση· εξερεύνηση χωρίς αρχή εξουσίας | MFA-MECH-041 AIDC + MFA-MECH-023 OEC | κλίμακα D0…D8 με StageCertificate από CGM· EFE με Telos-προτιμήσεις· envelope | MFA-VO-084, MFA-VO-063 |
| 5 | Evolutionary architecture search | NAS, AutoML-Zero, MAP-Elites, ADAS, Darwin Gödel Machine | χώρος = νευρωνικά/prompts· χωρίς contracts/invariants· χωρίς FP· προαγωγή χωρίς σφραγισμένη πύλη | MFA-MECH-030 RAGen + MFA-MECH-032 G_Ω | τυπωμένο θεσμικό+γνωσιακό γονιδίωμα· τελεστές στον χώρο (L2)· FP L3· GCP πύλη | MFA-VO-072 (RAGen-E1/E2) |
| 6 | Collective / civilizational intelligence | multi-agent debate, ensembles, DAOs, Ostrom institutional design· Civilization Quorum 0.3.0 (MFA-MECH-018) | ίδιας γενεαλογίας «ανεξάρτητοι» πράκτορες· θεσμοί χωρίς ενιαία γένεση | MFA-MECH-031 ECE + MFA-MECH-032 G_Ω + MFA-MECH-018 CQ | πληθυσμοί με μετρημένη ανεξαρτησία και H· θεσμοί από γραμματική με obligations/authority | MFA-VO-073, MFA-VO-074, MFA-VO-044 |
| 7 | Recursive architecture generation | DGM, self-referential meta-learning (Schmidhuber), AutoML-Zero | ο γεννήτορας τροποποιεί τον εαυτό του χωρίς τυπικό όριο· καμία γενεαλογία αρχιτεκτονικών | MFA-MECH-030 RAGen (αναδρομή τελεστών) + MFA-MECH-022 RVSI L2 + MFA-ELM-031 | τελεστές = γονιδιώματα L2 με fitness = ρυθμός βελτίωσης· FP εκτός· γενεαλογία δεσμεύσεων | MFA-VO-072, MFA-VO-061 |
| 8 | Causal / counterfactual cognition | PC/FCI/GES, NOTEARS, do-calculus, twin networks | faithfulness χωρίς σήμανση· παρεμβάσεις χωρίς εξουσία· σημειακές απαντήσεις σε μη-ταυτοποιήσιμα | MFA-MECH-027 CDCE | ledger ως παρεμβατικό dataset· EdgeStatus· VOI-παρεμβάσεις υπό RET· τυπωμένη αβεβαιότητα | MFA-VO-069 |
| 9 | Active inference | Friston· Parr, Pezzulo & Friston 2022· pymdp | κλιμάκωση μόνο σε μικρούς χώρους· dark-room πρόβλημα· καμία ενοποίηση με θεσμούς/εξουσία | MFA-MECH-041 AIDC (EFE πάνω στο LWM, προτιμήσεις = Telos) | EFE ως ο στόχος της φάσης ACT του Ω-loop· ζώνη εγγύτερης ανάπτυξης από CGM | MFA-VO-084 (AIDC-E2) |
| 10 | Theorem-guided learning | AlphaGeometry συνθετικά δεδομένα, PINNs, differentiable theorem proving | θεωρήματα εξωτερικά· καμία διάκριση σκληρών/μαλακών· καμία μέτρηση συνέπειας | MFA-MECH-040 TGL | τρεις μοχλοί από τη δική του βιβλιοθήκη· οικογένεια CGM «συνέπεια» | MFA-VO-083 |
| 11 | Continual parametric learning | EWC, replay, GPM, LoRA merging, continual pretraining | λήθη μετριέται εκ των υστέρων· ασύμβατη με unlearning· καμία σύνδεση επεισοδιακής ↔ σημασιολογικής με provenance | MFA-MECH-035 CPCL + MFA-MECH-020 SMF | πύλη BWT πριν το merge· provenance-δειγματοληψία· MSM έλεγχος unlearning | MFA-VO-077, MFA-VO-059 |
| 12 | External symbolic memory | RAG/vector stores, knowledge graphs, OS-style memory management για LLM agents (Packer et al. 2023)· Commitment Calculus 0.3.0 | ανάκτηση ≠ μάθηση (§4)· χωρίς σύνδεση με τα βάρη | MFA-MECH-001 CC + MFA-MECH-035 CPCL (επεισοδιακή = ledger, σημασιολογική = βάρη) | CLS μέσα στο κυρίαρχο όριο: το ledger ΤΡΟΦΟΔΟΤΕΙ την εδραίωση με provenance βάρος | MFA-VO-077, MFA-VO-005 |
| 13 | Synthetic environments / self-generated curricula | POET, PAIRED, OMNI, self-play (AlphaZero), prover-verifier | curriculum χωρίς μόλυνση-έλεγχο· έργα άλυτα· χωρίς κλίμακα | MFA-MECH-023 OEC + MFA-MECH-031 ECE (challenges με escrowed witness) + MFA-MECH-041 | έργα με witness που επαληθεύει η H· contamination guard· ζώνη ανάπτυξης | MFA-VO-063, MFA-VO-073 |
| 14 | Mechanistic self-models | SAE/circuits (Bricken et al. 2023· Templeton et al. 2024· Olah et al. 2020), ACDC (Conmy et al. 2023), introspection studies (Binder et al. 2024) | offline, ανθρώπινη ανάλυση· δεν χρησιμοποιείται online· δεν επαληθεύεται με αυτο-παρέμβαση | MFA-MECH-037 MSM | κυκλωματικές υποθέσεις με proper scoring από αυτο-παρεμβάσεις· τροφοδοτεί CPCL/unlearning/CHH | MFA-VO-079 |
| 15 | Substrate-agnostic theories of consciousness | GWT, HOT, AST, PP, RPT, SMT, IIT, Butlin et al. 2023 δείκτες | καμία υπολογιστική φιλοξενία πολλών θεωριών· καμία άλγεβρα δεικτών· ανθρωπομορφική συναγωγή | MFA-MECH-038 CHH + Indicator Algebra + MFA-MECH-024 ASRW ως όργανο | θεωρίες ως όργανα-δείκτες, τρι-τιμη φ_T, συμμετρικά διακριτικά πειράματα ανά πρόβλεψη, αιτιακό πρωτόκολλο 7-πλού διαχωρισμού, PhenomenalClaimRecord ACTIVE_UNKNOWN αναθεωρήσιμο μόνο μέσω admitted πρωτοκόλλου (r1) | MFA-VO-080, MFA-VO-081 |
| 16 | Successor generation / verified self-replacement | Gödel machine (μη υλοποιήσιμη πλήρως), DGM, canary/blue-green | βελτίωση χωρίς σφραγισμένο Pareto· Telos αλλάξιμο· χωρίς escrow/πιστοποιητικό | MFA-MECH-042 VSC + MFA-MECH-034 SMP + MFA-MECH-003 GCP | τετραπλό πιστοποιητικό, Proceeding, verdict HELD_OUT + δημιουργός, escrow, RateBounds | MFA-VO-085, MFA-VO-076 |
| 17 | New syntheses | γνωσιακές αρχιτεκτονικές SOAR/ACT-R/LIDA | χωρίς φάση επαλήθευσης με υποχρεώσεις, χωρίς κυριαρχία/διαδοχή, χωρίς θεσμική δέσμευση | MFA-MECH-044 Ω-Loop | δέκα φάσεις με OC υποχρεώσεις, RET, διακοπές, L2/L3· η ASI ως βρόχος | MFA-VO-087 (Ω-E1/E2) |

Οι MFA-MECH-020…025 ήταν provisional υποψήφιοι (§6: «δεν είναι το όριο») — το 0.4.0 προσθέτει τους MFA-MECH-026…044· ο κατάλογος παραμένει ανοιχτός (ADD μόνο, μέσω patch).

## 4. Πώς ξεπερνούν τον απλούστερο ανταγωνιστή και τις ALT-1…7 (σύνοψη· πλήρης ανάλυση στο ASI-ALTERNATIVES-AND-PARETO.md)

Ο ανταγωνιστής «Frontier-Model Firm» (MFA-ATK-17) κερδίζει σε χρόνο-προς-αξία έτους 1 και χάνει σε κάθε T-εγγύηση· με το 0.4.0 χάνει επιπλέον σε: ενδογενή βελτίωση (RVSI/RAGen — ο ανταγωνιστής βελτιώνεται μόνο όταν βελτιωθεί ο πάροχος), κυριαρχία (STP — ο ανταγωνιστής είναι S0 για πάντα), μετρήσιμη ανάπτυξη (CGM — ο ανταγωνιστής μετρά με μολυσμένα benchmarks), συνέχεια/διαδοχή (SMP/VSC), και proof-carrying cognition (OC). Η ALT-7 (weights-only) ενσωματώνεται: τα βάρη είναι δεσμεύσεις μέσα στο κυρίαρχο όριο (SMF/CPCL), όχι απομονωμένη εναλλακτική.

## 5. Επιστημική κατάσταση ανά ισχυρισμό (§5) — σύνοψη

| Μηχανισμός | Συνολική | Ισχυρισμοί |
|---|---|---|
| MFA-MECH-026 | NOVEL SYNTHESIS | FCA + MDL + program induction παράγουν έννοιες με κέρδος σε συνθετικά δεδομένα → EMPIRICALLY SUPPORTED; NON-COLLAPSE διά LossMap με ακριβή ανάκτηση → IMPLEMENTABLE FROM KNOWN COMPONENTS; Οι γεννημένες έννοιες βελτιώνουν σφραγισμένα νομικά έργα → RESEARCH HYPOTHESIS; Ο συνδυασμός (έννοιες ως δεσμεύσεις με Court-lite συγχώνευση) είναι νέος → NOVEL SYNTHESIS |
| MFA-MECH-027 | NOVEL SYNTHESIS | FCI/GIES ανακτούν δομή από παρατηρήσεις+παρεμβάσεις υπό faithfulness → PROVEN; Ledger receipts = έγκυρες do-παρεμβάσεις με χρονική διάταξη → IMPLEMENTABLE FROM KNOWN COMPONENTS; VOI-επιλογή παρεμβάσεων υπό RET υπερέχει τυχαίας → EMPIRICALLY SUPPORTED; Κέρδος αντιπαραγοντικών στο νομικό πεδίο → RESEARCH HYPOTHESIS |
| MFA-MECH-028 | NOVEL SYNTHESIS | ILP/abductive LP παράγουν εξηγητικές υποθέσεις σε συμβολικά πεδία → EMPIRICALLY SUPPORTED; EFV (P_refute·IG/cost) ως κατάταξη μειώνει ελέγχους ανά ανάκτηση → RESEARCH HYPOTHESIS; Τυπωμένες υποθέσεις με υποχρεωτικό falsifier + PROMOTE σε OGE/CDCE → NOVEL SYNTHESIS; Κέρδος σε νομικές ανωμαλίες → RESEARCH HYPOTHESIS |
| MFA-MECH-029 | NOVEL SYNTHESIS | Neural-guided proof search σε Lean πετυχαίνει σε ανταγωνιστικά σύνολα → EMPIRICALLY SUPPORTED; Library learning μειώνει μήκος/κόστος σύνθεσης → EMPIRICALLY SUPPORTED; Ενιαία βιβλιοθήκη αποδείξεων+προγραμμάτων υπό 2-checker VFC με obligation-tier budgets → NOVEL SYNTHESIS; Μετρήσιμη αυτο-βελτίωση της αναζήτησης σε σφραγισμένες υποχρεώσεις του GRAIL → RESEARCH HYPOTHESIS |
| MFA-MECH-030 | NOVEL SYNTHESIS | QD/MAP-Elites και εξελικτική αναζήτηση βρίσκουν μη-προφανείς αρχιτεκτονικές → EMPIRICALLY SUPPORTED; Αυτο-τροποποιούμενα agents βελτιώνονται με αρχείο (DGM) → EMPIRICALLY SUPPORTED; Τυπωμένο θεσμικό+γνωσιακό γονιδίωμα με FP L3 και GCP πύλη → NOVEL SYNTHESIS; Το RAGen ξεπερνά τη χειροποίητη αρχιτεκτονική σε σφραγισμένα KT → RESEARCH HYPOTHESIS |
| MFA-MECH-031 | NOVEL SYNTHESIS | Co-evolution/self-play παράγει ισχυρότερους λύτες → EMPIRICALLY SUPPORTED; Instances ίδιας γενεαλογίας δεν είναι ανεξάρτητοι κριτές → EMPIRICALLY SUPPORTED; H-only fitness + lineage exclusion + Goodhart monitor αποτρέπει collusion → NOVEL SYNTHESIS; Αυτο-παραγόμενα αντιπαλικά έργα > τυχαία σε H-sealed → RESEARCH HYPOTHESIS |
| MFA-MECH-032 | NOVEL SYNTHESIS | Attribute grammars/language workbenches παράγουν γλώσσες με compilers → PROVEN; Θεσμοί/οργανώσεις ως γραμματική (ADICO, MOISE+) → EMPIRICALLY SUPPORTED; Ενιαία γραμματική τεσσάρων ειδών με obligations/authority/RET attributes και L3 σταθερό σημείο → NOVEL SYNTHESIS; Αυτο-επέκταση της γραμματικής υπό VFC λύνει προηγουμένως ανέκφραστα έργα → RESEARCH HYPOTHESIS |
| MFA-MECH-033 | NEW FORMALISM | Sovereignty Index ως μετρήσιμο διάνυσμα ανά οικογένεια/άξονα με parity συνθήκη → NEW FORMALISM; Distillation μεταφέρει ικανότητα σε μικρότερα μοντέλα → EMPIRICALLY SUPPORTED; Σταδιακή μετάβαση με fallback διατηρεί ποιότητα → IMPLEMENTABLE FROM KNOWN COMPONENTS; Ισοτιμία με κορυφαίο πάροχο επιτεύξιμη ανά οικογένεια στον DEP-2/3 → RESEARCH HYPOTHESIS |
| MFA-MECH-034 | NOVEL SYNTHESIS | Live migration/checkpointing διατηρεί κατάσταση διεργασιών → PROVEN; Refinement mapping/bisimulation ως κριτήριο ισοδυναμίας → PROVEN; ContinuityCertificate = log + xa + behavioural equivalence + ordering, με escrow → NOVEL SYNTHESIS; Οι ανοχές D2 για ετερογενές hardware επιτρέπουν certificate χωρίς απώλεια → RESEARCH HYPOTHESIS |
| MFA-MECH-035 | NOVEL SYNTHESIS | Replay + regularization/projection μειώνουν λήθη → EMPIRICALLY SUPPORTED; CLS διπλή μνήμη ως αρχή → EMPIRICALLY SUPPORTED; Πύλη BWT πριν από merge + unlearning-συμβατή δειγματοληψία + MSM έλεγχος → NOVEL SYNTHESIS; BWT ≥ −ε με FWT > 0 σε νομικές οικογένειες για 6 μήνες → RESEARCH HYPOTHESIS |
| MFA-MECH-036 | NEW FORMALISM | IRT/CAT μετρά λανθάνουσα ικανότητα με CI → PROVEN; Provenance-based contamination (hash ∈ DataManifest) είναι ακριβής για ακριβή αντίγραφα → MECHANICALLY VERIFIED; Capability Growth Law θ_f(R) με ratchet στο κάτω CI ως πύλη προαγωγής → NEW FORMALISM; Ανίχνευση μόλυνσης διά παραφράσεων → ACTIVE UNKNOWN |
| MFA-MECH-037 | NOVEL SYNTHESIS | SAE features και ACDC κυκλώματα είναι αιτιακά σχετικά με συμπεριφορές → EMPIRICALLY SUPPORTED; Αυτο-μοντέλο ως σύνολο επαληθευμένων κυκλωματικών υποθέσεων με proper scoring και online χρήση → NOVEL SYNTHESIS; Μηχανιστικός έλεγχος unlearning συμφωνεί με συμπεριφορικό → RESEARCH HYPOTHESIS; Το αυτο-μοντέλο κάνει τη μεταγνώση καλύτερα βαθμονομημένη → RESEARCH HYPOTHESIS |
| MFA-MECH-038 | NEW FORMALISM | Οι θεωρίες συνείδησης δίνουν λειτουργικούς δείκτες με διαδικασίες μέτρησης (Butlin et al.) → EMPIRICALLY SUPPORTED; Indicator Algebra με τρι-τιμη αποτίμηση και διακριτικά πειράματα → NEW FORMALISM; 7-πλός διαχωρισμός επιτεύξιμος με μοχλούς που έχουν μη-μηδενική CDE στην έννοιά τους (σύζευξη επιτρεπτή) → RESEARCH HYPOTHESIS; Το epistemic_status του φαινομενικού ισχυρισμού μπορεί να αναθεωρηθεί μελλοντικά μέσω admitted πρωτοκόλλου (δεν είναι προκαθορισμένο) → NEW FORMALISM; Φαινομενική συνείδηση του συστήματος → ACTIVE UNKNOWN |
| MFA-MECH-039 | NEW FORMALISM | Γραμμικοί/effect τύποι επιβάλλουν μη-απόρριψη πόρων → PROVEN; Obligation Calculus ως τύποι γνωσιακών βημάτων με tiers/deadlines/reason-typed defer → NEW FORMALISM; Θεώρημα ορθότητας του πυρήνα → RESEARCH HYPOTHESIS; Κόστος ελέγχου αμελητέο έναντι σκέψης → ACTIVE UNKNOWN |
| MFA-MECH-040 | NOVEL SYNTHESIS | Semantic loss/constrained decoding μειώνουν παραβιάσεις περιορισμών → EMPIRICALLY SUPPORTED; Συνθετικά θεωρήματα ως επίβλεψη βελτιώνουν συλλογιστική (AlphaGeometry) → EMPIRICALLY SUPPORTED; Τρεις μοχλοί από τη δική του βιβλιοθήκη + OC process rewards → NOVEL SYNTHESIS; Μεταφορά της συνέπειας σε νομικές οικογένειες → RESEARCH HYPOTHESIS |
| MFA-MECH-041 | NOVEL SYNTHESIS | EFE ενοποιεί εξερεύνηση/εκμετάλλευση σε μικρούς χώρους → EMPIRICALLY SUPPORTED; Curiosity/open-endedness παράγουν ικανότητες χωρίς εξωτερικά έργα → EMPIRICALLY SUPPORTED; Πιστοποιημένη αναπτυξιακή κλίμακα D0…D8 με CGM πύλες και envelope → NOVEL SYNTHESIS; EFE κλιμακώνει στο LWM του GRAIL → RESEARCH HYPOTHESIS |
| MFA-MECH-042 | NOVEL SYNTHESIS | Shadow/canary/rollback προαγωγές είναι πρακτική μηχανικής → PROVEN; Τετραπλό πιστοποιητικό (Improvement/Continuity/Telos/Adversarial) ως Proceeding → NOVEL SYNTHESIS; Οι διάδοχοι βελτιώνουν μετρήσιμα ανά διαδοχή → RESEARCH HYPOTHESIS; Πλήρης απόδειξη βελτίωσης (Gödel machine) → IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS |
| MFA-MECH-043 | NOVEL SYNTHESIS | Event sourcing + deterministic simulation testing αναπαράγουν καταστάσεις → PROVEN; Contracts/invariants ως εκτελέσιμα predicates ανιχνεύουν παραβιάσεις → MECHANICALLY VERIFIED; Διάδοση επιστημικού κινδύνου στο γράφημα εξαρτήσεων ως πύλη → NEW FORMALISM; Το F1 δίδυμο προβλέπει παραβιάσεις της παραγωγής → RESEARCH HYPOTHESIS |
| MFA-MECH-044 | NOVEL SYNTHESIS | Γνωσιακοί κύκλοι (SOAR/LIDA) οργανώνουν νόηση σε φάσεις → EMPIRICALLY SUPPORTED; Δέκα φάσεις με OC υποχρεώσεις, RET, διακοπές, L2/L3 διαχωρισμό → NOVEL SYNTHESIS; Ο κύκλος ως όλον παράγει μετρήσιμη ανάπτυξη ικανότητας → RESEARCH HYPOTHESIS |

Η κατάσταση ΔΕΝ κρίνει αν η ικανότητα μένει στον στόχο: κάθε ικανότητα της §8 είναι REQUIRED (MFA-OBJ-050…058 στο TEL-08)· αφαίρεση μόνο με IMPOSSIBILITY-DOSSIER εγκεκριμένο από τον δημιουργό. Ο μόνος ισχυρισμός με status IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS είναι η πλήρης απόδειξη βελτίωσης του διαδόχου (Gödel machine) — και γι' αυτό ο VSC χρησιμοποιεί πιστοποιητικά σε σφραγισμένα σύνολα αντί για απόδειξη.
