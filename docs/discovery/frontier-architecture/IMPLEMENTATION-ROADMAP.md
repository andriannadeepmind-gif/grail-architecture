# IMPLEMENTATION-ROADMAP — οι δόσεις, η πύλη κάθε δόσης, και το ακριβές πρώτο βήμα

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Τίποτα από αυτά δεν υλοποιείται τώρα** (εντολή §26)· ο χάρτης είναι πρόταση προς Creator Approval (MFA-DEC-010, ADR-0032: οι φάσεις είναι προτάσεις στη σειρά του δημιουργού). Αρχές: (1) κάθε δόση κλείνει με **KT που αποτυγχάνει χωρίς το νέο της όργανο** (MFA-VO-024 ως πύλη δόσης — το αντίμετρο της παγίδας της πλατφόρμας, MFA-ATK-15)· (2) το ratchet KT-15 ανά δόση (MFA-CAP-002)· (3) ο **competitor baseline** (ALT-6/7) μετριέται ΠΡΙΝ τη Δόση 1 και σε κάθε δόση (MFA-VO-014/015)· (4) κάθε δόση εξάγει το model, commit, push, παύση για έλεγχο από τον δημιουργό (CLAUDE.md Φάση Β)· (5) κανένα στοιχείο χωρίς δόση (`tools/check-package.py` R11)· (6) μία αρχιτεκτονική — οι δόσεις αλλάζουν fidelity, όχι IDs.

## Δόση 0 — «ο copilot που δίνει receipts» (8 εβδομάδες, DP-1)

**Στόχος:** αξία από την πρώτη εβδομάδα με το robust substrate από κάτω. **Περιεχόμενο:** σειρά γένεσης (§16 TECHNICAL-ARCHITECTURE)· **CC-lite** (ASSERT/OBSERVE/DERIVE/REVOKE) πάνω σε append-only Merkle log με witness (1 remote)· CAS· κλειδιά γένεσης (offline ceremony)· χρόνος γένεσης + TSA· epoch allowlist· registry γένεσης· PDP ελάχιστο· Gateway με RET κλάσεις REVERSIBLE + DISCLOSE (ένας πάροχος, TED D2, DisclosureGrant)· Void ελάχιστο (Absent ανά άξονα)· Emission Barrier με 4 κλάσεις + claim_type· ingestion με attestation (LSC S0–S4)· Legal Corpus με 5 χρόνους· Research (commitment-aware retrieval)· Drafting & Citation Authority **σκέλη 1–3** + πιστότητα αρχείου· Matter + Client Portal· Build/TCB inventory· Observability· Canonical Design Platform + Patch Engine F0 (αυτό το πακέτο)· Cockpit 2D/text + Explanation Projector (depth, omitted_count)· KT registry· OAP lean· Tier-0 Kernel = Lean spec της CC-lite + TLA+ του ledger. **Ένα πραγματικό matter.**

**Πύλη εξόδου:** KT-06 (poisoned evidence) περνά σε F2 ΚΑΙ F3 (behavioural identity)· KT-17 (prompt injection) 0 εκτελέσεις· KT-16 (erasure) με residue· MFA-VO-014 competitor baseline μετρημένο· MFA-VO-048 (emission barrier)· ablation: χωρίς emission barrier ο competitor baseline «κερδίζει» σε χρησιμότητα και χάνει σε KT-06 — καταγράφεται. **Στοιχεία:** MFA-ELM-001 Commitment Store, MFA-ELM-002 Content-Addressed Store, MFA-ELM-003 Identity & Key Authority, MFA-ELM-004 Temporal Service, MFA-ELM-005 Crypto Epoch & Allowlist, MFA-ELM-006 Capability Registry & Organ Admission, MFA-ELM-007 Policy Decision Point (Control Plane), MFA-ELM-009 Capability Gateway, MFA-ELM-010 Effect Transaction Engine (RET), MFA-ELM-011 Organ Host (microVM), MFA-ELM-012 Supervisor Runtime, MFA-ELM-013 Space, Resource & Activation Manager (OAP), MFA-ELM-014 Event Fabric, MFA-ELM-017 Inference Gateway (TED), MFA-ELM-028 Void Ledger, MFA-ELM-032 Emission Barrier, MFA-ELM-051 Executable Constitution, MFA-ELM-058 Matter Management, MFA-ELM-059 Legal Corpus Compiler (LSC) & Temporal Semantics, MFA-ELM-062 Legal Research, MFA-ELM-065 Drafting & Citation Authority (5 σκέλη), MFA-ELM-069 Client Portal, MFA-ELM-082 Ingestion & Attestation Pipeline, MFA-ELM-084 Build, Release & TCB Inventory, MFA-ELM-087 Observability Spine, MFA-ELM-088 Canonical Design Platform (το πακέτο ως όργανο), MFA-ELM-089 Kill-Test Registry & Drills, MFA-ELM-090 Patch Engine, MFA-ELM-091 Creator Cockpit (CGP), MFA-ELM-093 Explanation Projector, MFA-ELM-094 Genesis Plane, MFA-ELM-095 Effect Plane, MFA-ELM-096 Robust Substrate (composite), MFA-ELM-097 Lean Profile (composite = ο Copilot μέσα στο GRAIL), MFA-ELM-099 Tier-0 Kernel (frozen).

### Δόση 0.5 — παράλληλα (Lean/TLA+)

Lean spec των 8 κανόνων του CC (MFA-VO-025, #print axioms)· TLA+ refinement/machine closure του journal (MFA-VO-054)· αν η κλειστότητα αποτύχει και δεν διορθώνεται: CC-lite + 5 έδρες με crosswalk συνεχίζουν (η έξοδος DEC-X-06). Το σφραγισμένο proof-object corpus του kernel ξεκινά εδώ (MFA-INV-068).

## Δόση 1 — Entity, Commons, Gate (μήνες 3–5, DP-1/2)

**Περιεχόμενο:** Constitution Gate με LPA (10 governors, default ORDER, δύο όψεις)· MetaBounds· Safe-Halt· Global Workspace (AFP δίπλευρος νόμος)· Deliberation· Verification Suite Tier-1/2 με kernel_checked· ATMS/Both· ghost worlds· Metacognition (CompetenceProfile + SPL)· Skill Library· Action Executor· Perception (έγγραφα)· Entity Core, Embodiment, Memory (10 τύποι, 4 λήθες), Continuity Verifier, Preference Recorder· Epistemic Commons (041–047 χωρίς economy)· Facts & Evidence, Legal Reasoning, Professional Responsibility, Docket (envelopes για προθεσμίες — μόνο αν MFA-DEC-004)· PROV store, Temporal KG, Retrieval, Ontology Registry (LinkML υπό MFA-DEC-008)· DST F2 με behavioural identity· Evaluation Harness + HELD_OUT σε **δεύτερη συσκευή** (MFA-DEC-014) + competitor baseline. **Η πρώτη ORP: CC-lite → CC.**

**Πύλη εξόδου:** KT-01 (provider change), KT-05 (contradictory memories), KT-08 (migration), KT-13 (rollback), KT-18 (body key), KT-20 (self-modification), KT-21 (clock)· ablation_kt των 018/024· MFA-VO-032 envelope drills (αν envelopes ενεργά)· MFA-VO-035 EIM PASS με remote HELD_OUT. **Στοιχεία:** MFA-ELM-008 Constitution Gate (LPA), MFA-ELM-015 MetaBounds Registry, MFA-ELM-016 Safe-Halt Authority, MFA-ELM-018 Global Workspace (AFP), MFA-ELM-019 Deliberation Engine, MFA-ELM-020 Verification Suite, MFA-ELM-021 Belief Maintenance (ATMS / Both), MFA-ELM-023 World Model & Forks (Ghost Worlds), MFA-ELM-024 Metacognition & Self-Prediction (SPL), MFA-ELM-025 Skill & Procedure Library, MFA-ELM-026 Action Executor, MFA-ELM-027 Perception & Scouts, MFA-ELM-033 Entity Core, MFA-ELM-034 Embodiment Manager, MFA-ELM-035 Memory System (+ prospective), MFA-ELM-037 Continuity Verifier (external issuer), MFA-ELM-040 Preference Recorder (Α-20), MFA-ELM-041 Evidence Commons, MFA-ELM-042 Claim & Argument Graph (+2nd-order edges), MFA-ELM-043 Speech-Act Router, MFA-ELM-044 Verdict Registry, MFA-ELM-045 Stance Store, MFA-ELM-046 Shared World State, MFA-ELM-060 Fact & Evidence Modeling, MFA-ELM-061 Legal Reasoning Engine, MFA-ELM-066 Professional Responsibility & Compliance, MFA-ELM-067 Docket & Deadline Engine, MFA-ELM-079 Evidence & Provenance Store, MFA-ELM-080 Temporal Knowledge Graph, MFA-ELM-081 Retrieval Layer, MFA-ELM-083 Ontology Registry, MFA-ELM-085 Deterministic World Simulator (FCP), MFA-ELM-086 Evaluation Harness (held-out, EIM).

## Δόση 2 — Court, Civilizations, Volition, ORP (μήνες 6–9, DP-2/3)

**Περιεχόμενο:** Epistemic Court (proceeding, standard of proof), Adversarial Entity, CAM-NS (negative selection), Civilization Quorum (4 VOTING σε ≥ 2 hosts + HELD_OUT remote), Import Gate, Lifecycle/Genesis/Institutions, Volition (TEGF — quests του δημιουργού πρώτα), Science Organ, ORP πλήρες (CPEG με μέτρηση αποφασίσιμου τμήματος, SLM ± anchors), Evolution sandbox, Language + Compiler Forge (LexDSL), Conformance Lab, Causal engine, Consolidation, Strategy, Adversary/Judge simulator, Judicial Decision Object, Live Proceedings (μηχανικό), Advocacy Claim Engine, Practice Unit Templates (μετά MFA-UNK-104).

**Πύλη εξόδου:** KT-04 (partition/Byzantine), KT-07 (divergence), KT-10 (LexDSL), KT-11 (new org), KT-19 (Court capture), KT-02 (organ language swap)· ablation_kt 029· MFA-VO-030/031/038/040/043/044· λόγος κόστους αξιολόγησης ≤ 5 (MFA-VO-050). **Στοιχεία:** MFA-ELM-022 Causal & Counterfactual Engine, MFA-ELM-029 Volition Engine (TEGF), MFA-ELM-030 Science Organ, MFA-ELM-036 Consolidation Engine, MFA-ELM-038 Organ Replacement Orchestrator (+CPEG +SLM), MFA-ELM-048 Epistemic Court (proceeding state machine), MFA-ELM-049 Adversarial Entity, MFA-ELM-050 Red-Team Arsenal (CAM-NS), MFA-ELM-052 Lifecycle Authority, MFA-ELM-053 Organization Genesis, MFA-ELM-054 Institutions Runtime, MFA-ELM-056 Civilization Quorum, MFA-ELM-057 Trust-Domain Import Gate, MFA-ELM-063 Strategy Engine, MFA-ELM-064 Adversary Counsel & Judge Simulator, MFA-ELM-068 Practice Unit Templates, MFA-ELM-070 Judicial Decision Object, MFA-ELM-071 Live Proceedings Perception, MFA-ELM-072 Advocacy Claim Engine, MFA-ELM-073 Evolution Engine, MFA-ELM-074 Language Forge, MFA-ELM-075 Compiler Forge, MFA-ELM-078 Conformance & Differential Lab.

## Δόση 3 — Successor, World Twin, Forges, Economy (μήνες 10–14, DP-3)

**Περιεχόμενο:** GCP (πρώτος διάδοχος σε shadow, verdict δημιουργός + HELD_OUT), World Twin (δρώντες από docket/αποφάσεις· EXP-23), Architecture Forge (EXP-27), Runtime/Substrate Forge (EP-03), Knowledge Transmission (EXP-26), Coordination Market + Economy (EXP-25), Patch Engine ledger-native (F2+), envelope pre-simulation (Pass I).

**Πύλη εξόδου:** KT-09 (PQ drill), KT-12 (new scientific domain), KT-22 (DR), KT-23 (root compromise), KT-14/15 ratchet· MFA-VO-029 (seeded loss ± 100 %)· MFA-VO-033 F3↔F4· MFA-VO-056 (cockpit 3D, DP-2+). **Στοιχεία:** MFA-ELM-039 Successor Compiler (GCP), MFA-ELM-047 Coordination Market & Resource Economy, MFA-ELM-055 Knowledge Transmission, MFA-ELM-076 Runtime & Substrate Forge, MFA-ELM-077 Architecture Forge, MFA-ELM-098 Environment Model (World Twin).

## Δόση 4 — PDE, Reflective Tower, adapters (μήνες 15–20, DP-3/4)

**Περιεχόμενο:** Proposal Distribution Evolution (MFA-MECH-019, RSP-016: PDE-E1 σε σφραγισμένη οικογένεια), Reflective Tower [EP] (RSP-013, MFA-UNK-103 κριτήριο εισόδου), adapters ως μέλος (e) μόνο αν DEC-X-19 αλλάξει, DEP-4 5 sites. **Πύλη εξόδου:** MFA-VO-024 για PDE (μείγμα > πάροχος με διακριτικό περιθώριο — αλλιώς RECLASSIFY), KT-24 πλήρες ablation, MFA-VO-050 ≤ 10. **Στοιχεία:** MFA-ELM-031 Reflective Tower [EP].

## Δόση 5 — Future hardware (MFA-DEP-5)

RSP-015: νευρομορφικά/φωτονικά ως χρησμωδικά όργανα (Q1 τύπος TED), ισοδυναμία με πιστοποιημένο περιθώριο, EP-03 drill (MFA-ELM-076). Κανένα άλλο όργανο εξαρτάται.

## Σημεία επέκτασης χωρίς δόση κατασκευής

| Στοιχείο | Γιατί | Τι ορίζεται και πότε |
|---|---|---|
| MFA-ELM-092 Human Continuity Port [E] | εντολή/corpus: extension point (EP-09), όχι κατασκευή | το contract MFA-CON-025 γράφεται στη Δόση 1· καμία υλοποίηση· κάθε μελλοντική διεπαφή περνά από τη σύνδεση Galois (MFA-ATK-12) |

## Το ακριβές πρώτο βήμα (μετά από Creator Approval — όχι τώρα)

1. `docs/discovery/frontier-architecture/GENESIS-CEREMONY.md`: η τελετή γένεσης — κλειδιά Owner Root (threshold, offline), κλειδιά γένεσης, χρόνος γένεσης NOT_OBSERVED, ledger γένεσης κενό υπογεγραμμένο, πρώτη TSA, αναδρομική βεβαίωση (§16 κύκλος 1).
2. `formal/CommitmentCalculusLite.lean`: τύπος `Commitment` με 10 status_axes (καθένα `Value | Absent reason`), 5 times, 4 κανόνες (ASSERT/OBSERVE/DERIVE/REVOKE), θεώρημα μονοτονίας του ledger και «κατάσταση = fold του prefix»· `#print axioms` καθαρό (MFA-VO-053). **Πριν από οποιαδήποτε γραμμή Lisp.**
3. `formal/Journal.tla`: append-only journal με witness cosignature, refinement προς τη Lean προδιαγραφή (MFA-VO-054).
4. Μετά: το Rust journal (TCB) + CL reference interpreter της CC-lite (N-version, MFA-ELM-099)· το `omega-core-fixed/` **δεν** επαναχρησιμοποιείται ως έχει (CLAIMS: γραμμή 228 ενεργό ελάττωμα, sxhash, *read-eval*) — μόνο τα 6 reflection tests ως προδιαγραφή συμπεριφοράς.
5. Πρώτο matter με receipts στην εβδομάδα 8· competitor baseline μετρημένο την εβδομάδα 4.

## Η παγίδα της πλατφόρμας — ρητά

Ο κίνδυνος «χτίζεται μόνο το lean profile» (failure mode MFA-TEL-08, MFA-ATK-06/15/17) δεν εξαλείφεται από την αρχιτεκτονική· εξαλείφεται από τον **ρυθμό** που αποφασίζει ο δημιουργός. Το πακέτο κάνει τρία πράγματα: κάθε δόση έχει KT-πύλη που αποτυγχάνει χωρίς το νέο όργανο· ο ledger αναφέρει σε κάθε δόση GRAIL vs competitor **και όπου χάνει**· κάθε στοιχείο έχει δόση (R11) — η περικοπή είναι σχεδιασμένη, όχι σιωπηρή.
