# ASI-RESOURCE-ENVELOPES — φάκελοι πόρων των μηχανισμών 0.4.0 ανά προφίλ ανάπτυξης (MFA-DEP-1…5)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Κατάσταση:** PROPOSED / UNREVIEWED — προβολή των εδρών YAML και των INVENTION DOSSIERs (`inventions/`)· μόνο ο δημιουργός εγκρίνει· κανένας παραγωγικός κώδικας. Τα MFA-MECH-020…025 είναι PROVISIONAL / UNREVIEWED / NON-BINDING (§13).

Πηγή: πεδίο `resource_complexity` και `scaling_law` κάθε INVENTION DOSSIER· τα DEP προφίλ στο TECHNICAL-ARCHITECTURE §15. Οι αριθμοί είναι εκτιμήσεις σχεδιασμού (NOVEL SYNTHESIS), όχι μετρήσεις — η CGM μετρά ικανότητα/Wh.

## 1. Ανά στοιχείο

| Στοιχείο | Μηχανισμός | Πόροι (ανά DEP) | Νόμος κλιμάκωσης | Δόση |
|---|---|---|---|---|
| MFA-ELM-109 Ontology Genesis Engine (OGE) | MFA-MECH-026 | DEP-1: k≤12, 10² ανωμαλίες/ημέρα, CPU· DEP-2: k≤20, 10³/ημέρα, program induction σε GPU (ώρες)· DEP-3+: συνεχής· μνήμη O(∣C∣·∣E∣ δείγμα) | Κέρδος ≈ γραμμικό στα residuals μέχρι κορεσμό της οντολογίας· κόστος FCA 2^k (ελεγχόμενο από k)· η γενεαλογία αυξάνει γραμμικά — μετριέται ως MFA-VO-068 (έννοιες/κέρδος ανά compute). | 1 |
| MFA-ELM-110 Causal Discovery & Counterfactual Engine (CDCE) | MFA-MECH-027 | DEP-1: n≤50 μεταβλητές, B=20, CPU λεπτά/cut· DEP-2: n≤500, B=50, GPU για μηχανισμούς· DEP-3+: n≤10⁴ με sparsity (d≤4)· LWM rollouts ms/κόμβο | SHD μειώνεται ~ 1/√(∣D∣) παρατηρησιακά και ~ γραμμικά με ∣I∣ παρεμβάσεις σε UND ακμές (GIES θεωρία)· το κόστος FCI πολυωνυμικό για φραγμένο d· μετριέται ως MFA-VO-069. | 1 |
| MFA-ELM-111 Abductive Hypothesis Engine (AHE) | MFA-MECH-028 | DEP-1: ILP (Popper) CPU λεπτά/ανωμαλία, 10 υποθέσεις/ημέρα· DEP-2: παραμετρική γεννήτρια GPU, 10² ανωμαλίες/ημέρα· DEP-3+: 10⁴· βιβλιοθήκη O(∣Lib∣²) ανά epoch συμπίεσης | Ρυθμός επιζωσών υποθέσεων ανά compute (MFA-VO-070)· αναμένεται υπο-γραμμικός στις ανωμαλίες (οι εύκολες πρώτα)· η βιβλιοθήκη μειώνει το κόστος γέννησης ~ log(∣Lib∣). | 1 |
| MFA-ELM-112 Theorem-Guided Program & Proof Synthesis (TGPS) | MFA-MECH-029 | DEP-1: Lean 4 CPU, B=10³ κόμβοι/υποχρέωση, πολιτική μικρή (≤1B)· DEP-2: B=10⁵, πολιτική 7–13B GPU· DEP-3+: B=10⁷, PRR συνεχής· Compress epoch ώρες | Επιτυχία ανά budget αυξάνει με log(B) (best-first) και με ∣Lib∣ (μείωση μήκους)· η PRR-πολιτική αναμένεται να μετατοπίζει την καμπύλη (AlphaProof-class evidence)· MFA-VO-071 = success-rate-per-budget καμπύλη ανά epoch. | 0.5 |
| MFA-ELM-113 Recursive Architecture Generator (RAGen) | MFA-MECH-030 | DEP-1: P=8, F1 μόνο, CPU λεπτά/κύκλο· DEP-2: P=32, F2 DST ώρες/κύκλο, εβδομαδιαίοι κύκλοι· DEP-3: ημερήσιοι· DEP-4: συνεχείς με παράλληλα twins | QD κάλυψη ~ log(evals)· ρυθμός frontier βελτίωσης φθίνει (κορεσμός) — η αναδρομή στους τελεστές μετατοπίζει την καμπύλη (DGM-class evidence)· μετριέται MFA-VO-072. | 2 |
| MFA-ELM-114 Evaluator Co-Evolution Engine (ECE) | MFA-MECH-031 | DEP-1: ∣S∣=2, ∣E∣=3, ∣H∣=1 (phone-class), εβδομαδιαίες εποχές· DEP-2: ∣S∣=4, ∣E∣=8, ημερήσιες· DEP-3+: 10s, συνεχείς· κόστος ~ ∣S∣·∣E∣·∣T∣ | Διακριτική ισχύς E αυξάνει με ∣E∣ και F ποικιλία μέχρι κορεσμό· ο Goodhart κίνδυνος αυξάνει με ∣T∣ χωρίς H — άρα m (H δείγμα) κλιμακώνεται με √∣T∣· MFA-VO-073. | 1 |
| MFA-ELM-115 Genesis Grammar Compiler (G_Ω) | MFA-MECH-032 | DEP-1: αναζήτηση παραγωγής CPU δευτερόλεπτα, ∣P∣ ≈ 100· DEP-2: ∣P∣ ≈ 10³, TGPS υποχρεώσεις λεπτά· DEP-3+: παράλληλες derivations | Εκφραστικότητα ~ ∣P∣ (γραμμική) με κόστος αναζήτησης ~ b^d· η μάθηση παραγωγών μειώνει d για συχνά είδη· MFA-VO-074. | 2 |
| MFA-ELM-116 Sovereignty Controller (STP/SI) | MFA-MECH-033 | Μέτρηση αμελητέα· το κόστος είναι της κυρίαρχης στοίβας (SMF DEP-2+)· parity tests ανά cut O(∣sealed∣) | SI αναμένεται σιγμοειδές ανά οικογένεια με το compute της SMF· οι «εύκολες» οικογένειες (drafting) πρώτες· MFA-VO-075 = SI καμπύλη ανά δόση. | 1 |
| MFA-ELM-117 Substrate Migration Engine (SMP) | MFA-MECH-034 | 2× πόροι κατά το escrow· SYNC = bandwidth × ∣log∣· VERIFY = ∣KT_sealed∣ runs (ώρες σε DEP-2)· DEP-1: laptop→laptop· DEP-3/4: cluster→cluster | Κόστος ~ ∣log∣ + ∣weights∣ + ∣KT_sealed∣· escrow χρόνος σταθερός· MFA-VO-076 = χρόνος/κόστος μετανάστευσης ανά δόση με 0 απώλεια. | 1 |
| MFA-ELM-118 Consolidation-Preserving Learner (CPCL) | MFA-MECH-035 | DEP-1: adapters, ύπνος νυχτερινός (ώρες)· DEP-2: Fisher K-FAC ανά οικογένεια (GPU ώρες), εβδομαδιαίοι κύκλοι· DEP-3+: συνεχείς· sealed evals ανά κύκλο O(∣F∣·∣sealed∣) | Λήθη ~ αντιστρόφως ανάλογη του k_f και του replay ratio· κόστος K-FAC ~ Σ d³· MFA-VO-077 = T πίνακας ανά κύκλο (BWT ≥ −ε ratchet, FWT καμπύλη). | 1 |
| MFA-ELM-119 Capability Growth Metrology (CGM) | MFA-MECH-036 | Μέτρηση: n_items λύσεις ανά οικογένεια/cut (λεπτά–ώρες)· τράπεζα 10³ έργα/οικογένεια· HELD_OUT phone-class επαρκεί για scoring/escrow | Η ίδια η CGM: SE ~ 1/√n_items· η μετρούμενη θ_f(R) είναι το αντικείμενο· αναμένεται log-γραμμική (scaling laws) με κορεσμό ανά οικογένεια — MFA-VO-078. | 0.5 |
| MFA-ELM-120 Mechanistic Self-Model (MSM) | MFA-MECH-037 | DEP-1: SAE σε ≤1B, λίγα στρώματα· DEP-2: 7–13B όλα τα στρώματα (GPU ημέρες)· DEP-3: 70B δείγμα στρωμάτων· self-tests O(∣h∣·n) | Κόστος SAE ~ N·d· αριθμός features ~ d·expansion· η προβλεπτική ακρίβεια του αυτο-μοντέλου (proper score) ως συνάρτηση compute = MFA-VO-079. | 2 |
| MFA-ELM-121 Consciousness Hypothesis Host (CHH) | MFA-MECH-038 | DEP-1: ≥5 θεωρίες σε μικρό υπόστρωμα, ablations CPU· DEP-2: ASRW+MSM όργανα σε 7B, ablation πειράματα ώρες· DEP-3+: integration measures σε δείγματα υποσυστημάτων | Ο αριθμός διακριτικών πειραμάτων ~ ∣Θ∣²· η πληροφορία ανά πείραμα φθίνει (κορεσμός)· μετριέται MFA-VO-080 (μείωση διαφωνίας ανά πείραμα). | 2 |
| MFA-ELM-122 Obligation Type Checker (OC) | MFA-MECH-039 | Type checking γραμμικό (ms)· discharge = κόστος verifiers/TGPS/tests· DEP-1: Tier-0 PROOF μόνο για CC κανόνες· DEP-2+: PROOF ευρύτερα | Κόστος ~ ∣O∣·mean(cost(method))· η βιβλιοθήκη TGPS μειώνει το PROOF κόστος· η CGM οικογένεια «obligation discharge rate» = MFA-VO-082. | 0.5 |
| MFA-ELM-123 Theorem-Guided Learning Trainer (TGL) | MFA-MECH-040 | DEP-1: μικρές βιβλιοθήκες, rejection decoding CPU/GPU· DEP-2: 7–13B, WMC δειγματοληψία, ώρες/ημέρα· DEP-3+: συνεχές | Κόστος ~ ∣Θ_lib∣·k + samples·verify· η συνέπεια (CGM οικογένεια) αναμένεται να αυξάνει με ∣Θ_lib∣ (AlphaGeometry-class)· MFA-VO-083. | 2 |
| MFA-ELM-124 Active-Inference Developmental Core (AIDC) | MFA-MECH-041 | DEP-1: B=4, H=5, ∣Π∣≤20, CPU· DEP-2: B=16, H=20, GPU rollouts ms/κόμβο· DEP-3+: παράλληλα | Κόστος ~ ∣Π∣·B·H· η πρόοδος σταδίων ~ compute με κορεσμό ανά στάδιο (CGM law)· MFA-VO-084 = χρόνος ανά στάδιο και εξερευνητική αποδοτικότητα (πληροφορία/Wh). | 2 |
| MFA-ELM-125 Verified Successor Constructor (VSC) | MFA-MECH-042 | 2× πόροι στο escrow· BUILD = SMF DEP-2/3 ημέρες· CERTIFY ώρες–ημέρες· σπάνιο γεγονός | Ρυθμός διαδοχών φραγμένος (RateBound)· η βελτίωση ανά διαδοχή μετριέται CGM (MFA-VO-085 = Δθ ανά διαδοχή ανά compute). | 3 |
| MFA-ELM-126 Twin Execution Kernel (TES) | MFA-MECH-043 | F1: Python, ms/γεγονός, laptop· F2: DST λεπτά/σενάριο· F3 shadow: κόστος πραγματικών οργάνων· μνήμη O(∣worlds∣·∣state∣) με structural sharing | Κόστος ~ ∣events∣·∣active invariants∣· τα δέντρα κόσμων ~ branching^depth (Pareto pruning)· MFA-VO-086 = παραβιάσεις ανιχνευόμενες ανά seeded fault και replay επιτυχία. | 0 |
| MFA-ELM-127 Ω-Loop Scheduler | MFA-MECH-044 | DEP-1: κύκλος ημέρας με mocks/lite μηχανισμούς· DEP-2: κύκλος ωρών· DEP-3+: συνεχείς παράλληλοι κύκλοι | Ικανότητα ανά κύκλο ανά Wh (CGM) = ο δείκτης· αναμένεται βελτίωση της διάταξης από RVSI· MFA-VO-087. | 0.5 |

## 2. Ρυθμοί κύκλου Ω-loop ανά προφίλ

| Προφίλ | Κύκλος | Φάσεις με πλήρες βάρος | Φάσεις lite/mock | Copilot path |
|---|---|---|---|---|
| DEP-1 | ημέρας (εκτός ωρών) | PERCEIVE, VERIFY(lite), MEASURE(lite) | MODEL, WONDER, LEARN(adapters), REFLECT(SPL), EVOLVE(F1) | εκτός κύκλου, πάντα |
| DEP-2 | ωρών | + LEARN (PRR/CPCL), MODEL (LWM), WONDER (AHE) | EVOLVE (F2), REFLECT (MSM 7B) | εκτός κύκλου |
| DEP-3 | συνεχείς παράλληλοι | όλες | — | εκτός κύκλου |
| DEP-4 | συνεχείς + SUCCEED | όλες | — | εκτός κύκλου |

## 3. Ενέργεια (φράγματα OAP, MFA-INV-065)

| Προφίλ | Wh/matter (0.3.0) | Πρόσθετο 0.4.0 (εκτίμηση) | eval_cost_ratio (με OC, ATK-25) |
|---|---|---|---|
| DEP-1 | ≤ 50 | +10 % (OC-lite, CGM-lite, TES F1) | ≤ 3 |
| DEP-2 | ≤ 200 | +30 % (LWM rollouts, CPCL ύπνος, MSM) | ≤ 5 |
| DEP-3 | ≤ 1 kWh | +50 % (RAGen F2/F3, ECE εποχές) | ≤ 5 |
| DEP-4 | ≤ 5 kWh | training runs χωριστός φάκελος (MFA-DEC-016) | ≤ 10 |

## 4. Integration debt (ATK-27)

Το 0.4.0 προσθέτει 19 στοιχεία / 19 contracts / 38 invariants / 20 VOs· οι αμοιβαίες εξαρτήσεις (R8a) από 17 σε 215 — λύνονται με τη σειρά γένεσης (MFA-DEC-104, ASI-IMPLEMENTATION-LADDER §3). Εκτίμηση: Δόση 0 από 8 σε ~10 εβδομάδες (lite σκέλη)· Δόση 1–2 +30–40 % προσπάθεια έναντι 0.3.0. Επιστημική κατάσταση: NOVEL SYNTHESIS χωρίς εμπειρικό τεκμήριο — ο δεύτερος ισχυρότερος πρακτικός κίνδυνος.

## 5. HELD_OUT συσκευή (MFA-DEC-014)

Το 0.4.0 φορτώνει τη HELD_OUT συσκευή με: escrow απαντήσεων CGM, βαθμονόμηση items, H πληθυσμό (symbolic + human sample + lineage-disjoint μοντέλα), witnesses των ECE challenges, certificates SMP/VSC. Σε DEP-1 phone-class επαρκεί για scoring/escrow· η H με μοντέλα απαιτεί DEP-2 δεύτερη συσκευή με GPU.
