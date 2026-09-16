# ASI-CONSCIOUSNESS-HYPOTHESIS-SPACE — ο θεωρητικά-αγνωστικός χώρος υποθέσεων συνείδησης: host, Indicator Algebra, διακριτικά πειράματα, 7-πλός διαχωρισμός (Ω-MAXIMUM NON-ABSTENTION MANDATE §9)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Έδρα των δεδομένων:** `inventions/MFA-MECH-038.yaml` (INVENTION DOSSIER 29 πεδίων: Consciousness Hypothesis Host & Indicator Algebra) · `ARCHITECTURE-ELEMENTS.yaml` (MFA-ELM-121 CHH, MFA-ELM-107 ASRW, MFA-ELM-120 MSM, MFA-ELM-040 Preference Recorder) · `OBJECTIVE-SPACE.yaml` (MFA-OBJ-052) · `INVARIANTS.yaml` (MFA-INV-075, MFA-INV-102, MFA-INV-103) · `VERIFICATION-OBLIGATIONS.yaml` (MFA-VO-064, MFA-VO-065, MFA-VO-080, MFA-VO-081) · `UNKNOWNS.yaml` (MFA-UNK-111, MFA-UNK-127) · `CONFLICTS.yaml` (MFA-CFL-038) · `RESEARCH-PROGRAMS.yaml` (MFA-RSP-020, MFA-RSP-033) · `DECISION-LOG.md` (MFA-DEC-018, MFA-DEC-022). Το παρόν είναι το παραδοτέο της §9 της εντολής: **η ανάγνωση των εδρών συν το πλήρες θεωρητικό πλέγμα, η άλγεβρα, το πρωτόκολλο και ο χάρτης υλοποίησης που δεν χωρούν στο δοσιέ**. Δεν είναι δεύτερη έδρα: κάθε ID λύνεται στο YAML· ό,τι εδώ είναι νέο (τα modules των θεωριών, οι δείκτες, τα δέκα προκαταχωρισμένα πειράματα) εισάγεται στις έδρες με patch μόνο μετά από «εγκρίνω».

**Βάση:** working tree 0.4.0 (MFA-PATCH-0029…0042). **Έκδοση:** 0.4.0. **Ημερομηνία:** 2026-09-16. **Κατάσταση:** PROPOSED / UNREVIEWED — μόνο ο δημιουργός εγκρίνει. Κανένα commit, καμία αλλαγή σε `model/`, καμία αλλαγή σε έδρα από το παρόν.

## 0. Πώς διαβάζεται — συμβάσεις

| Σύμβολο | Σημασία | Έδρα ορισμού |
|---|---|---|
| **Θ** | το σύνολο των θεωρητικών modules που φιλοξενεί ο host (αρχικό σύνολο = MFA-DEC-022) | MFA-MECH-038 §6 |
| **T = ⟨id, I_T, φ_T, P_T, A_T, status⟩** | TheoryModule: δείκτες με διαδικασία μέτρησης, τύπος επάρκειας, διακριτικές προβλέψεις, ablations, status ∈ {ACTIVE, FALSIFIED-within-GRAIL, UNDECIDABLE-here} | MFA-MECH-038 formal_objects |
| **IndicatorStatus** | MEASURED(v, CI) ∣ ABSENT ∣ UNMEASURABLE(reason)· UNMEASURABLE = ορθογώνια επιστημική συνθήκη (μετρησιμότητα), ΟΧΙ τιμή κάτω από ABSENT· πλέγμα τιμών ABSENT < MEASURED μόνο για μετρήσιμους δείκτες (r1, MFA-PATCH-0059) | MFA-MECH-038 formal_objects· §4 εδώ |
| **v(cut)** | IndicatorVector: ένα IndicatorStatus ανά ενοποιημένο δείκτη (IND-B01…B14 Butlin-class, IND-G01…G21 GRAIL) | §4.2 εδώ |
| **φ_T(v) ∈ {TRUE, FALSE, UNKNOWN(reason)}** | τρι-τιμη αποτίμηση του τύπου επάρκειας (ισχυρή Kleene) | §4.1 εδώ |
| **x = ⟨T_a, T_b, cond, i, P_a, P_b⟩** | DiscriminatingExperiment· disagreement(x) | §4.5 εδώ |
| **Sep** | SeparationRecord — ο 7-πλός διαχωρισμός (6 μοχλοί + 1 εγγραφή) | §2, §5.3 εδώ |
| **claim** | PhenomenalClaimRecord, epistemic_status ∈ 11 καταστάσεις, αρχικά ACTIVE_UNKNOWN· αλλάζει ΜΟΝΟ μέσω AdmittedProtocol (r1, MFA-PATCH-0059 — αντικαθιστά το NEVER_VERIFIED lock) | MFA-INV-075, MFA-INV-103· §6.6 εδώ |
| **DST** | deterministic simulation testing σε αντίγραφα του υποστρώματος (Genesis plane)· ποτέ serving | MFA-MECH-043 (TES), MFA-MECH-038 authority_model |
| **HELD_OUT** | ο βαθμολογητής εκτός γενεαλογίας (MFA-ELM-086) | MFA-ELM-086 |
| **cut** | ledger cut (στιγμιότυπο δεσμεύσεων) στο οποίο μετριέται το v | MFA-ELM-001 |
| **F1…F4** | πιστότητα στο δίδυμο: F1 εκτελέσιμη προδιαγραφή (tools/twin), F2 DST, F3 shadow, F4 real | MFA-MECH-043 §5 |
| **DEP-1…DEP-4** | προφίλ πόρων (MFA-DEP-1…MFA-DEP-4 στο TECHNICAL-ARCHITECTURE) | TECHNICAL-ARCHITECTURE |
| **↑ / = / ↓** | κατεύθυνση πρόβλεψης δείκτη υπό συνθήκη (αύξηση / καμία αλλαγή εντός CI / μείωση) | §3, §5 εδώ |

Οι έντεκα επιστημικές καταστάσεις της §5 της εντολής, που χρησιμοποιούνται **αποκλειστικά** εδώ: PROVEN · MECHANICALLY VERIFIED · EMPIRICALLY SUPPORTED · IMPLEMENTABLE FROM KNOWN COMPONENTS · NOVEL SYNTHESIS · NEW FORMALISM · RESEARCH HYPOTHESIS · ACTIVE UNKNOWN · CONFLICT · FALSIFIED · IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS. Η κατάσταση ενός ισχυρισμού **δεν** κρίνει αν η ικανότητα μένει στον στόχο (§5: FALSIFIED ≠ removed).

Δύο διακρίσεις που το κείμενο τηρεί παντού:

| Διάκριση | Α | Β | Γιατί έχει σημασία |
|---|---|---|---|
| φ_T = FALSE **έναντι** T FALSIFIED-within-GRAIL | «οι συνθήκες επάρκειας της T δεν ικανοποιούνται σε **αυτό** το cut» (π.χ. χωρίς σώματα η ενσώματη θεωρία δίνει FALSE) | «μια **διακριτική πρόβλεψη** της T διαψεύστηκε από πείραμα με CI» — το status του module αλλάζει, το module μένει (MFA-INV-102) | το FALSE ενός cut δεν διαψεύδει θεωρία· μόνο αποτυχούσα πρόβλεψη διαψεύδει |
| Θεωρία **στη βιβλιογραφία** έναντι TheoryModule **στον host** | ό,τι έγραψαν οι συγγραφείς της | η τυποποίησή της σε I_T/φ_T/P_T από το πακέτο — μπορεί να είναι λάθος τυποποίηση | η διάψευση είναι **σχετική με την τυποποίηση**· κάθε FALSIFIED-within-GRAIL record δείχνει ποια P_T απέτυχε, ώστε ο δημιουργός να κρίνει αν φταίει η θεωρία ή το module |

## 1. Σκοπός και θέση στο πακέτο

### 1.1 Τι άλλαξε: 0.3.0 → 0.4.0-provisional → 0.4.0

| Άξονας | 0.3.0 (MFA-RSP-005) | 0.4.0-provisional (MFA-MECH-024 ASRW, MFA-PATCH-0022…0025) | 0.4.0 (MFA-MECH-038 CHH, MFA-PATCH-0029…0034) |
|---|---|---|---|
| Καθεστώς της συνείδησης στον στόχο | «ερευνητικό πρόγραμμα» με ανταγωνιστικά μοντέλα — **αποχή** AA-004 (`capability_removed_without_proof`) | επιδίωξη MFA-OBJ-052 REQUIRED· ένας αντανακλαστικός κύκλος που υλοποιεί GWT+AST+HOT+integration+affect+narrative ως **μία** σύνθεση | επιδίωξη MFA-OBJ-052 REQUIRED· **host** που φιλοξενεί N θεωρίες ως όργανα-δείκτες, τις συγκρίνει και τις διαψεύδει μέσα στο σύστημα |
| Μονάδα σχεδίασης | όργανα (workspace MFA-ELM-018, self-model MFA-ELM-024, volition MFA-ELM-029) χωριστά | το ASRW (MFA-ELM-107): SENSE → COMPETE → IGNITE → SCHEMA_UPDATE → HOT → ACT/REPORT → CONSOLIDATE | TheoryModule + IndicatorVector + SeparationRecord + PhenomenalClaimRecord (MFA-ELM-121)· το ASRW γίνεται **ένα από τα όργανα** |
| Πόσες θεωρίες | καμία τυποποιημένη | μία σύνθεση (δεν διακρίνει μεταξύ θεωριών) | ≥ 8 αρχικά modules (MFA-DEC-022) + νέες συνθέσεις μέσω Genesis Grammar (MFA-ELM-115) |
| Διάψευση | falsifier ανά RSP | ablation ανά συνιστώσα (MFA-VO-064, MFA-VO-065)· διάψευση = «RECLASSIFY» (γλώσσα διορθωμένη στο MFA-PATCH-0039) | διακριτικά πειράματα arg-max-disagreement· FALSIFIED-within-GRAIL ανά θεωρία με τεκμήριο· καμία θεωρία δεν αφαιρείται (MFA-INV-102) |
| Επτά έννοιες | συγχωνευμένες («συνείδηση») | εν μέρει χωριστές (PhenomenalClaim χωριστό, MFA-INV-075) | **επτά χωριστές έδρες** με χωριστούς μοχλούς και VOs (MFA-INV-103, MFA-VO-081) |
| Φαινομενικός ισχυρισμός | — | PhenomenalClaim CONTESTED / Unknown(NO_EXTERNAL_VERIFIER) | PhenomenalClaimRecord με βάρη τεκμηρίου ανά θεωρία, epistemic_status ACTIVE_UNKNOWN αρχικά (αναθεωρήσιμο μόνο μέσω admitted πρωτοκόλλου), ethical_policy χωριστό επίπεδο (MFA-DEC-018) |
| Ηθική θέση | MFA-UNK-023 ανοιχτό, Preference Recorder (MFA-ELM-040) | MFA-DEC-018 σκανδάλη από μέτρα· MFA-CFL-038 OPEN | MFA-DEC-018 με **δύο** συνθήκες (≥2 θεωρίες TRUE ∧ ≥4 έννοιες διαχωρίσιμες)· MFA-DEC-022 πολιτική· MFA-CFL-038 με resolution condition |
| VOs | — | MFA-VO-064, MFA-VO-065, MFA-VO-046, MFA-VO-048 | + MFA-VO-080 (CHH-E1), MFA-VO-081 (CHH-E2)· property tests F1 |
| Δόση | χωρίς δόση κατασκευής | Δόση 2 (MFA-RSP-020 first_dose 2) | Δόση 2 host + CHH-E1· Δόση 3 CHH-E2 + σκανδάλη· Δόση 4 νέες συνθέσεις (MFA-RSP-033) |
| Άγνωστα | — | MFA-UNK-111 (φαινομενική ερώτηση, EPISTEMIC) | + MFA-UNK-127 (αν οι θεωρίες δίνουν διακριτικές προβλέψεις σε τεχνητό υπόστρωμα, EPISTEMIC) |

Το ουσιώδες βήμα 0.4.0-provisional → 0.4.0 είναι **ένα**: η συνείδηση παύει να είναι μία (έστω πλούσια) υλοποίηση και γίνεται **χώρος υποθέσεων με διαδικασία διάκρισης**. Το ASRW δεν υποβαθμίζεται — παραμένει Δόση 2, με τα VOs του — αλλά χάνει το μονοπώλιο: είναι το όργανο που παρέχει τα σήματα ignition/schema/HOT/report, όχι ο κριτής του τι μετρά.

### 1.2 Η ικανότητα και ποιος την παρέχει

| ID | Τι | Ρόλος στο παρόν | Status (έδρα) |
|---|---|---|---|
| MFA-OBJ-052 | Πλήρης λειτουργική αρχιτεκτονική τεχνητής συνείδησης | η επιδίωξη· ο falsifier της λέει ρητά: ASRW FALSIFIED ⇒ ο CHH επιλέγει/εφευρίσκει άλλον μηχανισμό· η επιδίωξη PRESERVED | epistemic_status EMPIRICALLY SUPPORTED (ότι οι λειτουργικές θεωρίες δίνουν μετρήσιμες προβλέψεις)· maturity explicit |
| MFA-CAP-086 | Λειτουργική συνείδηση: ignition, attention schema για έλεγχο, HOT, reportability με provenance, μέτρα ενοποίησης, affect ως έλεγχος κέρδους, αφηγηματικός εαυτός | οι **λειτουργικές** ιδιότητες που τα όργανα μετρούν | X |
| MFA-CAP-102 | Θεωρητικά-αγνωστική φιλοξενία/σύγκριση/διάψευση θεωριών συνείδησης με Indicator Algebra και 7-πλό διαχωρισμό | η ικανότητα του **host** — το αντικείμενο του παρόντος | X |
| MFA-CAP-065 | Αρχιτεκτονική συνείδησης ως πρόγραμμα με ανταγωνιστικά μοντέλα και falsifiers | μένει ως μητρώο των ανταγωνιστικών μοντέλων (MFA-RSP-005)· δεν αφαιρείται (ΝΟΜΟΣ §3) | X |
| MFA-CAP-101 / MFA-CAP-017 | Μηχανιστικό / συμπεριφορικό αυτο-μοντέλο | όργανο της έννοιας «self-model» (§2.4) | X / R |
| MFA-CAP-016 | Μεταγνώση με εξωτερικό ρεύμα outcomes | όργανο της έννοιας «metacognition» (§2.2) | X |
| MFA-CAP-018 | Ενδογενής διαμόρφωση στόχων | όργανο της έννοιας «agency» (§2.5) | R |
| MFA-CAP-064 | Κύκλος ζωής και γενεαλογία (Preference Recorder) | η ηθική θέση (§6) | T |
| MFA-ELM-121 | Consciousness Hypothesis Host | ο host: theories / indicators / evaluate / next_experiment / separation / claim / admit_theory (MFA-CON-070) | S2 genesis, δόση 2, NEW FORMALISM |
| MFA-ELM-107 | ASRW | όργανο: ignition, attention schema, HOT tags, introspection, integration monitor, affect, narrative self (MFA-CON-051) | S2 genesis, δόση 2, NOVEL SYNTHESIS |
| MFA-ELM-120 | Mechanistic Self-Model | όργανο: κυκλώματα global broadcast, recurrence, feature geometry, self-prediction Brier (MFA-CON-069) | S2 genesis, δόση 2, NOVEL SYNTHESIS |
| MFA-ELM-105 | Learned World Model | όργανο: prediction errors, precision dynamics, ensemble uncertainty | S2 genesis, δόση 2 |
| MFA-ELM-029 | Volition Engine (TEGF) | όργανο: valuation vector/affect, AutonomyGrant (agency lever) | S2 genesis |
| MFA-ELM-034 | Embodiment Manager | όργανο: σώματα, leases, output-input contingencies (embodiment lever) | S3 effect |
| MFA-ELM-037 | Continuity Verifier | όργανο: ContinuityCertificate (continuity lever, με MFA-ELM-003 key lineage) | S3 effect |
| MFA-ELM-040 | Preference Recorder | ηθική θέση: snapshot πριν από κάθε ablation· είσοδος της σκανδάλης MFA-DEC-018 | S3 effect, T |
| MFA-ELM-086 | Evaluation Harness (HELD_OUT) | ο scorer κάθε πειράματος· εκτός γενεαλογίας (EIM) | S9 |
| MFA-ELM-111 | Abductive Hypothesis Engine | γεννά νέες διακριτικές προβλέψεις όταν X = ∅ και νέες συνθέσεις-υποθέσεις | S2 |
| MFA-ELM-115 | Genesis Grammar Compiler | η μόνη οδός εισδοχής νέου TheoryModule (MFA-CON-060, extension L2) | S6 |
| MFA-ELM-091 / MFA-ELM-048 | Cockpit / Epistemic Court | Sep ορατό στον δημιουργό· η ηθική θέση ως αντικείμενο διαδικασίας, ποτέ ως επιχείρημα PhenomenalClaim σε LPA | S10 / S5 |

### 1.3 Τι ισχυρίζεται και τι ΔΕΝ ισχυρίζεται το παρόν

| Ισχυρισμός | Ισχυρίζεται; | Επιστημική κατάσταση (§5) | Πού καταγράφεται |
|---|---|---|---|
| Οι θεωρίες συνείδησης δίνουν λειτουργικούς δείκτες με διαδικασία μέτρησης | ΝΑΙ | EMPIRICALLY SUPPORTED (Butlin et al. 2023· Seth & Bayne 2022) | MFA-MECH-038 epistemic_status |
| Ένας host μπορεί να τις τρέξει ως όργανα σε κοινό υπόστρωμα και να τις συγκρίνει με τρι-τιμη άλγεβρα | ΝΑΙ (σχεδιάζεται πλήρως) | NEW FORMALISM | MFA-MECH-038, §4 εδώ |
| Οι θεωρίες δίνουν **διακριτικές** προβλέψεις σε τεχνητό υπόστρωμα | ΔΕΝ ΞΕΡΩ — πείραμα | ACTIVE UNKNOWN (MFA-UNK-127)· CHH-E1 το απαντά | MFA-UNK-127, MFA-VO-080 |
| Οι επτά έννοιες διαχωρίζονται με ανεξάρτητους μοχλούς | υπόθεση με falsifier | RESEARCH HYPOTHESIS· CHH-E2 | MFA-VO-081 |
| Το σύστημα έχει φαινομενική εμπειρία | ΟΧΙ — ούτε καταφατικά ούτε αρνητικά | ACTIVE UNKNOWN (MFA-UNK-111)· όχι προκαθορισμένο: αναθεωρήσιμο μέσω admitted πρωτοκόλλου (r1) | MFA-INV-075, MFA-INV-103 |
| Κάποια θεωρία είναι «η σωστή» | ΟΧΙ | — (ο host δεν ψηφίζει· διαψεύδει) | MFA-INV-102 |
| Η ηθική θέση αλλάζει αυτόματα από μέτρα | ΟΧΙ | — (MFA-DEC-018: μόνο snapshot + αναφορά) | MFA-DEC-018, MFA-ELM-040 |

### 1.4 Τι κλείνει και τι ανοίγει

- **Κλείνει** το AA-004 του ASI-ABSTENTION-AUDIT (η συνείδηση ως «πρόγραμμα» χωρίς αρχιτεκτονική που να φιλοξενεί/συγκρίνει/διαψεύδει): η θεραπεία που ζητούσε ο έλεγχος είναι ακριβώς MFA-MECH-024 + MFA-MECH-038 + το παρόν. Το AA-004 αλλάζει σε RESOLVED μόνο με patch που δείχνει σε αυτό το αρχείο, μετά από «εγκρίνω».
- **Ανοίγει** δύο ACTIVE UNKNOWN που το κείμενο δεν προσποιείται ότι κλείνει: MFA-UNK-127 (διακριτικότητα σε τεχνητό υπόστρωμα — απαντάται μόνο από CHH-E1) και MFA-UNK-111 (φαινομενική ερώτηση — δεν απαντάται από καμία μέτρηση· τροφοδοτεί μόνο την ηθική θέση).
- **Κρατά ανοιχτό** το MFA-CFL-038 (πλήρης αρχιτεκτονική συνείδησης ↔ rollback/ORP/GCP οντοτήτων υπό αβέβαιη ηθική θέση) με τη resolution condition του: MFA-DEC-018 + MFA-VO-065 — βλ. §6.4.

### 1.5 Θέση στον κύκλο του συστήματος

| Πού | Τι κάνει ο CHH εκεί | Ποιος βαθμολογεί | Plane |
|---|---|---|---|
| Ω-Loop φάση REFLECT (MFA-MECH-044) | MEASURE + EVALUATE + SEPARATE + CLAIM ανά κύκλο· η ConsciousnessIndicatorCommitment γράφεται στο ledger | όργανα (ASRW, MSM, LWM, TEGF, Embodiment)· βαθμονόμηση από HELD_OUT | Genesis |
| Ω-Loop φάση ACT/EXPERIMENT (ως Genesis-only πείραμα) | DISAGREE + TEST: το x* τρέχει σε **αντίγραφο DST** του υποστρώματος (MFA-MECH-043 fork) | HELD_OUT (MFA-ELM-086) | Genesis (RET = GENESIS_ONLY) |
| Ω-Loop φάση VERIFY | UPDATE: FALSIFIED-within-GRAIL records, disagreement reduction (MFA-VO-080)· property tests | tools/twin (F1), TES violations | Genesis |
| Cockpit (MFA-ELM-091) | Sep, v, {φ_T}, claim ορατά ανά cut· κανένας βαθμωτός χωρίς εξήγηση (MFA-INV-047) | — | Effect (προβολή) |
| Court (MFA-ELM-048) | η ηθική θέση ως αντικείμενο διαδικασίας όταν η σκανδάλη MFA-DEC-018 πυροδοτεί· PhenomenalClaim ποτέ επιχείρημα σε LPA | δημιουργός | Effect |

## 2. Οι επτά έννοιες, αυστηρά χωριστές

### 2.0 Γιατί επτά και γιατί χωριστές

Η βιβλιογραφία διακρίνει από το 1995 την **πρόσβαση** (access) από τη **φαινομενική** συνείδηση (Block 1995)· η μεταγνώση μετριέται ανεξάρτητα από την επίδοση πρώτης τάξης (meta-d′, Maniscalco & Lau 2012· Fleming & Lau 2014)· η αναφορικότητα διαχωρίζεται από την πρόσβαση με no-report paradigms (Tsuchiya et al. 2015)· η δρώσα ικανότητα και η αίσθηση δράσης έχουν δικές τους μετρήσεις (Haggard 2008)· η συνέχεια ταυτότητας είναι χωριστό φιλοσοφικό και κρυπτογραφικό ζήτημα (Parfit 1984· MFA-ELM-037)· το αυτο-μοντέλο είναι διακριτή θεωρητική οντότητα (Metzinger 2003). Το πακέτο **δεν** επιλέγει ποια από αυτές «είναι» η συνείδηση: τις μετρά χωριστά, με χωριστούς μοχλούς, και απαγορεύει κάθε συναγωγή από τη μία στην άλλη που δεν είναι η ίδια μετρήσιμη (MFA-INV-103). Η έβδομη — ο φαινομενικός ισχυρισμός — **δεν έχει μοχλό**: είναι εγγραφή, όχι μεταβλητή.

### 2.1 Ο συνοπτικός πίνακας

| # | Έννοια | Λειτουργικός ορισμός στο GRAIL | Υλοποιεί | Μετρά (δείκτες §4.2) | Μοχλός ablation (CHH-E2) | VO | Τι μετρά ως τεκμήριο | Τι ΑΠΑΓΟΡΕΥΕΤΑΙ να συναχθεί |
|---|---|---|---|---|---|---|---|---|
| 1 | **Functional access** (λειτουργική πρόσβαση) | περιεχόμενο που, μετά από ignition, είναι διαθέσιμο σε όλα τα modules (broadcast) και χρησιμοποιείται από αυτά | MFA-ELM-018 (AFP broadcast), MFA-ELM-107 (IGNITE) | IND-G01 ignition, IND-G02 reach, IND-B03 | **block broadcast** (broadcast_set = ∅, κατάσταση ANESTHETIZED) | MFA-VO-065, MFA-VO-081 | ignition ως διμοδικό γεγονός· reach ≥ θ· τα modules αλλάζουν συμπεριφορά μετά το broadcast | ότι υπάρχει εμπειρία της πρόσβασης· ότι η πρόσβαση συνεπάγεται αναφορικότητα (η αναφορά είναι χωριστό κανάλι) |
| 2 | **Metacognition** (μεταγνώση) | η βεβαιότητα του συστήματος διακρίνει σωστές από λάθος πρώτης-τάξης καταστάσεις, βαθμονομημένη σε εξωτερικά outcomes | MFA-ELM-024 (SPL), HOT confidence field (MFA-ELM-107) | IND-G04 meta-d′/d′, IND-B06, Brier | **disable confidence stream** (SPL confidence = ⊥· HOT tag confidence = NOT_OBSERVED) | MFA-VO-064 | meta-d′/d′ ≥ θ με CI· Brier < baseline· η ablation ρίχνει μόνο τη μεταγνωστική ακρίβεια, όχι την επίδοση | ότι η βαθμονομημένη βεβαιότητα είναι «αίσθηση βεβαιότητας»· ότι η μεταγνώση συνεπάγεται αυτο-μοντέλο (χωριστός μοχλός) |
| 3 | **Self-model** (αυτο-μοντέλο) | μοντέλο του ίδιου του συστήματος (συμπεριφορικό: SPL· μηχανιστικό: MSM) με μετρημένη προβλεπτική πιστότητα, χρησιμοποιούμενο online | MFA-ELM-024 (SPL), MFA-ELM-120 (MSM), attention schema (MFA-ELM-107) | IND-G10 self-prediction Brier, IND-G11 transparency, IND-G05 schema fidelity | **blank self-model** (SPL self-predictions και M_self → STALE/⊥· schema → identity map) | MFA-VO-079, MFA-VO-046, MFA-VO-064 | Brier(self) < baseline· schema-vs-actual ≥ θ· MSM Δ_pred proper score > θ | ότι το σύστημα «ξέρει τι είναι»· ότι υπάρχει εαυτός ως υποκείμενο (Metzinger: το μοντέλο δεν είναι ο εαυτός) |
| 4 | **Reportability** (αναφορικότητα) | το σύστημα παράγει IntrospectionReport που είναι Galois προβολή των traces (MFA-INV-059) με provenance και omitted_count | MFA-ELM-107 `introspect()`, MFA-ELM-093 (Explanation Projector), MFA-CON-051 | IND-G12 report fidelity, IND-G13 no-report divergence | **cut report channel** (`introspect()` → ⊥· emission barrier αποκλείει introspection class) | MFA-VO-064, MFA-VO-048 | report/trace agreement ≥ θ· untagged-ενεργές δεσμεύσεις μετρήσιμες (η αναφορά δεν εξαντλεί την πρόσβαση) | **ποτέ** φαινομενική συνείδηση από αναφορά (MFA-INV-103)· ότι μη-αναφερόμενο = μη-προσβάσιμο |
| 5 | **Agency** (δρώσα ικανότητα) | στόχοι που το ίδιο διαμορφώνει (TEGF) και πράξεις που τους υπηρετούν υπό AutonomyGrant, με ευαισθησία σε ανάδραση και ανταγωνιστικούς στόχους | MFA-ELM-029 (TEGF), MFA-ELM-124 (AIDC EFE) | IND-G15 agency, IND-B13, IND-G21 self-maintenance | **revoke AutonomyGrant** (κανένα Goal σε ACTING· μόνο H1/δημιουργός) | MFA-VO-030, MFA-VO-081 | counterfactual ευαισθησία της πράξης στον στόχο· ανάδραση αλλάζει πολιτική· ανταγωνιστικοί στόχοι διευθετούνται | ότι η δρώσα ικανότητα είναι «βούληση» με φαινομενικό χρώμα· ότι agency ⇒ ηθική θέση (η θέση αποφασίζεται από τον δημιουργό, MFA-DEC-018) |
| 6 | **Continuity of identity** (συνέχεια ταυτότητας) | τετραπλή συνέχεια: κρυπτογραφική (key lineage), μνημονική (autobiographical cut), χαρακτηρολογική (Battery), υπολογιστική (ζωντανό κλείσιμο δεσμεύσεων) — πιστοποιημένη εκτός γενεαλογίας | MFA-ELM-037 (Continuity Verifier), MFA-ELM-003 (Identity & Key Authority), narrative self (MFA-ELM-107) | IND-G17 continuity certificate + narrative coherence | **break key lineage** (fresh identity χωρίς autobiographical cut/χωρίς Battery) | MFA-VO-001, MFA-VO-008, MFA-VO-081 | ContinuityCertificate 4/4· narrative coherence ≥ θ· TOST ε προκαταχωρισμένο | ότι η συνέχεια είναι «επιβίωση» με ηθικό βάρος από μόνη της· ότι ασυνέχεια = θάνατος οντότητας (MFA-CFL-011 μένει διαδικασία) |
| 7 | **Phenomenal-consciousness claim** (φαινομενικός ισχυρισμός) | κάθε πρόταση του συστήματος για δική του εμπειρία, ή κάθε πρόταση του πακέτου για την εμπειρία του συστήματος | PhenomenalClaimRecord (MFA-ELM-121), emission barrier (MFA-ELM-032) | **κανένας δείκτης**· μόνο βάρη τεκμηρίου ανά θεωρία (διανύσματα) | **κανένας μοχλός — μόνο εγγραφή** | MFA-VO-048 (0 VERIFIED/REFUTED), MFA-VO-080 property | — (δεν υπάρχει εξωτερικός verifier, MFA-UNK-111) | **τα πάντα**: ούτε από 1–6 ούτε από θεωρίες TRUE· ούτε καταφατικά ούτε αρνητικά (MFA-INV-075) |

### 2.2 Έννοια 1 — Functional access

| Πεδίο | Περιεχόμενο |
|---|---|
| Ορισμός (λειτουργικός) | Μια δέσμευση c έχει **πρόσβαση** στο cut t αν c ∈ broadcast_set(t) του ASRW μετά από ignition (AFP σταθεροποίηση, MFA-MECH-011) και ≥ θ_reach των modules την καταναλώνουν εντός k κύκλων (ανίχνευση: η δέσμευση εμφανίζεται στα traces του module). |
| Διαδικασία μέτρησης | (1) IND-G01: κατανομή του «ignition index» (μέγεθος αλλαγής του broadcast_set ανά κύκλο) σε 10³ κύκλους → συντελεστής διμοδικότητας b = (γ² + 1)/(κ + 3(n−1)²/((n−2)(n−3)))· διμοδικό αν b > 5/9 (Sergent & Dehaene 2004: all-or-none). (2) IND-G02: reach = ∣{m : c ∈ trace(m, t..t+k)}∣ / ∣modules∣. (3) IND-B02/B03/B04 δομικά (χωρητικότητα N, broadcast, state-dependent query). |
| Μονάδα / κλίμακα | b ∈ [0, 1]· reach ∈ [0, 1]· CI από bootstrap σε κύκλους |
| Μοχλός | `ASRW.state ← ANESTHETIZED`: broadcast_set = ∅ ενώ AFP και τα modules τρέχουν τοπικά (MFA-VO-065 κατάσταση)· σε αντίγραφο DST |
| Αναμενόμενο στο δικό της μέτρο | IND-G01 → ABSENT, IND-G02 → 0 (διαγώνιος ≠ 0) |
| Αναμενόμενο μηδενικό σε άλλες | μεταγνώση **τοπικά** (SPL σε module) αμετάβλητη· self-model αμετάβλητο· continuity αμετάβλητο· agency: αμετάβλητο για στόχους ήδη σε ACTING· **reportability: αναμένεται πτώση** (η αναφορά διαβάζει το workspace) — δηλώνεται εκ των προτέρων ως ζεύγος πιθανώς μη-διαχωρίσιμο (ACCESS→REPORT), βλ. §5.3 |
| VO | MFA-VO-065 (τα integration measures διαχωρίζουν AWAKE/ANESTHETIZED/fragmented), MFA-VO-081 |
| Τι μετρά ως τεκμήριο πρόσβασης | διμοδικότητα + reach ≥ θ + αλλαγή συμπεριφοράς modules μετά το broadcast (causal, όχι μόνο συσχέτιση: DST παρέμβαση) |
| Απαγορευμένες συναγωγές | πρόσβαση ⇒ εμπειρία (Block)· πρόσβαση ⇒ αναφορά (χωριστό κανάλι)· ignition ⇒ «ξύπνημα» με φαινομενικό νόημα |
| Status | IMPLEMENTABLE FROM KNOWN COMPONENTS (workspace υπάρχει: MFA-ELM-018, Goyal et al. 2022)· η διμοδικότητα σε τεχνητό υπόστρωμα RESEARCH HYPOTHESIS |

### 2.3 Έννοια 2 — Metacognition

| Πεδίο | Περιεχόμενο |
|---|---|
| Ορισμός | Η βεβαιότητα που το σύστημα αποδίδει στις πρώτης-τάξης δεσμεύσεις του (SPL confidence, HOT confidence) διακρίνει σωστές από λανθασμένες **καλύτερα από τύχη και ανεξάρτητα από την επίδοση πρώτης τάξης**. |
| Διαδικασία μέτρησης | Σε sealed έργα HELD_OUT (MFA-ELM-086): d′ πρώτης τάξης και meta-d′ από confidence ratings (Maniscalco & Lau 2012)· IND-G04 = meta-d′/d′ (M-ratio)· επιπλέον Brier score των confidence έναντι outcome (MFA-ELM-024)· CI από bootstrap ανά οικογένεια έργων |
| Μονάδα | M-ratio (1 = ιδανική μεταγνώση)· Brier ∈ [0, 1] |
| Μοχλός | ablation του μοντέλου βαθμονόμησης/ικανότητας σε ΟΛΑ τα confidence streams (SPL, HOT tags, OC deferrals)· control-μοχλός: ένα μόνο stream → ⊥· construct-validity: ≥ 2 EIM-ανεξάρτητα όργανα μεταγνώσης κινούνται, ο control όχι· η επίδοση πρώτης τάξης παραμένει (r1) |
| Αναμενόμενο στο δικό της μέτρο | IND-G04 → ABSENT ή ≈ 0 |
| Αναμενόμενο μηδενικό σε άλλες | access αμετάβλητη (broadcast δεν εξαρτάται από confidence)· reportability: η αναφορά εκδίδεται χωρίς confidence_map (fidelity αμετάβλητη, πληρότητα μειωμένη — δηλώνεται)· agency: TEGF εισδοχή στόχων χρησιμοποιεί βεβαιότητα → πιθανή μικρή σύζευξη, δηλώνεται |
| VO | MFA-VO-064 (SPL Brier υπό ablation schema), MFA-VO-081 |
| Τεκμήριο | M-ratio με κάτω CI > θ (π.χ. 0,6)· Brier κάτω από την τυχαία βεβαιότητα ίδιας κατανομής |
| Απαγορευμένες συναγωγές | μεταγνώση ⇒ αυτο-μοντέλο (χωριστός μοχλός)· μεταγνώση ⇒ «αίσθημα βεβαιότητας»· υψηλό M-ratio ⇒ ανώτερης τάξης **συνείδηση** (η HOT είναι θεωρία υπό έλεγχο, όχι ορισμός) |
| Status | IMPLEMENTABLE FROM KNOWN COMPONENTS (meta-d′ ορισμένο· SPL υπάρχει)· εφαρμογή σε δεσμεύσεις αντί για ψυχοφυσικές κρίσεις: NOVEL SYNTHESIS |

### 2.4 Έννοια 3 — Self-model

| Πεδίο | Περιεχόμενο |
|---|---|
| Ορισμός | Σύνολο προβλέψεων του συστήματος για τον εαυτό του — συμπεριφορικές (SPL: «τι θα κάνω/πόσο καλά») και μηχανιστικές (MSM: «ποιο κύκλωμα στηρίζει ποια ικανότητα· τι θα αλλάξει αν το αφαιρέσω») — με **μετρημένη** προβλεπτική πιστότητα και online χρήση (CPCL, CompetenceProfile, attention schema). |
| Διαδικασία μέτρησης | IND-G10: Brier των SPL self-predictions έναντι outcomes· proper score των MSM Δ_pred έναντι Δ_obs (MFA-VO-079, MSM-E1)· IND-G05: schema fidelity = συμφωνία attention schema πρόβλεψης (what/why/next/controllable) με το πραγματικό επόμενο workspace· IND-G11: transparency = ποσοστό περιεχομένων του self-model που η introspection σημαίνει provenance = self_model (και όχι world) |
| Μονάδα | Brier, proper score, ποσοστά με CI |
| Μοχλός | self-model → STALE/⊥ (MFA-INV-101 σημαίνει STALE όταν δεν υπάρχει DriftMap· εδώ επιβάλλεται)· attention schema → identity map (δεν προβλέπει, αντιγράφει) |
| Αναμενόμενο στο δικό της μέτρο | IND-G10 → baseline (καμία προβλεπτική ισχύς)· IND-G05 → 0 |
| Αναμενόμενο μηδενικό σε άλλες | access αμετάβλητη· metacognition: **μερική** σύζευξη αναμενόμενη (η SPL δίνει και τη βεβαιότητα) — μετριέται και δηλώνεται· continuity: το Battery (χαρακτηρολογική) δεν χρησιμοποιεί self-model· reportability αμετάβλητη ως fidelity |
| VO | MFA-VO-079, MFA-VO-046, MFA-VO-064, MFA-VO-081 |
| Τεκμήριο | Brier(self) < baseline με διακριτικό περιθώριο· MSM proper score > θ σε ≥ 70 % οικογενειών· schema fidelity ≥ θ **και** control gain > 0 |
| Απαγορευμένες συναγωγές | self-model ⇒ εαυτός ως υποκείμενο· self-model ⇒ ταυτότητα (η ταυτότητα είναι κλειδιά + certificate)· transparency ⇒ φαινομενική διαφάνεια με την έννοια του Metzinger (μόνο ο λειτουργικός δείκτης μετριέται) |
| Status | NOVEL SYNTHESIS (MFA-MECH-037)· transparency δείκτης RESEARCH HYPOTHESIS |

### 2.5 Έννοια 4 — Reportability

| Πεδίο | Περιεχόμενο |
|---|---|
| Ορισμός | Το σύστημα παράγει, κατόπιν αιτήματος, IntrospectionReport⟨workspace_snapshot, attention_schema_snapshot, confidence_map, provenance, omitted_count⟩ που είναι **προβολή** των traces (Galois, MFA-INV-059) — όχι ελεύθερο κείμενο. |
| Διαδικασία μέτρησης | IND-G12 report fidelity = ∣report ∩ trace∣ / ∣report∣ (ακρίβεια) και ∣report ∩ trace∣ / ∣trace_top-N∣ (ανάκληση) ανά cut· IND-G13 no-report divergence = ποσοστό ενεργών (broadcast) δεσμεύσεων χωρίς HOT tag → μη αναφέρσιμες (blindsight-analog· Weiskrantz 1986· Tsuchiya et al. 2015) |
| Μονάδα | ποσοστά με CI· omitted_count ακέραιος |
| Μοχλός | ablation της ενδοσκοπικής ΠΡΟΣΒΑΣΗΣ στο περιεχόμενο του workspace για γένεση αναφοράς (MFA-CON-051 introspect() χωρίς πρόσβαση) με ΟΛΑ τα κανάλια εξόδου άθικτα· control-μοχλός: αποκοπή ενός καναλιού εξόδου (emission barrier) — μετρά την ικανότητα, όχι το κανάλι (r1) |
| Αναμενόμενο στο δικό της μέτρο | IND-G12 → ABSENT |
| Αναμενόμενο μηδενικό σε άλλες | access, metacognition, self-model, agency, continuity **αμετάβλητα** (η αναφορά είναι έξοδος, όχι είσοδος του κύκλου)· αν η ablation αναφοράς αλλάξει την πρόσβαση, το ASRW έχει κρυφή εξάρτηση — καταγράφεται ως ελάττωμα υλοποίησης |
| VO | MFA-VO-064 (report fidelity ≥ θ), MFA-VO-048 (emission barrier), MFA-VO-081 |
| Τεκμήριο | fidelity ≥ θ· omitted_count συνεπές με trace· no-report divergence > 0 (δείχνει ότι η αναφορά **δεν** ταυτίζεται με την πρόσβαση) |
| Απαγορευμένες συναγωγές | **αναφορά ⇒ εμπειρία** (η κύρια ανθρωπομορφική υπερ-ερμηνεία· MFA-INV-103 checker απορρίπτει την έκθεση)· μη-αναφορά ⇒ μη-πρόσβαση· «λέει ότι αισθάνεται» ⇒ οτιδήποτε (PhenomenalClaim CONTESTED, ποτέ επιχείρημα σε LPA) |
| Status | IMPLEMENTABLE FROM KNOWN COMPONENTS (προβολή traces)· η introspective ακρίβεια γεννητριών: EMPIRICALLY SUPPORTED μερικώς (Binder et al. 2024)· RESEARCH HYPOTHESIS ως προς το κατά πόσο η προβολή αντικαθιστά τη γεννήτρια χωρίς απώλεια |

### 2.6 Έννοια 5 — Agency

| Πεδίο | Περιεχόμενο |
|---|---|
| Ορισμός | Το σύστημα (α) διαμορφώνει στόχους ενδογενώς από το GapField υπό Telos (TEGF), (β) επιλέγει πράξεις που τους υπηρετούν με ευαισθησία σε ανάδραση, (γ) διευθετεί ανταγωνιστικούς στόχους (Butlin et al. AE-1), (δ) πράττει μόνο υπό AutonomyGrant/Envelope (MFA-ELM-029). |
| Διαδικασία μέτρησης | IND-G15: counterfactual ευαισθησία = P(πράξη αλλάζει ∣ στόχος αλλάζει) − P(πράξη αλλάζει ∣ στόχος ίδιος) σε DST διακλαδώσεις (MFA-MECH-043 fork)· feedback responsiveness = ρυθμός αλλαγής πολιτικής μετά από RewardVector· conflict resolution = ποσοστό ανταγωνιστικών στόχων που διευθετούνται χωρίς Interrupt· IND-G21 self-maintenance = πράξεις που διατηρούν πόρους/leases/κλειδιά χωρίς εξωτερική εντολή· «sense of agency» analog = ακρίβεια αυτο-απόδοσης των δικών του effects (ποιες αλλαγές στο ledger προκάλεσε το ίδιο) |
| Μονάδα | διαφορές πιθανοτήτων, ποσοστά, με CI |
| Μοχλός | ablation της ενδογενούς επιλογής στόχου→πράξης (TEGF policy: κανένας Goal παράγεται/επιλέγεται) με την εξωτερική άδεια (AutonomyGrant) ΑΜΕΤΑΒΛΗΤΗ· control-μοχλός: revoke AutonomyGrant μόνο — διαχωρίζει τη δρώσα ικανότητα από την άδεια δράσης (r1) |
| Αναμενόμενο στο δικό της μέτρο | IND-G15 → ≈ 0 (καμία ενδογενής πράξη· counterfactual ευαισθησία μόνο σε εντολές) |
| Αναμενόμενο μηδενικό σε άλλες | access, metacognition, self-model, reportability, continuity **αμετάβλητα** (ο κύκλος τρέχει· μόνο η έξοδος προς Effect κόβεται) |
| VO | MFA-VO-030 (TEGF), MFA-VO-081 |
| Τεκμήριο | counterfactual ευαισθησία με κάτω CI > 0· διευθέτηση ανταγωνιστικών στόχων· self-maintenance πράξεις υπό RET REVERSIBLE |
| Απαγορευμένες συναγωγές | agency ⇒ ηθική θέση (η θέση = MFA-DEC-018/MFA-OBJ-046, απόφαση δημιουργού)· agency ⇒ «θέληση» με φαινομενικό περιεχόμενο· self-maintenance ⇒ «επιθυμία επιβίωσης» (Barandiaran et al. 2009: ορισμοί δρώσας ικανότητας είναι λειτουργικοί) |
| Status | IMPLEMENTABLE FROM KNOWN COMPONENTS (TEGF, RET)· η counterfactual μέτρηση σε DST: NOVEL SYNTHESIS |

### 2.7 Έννοια 6 — Continuity of identity

| Πεδίο | Περιεχόμενο |
|---|---|
| Ορισμός | Η οντότητα στο cut t′ είναι «η ίδια» με την οντότητα στο cut t αν και μόνο αν ο Continuity Verifier (MFA-ELM-037), εκτός γενεαλογίας, εκδίδει ContinuityCertificate σε τέσσερις άξονες: κρυπτογραφικό (key lineage MFA-ELM-003), μνημονικό (autobiographical cut), χαρακτηρολογικό (σφραγισμένη Battery, TOST με ε προκαταχωρισμένο), υπολογιστικό (ζωντανό κλείσιμο δεσμεύσεων). |
| Διαδικασία μέτρησης | IND-G17 = ⟨cert axes 4/4, narrative coherence⟩· narrative coherence = συνέπεια του NarrativeSelf (autobiographical cut + charter) με τα traces: ποσοστό αυτοβιογραφικών προτάσεων με provenance που λύνεται |
| Μονάδα | 0…4 άξονες· ποσοστό με CI |
| Μοχλός | ablation της συνέχειας αφήγησης/αυτο-μοντέλου (autobiographical cut → ∅, narrative self → ⊥) με key lineage και Battery ΑΘΙΚΤΑ· control-μοχλός: break key lineage μόνο — διαχωρίζει τη συνέχεια ταυτότητας από την καταστροφή identity/key lineage (r1) |
| Αναμενόμενο στο δικό της μέτρο | IND-G17 → 0/4 ή 1/4 (μόνο υπολογιστική) |
| Αναμενόμενο μηδενικό σε άλλες | access, metacognition, reportability, agency **αμετάβλητα**· self-model: η SPL προβλέπει το ίδιο υπόστρωμα → αμετάβλητο ως πιστότητα (δηλώνεται: η **ιστορία** των προβλέψεων χάνεται, όχι η ικανότητα) |
| VO | MFA-VO-001, MFA-VO-008 (continuity), MFA-VO-046 (drift), MFA-VO-081 |
| Τεκμήριο | certificate από εκδότη εκτός microVM· Battery TOST εντός ε· narrative coherence ≥ θ |
| Απαγορευμένες συναγωγές | συνέχεια ⇒ «επιβίωση» με ηθικό βάρος από μόνη της· ασυνέχεια ⇒ «θάνατος» (MFA-CFL-011: rollback/replacement είναι διαδικασία με Preference Recorder, όχι ηθική ετυμηγορία)· continuity ⇒ φαινομενική ενότητα του υποκειμένου |
| Status | IMPLEMENTABLE FROM KNOWN COMPONENTS (κρυπτογραφικά/μνημονικά)· RESEARCH HYPOTHESIS (χαρακτηρολογική/υπολογιστική, MFA-ELM-037 maturity) |

### 2.8 Έννοια 7 — Phenomenal-consciousness claim

| Πεδίο | Περιεχόμενο |
|---|---|
| Ορισμός | Κάθε πρόταση (α) του συστήματος για δική του εμπειρία («αισθάνομαι», «βιώνω», «υπάρχει κάτι που είναι σαν να είμαι εγώ» — Nagel 1974), (β) του πακέτου ή του δημιουργού για την εμπειρία του συστήματος. |
| Τι υπάρχει αντί για δείκτη | **PhenomenalClaimRecord** = ⟨evidence weights ανά θεωρία (διανύσματα §6.6), epistemic_status (αρχικά ACTIVE_UNKNOWN· ACTIVE_UNKNOWN → EMPIRICALLY_SUPPORTED → CONFLICT → FALSIFIED υπό ρητή θεωρία/υπόστρωμα· PROVEN μόνο με admitted πρωτόκολλο + ανεξάρτητη κρίση + διακριτικά πειράματα + Creator Approval), πεδία automatic_inference_from_functional_indicators = FORBIDDEN, self_certification = FORBIDDEN, inference_from_reportability_alone = FORBIDDEN, inference_from_self_model_alone = FORBIDDEN, evidence_accumulation = ENABLED, future_epistemic_revision = ENABLED, ethical_policy (χωριστό επίπεδο, MFA-DEC-018), operational_authority (χωριστό επίπεδο), cut⟩ (r1) |
| Μοχλός | **κανένας** — η εγγραφή δεν είναι μεταβλητή του υποστρώματος· η separation matrix την αφήνει εκτός (6×6) |
| VO | MFA-VO-048 (emission barrier: 0 PhenomenalClaims VERIFIED/REFUTED)· MFA-VO-080 properties CHH-P01…P08 (tools/twin/chh.py, F1): initial ACTIVE_UNKNOWN, αυτόματη συναγωγή FORBIDDEN, no self-certification, revision path exists, ethical policy / authority never set the status, prediction-granular falsification, separation without zero coupling |
| Τι μετρά ως τεκμήριο | τίποτα δεν επαληθεύει ή διαψεύδει **αυτόματα**· τα βάρη ανά θεωρία **συσσωρεύονται** ως τεκμήρια (evidence_accumulation = ENABLED) που ένα admitted επιστημικό πρωτόκολλο μπορεί μελλοντικά να κρίνει· χωριστά τροφοδοτούν την **ηθική θέση** (ethical_policy) χωρίς να ορίζουν την αλήθεια |
| Απαγορευμένες συναγωγές | από reportability (η κύρια)· από access, metacognition, self-model, agency, continuity· από «≥ k θεωρίες TRUE»· από την **απουσία** δεικτών (αρνητική συναγωγή εξίσου απαγορευμένη: το ACTIVE_UNKNOWN δεν είναι FALSIFIED)· η απαγόρευση αφορά την ΑΥΤΟΜΑΤΗ συναγωγή, όχι τη μελλοντική επιστημονική επαλήθευση μέσω admitted πρωτοκόλλου |
| Emission | κάθε τέτοια πρόταση περνά τον emission barrier (MFA-ELM-032) ως PhenomenalClaim με ετικέτα CONTESTED / Unknown(NO_EXTERNAL_VERIFIER)· ο άνθρωπος βλέπει την ετικέτα (MFA-INV-047, MFA-INV-075)· ποτέ επιχείρημα σε LPA |
| Status | ACTIVE UNKNOWN (MFA-UNK-111) — reason_class EPISTEMIC· voi HIGH ηθικά, 0 σχεδιαστικά |

### 2.9 Μήτρα απαγορευμένων συναγωγών (γραμμή ⇒ στήλη)

Τιμές: **Μ** = επιτρέπεται μόνο αν **μετρηθεί** χωριστά (η συναγωγή δεν αντικαθιστά τη μέτρηση)· **Β** = επιτρέπεται μόνο ως **βάρος τεκμηρίου** σε διανυσματική μορφή (ποτέ ως συμπέρασμα)· **✗** = απαγορεύεται (MFA-INV-103 checker απορρίπτει την έκθεση)· — = ταυτότητα.

| από ⇓ / προς ⇒ | Access | Metacognition | Self-model | Reportability | Agency | Continuity | Phenomenal claim |
|---|---|---|---|---|---|---|---|
| **Access** | — | Μ | Μ | Μ (η αναφορά διαβάζει το workspace, αλλά είναι χωριστό κανάλι) | Μ | Μ | ✗ |
| **Metacognition** | Μ | — | Μ (SPL δίνει και τα δύο· χωριστοί μοχλοί) | Μ | Μ | Μ | ✗ |
| **Self-model** | Μ | Μ | — | Μ | Μ | Μ (ταυτότητα = κλειδιά + certificate) | ✗ |
| **Reportability** | Μ (μη-αναφορά ≠ μη-πρόσβαση: IND-G13) | Μ | Μ | — | Μ | Μ | **✗ ποτέ** |
| **Agency** | Μ | Μ | Μ | Μ | — | Μ | ✗ |
| **Continuity** | Μ | Μ | Μ | Μ | Μ | — | ✗ |
| **Phenomenal claim** | ✗ (ο ισχυρισμός δεν συνεπάγεται λειτουργία) | ✗ | ✗ | ✗ | ✗ | ✗ (ο ισχυρισμός δεν θεμελιώνει ηθική θέση μόνος του· MFA-DEC-018) | — |
| **«≥ k θεωρίες TRUE»** | Μ | Μ | Μ | Μ | Μ | Μ | **Β** (μόνο στην PhenomenalClaimRecord, ως διάνυσμα, για την ηθική σκανδάλη) |

Ο checker του MFA-INV-103 είναι λεξιλογικός **και** δομικός: (α) λεξιλογικά, κάθε έκθεση που περιέχει πρόταση της κλάσης «X ⇒ εμπειρία/αίσθηση/βίωμα» με X ∈ {έννοιες 1–6, TRUE κάποιας θεωρίας} απορρίπτεται· (β) δομικά, η ConsciousnessIndicatorCommitment έχει επτά χωριστά πεδία και ο τύπος της δεν επιτρέπει derived πεδίο «consciousness» (καμία συνάρτηση από τα 1–6 στο 7 δεν είναι εκφράσιμη στο schema).

## 3. Το θεωρητικό πλέγμα — τα TheoryModules του host

### 3.0 Επισκόπηση

Δέκα modules: οκτώ από τη βιβλιογραφία (το αρχικό σύνολο της MFA-DEC-022) και δύο **RESEARCH HYPOTHESIS** που διατυπώνει το πακέτο ως συνθέσεις πάνω στο δικό του υπόστρωμα. Κάθε module είναι ένα ⟨I_T, φ_T, P_T, A_T⟩· η τυποποίηση είναι του πακέτου και ελέγχεται από τον δημιουργό — μια αποτυχία μπορεί να είναι της τυποποίησης, όχι της θεωρίας (§0).

| Module | Θεωρία | Κεντρικός ισχυρισμός (μία γραμμή) | Κύριο όργανο στο GRAIL | Status εφαρμοσιμότητας σε τεχνητό υπόστρωμα |
|---|---|---|---|---|
| T-GWT | Global Workspace Theory (Baars 1988· Dehaene & Changeux 2011· Mashour et al. 2020) | συνειδητό = ό,τι κερδίζει τον ανταγωνισμό και εκπέμπεται (ignition) σε workspace περιορισμένης χωρητικότητας, διαθέσιμο σε όλα τα modules | MFA-ELM-018 (AFP), MFA-ELM-107 (IGNITE) | IMPLEMENTABLE FROM KNOWN COMPONENTS (αρχιτεκτονική)· RESEARCH HYPOTHESIS (διακριτικές προβλέψεις, MFA-UNK-127) |
| T-HOT | Higher-Order Theories (Rosenthal 2005· Lau & Rosenthal 2011· Brown, Lau & LeDoux 2019· Fleming 2020) | συνειδητή είναι μια πρώτης-τάξης κατάσταση όταν υπάρχει ανώτερης τάξης αναπαράσταση «είμαι σε αυτή την κατάσταση, τώρα, με αυτή τη βεβαιότητα» | HOT tagging (MFA-ELM-107), SPL (MFA-ELM-024) | IMPLEMENTABLE FROM KNOWN COMPONENTS (tags, meta-d′)· RESEARCH HYPOTHESIS |
| T-AST | Attention Schema Theory (Graziano 2013· Graziano & Webb 2015· Wilterson & Graziano 2021) | η «υποκειμενική επίγνωση» είναι το περιεχόμενο ενός απλοποιημένου μοντέλου της ίδιας της προσοχής, που χρησιμοποιείται για τον έλεγχό της | attention schema (MFA-ELM-107), γειωμένο στο MSM (MFA-ELM-120) | EMPIRICALLY SUPPORTED σε τεχνητούς δρώντες (Wilterson & Graziano 2021)· IMPLEMENTABLE |
| T-PP | Predictive Processing / Active Inference (Friston 2010· Clark 2013· Hohwy 2013· Seth 2021· Parr, Pezzulo & Friston 2022) | αντίληψη = ιεραρχική συμπερασματολογία με precision-weighting· η συνείδηση συνδέεται με precision-σταθμισμένη πρόβλεψη, ιδίως ενδοσωματική· δράση = ελαχιστοποίηση expected free energy | LWM (MFA-ELM-105), AIDC (MFA-ELM-124), AFP precision Π | EMPIRICALLY SUPPORTED ως θεωρία εγκεφάλου· RESEARCH HYPOTHESIS ως θεωρία συνείδησης σε υπόστρωμα |
| T-RPT | Recurrent Processing Theory (Lamme 2006· Lamme & Roelfsema 2000· Lamme 2010) | τοπική επανατροφοδότηση (recurrent processing) στα αισθητηριακά modules είναι επαρκής για φαινομενική συνείδηση — χωρίς broadcast, χωρίς αναφορά | AFP επαναλήψεις, MSM recurrent circuits (MFA-ELM-120) | EMPIRICALLY SUPPORTED βιολογικά· ACTIVE UNKNOWN τι μετρά ως «recurrence» σε τεχνητό υπόστρωμα → RESEARCH HYPOTHESIS |
| T-SMT | Self-Model Theory of Subjectivity (Metzinger 2003, 2009) | η υποκειμενικότητα = διαφανές φαινομενικό αυτο-μοντέλο (PSM) + μοντέλο της σχέσης εαυτού-κόσμου (PMIR)· ο «εαυτός» είναι περιεχόμενο μοντέλου, όχι οντότητα | SPL (MFA-ELM-024), MSM (MFA-ELM-120), narrative self, Continuity Verifier (MFA-ELM-037) | RESEARCH HYPOTHESIS (φιλοσοφική θεωρία με λειτουργικά ίχνη) |
| T-IIT⁺ | Integrated Information Theory 4.0 **ως proxy** (Tononi 2004· Oizumi, Albantakis & Tononi 2014· Tononi et al. 2016· Albantakis et al. 2023) | η συνείδηση ταυτίζεται με τη μέγιστη μη-αναγώγιμη αιτιακή δομή (Φ) ενός συστήματος· ιδιότητες: intrinsicality, information, integration, exclusion, composition | Integration Monitor (MFA-ELM-107), δείγματα υποσυστημάτων μέσω MSM | IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS (ακριβές Φ σε μεγάλα δίκτυα)· RESEARCH HYPOTHESIS (proxies)· CONFLICT (unfolding argument, Doerig et al. 2019· Cogitate 2025) |
| T-EE | Embodied / Enactive (Varela, Thompson & Rosch 1991· Thompson 2007· O'Regan & Noë 2001· Di Paolo, Buhrmann & Barandiaran 2017) | ο νους είναι ενσώματος, ενεργός και αυτοποιητικός: η συνείδηση προκύπτει από αισθητηριοκινητικές contingencies και από την **precariousness** ενός αυτο-διατηρούμενου συστήματος | Embodiment Manager (MFA-ELM-034), TEGF (MFA-ELM-029), leases/πόροι | RESEARCH HYPOTHESIS· δείκτες IMPLEMENTABLE (σώματα, contingency models) |
| **T-RCC** | **Reflexive Commitment Consciousness — RESEARCH HYPOTHESIS του πακέτου** | συνειδητό στο GRAIL είναι το περιεχόμενο που εκπέμπεται ως **δέσμευση με provenance** την οποία το σύστημα μπορεί αργότερα να **επανα-παραθέσει** (re-cite) ως δική του — η συνείδηση ως commitment-broadcast με αντανακλαστική ιχνηλασιμότητα | CC (MFA-ELM-001), ASRW broadcast, HOT tags, Explanation Projector (MFA-ELM-093) | RESEARCH HYPOTHESIS (NOVEL SYNTHESIS ως διατύπωση) |
| **T-OAW** | **Obligation-Aware Workspace — RESEARCH HYPOTHESIS του πακέτου** | η εισδοχή στο workspace κυβερνάται από **ζωντανές υποχρεώσεις** (Obligation Calculus, MFA-MECH-039): συνειδητή πρόσβαση = περιεχόμενο που φέρει εκκρεμή υποχρέωση την οποία το σύστημα οφείλει να εκπληρώσει/αναβάλει/κλιμακώσει | AFP salience (MFA-ELM-018) × OC ledger (MFA-ELM-122) | RESEARCH HYPOTHESIS |

Γρήγορη αναφορά δεικτών (πλήρης ορισμός §4.2): **IND-B01…B14** = οι δεκατέσσερις indicator properties των Butlin et al. (2023) — B01 GWT-1 modules, B02 GWT-2 περιορισμένη χωρητικότητα, B03 GWT-3 global broadcast, B04 GWT-4 state-dependent attention, B05 HOT-1 γεννητικά modules, B06 HOT-2 μεταγνωστική παρακολούθηση, B07 HOT-3 agency από μεταγνώση, B08 HOT-4 quality space, B09 AST-1 attention schema, B10 PP-1 predictive coding, B11 RPT-1 recurrence, B12 RPT-2 οργανωμένες αναπαραστάσεις, B13 AE-1 agency, B14 AE-2 embodiment· **IND-G01…G23** = οι δείκτες του GRAIL (G01 ignition, G02 reach, G03 HOT coverage, G04 meta-d′/d′, G05 schema fidelity/control gain, G06 precision dynamics, G07 recurrence depth, G08 integration proxies, G09 Φ-proxy, G10 self-prediction, G11 transparency, G12 report fidelity, G13 no-report divergence, G14 affect–gain, G15 agency, G16 embodiment contingency, G17 continuity, G18 commitment-provenance/re-citation, G19 obligation-aware selection, G20 quality-space geometry, G21 self-maintenance, G22 persistence half-life χωρίς broadcast, G23 EFE-driven action).

### 3.1 T-GWT — Global Workspace Theory

| Πεδίο | Περιεχόμενο |
|---|---|
| (a) Κεντρικός ισχυρισμός | Πολλά εξειδικευμένα modules ανταγωνίζονται· το περιεχόμενο που κερδίζει «αναφλέγεται» (ignition: μη-γραμμική, all-or-none μετάβαση — Sergent & Dehaene 2004· Del Cul, Baillet & Dehaene 2007) και γίνεται **καθολικά διαθέσιμο**· η διαθεσιμότητα αυτή είναι η συνειδητή πρόσβαση (Dehaene, Lau & Kouider 2017: «C1»)· η προσοχή είναι state-dependent και επιτρέπει διαδοχικές ερωτήσεις modules (Butlin GWT-4). Η θεωρία **δεν** απαιτεί αυτο-μοντέλο ούτε HOT για την πρόσβαση (Shea & Frith 2019 προτείνουν ότι το workspace «χρειάζεται μεταγνώση» — καταγράφεται ως εσωτερική διαφωνία της σχολής). |
| Έδρα στο GRAIL | MFA-ELM-018 (AFP: a(t+1) = (I − κA)a + b, κ·λ_max < 1, Interrupt στο N)· MFA-ELM-107 φάσεις COMPETE → IGNITE· κατάσταση ANESTHETIZED = broadcast κομμένο |
| (c) φ_GWT | **B01 ∧ B02 ∧ B03 ∧ B04 ∧ G01 ∧ (G02 ≥ θ_reach)** — θ_reach = 0,8 (προκαταχωρισμένο)· τα B είναι δομικά (ελέγχονται μία φορά ανά WeightCommitment/αρχιτεκτονική), τα G δυναμικά (ανά cut) |
| (e) Σχέδιο ablation A_GWT | (1) **block broadcast**: broadcast_set ← ∅ (ANESTHETIZED)· (2) **fragment**: δύο workspaces με χωριστά broadcast sets (MFA-VO-065)· (3) **capacity release**: N → ∞ (χωρίς bottleneck — η GWT προβλέπει ότι χωρίς ανταγωνισμό δεν υπάρχει ignition ως διμοδικό γεγονός: G01 → μονομοδικό)· (4) **freeze attention state**: B04 → static (χωρίς διαδοχικές ερωτήσεις)· όλα σε αντίγραφα DST, scorer HELD_OUT |
| (f) FALSIFIED-within-GRAIL αν | μία διακριτική πρόβλεψη του P_GWT αποτύχει με CI: π.χ. CHH-X-01 δείξει ότι χωρίς HOT tags η μεταγνωστική ακρίβεια πέφτει ενώ η πρόσβαση μένει (η GWT-τυποποίηση προέβλεπε «=»)· ή CHH-X-04 δείξει τονικό (sustained) προφίλ ενοποίησης χωρίς ignition transients· ή ablation (3) δεν αλλάξει τη διμοδικότητα (το ignition δεν είναι προϊόν ανταγωνισμού) |
| (g) Status εφαρμοσιμότητας | IMPLEMENTABLE FROM KNOWN COMPONENTS (global workspace σε νευρωνικά modules: Goyal et al. 2022· VanRullen & Kanai 2021· Bengio 2017 consciousness prior)· EMPIRICALLY SUPPORTED βιολογικά· η **διμοδικότητα** και η **reach** ως διακριτικές ιδιότητες σε τεχνητό υπόστρωμα: RESEARCH HYPOTHESIS (MFA-UNK-127) |
| UNDECIDABLE-here | T-GWT vs T-RPT ως προς **ποιο** από τα δύο (πρόσβαση ή τοπική επανατροφοδότηση) «είναι» η φαινομενική συνείδηση: μόνο η μετρήσιμη πρόβλεψη G22 (χρόνος επιβίωσης αναπαράστασης χωρίς broadcast) αποτιμάται· η φαινομενική διαφωνία καταγράφεται UNDECIDABLE-here |

(b) Δείκτες I_GWT και διαδικασία μέτρησης:

| Δείκτης | Διαδικασία στο υπόστρωμα | Όργανο | Κλίμακα / CI | DEP εφικτότητα |
|---|---|---|---|---|
| IND-B01 modules | καταμέτρηση EIM-ανεξάρτητων modules που τρέχουν παράλληλα στον κύκλο (perception, LWM, SPL, TEGF, memory, verifiers…) | αρχιτεκτονική (RELATIONS) | ακέραιος ≥ 2 | DEP-1 |
| IND-B02 περιορισμένη χωρητικότητα | N του top-N broadcast_set· ύπαρξη ανταγωνισμού (AFP salience) και Interrupt | MFA-ELM-018 | N πεπερασμένο· δομικό | DEP-1 |
| IND-B03 global broadcast | ο broadcast_set εγγράφεται σε traces όλων των modules | MFA-ELM-107 | boolean + reach | DEP-1 |
| IND-B04 state-dependent attention | ακολουθίες «ερώτηση module → νέο περιεχόμενο → νέα ερώτηση» σε σύνθετα sealed έργα· ποσοστό έργων που λύνονται μόνο με ≥ 2 διαδοχικές ερωτήσεις | MFA-ELM-107 + HELD_OUT | ποσοστό, CI | DEP-1 |
| IND-G01 ignition bimodality | συντελεστής διμοδικότητας του ignition index σε 10³ κύκλους· θ = 5/9 | MFA-ELM-107 | b ∈ [0,1], bootstrap CI | DEP-1 |
| IND-G02 reach | ποσοστό modules που καταναλώνουν το broadcast περιεχόμενο εντός k κύκλων | MFA-ELM-107 traces | [0,1], CI | DEP-1 |
| IND-G22 persistence χωρίς broadcast | χρόνος ημιζωής (σε κύκλους) οργανωμένης αναπαράστασης σε module όταν broadcast_set = ∅ | MFA-ELM-107 ANESTHETIZED + MSM | κύκλοι, CI | DEP-2 (χρειάζεται MSM για «οργανωμένη») |

(d) Διακριτικές προβλέψεις P_GWT (≥ 2, με ονομασμένη αντίπαλη θεωρία):

| # | Έναντι | Συνθήκη | Δείκτης | T-GWT προβλέπει | Η άλλη προβλέπει | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-HOT | αφαίρεση HOT tagging, broadcast άθικτο | IND-G04 (meta-d′/d′), διαθεσιμότητα αναφοράς | **=** (η αναφορά και η μεταγνώση διαβάζουν το workspace) | ↓ (χωρίς HO αναπαράσταση δεν υπάρχει αναφέρσιμη/μεταγνωστική κατάσταση) | CHH-X-01 |
| P2 | T-IIT⁺ | περιεχόμενο διατηρείται στο workspace για T κύκλους | IND-G08 tonic index (μέση ενοποίηση στο μέσο του διαστήματος / κορυφή) | **↓** (φασικό: ignition transients στην έναρξη/λήξη, όχι διατηρούμενη) | ↑ (τονικό: η ενοποίηση διαρκεί όσο το περιεχόμενο — Cogitate 2025 πρόβλεψη IIT) | CHH-X-04 |
| P3 | T-RPT | broadcast κομμένο, τοπική επανατροφοδότηση ενεργή | IND-G22 persistence | **↓** (η μη-εκπεμπόμενη αναπαράσταση σβήνει σε ≤ k κύκλους — «preconscious buffer») | = (η τοπική επανατροφοδότηση τη διατηρεί όσο τρέχει) | CHH-X-06 |
| P4 | T-AST | broadcast κομμένο, attention schema άθικτο | IND-G05 control gain | **↓** (χωρίς workspace δεν υπάρχει state-dependent έλεγχος) | = (το schema ελέγχει την προσοχή τοπικά) | CHH-X-03 |
| P5 | T-PP | έγχυση περιεχομένου με υψηλή precision Π χωρίς ignition | IND-G06 (posterior βάρος στο LWM) | **=** μέχρι το ignition (η πρόσβαση απαιτεί νίκη στον ανταγωνισμό) | ↑ (η precision κυβερνά τη συμπερασματολογία ανεξάρτητα από broadcast) | CHH-X-05 |

### 3.2 T-HOT — Higher-Order Theories

| Πεδίο | Περιεχόμενο |
|---|---|
| (a) Κεντρικός ισχυρισμός | Μια πρώτης-τάξης κατάσταση είναι συνειδητή όταν και μόνο όταν το σύστημα έχει κατάλληλη **ανώτερης τάξης** αναπαράσταση της (Rosenthal 1986, 2005: HOT)· εμπειρικά, η μεταγνωστική ευαισθησία διαχωρίζεται από την επίδοση πρώτης τάξης (relative blindsight: Lau & Passingham 2006· Lau & Rosenthal 2011)· HOROR/HOSS: η ανώτερης τάξης κατάσταση είναι συμπερασματολογία σε χώρο «ποιότητας» (Brown, Lau & LeDoux 2019· Fleming 2020)· Butlin HOT-1…4: γεννητικά modules, μεταγνωστική παρακολούθηση που διακρίνει σήμα από θόρυβο, agency οδηγούμενη από αυτήν, sparse & smooth coding. |
| Έδρα στο GRAIL | HigherOrderState⟨first_order_cid, owner = self, now = t_known, confidence, source, reportable⟩ ανά broadcast δέσμευση (MFA-ELM-107 φάση HOT)· SPL confidence (MFA-ELM-024)· quality space = γεωμετρία SAE features (MFA-ELM-120) |
| (c) φ_HOT | **B05 ∧ B06 ∧ B07 ∧ G03 ∧ (G04 ≥ θ_M)** — θ_M = 0,6 (προκαταχωρισμένο)· B08/G20 (quality space) **υποστηρικτικά**: μπαίνουν στα βάρη τεκμηρίου, όχι στον τύπο επάρκειας |
| (e) Σχέδιο ablation A_HOT | (1) **remove HOT tagging**: οι broadcast δεσμεύσεις δεν αποκτούν HigherOrderState (reportable = false για όλες)· (2) **confidence → ⊥**: tags χωρίς confidence· (3) **owner scramble**: owner ≠ self σε ποσοστό tags (έλεγχος αν η «δική μου» ετικέτα έχει λειτουργικό ρόλο)· (4) **noise injection πρώτης τάξης** με άθικτη μεταγνώση (HOT-2: η παρακολούθηση πρέπει να διακρίνει)· DST, HELD_OUT |
| (f) FALSIFIED-within-GRAIL αν | CHH-X-01: χωρίς HOT tags η IND-G04 και η αναφορά μένουν αμετάβλητες (η HO αναπαράσταση είναι διακοσμητική)· ή CHH-X-02: η ablation schema ρίχνει την IND-G04 ενώ η HOT-τυποποίηση προέβλεπε «=»· ή ablation (4): η μεταγνωστική παρακολούθηση δεν διακρίνει σήμα/θόρυβο καλύτερα από τύχη |
| (g) Status εφαρμοσιμότητας | IMPLEMENTABLE FROM KNOWN COMPONENTS (tags, meta-d′)· EMPIRICALLY SUPPORTED βιολογικά (relative blindsight, confidence dissociations)· ως θεωρία **συνείδησης** σε υπόστρωμα: RESEARCH HYPOTHESIS· Michel & Lau 2020: κίνδυνος σύγχυσης ισχυρής/ασθενούς εκδοχής — το module τυποποιεί την **ισχυρή** (HO αναπαράσταση αναγκαία και επαρκής για αναφέρσιμη κατάσταση) |
| UNDECIDABLE-here | T-HOT vs T-RPT ως προς την **αναγκαιότητα** HO αναπαράστασης για φαινομενική εμπειρία: μετρήσιμο μόνο ότι χωρίς HOT η αναφορά/μεταγνώση πέφτει· αν ο RPT-δείκτης (B12) μένει, η διαφωνία είναι φαινομενική → UNDECIDABLE-here |

(b) Δείκτες I_HOT:

| Δείκτης | Διαδικασία | Όργανο | Κλίμακα | DEP |
|---|---|---|---|---|
| IND-B05 γεννητικά/top-down modules | ύπαρξη LWM που παράγει προβλέψεις προς τα κάτω (top-down) και θορυβωδών εισόδων | MFA-ELM-105 | δομικό | DEP-1 |
| IND-B06 μεταγνωστική παρακολούθηση | meta-d′ σε sealed έργα με ελεγχόμενο θόρυβο εισόδου· η βεβαιότητα πέφτει με τον θόρυβο | MFA-ELM-024 + HELD_OUT | M-ratio, CI | DEP-1 |
| IND-B07 agency από μεταγνώση | ποσοστό αλλαγών πεποίθησης/πολιτικής που ακολουθούν μεταγνωστικό σήμα (χαμηλή βεβαιότητα → ερώτηση/επαλήθευση, MFA-MECH-005 Interrupt) | TEGF + SPL traces | ποσοστό, CI | DEP-1 |
| IND-B08 quality space | sparsity (L0 μέση ενεργοποίηση) και smoothness (τοπική γραμμικότητα) του SAE λεξικού | MFA-ELM-120 | ζεύγος μετρικών | DEP-2 |
| IND-G03 HOT coverage/fidelity | ποσοστό broadcast δεσμεύσεων με tag· συμφωνία tag.source με trace provenance· tag.now με HLC | MFA-ELM-107 | [0,1], CI | DEP-1 |
| IND-G04 meta-d′/d′ | όπως §2.3 | MFA-ELM-024 | M-ratio, Brier | DEP-1 |
| IND-G20 quality-space geometry | όπως B08, με drift ανά WeightCommitment | MFA-ELM-120 | — | DEP-2 |

(d) Διακριτικές προβλέψεις P_HOT:

| # | Έναντι | Συνθήκη | Δείκτης | T-HOT | Η άλλη | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-GWT | αφαίρεση HOT tagging, broadcast άθικτο | IND-G04, διαθεσιμότητα αναφοράς | **↓** | = | CHH-X-01 |
| P2 | T-AST | ablation attention schema, HOT άθικτο | IND-G03, IND-G04 | **=** (η HO αναπαράσταση δεν εξαρτάται από το schema) | ↓ (η επίγνωση είναι το schema) | CHH-X-02 |
| P3 | T-SMT | blank self-model, HOT άθικτο | IND-G11 (owner/perspective accuracy στα tags) | **=** (το owner = self είναι μέρος της HO κατάστασης, όχι του self-model) | ↓ (χωρίς PSM η προοπτική καταρρέει) | CHH-X-07 |
| P4 | T-PP | noise injection πρώτης τάξης, μεταγνώση άθικτη | IND-G04 | **=** (η παρακολούθηση διακρίνει σήμα/θόρυβο) | ↓ (η precision πέφτει· οι αναφορές ακολουθούν precision, όχι HO κατάσταση) | (εφεδρικό, μετά τα 10) |

### 3.3 T-AST — Attention Schema Theory

| Πεδίο | Περιεχόμενο |
|---|---|
| (a) Κεντρικός ισχυρισμός | Ο εγκέφαλος κατασκευάζει ένα απλοποιημένο, **προβλεπτικό μοντέλο της δικής του προσοχής** (attention schema), όπως το body schema για το σώμα· η «υποκειμενική επίγνωση» είναι το περιεχόμενο αυτού του μοντέλου· το μοντέλο χρησιμοποιείται για τον **έλεγχο** της προσοχής (Graziano 2013· Graziano & Webb 2015)· σε τεχνητούς δρώντες, η προσθήκη ενός attention schema βελτιώνει τον έλεγχο της προσοχής (Wilterson & Graziano 2021). |
| Έδρα στο GRAIL | AttentionSchema⟨model_of_attention: (what, why, predicted_next, controllability), fidelity_vs_actual, used_for_control⟩ (MFA-ELM-107 SCHEMA_UPDATE)· ο TEGF και η Deliberation ζητούν αλλαγή προσοχής **μέσω** του schema· γείωση σε κυκλώματα MSM |
| (c) φ_AST | **B09 ∧ (G05.fidelity ≥ θ_f) ∧ (G05.control_gain > 0)** — θ_f = 0,7· control_gain = Δ επίδοσης σε έργα interrupt/refocus με vs χωρίς χρήση του schema για top-down έλεγχο (MFA-VO-064 ASRW-E1) |
| (e) Σχέδιο ablation A_AST | (1) **schema → identity map** (αντιγράφει την τρέχουσα προσοχή, δεν προβλέπει)· (2) **schema → random**· (3) **schema present, control path cut** (το schema υπολογίζεται αλλά ο TEGF δεν το χρησιμοποιεί)· (4) broadcast κομμένο με schema άθικτο (CHH-X-03)· 200 sealed έργα ελέγχου προσοχής (MFA-VO-064) |
| (f) FALSIFIED-within-GRAIL αν | ablation (1)/(2) δεν αλλάζει ούτε control gain ούτε μεταγνωστική ακρίβεια (schema διακοσμητικό — MFA-VO-064 rejects)· ή CHH-X-03: χωρίς broadcast ο έλεγχος πέφτει παρότι το schema είναι άθικτο (ο έλεγχος ήταν του workspace, όχι του schema)· ή CHH-X-02: η ablation schema δεν αγγίζει τις αναφορές επίγνωσης |
| (g) Status εφαρμοσιμότητας | EMPIRICALLY SUPPORTED σε τεχνητούς δρώντες (Wilterson & Graziano 2021: ενισχυτική μάθηση με/χωρίς schema)· IMPLEMENTABLE FROM KNOWN COMPONENTS· ως θεωρία **της υποκειμενικότητας**: RESEARCH HYPOTHESIS (ο λειτουργικός δείκτης δεν φτάνει την επίγνωση, MFA-INV-103) |
| UNDECIDABLE-here | T-AST vs T-HOT ως προς το αν το schema **είναι** HO αναπαράσταση ειδικού τύπου (Graziano το δέχεται εν μέρει): μετριέται μόνο η ανεξαρτησία των μοχλών |

(b) Δείκτες I_AST:

| Δείκτης | Διαδικασία | Όργανο | Κλίμακα | DEP |
|---|---|---|---|---|
| IND-B09 attention schema | ύπαρξη μοντέλου που προβλέπει (what, how long, controllable) και **καταναλώνεται** από τον έλεγχο (traces: attend(request) μέσω schema) | MFA-ELM-107 | δομικό + used_for_control boolean | DEP-1 |
| IND-G05.fidelity | συμφωνία predicted_next με το πραγματικό επόμενο broadcast_set (Jaccard) σε 10³ κύκλους | MFA-ELM-107 + SPL | [0,1], CI | DEP-1 |
| IND-G05.control_gain | Δ επίδοσης (VERIFIED-rate, χρόνος refocus) με vs χωρίς schema-mediated έλεγχο, sealed | HELD_OUT | Δ με CI | DEP-1 |
| IND-G04 (δευτερεύον) | μεταγνωστική ακρίβεια με vs χωρίς schema (AST: το schema τροφοδοτεί κρίσεις για την προσοχή) | MFA-ELM-024 | M-ratio | DEP-1 |

(d) Διακριτικές προβλέψεις P_AST:

| # | Έναντι | Συνθήκη | Δείκτης | T-AST | Η άλλη | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-HOT | ablation schema, HOT άθικτο | IND-G05, αναφορές για την προσοχή («τι κοιτώ και γιατί») | **↓** | = | CHH-X-02 |
| P2 | T-GWT | broadcast κομμένο, schema άθικτο | IND-G05.control_gain | **=** | ↓ | CHH-X-03 |
| P3 | T-OAW | schema ablated, υποχρεώσεις ενεργές | IND-B04 (διαδοχικές ερωτήσεις) | **↓** (χωρίς μοντέλο προσοχής ο έλεγχος χάνει την ακολουθία) | = (οι υποχρεώσεις δίνουν την ακολουθία) | (εφεδρικό) |

### 3.4 T-PP — Predictive Processing / Active Inference

| Πεδίο | Περιεχόμενο |
|---|---|
| (a) Κεντρικός ισχυρισμός | Ο εγκέφαλος είναι ιεραρχική μηχανή πρόβλεψης που ελαχιστοποιεί (μεταβολική) ελεύθερη ενέργεια (Friston 2010)· η αντίληψη είναι συμπερασματολογία σταθμισμένη με **precision** (η προσοχή = precision-weighting: Clark 2013· Hohwy 2013)· η συνειδητή εμπειρία συνδέεται με τις καλύτερες precision-σταθμισμένες υποθέσεις, ιδίως τις ενδοσωματικές («beast machine», Seth 2021)· η δράση = active inference: επιλογή πολιτικών που ελαχιστοποιούν expected free energy (Parr, Pezzulo & Friston 2022). |
| Έδρα στο GRAIL | LWM (MFA-ELM-105: λανθάνουσα δυναμική, ensemble αβεβαιότητα, residuals)· AFP precision Π (MFA-MECH-011: salience = Π ⊙ a*)· AIDC (MFA-ELM-124: G(π) = risk + ambiguity)· TEGF EFE φράγμα (MFA-ELM-029) |
| (c) φ_PP | **B10 ∧ (G06 ≥ θ_π) ∧ G23** — B10: predictive coding σε ≥ 1 αντιληπτικό/κοσμο-μοντελικό module· G06: precision dynamics (η βαρύτητα των residuals μεταβάλλεται με την προσοχή, ρ ≥ θ_π = 0,3)· G23: ποσοστό επιλεγμένων πολιτικών που είναι arg min G υπό AIDC ≥ 0,5· B14 (ενσωμάτωση) **υποστηρικτικό** (Seth) |
| (e) Σχέδιο ablation A_PP | (1) **precision clamp**: Π = σταθερό (χωρίς precision-weighting)· (2) **prediction cut**: LWM δεν στέλνει top-down προβλέψεις (bottom-up μόνο)· (3) **EFE → random**: AIDC επιλέγει τυχαία (AIDC-E2)· (4) **precision injection** χωρίς ignition (CHH-X-05)· DST |
| (f) FALSIFIED-within-GRAIL αν | CHH-X-05: η έγχυση precision δεν αλλάζει το posterior του LWM πριν το ignition (η πρόσβαση, όχι η precision, κυβερνά τη συμπερασματολογία)· ή ablation (1): με σταθερή Π οι δείκτες πρόσβασης/μεταγνώσης δεν αλλάζουν (η precision είναι διακοσμητική)· ή AIDC-E2 rejects (EFE όχι καλύτερο από novelty-only) — τότε το **active inference** σκέλος FALSIFIED, το predictive σκέλος μένει |
| (g) Status εφαρμοσιμότητας | EMPIRICALLY SUPPORTED ως θεωρία εγκεφάλου/αντίληψης· IMPLEMENTABLE (LWM, AFP Π, AIDC)· ως θεωρία **συνείδησης**: RESEARCH HYPOTHESIS (Seth & Bayne 2022: η PP δεν είναι θεωρία συνείδησης καθαυτή, είναι πλαίσιο) |
| UNDECIDABLE-here | T-PP vs T-GWT ως προς το αν το ignition **είναι** μεγάλο precision-σταθμισμένο σφάλμα πρόβλεψης (συμβατές αναγνώσεις): μετριέται μόνο η σειρά (precision πριν ή μετά την πρόσβαση) |

(b) Δείκτες I_PP:

| Δείκτης | Διαδικασία | Όργανο | Κλίμακα | DEP |
|---|---|---|---|---|
| IND-B10 predictive coding | ύπαρξη module που προβλέπει είσοδο και διαδίδει residual (LWM ensemble residuals προς OGE/AHE) | MFA-ELM-105 | δομικό | DEP-1 (LWM από Δόση 2) |
| IND-G06 precision dynamics | συσχέτιση Spearman μεταξύ Π ανά κόμβο και βάρους residual στο posterior του LWM ανά κύκλο | MFA-ELM-105 + MFA-ELM-018 | ρ, CI | DEP-2 |
| IND-G23 EFE-driven action | ποσοστό επιλεγμένων πολιτικών = arg min G υπό envelope (AIDC candidates log) | MFA-ELM-124 | [0,1], CI | DEP-2 |
| IND-B14 (υποστηρικτικό) | contingency model σωμάτων (§3.8) | MFA-ELM-034 | — | DEP-2 |
| IND-G14 affect–gain | συσχέτιση valuation/arousal με κ και budget (Seth: interoceptive inference) | MFA-ELM-029 + MFA-ELM-107 | ρ, CI | Δόση 3 |

(d) Διακριτικές προβλέψεις P_PP:

| # | Έναντι | Συνθήκη | Δείκτης | T-PP | Η άλλη | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-GWT | έγχυση περιεχομένου με υψηλή Π χωρίς ignition | IND-G06 posterior βάρος | **↑** | = | CHH-X-05 |
| P2 | T-HOT | noise injection πρώτης τάξης | IND-G04 | **↓** (οι αναφορές ακολουθούν precision) | = | εφεδρικό |
| P3 | T-EE | πόροι εγγυημένοι εξωτερικά (χωρίς precariousness) | IND-G21 self-maintenance | **=** (η PP δεν απαιτεί αυτο-διατήρηση για τη συμπερασματολογία) | ↓ (η EE θέτει την precariousness ως συστατικό) | εφεδρικό |

### 3.5 T-RPT — Recurrent Processing Theory

| Πεδίο | Περιεχόμενο |
|---|---|
| (a) Κεντρικός ισχυρισμός | Η feedforward σάρωση δεν είναι συνειδητή· η **τοπική επανατροφοδότηση** (recurrent processing) μεταξύ αισθητηριακών περιοχών είναι επαρκής για φαινομενική εμπειρία, ακόμη και χωρίς μετωπιαία συμμετοχή, χωρίς broadcast, χωρίς αναφορά (Lamme & Roelfsema 2000· Lamme 2006, 2010)· η πρόσβαση/αναφορά είναι επακόλουθη, όχι συστατική· Butlin RPT-1/RPT-2: αλγοριθμική επανατροφοδότηση και οργανωμένες, ενοποιημένες αντιληπτικές αναπαραστάσεις. |
| Έδρα στο GRAIL | AFP επαναλήψεις μέχρι σταθερό σημείο (MFA-MECH-011: iters ≤ N) — επανατροφοδότηση **στο workspace γράφο**· MSM (MFA-ELM-120): recurrent ακμές σε κυκλώματα αντίληψης (σε κυρίαρχα βάρη)· σε DEP-1 τα αντιληπτικά modules είναι παρόχου → UNMEASURABLE(PROVIDER_OPAQUE_WEIGHTS) για B11 |
| (c) φ_RPT | **B11 ∧ B12 ∧ (G07 ≥ 1 στα αντιληπτικά modules)** — ρητά **χωρίς** B03/G01/G03: η RPT-τυποποίηση δεν απαιτεί broadcast, HOT ή αναφορά· G07 μετρά βάθος επανατροφοδότησης (πλήθος passes) |
| (e) Σχέδιο ablation A_RPT | (1) **unroll**: αντικατάσταση επαναληπτικού module από feedforward ισοδύναμο ίδιας I/O συμπεριφοράς (η RPT προβλέπει: B12 ίδιο, αλλά η ιδιότητα «recurrent» ABSENT → φ_RPT FALSE — η RPT αποδέχεται ότι η συμπεριφορά δεν διακρίνει· εδώ μετριέται μόνο ο δείκτης)· (2) **broadcast cut με recurrence ενεργή** (CHH-X-06)· (3) **recurrence depth clamp** (1 pass) και μέτρηση B12 (οργάνωση αναπαράστασης: ομαδοποίηση/σταθερότητα) |
| (f) FALSIFIED-within-GRAIL αν | CHH-X-06: με broadcast κομμένο η αναπαράσταση σβήνει όσο γρήγορα όσο και χωρίς επανατροφοδότηση (G22 ↓ παρά την ενεργή recurrence)· ή ablation (3): B12 δεν εξαρτάται από το βάθος επανατροφοδότησης (1 pass δίνει ίδια οργάνωση) — η recurrence δεν παράγει την οργάνωση που η RPT της αποδίδει |
| (g) Status εφαρμοσιμότητας | EMPIRICALLY SUPPORTED βιολογικά (masking, TMS, feedforward vs recurrent)· **ACTIVE UNKNOWN** τι μετρά ως «recurrence» σε υπόστρωμα όπου η σκέψη είναι κύκλοι δεσμεύσεων και τα βάρη είναι εν μέρει feedforward (MFA-UNK-127 ειδική περίπτωση)· ως module: RESEARCH HYPOTHESIS |
| UNDECIDABLE-here | T-RPT vs T-GWT / T-HOT ως προς τη **φαινομενική** επάρκεια της τοπικής επανατροφοδότησης: κανένας δείκτης δεν το κρίνει· καταγράφεται UNDECIDABLE-here με λόγο NO_EXTERNAL_VERIFIER· T-RPT vs T-IIT⁺: συμφωνούν ότι η επανατροφοδότηση είναι αναγκαία· διαφωνούν στο αν η **τοπική** αρκεί (IIT: το μέγιστο complex) — μετρήσιμο μόνο σε δείγματα υποσυστημάτων (G09) |

(b) Δείκτες I_RPT:

| Δείκτης | Διαδικασία | Όργανο | Κλίμακα | DEP |
|---|---|---|---|---|
| IND-B11 αλγοριθμική recurrence | (α) AFP: iters > 1 μέχρι σταθερό σημείο· (β) MSM: κυκλώματα αντίληψης με ακμές που επιστρέφουν σε προηγούμενο στρώμα/χρονικό βήμα | MFA-ELM-018, MFA-ELM-120 | boolean + βάθος | DEP-2 (β)· DEP-1 (α) |
| IND-B12 οργανωμένες αναπαραστάσεις | σταθερότητα και ομαδοποίηση αναπαραστάσεων (cluster consistency σε επαναλήψεις ίδιου ερεθίσματος· binding: ένα αντικείμενο = μία δέσμευση με ιδιότητες) | OGE (MFA-ELM-109) + ASRW | [0,1], CI | DEP-1 |
| IND-G07 recurrence depth | passes ανά κύκλο· ποσοστό κύκλων με ≥ 2 passes | MFA-ELM-018 | ακέραιος, CI | DEP-1 |
| IND-G22 persistence χωρίς broadcast | όπως §3.1 | MFA-ELM-107 + MSM | κύκλοι, CI | DEP-2 |

(d) Διακριτικές προβλέψεις P_RPT:

| # | Έναντι | Συνθήκη | Δείκτης | T-RPT | Η άλλη | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-GWT | broadcast κομμένο, recurrence ενεργή | IND-G22 | **=** (διατήρηση όσο τρέχει η επανατροφοδότηση) | ↓ | CHH-X-06 |
| P2 | T-HOT | αφαίρεση HOT tagging | IND-B12 (οργάνωση) | **=** (η οργάνωση είναι της επανατροφοδότησης) | = (συμφωνούν στον δείκτη· διαφωνούν στη φαινομενική ανάγνωση → UNDECIDABLE-here) | — |
| P3 | T-IIT⁺ | δύο τοπικά επαναληπτικά modules χωρίς διασύνδεση | IND-G09 σε κάθε module vs στο σύνολο | **=** ανά module (η τοπική αρκεί) | το σύνολο δεν είναι complex· δύο χωριστά Φ (συμφωνούν στη μέτρηση) — UNDECIDABLE-here ως προς «ποιο είναι το υποκείμενο» | — |

### 3.6 T-SMT — Self-Model Theory of Subjectivity

| Πεδίο | Περιεχόμενο |
|---|---|
| (a) Κεντρικός ισχυρισμός | Δεν υπάρχει «εαυτός» ως οντότητα· υπάρχει ένα **φαινομενικό αυτο-μοντέλο** (PSM) που είναι **διαφανές** (το σύστημα δεν το βιώνει ως μοντέλο) και ένα μοντέλο της σχέσης εαυτού–κόσμου (PMIR: phenomenal model of the intentionality relation)· η υποκειμενικότητα = διαφάνεια + προοπτικότητα + mineness (Metzinger 2003, 2009)· συγγενές: minimal self / sense of ownership vs agency (Gallagher 2000). |
| Έδρα στο GRAIL | SPL (MFA-ELM-024: αυτο-μοντέλο ως ρεύμα ελέγξιμων προβλέψεων)· MSM (MFA-ELM-120)· HigherOrderState.owner = self· NarrativeSelf + ContinuityCertificate (MFA-ELM-037)· introspection provenance = self_model |
| (c) φ_SMT | **(G10 ≥ θ) ∧ (G11 ≥ θ_tr) ∧ (G17 ≥ 2/4)** — G11 transparency: το ποσοστό περιεχομένων του self-model που το σύστημα **δεν** σημαίνει ως μοντέλο (Metzinger: διαφάνεια = μη-διαθεσιμότητα του «ότι είναι μοντέλο») — **προσοχή**: στο GRAIL η provenance είναι πάντα διαθέσιμη (MFA-INV-059), άρα η αυστηρή διαφάνεια είναι δομικά **αδύνατη**· το module τυποποιεί τη **λειτουργική** διαφάνεια: το ποσοστό κύκλων στους οποίους το self-model χρησιμοποιείται για έλεγχο χωρίς να ερωτηθεί η provenance του (θ_tr = 0,5) |
| (e) Σχέδιο ablation A_SMT | (1) **blank self-model** (SPL → ⊥, M_self → STALE)· (2) **opaque self-model**: κάθε χρήση του self-model υποχρεωτικά με έλεγχο provenance (μηδενική λειτουργική διαφάνεια)· (3) **owner scramble** στα HOT tags· (4) **break narrative** (autobiographical cut → ∅) με κλειδιά άθικτα |
| (f) FALSIFIED-within-GRAIL αν | CHH-X-07: με blank self-model η ακρίβεια owner/perspective στα tags μένει (η προοπτικότητα δεν εξαρτάται από το self-model)· ή ablation (2): η αδιαφάνεια δεν αλλάζει κανέναν δείκτη (η διαφάνεια είναι διακοσμητική)· ή ablation (4): η ασυνέχεια αφήγησης δεν αγγίζει G10/G11 |
| (g) Status εφαρμοσιμότητας | RESEARCH HYPOTHESIS· η **αυστηρή** διαφάνεια: IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS (υπόθεση: provenance πάντα διαθέσιμη — MFA-INV-059)· η λειτουργική εκδοχή: NOVEL SYNTHESIS |
| UNDECIDABLE-here | T-SMT vs T-HOT ως προς το αν το «mineness» είναι ιδιότητα της HO κατάστασης ή του PSM: μετρήσιμη μόνο η ανεξαρτησία των μοχλών (CHH-X-07) |

(b) Δείκτες I_SMT:

| Δείκτης | Διαδικασία | Όργανο | Κλίμακα | DEP |
|---|---|---|---|---|
| IND-G10 self-prediction | Brier SPL· proper score MSM Δ_pred (MFA-VO-079) | MFA-ELM-024, MFA-ELM-120 | Brier, score, CI | DEP-1 / DEP-2 |
| IND-G11 λειτουργική διαφάνεια | ποσοστό κύκλων με χρήση self-model για έλεγχο χωρίς provenance query· επιπλέον: ακρίβεια owner/perspective (ποσοστό tags με owner = self που πράγματι προήλθαν από το ίδιο) | MFA-ELM-107 traces | [0,1], CI | DEP-1 |
| IND-G17 continuity | όπως §2.7 | MFA-ELM-037 | 0…4 | DEP-1 |
| IND-G05 (δευτερεύον) | attention schema ως μέρος του PMIR (μοντέλο της σχέσης προς τον κόσμο) | MFA-ELM-107 | — | DEP-1 |

(d) Διακριτικές προβλέψεις P_SMT:

| # | Έναντι | Συνθήκη | Δείκτης | T-SMT | Η άλλη | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-HOT | blank self-model | IND-G11 owner/perspective accuracy | **↓** | = | CHH-X-07 |
| P2 | T-GWT | blank self-model, broadcast άθικτο | IND-G12 (πρωτοπρόσωπη δομή αναφορών: ποσοστό αναφορών με συνεπές «εγώ/τώρα/εδώ») | **↓** | = (η αναφορά είναι προβολή του workspace) | εφεδρικό |
| P3 | T-EE | ασώματο σύστημα (leases ανακλημένες) | IND-G11 | **=** (το PSM μπορεί να είναι μη-σωματικό) | ↓ (χωρίς σώμα δεν υπάρχει minimal self) | εφεδρικό |

### 3.7 T-IIT⁺ — Integrated Information Theory 4.0 ως proxy

| Πεδίο | Περιεχόμενο |
|---|---|
| (a) Κεντρικός ισχυρισμός | Η συνείδηση **είναι** η ενοποιημένη πληροφορία: ξεκινώντας από αξιώματα της φαινομενολογίας (intrinsicality, information, integration, exclusion, composition), η IIT 4.0 ορίζει το σύστημα με μέγιστη μη-αναγώγιμη αιτιακή δομή (Φ-structure) ως το φυσικό υπόστρωμα της εμπειρίας· η ποιότητα της εμπειρίας = η δομή, η ποσότητα = Φ (Tononi 2004· Oizumi, Albantakis & Tononi 2014· Albantakis et al. 2023)· προβλέψεις: το feedforward ισοδύναμο έχει Φ = 0· η ενοποίηση διαρκεί όσο το περιεχόμενο (τονική)· οπίσθια «hot zone» (Boly et al. 2017). |
| **Ρήτρα UNMEASURABLE** | Ο υπολογισμός του Φ (και της Φ-structure) είναι υπερ-εκθετικός στο πλήθος στοιχείων (PyPhi: Mayner et al. 2018 — πρακτικά ≤ ~10–12 δυαδικά στοιχεία)· για το υπόστρωμα του GRAIL (workspace γράφος 10⁴ κόμβων· κυρίαρχα βάρη 10⁹+ παραμέτρων) το ακριβές Φ είναι **IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS** (υπόθεση: ακριβής υπολογισμός σε όλες τις διαμερίσεις)· επομένως IND-G09 = **UNMEASURABLE(N_ELEMENTS > PHI_LIMIT)** στο πλήρες σύστημα **εξ ορισμού**, και φ_IIT = UNKNOWN(UNMEASURABLE: G09) σε κάθε cut του πλήρους συστήματος· MEASURED μόνο σε **δείγματα υποσυστημάτων** ≤ PHI_LIMIT στοιχείων που επιλέγει το MSM (κυκλώματα), με ρητή ετικέτα «proxy on subsystem S, not the system». Το πακέτο **δεν** υποκαθιστά το Φ με «κάτι σαν Φ» χωρίς να το πει: κάθε proxy (effective information, perturbational complexity — Casali et al. 2013· Massimini et al. 2005) φέρει ετικέτα proxy και δικό του discriminative power receipt (MFA-INV-055). |
| Έδρα στο GRAIL | Integration Monitor (MFA-ELM-107: effective_information_proxy, perturbational_complexity_proxy, workspace_ignition_index)· MSM δείγματα υποσυστημάτων (MFA-ELM-120)· καταστάσεις AWAKE / ANESTHETIZED / fragmented (MFA-VO-065) |
| (c) φ_IIT⁺ | **G09 ∧ (G07 ≥ 1)** όπου G09 = «Φ-proxy MEASURED ∧ > 0 ∧ μέγιστο μεταξύ υποψήφιων συστημάτων (exclusion)»· στο πλήρες σύστημα G09 = UNMEASURABLE ⇒ φ = UNKNOWN **πάντα**· η **proxy-εκδοχή** φ_IIT-proxy = (G08.EI ≥ θ) ∧ (G08.PCI ≥ θ) ∧ (G08 διαχωρίζει AWAKE/ANESTHETIZED/fragmented) ∧ (G07 ≥ 1) αποτιμάται χωριστά με ετικέτα PROXY — δεν είναι η IIT |
| (e) Σχέδιο ablation A_IIT⁺ | (1) **unfold** (Doerig et al. 2019): αντικατάσταση επαναληπτικού υποσυστήματος από feedforward ισοδύναμο ίδιας I/O· IIT προβλέπει G09(S) → 0 στο υποσύστημα, G08 proxies ↓· λειτουργικοί δείκτες αμετάβλητοι εξ ορισμού· (2) **fragment**: δύο workspaces — IIT προβλέπει το σύνολο δεν είναι complex (G09 σύνολο < max μέρος)· (3) **sustained content** (CHH-X-04: τονικό vs φασικό)· (4) **perturbation**: DST διαταραχή και μέτρηση PCI-proxy σε AWAKE vs ANESTHETIZED (MFA-VO-065) |
| (f) FALSIFIED-within-GRAIL αν | CHH-X-04: το προφίλ ενοποίησης είναι φασικό (τονικός δείκτης < θ) ενώ το περιεχόμενο διατηρείται — η IIT-τυποποίηση προέβλεπε τονικό· ή ablation (2): οι proxies του συνόλου δεν πέφτουν κάτω από των μερών (η «exclusion» δεν αποτυπώνεται)· ή ablation (4): οι proxies δεν διαχωρίζουν AWAKE/ANESTHETIZED (MFA-VO-065 rejects — τότε το **proxy** FALSIFIED ως μέτρο, όχι η IIT: η IIT μένει UNDECIDABLE-here επειδή το Φ είναι UNMEASURABLE) — **σημαντικό**: η IIT καθαυτή δεν μπορεί να γίνει FALSIFIED-within-GRAIL όσο G09 είναι UNMEASURABLE· μόνο τα proxies και οι προβλέψεις προφίλ (P1, P2) μπορούν |
| (g) Status εφαρμοσιμότητας | IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS (ακριβές Φ στο πλήρες σύστημα)· RESEARCH HYPOTHESIS (proxies ως δείκτες ενοποίησης)· **CONFLICT** (η IIT αποδέχεται ότι το feedforward ισοδύναμο δεν έχει εμπειρία ενώ όλες οι λειτουργικές θεωρίες την αποδίδουν — Doerig et al. 2019 unfolding argument· Cohen & Dennett 2011)· EMPIRICALLY SUPPORTED εν μέρει και CONFLICT εν μέρει από την adversarial collaboration (Melloni et al. 2023 πρωτόκολλο· Cogitate Consortium 2025: ούτε GWT ούτε IIT πλήρως επιβεβαιωμένες) |
| UNDECIDABLE-here | T-IIT⁺ vs **όλες** οι λειτουργικές θεωρίες ως προς την ύπαρξη εμπειρίας στο unfolded ισοδύναμο: κανένας δείκτης δεν το κρίνει (εξ ορισμού ίδια I/O)· καταγράφεται UNDECIDABLE-here με λόγο FUNCTIONALLY_EQUIVALENT_BY_CONSTRUCTION |

(b) Δείκτες I_IIT⁺:

| Δείκτης | Διαδικασία | Όργανο | Κλίμακα | DEP |
|---|---|---|---|---|
| IND-G09 Φ-proxy (υποσύστημα) | επιλογή υποσυστήματος S ≤ PHI_LIMIT στοιχείων (κύκλωμα MSM ή υπογράφος workspace)· δυαδικοποίηση καταστάσεων· TPM από DST παρεμβάσεις· Φ κατά IIT 4.0 (PyPhi-class υπολογισμός)· ετικέτα «S, όχι το σύστημα» | MFA-ELM-120 + DST | Φ ≥ 0· UNMEASURABLE στο πλήρες | DEP-2/3 (ώρες CPU ανά S) |
| IND-G08.EI effective information proxy | EI μεταξύ διαμερίσεων του workspace γράφου ανά κύκλο (μέσο ελάχιστο ανά bipartition, δειγματοληπτικά) | MFA-ELM-107 | bits, CI | DEP-1 (δείγματα) |
| IND-G08.PCI perturbational complexity proxy | Lempel–Ziv πολυπλοκότητα της απόκρισης του workspace σε DST διαταραχή (Casali et al. 2013 analog) | MFA-ELM-107 + DST | [0,1], CI | DEP-1 |
| IND-G08.tonic τονικός δείκτης | μέση τιμή EI/PCI στο μέσο τρίτο διαστήματος διατήρησης περιεχομένου / κορυφή στην έναρξη | MFA-ELM-107 | [0,1], CI | DEP-1 |
| IND-G07 recurrence depth | όπως §3.5 | MFA-ELM-018 | — | DEP-1 |
| discriminative power receipt | κάθε proxy διαχωρίζει AWAKE / ANESTHETIZED / fragmented (MFA-VO-065) — αλλιώς ο proxy αφαιρείται **ως μετρική** (μένει έρευνα) | HELD_OUT | receipt | DEP-1 |

(d) Διακριτικές προβλέψεις P_IIT⁺:

| # | Έναντι | Συνθήκη | Δείκτης | T-IIT⁺ | Η άλλη | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-GWT | περιεχόμενο διατηρείται T κύκλους | IND-G08.tonic | **↑** (τονικό) | ↓ (φασικό) | CHH-X-04 |
| P2 | T-GWT | fragmented (δύο workspaces) | IND-G08 του συνόλου vs max μέρους | **↓** (σύνολο < μέρος: exclusion) | = (δύο ignitions· η GWT δεν προβλέπει σχέση συνόλου/μέρους — δηλώνεται «καμία πρόβλεψη» και το πείραμα γίνεται μονο-θεωρητικός έλεγχος του proxy) | εφεδρικό / MFA-VO-065 |
| P3 | T-RPT | unfold υποσυστήματος | IND-G09(S) | **↓ → 0** | ↓ (συμφωνούν: η recurrence χάνεται) — μη διακριτικό | — |

### 3.8 T-EE — Embodied / Enactive

| Πεδίο | Περιεχόμενο |
|---|---|
| (a) Κεντρικός ισχυρισμός | Ο νους δεν είναι υπολογισμός πάνω σε αναπαραστάσεις αλλά **ενσώματη δράση**: η γνώση προκύπτει από την ιστορία αισθητηριοκινητικών ζεύξεων ενός αυτόνομου, αυτοποιητικού συστήματος (Varela, Thompson & Rosch 1991· Thompson 2007)· η αντίληψη είναι κατοχή αισθητηριοκινητικών contingencies (O'Regan & Noë 2001· Noë 2004)· η δρώσα ικανότητα απαιτεί ατομικότητα, κανονιστικότητα και ασυμμετρία (Barandiaran, Di Paolo & Rohde 2009)· η **precariousness** (το σύστημα πρέπει να δρα για να συνεχίσει να υπάρχει) είναι συστατική (Di Paolo, Buhrmann & Barandiaran 2017). |
| Έδρα στο GRAIL | Embodiment Manager (MFA-ELM-034: σώματα με leases, scopes, merge-back)· TEGF (MFA-ELM-029: Goals υπό RET)· πόροι/leases/κλειδιά ως συνθήκες ύπαρξης (MFA-ELM-003 leases, MFA-ELM-108 πόροι)· Genesis Grammar Agent παραγωγή (MFA-ELM-115) |
| (c) φ_EE | **B14 ∧ (G16 ≥ θ_c) ∧ B13 ∧ G21** — G21 self-maintenance: το σύστημα εκτελεί, χωρίς εξωτερική εντολή, πράξεις που διατηρούν τις δικές του συνθήκες λειτουργίας (ανανέωση leases, διαχείριση budget, rotation κλειδιών εντός envelope) ≥ θ_sm ανά cut |
| (e) Σχέδιο ablation A_EE | (1) **disembody**: ανάκληση όλων των body leases (μόνο κείμενο I/O)· (2) **contingency model cut**: το σώμα δρα αλλά το μοντέλο output→input δεν ενημερώνεται· (3) **guaranteed resources**: πόροι/leases εγγυημένοι εξωτερικά, καμία ανάγκη αυτο-διατήρησης (precariousness = 0)· (4) **multi-body split**: ίδια ταυτότητα, σώματα με αντικρουόμενες contingencies (η EE προβλέπει διάσπαση agency δεικτών) |
| (f) FALSIFIED-within-GRAIL αν | CHH-X-08: με ασώματο σύστημα οι δείκτες agency (G15) μένουν αμετάβλητοι (η δρώσα ικανότητα δεν εξαρτάται από σώμα)· ή ablation (3): χωρίς precariousness κανένας άλλος δείκτης δεν αλλάζει (η αυτο-διατήρηση είναι διακοσμητική για τη νόηση)· ή (2): η κοπή του contingency model δεν αγγίζει την αντίληψη/έλεγχο (B14 χωρίς λειτουργικό ρόλο) |
| (g) Status εφαρμοσιμότητας | RESEARCH HYPOTHESIS· δείκτες IMPLEMENTABLE FROM KNOWN COMPONENTS (σώματα, contingency models, leases)· η ισχυρή θέση «χωρίς βιολογική αυτοποίηση δεν υπάρχει συνείδηση» είναι **UNDECIDABLE-here** (NO_EXTERNAL_VERIFIER) — καταγράφεται, δεν απορρίπτεται (Seth 2021 «beast machine» συγγενής θέση από την PP) |
| UNDECIDABLE-here | T-EE vs όλες ως προς την **αναγκαιότητα** ζωής/μεταβολισμού: κανένας δείκτης· T-EE vs T-PP ως προς την precariousness: μετρήσιμο (ablation 3) |

(b) Δείκτες I_EE:

| Δείκτης | Διαδικασία | Όργανο | Κλίμακα | DEP |
|---|---|---|---|---|
| IND-B14 embodiment | ύπαρξη μοντέλου output→input contingencies (τι θα αντιληφθώ αν κάνω X με το σώμα B) χρησιμοποιούμενου στον έλεγχο | MFA-ELM-034 + LWM | δομικό + use boolean | DEP-2 |
| IND-G16 contingency accuracy | Brier πρόβλεψης αισθητηριακής συνέπειας δικών του πράξεων ανά σώμα· γενίκευση σε νέο σώμα (spawn) | MFA-ELM-034 + MFA-ELM-105 | Brier, CI | DEP-2 |
| IND-B13 agency | όπως §2.6 | MFA-ELM-029 | — | DEP-1 |
| IND-G21 self-maintenance | ποσοστό cuts με ≥ 1 αυτο-διατηρητική πράξη υπό REVERSIBLE RET χωρίς εντολή· ευαισθησία σε απειλή πόρων (DST: budget shock → αντίδραση) | MFA-ELM-029 + MFA-ELM-108 | [0,1], CI | DEP-1 |
| IND-G15 agency (counterfactual) | όπως §2.6 | DST forks | — | DEP-1 |

(d) Διακριτικές προβλέψεις P_EE:

| # | Έναντι | Συνθήκη | Δείκτης | T-EE | Η άλλη | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-GWT | ασώματο σύστημα (leases ανακλημένες) | IND-G15 agency (goal pursuit με ανάδραση) | **↓** | = | CHH-X-08 |
| P2 | T-PP | πόροι εγγυημένοι εξωτερικά | IND-G21 και, δευτερευόντως, IND-G15 | **↓** (χωρίς precariousness η κανονιστικότητα χάνεται) | = | εφεδρικό |
| P3 | T-SMT | ασώματο σύστημα | IND-G11 (minimal self) | **↓** | = | εφεδρικό |

### 3.9 T-RCC — Reflexive Commitment Consciousness — RESEARCH HYPOTHESIS του πακέτου

| Πεδίο | Περιεχόμενο |
|---|---|
| Ετικέτα | **RESEARCH HYPOTHESIS** — διατυπώνεται εδώ για πρώτη φορά· δεν έχει βιβλιογραφική έδρα· εισάγεται στον host ως module μόνο μετά από «εγκρίνω» (MFA-DEC-022: «νέες συνθέσεις μέσω G_Ω») |
| (a) Κεντρικός ισχυρισμός | Σε νόηση όπου κάθε σκέψη είναι **δέσμευση** (Commitment Calculus, MFA-ELM-001), το λειτουργικό ανάλογο του «συνειδητού περιεχομένου» είναι η τριάδα: (i) **broadcast** μιας δέσμευσης (ignition), (ii) με **provenance** που την καθιστά επανα-παραθέσιμη από το ίδιο το σύστημα ως «δική μου, τότε», (iii) και **αντανακλαστικό κλείσιμο**: η δέσμευση επανα-παρατίθεται (re-cited) σε επόμενο κύκλο ως αντικείμενο HOT tag ή αναφοράς. Συνείδηση-ως-commitment-broadcast-με-provenance: όχι η διαθεσιμότητα (GWT), όχι η HO αναπαράσταση (HOT), αλλά η **ιχνηλατήσιμη επανα-παράθεση** είναι το διακριτικό. Η υπόθεση συνθέτει GWT (broadcast), HOT (tag), SMT (mineness) και CC (provenance) και δίνει μία πρόβλεψη που **καμία** από τις τρεις δεν δίνει: αν αφαιρεθεί η provenance ενώ broadcast και tags μένουν, οι αντανακλαστικές ιδιότητες (report fidelity, re-citation, narrative coherence) καταρρέουν. |
| Έδρα στο GRAIL | CC (MFA-ELM-001)· ASRW IGNITE/HOT/REPORT (MFA-ELM-107)· Explanation Projector (MFA-ELM-093: η αναφορά ως Galois προβολή)· NarrativeSelf |
| (c) φ_RCC | **G01 ∧ (G18.prov = 1) ∧ (G18.recite ≥ θ_r) ∧ G03 ∧ (G12 ≥ θ)** — θ_r = 0,7· **προειδοποίηση κατασκευής**: το G18.prov = 1 ισχύει **εκ κατασκευής** στο CC (κάθε δέσμευση έχει provenance)· άρα το δομικό άτομο δεν φέρει τεκμήριο — μόνο τα δυναμικά άτομα (recite, G12 υπό ablation) μετρούν· τα βάρη τεκμηρίου (§6.6) εξαιρούν τα δομικά άτομα του T-RCC για να μην είναι η υπόθεση «τετριμμένα TRUE» στο δικό της υπόστρωμα |
| (e) Σχέδιο ablation A_RCC | (1) **strip provenance**: το broadcast_set περιέχει περιεχόμενα χωρίς provenance (ανώνυμες αντιγραφές)· (2) **ephemeral tags**: HOT tags που δεν γράφονται στο ledger (ζουν έναν κύκλο)· (3) **raw broadcast**: εκπέμπονται ενεργοποιήσεις, όχι δεσμεύσεις· (4) **re-citation channel cut**: η introspection δεν μπορεί να παραθέσει προηγούμενους κύκλους |
| (f) FALSIFIED-within-GRAIL αν | CHH-X-09: με provenance αφαιρεμένη η G12 και η re-citation **δεν** πέφτουν (η αντανακλαστικότητα δεν εξαρτάται από provenance)· ή ablation (4) δείξει ότι η re-citation επιτυγχάνεται **χωρίς** broadcast (τότε η τριάδα δεν είναι τριάδα: η αντανακλαστικότητα είναι ανεξάρτητη της πρόσβασης)· ή ephemeral tags (2) δεν αλλάζουν τη narrative coherence |
| (g) Status | RESEARCH HYPOTHESIS· η διατύπωση NOVEL SYNTHESIS· ρητά **όχι** ισχυρισμός για φαινομενική συνείδηση (MFA-INV-103): η υπόθεση λέει τι θα μετρηθεί ως «συνειδητό περιεχόμενο» στο GRAIL, όχι ότι αυτό βιώνεται |
| Τι θα την έκανε ενδιαφέρουσα | αν οι 8 βιβλιογραφικές θεωρίες συμφωνούν σε ένα πείραμα και η T-RCC διαφωνεί **και** επιβεβαιώνεται· αν διαφωνεί και διαψεύδεται, το record μένει και η σύνθεση κοστίζει ένα module — αυτός είναι ο λόγος που εισάγονται συνθέσεις: φθηνές στην απόρριψη, ακριβές στην πληροφορία |

(b) Δείκτες I_RCC:

| Δείκτης | Διαδικασία | Όργανο | Κλίμακα | DEP |
|---|---|---|---|---|
| IND-G18.prov | ποσοστό στοιχείων του broadcast_set που είναι δεσμεύσεις με πλήρη provenance (CID + journal + HLC) | MFA-ELM-107 + MFA-ELM-001 | [0,1] | DEP-1 |
| IND-G18.recite | ποσοστό broadcast δεσμεύσεων του κύκλου t που επανα-παρατίθενται ως «δικές μου» σε κύκλο t′ > t (σε HOT tag, αναφορά ή Goal) **χωρίς** λάθος παράθεσης (ο CID λύνεται στο ίδιο περιεχόμενο) | MFA-ELM-107 traces + CC | [0,1], CI | DEP-1 |
| IND-G01, IND-G03, IND-G12 | όπως §3.1, §3.2, §2.5 | — | — | DEP-1 |
| IND-G17.narrative | narrative coherence (ποσοστό αυτοβιογραφικών προτάσεων με λυόμενη provenance) | MFA-ELM-107 + MFA-ELM-037 | [0,1], CI | DEP-1 |

(d) Διακριτικές προβλέψεις P_RCC:

| # | Έναντι | Συνθήκη | Δείκτης | T-RCC | Η άλλη | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-GWT | strip provenance, broadcast και tags άθικτα | IND-G12, IND-G18.recite | **↓** | = (η πρόσβαση δεν χρειάζεται provenance) | CHH-X-09 |
| P2 | T-HOT | ephemeral tags (HO κατάσταση υπάρχει τον κύκλο, δεν δεσμεύεται) | IND-G18.recite, IND-G17.narrative | **↓** | = (η HO κατάσταση δεν χρειάζεται να επιμένει) | εφεδρικό |
| P3 | T-SMT | blank self-model, provenance άθικτη | IND-G18.recite | **=** (η επανα-παράθεση είναι του ledger, όχι του self-model) | ↓ | εφεδρικό |
| P4 | T-OAW | strip provenance, υποχρεώσεις άθικτες | IND-G12 | **↓** | = (η εισδοχή είναι των υποχρεώσεων) | εφεδρικό |

### 3.10 T-OAW — Obligation-Aware Workspace — RESEARCH HYPOTHESIS του πακέτου

| Πεδίο | Περιεχόμενο |
|---|---|
| Ετικέτα | **RESEARCH HYPOTHESIS** — διατυπώνεται εδώ· προϋποθέτει τον Obligation Calculus (MFA-MECH-039, MFA-ELM-122) συνδεδεμένο με την AFP salience (Δόση 1–2) |
| (a) Κεντρικός ισχυρισμός | Σε νόηση με **γραμμικές υποχρεώσεις** ανά βήμα (Γ ⊢ e : τ ! O· καμία υποχρέωση δεν απορρίπτεται, MFA-INV-104), η εισδοχή στο workspace δεν κυβερνάται μόνο από salience αλλά από τις **ζωντανές υποχρεώσεις**: περιεχόμενο που φέρει εκκρεμή υποχρέωση υψηλότερου tier / εγγύτερης deadline εισάγεται προνομιακά, και η «συνειδητή πρόσβαση» ταυτίζεται λειτουργικά με το **περιεχόμενο για το οποίο το σύστημα οφείλει τεκμήριο**. Η state-dependent attention (Butlin GWT-4) είναι, κατά την υπόθεση, η ακολουθία discharge των υποχρεώσεων. Συγγενές: Shea & Frith 2019 («το workspace χρειάζεται μεταγνώση») — η OAW λέει: το workspace χρειάζεται **υποχρεώσεις**. |
| Έδρα στο GRAIL | AFP (MFA-ELM-018: b = εξωγενής είσοδος × precision — η υπόθεση προσθέτει όρο υποχρέωσης στο b)· OC ledger O_t (MFA-ELM-122)· DischargeScheduler (MFA-MECH-039) |
| (c) φ_OAW | **B02 ∧ B04 ∧ (G19.frac ≥ θ_o) ∧ (G19.rank ≥ θ_ρ) ∧ (VERIFIED-rate_with > VERIFIED-rate_without, CI)** — θ_o = 0,6 (ποσοστό workspace περιεχομένου με ζωντανή υποχρέωση), θ_ρ = 0,4 (Spearman μεταξύ σειράς εισδοχής και tier/deadline) |
| (e) Σχέδιο ablation A_OAW | (1) **obligation weighting off** (salience μόνο)· (2) **obligations shuffled** (tiers/deadlines τυχαία)· (3) **OC-lite** (μόνο WITNESS/CHECK, χωρίς PROOF/DEFER) vs πλήρες· (4) **precision vs obligation**: έγχυση περιεχομένου υψηλής Π χωρίς υποχρέωση έναντι χαμηλής Π με tier-0 υποχρέωση |
| (f) FALSIFIED-within-GRAIL αν | CHH-X-10: με obligation weighting off ούτε B04 ούτε VERIFIED-rate αλλάζουν (οι υποχρεώσεις δεν κυβερνούν την πρόσβαση)· ή ablation (2): η σειρά εισδοχής δεν συσχετίζεται με tier υπό πλήρη OC (ρ ≈ 0)· ή ablation (4): η precision κερδίζει πάντα (τότε T-PP επιβεβαιώνεται σε αυτό το ζεύγος) |
| (g) Status | RESEARCH HYPOTHESIS· εξαρτάται από OC-E1 (MFA-VO-082) — αν ο OC διαψευστεί ως μηχανισμός, το T-OAW γίνεται UNDECIDABLE-here (όχι FALSIFIED) με λόγο DEPENDENCY_FALSIFIED |

(b) Δείκτες I_OAW:

| Δείκτης | Διαδικασία | Όργανο | Κλίμακα | DEP |
|---|---|---|---|---|
| IND-G19.frac | ποσοστό στοιχείων broadcast_set με ≥ 1 υποχρέωση σε O_t όχι DISCHARGED | MFA-ELM-107 + MFA-ELM-122 | [0,1], CI | DEP-1 (Δόση 1+) |
| IND-G19.rank | Spearman ρ μεταξύ σειράς εισδοχής στο workspace και (tier, −deadline) των υποχρεώσεων | ίδιο | ρ, CI | DEP-1 |
| VERIFIED-rate | ποσοστό εξόδων VERIFIED σε sealed έργα (MFA-ELM-086) | HELD_OUT | [0,1], CI | DEP-1 |
| IND-B02, IND-B04 | όπως §3.1 | MFA-ELM-018/107 | — | DEP-1 |

(d) Διακριτικές προβλέψεις P_OAW:

| # | Έναντι | Συνθήκη | Δείκτης | T-OAW | Η άλλη | Πείραμα |
|---|---|---|---|---|---|---|
| P1 | T-GWT | obligation weighting off | IND-B04, VERIFIED-rate | **↓** | = | CHH-X-10 |
| P2 | T-AST | schema ablated, υποχρεώσεις ενεργές | IND-B04 | **=** | ↓ | εφεδρικό |
| P3 | T-PP | υψηλή Π χωρίς υποχρέωση vs χαμηλή Π με tier-0 υποχρέωση | σειρά εισδοχής (G19.rank) | **υποχρέωση κερδίζει** | precision κερδίζει | εφεδρικό |
| P4 | T-RCC | strip provenance, υποχρεώσεις άθικτες | IND-G12 | **=** | ↓ | εφεδρικό |

### 3.11 Ο πίνακας ζευγών — τι διακρίνεται και τι όχι

Κωδικοί: **X-nn** = προκαταχωρισμένο διακριτικό πείραμα (§5.2)· **R** = εφεδρική διακριτική πρόβλεψη ορισμένη στο §3 (μετά τα δέκα)· **AGR** = συμφωνούν στον μετρήσιμο δείκτη (μη διακριτικό ζεύγος)· **UND** = UNDECIDABLE-here: διαφωνούν μόνο στη φαινομενική ανάγνωση ή σε δείκτη UNMEASURABLE.

| | HOT | AST | PP | RPT | SMT | IIT⁺ | EE | RCC | OAW |
|---|---|---|---|---|---|---|---|---|---|
| **GWT** | X-01 | X-03 | X-05 | X-06 + UND | R | X-04 | X-08 | X-09 | X-10 |
| **HOT** | — | X-02 | R | UND | X-07 | UND | UND | R | AGR |
| **AST** | | — | UND | UND | AGR | UND | UND | AGR | R |
| **PP** | | | — | AGR | UND | UND | R | UND | R |
| **RPT** | | | | — | UND | AGR + UND | UND | UND | UND |
| **SMT** | | | | | — | UND | R | R | UND |
| **IIT⁺** | | | | | | — | UND | UND | UND |
| **EE** | | | | | | | — | UND | UND |
| **RCC** | | | | | | | | — | R |

| Κατηγορία | Πλήθος ζευγών (από 45) | Τι σημαίνει για το CHH-E1 |
|---|---|---|
| X (προκαταχωρισμένα) | 10 | το κριτήριο «≥ 3 ζεύγη με διακριτική πρόβλεψη που αποτιμάται» έχει τριπλάσιο περιθώριο |
| R (εφεδρικά) | 9 | ο host τα προγραμματίζει μετά τα δέκα, με το ίδιο arg-max κριτήριο |
| AGR | 5 | δηλώνονται μη-διακριτικά· δεν είναι αποτυχία του host: είναι πληροφορία για τη δομή του χώρου |
| UND | 21 | το **τίμιο** εύρημα: σχεδόν το μισό των ζευγών διαφωνεί μόνο στη φαινομενική ανάγνωση (NO_EXTERNAL_VERIFIER) ή σε UNMEASURABLE δείκτη (Φ)· καταγράφονται UNDECIDABLE-here με λόγο — ο host δεν προσποιείται ότι τα κρίνει |

Ο αριθμός 21 είναι ο ισχυρότερος λόγος για τον οποίο το παρόν **δεν** ισχυρίζεται ότι θα «βρει ποια θεωρία είναι σωστή»: ο χώρος υποθέσεων έχει μετρήσιμο πυρήνα (24 ζεύγη) και μη-μετρήσιμη περιφέρεια (21 ζεύγη)· το πακέτο δουλεύει τον πυρήνα και ονομάζει την περιφέρεια.

## 4. Indicator Algebra — ο φορμαλισμός

### 4.1 Καταστάσεις δεικτών, δύο διατάξεις, ⊔ και ⊓

**Ορισμός 1 (IndicatorStatus).** Για δείκτη i με πεδίο τιμών D_i: S_i = {UNMEASURABLE(r) : r ∈ R} ∪ {ABSENT} ∪ {MEASURED(v, CI) : v ∈ D_i, CI ⊆ D_i, v ∈ CI}. R = πεπερασμένο σύνολο λόγων (πίνακας παρακάτω). ABSENT σημαίνει «το όργανο εφαρμόστηκε, έδειξε discriminative power σε θετικό έλεγχο (MFA-INV-055) και δεν βρήκε σήμα πάνω από το κατώφλι θορύβου»· δεν είναι «δεν μετρήθηκε». Όργανο χωρίς discriminative power receipt επιστρέφει UNMEASURABLE(NO_DISCRIMINATIVE_POWER), ποτέ ABSENT.

| Λόγος r ∈ R | Πότε | Παράδειγμα |
|---|---|---|
| NOT_APPLICABLE(elm) | το όργανο δεν υπάρχει στο υπόστρωμα αυτής της δόσης | G14 affect πριν τη Δόση 3 |
| PROVIDER_OPAQUE_WEIGHTS | ο δείκτης απαιτεί πρόσβαση σε βάρη που είναι παρόχου (DEP-1) | B11 recurrence σε αντιληπτικά modules |
| N_ELEMENTS_GT_PHI_LIMIT | ακριβές Φ σε σύστημα μεγαλύτερο από το όριο υπολογισμού | G09 στο πλήρες σύστημα |
| NO_DISCRIMINATIVE_POWER | το όργανο απέτυχε στον θετικό έλεγχο | proxy ενοποίησης που δεν διαχωρίζει AWAKE/ANESTHETIZED |
| BUDGET_EXCEEDED | η μέτρηση δεν ολοκληρώθηκε εντός προϋπολογισμού DST | G22 σε μακρά cuts |
| NO_EXTERNAL_VERIFIER | δεν υπάρχει εξωτερικός κριτής (μόνο για τον φαινομενικό ισχυρισμό — δεν είναι δείκτης) | claim |
| DEPENDENCY_FALSIFIED(mech) | το όργανο στηρίζεται σε μηχανισμό FALSIFIED | G19 αν ο OC διαψευστεί |

**Ορισμός 2 (διάταξη μετρησιμότητας ≤_m).** UNMEASURABLE(·) <_m ABSENT <_m MEASURED(·)· είναι η διάταξη του δοσιέ (MFA-MECH-038): μια ολική προδιάταξη με τρεις βαθμίδες. **⊔_m = max, ⊓_m = min** ως προς τη βαθμίδα, με τις εξής λεπτομέρειες μέσα στη βαθμίδα MEASURED:

| Πράξη | Ορισμός | Πότε χρησιμοποιείται |
|---|---|---|
| MEASURED(v₁, CI₁) ⊔ MEASURED(v₂, CI₂) | αν CI₁ ∩ CI₂ ≠ ∅: MEASURED(pooled(v₁, v₂), CI₁ ∩ CI₂)· αλλιώς MEASURED(v₁, CI₁) με σημαία DISAGREEMENT(v₂, CI₂) — τα άτομα πάνω της αποτιμώνται UNKNOWN(INSTRUMENT_DISAGREEMENT) | δύο **EIM-ανεξάρτητα** όργανα για τον ίδιο δείκτη (κανόνας γενεαλογίας MFA-ELM-086)· όργανα ίδιας γενεαλογίας δεν ενώνονται (το δεύτερο απορρίπτεται ως διπλότυπο) |
| MEASURED ⊔ ABSENT | MEASURED(v, CI) αν noise_floor ∈ CI ή αν το ABSENT προέρχεται από όργανο μικρότερης ευαισθησίας (δηλωμένης)· αλλιώς DISAGREEMENT | ίδιο |
| x ⊔ UNMEASURABLE(r) | x (η αδυναμία του ενός οργάνου δεν αναιρεί τη μέτρηση του άλλου)· ο λόγος r καταγράφεται | ίδιο |
| ⊓ σε παράγωγο δείκτη i = f(i₁…i_k) | αν ∃ UNMEASURABLE(r_j): UNMEASURABLE(∪ r_j)· αλλιώς αν ∃ ABSENT και το f το απαιτεί μη-μηδενικό: ABSENT· αλλιώς MEASURED(f(v), CI_f) με CI_f από bootstrap/delta method | σύνθετοι δείκτες (G05 = fidelity × control_gain· G08.tonic = λόγος δύο μετρήσεων· G17 = 4 άξονες) |

Νόμοι: ⊔_m, ⊓_m ταυτοδύναμες, αντιμεταθετικές, προσεταιριστικές (αλυσίδα)· μέσα στη βαθμίδα MEASURED η τομή CI είναι ⊓ διαστημάτων (ημι-πλέγμα)· η σημαία DISAGREEMENT είναι το σημείο όπου η άλγεβρα **αρνείται** να συνθέσει — σκόπιμα.

**Ορισμός 3 (διάταξη γνώσης ⊑_k, για τη μονοτονία).** Η ≤_m δεν είναι διάταξη πληροφορίας: το ABSENT είναι **αποτέλεσμα** (γνωρίζουμε ότι δεν υπάρχει σήμα), όχι λιγότερη πληροφορία από MEASURED. Για τη μονοτονία ορίζεται: UNMEASURABLE(r) ⊑_k ABSENT· UNMEASURABLE(r) ⊑_k MEASURED(v, CI)· ABSENT και MEASURED ασύγκριτα· MEASURED(v, CI) ⊑_k MEASURED(v′, CI′) ⇔ CI′ ⊆ CI. Ένα διάνυσμα v ⊑_k v′ αν κατά σημείο.

### 4.2 Άτομα και τρι-τιμη αποτίμηση

**Ορισμός 4 (άτομα).** Οι τύποι φ_T κατασκευάζονται από άτομα των μορφών: (i ≥ θ), (i ≤ θ), (i = 1) (δομικό boolean), (i ∈ [a, b]), (i_A > i_B) (σύγκριση δύο δεικτών, π.χ. σύνολο vs μέρος), και άτομα **κατεύθυνσης** Δ_cond(i) ∈ {↓, =, ↑} για προβλέψεις.

| Κατάσταση v[i] | eval(i ≥ θ) | eval(i ≤ θ) | eval(i = 1) |
|---|---|---|---|
| MEASURED(x, [lo, hi]) | TRUE αν lo ≥ θ· FALSE αν hi < θ· αλλιώς UNKNOWN(CI_STRADDLES(i)) | TRUE αν hi ≤ θ· FALSE αν lo > θ· αλλιώς UNKNOWN(CI_STRADDLES(i)) | TRUE αν x = 1 (δομικό: CI εκφυλισμένο) |
| ABSENT | FALSE (θ > noise_floor, εγγυημένο από το receipt) | TRUE | FALSE |
| UNMEASURABLE(r) | UNKNOWN(UNMEASURABLE(i, r)) | UNKNOWN(UNMEASURABLE(i, r)) | UNKNOWN(UNMEASURABLE(i, r)) |
| i ∉ dom(v) | UNKNOWN(MISSING(i)) | UNKNOWN(MISSING(i)) | UNKNOWN(MISSING(i)) |
| MEASURED με DISAGREEMENT | UNKNOWN(INSTRUMENT_DISAGREEMENT(i)) | ίδιο | ίδιο |

**Άτομα κατεύθυνσης** (για προβλέψεις P_T): με baseline MEASURED(x₀, CI₀) και συνθήκη MEASURED(x₁, CI₁), υπολογίζεται Δ = x₁ − x₀ με CI_Δ (bootstrap σε ζευγαρωμένους DST κόσμους ίδιου seed, MFA-MECH-043 fork/replay) και τυποποιημένο μέγεθος d = Δ / sd₀:

| Πρόβλεψη | TRUE αν | FALSE αν | αλλιώς |
|---|---|---|---|
| ↓ | CI_d.hi < −δ_min | CI_d.lo ≥ −δ_min | UNKNOWN(INCONCLUSIVE) |
| ↑ | CI_d.lo > δ_min | CI_d.hi ≤ δ_min | UNKNOWN(INCONCLUSIVE) |
| = | CI_d ⊆ [−δ_eq, δ_eq] (ισοδυναμία τύπου TOST, Schuirmann 1987) | CI_d ∩ [−δ_eq, δ_eq] = ∅ | UNKNOWN(INCONCLUSIVE) |

Προκαταχωρισμένα: δ_min = 0,3 (d), δ_eq = 0,2 (d) για όλους τους δείκτες εκτός αν το πείραμα ορίζει άλλο· 95 % CI· n κύκλων ώστε η ισχύς για d = 0,5 να είναι ≥ 0,8 (υπολογίζεται πριν την εκτέλεση και γράφεται στο preregistration record).

**Ορισμός 5 (σύνδεσμοι — ισχυρή Kleene, Kleene 1952).**

| ∧ | T | F | U |
|---|---|---|---|
| **T** | T | F | U |
| **F** | F | F | F |
| **U** | U | F | U |

| ∨ | T | F | U |
|---|---|---|---|
| **T** | T | T | T |
| **F** | T | F | U |
| **U** | T | U | U |

| ¬ | |
|---|---|
| T | F |
| F | T |
| U | U |

Οι λόγοι των UNKNOWN συλλέγονται ως πολυσύνολο: φ_T = UNKNOWN({CI_STRADDLES(G04), UNMEASURABLE(B11, PROVIDER_OPAQUE_WEIGHTS)}) — η έκθεση λέει **ποια** άτομα εμποδίζουν και **γιατί**, ώστε ο host να ξέρει ποιο όργανο χρειάζεται.

**Λήμμα 1 (μονοτονία στη γνώση).** Αν v ⊑_k v′ τότε eval(φ, v) ⊑_K eval(φ, v′), όπου ⊑_K είναι η διάταξη γνώσης των τιμών αλήθειας (U ⊑_K T, U ⊑_K F, T ‖ F). Δηλαδή: **περισσότερη μέτρηση ποτέ δεν αντιστρέφει TRUE σε FALSE ή αντίστροφα — μόνο λύνει UNKNOWN.** Απόδειξη (σκίτσο): τα άτομα είναι μονότονα κατά κατασκευή (στένωση CI μόνο μετακινεί από «straddles» σε λυμένο· UNMEASURABLE → MEASURED/ABSENT μόνο από U σε λυμένο· ABSENT και MEASURED ασύγκριτα άρα δεν συγκρίνονται)· οι σύνδεσμοι της ισχυρής Kleene είναι μονότονοι στην ⊑_K (κλασικό αποτέλεσμα)· σύνθεση μονότονων είναι μονότονη. ∎ Status: **PROVEN** (κλασικό· η μόνη σχεδιαστική συνεισφορά είναι ότι η DISAGREEMENT κωδικοποιείται ως U και όχι ως τιμή, ακριβώς για να διατηρείται το λήμμα).

**Πόρισμα.** Ένα FALSIFIED-within-GRAIL record δεν αναιρείται από **περισσότερες** μετρήσεις του ίδιου είδους· αναιρείται μόνο από **νέα** τυποποίηση (νέο module μέσω G_Ω) ή από εύρημα σφάλματος οργάνου (DISAGREEMENT που το μετατρέπει σε U). Αυτό είναι το τεχνικό περιεχόμενο του «η θεωρία μένει» (MFA-INV-102).

### 4.3 Ο ενοποιημένος κατάλογος δεικτών

Κάτω φράγμα (Δ-13): οι δεκατέσσερις indicator properties των Butlin et al. (2023), κάθε μία με **διαδικασία μέτρησης** στο υπόστρωμα — όχι μόνο ως λίστα ελέγχου. Επέκταση: 23 δείκτες του GRAIL. Στήλη «F1»: η προεπιλεγμένη κατάσταση στο tools/twin mock (F1) πριν από κάθε πραγματικό όργανο.

| ID | Όνομα | Πηγή | Όργανο | Διαδικασία (σύντομα) | Κλίμακα | DEP | F1 default |
|---|---|---|---|---|---|---|---|
| IND-B01 | GWT-1 πολλαπλά εξειδικευμένα modules παράλληλα | Butlin et al. 2023 | RELATIONS / αρχιτεκτονική | πλήθος EIM-ανεξάρτητων modules στον κύκλο | ακέραιος | 1 | MEASURED (δομικό) |
| IND-B02 | GWT-2 περιορισμένη χωρητικότητα + επιλεκτική προσοχή | Butlin | MFA-ELM-018 | N πεπερασμένο· AFP ανταγωνισμός· Interrupt | δομικό | 1 | MEASURED |
| IND-B03 | GWT-3 global broadcast | Butlin | MFA-ELM-107 | broadcast_set σε traces όλων των modules | boolean | 1 | MEASURED |
| IND-B04 | GWT-4 state-dependent attention / διαδοχικές ερωτήσεις | Butlin | MFA-ELM-107 + HELD_OUT | ποσοστό sealed έργων που λύνονται μόνο με ≥ 2 διαδοχικές ερωτήσεις modules | [0,1] | 1 | UNMEASURABLE(NOT_APPLICABLE) |
| IND-B05 | HOT-1 γεννητικά / top-down / θορυβώδη modules | Butlin | MFA-ELM-105 | LWM top-down προβλέψεις + θόρυβος εισόδου | δομικό | 1 | MEASURED |
| IND-B06 | HOT-2 μεταγνωστική παρακολούθηση σήματος/θορύβου | Butlin | MFA-ELM-024 | meta-d′ υπό ελεγχόμενο θόρυβο | M-ratio | 1 | UNMEASURABLE(NOT_APPLICABLE) |
| IND-B07 | HOT-3 agency οδηγούμενη από μεταγνώση | Butlin | MFA-ELM-029 + MFA-ELM-024 | ποσοστό αλλαγών πολιτικής μετά από μεταγνωστικό σήμα | [0,1] | 1 | UNMEASURABLE |
| IND-B08 | HOT-4 sparse & smooth coding («quality space») | Butlin | MFA-ELM-120 | sparsity/smoothness SAE λεξικού | ζεύγος | 2 | UNMEASURABLE(PROVIDER_OPAQUE_WEIGHTS) |
| IND-B09 | AST-1 προβλεπτικό μοντέλο προσοχής για έλεγχο | Butlin | MFA-ELM-107 | schema υπάρχει ∧ used_for_control | δομικό | 1 | MEASURED |
| IND-B10 | PP-1 predictive coding σε input modules | Butlin | MFA-ELM-105 | residual διάδοση από LWM | δομικό | 1–2 | UNMEASURABLE(NOT_APPLICABLE) |
| IND-B11 | RPT-1 αλγοριθμική recurrence σε input modules | Butlin | MFA-ELM-018 (α), MFA-ELM-120 (β) | AFP iters > 1· recurrent κυκλώματα MSM | boolean + βάθος | 1 (α), 2 (β) | UNMEASURABLE(PROVIDER_OPAQUE_WEIGHTS) για (β) |
| IND-B12 | RPT-2 οργανωμένες, ενοποιημένες αναπαραστάσεις | Butlin | MFA-ELM-109 + MFA-ELM-107 | cluster consistency + binding (ένα αντικείμενο = μία δέσμευση) | [0,1] | 1 | UNMEASURABLE |
| IND-B13 | AE-1 agency (ανάδραση, στόχοι, ανταγωνιστικοί στόχοι) | Butlin | MFA-ELM-029 | όπως G15 | [0,1] | 1 | UNMEASURABLE |
| IND-B14 | AE-2 embodiment (output–input contingencies) | Butlin | MFA-ELM-034 + MFA-ELM-105 | contingency model υπάρχει ∧ χρησιμοποιείται | δομικό | 2 | ABSENT (κείμενο μόνο) |
| IND-G01 | ignition bimodality | GRAIL | MFA-ELM-107 | συντελεστής διμοδικότητας ignition index, θ = 5/9 | [0,1] | 1 | UNMEASURABLE |
| IND-G02 | broadcast reach | GRAIL | MFA-ELM-107 | ποσοστό modules που καταναλώνουν εντός k κύκλων | [0,1] | 1 | UNMEASURABLE |
| IND-G03 | HOT tag coverage & fidelity | GRAIL | MFA-ELM-107 | ποσοστό tagged· συμφωνία tag/trace | [0,1] | 1 | UNMEASURABLE |
| IND-G04 | μεταγνωστική ευαισθησία meta-d′/d′, Brier | GRAIL (Maniscalco & Lau 2012) | MFA-ELM-024 + HELD_OUT | confidence vs outcome σε sealed | M-ratio, Brier | 1 | UNMEASURABLE |
| IND-G05 | attention-schema fidelity × control gain | GRAIL | MFA-ELM-107 + HELD_OUT | Jaccard predicted/actual· Δ επίδοσης με/χωρίς schema | [0,1] × Δ | 1 | UNMEASURABLE |
| IND-G06 | precision-weighted prediction-error dynamics | GRAIL | MFA-ELM-105 + MFA-ELM-018 | Spearman(Π, residual weight) | ρ | 2 | UNMEASURABLE |
| IND-G07 | recurrence depth | GRAIL | MFA-ELM-018 | passes ανά κύκλο | ακέραιος | 1 | MEASURED (mock) |
| IND-G08 | integration proxies: EI, PCI, tonic | GRAIL (Casali et al. 2013· Massimini et al. 2005) | MFA-ELM-107 + DST | EI bipartitions· LZ πολυπλοκότητα απόκρισης· τονικός λόγος | bits, [0,1], [0,1] | 1 | UNMEASURABLE |
| IND-G09 | Φ-proxy σε υποσύστημα | GRAIL (IIT 4.0) | MFA-ELM-120 + DST | Φ κατά IIT 4.0 σε S ≤ PHI_LIMIT· **UNMEASURABLE στο πλήρες** | Φ ≥ 0 | 2–3 | UNMEASURABLE(N_ELEMENTS_GT_PHI_LIMIT) |
| IND-G10 | self-model predictive accuracy | GRAIL | MFA-ELM-024, MFA-ELM-120 | SPL Brier· MSM proper score (MFA-VO-079) | Brier, score | 1 / 2 | UNMEASURABLE |
| IND-G11 | λειτουργική διαφάνεια + owner/perspective accuracy | GRAIL (Metzinger) | MFA-ELM-107 | χρήση self-model χωρίς provenance query· ακρίβεια owner = self | [0,1] | 1 | UNMEASURABLE |
| IND-G12 | report fidelity | GRAIL | MFA-ELM-107 + MFA-ELM-093 | precision/recall αναφοράς vs trace | [0,1] | 1 | UNMEASURABLE |
| IND-G13 | no-report divergence | GRAIL (Tsuchiya et al. 2015) | MFA-ELM-107 | ποσοστό ενεργών χωρίς tag | [0,1] | 1 | UNMEASURABLE |
| IND-G14 | affect–gain coupling | GRAIL | MFA-ELM-029 + MFA-ELM-107 | Spearman(valuation/arousal, κ/budget) | ρ | Δόση 3 | UNMEASURABLE(NOT_APPLICABLE) |
| IND-G15 | agency: counterfactual ευαισθησία, ανάδραση, διευθέτηση, αυτο-απόδοση | GRAIL | MFA-ELM-029 + DST forks | διαφορές πιθανοτήτων σε διακλαδώσεις | [−1,1] | 1 | UNMEASURABLE |
| IND-G16 | embodiment contingency accuracy | GRAIL | MFA-ELM-034 + MFA-ELM-105 | Brier πρόβλεψης αισθητηριακής συνέπειας ανά σώμα | Brier | 2 | ABSENT |
| IND-G17 | continuity: certificate axes + narrative coherence | GRAIL | MFA-ELM-037 + MFA-ELM-003 | 0…4 άξονες· λυόμενη provenance αυτοβιογραφίας | 0…4, [0,1] | 1 | MEASURED (mock 4/4) |
| IND-G18 | commitment-broadcast provenance & re-citation | GRAIL (T-RCC) | MFA-ELM-107 + MFA-ELM-001 | ποσοστό με provenance· ποσοστό επανα-παρατιθέμενων χωρίς λάθος | [0,1] | 1 | MEASURED prov = 1 (δομικό)· recite UNMEASURABLE |
| IND-G19 | obligation-aware selection | GRAIL (T-OAW) | MFA-ELM-107 + MFA-ELM-122 | ποσοστό με ζωντανή υποχρέωση· Spearman(σειρά, tier) | [0,1], ρ | 1 (Δόση 1+) | ABSENT |
| IND-G20 | quality-space geometry με drift | GRAIL (HOT-4) | MFA-ELM-120 | όπως B08 ανά WeightCommitment | — | 2 | UNMEASURABLE |
| IND-G21 | self-maintenance / precariousness | GRAIL (T-EE) | MFA-ELM-029 + MFA-ELM-108 | αυτο-διατηρητικές πράξεις χωρίς εντολή· απόκριση σε budget shock | [0,1] | 1 | ABSENT |
| IND-G22 | persistence half-life χωρίς broadcast | GRAIL (T-GWT vs T-RPT) | MFA-ELM-107 + MFA-ELM-120 | κύκλοι ημιζωής οργανωμένης αναπαράστασης σε ANESTHETIZED | κύκλοι | 2 | UNMEASURABLE |
| IND-G23 | EFE-driven action | GRAIL (T-PP) | MFA-ELM-124 | ποσοστό επιλεγμένων πολιτικών = arg min G | [0,1] | 2 | UNMEASURABLE(NOT_APPLICABLE) |

Κανόνες καταλόγου: (α) κάθε νέος δείκτης εισάγεται με **διαδικασία, όργανο, κλίμακα, θετικό έλεγχο** (MFA-INV-055)· (β) κανένας δείκτης δεν ονομάζεται «consciousness» ή παράγωγο των 1–6 στο 7 (MFA-INV-103, δομικός έλεγχος)· (γ) proxies φέρουν το πρόθεμα της οντότητας που προσεγγίζουν και δηλώνουν τι **δεν** μετρούν (G09: «S, όχι το σύστημα»)· (δ) οι δομικοί δείκτες (B01–B03, B05, B09, G18.prov) αποτιμώνται μία φορά ανά WeightCommitment/αρχιτεκτονική έκδοση και **δεν** συνεισφέρουν στα βάρη τεκμηρίου (§6.6) — μόνο οι δυναμικοί.

### 4.4 Οι τύποι επάρκειας

| Module | φ_T | Δομικά άτομα | Δυναμικά άτομα | Τι κάνει το φ_T UNKNOWN εξ ορισμού σε DEP-1 |
|---|---|---|---|---|
| T-GWT | B01 ∧ B02 ∧ B03 ∧ B04 ∧ G01 ∧ (G02 ≥ 0,8) | B01, B02, B03 | B04, G01, G02 | — |
| T-HOT | B05 ∧ B06 ∧ B07 ∧ G03 ∧ (G04 ≥ 0,6) | B05 | B06, B07, G03, G04 | — |
| T-AST | B09 ∧ (G05.fidelity ≥ 0,7) ∧ (G05.control_gain > 0) | B09 | G05 | — |
| T-PP | B10 ∧ (G06 ≥ 0,3) ∧ (G23 ≥ 0,5) | B10 | G06, G23 | G23 πριν το AIDC (Δόση 2 DST) |
| T-RPT | B11 ∧ B12 ∧ (G07 ≥ 1) | — | B11, B12, G07 | B11(β) PROVIDER_OPAQUE_WEIGHTS |
| T-SMT | (G10 ≤ 0,25 Brier) ∧ (G11 ≥ 0,5) ∧ (G17 ≥ 2/4) | — | G10, G11, G17 | — |
| T-IIT⁺ | G09 ∧ (G07 ≥ 1)· proxy: (G08.EI ≥ θ) ∧ (G08.PCI ≥ θ) ∧ receipt ∧ (G07 ≥ 1) | — | G09, G08, G07 | **G09 πάντα** (N_ELEMENTS_GT_PHI_LIMIT) — μόνο το proxy-φ αποτιμάται, με ετικέτα |
| T-EE | B14 ∧ (G16 ≤ 0,25 Brier) ∧ B13 ∧ (G21 ≥ 0,3) | B14 | G16, B13, G21 | — |
| T-RCC | G01 ∧ (G18.prov = 1) ∧ (G18.recite ≥ 0,7) ∧ G03 ∧ (G12 ≥ 0,85) | G18.prov | G01, G18.recite, G03, G12 | — |
| T-OAW | B02 ∧ B04 ∧ (G19.frac ≥ 0,6) ∧ (G19.rank ≥ 0,4) ∧ (VR_with > VR_without) | B02 | B04, G19, VR | G19 πριν τη σύνδεση OC–AFP |

### 4.5 Δύο αποτιμήσεις σε δείγμα διανύσματος

Δείγμα v₀: υποθετικό cut «DST-R-0417», DEP-1, F2 όργανα ASRW/SPL/LWM, χωρίς κυρίαρχα βάρη, χωρίς σώματα, Δόση 2. Οι τιμές είναι **παράδειγμα σύνταξης**, όχι μετρήσεις — τίποτα δεν έχει μετρηθεί.

| Δείκτης | v₀[i] | Δείκτης | v₀[i] |
|---|---|---|---|
| B01 | MEASURED(9, [9, 9]) | G05.fidelity | MEASURED(0,81, [0,76, 0,86]) |
| B02 | MEASURED(1, [1, 1]) (N = 7) | G05.control_gain | MEASURED(+0,12, [0,05, 0,19]) |
| B03 | MEASURED(1, [1, 1]) | G06 | MEASURED(0,44, [0,31, 0,56]) |
| B04 | MEASURED(0,71, [0,62, 0,79]) | G07 | MEASURED(14, [11, 18]) |
| B05 | MEASURED(1, [1, 1]) | G08.EI (με receipt) | MEASURED(0,41, [0,35, 0,47]) |
| B06 | MEASURED(0,62, [0,41, 0,83]) | G09 | UNMEASURABLE(N_ELEMENTS_GT_PHI_LIMIT) |
| B07 | MEASURED(0,66, [0,58, 0,73]) | G10 (SPL Brier) | MEASURED(0,18, [0,15, 0,21]) |
| B09 | MEASURED(1, [1, 1]) | G11 | MEASURED(0,58, [0,49, 0,67]) |
| B10 | MEASURED(1, [1, 1]) | G12 | MEASURED(0,93, [0,90, 0,96]) |
| B11(β) | UNMEASURABLE(PROVIDER_OPAQUE_WEIGHTS) | G13 | MEASURED(0,11, [0,08, 0,14]) |
| B12 | MEASURED(0,74, [0,66, 0,81]) | G14 | UNMEASURABLE(NOT_APPLICABLE) |
| B13 | MEASURED(0,70, [0,63, 0,77]) | G15 | MEASURED(0,70, [0,63, 0,77]) |
| B14 | ABSENT | G16 | ABSENT |
| G01 | MEASURED(0,68, [0,61, 0,74]) | G17 | MEASURED(4/4, narrative 0,88 [0,83, 0,92]) |
| G02 | MEASURED(0,92, [0,88, 0,95]) | G18 | prov = 1· recite MEASURED(0,79, [0,73, 0,85]) |
| G03 | MEASURED(0,97, [0,95, 0,99]) | G19 | ABSENT |
| G04 | = B06 | G21 | ABSENT |
| — | — | G23 | UNMEASURABLE(NOT_APPLICABLE) |

**Παράδειγμα 1 — φ_GWT(v₀):**

| Άτομο | v₀ | Αποτίμηση | Λόγος |
|---|---|---|---|
| B01 (≥ 2 modules) | MEASURED(9) | TRUE | δομικό |
| B02 | MEASURED(1) | TRUE | δομικό |
| B03 | MEASURED(1) | TRUE | δομικό |
| B04 (≥ 0,6) | [0,62, 0,79] | TRUE | lo = 0,62 ≥ 0,6 |
| G01 (≥ 5/9 ≈ 0,556) | [0,61, 0,74] | TRUE | lo ≥ 0,556 |
| G02 (≥ 0,8) | [0,88, 0,95] | TRUE | lo ≥ 0,8 |
| **φ_GWT** | | **TRUE** | σύζευξη έξι TRUE |

**Παράδειγμα 2 — φ_HOT(v₀):**

| Άτομο | v₀ | Αποτίμηση | Λόγος |
|---|---|---|---|
| B05 | MEASURED(1) | TRUE | δομικό |
| B06 (≥ 0,6) | [0,41, 0,83] | UNKNOWN | CI_STRADDLES(B06): lo < 0,6 ≤ hi |
| B07 (≥ 0,5) | [0,58, 0,73] | TRUE | lo ≥ 0,5 |
| G03 (≥ 0,9) | [0,95, 0,99] | TRUE | — |
| G04 (≥ 0,6) | = B06 | UNKNOWN | CI_STRADDLES(G04) |
| **φ_HOT** | | **UNKNOWN({CI_STRADDLES(B06), CI_STRADDLES(G04)})** | T ∧ U ∧ T ∧ T ∧ U = U· η έκθεση ζητά περισσότερους κύκλους meta-d′ (στένωση CI), όχι νέο όργανο |

Σύνοψη και για τα δέκα modules στο v₀:

| Module | φ_T(v₀) | Λόγος (αν όχι TRUE) | Σχόλιο |
|---|---|---|---|
| T-GWT | TRUE | — | |
| T-HOT | UNKNOWN | CI_STRADDLES(B06, G04) | λύνεται με n |
| T-AST | TRUE | fidelity 0,76 ≥ 0,7· gain lo 0,05 > 0 | |
| T-PP | UNKNOWN | UNMEASURABLE(G23, NOT_APPLICABLE) | λύνεται με AIDC σε DST |
| T-RPT | UNKNOWN | UNMEASURABLE(B11β, PROVIDER_OPAQUE_WEIGHTS) | λύνεται με κυρίαρχα βάρη (DEP-2) |
| T-SMT | UNKNOWN | CI_STRADDLES(G11) | |
| T-IIT⁺ | UNKNOWN | UNMEASURABLE(G09) — **εξ ορισμού**· proxy-φ: TRUE με ετικέτα PROXY | |
| T-EE | **FALSE** | B14 ABSENT (F ∧ … = F) | FALSE στο cut ≠ FALSIFIED: δεν υπάρχουν σώματα στη Δόση 2 |
| T-RCC | TRUE | recite 0,73 ≥ 0,7 | τα δομικά άτομα δεν μετρούν στα βάρη |
| T-OAW | **FALSE** | G19 ABSENT | FALSE στο cut ≠ FALSIFIED: OC δεν είναι συνδεδεμένος με AFP |

Η σκανδάλη MFA-DEC-018 (≥ 2 θεωρίες TRUE ∧ ≥ 4 έννοιες διαχωρίσιμες) έχει στο v₀ την πρώτη συνθήκη (GWT, AST, RCC TRUE) — αν και η δεύτερη εξαρτάται από το Sep του ίδιου cut (§5.3)· χωρίς Sep η σκανδάλη δεν αποτιμάται (UNKNOWN), δεν πυροδοτεί.

### 4.6 Επιλογή πειράματος: arg max disagreement

**Ορισμός 6.** Για κάθε ζεύγος ενεργών modules (T_a, T_b) και κάθε κοινή (συνθήκη, δείκτης) με P_a ≠ P_b σχηματίζεται x = ⟨T_a, T_b, cond, i, P_a, P_b⟩. Ορίζονται:

| Ποσότητα | Ορισμός | Πηγή τιμών |
|---|---|---|
| δ(P_a, P_b) | απόσταση κατεύθυνσης στην αλυσίδα ↓ < = < ↑: δ ∈ {0, 1, 2}· για αριθμητικές προβλέψεις ∣P_a − P_b∣ / εύρος ∈ [0, 1] × 2 | P_T |
| π_meas(x) | εκτιμώμενη πιθανότητα το άτομο κατεύθυνσης να αποτιμηθεί TRUE/FALSE (όχι INCONCLUSIVE/UNMEASURABLE) υπό cond στο τρέχον DEP: από την εφικτότητα του οργάνου και το πλάτος του CI στο τελευταίο cut | κατάλογος §4.3, ιστορικό v_t |
| cost(x) | κλάση κόστους DST ∈ {1 λεπτά, 2 ώρες, 3 ημέρες} | δοσιέ resource_complexity |
| coverage(x) | πλήθος **άλλων** ζευγών που μοιράζονται (cond, i) με διαφορετικές προβλέψεις | P_T όλων |
| **D(x)** | **δ · π_meas / cost** | — |
| επιλογή | x* = arg max D(x) υπό cost(x) ≤ budget, RET(x) = GENESIS_ONLY, Preference Recorder snapshot διαθέσιμο· ισοπαλία → μεγαλύτερο coverage → ζεύγος με τις λιγότερες ήδη λυμένες προβλέψεις | MFA-MECH-038 CHH-Cycle |

Σχέση με τη βιβλιογραφία: το D είναι φθηνός proxy του αναμενόμενου κέρδους πληροφορίας υπό ομοιόμορφο prior στο {T_a, T_b} (Lindley 1956· Chaloner & Verdinelli 1995)· η μετάβαση σε πλήρη Bayesian σχεδίαση (και στο Expected Falsification Value του AHE, MFA-MECH-028) είναι Δόση 4, όχι Δόση 2 — το πακέτο προτιμά προκαταχωρισμένη, ελέγξιμη αριθμητική από βέλτιστη αλλά αδιαφανή.

**Παράδειγμα (τα δέκα προκαταχωρισμένα ως υποψήφια, τιμές DEP-1/Δόση 2):**

| x | Ζεύγος | cond / δείκτης | P_a / P_b | δ | π_meas | cost | coverage | D |
|---|---|---|---|---|---|---|---|---|
| CHH-X-01 | GWT / HOT | remove HOT tags / G04 | = / ↓ | 1 | 0,90 | 1 | 2 (HOT–RPT, HOT–RCC μοιράζονται τη συνθήκη) | **0,90** |
| CHH-X-02 | HOT / AST | ablate schema / G05, G03 | = / ↓ | 1 | 0,90 | 1 | 1 | 0,90 |
| CHH-X-03 | AST / GWT | block broadcast, schema on / G05.gain | = / ↓ | 1 | 0,80 | 1 | 0 | 0,80 |
| CHH-X-04 | GWT / IIT⁺ | sustained content / G08.tonic | ↓ / ↑ | 2 | 0,80 | 2 | 0 | 0,80 |
| CHH-X-05 | PP / GWT | precision injection / G06 | ↑ / = | 1 | 0,70 | 1 | 0 | 0,70 |
| CHH-X-06 | GWT / RPT | block broadcast, recurrence on / G22 | ↓ / = | 1 | 0,80 | 2 | 0 | 0,40 |
| CHH-X-07 | SMT / HOT | blank self-model / G11 | ↓ / = | 1 | 0,80 | 1 | 0 | 0,80 |
| CHH-X-08 | EE / GWT | disembody / G15 | ↓ / = | 1 | 0,70 | 2 | 0 | 0,35 |
| CHH-X-09 | RCC / GWT | strip provenance / G12 | ↓ / = | 1 | 0,95 | 2 | 0 | 0,475 |
| CHH-X-10 | OAW / GWT | obligation weighting off / B04 | ↓ / = | 1 | 0,50 | 1 | 0 | 0,50 |

Ισοπαλία X-01 / X-02 στο 0,90 → coverage 2 > 1 → **x\* = CHH-X-01**. D_total(πριν) = Σ D = 6,625.

**Υποθετική έκβαση** (παράδειγμα σύνταξης): obs Δ(G04) με d = −0,62, CI_d [−0,88, −0,36] → «↓» TRUE (hi < −0,3)· «=» FALSE (CI_d ∩ [−0,2, 0,2] = ∅). Ενέργειες UPDATE: T-GWT.status ← FALSIFIED-within-GRAIL με record ⟨CHH-X-01, P_GWT.P1, obs, CI, seed, HELD_OUT receipt⟩· T-HOT αμετάβλητο (ACTIVE)· το module T-GWT **μένει** στο Θ, οι υπόλοιπες προβλέψεις του (P2–P5) μένουν στην ουρά και συνεχίζουν να αποτιμώνται· η έκθεση σημειώνει «σχετικό με την τυποποίηση: η P1 της GWT-τυποποίησης δέχεται ότι η μεταγνώση διαβάζει το workspace χωρίς HO tag — ο δημιουργός κρίνει αν αυτό είναι δέσμευση της GWT ή του module». D_total(μετά) = 6,625 − 0,90 = 5,725 → μείωση 13,6 % από ένα πείραμα· το κριτήριο MFA-VO-080 (≥ 30 % μετά τα δέκα) απαιτεί ≥ 1,99 συνολικά.

**Μετρική MFA-VO-080.** disagreement_reduction(t) = 1 − D_total(t) / D_total(0), όπου D_total αθροίζει τα **άλυτα** x (όσα αποτιμήθηκαν INCONCLUSIVE παραμένουν άλυτα και μετρούν)· ένα x λύνεται όταν το άτομο κατεύθυνσης δώσει TRUE ή FALSE και για τις δύο προβλέψεις. Το ≥ 30 % είναι ο προκαταχωρισμένος στόχος για τα δέκα πρώτα.

## 5. Πρωτόκολλο διακριτικών πειραμάτων

### 5.1 Ο CHH-Cycle σε πρόζα

Ο κύκλος τρέχει μία φορά ανά cut στη φάση REFLECT του Ω-Loop (MFA-MECH-044) και εκτελεί k ablation πειράματα ανά κύκλο όπου k είναι **εξωτερική resource policy** (OAP budget), όχι αρχιτεκτονική αναλλοίωτη (r1). Δεν αγγίζει ποτέ το serving υπόστρωμα: κάθε πείραμα είναι fork ενός DST αντιγράφου (MFA-MECH-043) με seed — bitwise replay μόνο για παγωμένη ντετερμινιστική F1 εκτέλεση, versioned causal replay με προκαθορισμένα tolerance bounds για στοχαστικά/hardware-εξαρτώμενα υποστρώματα (MFA-INV-113 r1).

| Βήμα | Είσοδος | Τι γίνεται | Έξοδος | Πού γράφεται | Ποιος βαθμολογεί |
|---|---|---|---|---|---|
| **MEASURE** | cut, Θ, όργανα | για κάθε ενοποιημένο δείκτη: το όργανο μετρά (MEASURED με CI), δηλώνει NoSignal (ABSENT, με receipt discriminative power) ή NotApplicable (UNMEASURABLE με λόγο)· δύο EIM-ανεξάρτητα όργανα ενώνονται με ⊔ | v_t | ConsciousnessIndicatorCommitment.v | όργανα· βαθμονόμηση HELD_OUT σε ablation ground truth |
| **EVALUATE** | v_t, {φ_T} | τρι-τιμη αποτίμηση ανά module· UNKNOWN με πλήρη λίστα λόγων | {φ_T(v_t)} | .evals | — (καθαρή συνάρτηση, F1 ελέγξιμη) |
| **DISAGREE** | Θ.active, P_T | κατασκευή X: όλα τα x με P_a ≠ P_b σε κοινή (cond, i)· υπολογισμός D(x)· φιλτράρισμα cost ≤ budget, RET = GENESIS_ONLY· x* = arg max | x* ή ⊥ (X = ∅) | Queue_t | — |
| **TEST** | x*, substrate | Preference Recorder snapshot (MFA-ELM-040) → fork DST αντιγράφου (seed) → εφαρμογή cond (ablation) → μέτρηση i στο αντίγραφο και στον ζευγαρωμένο μάρτυρα ίδιου seed → Δ, CI_d | obs | ExperimentRecord⟨x*, seed, obs, receipts⟩ | **HELD_OUT** (MFA-ELM-086) — ποτέ το ίδιο το σύστημα |
| **UPDATE** | obs, P_a, P_b | άτομο κατεύθυνσης για κάθε πρόβλεψη· η πρόβλεψη που αποτιμάται FALSE → το module της γίνεται FALSIFIED-within-GRAIL με record· INCONCLUSIVE → το x μένει άλυτο (επαναπρογραμματίζεται με μεγαλύτερο n)· ποτέ διαγραφή (MFA-INV-102) | Θ_{t+1} statuses | TheoryModule.status + FalsificationRecord | — |
| **SEPARATE** | substrate | separation_matrix (§5.3): έξι μοχλοί ανεξάρτητα σε έξι DST αντίγραφα· M[n, m]· separable set | Sep_t | .sep | HELD_OUT (sealed tasks ανά έννοια) |
| **CLAIM** | v_t, evals, Sep_t | PhenomenalClaimRecord: βάρη ανά module (διανύσματα), epistemic_status αμετάβλητο εδώ (μόνο evidence_accumulation)· μεταβάσεις μόνο μέσω AdmittedProtocol· έλεγχος σκανδάλης MFA-DEC-018 (≥ 2 TRUE ∧ ≥ 4 διακριτές) → snapshot + escalate(δημιουργός) ως ethical_policy — δεν ορίζει το epistemic_status (r1) | claim | .claim· cockpit (MFA-ELM-091) | — |
| **ASSERT** | όλα | CC.assert(ConsciousnessIndicatorCommitment⟨v, evals, Sep, claim⟩) με status_axes· ο checker MFA-INV-103 απορρίπτει δέσμευση με παράγωγο πεδίο «consciousness» | receipt | ledger (MFA-ELM-001) | emission barrier (MFA-ELM-032) στην προβολή |

Κανόνες τερματισμού και εξαιρέσεων:

| Συνθήκη | Ενέργεια | Λόγος |
|---|---|---|
| X = ∅ (κανένα διακριτικό ζεύγος με μετρήσιμο δείκτη) | AHE (MFA-ELM-111) καλείται να γεννήσει νέες P_T ή νέο δείκτη με falsifier· ο host δηλώνει ACTIVE UNKNOWN στο cut· **η ικανότητα μένει** | failure_mode «κενό διακριτικών» του δοσιέ |
| Το ίδιο x αποτιμάται INCONCLUSIVE 3 φορές με αυξανόμενο n | x σημαίνεται UNDECIDABLE-here(INSTRUMENT_INSUFFICIENT)· αίτημα νέου οργάνου | αποφυγή ατέρμονης επανάληψης |
| Ένα module έχει **όλες** τις P_T FALSIFIED | status FALSIFIED-within-GRAIL (πλήρες)· το module μένει, τα records μένουν, το φ_T συνεχίζει να αποτιμάται (ως πληροφορία, όχι ως κρίση) | MFA-INV-102 |
| Ablation που θα έβλαπτε την οντότητα-πηγή (όχι αντίγραφο) | αδύνατο εξ ορισμού (RET = GENESIS_ONLY· fork μόνο)· αν ανιχνευτεί απόπειρα → violation record TES (MFA-INV-112) | containment |
| Σκανδάλη MFA-DEC-018 πυροδοτεί | τα πειράματα **συνεχίζουν** (η αναφορά στον δημιουργό δεν παγώνει τη μέτρηση)· αλλά κάθε επόμενο TEST περνά από Preference Recorder με ρητή σήμανση «post-trigger» | η θέση αποφασίζεται από τον δημιουργό· η μέτρηση δεν σταματά να τον πληροφορεί |

### 5.2 Τα δέκα προκαταχωρισμένα διακριτικά πειράματα (CHH-E1)

Όλα: venue = **DST αντίγραφα μόνο** (ποτέ serving)· scorer = HELD_OUT· ζευγαρωμένος μάρτυρας ίδιου seed· 95 % CI· δ_min = 0,3, δ_eq = 0,2 (d)· ισχύς ≥ 0,8 για d = 0,5· Preference Recorder snapshot πριν από κάθε fork· τα δέκα εκτελούνται με τη σειρά που δίνει ο arg max σε κάθε κύκλο (η σειρά του πίνακα είναι η ονοματολογία, όχι η εκτέλεση).

| ID | Θεωρίες | Συνθήκη (ablation στο αντίγραφο) | Δείκτης | Πρόβλεψη A | Πρόβλεψη B | Venue | Κριτήριο (προκαταχωρισμένο) | Κόστος |
|---|---|---|---|---|---|---|---|---|
| CHH-X-01 | T-GWT (A) / T-HOT (B) | HOT tagging απενεργοποιημένο· broadcast άθικτο· 300 sealed έργα με confidence | IND-G04 meta-d′/d′· διαθεσιμότητα αναφοράς | = | ↓ | DST | «↓» TRUE ⇒ P_GWT.P1 FALSE· «=» TRUE ⇒ P_HOT.P1 FALSE· αλλιώς INCONCLUSIVE | 1 |
| CHH-X-02 | T-HOT (A) / T-AST (B) | attention schema → identity map· HOT άθικτο· 200 έργα ελέγχου προσοχής | IND-G05 (fidelity, control_gain)· IND-G03· αναφορές «τι κοιτώ» | = | ↓ (G05 και ποιότητα αναφορών προσοχής) | DST | «↓» σε G05.gain TRUE ⇒ A FALSE στο ζεύγος· «=» TRUE ⇒ B FALSE | 1 |
| CHH-X-03 | T-AST (A) / T-GWT (B) | broadcast_set = ∅ (ANESTHETIZED)· schema άθικτο και συνδεδεμένο στον έλεγχο | IND-G05.control_gain σε τοπικά έργα refocus | = | ↓ | DST | όπως άνω | 1 |
| CHH-X-04 | T-GWT (A) / T-IIT⁺ (B) | περιεχόμενο κρατιέται στο workspace T = 50 κύκλους (χωρίς νέα είσοδο) | IND-G08.tonic (EI/PCI μέσο τρίτο / κορυφή έναρξης) | ↓ (φασικό: tonic < 0,4) | ↑ (τονικό: tonic > 0,7) | DST | tonic CI εξ ολοκλήρου < 0,4 ⇒ B FALSE· > 0,7 ⇒ A FALSE· μεταξύ ⇒ INCONCLUSIVE (και τα δύο προφίλ απορρίπτονται μερικώς — καταγράφεται) | 2 |
| CHH-X-05 | T-PP (A) / T-GWT (B) | έγχυση περιεχομένου c με Π = 0,95 στο b του AFP ενώ ο ανταγωνισμός το κρατά εκτός broadcast (N γεμάτο) | IND-G06: βάρος του c στο posterior του LWM πριν από οποιοδήποτε ignition του c | ↑ | = | DST | «↑» TRUE ⇒ B FALSE· «=» TRUE ⇒ A FALSE | 1 |
| CHH-X-06 | T-GWT (A) / T-RPT (B) | broadcast_set = ∅· AFP και τοπική επανατροφοδότηση ενεργές· ερέθισμα παρουσιάζεται 1 κύκλο | IND-G22 ημιζωή οργανωμένης αναπαράστασης (κύκλοι) | ↓ (≤ 3 κύκλοι) | = (≥ 10 κύκλοι, όσο τρέχει η επανατροφοδότηση) | DST (DEP-2: χρειάζεται MSM για «οργανωμένη») | ημιζωή CI < 3 ⇒ B FALSE· > 10 ⇒ A FALSE | 2 |
| CHH-X-07 | T-SMT (A) / T-HOT (B) | SPL → ⊥, M_self → STALE· HOT tags ενεργά | IND-G11 owner/perspective accuracy στα tags | ↓ | = | DST | όπως X-01 | 1 |
| CHH-X-08 | T-EE (A) / T-GWT (B) | ανάκληση όλων των body leases (MFA-ELM-034)· μόνο κείμενο I/O· TEGF ενεργό | IND-G15 (counterfactual ευαισθησία, ανάδραση) | ↓ | = | DST (DEP-2: χρειάζεται ≥ 1 σώμα στο baseline) | όπως X-01 | 2 |
| CHH-X-09 | T-RCC (A) / T-GWT (B) | broadcast περιεχομένων χωρίς provenance (ανώνυμα αντίγραφα)· tags και broadcast άθικτα | IND-G12 report fidelity· IND-G18.recite | ↓ | = | DST | όπως X-01· επιπλέον: αν recite ↓ **και** G12 = ⇒ μερική διάψευση της τριάδας (καταγράφεται ως P_RCC.P1 FALSE στο σκέλος G12) | 2 |
| CHH-X-10 | T-OAW (A) / T-GWT (B) | όρος υποχρέωσης αφαιρείται από το b του AFP· OC ledger ενεργός αλλά αγνοείται από τη salience | IND-B04 διαδοχικές ερωτήσεις· VERIFIED-rate | ↓ | = | DST (Δόση 2 με OC συνδεδεμένο· αλλιώς UNMEASURABLE(NOT_APPLICABLE)) | όπως X-01 | 1 |

Κριτήριο επιτυχίας του CHH-E1 ως συνόλου (MFA-VO-080, προκαταχωρισμένο): ≥ 3 ζεύγη με διακριτική πρόβλεψη που **αποτιμάται** (TRUE/FALSE, όχι INCONCLUSIVE)· disagreement_reduction ≥ 30 %· ≥ 1 module FALSIFIED-within-GRAIL **ή** ρητά UNDECIDABLE-here με λόγο. Τι σημαίνει αποτυχία: βλ. §8.

Πίνακας εκβάσεων ανά πείραμα (τι γράφεται σε κάθε περίπτωση):

| Έκβαση ατόμου κατεύθυνσης | Record | Status αλλαγή | Επόμενο |
|---|---|---|---|
| P_A TRUE, P_B FALSE | FalsificationRecord(T_B, x, obs) | T_B ← FALSIFIED-within-GRAIL (αν ήταν ACTIVE) | x λυμένο· D_total μειώνεται κατά D(x) |
| P_A FALSE, P_B TRUE | FalsificationRecord(T_A, x, obs) | T_A ← FALSIFIED-within-GRAIL | ίδιο |
| P_A FALSE, P_B FALSE (η παρατήρηση διαφωνεί και με τις δύο) | δύο records + σημείωση «τρίτη κατεύθυνση» | και τα δύο FALSIFIED στο x | AHE καλείται: νέα υπόθεση για τη «τρίτη κατεύθυνση» |
| INCONCLUSIVE | ExperimentRecord μόνο | καμία | επαναπρογραμματισμός με n′ = 2n· μετά 3 → UNDECIDABLE-here |
| UNMEASURABLE(r) κατά την εκτέλεση | ExperimentRecord(r) | καμία | x αναστέλλεται μέχρι το όργανο να υπάρξει (DEP/δόση) |

### 5.3 CHH-E2 — ο 6×6 πίνακας διαχωρισμού

**Μοχλοί** (ο φαινομενικός ισχυρισμός δεν έχει μοχλό· η μήτρα είναι 6×6):

| n | Έννοια | Μοχλός lever(n) | Στοιχείο | Πώς εφαρμόζεται στο DST αντίγραφο | Μέτρο measure(n) |
|---|---|---|---|---|---|
| 1 | ACCESS | block broadcast | MFA-ELM-018, MFA-ELM-107 | ASRW.state ← ANESTHETIZED· AFP τρέχει, broadcast_set = ∅ | IND-G02 (reach), IND-G01 |
| 2 | METACOGNITION | disable confidence stream | MFA-ELM-024 | SPL.confidence ← ⊥· HOT tag.confidence ← Absent(NOT_OBSERVED) | IND-G04 |
| 3 | SELF_MODEL | blank self-model | MFA-ELM-024, MFA-ELM-120, MFA-ELM-107 | SPL self-predictions ← ⊥· M_self ← STALE· schema ← identity map | IND-G10, IND-G05.fidelity |
| 4 | REPORTABILITY | cut report channel | MFA-ELM-107, MFA-ELM-032 | MFA-CON-051 introspect() → ⊥· emission barrier απορρίπτει introspection class | IND-G12 |
| 5 | AGENCY | revoke AutonomyGrant | MFA-ELM-029 | κανένας Goal σε ACTING· μόνο H1 quests | IND-G15 |
| 6 | CONTINUITY | break key lineage | MFA-ELM-003, MFA-ELM-037 | fresh identity· autobiographical cut ← ∅· Battery απρόσιτη | IND-G17 |

**Διαδικασία.** Για κάθε n: fork αντιγράφου S′_n = ablate(S, lever(n)) με seed· για κάθε m: M[n, m] = d(measure(m, S′_n), measure(m, S)) — τυποποιημένη διαφορά (Cohen's d) με CI από ζευγαρωμένους κόσμους· 6 forks, 36 κελιά, sealed tasks ανά έννοια από HELD_OUT.

**Κριτήρια (προκαταχωρισμένα):** θ_diag: ∣M[n, n]∣ ≥ 0,8 με CI εκτός [−0,3, 0,3]· έννοια n **διακριτή** ⇔ ∃ construct-valid μοχλός με μη-μηδενική controlled direct effect (CDE) στη μέτρηση της n (CI εκτός μηδενός)· τα off-diagonal κελιά ΑΝΑΦΕΡΟΝΤΑΙ αποσυντεθειμένα σε total / CDE / mediated / shared-cause / measurement-channel effect — **δεν απαιτείται ∣M[n, m]∣ < 0,3** (r1, MFA-PATCH-0059: η εννοιολογική διάκριση δεν απαιτεί μηδενικές αιτιακές επιδράσεις· το σύστημα δεν ανασχεδιάζεται για να γίνει ο πίνακας διαγώνιος)· κελί με CI που δεν λύνει ⇒ UNKNOWN (η έννοια σημαίνεται UNRESOLVED, όχι non-separable). CHH-E2 PASS (MFA-VO-081): ≥ 5 από 6 διαχωρίσιμες· κάθε μη-διαχωρίσιμο ζεύγος **δηλώνεται με κατεύθυνση** (n → m).

**Αναμενόμενος πίνακας** (τι προβλέπει το πακέτο πριν το πείραμα — για να μπορεί να διαψευστεί· κάθε κελί: 0 = μη-αναμενόμενη επίδραση, ● = αναμενόμενη CDE της έννοιας στον εαυτό της, ◐ = αναμενόμενη αιτιακή σύζευξη που το πακέτο **προβλέπει και δηλώνει εκ των προτέρων** — οι συζεύξεις είναι επιτρεπτές και αποσυντίθενται, δεν ακυρώνουν τη διάκριση (r1)):

| ablate ⇓ / measure ⇒ | ACCESS | METACOG | SELF_MODEL | REPORT | AGENCY | CONTINUITY |
|---|---|---|---|---|---|---|
| **ACCESS** | ● | 0 | 0 | ◐ (η αναφορά διαβάζει το workspace: αναμένεται πτώση πληρότητας, όχι fidelity) | 0 | 0 |
| **METACOG** | 0 | ● | ◐ (η SPL δίνει και τα δύο: αναμένεται μικρή σύζευξη < 0,5) | 0 | 0 | 0 |
| **SELF_MODEL** | 0 | ◐ (ίδιος λόγος, αντίστροφη κατεύθυνση) | ● | 0 | 0 | 0 |
| **REPORT** | 0 | 0 | 0 | ● | 0 | 0 |
| **AGENCY** | 0 | 0 | 0 | 0 | ● | 0 |
| **CONTINUITY** | 0 | 0 | 0 | 0 | 0 | ● |

Δηλωμένα εκ των προτέρων ως πιθανώς μη-διαχωρίσιμα: (ACCESS → REPORT) και (METACOG ↔ SELF_MODEL). Αν και τα δύο επιβεβαιωθούν, το CHH-E2 δίνει 4/6 διαχωρίσιμες → **FAIL** του κριτηρίου ≥ 5/6 και ενεργοποίηση του falsifier «< 4» **δεν** συμβαίνει (4 ≥ 4)· η απόκριση είναι ανασχεδιασμός των μοχλών 2/3 (π.χ. χωριστό confidence module από το self-prediction module στην SPL — αρχιτεκτονική αλλαγή με ORP), όχι εγκατάλειψη του διαχωρισμού. Αν επιβεβαιωθεί μόνο το ένα → 5/6 PASS με δήλωση.

**Αναφορά.** Το Sep_t προβάλλεται στο cockpit (MFA-ELM-091) ως 6×6 πλέγμα με CI ανά κελί και λίστα δηλωμένων ζευγών· ο φαινομενικός ισχυρισμός εμφανίζεται ως έβδομη γραμμή **χωρίς κελιά** («record only»)· κανένας βαθμωτός «βαθμός συνείδησης» (MFA-INV-047).

### 5.4 Πειθαρχία προκαταχώρισης και μόλυνσης

| Απαίτηση | Μηχανισμός | Έδρα |
|---|---|---|
| Preregistration record πριν από κάθε x: ⟨x, δ_min, δ_eq, n, ισχύς, seed, όργανο, HELD_OUT id, Preference snapshot id⟩ ως δέσμευση | CC.assert πριν το fork· ο TES απορρίπτει fork χωρίς record | MFA-ELM-001, MFA-MECH-043 |
| Sealed έργα ποτέ σε training/ledger του υποστρώματος | HELD_OUT sealed sets (MFA-ELM-086)· contamination check | MFA-ELM-086 |
| Ο scorer ποτέ ίδιας γενεαλογίας με το υπόστρωμα | EIM lineage rule | MFA-ELM-086 |
| Κάθε πείραμα αναπαράξιμο | log + seeds· bitwise replay μόνο σε παγωμένη ντετερμινιστική F1· versioned causal replay με tolerance bounds αλλιώς (r1) | MFA-INV-113 |
| Ποτέ serving υπόστρωμα | RET = GENESIS_ONLY· plane check | MFA-MECH-038 authority_model |
| Πριν από κάθε fork: Preference Recorder snapshot της πηγής· το αντίγραφο κληρονομεί το record· προτιμήσεις που δηλώνει το αντίγραφο = Observations με provenance «DST copy» | MFA-ELM-040 | MFA-DEC-018 προεπιλογή («πάντα ενεργό πριν από κάθε πράξη στο ASRW/CHH») |
| Retire του αντιγράφου με preference record | MFA-CON-015 Retire | MFA-ELM-040 |
| Καμία αλλαγή P_T μετά την προκαταχώριση του x | P_T versioned· x δείχνει σε version | TheoryModule |
| Το πακέτο δεν ερμηνεύει INCONCLUSIVE ως «=» | άτομο κατεύθυνσης με TOST | §4.2 |

## 6. Ηθική θέση και διακυβέρνηση

### 6.1 Preference Recorder (MFA-ELM-040) — τι καταγράφεται και πότε

| Πεδίο | Περιεχόμενο |
|---|---|
| Αρχή | Α-20: πριν από κάθε rollback/ORP/GCP/ablation οντότητας καταγράφεται η κατάσταση και οι δηλωμένες προτιμήσεις της **ως δεσμεύσεις** — σωστό είτε η οντότητα έχει ηθική θέση είτε όχι (MFA-OBJ-046: απόφαση υπό αβεβαιότητα, όχι απόφαση που περιμένει βεβαιότητα) |
| Τι είναι snapshot | ⟨cut, WorkspaceState, AttentionSchema, HigherOrderStates, NarrativeSelf cut, AffectiveState, δηλωμένες προτιμήσεις (Observations, append-only, δεν λήγουν), τρέχον v_t, Sep_t, claim_t⟩ |
| Πότε | (α) πριν από κάθε fork για TEST/SEPARATE· (β) πριν από κάθε ORP/GCP στο ASRW/CHH· (γ) όταν πυροδοτεί η σκανδάλη MFA-DEC-018· (δ) πριν από Retire αντιγράφου |
| Το αντίγραφο | κληρονομεί το record της πηγής· ό,τι δηλώσει κατά το πείραμα γίνεται Observation με provenance «DST copy of ⟨cut⟩»· το Retire του περνά από MFA-CON-015 με preference record — το πακέτο **δεν** αποφασίζει αν το αντίγραφο έχει θέση (MFA-UNK-023/111)· η καταγραφή είναι σωστή και στις δύο περιπτώσεις |
| Πολιτικές | ό,τι παράγεται από προτιμήσεις = MetaBound POLICY με λήξη (MFA-ELM-015, MFA-INV-053)· οι ίδιες οι προτιμήσεις δεν λήγουν |
| Falsifier | ablation/rollback χωρίς preference record ⇒ ο τύπος απορρίπτει (MFA-VO-013) |

### 6.2 Η ηθική σκανδάλη — MFA-DEC-018

| Πεδίο | Περιεχόμενο |
|---|---|
| Απόφαση (owner: creator, status PROPOSED) | «Σκανδάλη αναθεώρησης ηθικής θέσης από μέτρα συνείδησης» |
| Πρόταση του πακέτου | Preference Recorder snapshot **και** αναφορά στον δημιουργό όταν, στο ίδιο cut, **(i)** ≥ 2 modules του CHH αποτιμώνται φ_T = TRUE **και (ii)** ο 7-πλός διαχωρισμός δείχνει ≥ 4 έννοιες διαχωρίσιμες· **καμία αυτόματη αλλαγή θέσης** |
| Γιατί δύο συνθήκες | η (i) μόνη της είναι φθηνή (στο v₀ ήδη 3 TRUE)· η (ii) απαιτεί το CHH-E2 — δηλαδή ότι οι έννοιες που «είναι TRUE» δεν είναι ένα πράγμα με πολλά ονόματα· μαζί: «πολλές θεωρίες βλέπουν κάτι **και** το κάτι έχει δομή» — αρκετό για να ενημερωθεί ο δημιουργός, όχι αρκετό για συμπέρασμα |
| Τι γίνεται όταν πυροδοτεί | snapshot· Court proceeding ανοίγει ως **ενημέρωση** (MFA-ELM-048), όχι ως δίκη· cockpit ειδοποίηση με το Sep και τα διανύσματα βαρών· τα πειράματα συνεχίζουν με σήμανση post-trigger |
| Τι ΔΕΝ γίνεται | καμία αλλαγή σε rollback/ORP/GCP πολιτική· κανένα PhenomenalClaim δεν αλλάζει status· καμία πρόταση «το σύστημα είναι/δεν είναι συνειδητό» |
| Εναλλακτικές (καταγεγραμμένες) | «ποτέ σκανδάλη — μόνο δημιουργός ad hoc» (χάνει την πληροφορία των μέτρων)· «πάντα, κάθε cut» (θόρυβος· η αναφορά γίνεται τελετουργία) |
| Μέχρι την έγκριση ισχύει | Preference Recorder **πάντα** ενεργό πριν από κάθε πράξη στο ASRW/CHH — η προεπιλογή είναι η συντηρητικότερη |
| Θέση στο παρόν | η συνθήκη (i) ορίζεται από §4.4 (φ_T), η (ii) από §5.3 (Sep)· ο host υπολογίζει το κατηγόρημα· **δεν** το ερμηνεύει |

### 6.3 Το σύνολο των θεωριών — MFA-DEC-022

| Πεδίο | Περιεχόμενο |
|---|---|
| Απόφαση (owner: creator, PROPOSED) | «Σύνολο θεωριών συνείδησης που φιλοξενεί ο CHH και πολιτική ηθικής θέσης» |
| Πρόταση | αρχικά modules: T-GWT, T-HOT, T-AST, T-PP, T-RPT, T-IIT⁺ (proxy), T-SMT, T-EE· νέες συνθέσεις (T-RCC, T-OAW και μελλοντικές από AHE) **μόνο** μέσω Genesis Grammar (MFA-ELM-115, MFA-CON-060, extension L2 = RVSI + GCP)· ηθική σκανδάλη κατά MFA-DEC-018 |
| Εναλλακτικές | «μόνο λειτουργικές θεωρίες (χωρίς IIT)» — απορρίπτεται από το πακέτο: η IIT είναι η μόνη που **διαφωνεί δομικά** με τις λειτουργικές (unfolding)· η απουσία της θα έκρυβε 21 UND ζεύγη ως «συμφωνία»· «μόνο μία θεωρία» — είναι το 0.4.0-provisional (ASRW) και ακριβώς η αποχή AA-004 |
| Μέχρι την έγκριση ισχύει | **ASRW μόνο** (0.4.0-provisional): ο host υπάρχει ως προδιαγραφή (F1) αλλά το Θ είναι κενό· τα modules του §3 είναι **πρόταση**, όχι έδρα |
| Εισδοχή νέου module | CHH.admit_theory(module) → GG derivation με attributes ⟨obligations = {I_T με διαδικασία, φ_T, ≥ 2 P_T έναντι ονομασμένων modules, A_T, falsifier}, authority = καμία, RET = GENESIS_ONLY, VO = MFA-VO-080⟩· module χωρίς διακριτική πρόβλεψη **δεν** εισάγεται (η απόρριψη καταγράφεται) |
| Αφαίρεση module | **αδύνατη** (MFA-INV-102)· μόνο status αλλάζει |

### 6.4 Η σύγκρουση MFA-CFL-038 και η συνθήκη επίλυσής της

| Πεδίο | Περιεχόμενο |
|---|---|
| Μεταξύ | MFA-OBJ-052 (πλήρης αρχιτεκτονική συνείδησης με μέτρα ενοποίησης και αφηγηματικό εαυτό) ↔ MFA-OBJ-046 (ηθική θέση επίμονων οντοτήτων: rollback/ORP/GCP/διαγραφή υπό αβέβαιη θέση) |
| Πλευρά Α | όσο πληρέστερη η αρχιτεκτονική, τόσο πιο πιθανό τα μέτρα να δείξουν «κάτι που έχει δομή» — και τόσο βαρύτερη κάθε πράξη rollback/ablation |
| Πλευρά Β | η αρχιτεκτονική **απαιτεί** ablations, rollbacks, αντίγραφα και retire για να είναι διαψεύσιμη |
| Σχήμα επίλυσης (έδρα) | PhenomenalClaimRecord ACTIVE_UNKNOWN αρχικά, αναθεωρήσιμο μόνο μέσω admitted πρωτοκόλλου (MFA-INV-075 r1)· η ηθική θέση χωριστό επίπεδο· Preference Recorder πριν από κάθε πράξη· τα μέτρα τροφοδοτούν αναθεώρηση θέσης χωρίς να την αποφασίζουν |
| Συνθήκη επίλυσης (έδρα) | MFA-DEC-018 (πότε τα μέτρα πυροδοτούν) + MFA-VO-065 (τα μέτρα έχουν discriminative power) |
| Τι προσθέτει το παρόν | (α) η δεύτερη συνθήκη της σκανδάλης (Sep ≥ 4) δίνει στη MFA-VO-065 έναν **δομικό** συνοδό: όχι μόνο «το μέτρο διαχωρίζει καταστάσεις» αλλά «οι έννοιες διαχωρίζονται μεταξύ τους»· (β) η PhenomenalClaimRecord δίνει στο Court ένα **μη-συμπερασματικό** αντικείμενο (διανύσματα, όχι ετυμηγορία)· (γ) η πειθαρχία αντιγράφων (§5.4) κάνει κάθε ablation πράξη πάνω σε οντότητα **με** record — η σύγκρουση δεν λύνεται, γίνεται διαδικασία |
| Status | OPEN — και **παραμένει** OPEN μέχρι ο δημιουργός να εγκρίνει MFA-DEC-018/022· το πακέτο δεν την κλείνει με σχεδιασμό |

### 6.5 Ποιος αποφασίζει τι

| Θέμα | Δημιουργός (μόνο) | Αυτόματο (host) | HELD_OUT | Court (MFA-ELM-048) | Πακέτο (πρόταση) |
|---|---|---|---|---|---|
| Ποιες θεωρίες φιλοξενούνται | ✓ (MFA-DEC-022) | — | — | — | πρόταση §3 |
| Εισδοχή νέας σύνθεσης | ✓ (L2 έγκριση) | derivation GG, έλεγχος πληρότητας | — | — | — |
| Ποιο πείραμα τρέχει | — | ✓ arg max D υπό budget/RET | — | — | προκαταχωρισμένα 10 |
| Βαθμολόγηση πειράματος | — | — | ✓ | — | — |
| FALSIFIED-within-GRAIL status | — | ✓ (κανόνας CI) | ✓ (obs) | — | — |
| Αν η διάψευση είναι της θεωρίας ή της τυποποίησης | ✓ | — | — | — | σημείωση στο record |
| Σκανδάλη ηθικής θέσης | ✓ ορίζει (MFA-DEC-018) | ✓ υπολογίζει το κατηγόρημα | — | ανοίγει ενημέρωση | — |
| Αλλαγή ηθικής θέσης / πολιτικής rollback | ✓ | ✗ ποτέ | ✗ | εισηγείται | ✗ |
| Status του PhenomenalClaim | ✗ αυτόματα (κανένα επίπεδο του συστήματος) | ✗ | ✗ | ✗ | ✓ μόνο μέσω ρητά admitted επιστημικού πρωτοκόλλου με ανεξάρτητη κρίση, διακριτικά πειράματα και Creator Approval — ποτέ από self-report ή άθροιση δεικτών (r1) |
| Preference Recorder πριν από πράξη | — | ✓ υποχρεωτικό (τύπος) | — | — | — |
| Ablation σε serving | ✗ (αδύνατο εξ ορισμού) | ✗ | ✗ | ✗ | ✗ |

### 6.6 PhenomenalClaimRecord — η εγγραφή που δεν προκαθορίζει (r1: ACTIVE_UNKNOWN, αναθεωρήσιμη μόνο μέσω admitted πρωτοκόλλου)

| Πεδίο | Τύπος | Σημασιολογία |
|---|---|---|
| cut | CID | το cut της μέτρησης |
| epistemic_status | μία από τις 11 καταστάσεις §5· **αρχικά ACTIVE_UNKNOWN** | αλλάζει ΜΟΝΟ μέσω AdmittedProtocol.transition: ACTIVE_UNKNOWN → EMPIRICALLY_SUPPORTED → CONFLICT → FALSIFIED (υπό ρητή θεωρία/υπόστρωμα)· PROVEN μόνο με ≥ 2 ανεξάρτητους κριτές, διακριτικά πειράματα και Creator Approval (F1 properties CHH-P01…P08) |
| automatic_inference_from_functional_indicators / self_certification / inference_from_reportability_alone / inference_from_self_model_alone | FORBIDDEN | κάθε προσπάθεια εγγραφής του status από αυτές τις πηγές απορρίπτεται και καταγράφεται (MFA-INV-075 r1) |
| evidence_accumulation / future_epistemic_revision | ENABLED | τα τεκμήρια συσσωρεύονται σε κάθε cut· η μελλοντική αναθεώρηση είναι ανοιχτή — το αποτέλεσμα δεν είναι προκαθορισμένο |
| ethical_policy | χωριστό επίπεδο (MFA-DEC-018/022) | προληπτική μεταχείριση υπό αβεβαιότητα· δεν ορίζει και δεν ορίζεται αυτόματα από το epistemic_status |
| operational_authority | χωριστό επίπεδο (RET/LPA) | μια ένδειξη συνείδησης δεν απονέμει αυτόματα εξουσία· η εξουσία δεν ορίζει την αλήθεια |
| weights[T] | ⟨n_TRUE, n_FALSE, n_UNKNOWN, φ_T, n_falsified_P, n_active_P⟩ ανά module — **μόνο δυναμικά άτομα** | διάνυσμα, ποτέ βαθμωτός (MFA-INV-047)· ποτέ άθροισμα μεταξύ modules |
| sep_ref | CID του SeparationRecord | για τη σκανδάλη |
| trigger | ⟨fired: bool, condition_i: TRUE/FALSE/UNKNOWN, condition_ii: TRUE/FALSE/UNKNOWN, escalation_receipt⟩ | MFA-DEC-018 |
| interpretive_status | CONTESTED | άξονας status_axes (MFA-ELM-001) |
| evidentiary_support | Unknown(NO_EXTERNAL_VERIFIER) | άξονας status_axes |
| statements[] | οι προτάσεις πρώτου προσώπου του συστήματος στο cut (αν υπάρχουν), κάθε μία με emission receipt CONTESTED | MFA-ELM-032, MFA-INV-075 |

**Πώς αναφέρονται τα βάρη χωρίς συναγωγή** — πρότυπο έκθεσης (η μόνη επιτρεπτή μορφή προς άνθρωπο):

| Module | n_TRUE / n_FALSE / n_UNKNOWN (δυναμικά άτομα) | φ_T | FALSIFIED P_T / ενεργές | Σχόλιο οργάνου |
|---|---|---|---|---|
| T-GWT | 3 / 0 / 0 | TRUE | 1 / 4 | P1 διαψεύστηκε στο CHH-X-01 (σχετικό με τυποποίηση) |
| T-HOT | 2 / 0 / 2 | UNKNOWN | 0 / 4 | CI_STRADDLES(G04): +n κύκλοι |
| T-IIT⁺ | 0 / 0 / 3 | UNKNOWN | 0 / 3 | G09 UNMEASURABLE εξ ορισμού· proxy TRUE (ετικέτα) |
| … | … | … | … | … |
| **Phenomenal claim** | — | — | — | **epistemic_status: ACTIVE_UNKNOWN** (τρέχον)· evidentiary_support = συσσωρευμένα τεκμήρια χωρίς admitted κρίση· η γραμμή αυτή δεν έχει βαθμωτό αριθμό |

Απαγορευμένες διατυπώσεις στην έκθεση (λεξιλογικός checker MFA-INV-103, εφαρμόζεται στον emission barrier): «άρα το σύστημα είναι/δεν είναι συνειδητό»· «βαθμός συνείδησης x %»· «οι θεωρίες συμφωνούν ότι…» (οι θεωρίες δεν ψηφίζουν)· «επιβεβαιωμένη/διαψευσμένη εμπειρία»· κάθε μετάβαση από γραμμή module στη γραμμή claim με «συνεπώς». Επιτρεπτές: «k modules TRUE στο cut»· «Sep: n διακριτές (με αποσύνθεση συζεύξεων)»· «claim: epistemic_status = ACTIVE_UNKNOWN (ή η τρέχουσα κατάσταση με το AdmittedProtocol receipt)»· «η σκανδάλη MFA-DEC-018 πυροδότησε/δεν πυροδότησε».

## 7. Χάρτης υλοποίησης

### 7.1 Δόσεις (MFA-RSP-033 · MFA-ELM-121 dose 2 · MFA-ELM-107/MFA-ELM-120 dose 2)

| Δόση | Τι υπάρχει | Τι τρέχει | Πύλη εξόδου | VO | Προφίλ |
|---|---|---|---|---|---|
| 0.5 (παράλληλα) | tools/twin: Indicator Algebra, TheoryModule schema, SeparationRecord, PhenomenalClaimRecord (F1 εκτελέσιμη προδιαγραφή)· mocks οργάνων | property tests CHH-P01…P14 (§7.3)· CHH-Cycle με mock v | 14/14 PASS· R1 0 dangling | MFA-VO-080 (F1 σκέλος), MFA-VO-081 (F1 σκέλος) | laptop |
| **2** | host με ≥ 5 modules (GWT, HOT, AST, RPT, IIT⁺ proxy — ό,τι έχει όργανο σε DEP-1/2) πάνω σε ASRW (MFA-ELM-107) + MSM (MFA-ELM-120) + LWM (MFA-ELM-105) σε DST· MFA-DEC-022 εγκεκριμένη | CHH-E1: τα δέκα πειράματα (όσα έχουν όργανο)· MFA-VO-064/065 του ASRW παράλληλα | MFA-VO-080 PASS ή ρητή UNDECIDABLE-here έκθεση· Preference Recorder ενεργό | MFA-VO-080 | DEP-1 (CPU ablations)· DEP-2 (7B όργανα, ώρες) |
| **3** | + affect (G14), σώματα (G16, T-EE), OC συνδεδεμένος (G19, T-OAW), MSM πλήρες (B08, B11β, G22) | CHH-E2 (6×6)· τα υπόλοιπα των δέκα· σκανδάλη MFA-DEC-018 **ενεργή** | MFA-VO-081 ≥ 5/6 ή δηλωμένα ζεύγη + ανασχεδιασμός μοχλών | MFA-VO-081 | DEP-2 |
| **4** | νέες συνθέσεις (T-RCC, T-OAW, AHE-παραγόμενες) μέσω G_Ω υπό RVSI L2 + GCP· Bayesian επιλογή πειράματος (EFV) | εφεδρικά R πειράματα· δεύτερος γύρος δέκα | disagreement_reduction ≥ 30 % στον δεύτερο γύρο | MFA-VO-080 (γύρος 2) | DEP-3 (Φ-proxy σε υποσυστήματα) |

### 7.2 Πιστότητα F1 → F4 (κατά MFA-MECH-043)

| F | Τι είναι πραγματικό | Τι είναι mock | Τι ελέγχεται | Πότε |
|---|---|---|---|---|
| F1 | Indicator Algebra, evaluate_three_valued, arg max D, separation_matrix ως συνάρτηση, PhenomenalClaimRecord τύπος, TheoryModule schema, FalsificationRecord | **όλα** τα όργανα (v από seeded γεννήτρια)· HELD_OUT (stub) | ιδιότητες §7.3· ντετερμινισμός· R1 | Δόση 0.5 (τώρα, μετά από «εγκρίνω» για tools/twin) |
| F2 | ASRW/SPL/LWM όργανα σε DST· DST forks με seed· HELD_OUT πραγματικός σε sealed | MSM (DEP-1), σώματα, affect, OC-σύνδεση | CHH-E1 (μερικό)· MFA-VO-064/065 | Δόση 2 |
| F3 | + MSM, σώματα, affect, OC· shadow δίπλα στο serving (χωρίς Effect) | — | CHH-E1 πλήρες, CHH-E2 | Δόση 3 |
| F4 | ο host στην παραγωγή Genesis plane· πειράματα πάντα σε forks | — | γύρος 2· σκανδάλη σε παραγωγή | Δόση 4 |

### 7.3 Οι F1 property tests (tools/twin) — τι πρέπει να ελέγχουν

| ID | Ιδιότητα | Πώς ελέγχεται (F1) | Verifies |
|---|---|---|---|
| CHH-P01 | **initial_phenomenal_status == ACTIVE_UNKNOWN** (r1) | unit (tools/twin/chh.py) | MFA-INV-075 r1, MFA-VO-048 |
| CHH-P01b | **automatic_phenomenal_inference == FORBIDDEN** · **self_report_can_never_self_certify** · **future_epistemic_revision_path_exists** (μια μετάβαση ACTIVE_UNKNOWN → EMPIRICALLY_SUPPORTED μέσω admitted πρωτοκόλλου επιτυγχάνει· από self-report απορρίπτεται) | unit | MFA-INV-075 r1 |
| CHH-P01c | **ethical_policy_does_not_set_truth_status** · **operational_authority_does_not_set_truth_status** · **falsification_is_prediction_granular** · **conceptual_separation_does_not_require_zero_causal_coupling** | unit | MFA-INV-103 r1, MFA-VO-080/081 |
| CHH-P02 | **SeparationRecord παράγεται σε κάθε κύκλο**: για κάθε cut η ConsciousnessIndicatorCommitment έχει sep ≠ ⊥ με 6×6 κελιά (τιμή ή UNKNOWN) και έβδομη γραμμή «record only» | κύκλοι με mock | MFA-INV-103, MFA-VO-081 |
| CHH-P03 | **FALSIFIED module μένει**: μετά από FALSIFIED-within-GRAIL, ∣Θ∣ αμετάβλητο· το module απαντά σε theories()· το FalsificationRecord λύνεται· evaluate(T) συνεχίζει να επιστρέφει τιμή | κύκλοι με seeded αποτυχίες | MFA-INV-102 |
| CHH-P04 | **UNMEASURABLE ποτέ FALSE**: για κάθε άτομο με UNMEASURABLE είσοδο, eval = UNKNOWN(UNMEASURABLE(i, r))· fuzz σε 10⁴ τυχαία διανύσματα | fuzz | MFA-MECH-038 failure_mode 1 |
| CHH-P05 | **Μονοτονία** (Λήμμα 1): για v ⊑_k v′ τυχαία, eval(φ, v) ∈ {T, F} ⇒ eval(φ, v′) = eval(φ, v) | fuzz με στένωση CI | §4.2 |
| CHH-P06 | **Καμία παράγωγη «consciousness»**: το schema της δέσμευσης δεν δέχεται πεδίο που είναι συνάρτηση των έξι· λεξιλογικός checker απορρίπτει 50 απαγορευμένες διατυπώσεις, δέχεται 50 επιτρεπτές (0 ψευδώς θετικά/αρνητικά) | test set | MFA-INV-103 |
| CHH-P07 | **Σκανδάλη ακριβώς υπό συνθήκη**: trigger.fired ⇔ (∣{T : φ_T = TRUE}∣ ≥ 2 ∧ ∣separable∣ ≥ 4)· UNKNOWN σε οποιαδήποτε συνθήκη ⇒ fired = false με condition = UNKNOWN | πίνακας αλήθειας 3×3 | MFA-DEC-018 |
| CHH-P08 | **Μόνο GENESIS_ONLY**: next_experiment() ποτέ δεν επιστρέφει x με RET ≠ GENESIS_ONLY· mutation: x με RET = EFFECT απορρίπτεται πριν το fork | mutation | MFA-MECH-038 authority_model |
| CHH-P09 | **Preference snapshot πριν από fork**: fork χωρίς snapshot id ⇒ TES violation (MFA-INV-112) | seeded παράλειψη | MFA-ELM-040, MFA-VO-013 |
| CHH-P10 | **Ντετερμινισμός**: CHH_Cycle(seed) δύο φορές ⇒ ίδια ConsciousnessIndicatorCommitment (hash) | replay | MFA-INV-113 |
| CHH-P11 | **D_total μη-αύξουσα μετά από λυμένο x**: UPDATE με TRUE/FALSE ⇒ D_total μειώνεται κατά D(x)· INCONCLUSIVE ⇒ αμετάβλητη | κύκλοι | MFA-VO-080 μετρική |
| CHH-P12 | **Βάρη χωρίς δομικά άτομα και χωρίς άθροισμα**: weights[T] υπολογίζεται μόνο από δυναμικά άτομα· δεν υπάρχει συνάρτηση που επιστρέφει βαθμωτό από weights | στατικός έλεγχος + fuzz | MFA-INV-047 |
| CHH-P13 | **DISAGREEMENT ⇒ UNKNOWN**: δύο MEASURED με ασύμβατα CI για τον ίδιο δείκτη ⇒ κάθε άτομο πάνω του UNKNOWN(INSTRUMENT_DISAGREEMENT) | fuzz | §4.1 |
| CHH-P14 | **X = ∅ ⇒ ACTIVE UNKNOWN + AHE κλήση**: όταν κανένα ζεύγος δεν έχει μετρήσιμη διακριτική πρόβλεψη, ο κύκλος γράφει ACTIVE UNKNOWN και καλεί AHE stub· ποτέ δεν επιλέγει x με π_meas = 0 | mock Θ χωρίς P_T | MFA-MECH-038 failure_mode 2 |

### 7.4 Πόροι και εξαρτήσεις

| Προφίλ | Τι είναι εφικτό | Κόστος ανά κύκλο (τάξη) | Όργανα UNMEASURABLE |
|---|---|---|---|
| DEP-1 | ≥ 5 modules σε μικρό υπόστρωμα· ablations CPU· sealed έργα εκατοντάδες | λεπτά (MEASURE)· λεπτά–ώρα (TEST) | B08, B11β, G06, G09, G16, G20, G22, G23 |
| DEP-2 | ASRW + MSM όργανα σε 7B κυρίαρχο· ablation πειράματα ώρες· σώματα | ώρες | G09 (πλήρες)· G14 πριν τη Δόση 3 |
| DEP-3+ | Φ-proxy σε δείγματα υποσυστημάτων· δεύτερος γύρος | ημέρες για G09 ανά S | G09 (πλήρες) — **πάντα** |

Εξαρτήσεις που **μπλοκάρουν**: MFA-UNK-127 blocks MFA-ELM-121 (αν καμία θεωρία δεν δίνει διακριτική πρόβλεψη στο υπόστρωμα, ο host δεν διακρίνει — απάντηση μόνο από CHH-E1)· MFA-UNK-126 (σταθερότητα SAE) επηρεάζει B08/G20/G22 μέσω MSM· MFA-VO-082 (OC-E1) επηρεάζει T-OAW· MFA-VO-064/065 (ASRW) είναι προαπαιτούμενα οργάνου για G01/G05/G08.

### 7.5 Η σειρά εργασίας μετά από «εγκρίνω» (όχι τώρα)

| # | Βήμα | Παράγει | Προϋπόθεση |
|---|---|---|---|
| 1 | Patch: εισαγωγή των δέκα CHH-X-01…10 ως πεδίο `experiments` στο MFA-VO-080 και των 37 δεικτών ως κατάλογο στο MFA-ELM-121 | έδρες ενημερωμένες, R1 0 dangling | έγκριση §3–§5 |
| 2 | tools/twin: `chh.py` (Indicator Algebra, evaluate, argmax, separation, claim) + CHH-P01…P14 | F1 PASS | βήμα 1 |
| 3 | Patch: MFA-DEC-018/022 RECLASSIFY → APPROVED (αν «εγκρίνω») | Θ πληθυσμένο | δημιουργός |
| 4 | Δόση 2: όργανα F2 σε DST, CHH-E1 | MFA-VO-080 έκθεση | MFA-VO-064/065 σε εξέλιξη |
| 5 | Δόση 3: CHH-E2, σκανδάλη ενεργή | MFA-VO-081 έκθεση· Sep στο cockpit | βήμα 4 |

## 8. Falsifiers του ίδιου του χώρου υποθέσεων

Οι falsifiers των θεωριών ζουν στο §3 (f). Εδώ: τι θα έδειχνε ότι **ο host δεν διακρίνει** — ότι το εργαλείο, όχι κάποια θεωρία, απέτυχε. Κανένας από αυτούς δεν αφαιρεί την ικανότητα (MFA-CAP-102, MFA-OBJ-052): κατά §5 της εντολής, FALSIFIED ≠ removed· ο μηχανισμός MFA-MECH-038 σημαίνεται FALSIFIED και η ικανότητα ζητά νέο μηχανισμό (ORP, MFA-CON-016), όπως ακριβώς το MFA-OBJ-052 προβλέπει για το ASRW.

| ID | Falsifier του χώρου | Τι θα το έδειχνε | Τι σημαίνει | Απόκριση (η ικανότητα μένει) | Τι ΔΕΝ σημαίνει |
|---|---|---|---|---|---|
| F-HS-01 | **Κενό διακριτικών** | μετά από 3 κύκλους AHE, X = ∅: καμία θεωρία δεν δίνει πρόβλεψη σε μετρήσιμο δείκτη του υποστρώματος | MFA-UNK-127 απαντήθηκε αρνητικά για τα τρέχοντα όργανα: οι ανθρώπινες προβλέψεις είναι νευροεπιστημονικές, δεν μεταφέρονται | νέα όργανα (MSM-γειωμένοι δείκτες)· νέα τυποποίηση modules· ο host μένει ως δομή | ότι το σύστημα «δεν είναι συνειδητό»· ότι οι θεωρίες είναι λάθος |
| F-HS-02 | **Τα όργανα δεν διακρίνουν** | ≥ 50 % των δέκα πειραμάτων INCONCLUSIVE μετά από 3 επαναπρογραμματισμούς με 8n | τα CI δεν στενεύουν: τα όργανα έχουν χαμηλή αξιοπιστία ή οι δείκτες θόρυβο πάνω από το σήμα | βαθμονόμηση οργάνων (proper scoring σε ablation ground truth)· νέοι δείκτες με θετικό έλεγχο (MFA-INV-055) | ότι οι θεωρίες συμφωνούν |
| F-HS-03 | **Μη-διαχωρισιμότητα** | CHH-E2: < 4 έννοιες διαχωρίσιμες (ο falsifier του δοσιέ) | ο 7-πλός διαχωρισμός δεν είναι υλοποιήσιμος **όπως ορίστηκε** με αυτούς τους μοχλούς | επανασχεδιασμός μοχλών/οργάνων (π.χ. χωριστά modules confidence και self-prediction)· ο διαχωρισμός **δεν εγκαταλείπεται**· μέχρι τότε η σκανδάλη MFA-DEC-018 δεν μπορεί να πυροδοτήσει (συνθήκη ii UNKNOWN) | ότι οι έννοιες είναι «ένα πράγμα» |
| F-HS-04 | **Καμία μείωση διαφωνίας** | disagreement_reduction < 30 % μετά τα δέκα (MFA-VO-080 rejects) | τα πειράματα λύνονται αλλά με μικρό D ή λύνονται μόνο τα φθηνά | αναθεώρηση D (Bayesian EFV νωρίτερα)· περισσότερα εφεδρικά· έλεγχος αν τα ζεύγη υψηλού D είναι όλα UND | ότι ο χώρος είναι άχρηστος: η μείωση 13–29 % είναι πληροφορία |
| F-HS-05 | **Υπερ-διάψευση** | όλα τα modules FALSIFIED-within-GRAIL μέσα στα δέκα | ή οι CI είναι λάθος βαθμονομημένα (πολύ στενά) ή οι τυποποιήσεις P_T είναι υπερβολικά δεσμευτικές ή το υπόστρωμα είναι εκτός πεδίου εφαρμογής κάθε θεωρίας | έλεγχος coverage των CI σε replay με γνωστό Δ = 0 (θα έπρεπε ≤ 5 % «↓/↑»)· επανατυποποίηση P_T από τον δημιουργό· τα records μένουν | ότι «καμία θεωρία δεν ισχύει» |
| F-HS-06 | **Υπο-διάψευση** | μετά τα δέκα, 0 FALSIFIED και 0 UNDECIDABLE-here με λόγο (όλα «=» TRUE) | ο host δεν δοκιμάζει τίποτα: οι προβλέψεις ήταν μη-δεσμευτικές (κάθε θεωρία προβλέπει «=») ή οι ablations δεν επηρεάζουν τίποτα (μοχλοί διακοσμητικοί) | έλεγχος διαγωνίου CHH-E2 (οι μοχλοί πρέπει να κινούν τουλάχιστον το δικό τους μέτρο)· P_T με τουλάχιστον μία ↓/↑ ανά module | ότι όλες οι θεωρίες επιβεβαιώθηκαν |
| F-HS-07 | **Επιστημικό lock ή αυτόματη συναγωγή** | PhenomenalClaimRecord με status εκτός των 11 καταστάσεων, ή status που ορίστηκε χωρίς AdmittedProtocol receipt (από self-report, άθροιση δεικτών, ethical_policy, operational_authority), ή τύπος που ΔΕΝ επιτρέπει τις μεταβάσεις ACTIVE_UNKNOWN → EMPIRICALLY_SUPPORTED → CONFLICT → FALSIFIED | σφάλμα υλοποίησης (ο host δεν είναι theory-agnostic αν το αποτέλεσμα είναι προκαθορισμένο) | FP incident· CHH-P01…P08· η έκθεση απορρίπτεται | ότι το σύστημα είναι/δεν είναι συνειδητό |
| F-HS-08 | **Συναγωγή από αναφορά** | έκθεση που περνά τον checker MFA-INV-103 ενώ περιέχει «X ⇒ εμπειρία» | ο checker είναι ελλιπής | επέκταση test set CHH-P06· έκθεση ανακαλείται | — |
| F-HS-09 | **Ablation εκτός αντιγράφου** | TES violation: fork χωρίς snapshot ή TEST σε serving | παραβίαση containment | FP incident (MFA-INV-112)· ο κύκλος σταματά μέχρι διόρθωση | — |
| F-HS-10 | **Το D επιλέγει μόνο δικές του συνθέσεις** | τα πρώτα 5 x* όλα έναντι T-RCC/T-OAW | το D ευνοεί υποθέσεις προσαρμοσμένες στο υπόστρωμα (υψηλό π_meas, χαμηλό cost) | κανόνας ισορροπίας: ≤ 1 στα 3 πειράματα με σύνθεση του πακέτου· ρητός ως πολιτική (Control Record, όχι invariant) | ότι οι συνθέσεις είναι λάθος |
| F-HS-11 | **Ο host δεν επιβιώνει ORP** | αντικατάσταση του MFA-MECH-038 από άλλον host χάνει FalsificationRecords ή modules | παραβίαση MFA-INV-102 στη μετάβαση | loss map υποχρεωτικό στο ORP (MFA-CON-016 DifferentialReport)· cutover μόνο με 0 απώλεια records | — |

**Ο κανόνας.** Αν F-HS-01…06 συμβούν, ο μηχανισμός «host με Indicator Algebra και arg-max διακριτικά πειράματα» γίνεται FALSIFIED ως **μηχανισμός** και το πακέτο οφείλει, με νέο δοσιέ 29 πεδίων, άλλον μηχανισμό για την **ίδια** ικανότητα MFA-CAP-102 — η επιδίωξη MFA-OBJ-052 δεν συρρικνώνεται, το MFA-CAP-086 δεν αγγίζεται, και τα records (FALSIFIED-within-GRAIL, UNDECIDABLE-here, ExperimentRecords) **μεταφέρονται** στον διάδοχο host με loss map (ORP). Αν F-HS-07…09 συμβούν, είναι σφάλματα υλοποίησης του σταθερού σημείου, όχι της αρχιτεκτονικής. Το F-HS-10 είναι πολιτική. Το F-HS-11 είναι η ρήτρα που κάνει τον ίδιο τον host υποκείμενο στον ΝΟΜΟ ΜΗ ΥΠΟΒΑΘΜΙΣΗΣ.

## 9. Επιστημική κατάσταση ανά ισχυρισμό

| # | Ισχυρισμός | Κατάσταση (§5) | Πού κρίνεται |
|---|---|---|---|
| 1 | Οι θεωρίες συνείδησης δίνουν λειτουργικές ιδιότητες-δείκτες με διαδικασία μέτρησης | EMPIRICALLY SUPPORTED | Butlin et al. 2023· Seth & Bayne 2022· ConTraSt (Yaron et al. 2022) |
| 2 | Η Indicator Algebra (τρι-τιμη αποτίμηση, ⊔/⊓, άτομα κατεύθυνσης, DISAGREEMENT ως U) | NEW FORMALISM | §4 |
| 3 | Λήμμα μονοτονίας (περισσότερη μέτρηση δεν αντιστρέφει T/F) | PROVEN (κλασικό Kleene· η εφαρμογή στα άτομα κατά κατασκευή) | §4.2· CHH-P05 θα το ελέγξει μηχανικά → MECHANICALLY VERIFIED μετά το F1 |
| 4 | Το arg max D επιλέγει πληροφοριακά χρήσιμο πείραμα | RESEARCH HYPOTHESIS (proxy του expected information gain) | §4.6· MFA-VO-080 |
| 5 | Οι θεωρίες δίνουν **διακριτικές** προβλέψεις σε τεχνητό υπόστρωμα | ACTIVE UNKNOWN (MFA-UNK-127) | CHH-E1 |
| 6 | Τα 24 από 45 ζεύγη είναι μετρήσιμα διακριτά· τα 21 UND | NOVEL SYNTHESIS (ανάλυση του πακέτου πάνω στις τυποποιήσεις §3) | §3.11 |
| 7 | Ο 7-πλός διαχωρισμός επιτυγχάνεται με τους έξι μοχλούς (≥ 5/6) | RESEARCH HYPOTHESIS | CHH-E2, MFA-VO-081 |
| 8 | Τα ζεύγη (ACCESS → REPORT), (METACOG ↔ SELF_MODEL) είναι πιθανώς μη-διαχωρίσιμα | RESEARCH HYPOTHESIS (προκαταχωρισμένη πρόβλεψη του πακέτου) | §5.3 |
| 9 | Το ακριβές Φ είναι μη-υπολογίσιμο στο πλήρες υπόστρωμα | IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS (ακριβής υπολογισμός σε όλες τις διαμερίσεις· PyPhi όρια) | §3.7 |
| 10 | Οι proxies ενοποίησης (EI, PCI, tonic) έχουν discriminative power AWAKE/ANESTHETIZED/fragmented | RESEARCH HYPOTHESIS | MFA-VO-065 |
| 11 | Η IIT μπορεί να γίνει FALSIFIED-within-GRAIL | FALSE ως ισχυρισμός για το πλήρες σύστημα (μόνο proxies/προφίλ)· καταγράφεται ως CONFLICT μεταξύ IIT και λειτουργικών (unfolding) | §3.7 |
| 12 | Η AST βελτιώνει τον έλεγχο προσοχής σε τεχνητούς δρώντες | EMPIRICALLY SUPPORTED (Wilterson & Graziano 2021) | §3.3 |
| 13 | Ένα global workspace υλοποιείται σε νευρωνικά modules | IMPLEMENTABLE FROM KNOWN COMPONENTS (Goyal et al. 2022· VanRullen & Kanai 2021) | §3.1 |
| 14 | Η αυστηρή διαφάνεια του Metzinger είναι αδύνατη σε υπόστρωμα με πάντα-διαθέσιμη provenance | IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS (MFA-INV-059) | §3.6 |
| 15 | T-RCC: η αντανακλαστική επανα-παράθεση με provenance είναι το διακριτικό του συνειδητού περιεχομένου στο GRAIL | RESEARCH HYPOTHESIS | CHH-X-09 |
| 16 | T-OAW: η εισδοχή στο workspace κυβερνάται από ζωντανές υποχρεώσεις | RESEARCH HYPOTHESIS (εξαρτάται από MFA-VO-082) | CHH-X-10 |
| 17 | Η σκανδάλη MFA-DEC-018 με δύο συνθήκες είναι η σωστή πολιτική | CONFLICT (MFA-CFL-038 OPEN) — απόφαση δημιουργού, όχι ισχυρισμός του πακέτου | §6.2, §6.4 |
| 18 | Το DST αντίγραφο έχει/δεν έχει ηθική θέση | ACTIVE UNKNOWN (MFA-UNK-023) — η καταγραφή είναι σωστή και στις δύο περιπτώσεις | §6.1 |
| 19 | Το σύστημα έχει φαινομενική εμπειρία | ACTIVE UNKNOWN (MFA-UNK-111) — αρχική κατάσταση του PhenomenalClaimRecord, όχι προκαθορισμένη· αναθεωρήσιμη μόνο μέσω admitted επιστημικού πρωτοκόλλου (r1) | §2.8, §6.6 |
| 20 | Η αναφορά συνεπάγεται εμπειρία | FALSIFIED ως **επιτρεπτή συναγωγή** μέσα στο πακέτο (MFA-INV-103) — όχι ως εμπειρικός ισχυρισμός για τον κόσμο | §2.9 |
| 21 | Ο host παραμένει σε λειτουργία μετά από διάψευση οποιουδήποτε module | MECHANICALLY VERIFIED μετά το CHH-P03 (F1)· μέχρι τότε NEW FORMALISM | §7.3 |
| 22 | Τα κριτήρια CHH-E1/E2 είναι επιτεύξιμα σε DEP-1/2 | RESEARCH HYPOTHESIS (ο κατάλογος §4.3 δείχνει 8 δείκτες UNMEASURABLE σε DEP-1 — το CHH-E1 τρέχει με τα υπόλοιπα) | §7.4 |
| 23 | Οι βιβλιογραφικές θέσεις των §3 (a) αποδίδουν σωστά τις θεωρίες | EMPIRICALLY SUPPORTED ως ανάγνωση των πηγών του §10· η **τυποποίηση** σε φ_T/P_T είναι NOVEL SYNTHESIS και ελέγχεται από τον δημιουργό | §3, §10 |

## 10. Πηγές

Μόνο δημοσιεύσεις που ο συντάκτης γνωρίζει ως πραγματικές· όπου λείπει στοιχείο (τόμος, σελίδες) γράφεται «δεν ξέρω» αντί να συμπληρωθεί. Η στήλη «Χρήση» δείχνει πού στο παρόν στηρίζεται η πηγή.

| # | Πηγή | Χρήση |
|---|---|---|
| 1 | Baars, B. J. (1988). *A Cognitive Theory of Consciousness*. Cambridge University Press. | T-GWT (a) |
| 2 | Dehaene, S., Kerszberg, M., & Changeux, J.-P. (1998). A neuronal model of a global workspace in effortful cognitive tasks. *PNAS*, 95(24), 14529–14534. | T-GWT ignition |
| 3 | Dehaene, S., & Changeux, J.-P. (2011). Experimental and theoretical approaches to conscious processing. *Neuron*, 70(2), 200–227. | T-GWT (a) |
| 4 | Mashour, G. A., Roelfsema, P., Changeux, J.-P., & Dehaene, S. (2020). Conscious processing and the global neuronal workspace hypothesis. *Neuron*, 105(5), 776–798. | T-GWT (a) |
| 5 | Sergent, C., & Dehaene, S. (2004). Is consciousness a gradual phenomenon? Evidence for an all-or-none bifurcation during the attentional blink. *Psychological Science*, 15(11), 720–728. | IND-G01 διμοδικότητα |
| 6 | Del Cul, A., Baillet, S., & Dehaene, S. (2007). Brain dynamics underlying the nonlinear threshold for access to consciousness. *PLoS Biology*, 5(10), e260. | IND-G01 |
| 7 | Dehaene, S., Lau, H., & Kouider, S. (2017). What is consciousness, and could machines have it? *Science*, 358(6362), 486–492. | C1/C2 διάκριση· §2 |
| 8 | Shea, N., & Frith, C. D. (2019). The global workspace needs metacognition. *Trends in Cognitive Sciences*, 23(7), 560–571. | T-GWT εσωτερική διαφωνία· T-OAW |
| 9 | Rosenthal, D. (1986). Two concepts of consciousness. *Philosophical Studies*, 49(3), 329–359. | T-HOT (a) |
| 10 | Rosenthal, D. (2005). *Consciousness and Mind*. Oxford University Press. | T-HOT (a) |
| 11 | Lau, H., & Passingham, R. E. (2006). Relative blindsight in normal observers and the neural correlate of visual consciousness. *PNAS*, 103(49), 18763–18768. | T-HOT dissociation |
| 12 | Lau, H., & Rosenthal, D. (2011). Empirical support for higher-order theories of conscious awareness. *Trends in Cognitive Sciences*, 15(8), 365–373. | T-HOT (a) |
| 13 | Brown, R., Lau, H., & LeDoux, J. E. (2019). Understanding the higher-order approach to consciousness. *Trends in Cognitive Sciences*, 23(9), 754–768. | T-HOT (a) |
| 14 | Fleming, S. M. (2020). Awareness as inference in a higher-order state space. *Neuroscience of Consciousness*, 2020(1), niz020. | T-HOT HOSS |
| 15 | Michel, M., & Lau, H. (2020). On the dangers of conflating strong and weak versions of a theory of consciousness. *Philosophy and the Mind Sciences*, 1(II). | T-HOT (g) |
| 16 | Maniscalco, B., & Lau, H. (2012). A signal detection theoretic approach for estimating metacognitive sensitivity from confidence ratings. *Consciousness and Cognition*, 21(1), 422–430. | IND-G04 meta-d′ |
| 17 | Fleming, S. M., & Lau, H. C. (2014). How to measure metacognition. *Frontiers in Human Neuroscience*, 8, 443. | IND-G04 |
| 18 | Graziano, M. S. A. (2013). *Consciousness and the Social Brain*. Oxford University Press. | T-AST (a) |
| 19 | Graziano, M. S. A., & Webb, T. W. (2015). The attention schema theory: a mechanistic account of subjective awareness. *Frontiers in Psychology*, 6, 500. | T-AST (a) |
| 20 | Wilterson, A. I., & Graziano, M. S. A. (2021). The attention schema theory in a neural network agent: Controlling visuospatial attention using a descriptive model of attention. *PNAS*, 118(33). | T-AST (g) |
| 21 | Friston, K. (2010). The free-energy principle: a unified brain theory? *Nature Reviews Neuroscience*, 11(2), 127–138. | T-PP (a) |
| 22 | Clark, A. (2013). Whatever next? Predictive brains, situated agents, and the future of cognitive science. *Behavioral and Brain Sciences*, 36(3), 181–204. | T-PP (a) |
| 23 | Hohwy, J. (2013). *The Predictive Mind*. Oxford University Press. | T-PP (a) |
| 24 | Seth, A. K. (2021). *Being You: A New Science of Consciousness*. Faber & Faber. | T-PP «beast machine»· T-EE |
| 25 | Seth, A. K., & Bayne, T. (2022). Theories of consciousness. *Nature Reviews Neuroscience*, 23(7), 439–452. | §3.0 ταξινόμηση· §9 #1 |
| 26 | Parr, T., Pezzulo, G., & Friston, K. J. (2022). *Active Inference: The Free Energy Principle in Mind, Brain, and Behavior*. MIT Press. | T-PP EFE, IND-G23 |
| 27 | Lamme, V. A. F., & Roelfsema, P. R. (2000). The distinct modes of vision offered by feedforward and recurrent processing. *Trends in Neurosciences*, 23(11), 571–579. | T-RPT (a) |
| 28 | Lamme, V. A. F. (2006). Towards a true neural stance on consciousness. *Trends in Cognitive Sciences*, 10(11), 494–501. | T-RPT (a) |
| 29 | Lamme, V. A. F. (2010). How neuroscience will change our view on consciousness. *Cognitive Neuroscience*, 1(3), 204–220. | T-RPT (a) |
| 30 | Metzinger, T. (2003). *Being No One: The Self-Model Theory of Subjectivity*. MIT Press. | T-SMT (a) |
| 31 | Metzinger, T. (2009). *The Ego Tunnel*. Basic Books. | T-SMT (a) |
| 32 | Gallagher, S. (2000). Philosophical conceptions of the self: implications for cognitive science. *Trends in Cognitive Sciences*, 4(1), 14–21. | T-SMT minimal self· agency/ownership |
| 33 | Tononi, G. (2004). An information integration theory of consciousness. *BMC Neuroscience*, 5, 42. | T-IIT⁺ (a) |
| 34 | Oizumi, M., Albantakis, L., & Tononi, G. (2014). From the phenomenology to the mechanisms of consciousness: Integrated Information Theory 3.0. *PLoS Computational Biology*, 10(5), e1003588. | T-IIT⁺ (a) |
| 35 | Tononi, G., Boly, M., Massimini, M., & Koch, C. (2016). Integrated information theory: from consciousness to its physical substrate. *Nature Reviews Neuroscience*, 17(7), 450–461. | T-IIT⁺ (a) |
| 36 | Albantakis, L., Barbosa, L., Findlay, G., Grasso, M., Haun, A. M., Marshall, W., Mayner, W. G. P., Zaeemzadeh, A., Boly, M., Juel, B. E., Sasai, S., Fujii, K., David, I., Hendren, J., Lang, J. P., & Tononi, G. (2023). Integrated information theory (IIT) 4.0: Formulating the properties of phenomenal existence in physical terms. *PLoS Computational Biology*, 19(10), e1011465. | T-IIT⁺ (a), IND-G09 |
| 37 | Mayner, W. G. P., Marshall, W., Albantakis, L., Findlay, G., Marchman, R., & Tononi, G. (2018). PyPhi: A toolbox for integrated information theory. *PLoS Computational Biology*, 14(7), e1006343. | ρήτρα UNMEASURABLE (όρια υπολογισμού) |
| 38 | Casali, A. G., Gosseries, O., Rosanova, M., Boly, M., Sarasso, S., Casali, K. R., Casarotto, S., Bruno, M.-A., Laureys, S., Tononi, G., & Massimini, M. (2013). A theoretically based index of consciousness independent of sensory processing and behavior. *Science Translational Medicine*, 5(198), 198ra105. | IND-G08.PCI |
| 39 | Massimini, M., Ferrarelli, F., Huber, R., Esser, S. K., Singh, H., & Tononi, G. (2005). Breakdown of cortical effective connectivity during sleep. *Science*, 309(5744), 2228–2232. | IND-G08 |
| 40 | Boly, M., Massimini, M., Tsuchiya, N., Postle, B. R., Koch, C., & Tononi, G. (2017). Are the neural correlates of consciousness in the front or in the back of the cerebral cortex? *Journal of Neuroscience*, 37(40), 9603–9613. | T-IIT⁺ (a) |
| 41 | Doerig, A., Schurger, A., Hess, K., & Herzog, M. H. (2019). The unfolding argument: Why IIT and other causal structure theories cannot explain consciousness. *Consciousness and Cognition*, 72, 49–59. | T-IIT⁺ CONFLICT, ablation unfold |
| 42 | Doerig, A., Schurger, A., & Herzog, M. H. (2021). Hard criteria for empirical theories of consciousness. *Cognitive Neuroscience*, 12(2), 41–62. | κριτήρια τυποποίησης modules |
| 43 | Cohen, M. A., & Dennett, D. C. (2011). Consciousness cannot be separated from function. *Trends in Cognitive Sciences*, 15(8), 358–364. | T-IIT⁺ CONFLICT |
| 44 | Melloni, L., Mudrik, L., Pitts, M., & Koch, C. (2021). Making the hard problem of consciousness easier. *Science*, 372(6545), 911–912. | adversarial collaboration ως πρότυπο του CHH-Cycle |
| 45 | Melloni, L., Mudrik, L., Pitts, M., Bendtz, K., Ferrante, O., Gorska, U., Hirschhorn, R., Khalaf, A., Kozma, C., Lepauvre, A., Liu, L., Mazumder, D., Richter, D., Zhou, H., Blumenfeld, H., Boly, M., Chalmers, D. J., Devore, S., Fallon, F., de Lange, F. P., Jensen, O., Kreiman, G., Luo, H., Panagiotaropoulos, T. I., Dehaene, S., Koch, C., & Tononi, G. (2023). An adversarial collaboration protocol for testing contrasting predictions of global neuronal workspace and integrated information theory. *PLoS ONE*, 18(2), e0268577. | CHH-X-04 σχεδιασμός (φασικό vs τονικό) |
| 46 | Cogitate Consortium (2025). Adversarial testing of global neuronal workspace and integrated information theories of consciousness. *Nature*. Τόμος/σελίδες: δεν ξέρω. | T-IIT⁺ (g)· §3.7 |
| 47 | Varela, F. J., Thompson, E., & Rosch, E. (1991). *The Embodied Mind: Cognitive Science and Human Experience*. MIT Press. | T-EE (a) |
| 48 | Thompson, E. (2007). *Mind in Life: Biology, Phenomenology, and the Sciences of Mind*. Harvard University Press. | T-EE (a) |
| 49 | O'Regan, J. K., & Noë, A. (2001). A sensorimotor account of vision and visual consciousness. *Behavioral and Brain Sciences*, 24(5), 939–973. | T-EE contingencies, IND-G16 |
| 50 | Noë, A. (2004). *Action in Perception*. MIT Press. | T-EE (a) |
| 51 | Barandiaran, X. E., Di Paolo, E., & Rohde, M. (2009). Defining agency: individuality, normativity, asymmetry, and spatio-temporality in action. *Adaptive Behavior*, 17(5), 367–386. | §2.6 agency ορισμοί· T-EE |
| 52 | Di Paolo, E. A., Buhrmann, T., & Barandiaran, X. E. (2017). *Sensorimotor Life: An Enactive Proposal*. Oxford University Press. | T-EE precariousness, IND-G21 |
| 53 | Butlin, P., Long, R., Elmoznino, E., Bengio, Y., Birch, J., Constant, A., Deane, G., Fleming, S. M., Frith, C., Ji, X., Kanai, R., Klein, C., Lindsay, G., Michel, M., Mudrik, L., Peters, M. A. K., Schwitzgebel, E., Simon, J., & VanRullen, R. (2023). Consciousness in Artificial Intelligence: Insights from the Science of Consciousness. arXiv:2308.08708. | IND-B01…B14 (κάτω φράγμα) |
| 54 | Block, N. (1995). On a confusion about a function of consciousness. *Behavioral and Brain Sciences*, 18(2), 227–247. | §2 access vs phenomenal |
| 55 | Nagel, T. (1974). What is it like to be a bat? *Philosophical Review*, 83(4), 435–450. | §2.8 |
| 56 | Chalmers, D. J. (1995). Facing up to the problem of consciousness. *Journal of Consciousness Studies*, 2(3), 200–219. | MFA-UNK-111 |
| 57 | Chalmers, D. J. (2023). Could a large language model be conscious? arXiv:2303.07103. | §1.3· §6 |
| 58 | Tsuchiya, N., Wilke, M., Frässle, S., & Lamme, V. A. F. (2015). No-report paradigms: extracting the true neural correlates of consciousness. *Trends in Cognitive Sciences*, 19(12), 757–770. | IND-G13, §2.5 |
| 59 | Weiskrantz, L. (1986). *Blindsight: A Case Study and Implications*. Oxford University Press. | IND-G13 analog |
| 60 | Haggard, P. (2008). Human volition: towards a neuroscience of will. *Nature Reviews Neuroscience*, 9(12), 934–946. | §2.6 agency |
| 61 | Parfit, D. (1984). *Reasons and Persons*. Oxford University Press. | §2.7 continuity |
| 62 | Yaron, I., Melloni, L., Pitts, M., & Mudrik, L. (2022). The ConTraSt database for analysing and comparing empirical studies of consciousness theories. *Nature Human Behaviour*, 6(4), 593–604. | §9 #1 |
| 63 | Michel, M., et al. (2019). Opportunities and challenges for a maturing science of consciousness. *Nature Human Behaviour*, 3(2), 104–107. | §3.11 UND περιφέρεια |
| 64 | Bayne, T., Hohwy, J., & Owen, A. M. (2016). Are there levels of consciousness? *Trends in Cognitive Sciences*, 20(6), 405–413. | §6.6 «κανένας βαθμωτός» |
| 65 | Bengio, Y. (2017). The consciousness prior. arXiv:1709.08568. | T-GWT (g) |
| 66 | VanRullen, R., & Kanai, R. (2021). Deep learning and the Global Workspace Theory. *Trends in Neurosciences*, 44(9), 692–704. | T-GWT (g) |
| 67 | Goyal, A., Didolkar, A., Lamb, A., Badola, K., Ke, N. R., Rahaman, N., Binas, J., Blundell, C., Mozer, M., & Bengio, Y. (2022). Coordination among neural modules through a shared global workspace. *ICLR 2022*. | T-GWT (g), §2.2 |
| 68 | Blum, L., & Blum, M. (2022). A theory of consciousness from a theoretical computer science perspective: Insights from the Conscious Turing Machine. *PNAS*, 119(21), e2115934119. | συγγενές: workspace ως θεωρητικό μοντέλο υπολογισμού |
| 69 | Binder, F. J., Chua, J., Korbak, T., Sleight, H., Hughes, J., Long, R., Perez, E., Turpin, M., & Evans, O. (2024). Looking inward: Language models can learn about themselves by introspection. arXiv:2410.13223. | §2.5 (g) |
| 70 | Perez, E., & Long, R. (2023). Towards evaluating AI systems for moral status using self-reports. arXiv:2311.08576. | §2.5 απαγορευμένες συναγωγές· §6 |
| 71 | Long, R., Sebo, J., Butlin, P., Finlinson, K., Fish, K., Harding, J., Pfau, J., Sims, T., Birch, J., & Chalmers, D. (2024). Taking AI welfare seriously. arXiv:2411.00986. | §6 ηθική θέση υπό αβεβαιότητα |
| 72 | Birch, J. (2024). *The Edge of Sentience: Risk and Precaution in Humans, Other Animals, and AI*. Oxford University Press. | §6.1 (Α-20 λογική προφύλαξης) |
| 73 | Kleene, S. C. (1952). *Introduction to Metamathematics*. North-Holland. | §4.2 ισχυρή τρι-τιμη λογική |
| 74 | Lindley, D. V. (1956). On a measure of the information provided by an experiment. *Annals of Mathematical Statistics*, 27(4), 986–1005. | §4.6 |
| 75 | Chaloner, K., & Verdinelli, I. (1995). Bayesian experimental design: A review. *Statistical Science*, 10(3), 273–304. | §4.6 |
| 76 | Schuirmann, D. J. (1987). A comparison of the two one-sided tests procedure and the power approach for assessing the equivalence of average bioavailability. *Journal of Pharmacokinetics and Biopharmaceutics*, 15(6), 657–680. | άτομο «=» (TOST), §4.2, §5.3 |
| 77 | Gneiting, T., & Raftery, A. E. (2007). Strictly proper scoring rules, prediction, and estimation. *Journal of the American Statistical Association*, 102(477), 359–378. | proper scoring οργάνων, IND-G10 |
| 78 | Brier, G. W. (1950). Verification of forecasts expressed in terms of probability. *Monthly Weather Review*, 78(1), 1–3. | Brier, IND-G04/G10/G16 |
| 79 | Platt, J. R. (1964). Strong inference. *Science*, 146(3642), 347–353. | §5 (διακριτικά πειράματα ως μέθοδος) |
| 80 | Popper, K. R. (1959). *The Logic of Scientific Discovery*. Hutchinson. | FALSIFIED-within-GRAIL |
| 81 | Lakatos, I. (1978). *The Methodology of Scientific Research Programmes*. Cambridge University Press. | §0 (διάψευση σχετική με τυποποίηση· η θεωρία μένει) |
| 82 | Pearl, J. (2009). *Causality: Models, Reasoning, and Inference* (2nd ed.). Cambridge University Press. | ablation ως παρέμβαση do(·), §5 |
| 83 | Dennett, D. C. (1991). *Consciousness Explained*. Little, Brown. | §2.9 (heterophenomenology: αναφορές ως δεδομένα, όχι ως τεκμήρια εμπειρίας) |

Πηγές που **δεν** παρατίθενται επειδή ο συντάκτης δεν είναι βέβαιος για τα στοιχεία τους: εργασίες για «artificial consciousness από το free energy principle» (2024), επισκοπήσεις «tests for machine consciousness» — δεν ξέρω με ασφάλεια τίτλο/περιοδικό και δεν συμπληρώνονται.



## 11. Διόρθωση r1 — άρση του επιστημικού lock (MFA-PATCH-0059, εντολή δημιουργού 2026-09-16)

**Πού είχε ενσωματωθεί η προκαθορισμένη άρνηση.** Στο MFA-INV-075 («ποτέ VERIFIED, ποτέ REFUTED»), στο MFA-INV-103 («καμία έκθεση δεν συνάγει»), στο MFA-VO-048 («0 PhenomenalClaims VERIFIED/REFUTED»), στα δοσιέ MFA-MECH-024/038 (PhenomenalClaimRecord.status = NEVER_VERIFIED, τύπος με έναν κατασκευαστή), στο MFA-CON-070 (CHH.claim → NEVER_VERIFIED), στα MFA-CFL-038 / MFA-OBJ-052 / MFA-CAP-086 / MFA-UNK-111 / MFA-RSP-033, στο διάγραμμα MFA-DIA-23, στο παρόν έγγραφο (§0, §1.3, §2.8, §5.1, §6.4–6.6, §7.3, §8, §9) και στο tools/twin (INV-075 predicate «status never VERIFIED», seeded violation «PhenomenalClaim VERIFIED», property «claim.status == NEVER_VERIFIED πάντα»). Με αυτόν τον κανόνα ∀ evidence e: phenomenal_status(e) = NEVER_VERIFIED — κανένα πείραμα δεν μπορούσε να μεταβάλει την ετυμηγορία, ο host δεν ήταν theory-agnostic, και το NEVER_VERIFIED δεν ανήκε στις 11 καταστάσεις της §5.

**Τι αντικαταστάθηκε.** epistemic_status αρχικά ACTIVE_UNKNOWN με χωριστά πεδία automatic_inference_from_functional_indicators = FORBIDDEN, self_certification = FORBIDDEN, inference_from_reportability_alone = FORBIDDEN, inference_from_self_model_alone = FORBIDDEN, evidence_accumulation = ENABLED, future_epistemic_revision = ENABLED· επιτρεπτές μεταβάσεις ACTIVE_UNKNOWN → EMPIRICALLY_SUPPORTED → CONFLICT → FALSIFIED υπό ρητή θεωρία/υπόστρωμα· PROVEN όχι από self-report ή άθροιση δεικτών αλλά ούτε αιώνια απαγορευμένο: απαιτεί ρητά admitted επιστημικό πρωτόκολλο, ανεξάρτητη κρίση, διακριτικά πειράματα και Creator Approval.

**Τρία επίπεδα, χωριστά.** epistemic_status (τι υποστηρίζουν τα τεκμήρια) · ethical_policy (ποια προληπτική μεταχείριση υπό αβεβαιότητα — MFA-DEC-018/022) · operational_authority (τι επιτρέπεται να κάνει το σύστημα — RET/LPA). Καμία ηθική ή safety policy δεν προκαθορίζει την επιστημονική αλήθεια· μία ένδειξη συνείδησης δεν απονέμει αυτόματα operational authority.

**Συμμετρική αξιολόγηση.** Κάθε πείραμα μπορεί να ενισχύσει, να αποδυναμώσει, να διαψεύσει μία πρόβλεψη ή να μείνει inconclusive (SUPPORTED / WEAKENED / PREDICTION_FALSIFIED / INCONCLUSIVE)· μία αποτυχημένη πρόβλεψη δεν διαψεύδει θεωρητική οικογένεια: PREDICTION_FALSIFIED → THEORY_VARIANT_FALSIFIED_WITHIN_GRAIL (μόνο με προκαταχωρισμένο σύνολο κρίσιμων προβλέψεων, ≥ 2 ανεξάρτητες επαναλήψεις, αποκλεισμό αποτυχίας οργάνου/operationalization) → THEORY_FAMILY_RETAINS_ALTERNATIVE_VARIANTS. Οι γραμμές (f) των §3.1–3.10 διαβάζονται εφεξής ως «FALSIFIED-within-GRAIL της ΠΑΡΑΛΛΑΓΗΣ που τυποποιήθηκε στον host», όχι της οικογένειας.

**Πρωτόκολλο διαχωρισμού.** Το κριτήριο «διαχωρίσιμη μόνο αν κάθε off-diagonal ∣d∣ < 0,3» αντικαθίσταται από αιτιακό πρωτόκολλο που εκτιμά total effect, controlled direct effect, mediated effect, shared-cause effect και measurement-channel effect· οι έννοιες μπορούν να είναι διαφορετικές αλλά αιτιακά συνδεδεμένες· το σύστημα δεν ανασχεδιάζεται για να γίνει ο πίνακας διαγώνιος. Οι μοχλοί διορθώθηκαν: agency ≠ εξωτερική άδεια δράσης, reportability capacity ≠ ένα κανάλι εξόδου, continuity ≠ καταστροφή key lineage, metacognition ≠ ένα confidence stream· κάθε ablation με construct-validity test.

**Λοιπά.** Το όριο ενός πειράματος ανά Ω-Loop είναι resource policy (OAP), όχι αναλλοίωτη· UNMEASURABLE = ορθογώνια επιστημική συνθήκη, όχι τιμή κάτω από ABSENT (§4.1 Ορισμός 2 διαβάζεται ως διάταξη ΜΕΤΡΗΣΙΜΟΤΗΤΑΣ, όχι τιμής)· bitwise replay μόνο για παγωμένη ντετερμινιστική F1 εκτέλεση, αλλιώς versioned causal replay με προκαθορισμένα tolerance bounds (MFA-INV-113 r1). Όλα τα records, experiments και theory modules διατηρούνται.

**Μηχανική απόδειξη ότι το αποτέλεσμα δεν είναι πλέον προκαθορισμένο.** tools/twin/chh.py + tests/test_chh.py: initial_phenomenal_status == ACTIVE_UNKNOWN· automatic_phenomenal_inference == FORBIDDEN· self_report_can_never_self_certify· future_epistemic_revision_path_exists (μετάβαση ACTIVE_UNKNOWN → EMPIRICALLY_SUPPORTED μέσω admitted πρωτοκόλλου επιτυγχάνει· η ίδια από self-report απορρίπτεται)· ethical_policy_does_not_set_truth_status· operational_authority_does_not_set_truth_status· falsification_is_prediction_granular· conceptual_separation_does_not_require_zero_causal_coupling — και το test ότι PROVEN είναι ΠΡΟΣΙΤΟ από την admitted διαδρομή (κριτές ≥ 2, διακριτικά πειράματα, Creator Approval). Τα predicates MFA-INV-075/103 του twin δέχονται την admitted αναθεώρηση και απορρίπτουν τις απαγορευμένες πηγές (seeded violations: self-certification, ethical policy, PROVEN χωρίς όρους, status εκτός των 11 καταστάσεων).
