# Verification toolchain — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### TLA+ εργαλεία: TLC, Apalache, TLAPS (TLA+ Foundation)

*tool, production* · SOTA-VER-01

Σταθερή TLC 1.7.4 (διόρθωσε unsoundness στο liveness checking με πολλούς workers)· η 1.8.0 διανέμεται ως pre-release· το Toolbox δεν συντηρείται πια (σύσταση: VS Code extension ή CLI). Το Apalache (symbolic, SMT) πέρασε στο TLA+ Foundation υπό το Linux Foundation· paper CAV 2026 με case studies σε Byzantine consensus και υιοθέτηση σε AWS, Microsoft, MongoDB, NVIDIA. TLAPS 1.6.0-pre (rolling) με backends Zenon, Isabelle, SMT, LS4.

**Για το GRAIL:** Έδρα των VT-101, VT-102, VT-103, VT-104, VT-105, VT-106, VT-107, VT-108. Η διόρθωση soundness της 1.7.4 δείχνει ότι η έκδοση του εργαλείου πρέπει να μπαίνει στο evidence.

**Πηγές:** [tlaplus/tlaplus releases, 2026](https://github.com/tlaplus/tlaplus/releases) · [tlaplus v1.7.4 release, 2026](https://github.com/tlaplus/tlaplus/releases/tag/v1.7.4) · [apalache-mc/apalache, 2026](https://github.com/apalache-mc/apalache) · [The TLA+ Model Checker Apalache (CAV 2026), 2026](https://link.springer.com/chapter/10.1007/978-3-032-32519-8_8) · [tlaplus/tlapm, 2026](https://github.com/tlaplus/tlapm)

### Trace validation υλοποιήσεων έναντι TLA+

*research, production* · SOTA-VER-02

Ο έλεγχος ανάγεται σε constrained model checking με TLC πάνω σε traces που περιέχουν μόνο updates (ή υποσύνολο) μεταβλητών· βρήκε αποκλίσεις spec/υλοποίησης σε όλα τα προγράμματα που δοκιμάστηκαν· API instrumentation για Java. Στο CCF (C++) η smart casual verification μπήκε στο CI και βρήκε 6 bugs πριν την παραγωγή. Το Specula (1ο βραβείο GenAI-accelerated TLA+ Challenge 2025) παράγει TLA+ από κώδικα με LLM και control-flow analysis και ευθυγραμμίζει με trace validation (etcd Raft σε Go, Asterinas SpinLock σε Rust).

**Για το GRAIL:** Αυτό είναι το VT-109 και η γέφυρα sim/real του CMP-OPS-02. Τεκμηριωμένο instrumentation: Java, C++ (production), Go και Rust (Specula, research prototype)· για Common Lisp και Elixir δεν βρέθηκε.

**Πηγές:** [Validating Traces of Distributed Programs Against TLA+ Specifications, 2024](https://arxiv.org/abs/2404.16075) · [Smart Casual Verification of the Confidential Consortium Framework (NSDI 2025), 2024](https://arxiv.org/abs/2406.17455) · [GenAI-accelerated TLA+ Challenge, 2025](https://foundation.tlapl.us/challenge/index.html)

### P language: PChecker, PObserve, PVerifier (AWS)

*tool, production* · SOTA-VER-03

Communicating state machines· το PChecker εξερευνά συστηματικά interleavings μηνυμάτων και σφάλματα με αναπαραγώγιμα error traces· το PObserve ελέγχει δομημένα service logs έναντι P specifications· το PVerifier δίνει αποδείξεις με lemmas. Σε χρήση στην AWS από το 2019 (S3, EBS, DynamoDB, MemoryDB, Aurora, EC2, IoT), κατά τη σελίδα case studies που παραπέμπει σε άρθρο CACM 2025. MIT.

**Για το GRAIL:** Εναλλακτική έδρα προδιαγραφής πρωτοκόλλων με ενσωματωμένο runtime conformance από logs, που λείπει από το πρόχειρο (GAP-VER-08).

**Πηγές:** [P case studies, 2025](https://p-org.github.io/P/casestudies/) · [P framework, 2026](https://p-org.github.io/P/)

### Quint και FizzBee (specs φιλικά προς μηχανικούς, με MBT)

*tool, pilot* · SOTA-VER-04

Το Quint (Informal Systems) είναι εναλλακτική σύνταξη για TLA, με simulator, symbolic model checking μέσω Apalache και Quint Connect (MBT σε Rust με replay παραγόμενων traces). Το FizzBee (Apache-2.0) είναι γλώσσα προδιαγραφής με model checker και υποστήριξη MBT μέσω adapters σε Go· η σύνταξή του δεν επαληθεύτηκε εδώ.

**Για το GRAIL:** Κάνουν το VT-502 (MBT) εκτελέσιμο· δεύτερη γλώσσα προδιαγραφής δίπλα στο TLA+ συγκρούεται με το «μία έδρα» (DEC-VER-02).

**Πηγές:** [informalsystems/quint, 2026](https://github.com/informalsystems/quint) · [fizzbee-io/fizzbee, 2026](https://github.com/fizzbee-io/fizzbee)

### Verification-guided development (Cedar)

*system, production* · SOTA-VER-05

Εκτελέσιμο model σε Lean με αποδείξεις, παραγωγικός κώδικας σε Rust, differential random testing (DRT) model↔Rust με εκατομμύρια εισόδους κάθε νύχτα, και PBT. Οι αποδείξεις βρήκαν 4 bugs, DRT και PBT άλλα 21. Το Lean αποτιμά μία είσοδο DRT σε 5 µs (η Rust σε 7 µs)· έλεγχος όλων των αποδείξεων και compile των models σε 185 s· η απόδειξη soundness του validator κόστισε 18 person-days.

**Για το GRAIL:** Άμεσο προηγούμενο για το P2 (Lean reference semantics), το VT-505 και το EXP-18.

**Πηγές:** [How We Built Cedar: A Verification-Guided Approach, 2024](https://arxiv.org/abs/2407.01688) · [Lean Into Verified Software Development (AWS), 2024](https://aws.amazon.com/blogs/opensource/lean-into-verified-software-development/) · [cedar-spec, 2026](https://github.com/cedar-policy/cedar-spec) · [Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization, 2024](https://arxiv.org/abs/2403.04651)

### Lean 4, Lean FRO και ανεξάρτητοι kernel checkers

*tool, production* · SOTA-VER-06

Roadmap Y4-1 (Σεπ. 2026 – Φεβ. 2027): νέο do notation με first-class intrinsic verification, verification-condition generator, grind και bv_decide, βελτιώσεις compiler, και `lake check` ώστε ο εξωτερικός έλεγχος kernel να γίνει ρουτίνα (με εναλλακτικούς checkers, π.χ. nanoda). Το leanchecker διανέμεται με κάθε toolchain από το v4.28.0 (replay δηλώσεων στον kernel). Το lean4lean είναι kernel σε Lean που λειτουργεί ως εξωτερικός checker και έχει βρει kernel bugs, αλλά είναι παράγωγο του C++ kernel· το nanoda_lib είναι εξωτερικός type checker σε Rust.

**Για το GRAIL:** Αφορά τα VT-301, VT-302, VT-303, VT-304, VT-305, VT-306, VT-307 και το proof object του §8.7: υπάρχουν checkers για ανεξάρτητο επανέλεγχο.

**Πηγές:** [Lean FRO Roadmap Y4-1, 2026](https://lean-lang.org/fro/roadmap/y4-1/) · [lean4checker (deprecated; merged as leanchecker), 2026](https://github.com/leanprover/lean4checker) · [lean4lean, 2026](https://github.com/digama0/lean4lean) · [nanoda_lib, 2026](https://github.com/ammkrn/nanoda_lib)

### Επαλήθευση κώδικα Rust: Aeneas, Verus, Kani

*tool, pilot* · SOTA-VER-07

Το Aeneas μεταφράζει safe Rust (μέσω Charon) σε Lean, HOL4, Coq, F* (ωριμότερα Lean και HOL4)· δεν υποστηρίζει ακόμη unsafe ούτε concurrency. Η Microsoft ανακοίνωσε (6/2025) ότι στηρίζεται στο Aeneas για την επαλήθευση της αναγραφής του SymCrypt σε Rust· διαθέσιμο προκαταρκτικό ML-KEM σε preview branch. Το Verus (SMT-based) δηλώνει «under active development». Το Kani (bit-precise model checker) ελέγχει UB, panics, overflows, assertions και function contracts· είναι το κύριο εργαλείο του verify-rust-std (πρόκληση επαλήθευσης της Rust std με υποστήριξη του Rust Foundation).

**Για το GRAIL:** Κλείνει το κενό «αποδείξαμε το model, όχι τον Rust TCB» (ADR-0012), που σήμερα καλύπτει μόνο το DRT.

**Πηγές:** [AeneasVerif/aeneas, 2026](https://github.com/AeneasVerif/aeneas) · [Rewriting SymCrypt in Rust, 2025](https://www.microsoft.com/en-us/research/blog/rewriting-symcrypt-in-rust-to-modernize-microsofts-cryptographic-library/) · [verus-lang/verus, 2026](https://github.com/verus-lang/verus) · [model-checking/kani, 2026](https://github.com/model-checking/kani) · [verify-rust-std, 2026](https://github.com/model-checking/verify-rust-std)

### SMT με ελέγξιμες αποδείξεις: cvc5 → Alethe/LFSC/CPC, Carcara, lean-smt

*tool, pilot* · SOTA-VER-08

Το cvc5 εξάγει αποδείξεις σε CPC, Alethe και LFSC· το Carcara (TACAS 2023) είναι ανεξάρτητος checker και elaborator αποδείξεων Alethe· το lean-smt στέλνει goals στο cvc5 και ξαναπαίζει την απόδειξη στο Lean (beta· UF, LIA/LRA με quantifiers· bitvectors πειραματικά· οι αποδείξεις του cvc5 μπορεί να έχουν holes που μένουν ως Lean goals). Τρέχων Z3: 5.1.0 (16/8/2026).

**Για το GRAIL:** Αντικαθιστά το «unsat core + solver version» του §8.7 με πιστοποιητικό που ελέγχεται ανεξάρτητα (INV-C03). Η κάλυψη θεωριών δεν τεκμηριώθηκε.

**Πηγές:** [cvc5 proofs, 2026](https://cvc5.github.io/docs/latest/proofs/proofs.html) · [Carcara, 2026](https://github.com/ufmg-smite/carcara) · [lean-smt, 2026](https://github.com/ufmg-smite/lean-smt) · [Z3 releases, 2026](https://github.com/Z3Prover/z3/releases)

### Alloy 6

*tool, production* · SOTA-VER-09

Alloy 6.2.0 (9/1/2025): mutable state και traces, CLI και ενσωματωμένος LSP server.

**Για το GRAIL:** Έδρα των VT-201, VT-202, VT-203, VT-204, VT-205.

**Πηγές:** [Alloy releases, 2025](https://github.com/AlloyTools/org.alloytools.alloy/releases)

### Επαλήθευση πρωτοκόλλων για κάθε n: TLAPS, Ivy· όρια του Apalache

*tool, pilot* · SOTA-VER-10

Το Apalache ελέγχει inductive invariants (IndInit/IndNext) «για σταθερές ή φραγμένες παραμέτρους»· το bounded MC χαρακτηρίζεται «incomplete». Για αυθαίρετο n χρειάζεται απόδειξη: TLAPS (ήδη στο πρόχειρο για VT-107, VT-108) ή Ivy, research tool για διαδραστική ανάπτυξη πρωτοκόλλων και αποδείξεων, με inductive invariants, αναγωγή σε decidable logics και παραδείγματα parameterized systems.

**Για το GRAIL:** Το VT-104 (n ≥ 3f+1) με TLC ή Apalache για σταθερό n δεν αποδεικνύει το INV-K06 για κάθε n.

**Πηγές:** [Apalache running docs, 2026](https://apalache-mc.org/docs/apalache/running.html) · [apalache-mc/apalache, 2026](https://github.com/apalache-mc/apalache) · [kenmcmil/ivy, 2026](https://github.com/kenmcmil/ivy) · [IVy documentation, 2026](https://microsoft.github.io/ivy/)

### In-process DST: FoundationDB, TigerBeetle VOPR, madsim, turmoil, Shuttle

*system, production* · SOTA-VER-11

Το FoundationDB προσομοιώνει ντετερμινιστικά ολόκληρο cluster σε μία single-threaded διεργασία· εκτιμά περίπου ένα τρισεκατομμύριο CPU-hours simulation. Το VOPR κάνει stub σε clock, network και disk, με αναπαραγωγή από seed και Git commit. Το madsim αντικαθιστά το tokio runtime με simulator («όλο το I/O πρέπει να γίνει mock»· παρέχει simulated εκδόσεις για tokio, tonic κ.ά.). Το turmoil τρέχει πολλούς hosts σε ένα thread με simulated δίκτυο και filesystem. Το Shuttle κάνει randomized concurrency testing (PCT)· είναι unsound, αλλά κλιμακώνεται σε πολύ μεγαλύτερα tests από το Loom.

**Για το GRAIL:** Σημερινή πρακτική για τα όργανα σε Rust του CMP-OPS-02· δεν καλύπτει όργανα σε άλλες γλώσσες.

**Πηγές:** [FoundationDB simulation testing, 2026](https://apple.github.io/foundationdb/testing.html) · [TigerBeetle VOPR, 2026](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/internals/vopr.md) · [madsim, 2026](https://github.com/madsim-rs/madsim) · [turmoil, 2026](https://github.com/tokio-rs/turmoil) · [awslabs/shuttle, 2026](https://github.com/awslabs/shuttle)

### Ντετερμινισμός ολόκληρου συστήματος: Antithesis, Shadow, Hermit

*system, production* · SOTA-VER-12

Antithesis: πλήρως ντετερμινιστικό περιβάλλον μέσω δικού τους hypervisor (Determinator)· τρέχει containerized λογισμικό (Docker Compose ή Kubernetes) χωρίς αλλαγές κώδικα, με fault injection, RL guidance και SDKs για assertions always, sometimes, reachable, unreachable, alwaysOrUnreachable· hermetic, χωρίς πρόσβαση στο internet· πρόσβαση με credentials και registry· δεν βρέθηκε δηλωμένη on-prem λύση. Shadow: real, unmodified binaries ως διεργασίες Linux πάνω σε ντετερμινιστικό simulated network (open source)· δεν ελέγχει ντετερμινιστικά το thread scheduling by default και δεν υποστηρίζει static binaries (LD_PRELOAD). Hermit: ελέγχει thread scheduling, χρόνο και τυχαιότητα σε unmodified binaries, αλλά είναι σε maintenance mode με περίπου 3–6× overhead.

**Για το GRAIL:** Οι μόνες τεκμηριωμένες επιλογές για ντετερμινισμό οργάνων σε SBCL, BEAM ή Python χωρίς αναγραφή του I/O· καμία δεν καλύπτει όλα τα κριτήρια (DEC-VER-01). Το hermetic περιβάλλον αποκλείει κλήσεις σε εξωτερικούς παρόχους inference, άρα τα γνωσιακά όργανα θέλουν replay ή stubs σε κάθε περίπτωση.

**Πηγές:** [How Antithesis works, 2026](https://antithesis.com/docs/introduction/how_antithesis_works/) · [Antithesis deterministic hypervisor, 2024](https://antithesis.com/blog/deterministic_hypervisor/) · [Antithesis assertions, 2026](https://antithesis.com/docs/properties_assertions/assertions/) · [Antithesis getting started, 2026](https://antithesis.com/docs/getting_started/) · [Shadow, 2026](https://shadow.github.io/) · [Shadow limitations, 2026](https://shadow.github.io/docs/guide/limitations.html) · [Hermit, 2026](https://github.com/facebookexperimental/hermit)

### Twins: παραγωγή Byzantine σεναρίων για BFT

*research, production* · SOTA-VER-13

Δίδυμα αντίγραφα κόμβων με ίδια credentials παράγουν leader equivocation, double voting και απώλεια εσωτερικής κατάστασης. Στο DiemBFT έτρεχαν 44M σενάρια ημερησίως και τα σκόπιμα injected bugs εκτέθηκαν μέσα σε λεπτά.

**Για το GRAIL:** Εφαρμόζεται άμεσα στο VT-601 και στο HotStuff-family BFT του ADR-0031.

**Πηγές:** [Twins: BFT Systems Made Robust, 2022](https://arxiv.org/abs/2004.10617)

### Σκευή testing: PBT/MBT, fuzzing, mutation, Jepsen

*tool, production* · SOTA-VER-14

Hypothesis stateful (rules, invariants, shrinking)· PropEr (GPL v3, modules για stateful testing)· Concuerror (stateless model checking για Erlang· CI μέχρι Erlang 23.3, copyright ως 2023 — η συμβατότητα με τρέχον OTP δεν επαληθεύτηκε)· OSS-Fuzz (libFuzzer, AFL++, Honggfuzz· C/C++, Rust, Go, Python, Java, JavaScript, Lua· >13.000 ευπάθειες και 50.000 bugs ως 5/2025)· mutation testing σε κλίμακα Google (incremental, στο code review, >24.000 developers)· cargo-mutants («semi-actively-maintained», 8/2026)· Schemathesis (PBT από OpenAPI/GraphQL)· Jepsen (τελευταία ανάλυση 3/2026).

**Για το GRAIL:** Υλοποιούν τα VT-501, VT-502, VT-503, VT-504 και τη σουίτα conformance VT-001 έως VT-032.

**Πηγές:** [Hypothesis stateful, 2026](https://hypothesis.readthedocs.io/en/latest/stateful.html) · [PropEr, 2026](https://github.com/proper-testing/proper) · [Concuerror, 2023](https://github.com/parapluu/Concuerror) · [OSS-Fuzz, 2025](https://github.com/google/oss-fuzz) · [Practical Mutation Testing at Scale, 2021](https://arxiv.org/abs/2102.11378) · [cargo-mutants, 2026](https://github.com/sourcefrog/cargo-mutants) · [Schemathesis, 2026](https://github.com/schemathesis/schemathesis) · [Jepsen analyses, 2026](https://jepsen.io/analyses)

### Ανίχνευση breaking changes και translation validation

*tool, production* · SOTA-VER-15

buf breaking (κατηγορίες FILE, PACKAGE, WIRE_JSON, WIRE)· oasdiff (OpenAPI 3.0, 3.1, 3.2)· Alive2 (translation validation για LLVM με Z3· δεν υποστηρίζει inter-procedural μετασχηματισμούς).

**Για το GRAIL:** Υλοποιούν σήμερα τα VT-902 και VT-404.

**Πηγές:** [buf breaking, 2026](https://buf.build/docs/breaking/) · [oasdiff, 2026](https://github.com/oasdiff/oasdiff) · [Alive2, 2026](https://github.com/AliveToolkit/alive2)

### AI για formal verification (vericoding)

*research, research-prototype* · SOTA-VER-16

DafnyBench: 68% στην παραγωγή hints για Dafny (2024). AutoVerus (OOPSLA 2025): >90% σε 150 εργασίες απόδειξης Verus. VERINA (Lean, 189 εργασίες): code 72.6%, spec soundness/completeness 52.3%, proof 4.9%. Vericoding (12.504 specs): Dafny 82%, Verus/Rust 44%, Lean 27%.

**Για το GRAIL:** Proofs που προτείνει LLM και ελέγχει μηχανικά checker ταιριάζουν στο Propose–Verify–Commit (ADR-0005). Τα χαμηλά ποσοστά σε specs και Lean σημαίνουν ότι spec από LLM δεν είναι αξιόπιστη χωρίς ανθρώπινο έλεγχο.

**Πηγές:** [DafnyBench, 2024](https://arxiv.org/abs/2406.08467) · [AutoVerus, 2025](https://arxiv.org/abs/2409.13082) · [VERINA, 2025](https://arxiv.org/abs/2505.23135) · [A benchmark for vericoding, 2025](https://arxiv.org/abs/2509.22908)

### Evaluation harnesses: Inspect, HELM, lm-evaluation-harness

*tool, production* · SOTA-VER-17

Inspect (UK AI Security Institute και Meridian Labs, MIT): datasets/solvers/scorers, agents και multi-agent primitives, sandboxing σε Docker, Kubernetes, Modal, Proxmox κ.ά., >200 έτοιμα evals· το Hawk του METR είναι χτισμένο πάνω του. HELM (TMLR 2023): 7 μετρικές, μεταξύ τους calibration και efficiency. lm-evaluation-harness (MIT): >60 ακαδημαϊκά benchmarks.

**Για το GRAIL:** Έτοιμο υπόστρωμα για το CMP-OPS-03 και το ICD-27.

**Πηγές:** [Inspect, 2026](https://inspect.aisi.org.uk/) · [inspect_ai, 2026](https://github.com/UKGovernmentBEIS/inspect_ai) · [METR, 2026](https://metr.org/) · [HELM, 2023](https://arxiv.org/abs/2211.09110) · [lm-evaluation-harness, 2026](https://github.com/EleutherAI/lm-evaluation-harness)

### Στατιστική αυστηρότητα και adaptive overfitting

*research, production* · SOTA-VER-18

Error bars για evals (Miller 2024): ερωτήσεις ως δείγμα από super-population, clustered SE, paired συγκρίσεις, power analysis. Reusable holdout (Dwork et al. 2015): επανειλημμένη χρήση holdout με αποδεδειγμένη αποφυγή overfitting. Kapoor et al. (2024): η εστίαση μόνο στην ακρίβεια οδηγεί σε άσκοπα σύνθετα agents· κοινή αποτίμηση κόστους-ακρίβειας· πολλά benchmarks χωρίς επαρκή holdouts. LiveBench (ICLR 2025): νέες ερωτήσεις κάθε μήνα, αντικειμενικό ground truth.

**Για το GRAIL:** Θέτει το μέτρο για τα KT-14, KT-15, KT-24 και το REQ-VAL-001.

**Πηγές:** [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640) · [Generalization in Adaptive Data Analysis and Holdout Reuse, 2015](https://arxiv.org/abs/1506.02629) · [AI Agents That Matter, 2024](https://arxiv.org/abs/2407.01502) · [LiveBench, 2025](https://arxiv.org/abs/2406.19314)

### Μεθοδολογία αξιολόγησης νομικού AI και έργου ειδικών

*research, pilot* · SOTA-VER-19

Preregistered μελέτη: commercial legal AI systems (Harvey-class) για νομική έρευνα κάνουν hallucination στο 17–33%. VLAIR (2/2025): baseline με δικηγόρους, βαθμολόγηση με LLM-as-judge και rubrics. GDPval (2025): εργασίες από επαγγελματίες (μέσος όρος 14 έτη εμπειρίας), blind pairwise σύγκριση από ειδικούς του επαγγέλματος με ατελή τύφλωση (υφολογικές ενδείξεις)· αυτόματος grader 66% συμφωνία έναντι 71% μεταξύ ανθρώπων. Οι LLM judges έχουν position, verbosity και self-enhancement bias.

**Για το GRAIL:** Αφορά το VT-702 (blind panel), το KT-15 και το REQ-VAL-001.

**Πηγές:** [Hallucination-Free? Assessing the Reliability of Leading AI Legal Research Tools, 2024](https://arxiv.org/abs/2405.20362) · [Vals Legal AI Report, 2025](https://www.vals.ai/vlair) · [GDPval, 2025](https://arxiv.org/abs/2510.04374) · [GDPval (full text), 2025](https://arxiv.org/html/2510.04374) · [Judging LLM-as-a-Judge, 2023](https://arxiv.org/abs/2306.05685)

### Adaptive red teaming και άμυνα prompt injection by design

*research, research-prototype* · SOTA-VER-20

Adaptive attacks (gradient, RL, random search, human-guided) παρέκαμψαν 12 πρόσφατες άμυνες, τις περισσότερες με επιτυχία >90%, ενώ οι περισσότερες δήλωναν σχεδόν μηδενική. Το CaMeL εξάγει control και data flow από το trusted query και επιβάλλει capabilities: 77% εργασιών AgentDojo με αποδείξιμη ασφάλεια έναντι 84% χωρίς άμυνα.

**Για το GRAIL:** Τα VT-801 και KT-17 με στατικό σώμα επιθέσεων είναι ανεπαρκή· το INV-S01 συμφωνεί με τον σχεδιασμό του CaMeL.

**Πηγές:** [The Attacker Moves Second, 2025](https://arxiv.org/abs/2510.09023) · [CaMeL: Defeating Prompt Injections by Design, 2025](https://arxiv.org/abs/2503.18813)

### Conformal εγγυήσεις: conformal factuality και adaptive conformal inference

*research, research-prototype* · SOTA-VER-21

Conformal factuality: εγγυήσεις ορθότητας 80–90% με back-off της εξειδίκευσης, με ρητή υπόθεση exchangeability (Theorem 4.1). Adaptive conformal inference: long-run coverage υπό αυθαίρετη distribution shift, χωρίς exchangeability.

**Για το GRAIL:** Αφορά το REQ-VAL-004 και το VT-704. Η χρονική μεταβολή του δικαίου σπάει την exchangeability, αλλά το ACI δίνει μακροχρόνια κάλυψη υπό shift· η εφαρμογή σε ordinal επιστημικούς βαθμούς δεν τεκμηριώθηκε.

**Πηγές:** [Language Models with Conformal Factuality Guarantees, 2024](https://arxiv.org/abs/2402.10978) · [Conformal Factuality (full text), 2024](https://arxiv.org/html/2402.10978) · [Adaptive Conformal Inference Under Distribution Shift, 2021](https://arxiv.org/abs/2106.00170)

### SysML v2: εγγενής ιχνηλασιμότητα και επαλήθευση

*standard, production* · SOTA-VER-22

KerML 1.0, SysML 2.0 και Systems Modeling API 1.0 υιοθετήθηκαν τυπικά από την OMG στις 30/6/2025· η SysML 2.0 εμφανίζεται ως formal 9/2025· editorial ενημέρωση 3/2026 για υποβολή στον ISO. Γλώσσα: `satisfy … by`, `verification def` με subject, objective, `verify` και `out verdict : VerdictKind`. Το Syside (Sensmetry) προσφέρει headless CLI και CI validation στα εμπορικά Modeler/Automator· το Syside Editor είναι δωρεάν.

**Για το GRAIL:** Το VT-901, το REQ-VAL-002 και οι σχέσεις satisfy/verify του §29 εκφράζονται εγγενώς στο model.

**Πηγές:** [OMG SysML specifications, 2025](https://www.omg.org/spec/SysML/) · [SysML-v2-Release, 2026](https://github.com/Systems-Modeling/SysML-v2-Release) · [Verification Case Definition Example, 2026](https://raw.githubusercontent.com/Systems-Modeling/SysML-v2-Release/master/sysml/src/training/34.%20Verification/Verification%20Case%20Definition%20Example.sysml) · [Requirement Satisfaction example, 2026](https://raw.githubusercontent.com/Systems-Modeling/SysML-v2-Release/master/sysml/src/training/32.%20Requirements/Requirement%20Satisfaction.sysml) · [Syside, 2026](https://sensmetry.com/syside/)

### Assurance cases: SACM 2.3, GSN v3, Assurance 2.0

*standard, production* · SOTA-VER-23

SACM 2.3 (OMG, 10/2023): metamodel και γραφική σημειογραφία για claims, arguments, evidence. GSN Community Standard v3 (τρέχουσα έκδοση). Assurance 2.0 (2020): έμφαση στη συλλογιστική και ρητή αναγνώριση defeaters και counterevidence.

**Για το GRAIL:** Προσθέτει στο REQ-VAL-002 αιτιολόγηση και αντιλόγους· ταιριάζει με το Court και το INV-K03.

**Πηγές:** [OMG SACM, 2023](https://www.omg.org/spec/SACM/) · [GSN Standard, 2026](https://scsc.uk/gsn-standard) · [Assurance 2.0: A Manifesto, 2020](https://arxiv.org/abs/2004.10474)

### Ντετερμινιστικό LLM inference (batch-invariant kernels)

*research, pilot* · SOTA-VER-24

Η μη-ντετερμινιστική έξοδος σε temperature 0 οφείλεται κυρίως στη μη-αμεταβλητότητα των kernels ως προς το batch size. Με batch-invariant kernels 1000 από 1000 completions ήταν ταυτόσημα (έναντι 80 διαφορετικών χωρίς), με επιβράδυνση 1.6× (42 s έναντι 26 s) έως 2.1× στη μη βελτιστοποιημένη εκδοχή (9/2025).

**Για το GRAIL:** Αφορά το INV-C08 και το DST με γνωσιακά όργανα: replay από receipts ή ντετερμινιστικό inference.

**Πηγές:** [Defeating Nondeterminism in LLM Inference, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/)

### Όριο ανεξαρτησίας στο N-version programming

*research, production* · SOTA-VER-25

Το πείραμα Knight & Leveson (1986) απέρριψε στατιστικά την υπόθεση ανεξαρτησίας αποτυχιών μεταξύ versions. Η πηγή εδώ είναι δευτερογενής.

**Για το GRAIL:** Το VT-506 δεν τεκμηριώνει ανεξαρτησία· η τεκμηριωμένη χρήση του είναι ως έλεγχος ισοδυναμίας (KT-02).

**Πηγές:** [N-version programming, 2026](https://en.wikipedia.org/wiki/N-version_programming)

### Veil: επαλήθευση transition systems μέσα στο Lean 4

*tool, research-prototype* · SOTA-VER-26

Framework ενσωματωμένο στο Lean 4 για προδιαγραφή, υλοποίηση, testing και απόδειξη safety ιδιοτήτων transition systems με έμφαση σε κατανεμημένα πρωτόκολλα (liveness «στο μέλλον»): push-button επαλήθευση σε decidable fragments πρώτης τάξης, model checking, interactive proofs. Veil 2.0 σε pre-release.

**Για το GRAIL:** Εναλλακτική που θα ένωνε προδιαγραφή πρωτοκόλλων και Lean reference semantics (P2) σε μία έδρα· όχι αυστηρά ανώτερο του TLA+ σήμερα (pre-release, χωρίς liveness).

**Πηγές:** [verse-lab/veil, 2026](https://github.com/verse-lab/veil)
