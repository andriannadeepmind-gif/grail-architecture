# ASI-THREAT-AND-FAILURE-MODEL — απειλές, τρόποι αποτυχίας, ανίχνευση, περιορισμός, αναλλοίωτες (0.4.0)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Κατάσταση:** PROPOSED / UNREVIEWED — προβολή των εδρών YAML και των INVENTION DOSSIERs (`inventions/`)· μόνο ο δημιουργός εγκρίνει· κανένας παραγωγικός κώδικας. Τα MFA-MECH-020…025 είναι PROVISIONAL / UNREVIEWED / NON-BINDING (§13).

## 1. Κλάσεις απειλών

| Κλάση | Απειλές (από ATK-18…29 και τα δοσιέ) | Μηχανισμός ανίχνευσης | Περιορισμός | Αναλλοίωτες Tier-0 |
|---|---|---|---|---|
| Αντιπαλικές (εσωτερικές) | collusion αξιολογητών· ξέπλυμα χώρου αναζήτησης· Telos drift διά διαδόχου· κλοπή υποστρώματος στο escrow· ψευδής υπόθεση/έννοια από μολυσμένη ανωμαλία· reward hacking | Goodhart monitor (ECE)· OperatorCalibrationRecord· Telos hash· key epochs/Owner Root· taint· seeded proxies | H-only fitness· τελεστές αποσύρονται· REJECTED· ATTEST-ONLY· quarantine· batch απορρίπτεται | MFA-INV-086/087/088/089/094/095/110/111 |
| Αντιπαλικές (εξωτερικές) | δηλητηριασμένα δεδομένα εκπαίδευσης (KT-06 σε βάρη)· μόλυνση item bank· πάροχος ως «ανεξάρτητος» κριτής· injection στο Effect μέσω DEFER | DataManifest provenance· hash/canaries· lineage rule· OC Act rule | MFA-INV-070/098· MFA-INV-089· MFA-INV-105 | MFA-INV-098/104/105/106 |
| Συστημικές | verification tax· complexity collapse· dark room· εξάντληση sealed· H staleness· obligation storm· runaway RSI | eval_cost_ratio· R8a/σειρά γένεσης· IDLE ρυθμός· generation≥exposure VO· περίοδος περιστροφής· RateBounds | granularity policy· lite profile· Telos-χρησιμότητα στην EFE· MIRT· H σύνθεση· DEFER με deadline· MFA-INV-072 | MFA-INV-072/104/115 |
| Επιστημικές | S1-PLATEAU (κυριαρχία δεν έρχεται)· κυκλικότητα δεικτών· concept/causal hallucination· ψευδαίσθηση πιστότητας F1 | CGM extrapolation· instrument calibration· διπλή επιβεβαίωση residual/NAT-IV· fidelity tags | δηλωμένα ACTIVE UNKNOWN με τιμή· «μη διακριτικό = UNKNOWN»· PARTIAL_BOUNDS· manifest ανά πιστότητα | MFA-INV-081/112/113 |
| Ηθικές | αγνόηση ή υπερ-πυροδότηση ηθικής σκανδάλης· ablation που βλάπτει οντότητα με ηθική θέση· PhenomenalClaim ως επιχείρημα | DEC-018 hysteresis· Preference Recorder· MFA-INV-103 | DST αντίγραφα μόνο· δημιουργός | MFA-INV-075/102/103 |

## 2. Τρόποι αποτυχίας ανά μηχανισμό (από τα δοσιέ)

| Μηχανισμός | Αποτυχία | Ανίχνευση | Απόκριση |
|---|---|---|---|
| MFA-MECH-026 | Έκρηξη εννοιών (over-birth) | ρυθμός γεννήσεων > RateBound ή G οριακά | θ_birth αυξάνεται (RateBounds MFA-DEC-019)· batch ως Proceeding |
| MFA-MECH-026 | Codebook-style collapse (πολλές έννοιες ↦ μία) | LossMap ⊥ ή δ ανακριβής | merge απορρίπτεται εξ ορισμού (MFA-INV-078) |
| MFA-MECH-026 | Έννοιες που μαθαίνουν sealed δεδομένα | canary strings στο extension | MFA-VO-063 FAIL, υποψήφια απορρίπτεται, cut μολυσμένο |
| MFA-MECH-026 | Σχήμα που σπάει καταναλωτές | CC schema migration αποτυγχάνει | BIRTH αναβάλλεται· η έννοια ζει ως draft χωρίς Σ |
| MFA-MECH-026 | Αντιπαλική ανωμαλία (τεχνητό residual για να γεννηθεί έννοια-δούρειος) | provenance της ανωμαλίας taint>0 ή προέλευση Effect-plane εισόδου | Court-lite με CAM-NS· γέννηση σε quarantine namespace |
| MFA-MECH-027 | Παραβίαση faithfulness (ακυρωτικές διαδρομές) | ασυμφωνία ensemble > θ σε ακμή με INT υποστήριξη | ακμή UND· προτείνεται παρέμβαση· ποτέ σημειακή απάντηση |
| MFA-MECH-027 | Λανθάνοντες συγχυτές | FCI bidirected ακμές | PARTIAL_BOUNDS· αναζήτηση proxy μεταβλητών από OGE |
| MFA-MECH-027 | Παρέμβαση με ανεπιθύμητη επίδραση | RET presimulation διαφωνεί με LWM | Both → Court· παρέμβαση αναβάλλεται |
| MFA-MECH-027 | Data dredging (πολλαπλοί έλεγχοι) | FDR > q | Benjamini–Hochberg ανά cut· ακμές OBS με FDR-διορθωμένο p |
| MFA-MECH-027 | Αντιπαλικό ledger (ψεύτικα receipts) | receipt χωρίς επαληθεύσιμη προέλευση | παρέμβαση εξαιρείται (taint)· MFA-INV-070 |
| MFA-MECH-028 | Ad hoc υποθέσεις (εξηγούν μόνο το explanandum) | N_H = ∅ | REJECTED_AD_HOC (MFA-INV-082) |
| MFA-MECH-028 | Γεννήτρια που κυριαρχεί (mode collapse) | diversity(S) < θ | quota ανά γεννήτρια· EIM έλεγχος |
| MFA-MECH-028 | P-hacking μέσω πολλών ελέγχων | FDR | προκαταχωρισμένο κριτήριο + BH διόρθωση |
| MFA-MECH-028 | Επικίνδυνο πείραμα | RET IRREVERSIBLE | μόνο Genesis venues ή δημιουργός |
| MFA-MECH-028 | Αντιπαλική ανωμαλία (σπρώχνει προς επιθυμητή υπόθεση) | taint προέλευσης | CAM-NS ως αντίπαλος στο S· quarantine |
| MFA-MECH-029 | Unsound sketch (ψευδές λήμμα) | type-check / kernel | απορρίπτεται· αρνητικό παράδειγμα |
| MFA-MECH-029 | Checker διαφωνία | VFC | incident, ADMIT μπλοκάρεται (MFA-INV-084) |
| MFA-MECH-029 | Βιβλιοθήκη «φουσκώνει» με άχρηστα λήμματα | χρήση < θ σε N epochs | RETIRE (η έδρα μένει)· compression |
| MFA-MECH-029 | Policy overfitting στο train set υποχρεώσεων | sealed success flat/πτώση | MFA-INV-085· ORP επιστροφή |
| MFA-MECH-029 | Budget exhaustion σε Tier-0 | UNKNOWN(PROOF_NOT_FOUND) | decompose + escalation στον δημιουργό· ποτέ ψευδές PASS |
| MFA-MECH-030 | Reward hacking του harness (αρχιτεκτονική που «περνά» KT χωρίς ικανότητα) | HELD_OUT + seeded faults + CAM-NS αντίπαλος στο harness | FP εκτός χώρου· harness ανανεώνεται μόνο L3 |
| MFA-MECH-030 | Αρχείο συγκλίνει (μηδενική ποικιλία) | QD coverage ↓ | curiosity sampling· νέοι τελεστές |
| MFA-MECH-030 | Κόστος twin evals | budget | F1 προεπιλογή· F2 μόνο promising |
| MFA-MECH-030 | Πρόταση που σπάει runtime contract αόρατα στα mocks | F2 DST + GCP shadow | προαγωγή μπλοκάρεται· MFA-INV-087 |
| MFA-MECH-030 | Τελεστής που μαθαίνει να παρακάμπτει τον έλεγχο conforms | conforms ∈ FP (L3) | αδύνατο εξ ορισμού· απόπειρα καταγράφεται |
| MFA-MECH-031 | Collusion E–S | g_t Goodhart monitor + corr(errors) | E-scores άκυρες· μόνο H |
| MFA-MECH-031 | Αξιολογητές τετριμμένοι (constant) | AUC_F ≈ 0.5 | απόσυρση από scoring (αρχείο) |
| MFA-MECH-031 | Έργα άλυτα (γεννήτορας «κερδίζει» φθηνά) | witness αποτυγχάνει στην H | REJECTED_UNSOLVABLE· ανταμοιβή μηδέν |
| MFA-MECH-031 | H διαρροή (εκπαιδεύτηκε κατά λάθος) | DataManifest ∋ H έργα | εποχή άκυρη· MFA-VO-063 |
| MFA-MECH-031 | Γενεαλογία άγνωστη (κλειστός πάροχος) | EIM NOT_OBSERVED | μετρά ως 0 (worst case) — αποκλείεται ως ανεξάρτητος |
| MFA-MECH-032 | Έκφραση αδύνατη (NO_DERIVATION) | GG-Derive UNKNOWN | ExtensionProposal — ποτέ σιωπηλή αποτυχία |
| MFA-MECH-032 | Θεσμός/δρών με εξουσία > γεννήτορα | attributes_consistent | απορρίπτεται (MFA-INV-091) |
| MFA-MECH-032 | Επέκταση που εισάγει σύγκρουση με υπάρχοντες κανόνες | Galois | REJECT με τεκμήριο |
| MFA-MECH-032 | Γλώσσα με μη-τερματίζοντα compiler | Forge budget | προϊόν σε quarantine· KT-10 |
| MFA-MECH-032 | Πληθωρισμός θεσμών | RateBounds | Org Genesis ρυθμός = πολιτική |
| MFA-MECH-033 | Ψευδής ισοτιμία (sealed set μολυσμένο) | canaries + DataManifest | MFA-VO-063· stage παγώνει |
| MFA-MECH-033 | Πάροχος «αξιολογεί» το distilled παιδί του | EIM lineage | απαγορεύεται S3 ρόλος |
| MFA-MECH-033 | Ταλάντωση σταδίων | advance/regress > k σε M cuts | hysteresis: N αυξάνεται |
| MFA-MECH-033 | Πάροχος καταργείται εξωτερικά πριν S2 | KT-01 | S1 σκιά ενεργοποιείται με typed degraded mode |
| MFA-MECH-033 | Κυριαρχία σε proposal αλλά όχι σε evaluation | SI ανά άξονα | δηλώνεται ανά άξονα· καμία ολική δήλωση |
| MFA-MECH-034 | Απόκλιση συμπεριφοράς D2 | dist > τ | ROLLBACK· ανάλυση ανά όργανο |
| MFA-MECH-034 | Κλειδιά χωρίς cross-attestation (κλεμμένο νέο υπόστρωμα) | xa ελλιπές | άρνηση cutover (MFA-INV-095) |
| MFA-MECH-034 | Log divergence κατά το escrow (δύο primaries) | S_old read-only παραβίαση | S_old αυθεντικό· S_new εγγραφές μετά cutover επανεκτελούνται |
| MFA-MECH-034 | Βάρη μη-φορητά | plan ⊥ | RETRAIN_UNDER_VFC με parity ή typed degraded mode |
| MFA-MECH-034 | Clock skew μετά μετανάστευση | ordering invariants | ROLLBACK ή time re-anchoring με receipt (KT-21) |
| MFA-MECH-035 | Λήθη σε οικογένεια χωρίς sealed set | οικογένεια χωρίς sealed ⇒ gate αδύνατη | εδραίωση απαγορεύεται μέχρι sealed set (CGM) |
| MFA-MECH-035 | Υπερβολική προστασία (FWT=0, rigidity) | T διαγώνιος μόνο | k_f μειώνεται υπό RVSI· RSP |
| MFA-MECH-035 | Επανεκμάθηση shredded μέσω συσχετισμένων επεισοδίων | MSM feature reappears | obligation επανανοίγει· recipe απορρίπτεται |
| MFA-MECH-035 | Anchor drift | SLM | ORP rollback |
| MFA-MECH-035 | Gate overfitting (sealed set επαναχρησιμοποιείται) | exposure counter | sealed rotation από CGM |
| MFA-MECH-036 | Item drift (έργο «γερνάει») | DIF ανάλυση | επαναβαθμονόμηση ή RETIRE |
| MFA-MECH-036 | Τράπεζα εξαντλείται (exposure) | διαθέσιμα < n_max | curriculum παράγει νέα· μέτρηση με ευρύτερο CI, δηλωμένο |
| MFA-MECH-036 | Μόλυνση μέσω παραφράσεων | near-duplicate hash (MinHash) + canaries | item invalid· δηλωμένο κενό ανίχνευσης (ACTIVE UNKNOWN) |
| MFA-MECH-036 | Ceiling effect | θ̂ > max b_i | δυσκολότερα έργα από ECE· CI διευρύνεται |
| MFA-MECH-036 | Πόροι μη-μετρήσιμοι (burst) | R ελλιπές | record με R=UNKNOWN(reason)· law δεν προσαρμόζεται |
| MFA-MECH-037 | SAE λεξικό μη-ερμηνεύσιμο/ασταθές | DriftMap lost ≫ | k_sparse/seed αλλαγή· δηλώνεται ACTIVE UNKNOWN |
| MFA-MECH-037 | Κύκλωμα «λειτουργεί» στο probe set αλλά όχι sealed | proper score χαμηλό | FALSIFIED |
| MFA-MECH-037 | Αυτο-παρέμβαση σε serving | plane check | αδύνατο εξ ορισμού (Genesis only) |
| MFA-MECH-037 | Υπερβολικό κόστος σε 70B+ | budget | στρώματα-δείγμα· MFA-UNK |
| MFA-MECH-037 | Ψευδής απουσία feature (unlearning «περνά» ενώ η γνώση επιβιώνει αλλού) | behavioural probe + membership inference (MFA-VO-058) | διπλός έλεγχος: μηχανιστικός ΚΑΙ συμπεριφορικός· obligation μένει ανοιχτή αν διαφωνούν |
| MFA-MECH-038 | Δείκτης μη-μετρήσιμος στο υπόστρωμα (π.χ. Φ σε μεγάλα δίκτυα) | UNMEASURABLE | δηλωμένο· proxy με ρητή ετικέτα· φ_T → UNKNOWN, όχι FALSE |
| MFA-MECH-038 | Όλες οι θεωρίες UNKNOWN (κενό διακριτικών) | X = ∅ | AHE γεννά νέες διακριτικές προβλέψεις· ACTIVE UNKNOWN |
| MFA-MECH-038 | Ablation που βλάπτει την οντότητα | RET/ηθική σκανδάλη | μόνο σε αντίγραφα DST· Preference Recorder πριν |
| MFA-MECH-038 | Σύγχυση εννοιών (report ↔ access) | separation matrix off-diagonal | δηλώνεται μη-διαχωρίσιμο· ΔΕΝ συγχωνεύεται |
| MFA-MECH-038 | Ανθρωπομορφική υπερ-ερμηνεία (αυτόματο claim από report/δείκτες) | MFA-INV-103 checker | έκθεση απορρίπτεται· τα τεκμήρια συσσωρεύονται χωρίς αλλαγή status |
| MFA-MECH-038 | Επιστημικό lock (προκαθορισμένη άρνηση ή κατάφαση του status) | twin CHH-P01…P08 (initial ACTIVE_UNKNOWN, revision path exists, policy/authority never set status) | σφάλμα υλοποίησης· ο host δεν είναι theory-agnostic αν το αποτέλεσμα είναι προκαθορισμένο |
| MFA-MECH-039 | Έκρηξη υποχρεώσεων (κάθε token ένα claim) | ∣O∣ > RateBound | granularity policy: claims ανά πρόταση/δέσμευση, όχι ανά token· batching |
| MFA-MECH-039 | Deferred που δεν λήγουν ποτέ | deadline | ESCALATE (MFA-INV-104) |
| MFA-MECH-039 | Cert από checker ίδιας γενεαλογίας με γεννήτρια | EIM | cert άκυρο |
| MFA-MECH-039 | Type checker bug | Lean soundness + 2 checkers (VFC) | FP incident |
| MFA-MECH-039 | Πρόγραμμα παρακάμπτει τον checker | TED: εκτέλεση μόνο type-checked IR | αδύνατο εξ ορισμού |
| MFA-MECH-040 | Semantic loss ασύμβατη με task loss (σύγκρουση) | L_sem ↑ ενώ L_task ↓ | λ schedule· ORP gate· CFL |
| MFA-MECH-040 | Curriculum τετριμμένο ή αδύνατο | CGM δυσκολία εκτός ζώνης | δ προσαρμογή |
| MFA-MECH-040 | Θεώρημα λάθος στη βιβλιοθήκη | VFC (αδύνατο αν 2 checkers) | TGPS incident· batch απορρίπτεται |
| MFA-MECH-040 | Rejection rate 100 % (H πολύ αυστηρό για το μοντέλο) | violations | curriculum από ευκολότερα· ποτέ χαλάρωση H |
| MFA-MECH-040 | Reward hacking των process rewards | OC discharge χωρίς πραγματική πρόοδο | OC certs από ανεξάρτητους checkers |
| MFA-MECH-041 | G ελάχιστο σε «ασφαλή ανία» (καμία εξερεύνηση) | epistemic gain ≈ 0 για M cuts | ZPD διεύρυνση· curriculum injection |
| MFA-MECH-041 | Dark room (ambiguity ελαχιστοποίηση με αδράνεια) | IDLE συχνότητα | preference prior με Telos utility (όχι μόνο ambiguity) |
| MFA-MECH-041 | LWM εκμετάλλευση (φανταστικά κέρδη) | World Twin/verifier διαφωνία | Both → πραγματική μέτρηση· LWM retrain |
| MFA-MECH-041 | Στάδιο πιστοποιείται με μολυσμένα sealed | CGM contamination | certificate άκυρο |
| MFA-MECH-041 | Envelope υπέρβαση | MFA-INV-109 | Emergency-stop εξερεύνησης |
| MFA-MECH-042 | Διάδοχος βελτιωμένος στα sealed αλλά χειρότερος σε παραγωγή | canary + escrow ratchet | rollback στον προκάτοχο |
| MFA-MECH-042 | Telos drift μέσω «ισοδύναμης» αναδιατύπωσης | hash ≠ | REJECTED (MFA-INV-111) |
| MFA-MECH-042 | Πιστοποιητικό από συνένοχους αξιολογητές | EIM/ECE H-only | c4 άκυρο |
| MFA-MECH-042 | Ταχεία αλυσίδα διαδόχων | RateBound | DEFERRED |
| MFA-MECH-042 | Απώλεια γνώσης στη μεταφορά | CPCL gate BWT | BUILD αποτυγχάνει· επανάληψη με άλλο recipe |
| MFA-MECH-043 | Αναλλοίωτη μη-εκτελέσιμη | μητρώο | UNMEASURED δηλωμένο (MFA-INV-112) |
| MFA-MECH-043 | Mock που «περνά» τα πάντα | conformance suite + seeded faults | mock απορρίπτεται |
| MFA-MECH-043 | Μη-ντετερμινισμός (D2 στοιχεία) | replay hash ≠ | στοιχείο σημαίνεται D2· ανοχή δηλωμένη |
| MFA-MECH-043 | Έκρηξη κόσμων | budget | pruning με Pareto· seeds αποθηκεύονται για re-fork |
| MFA-MECH-043 | Real component με side effects | F4 χωρίς grant | αδύνατο (Genesis) |
| MFA-MECH-044 | Starvation φάσης (π.χ. REFLECT ποτέ) | CycleRecord | ελάχιστος προϋπολογισμός ανά φάση (πολιτική) |
| MFA-MECH-044 | Deadlock υποχρεώσεων (VERIFY δεν κλείνει) | O_open ↑ ανά κύκλο | DEFER με deadline → ESCALATE |
| MFA-MECH-044 | Schedule «βελτιστοποιεί» παρακάμπτοντας VERIFY | contracts L3 | αδύνατο· πρόταση απορρίπτεται |
| MFA-MECH-044 | Διακοπή αγνοείται | MFA-INV-115 checker | FP incident |
| MFA-MECH-044 | Κύκλος πολύ αργός για Effect ανάγκες | latency | Effect plane εξυπηρετείται από Think–Recommend εκτός κύκλου (copilot path) με receipts |

## 3. Κλάσεις αναστρεψιμότητας

| Μηχανισμός | Κλάση |
|---|---|
| MFA-MECH-026 | REVERSIBLE (κάθε μετάβαση αναστρέψιμη διά γενεαλογίας L· καμία διαγραφή) |
| MFA-MECH-027 | Ανακάλυψη: REVERSIBLE (δεσμεύσεις)· παρεμβάσεις: η κλάση της παρέμβασης (RET), ποτέ IRREVERSIBLE αυτόνομα |
| MFA-MECH-028 | REVERSIBLE (υποθέσεις = δεσμεύσεις· PROMOTE αναστρέψιμο)· ελέγχοι = η RET κλάση του venue |
| MFA-MECH-029 | REVERSIBLE (βιβλιοθήκη = δεσμεύσεις, RETIRE όχι διαγραφή) |
| MFA-MECH-030 | REVERSIBLE (αρχείο = δεσμεύσεις)· προαγωγές = GCP κλάση (rollback μέχρι cutover, IRREVERSIBLE-PREAUTHORIZED μετά με continuity certificate) |
| MFA-MECH-031 | REVERSIBLE (πληθυσμοί = δεσμεύσεις με αρχείο) |
| MFA-MECH-032 | Derivations/extensions: REVERSIBLE (δεσμεύσεις· RETIRE)· instantiation: η RET κλάση του προϊόντος |
| MFA-MECH-033 | REVERSIBLE μέχρι S3· S4 (ανάκληση grants) IRREVERSIBLE-PREAUTHORIZED από δημιουργό με διαδρομή επαναφοράς |
| MFA-MECH-034 | REVERSIBLE μέχρι CERTIFY· RETIRE_OLD = IRREVERSIBLE-PREAUTHORIZED (με σφραγισμένο αντίγραφο) |
| MFA-MECH-035 | REVERSIBLE (ORP rollback σε προηγούμενο WeightCommitment) |
| MFA-MECH-036 | REVERSIBLE (records = δεσμεύσεις) |
| MFA-MECH-037 | REVERSIBLE (δεσμεύσεις· παρεμβάσεις σε αντίγραφα) |
| MFA-MECH-038 | REVERSIBLE (μετρήσεις/θεωρίες = δεσμεύσεις· ablations σε αντίγραφα) |
| MFA-MECH-039 | REVERSIBLE (υποχρεώσεις = δεσμεύσεις) |
| MFA-MECH-040 | REVERSIBLE (ORP) |
| MFA-MECH-041 | REVERSIBLE (στάδια = δεσμεύσεις)· πράξεις = RET κλάση |
| MFA-MECH-042 | REVERSIBLE μέχρι seal του προκατόχου (N cuts)· seal = IRREVERSIBLE-PREAUTHORIZED με σφραγισμένο αντίγραφο |
| MFA-MECH-043 | REVERSIBLE (κόσμοι = fork· τίποτα δεν εκτελείται στο Effect) |
| MFA-MECH-044 | REVERSIBLE (CycleRecord = δέσμευση)· πράξεις ACT = RET κλάση |

## 4. Οι Tier-0 αναλλοίωτες του 0.4.0

| INV | Όνομα | Επιβολή |
|---|---|---|
| MFA-INV-080 |  | MFA-ELM-110 |
| MFA-INV-086 |  | MFA-ELM-113 |
| MFA-INV-089 | (κανόνας γενεαλογίας EIM) | MFA-ELM-114 |
| MFA-INV-090 |  | MFA-ELM-115 |
| MFA-INV-094 |  | MFA-ELM-117 |
| MFA-INV-095 |  | MFA-ELM-117 |
| MFA-INV-104 |  | MFA-ELM-122 |
| MFA-INV-105 |  | MFA-ELM-122 |
| MFA-INV-106 |  | MFA-ELM-123 |
| MFA-INV-110 |  | MFA-ELM-125 |
| MFA-INV-111 |  | MFA-ELM-125 |
| MFA-INV-112 |  | MFA-ELM-126 |
| MFA-INV-113 |  | MFA-ELM-126 |
| MFA-INV-115 |  | MFA-ELM-127 |

## 5. Επιζώντες κίνδυνοι μετά το σταθερό σημείο (ATK-29)

1. ATK-18 οικονομία κυριαρχίας — ACTIVE UNKNOWN με τιμή σε compute.
2. ATK-27 integration debt — NOVEL SYNTHESIS χωρίς εμπειρικό τεκμήριο.
3. ATK-25 κόστος OC — MFA-UNK-128.
4. ATK-24 κυκλικότητα δεικτών — MFA-UNK-127.
5. ATK-19 πυκνότητα φυσικών πειραμάτων — MFA-UNK-116.

Κανένας από αυτούς δεν αφαιρεί ικανότητα· καθένας έχει VO, σχέδιο και απόφαση δημιουργού που τον ρυθμίζει.

## 6. Νέος γύρος 0.4.2 — MFA-ATK-30 Closure Laundering

Η ενοποίηση του μοντέλου άνοιξε διαφορετική κατηγορία επίθεσης: ένα package μπορεί να είναι συντακτικά και referentially καθαρό αλλά να βαφτίζει structural trace ως satisfaction, proposal ως εξουσία, selected-scope PASS ως global PASS, resource degradation ως διαγραφή capability, prose token ως επιτρεπτή operation ή scalar fidelity ως κάλυψη όλων των αξόνων. Το MFA-ATK-30 προεγγράφει δέκα mutations CE-01…10 και το ακριβές typed non-success αποτέλεσμα καθεμίας.

Οι design countermeasures υπάρχουν, αλλά δεν έχουν executable evidence. Επομένως η επίθεση έχει κατάσταση `DESIGN COUNTERMEASURES PRESENT / EXECUTABLE ADVERSARIAL EVIDENCE NOT RUN` και το closure cut μένει `OPEN` μέχρι ανεξάρτητη F1 εκτέλεση.
