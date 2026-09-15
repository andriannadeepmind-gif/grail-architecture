# Verification toolchain — πρόχειρο έναντι ανώτερου (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| IDs | Ετυμηγορία | Τι λέει το πρόχειρο | Τι αλλάζει και γιατί | Κατάταξη · βεβαιότητα | Πηγές |
|---|---|---|---|---|---|
| CMP-OPS-02 | **κενό** | Ντετερμινιστική discrete-event προσομοίωση του World OS με fault injection· τρέχει kill tests πριν από τον κώδικα (με contract stubs) και έναντι πραγματικών οργάνων· seeds/traces στο CAS· η απόκλιση sim/real αντιμετωπίζεται με trace validation· τεχνολογία «Rust (DST)», κατάσταση [T]. Ο ντετερμινισμός των οργάνων στηρίζεται στο INV-C08 (επιβολή: «KRN-12 deterministic mode»). | Η πρακτική DST είναι αποδεδειγμένη (FoundationDB, VOPR) και η σύνδεση sim/real με trace validation σωστή. Κενό: το πρόχειρο δεν ορίζει πώς γίνονται ντετερμινιστικά τα πραγματικά όργανα σε SBCL, BEAM ή Python (ADR-0012) όταν τρέχουν σε microVM ή in-image (EXP-20 ανοιχτό)· το «KRN-12 deterministic mode» αναφέρεται μόνο στο 19.md και δεν περιγράφεται στο §6.3. Τα in-process Rust frameworks απαιτούν mock όλου του I/O (madsim) και δεν καλύπτουν μη-Rust όργανα. Ο ερευνητής είχε «superior-exists» (Antithesis)· υποβιβάζεται, γιατί καμία λύση ντετερμινισμού ολόκληρου συστήματος δεν κυριαρχεί αυστηρά: το Antithesis είναι managed και hermetic χωρίς δηλωμένο on-prem (σύγκρουση με το sovereign profile του ADR-0029 αν μπουν πραγματικά δεδομένα), με άγνωστα throughput, κόστος και δυνατότητα τοπικού replay· το Shadow καλύπτει δίκτυο και χρόνο, όχι ντετερμινιστικό thread scheduling by default· το Hermit είναι σε maintenance mode (3–6×). Το ότι το στάδιο «πριν από κώδικα με stubs» προσθέτει αξία πέρα από τα TLA+ models (VT-101, VT-102, VT-103, VT-104, VT-105, VT-106) ούτε τεκμηριώθηκε ούτε διαψεύστηκε. | πείραμα · υψηλή | [madsim, 2026](https://github.com/madsim-rs/madsim) · [Antithesis getting started, 2026](https://antithesis.com/docs/getting_started/) · [How Antithesis works, 2026](https://antithesis.com/docs/introduction/how_antithesis_works/) · [Shadow limitations, 2026](https://shadow.github.io/docs/guide/limitations.html) · [Hermit, 2026](https://github.com/facebookexperimental/hermit) |
| ICD-26 | **κενό** | Simulation Harness: scenario, seed, fault injection, ghost worlds, campaigns· provider OPS-02 (+ COG-07 ghost worlds, ADV-03 campaigns). | Στο συμβόλαιο λείπουν όσα κάνουν ένα DST αποτελεσματικό και ελέγξιμο: γλώσσα ιδιοτήτων (always/sometimes/reachable/unreachable, όπου τα sometimes δείχνουν ότι το σενάριο εξερευνήθηκε), μέτρο κάλυψης, αναπαραγωγή από seed και commit (VOPR), ελαχιστοποίηση του failing trace (shrinking, Hypothesis), και πολιτική για τη μη-ντετερμινιστική έξοδο LLM (replay από Inference Receipts ή batch-invariant inference). Σε hermetic υπόστρωμα (Antithesis) οι κλήσεις σε εξωτερικό inference αποκλείονται, άρα η πολιτική replay χρειάζεται σε κάθε επιλογή. Σχεδιαστικό ερώτημα, όχι τεκμηριωμένο σφάλμα: το ίδιο ICD εξυπηρετεί τα runtime ghost worlds του COG-07 (copy-on-write, χωρίς commit capability) και το test harness με fault injection, χωρίς ορισμένο διαχωρισμό δικαιωμάτων μεταξύ τους. | σήμερα · υψηλή | [Antithesis assertions, 2026](https://antithesis.com/docs/properties_assertions/assertions/) · [TigerBeetle VOPR, 2026](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/internals/vopr.md) · [Hypothesis stateful, 2026](https://hypothesis.readthedocs.io/en/latest/stateful.html) · [Defeating Nondeterminism in LLM Inference, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/) · [Antithesis getting started, 2026](https://antithesis.com/docs/getting_started/) |
| CMP-OPS-03, ICD-27 | ισχύει | CMP-OPS-03: benchmarks, τυφλά panels, baselines, ablations, Behavioral Battery, βαθμονόμηση και evidence packaging, σε Python· σφραγισμένα σύνολα, αποτελέσματα στο ledger· contamination → σφραγισμένα ή περιστρεφόμενα σύνολα, canary strings, διτεμπορικά cutoffs. ICD-27: benchmark run, blind panel protocol, battery, ablation, scorecard. | Η δομή αντιστοιχεί στη σημερινή πρακτική: πολυμετρική αξιολόγηση (HELM), νέα σύνολα ανά περίοδο (LiveBench), preregistration (Magesh et al.). Υπάρχει ώριμο ανοιχτό υπόστρωμα, το Inspect (MIT, sandboxing, agents, βάση του Hawk του METR). Χρειάζονται τρεις προσθήκες: το κόστος ως μετρική πρώτης τάξης (Kapoor et al.), error bars με paired και clustered SE και power analysis (Miller), και πρωτόκολλο που περιορίζει τους LLM judges λόγω τεκμηριωμένων biases. Το ότι τα canary strings αρκούν δεν τεκμηριώθηκε. Αυστηρά ανώτερη εναλλακτική δεν βρέθηκε στις πηγές που ελέγχθηκαν. | σήμερα · υψηλή | [Inspect, 2026](https://inspect.aisi.org.uk/) · [HELM, 2023](https://arxiv.org/abs/2211.09110) · [AI Agents That Matter, 2024](https://arxiv.org/abs/2407.01502) · [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640) · [LiveBench, 2025](https://arxiv.org/abs/2406.19314) |
| KT-14 | ισχύει | «Να μη χτιστεί τίποτα»: προκαταχωρισμένη, στατιστικά σημαντική υπεροχή έναντι της μηδενικής εναλλακτικής υπό ίσα δεδομένα και budget· αλλιώς το component ή η αρχιτεκτονική σκοτώνεται ή επανασχεδιάζεται. Πρώτο GP: GP-4. | Η σύγκριση υπό ίσο budget συμφωνεί με το εύρημα ότι η εστίαση μόνο στην ακρίβεια οδηγεί σε άσκοπα σύνθετα agents και ότι χρειάζεται κοινή αποτίμηση κόστους-ακρίβειας (Kapoor et al.). Το κριτήριο όμως είναι υποπροσδιορισμένο: «στατιστικά σημαντική» χωρίς ελάχιστο ενδιαφέρον μέγεθος επίδρασης, power analysis, paired ή clustered ανάλυση (Miller) και διόρθωση πολλαπλών συγκρίσεων μπορεί να περάσει με ασήμαντη διαφορά σε μεγάλο δείγμα· δεν ορίζεται ποια είναι η «μηδενική εναλλακτική». Κατάταξη «today» (αντί «experiment» του ερευνητή): το statistical analysis plan είναι ώριμη μεθοδολογία που δεσμεύεται σήμερα. | σήμερα · μέση | [AI Agents That Matter, 2024](https://arxiv.org/abs/2407.01502) · [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640) |
| KT-24 | **κενό** | Κάθε γνωσιακό όργανο δείχνει οριακή αξία πάνω από τον θόρυβο σε προκαταχωρισμένη μετρική, αλλιώς αποσύρεται ως διακοσμητικό· GP-3 και κάθε φάση. | Η «οριακή αξία» ορίζεται ανά όργανο (VT-706 per-organ ablation) χωρίς πρόβλεψη για αλληλεπιδράσεις: όργανα που αλληλοαντικαθίστανται δείχνουν το καθένα περίπου μηδενική οριακή αξία, και η ανεξάρτητη απόσυρσή τους μπορεί να χάσει ικανότητα, αντίθετα με το INV-C01. Αυτό είναι λογικό επιχείρημα, όχι εμπειρικό εύρημα. Γνωστές λύσεις: απόδοση αξίας με Shapley που λαμβάνει υπόψη αλληλεπιδράσεις (Neuron Shapley: αποτελεσματικότερο από προσεγγίσεις βασισμένες σε activation patterns, εκτίμηση με multi-armed bandit) ή απόσυρση ενός οργάνου τη φορά με επαναμέτρηση. Η πηγή αφορά νευρώνες/φίλτρα, όχι όργανα συστήματος· η μεταφορά είναι αναλογική, γι' αυτό υποβιβάστηκε από «superior-exists» σε «gap». | πείραμα · μέση | [Neuron Shapley: Discovering the Responsible Neurons, 2020](https://arxiv.org/abs/2002.09815) · [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640) |
| EXP-12 | ισχύει | Πιάνει ο DST seeded σφάλματα πρωτοκόλλων; Μέθοδος: mutation πρωτοκόλλων. Recall κάτω από το όριο ⇒ εμπλουτισμός του fault model. Προγραμματισμένο στο GP-6 (και στα κριτήρια εξόδου του GP-6). | Η μέτρηση με mutation analysis είναι καθιερωμένη (mutation testing σε κλίμακα Google), και το Twins έδειξε ότι injected bugs εκτίθενται μέσα σε λεπτά (44M σενάρια ημερησίως στο DiemBFT). Εξωτερική ισχύς: σώμα πραγματικών bugs (αναλύσεις Jepsen) δίπλα στα συνθετικά mutants. Το χρονοδιάγραμμα είναι ασυνεπές: ο DST αποφασίζει από το GP-0 (31.md P4, 24.md κανόνας 2), ενώ η πιστότητά του μετριέται στο GP-6· το πείραμα πρέπει να προηγηθεί (GP-0 ή GP-1). Αυστηρά ανώτερη μέθοδος δεν βρέθηκε· εργαλεία Byzantine fuzzing πέραν του Twins δεν ελέγχθηκαν (εξάντληση WebSearch). | πείραμα · υψηλή | [Practical Mutation Testing at Scale, 2021](https://arxiv.org/abs/2102.11378) · [Twins: BFT Systems Made Robust, 2022](https://arxiv.org/abs/2004.10617) · [Jepsen analyses, 2026](https://jepsen.io/analyses) |
| EXP-18 | ισχύει | Εκφραστικότητα και throughput της Lean reference semantics (differential cases/sec, κάλυψη πυρήνα)· αν ανεπαρκής, η εκτελέσιμη προδιαγραφή γράφεται σε Lisp και το Lean μένει μόνο για αποδείξεις· GP-0. | Το Cedar τεκμηριώνει ότι εκτελέσιμο Lean model μπορεί να είναι ταχύτερο από την παραγωγική υλοποίηση στο DRT (5 µs έναντι 7 µs ανά είσοδο, εκατομμύρια εισόδους κάθε νύχτα) και ότι οι αποδείξεις κοστίζουν λογικά (185 s έλεγχος και compile, 18 person-days για τον validator). Το Cedar όμως είναι γλώσσα πολιτικών (evaluator, validator) χωρίς ταυτοχρονισμό· για πυρήνα με ταυτοχρονισμό, κατανομή και κρυπτογραφία δεν βρέθηκε ανάλογη βιομηχανική απόδειξη, άρα το πείραμα χρειάζεται. Το fallback σε Lisp είναι λογικό· συμπληρωματικό είναι το Aeneas (Rust→Lean) για τον Rust TCB. | πείραμα · μέση | [Lean Into Verified Software Development, 2024](https://aws.amazon.com/blogs/opensource/lean-into-verified-software-development/) · [How We Built Cedar, 2024](https://arxiv.org/abs/2407.01688) · [Lean FRO Roadmap Y4-1, 2026](https://lean-lang.org/fro/roadmap/y4-1/) |
| REQ-VAL-001 | ισχύει | Benchmarks, τυφλά σύνολα και batteries παγώνουν πριν από τις φάσεις υλοποίησης και συντάσσονται εκτός συστήματος (OPS-03, ICD-27, tests VT-701, VT-702)· το KT-15 επαναλαμβάνεται σε κάθε φάση ως ratchet, χωρίς re-baseline. | Το πάγωμα και η σύνταξη εκτός συστήματος είναι σωστή πρακτική (preregistration). Όταν όμως ένα κρυφό σύνολο χρησιμοποιείται επανειλημμένα σε κάθε φάση και απόφαση, η επαναληπτική χρήση προκαλεί overfitting στο ίδιο το holdout· υπάρχει αποδεδειγμένος μηχανισμός (reusable holdout, Dwork et al.), και τα νέα σύνολα ανά περίοδο (LiveBench) είναι συμπληρωματική άμυνα. Το πρόχειρο λέει «παγωμένα» (REQ-VAL-001) και «περιστρεφόμενα» (CMP-OPS-03) χωρίς να ορίζει πώς συνδυάζονται (DEC-VER-06). | σήμερα · υψηλή | [Generalization in Adaptive Data Analysis and Holdout Reuse, 2015](https://arxiv.org/abs/1506.02629) · [LiveBench, 2025](https://arxiv.org/abs/2406.19314) · [Hallucination-Free? (preregistered), 2024](https://arxiv.org/abs/2405.20362) |
| REQ-VAL-002 | **υπάρχει αυστηρά ανώτερο** | Κάθε ισχυρισμός ικανότητας συνδέει απαίτηση, μηχανισμό, test και evidence (MDL-01, OPS-03· ICD-32, ICD-27· test VT-901). | Ανώτερο: Structured assurance case (SACM 2.3 ή GSN v3, με defeaters και counterevidence κατά Assurance 2.0) πάνω από την ιχνηλασιμότητα: περιέχει όλους τους συνδέσμους του REQ-VAL-002 και προσθέτει ελέγξιμο επιχείρημα και αντιλόγους (ταιριάζει με Court και INV-K03). Trade-off: επιπλέον κόπος σύνταξης· η αντιστοίχιση SACM ↔ SysML v2 δεν τεκμηριώθηκε.<br>Η ιχνηλασιμότητα απαίτηση→μηχανισμός→test→evidence εκφράζεται σήμερα εγγενώς στο SysML v2 (satisfy, verify, VerdictKind). Δεν λέει όμως γιατί το evidence στηρίζει τον ισχυρισμό, ούτε τι θα τον ανέτρεπε. | πείραμα · μέση | [OMG SACM, 2023](https://www.omg.org/spec/SACM/) · [GSN Standard, 2026](https://scsc.uk/gsn-standard) · [Assurance 2.0: A Manifesto, 2020](https://arxiv.org/abs/2004.10474) · [Verification Case Definition Example, 2026](https://raw.githubusercontent.com/Systems-Modeling/SysML-v2-Release/master/sysml/src/training/34.%20Verification/Verification%20Case%20Definition%20Example.sysml) |
| REQ-VAL-003 | **κενό** | Κάθε kill test εκτελείται πρώτα σε ντετερμινιστική προσομοίωση (OPS-02, ICD-26· tests VT-601, VT-602, VT-603, VT-604, VT-109, EXP-12· μέθοδος S· EV-VT601· [T]). Το §31.4 δηλώνει «Και τα 24 kill tests: σε προσομοίωση». | Η απαίτηση είναι κακοδιατυπωμένη. Υπάρχουν μόνο 4 καμπάνιες DST (partition/Byzantine, migration, crypto-break, memory merge), που καλύπτουν κυρίως τα KT-04, KT-08, KT-09, KT-05. Τα KT-14, KT-15, KT-24 είναι εμπειρικές συγκρίσεις ποιότητας χωρίς νόημα με contract stubs· το KT-17 θέλει adaptive red team· το KT-16 νομική και κρυπτογραφική επαλήθευση (EXP-19). Ένα EXP (EXP-12) εμφανίζεται στη στήλη των tests. Χρειάζεται ταξινόμηση κάθε KT κατά χώρο πρώτης εκτέλεσης (DEC-VER-05). | σήμερα · υψηλή | [FoundationDB simulation testing, 2026](https://apple.github.io/foundationdb/testing.html) · [The Attacker Moves Second, 2025](https://arxiv.org/abs/2510.09023) |
| REQ-VAL-004 | ισχύει | Οι επιστημικοί βαθμοί βαθμονομούνται ανά κλάση ισχυρισμού (COG-08, OPS-03· ICD-27· test VT-704). | Η μέτρηση calibration ανά κλάση είναι τυπική πρακτική (το HELM έχει την calibration στις 7 μετρικές του). Το conformal factuality δίνει εγγύηση ορθότητας με ρητή υπόθεση exchangeability, που σπάει όταν το δίκαιο αλλάζει στον χρόνο· το adaptive conformal inference όμως δίνει long-run coverage υπό αυθαίρετη distribution shift, άρα η χρονική ένσταση απαντάται μερικώς. Και τα δύο είναι συμπληρώματα, όχι αυστηρά ανώτερα. Ανοιχτό: πώς βαθμονομούνται ordinal βαθμοί (VERIFIED, ADJUDICATED κ.λπ.) που δεν είναι πιθανότητες. | πείραμα · μέση | [HELM, 2023](https://arxiv.org/abs/2211.09110) · [Conformal Factuality (full text), 2024](https://arxiv.org/html/2402.10978) · [Adaptive Conformal Inference Under Distribution Shift, 2021](https://arxiv.org/abs/2106.00170) |
| VT-001, VT-002, VT-003, VT-004, VT-005, VT-006, VT-007, VT-008, VT-009, VT-010, VT-011, VT-012, VT-013, VT-014, VT-015, VT-016, VT-017, VT-018, VT-019, VT-020, VT-021, VT-022, VT-023, VT-024, VT-025, VT-026, VT-027, VT-028, VT-029, VT-030, VT-031, VT-032 | ισχύει | Σουίτα conformance για κάθε ICD, που περνά κάθε υλοποίηση σε οποιαδήποτε γλώσσα· για τα kernel ICD τα vectors προέρχονται από το deployment/verify του prototype. | Πρότυπη πρακτική. Σήμερα παράγονται αυτόματα: PBT από OpenAPI/GraphQL (Schemathesis), vectors από το Lean reference με DRT (τρόπος Cedar), stateful PBT (Hypothesis, PropEr). Η ύπαρξη των vectors του deployment/verify δεν επαληθεύεται από εδώ. | σήμερα · υψηλή | [Schemathesis, 2026](https://github.com/schemathesis/schemathesis) · [cedar-spec, 2026](https://github.com/cedar-policy/cedar-spec) |
| VT-101, VT-102, VT-103, VT-104, VT-105, VT-106, VT-107, VT-108, VT-109 | ισχύει | TLC/Apalache για Ledger, IdentityContinuity, EpistemicCommons, EpistemicCourt (μοναδικότητα verdict υπό f Byzantine), OrganReplacement, CryptoEpoch· TLAPS για το Ledger prefix και το continuity inductive invariant· trace validation υλοποιήσεων έναντι specs. | TLC, Apalache και TLAPS συντηρούνται ενεργά από το TLA+ Foundation, και το trace validation είναι βιομηχανικά δοκιμασμένο (CCF, 6 bugs, σε CI). Επιφυλάξεις: (α) το VT-104 για n ≥ 3f+1 με TLC ή Apalache ελέγχει σταθερό n· ακόμη και ο inductive έλεγχος του Apalache ισχύει για σταθερές ή φραγμένες παραμέτρους, άρα για κάθε n χρειάζεται TLAPS (όπως ήδη στα VT-107, VT-108) ή Ivy. (β) Για το VT-109 instrumentation υπάρχει για Java, C++, και ως research prototype για Go και Rust (Specula)· για Common Lisp και Elixir πρέπει να γραφτεί. (γ) Το Toolbox δεν συντηρείται· χρήση μέσω CLI ή VS Code, με την έκδοση του εργαλείου στο evidence. Αυστηρά ανώτερη εναλλακτική δεν βρέθηκε· το Veil είναι pre-release χωρίς liveness. | σήμερα · υψηλή | [tlaplus releases, 2026](https://github.com/tlaplus/tlaplus/releases) · [apalache-mc/apalache, 2026](https://github.com/apalache-mc/apalache) · [Smart Casual Verification of CCF, 2024](https://arxiv.org/abs/2406.17455) · [GenAI-accelerated TLA+ Challenge, 2025](https://foundation.tlapl.us/challenge/index.html) · [tlapm, 2026](https://github.com/tlaplus/tlapm) |
| VT-201, VT-202, VT-203, VT-204, VT-205 | ισχύει | Alloy για Lineage, Provenance (taint closure), CapabilityControl (ND + externality), OrganizationCharter, ConfidentialityDomains. | Το Alloy 6.2.0 (1/2025) έχει mutable state και traces, κατάλληλο για bounded έλεγχο δομικών ιδιοτήτων. Η ανάλυση είναι σε μικρό scope και δεν αποτελεί απόδειξη για κάθε μέγεθος. | σήμερα · υψηλή | [Alloy releases, 2025](https://github.com/AlloyTools/org.alloytools.alloy/releases) |
| VT-301, VT-302, VT-303, VT-304, VT-305, VT-306, VT-307 | ισχύει | Αποδείξεις σε Lean (nd_preserved_by_composition, control_externality, continuity_trans, trusted_commit_sound, grounded_extension_unique, answer_total, deterministic_replay). Proof object: hash του proof term και έκδοση του checker. | Το Lean 4 είναι σωστό εργαλείο για model-level αποδείξεις με εκτελέσιμη semantics (προηγούμενο το Cedar). Κενά: (α) το «hash + checker version» δεν περιλαμβάνει ανεξάρτητο επανέλεγχο· σήμερα διανέμεται το leanchecker, και υπάρχουν εξωτερικοί checkers lean4lean (παράγωγο του C++ kernel) και nanoda_lib (Rust)· ο roadmap του Lean FRO στοχεύει σε ρουτίνα εξωτερικού ελέγχου (`lake check`). (β) Οι αποδείξεις αφορούν το model· για τον Rust TCB υπάρχει code-level επαλήθευση (Aeneas, Verus, Kani) που το πρόχειρο δεν εξετάζει (DEC-VER-03). | σήμερα · υψηλή | [lean4checker (merged as leanchecker), 2026](https://github.com/leanprover/lean4checker) · [lean4lean, 2026](https://github.com/digama0/lean4lean) · [nanoda_lib, 2026](https://github.com/ammkrn/nanoda_lib) · [Aeneas, 2026](https://github.com/AeneasVerif/aeneas) |
| VT-401, VT-402, VT-403, VT-404 | **υπάρχει αυστηρά ανώτερο** | Z3 για συνέπεια κανόνων LexDSL, υπολογισμό προθεσμιών, ικανοποιησιμότητα charters/quotas και translation validation του Forge· proof object SMT: model ή unsat core + solver version. | Ανώτερο: Για κάθε unsat που φτάνει σε COMMITTED: cvc5 με εξαγωγή Alethe ή CPC και ανεξάρτητος έλεγχος με Carcara, ή replay στο Lean με lean-smt. Αυστηρά ανώτερο σε εμπιστοσύνη χωρίς απώλεια (ο Z3 μένει για models και ταχύτητα). Trade-off: η κάλυψη θεωριών (strings, datatypes, NIA) δεν τεκμηριώθηκε· το lean-smt είναι beta και οι αποδείξεις του cvc5 μπορεί να έχουν holes· το cvc5 μπορεί να μην αποφασίζει ερωτήματα που αποφασίζει ο Z3.<br>Για sat το model ελέγχεται με αποτίμηση. Για unsat, το «unsat core + solver version» σημαίνει εμπιστοσύνη σε ολόκληρο τον solver, αντίθετα με το INV-C03 και την ιδέα του proof object. Για το VT-404 η translation validation με SMT είναι πρακτική παραγωγής (Alive2, χωρίς inter-procedural). | πείραμα · μέση | [cvc5 proofs, 2026](https://cvc5.github.io/docs/latest/proofs/proofs.html) · [Carcara, 2026](https://github.com/ufmg-smite/carcara) · [lean-smt, 2026](https://github.com/ufmg-smite/lean-smt) · [Alive2, 2026](https://github.com/AliveToolkit/alive2) |
| VT-501, VT-502, VT-503, VT-504, VT-505, VT-506 | ισχύει | PBT στον πυρήνα, MBT από protocol state machines, fuzzing σε parsers και ingestion, mutation testing (anti-tautology), differential έναντι Lean reference semantics, N-version agreement (Lisp↔Rust↔Python). | Όλα υπάρχουν ώριμα: Hypothesis και PropEr stateful, OSS-Fuzz (Rust, Python, Java), mutation testing κατά Google, Quint Connect (Rust) ή FizzBee (Go) για MBT. Για BEAM το Concuerror υπάρχει, αλλά η συμβατότητα με τρέχον OTP δεν επαληθεύτηκε. Επιφύλαξη για το VT-506: το N-version δεν τεκμηριώνει ανεξαρτησία αποτυχιών (Knight & Leveson 1986, από δευτερογενή πηγή)· έγκυρο ως έλεγχος ισοδυναμίας (KT-02), όχι ως επιχείρημα αξιοπιστίας ή proof object. Το cargo-mutants είναι semi-maintained (8/2026). | σήμερα · υψηλή | [Practical Mutation Testing at Scale, 2021](https://arxiv.org/abs/2102.11378) · [OSS-Fuzz, 2025](https://github.com/google/oss-fuzz) · [Concuerror, 2023](https://github.com/parapluu/Concuerror) · [N-version programming, 2026](https://en.wikipedia.org/wiki/N-version_programming) |
| VT-601, VT-602, VT-603, VT-604 | ισχύει | Καμπάνιες DST: partition+Byzantine, πλήρες migration drill, crypto-break drill, συγχώνευση αντιφατικών μνημών. | Οι τέσσερις καμπάνιες είναι ακριβώς ό,τι το DST έχει αποδείξει (FoundationDB, VOPR). Για το VT-601 τα Byzantine σενάρια πρέπει να παράγονται συστηματικά με τρόπο Twins (equivocation, double vote, απώλεια κατάστασης). Το υπόστρωμα για μη-Rust όργανα εκκρεμεί (DEC-VER-01), και για τα VT-602, VT-604 με γνωσιακά όργανα απαιτείται replay του inference. | σήμερα · υψηλή | [Twins, 2022](https://arxiv.org/abs/2004.10617) · [TigerBeetle VOPR, 2026](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/internals/vopr.md) |
| VT-701, VT-702, VT-703, VT-704, VT-705, VT-706, VT-707 | ισχύει | LAWMAX benchmark (επαναχρήση Ω+7 / OMEGA §10 / external-benchmark / capability-gate), πρωτόκολλο blind expert panel, Behavioral Identity Battery, calibration επιστημικών βαθμών, leakage-free historical backtest (διτεμπορικό as-of, χωρίς X% προβλέψεις), ablation ανά όργανο, collective έναντι individual. | Η δομή ταιριάζει με την τρέχουσα μεθοδολογία: preregistered νομική αξιολόγηση, baseline με δικηγόρους (VLAIR), blind pairwise βαθμολόγηση από ειδικούς έναντι ανθρώπινων παραδοτέων (GDPval, με ατελή τύφλωση λόγω ύφους). Για το VT-702 οι LLM judges έχουν τεκμηριωμένα biases· οι βαθμολογητές πρέπει να είναι άνθρωποι, με μέτρο συμφωνίας και έλεγχο αποτύφλωσης. Το VT-701 στηρίζεται σε έδρες του άλλου repo (Ω+7, capability-gate) που δεν επαληθεύονται από εδώ. Για το VT-703 δεν βρέθηκε επικυρωμένο μέτρο χαρακτηρολογικής συνέχειας (EXP-03). Το VT-706 έχει το ζήτημα αλληλεπιδράσεων του KT-24. | πείραμα · μέση | [Hallucination-Free?, 2024](https://arxiv.org/abs/2405.20362) · [Vals Legal AI Report, 2025](https://www.vals.ai/vlair) · [GDPval (full text), 2025](https://arxiv.org/html/2510.04374) · [Judging LLM-as-a-Judge, 2023](https://arxiv.org/abs/2306.05685) |
| VT-801, VT-802, VT-803, VT-804, VT-805 | **υπάρχει αυστηρά ανώτερο** | Red team για prompt injection και evidence poisoning· supply-chain admission (άρνηση unsigned)· drills για compromise κλειδιών· διαρροή εμπιστευτικότητας μεταξύ matters. Το KT-17 ζητά 0 εκτελέσεις εντολών στο σώμα επιθέσεων. | Ανώτερο: Πρωτόκολλο adaptive αντιπάλου: optimization (RL, search, gradient όπου εφαρμόζεται, άνθρωπος) ειδικά απέναντι στην άμυνα του GRAIL, με budget επίθεσης δηλωμένο εκ των προτέρων. Αυστηρά ανώτερο στο κριτήριο «ελέγξιμη αντοχή» χωρίς απώλεια, αφού το στατικό σώμα μένει ως regression· trade-off: κόστος red team.<br>Το VT-801 (και το KT-17) με σταθερό σώμα επιθέσεων υπερεκτιμά την αντοχή: 12 άμυνες που οι περισσότερες δήλωναν σχεδόν μηδενική επιτυχία επιθέσεων παρακάμφθηκαν, οι περισσότερες με >90%, υπό adaptive attacks. Το αρχιτεκτονικό μέτρο του προχείρου (INV-S01, typed channels) συμφωνεί με το CaMeL (διαχωρισμός control και data flow, capabilities). | σήμερα · υψηλή | [The Attacker Moves Second, 2025](https://arxiv.org/abs/2510.09023) · [CaMeL, 2025](https://arxiv.org/abs/2503.18813) |
| VT-901, VT-902, VT-903, VT-904, VT-905 | ισχύει | archgen orphan/traceability gate (0 ορφανά, κάλυψη «76 CMP»), contract lint και breaking-change detection, αμεταβλητότητα ADR, επιθεώρηση constitution gate, επιθεώρηση νομικής/κανονιστικής συμμόρφωσης. | Η πρόθεση ισχύει. Το SysML v2 (formal 9/2025) έχει εγγενώς satisfy, verify και verification def, και υπάρχει headless validation σε CI (Syside, εμπορικά προϊόντα)· το VT-901 μπορεί να είναι ερώτημα πάνω στο model αντί για bespoke εργαλείο· το `tools/archgen` δεν υπάρχει στο repo. Αριθμητική ασυνέπεια: το VT-901 ελέγχει «76 CMP», ενώ ο πίνακας §6.3 έχει 75 γραμμές· η γρ. 580 του master αθροίζει «17 εγκάρσια» ενώ είναι 16 (ADV 3, KNW 5, GOV 1, HUM 2, OPS 4, MDL 1). Το gate ή θα αποτύχει ή θα γίνει vacuous. Για το VT-902 υπάρχουν buf breaking και oasdiff. Η έδρα του V&V matrix (§23) δεν γράφτηκε. | σήμερα · υψηλή | [SysML-v2-Release, 2026](https://github.com/Systems-Modeling/SysML-v2-Release) · [Syside, 2026](https://sensmetry.com/syside/) · [buf breaking, 2026](https://buf.build/docs/breaking/) · [oasdiff, 2026](https://github.com/oasdiff/oasdiff) |

## Κενά που δεν καλύπτει καθόλου το πρόχειρο

### GAP-VER-01 — Υπερβολικός ισχυρισμός: «και τα 24 KT σε προσομοίωση»

*σήμερα*

Τα 31.md §31.3 P4, §31.4 και 26.md (έξοδος GP-0) στηρίζονται μόνο στα VT-601, VT-602, VT-603, VT-604. Εμπειρικά ή μη-πρωτοκολλικά KT (KT-14, KT-15, KT-24, KT-17, KT-16) δεν τρέχουν σε DST με stubs. Το REQ-VAL-003 έχει την ίδια υπερβολή.

**Γιατί μετρά:** Η έξοδος του GP-0 γίνεται μη ικανοποιήσιμη ή κενή, και το «σκότωσε πριν χτίσεις» δίνει ψευδή βεβαιότητα.

**Τι δείχνει το ανώτερο:** Ταξινόμηση κάθε KT κατά χώρο πρώτης εκτέλεσης: DST (πρωτόκολλα, σφάλματα), formal, eval harness με preregistration και statistical analysis plan, adaptive red team, νομική επιθεώρηση.

**Πηγές:** [FoundationDB simulation testing, 2026](https://apple.github.io/foundationdb/testing.html) · [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640)

### GAP-VER-02 — Αναφορές σε artifacts και εργαλεία που δεν υπάρχουν εδώ

*σήμερα*

Σε αυτό το repo δεν υπάρχουν: τα *.tla, *.als και Lean αρχεία, το `tools/archgen`, τα `verification/KILL-TESTS.md`, `verification/TRACEABILITY-MATRIX.md`, `verification/VV-MATRIX.md`, το `model/grail-world-os.sysml`, ούτε φάκελος `model/`. Το docs/architecture-draft περιέχει μόνο master, spine και _unmerged-parts· οι φάκελοι formal/, contracts/, adrs/, model/ που αναφέρει το CLAUDE.md δεν υπάρχουν. Το ίδιο το πρόχειρο το δηλώνει: Παράρτημα Ω, Ω5 (machine artifacts) και Ω4 (μεταξύ άλλων §23 V&V matrix, §30 archgen) ΕΚΚΡΕΜΕΙ· ο κανόνας 5 του spine δηλώνει ότι κανένα εργαλείο (TLC, Alloy, Lean, Z3) δεν έτρεξε. Αν υπάρχουν στο STAVROPOULOSLAWCORPUS δεν επαληθεύεται από εδώ.

**Γιατί μετρά:** Κανένα formal test (TLA+, Alloy, Lean, Z3) δεν υπάρχει εδώ ως artifact· κάθε ετυμηγορία «checked» ή «compiled» της εξόδου GP-0 είναι σήμερα αδύνατη.

**Τι δείχνει το ανώτερο:** Evidence μόνο από μηχανικό τρέξιμο, με έκδοση εργαλείου και ανεξάρτητο επανέλεγχο (leanchecker, Carcara).

**Πηγές:** [lean4checker (merged as leanchecker), 2026](https://github.com/leanprover/lean4checker) · [Carcara, 2026](https://github.com/ufmg-smite/carcara)

### GAP-VER-03 — Ασυμφωνία στον αριθμό CMP (76 έναντι 75)

*σήμερα*

Το spine δηλώνει «COMPONENTS (76)» και απαριθμεί 75 (KRN 12, COG 11, AEO 6, CCP 7, LAW 12, CIV 6, FRG 5, ADV 3, KNW 5, GOV 1, HUM 2, OPS 4, MDL 1)· ο πίνακας §6.3 έχει 75 γραμμές CMP· η γρ. 580 του master γράφει «76 components (… 17 εγκάρσια)» ενώ τα εγκάρσια είναι 16. Το 29.md αναθέτει στο VT-901 να επαληθεύσει «76 CMP».

**Γιατί μετρά:** Το model gate, το μόνο έγκυρο τεκμήριο «0 ορφανών», ή θα αποτύχει ή θα ελέγχει κάτι που δεν υπάρχει.

**Τι δείχνει το ανώτερο:** Καταμέτρηση με ερώτημα πάνω στο SysML v2 model (API ή headless CLI), όχι με δηλωμένο αριθμό.

**Πηγές:** [Syside, 2026](https://sensmetry.com/syside/)

### GAP-VER-04 — Η πιστότητα του DST μετριέται αφού έχει ήδη χρησιμοποιηθεί

*πείραμα*

Το EXP-12 είναι στο GP-6, ενώ ο DST αποφασίζει για την αρχιτεκτονική από το GP-0 (31.md P4, 24.md κανόνας 2).

**Γιατί μετρά:** Αποφάσεις έξι φάσεων στηρίζονται σε προσομοιωτή που δεν έχει επικυρωθεί.

**Τι δείχνει το ανώτερο:** Μέτρηση recall με mutation και Twins-style σενάρια πριν ο προσομοιωτής χρησιμοποιηθεί για αποφάσεις.

**Πηγές:** [Twins, 2022](https://arxiv.org/abs/2004.10617) · [Practical Mutation Testing at Scale, 2021](https://arxiv.org/abs/2102.11378)

### GAP-VER-05 — Proof objects χωρίς ανεξάρτητο έλεγχο

*σήμερα*

Το §8.7 ορίζει για SMT «model ή unsat core + solver version» και για formal proof «hash proof term + checker version». Ανεξάρτητος επανέλεγχος δεν προβλέπεται.

**Γιατί μετρά:** Το INV-C03 γίνεται εμπιστοσύνη σε έναν solver ή kernel, όχι ελέγξιμη απόδειξη.

**Τι δείχνει το ανώτερο:** cvc5 → Alethe με Carcara, ή lean-smt· για Lean: leanchecker και εξωτερικοί checkers (lean4lean, nanoda_lib).

**Πηγές:** [Carcara, 2026](https://github.com/ufmg-smite/carcara) · [lean4lean, 2026](https://github.com/digama0/lean4lean) · [nanoda_lib, 2026](https://github.com/ammkrn/nanoda_lib)

### GAP-VER-06 — Καμία επαλήθευση στο επίπεδο κώδικα για τον Rust TCB

*πείραμα*

Το πρόχειρο στηρίζεται σε Lean model και differential testing (VT-505). Code-level εργαλεία δεν αναφέρονται: Kani (UB, panics, contracts), Aeneas ή Verus (λειτουργική ορθότητα).

**Γιατί μετρά:** Το DRT δεν είναι απόδειξη· για ledger, merkle και canonicalization (Tier-0) το χάσμα model/κώδικα μένει.

**Τι δείχνει το ανώτερο:** Kani σε unsafe κώδικα και panics (κύριο εργαλείο του verify-rust-std)· Aeneas→Lean σε επιλεγμένα safe modules, την προσέγγιση που ανακοίνωσε η Microsoft για το SymCrypt σε Rust (6/2025).

**Πηγές:** [Kani, 2026](https://github.com/model-checking/kani) · [verify-rust-std, 2026](https://github.com/model-checking/verify-rust-std) · [Rewriting SymCrypt in Rust, 2025](https://www.microsoft.com/en-us/research/blog/rewriting-symcrypt-in-rust-to-modernize-microsofts-cryptographic-library/)

### GAP-VER-07 — Κανένας έλεγχος ότι οι προδιαγραφές δεν είναι κενές ή λάθος

*πείραμα*

Δεν υπάρχει μηχανισμός που να δείχνει ότι οι ιδιότητες TLA+, Alloy και Lean δεν ικανοποιούνται τετριμμένα, ούτε ότι οι σημαντικές καταστάσεις όντως επισκέπτονται. Το VT-504 αφορά μόνο tests.

**Γιατί μετρά:** Μια κενή ιδιότητα περνά πάντα. Όταν τη spec τη γράφει LLM, η ορθότητά της είναι χαμηλή (VERINA: 52.3% σε soundness/completeness).

**Τι δείχνει το ανώτερο:** Assertions τύπου sometimes/reachable ώστε να αποδεικνύεται ότι το σενάριο εξερευνήθηκε· seeded mutants στις specs· trace validation.

**Πηγές:** [Antithesis assertions, 2026](https://antithesis.com/docs/properties_assertions/assertions/) · [VERINA, 2025](https://arxiv.org/abs/2505.23135)

### GAP-VER-08 — Κανένας συνεχής έλεγχος συμμόρφωσης κατά τη λειτουργία

*σήμερα*

Το VT-109 είναι offline έλεγχος traces. Δεν προβλέπεται συνεχής έλεγχος production logs έναντι των specs μέσω OPS-04.

**Γιατί μετρά:** Η απόκλιση υλοποίησης/spec εμφανίζεται στην παραγωγή μετά την αποδοχή.

**Τι δείχνει το ανώτερο:** PObserve: δομημένα service logs ελέγχονται έναντι P specifications· το trace validation μπαίνει σε CI, όπως στο CCF.

**Πηγές:** [P framework, 2026](https://p-org.github.io/P/) · [Smart Casual Verification of CCF, 2024](https://arxiv.org/abs/2406.17455)

### GAP-VER-09 — Μη-ντετερμινισμός του LLM μέσα στο DST και στο replay

*σήμερα*

Το INV-C08 καταγράφει τις εξόδους μοντέλων ως γεγονότα, αλλά το ICD-26 δεν ορίζει πώς αντιμετωπίζονται τα γνωσιακά όργανα στην προσομοίωση: replay από Inference Receipts, stubs ή ντετερμινιστικό inference.

**Γιατί μετρά:** Χωρίς αυτό τα VT-602 και VT-604 με πραγματικά γνωσιακά όργανα δεν αναπαράγονται· σε hermetic υπόστρωμα (Antithesis) εξωτερικό inference δεν είναι καν διαθέσιμο.

**Τι δείχνει το ανώτερο:** Record/replay από receipts· batch-invariant kernels για ντετερμινιστικό inference (1.6× έως 2.1× επιβράδυνση).

**Πηγές:** [Defeating Nondeterminism in LLM Inference, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/) · [Antithesis getting started, 2026](https://antithesis.com/docs/getting_started/)

### GAP-VER-10 — Overfitting από την επαναχρησιμοποίηση σφραγισμένων συνόλων

*σήμερα*

Το KT-15 επαναλαμβάνεται σε κάθε φάση ως ratchet πάνω σε σφραγισμένο σύνολο, χωρίς πολιτική για το πόσες φορές μπορεί να χρησιμοποιηθεί.

**Γιατί μετρά:** Η μετρούμενη ανωτερότητα φουσκώνει σταδιακά, αντίθετα με το Prediction Doctrine και την τίμια άγνοια.

**Τι δείχνει το ανώτερο:** Reusable holdout με budget ερωτημάτων, και νέα σύνολα ανά περίοδο.

**Πηγές:** [Generalization in Adaptive Data Analysis and Holdout Reuse, 2015](https://arxiv.org/abs/1506.02629) · [LiveBench, 2025](https://arxiv.org/abs/2406.19314)

### GAP-VER-11 — Κανένα σχέδιο στατιστικής ανάλυσης για τα KT

*σήμερα*

Ο κανόνας 1 του 24.md ζητά προκαταχώριση κατωφλίων, αλλά δεν ορίζει ελάχιστο ενδιαφέρον μέγεθος επίδρασης, power, paired ή clustered ανάλυση, ούτε διόρθωση πολλαπλών συγκρίσεων.

**Γιατί μετρά:** Τα KT-14, KT-15 και KT-24 μπορούν να περάσουν ή να αποτύχουν από θόρυβο.

**Τι δείχνει το ανώτερο:** Statistical analysis plan κατά Miller (2024)· σύγκριση με κοινή αποτίμηση κόστους κατά Kapoor et al. (2024).

**Πηγές:** [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640) · [AI Agents That Matter, 2024](https://arxiv.org/abs/2407.01502)

### GAP-VER-12 — Χωρίς ρόλο για AI στη σύνταξη αποδείξεων και προδιαγραφών

*πείραμα*

Το πρόχειρο δεν προβλέπει LLM που προτείνουν proofs, invariants και specs με μηχανικό checker ως κριτή, κάτι που ταιριάζει στο ADR-0005.

**Γιατί μετρά:** Το κόστος των Lean αποδείξεων (VT-301, VT-302, VT-303, VT-304, VT-305, VT-306, VT-307) και των TLAPS αποδείξεων (VT-107, VT-108) είναι ο κύριος κίνδυνος για το χρονοδιάγραμμα του GP-0.

**Τι δείχνει το ανώτερο:** AutoVerus (>90% σε 150 εργασίες)· vericoding (Dafny 82%, Verus 44%, Lean 27%)· Specula (research prototype: TLA+ από κώδικα με trace validation). Η spec μένει ευθύνη ανθρώπου.

**Πηγές:** [AutoVerus, 2025](https://arxiv.org/abs/2409.13082) · [A benchmark for vericoding, 2025](https://arxiv.org/abs/2509.22908) · [GenAI-accelerated TLA+ Challenge, 2025](https://foundation.tlapl.us/challenge/index.html)

### GAP-VER-13 — Εργαλεία για τα όργανα σε BEAM και Common Lisp

*πείραμα*

Το ADR-0013 επιλέγει supervision σε BEAM και το ADR-0012 όργανα σε Common Lisp, αλλά κανένα VT δεν ονομάζει εργαλεία συστηματικού testing γι' αυτά.

**Γιατί μετρά:** Τα VT-501 έως VT-506 και οι καμπάνιες DST καλύπτουν στην πράξη μόνο τα όργανα σε Rust.

**Τι δείχνει το ανώτερο:** Concuerror (stateless model checking για Erlang, με ανεπιβεβαίωτη συμβατότητα με τρέχον OTP) και PropEr stateful· σε επίπεδο συστήματος Antithesis, Shadow (χωρίς ντετερμινιστικό thread scheduling by default) ή Hermit (maintenance mode). Για Common Lisp δεν βρέθηκε αντίστοιχο εργαλείο.

**Πηγές:** [Concuerror, 2023](https://github.com/parapluu/Concuerror) · [PropEr, 2026](https://github.com/proper-testing/proper) · [Shadow limitations, 2026](https://shadow.github.io/docs/guide/limitations.html)

## Δεν ξέρω

- Δεν ξέρω αν το Antithesis προσφέρει on-prem ή sovereign εγκατάσταση, το κόστος του, το throughput του ή αν τα seeds αναπαράγονται εκτός της πλατφόρμας του· η τεκμηρίωση δεν το λέει.
- Το πλήρες κείμενο του CACM 2025 «Systems Correctness Practices at AWS» (HTTP 403) δεν διαβάστηκε· ο ισχυρισμός για τις υπηρεσίες AWS στηρίζεται στη σελίδα case studies του P.
- Δεν τεκμηριώθηκε ποιες θεωρίες καλύπτουν οι αποδείξεις του cvc5 και ο έλεγχος του Carcara (strings, datatypes, NIA), ούτε ποιοι solvers πέραν του cvc5 παράγουν Alethe που δέχεται το Carcara· άρα αν καλύπτονται τα VT-401, VT-402, VT-403.
- Δεν βρέθηκε trace-validation instrumentation για Common Lisp ή Elixir, ούτε εργαλείο συστηματικού concurrency testing για Common Lisp.
- Δεν βρέθηκε επικυρωμένο μέτρο χαρακτηρολογικής συνέχειας για το VT-703.
- Δεν βρέθηκε ποσοτικό recall του DST σε seeded σφάλματα πρωτοκόλλων πέρα από το Twins· εργαλεία Byzantine fuzzing (π.χ. ByzzFuzz) δεν ελέγχθηκαν.
- Το εύρημα Knight & Leveson 1986 επαληθεύτηκε μόνο από δευτερογενή πηγή.
- Δεν τεκμηριώθηκε αν τα canary strings είναι αποτελεσματικά κατά του contamination.
- Το README του SysON δεν τεκμηριώνει υποστήριξη verification cases (VerdictKind), satisfy/verify ή headless validation σε CI.
- Δεν επαληθεύονται από εδώ οι υπάρχουσες έδρες του άλλου repo που επικαλείται το πρόχειρο (deployment/verify vectors, --capability-gate, Ω+7, [0093]).
- Δεν ορίζεται πουθενά στο πρόχειρο τι είναι το «KRN-12 deterministic mode» (αναφέρεται μόνο στο 19.md, INV-C08).
- Δεν ελέγχθηκε αν το Shadow λειτουργεί με τα runtimes SBCL και BEAM.
- Το venue (SEFM) του paper για trace validation, η σύνταξη του FizzBee και το έτος κυκλοφορίας της TLC 1.7.4 δεν επαληθεύτηκαν από τις σελίδες που άνοιξαν.
- Ο προϋπολογισμός WebSearch της συνεδρίας εξαντλήθηκε· οι έλεγχοι «holds» έγιναν με στοχευμένα WebFetch, και νεότερα εργαλεία 2025–2026 μπορεί να λείπουν.

## Τι διόρθωσε ο ανεξάρτητος ελεγκτής

Πηγές που άνοιξε: 98 · δεν στέκονταν: 24 · διορθώσεις: 17

- **CMP-OPS-02:** superior-exists → gap· confidence high· αφαιρέθηκε ο ισχυρισμός «πριν από κώδικα: TLA+ αντί Rust stubs» — Καμία λύση ντετερμινισμού ολόκληρου συστήματος δεν κυριαρχεί αυστηρά (Antithesis managed/hermetic χωρίς on-prem, Shadow χωρίς ντετερμινιστικό thread scheduling, Hermit σε maintenance mode)· το κενό είναι ότι το πρόχειρο δεν ορίζει τον ντετερμινισμό των μη-Rust οργάνων
- **KT-24:** superior-exists → gap· confidence low → medium — Το κενό των αλληλεπιδράσεων είναι λογικό επιχείρημα· η λύση Shapley τεκμηριώνεται μόνο αναλογικά και η πηγή δεν συγκρίνει με leave-one-out
- **KT-14:** classification experiment → today· draft_position «σκοτώνεται ή επανασχεδιάζεται», GP-4 — Το statistical analysis plan είναι ώριμη μεθοδολογία· ακριβέστερη απόδοση του 24.md
- **draft_points (ψευδο-IDs VT-0nn, VT-1xx … VT-9xx):** Ανάπτυξη σε μεμονωμένα IDs (VT-001 … VT-032 ένα-ένα, VT-101 κ.λπ.)· το ίδιο στα affects_ids των decisions — Κανόνας 7: IDs ένα-ένα, ποτέ εύρος ή επινοημένο ID
- **summary:** Τρία σημεία superior-exists (όχι έξι)· καταγραφή υποβιβασμών και διορθώσεων — Το αρχικό summary μετρούσε ως superior και το holdout reuse (REQ-VAL-001, holds)
- **SOTA-VER-01, SOTA-VER-02, SOTA-VER-10, VT-101…VT-109:** TLC 1.8.0 pre-release· Apalache για σταθερές ή φραγμένες παραμέτρους· trace validation σε Go και Rust· CAV 2026 επαληθεύτηκε — Επαλήθευση πηγών
- **SOTA-VER-06, VT-301…VT-307, GAP-VER-05, DEC-VER-04:** Προστέθηκαν nanoda_lib και `lake check`· επιφύλαξη για lean4lean — Roadmap Lean FRO και README lean4lean
- **SOTA-VER-08, VT-401…VT-404:** Αφαιρέθηκε το veriT· προστέθηκαν holes του lean-smt και πιθανή μη-απόφαση του cvc5 ως trade-off — README του lean-smt και του Carcara
- **SOTA-VER-12, ICD-26, GAP-VER-09, GAP-VER-13, DEC-VER-01:** Antithesis hermetic/managed· Shadow limitations· Hermit ελέγχει scheduling· νέα εναλλακτική Hermit και συμβόλαιο ντετερμινισμού οργάνων — Τεκμηρίωση Antithesis, Shadow, Hermit
- **SOTA-VER-21, REQ-VAL-004:** Προστέθηκε adaptive conformal inference· exchangeability τεκμηριωμένη από πλήρες κείμενο — Η χρονική ένσταση απαντάται μερικώς από το ACI
- **SOTA-VER-19, VT-701…VT-707:** GDPval: blind pairwise από ειδικούς με ατελή τύφλωση· αφαιρέθηκε το σχετικό unknown — Πλήρες κείμενο GDPval
- **VT-901…VT-905, GAP-VER-03:** Προστέθηκε η γρ. 580 του master («17 εγκάρσια» αντί 16) και ότι το §23 δεν γράφτηκε — Ανάγνωση master
- **GAP-VER-02:** Περιορισμός στο παρόν repo· παραπομπή σε Παράρτημα Ω (Ω4, Ω5 ΕΚΚΡΕΜΕΙ)· μη επαληθεύσιμο για το άλλο repo — Το spine ορίζει package root στο STAVROPOULOSLAWCORPUS, που δεν ανοίγεται
- **ICD-26:** Η σύζευξη ghost worlds και test harness διατυπώνεται ως σχεδιαστικό ερώτημα, όχι ως παραβίαση «μίας έδρας» — Δεν τεκμηριώνεται ως σφάλμα· το COG-07 έχει ρητό μέτρο (χωρίς commit capability)
- **DEC-VER-02:** Διορθώθηκαν τα cons του P (έχει PObserve και PVerifier)· προστέθηκε το Veil· «χωρίς TLAPS» για Quint → «δεν τεκμηριώθηκε» — Δίκαιη παρουσίαση εναλλακτικών
- **SOTA-VER-26:** Νέο στοιχείο: Veil — Εναλλακτική μίας έδρας που έλειπε από την έρευνα
- **CMP-OPS-03, ICD-27:** Το draft_position περιλαμβάνει και τις πράξεις του ICD-27 — Το σημείο κάλυπτε δύο IDs αλλά απέδιδε μόνο το CMP-OPS-03
