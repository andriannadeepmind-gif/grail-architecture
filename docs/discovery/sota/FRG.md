# Forge γλωσσών / compilers — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### Catala (rules-as-code DSL, default logic)

*system, pilot* · SOTA-FRG-01

DSL για νόμους πάνω σε default logic («definition-under-conditions», κατά Lawsky), με literate programming άρθρο-άρθρο πάνω στο κείμενο του νόμου. Formal semantics· τα core βήματα compilation αποδείχθηκαν σε F* (2021). Μεταγλωττίζει σε Python ή C (κατά το Catala book)· σύνταξη γαλλική και αγγλική· Apache-2.0. Εκδόσεις: v1.0.0 (10/11/2025, «first stable release»), 1.1.0 (29/01/2026), 1.2.0 (02/06/2026), 1.2.1 (06/07/2026)· nightly 22/08/2026.

**Για το GRAIL:** Άμεσος ανταγωνιστής και υποψήφια βάση της LexDSL, με ενεργή συντήρηση. Στην αξιολόγηση του 2021 αποκάλυψε bug στην επίσημη υλοποίηση των γαλλικών οικογενειακών επιδομάτων. Η παραγωγική χρήση από διοικήσεις (DGFiP/CNAF) δεν επαληθεύτηκε, γιατί η σελίδα της Inria μπλόκαρε την πρόσβαση.

**Πηγές:** [Catala: A Programming Language for the Law (arXiv 2103.03198), 2021](https://arxiv.org/abs/2103.03198) · [Catala: a programming language for the law (PACMPL ICFP, Crossref metadata), 2021](https://api.crossref.org/works/10.1145/3473582) · [CatalaLang/catala releases (GitHub API, dates), 2026](https://api.github.com/repos/CatalaLang/catala/releases?per_page=15) · [CatalaLang/catala README, 2026 (accessed)](https://github.com/CatalaLang/catala) · [The Catala book — Introduction, 2026 (accessed)](https://book.catala-lang.org/en/index.html)

### L4 (Legalese, πρώην SMU CCLAW) και Blawx (s(CASP))

*system, research-prototype* · SOTA-FRG-02

L4: DSL νόμου και συμβάσεων με Haskell core (parser, typechecker, evaluator), REST decision service, VS Code/LSP, REPL και ίχνη αξιολόγησης σε GraphViz. Το repo συνεχίζεται στο legalese/l4-ide, και το README αναφέρει pilots σε δημόσιο και ιδιωτικό τομέα. Blawx: rules-as-code σε SWI-Prolog/s(CASP) με εξηγήσεις και hypothetical reasoning· κατά το README, «not production-quality software», για εκπαιδευτική και πειραματική χρήση.

**Για το GRAIL:** Δείχνουν ότι explanation traces και LSP είναι πλέον βασικές ιδιότητες νομικού DSL. Η παραγωγική κλίμακα και των δύο δεν τεκμηριώθηκε· για το L4 υπάρχουν μόνο pilots.

**Πηγές:** [smucclaw/l4-ide (continued at legalese/l4-ide), 2026 (accessed)](https://github.com/smucclaw/l4-ide) · [Lexpedite/blawx, 2026 (accessed)](https://github.com/Lexpedite/blawx)

### OpenFisca, Mlang (γλώσσα M της DGFiP) και MPS / Agile Law Execution Factory

*system, production* · SOTA-FRG-03

OpenFisca: «the most widely adopted» open-source μηχανή rules-as-code σε Python. Χρησιμοποιείται στη Βαρκελώνη (Les meves ajudes), στο LexImpact της γαλλικής Εθνοσυνέλευσης και στην Ιαπωνία. Δεν δηλώνει formal semantics. Mlang: compiler της γλώσσας M του γαλλικού φόρου εισοδήματος, με formal semantics σε Coq. Περνά όλα τα ιδιωτικά tests της DGFiP (09/2022, φορολογικά έτη 2018–2021), αλλά δηλώνει «no legal guarantee of any kind». MPS: case study DSLs για την ολλανδική φορολογική νομοθεσία (Agile Law Execution Factory)· η παραγωγική κλίμακα δεν επαληθεύτηκε.

**Για το GRAIL:** Αποδεικνύουν ότι οι υπολογιστικές διατάξεις (φόροι, επιδόματα) κωδικοποιούνται σε κλίμακα· είναι baseline για το EXP-08. Το Mlang δείχνει ότι τα επίσημα test vectors μιας διοίκησης λειτουργούν ως μηχανικός oracle πιστότητας.

**Πηγές:** [OpenFisca, 2026 (accessed)](https://openfisca.org/en/) · [MLanguage/mlang, 2022](https://github.com/MLanguage/mlang) · [JetBrains MPS, 2026 (accessed)](https://www.jetbrains.com/mps/)

### LegalRuleML Core 1.0 (OASIS) και DMN 1.5 (OMG)

*standard, production* · SOTA-FRG-04

LegalRuleML: OASIS Standard (30/08/2021). Καλύπτει strict και defeasible κανόνες, defeaters με superiority, deontic τελεστές [OBL]/[PER]/[FOR], χρονική μεταβολή κανόνων (repealed, suspended κ.λπ.) και N:M σύνδεση κανόνα↔διάταξης. Είναι XML schema/RDFS, χωρίς εκτελέσιμη σημασιολογία. DMN 1.5: formal από 08/2024 (decision tables).

**Για το GRAIL:** Φορμά ανταλλαγής και εξαγωγής κανόνων LexDSL μέσω του EP-07. Χρησιμεύει και ως μέτρο εκφραστικότητας για deontic τελεστές, που δεν επαληθεύτηκε ότι καλύπτει το Catala (το Catala καλύπτει εξαιρέσεις μέσω default logic). Δεν είναι μηχανή εκτέλεσης.

**Πηγές:** [LegalRuleML Core Specification v1.0, 2021](https://docs.oasis-open.org/legalruleml/legalruleml-core-spec/v1.0/legalruleml-core-spec-v1.0.html) · [OMG DMN specification, 2024](https://www.omg.org/spec/DMN/)

### Cedar Verification-Guided Development (Lean + DRT + PBT)

*system, production* · SOTA-FRG-05

Εκτελέσιμο μοντέλο σε Lean, περίπου 10× μικρότερο από τον κώδικα παραγωγής, με αποδείξεις ιδιοτήτων. DRT Lean↔Rust «six hours nightly», «on the order of 100 million total tests» (2023). PBT για ό,τι δεν μοντελοποιείται. Lean 5µs/test έναντι Rust 7µs. Πολιτική: «No new Cedar version is released unless its model, proofs, and differential tests are current». Βρέθηκαν 4 bugs από τις αποδείξεις και 21 από DRT/PBT.

**Για το GRAIL:** Το πρόχειρο ήδη υιοθετεί αυτό το πρότυπο για τον πυρήνα (31.md P2, VT-505, VT-501, VT-301…VT-307). Δεν το εφαρμόζει στο Forge (CMP-FRG-01, KT-10), όπου η αναφορά είναι Lisp interpreter χωρίς αποδείξεις. Τα νούμερα throughput αφορούν authorization, όχι νομικό DSL, οπότε το EXP-18 μένει ανοιχτό.

**Πηγές:** [How We Built Cedar: A Verification-Guided Approach (arXiv 2407.01688), 2024](https://arxiv.org/abs/2407.01688) · [How we built Cedar with automated reasoning and differential testing, 2023](https://www.amazon.science/blog/how-we-built-cedar-with-automated-reasoning-and-differential-testing) · [Lean use case: Cedar, 2026 (accessed)](https://lean-lang.org/use-cases/cedar/)

### Verified compilers: CompCert 3.18 και CakeML

*system, production* · SOTA-FRG-06

CompCert 3.18 (08/2026): verified C compiler για ARM, PowerPC, RISC-V και x86. Ο parser δηλώνεται formally-verified από την έκδοση 2.3 (2014), με επικύρωση του LR(1) automaton από Coq-verified validator (Jourdan–Pottier–Leroy, ESOP 2012). Qualified τον 03/2026 για το MFC_NG των ATR 42/72, με credits DO-178C/DO-333/DO-330. CakeML: bootstrapped μέσα στο HOL, verified PEG parser, sound και complete type inferencer, proof-producing synthesis από HOL. Το backend στοχεύει 6 αρχιτεκτονικές, που η σελίδα δεν κατονομάζει· Wasm δεν αναφέρεται.

**Για το GRAIL:** Κορυφή της κλίμακας τεκμηρίωσης του INV-F01: απόδειξη για όλα τα προγράμματα, χωρίς TV ανά μονάδα.

**Πηγές:** [CompCert, 2026](https://compcert.org/) · [Validating LR(1) Parsers (ESOP, Crossref metadata), 2012](https://api.crossref.org/works?query.bibliographic=Validating+LR(1)+Parsers+Jourdan+Pottier+Leroy&rows=3) · [CakeML, 2026 (accessed)](https://cakeml.org/)

### Alive2 (bounded translation validation για LLVM IR)

*tool, production* · SOTA-FRG-07

Αυτόματο SMT-based TV για LLVM IR, χωρίς false alarms. Είναι bounded: ξεδιπλώνει loops έως όριο. Βρήκε 47 νέα bugs και οδήγησε σε 8 διορθώσεις του LLVM LangRef. Απαιτεί Z3 και έχει ρυθμιζόμενο SMT timeout· το README δεν αναφέρει ελέγξιμα certificates.

**Για το GRAIL:** Το σημερινό ανώτερο TV για LLVM IR→IR. Δεν καλύπτει backend→Wasm/machine code και, κατά τις πηγές, δεν παράγει ανεξάρτητα ελέγξιμο certificate. Με timeout το αποτέλεσμα δεν είναι απόφαση. Άρα δεν στηρίζει ως έχει το «100% μονάδων» του KT-10.

**Πηγές:** [Alive2: bounded translation validation for LLVM (PLDI, Crossref metadata), 2021](https://api.crossref.org/works/10.1145/3453483.3454030) · [Alive2 paper PDF, 2021](https://users.cs.utah.edu/~regehr/alive2-pldi21.pdf) · [AliveToolkit/alive2 README, 2026 (accessed)](https://github.com/AliveToolkit/alive2)

### MLIR/LLVM με IRDL (dialects ως δεδομένα)

*tool, production* · SOTA-FRG-08

Επεκτάσιμα IR (dialects). Το IRDL ορίζει dialects ως MLIR προγράμματα και έχει σχεδιαστεί ώστε να φορτώνονται στο runtime (dynamic registration ή JIT). Dialects με C++ predicates (irdl.c_pred) δεν καταχωρούνται στο runtime.

**Για το GRAIL:** Σωστή υποδομή για γενικό Compiler Forge και μηχανισμός για το EP-11 («νέα γλώσσα ως δεδομένα»). Το MLIR όμως δεν κωδικοποιεί σημασιολογία.

**Πηγές:** [MLIR IRDL dialect, 2026 (accessed)](https://mlir.llvm.org/docs/Dialects/IRDL/)

### Σημασιολογία και TV για MLIR: verification dialects, SMT dialect, mlir-tv, Lean-MLIR

*research, research-prototype* · SOTA-FRG-09

First-Class Verification Dialects (PACMPL/PLDI 06/2025): το MLIR είναι «syntax-focused» και δεν υποστηρίζει κωδικοποίηση σημασιολογίας. Η σημασιολογία ενός dialect ορίζεται ως lowering προς semantics dialects και από εκεί σε SMT. Δόθηκε σημασιολογία σε 5 dialects, φτιάχτηκαν 3 εργαλεία ανεξάρτητα από dialect και βρέθηκαν 5 miscompilations upstream. Upstream SMT dialect κατά SMT-LIB 2.7. mlir-tv (CAV 2022): SMT TV για ML dialects. Lean-MLIR (ITP 2024): αποδείξεις peephole rewrites σε SSA με regions, στο Lean.

**Για το GRAIL:** Δείχνει ότι TV για custom dialect απαιτεί πρώτα formal σημασιολογία του dialect. Το πρόχειρο δεν το προβλέπει.

**Πηγές:** [First-Class Verification Dialects for MLIR (PACMPL, Crossref metadata), 2025](https://api.crossref.org/works/10.1145/3729309) · [First-Class Verification Dialects for MLIR (abstract, Semantic Scholar), 2025](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1145/3729309?fields=title,abstract,venue,year) · [MLIR SMT dialect, 2026 (accessed)](https://mlir.llvm.org/docs/Dialects/SMT/) · [aqjune/mlir-tv, 2022](https://github.com/aqjune/mlir-tv) · [Verifying Peephole Rewriting in SSA Compiler IRs (arXiv 2407.03685), 2024](https://arxiv.org/abs/2407.03685)

### Cranelift: VeriISLE/Crocus και Arrival (επαληθευμένο instruction selection Wasm→native)

*tool, production* · SOTA-FRG-10

SMT επαλήθευση κανόνων ISLE (ASPLOS 04/2024), που τρέχει στο CI με κοινό SMT query cache. Arrival (PACMPL 10/2025): επαληθεύει σχεδόν όλους τους κανόνες instruction selection AArch64 από Wasm core έναντι authoritative ISA semantics (ARM Machine Readable Specification, ASL). Μειώνει την προσπάθεια κατά 2.6× και βρήκε νέα bugs. Το x86-64 δεν έχει την ίδια κάλυψη. Η ισοδυναμία είναι ακριβής, με εξαίρεση τις διαφορές NaN payload.

**Για το GRAIL:** Ανώτερο πρότυπο για runtime Wasm (CMP-FRG-03): επαληθευμένο instruction selection έναντι authoritative ISA semantics, αντί για TV ανά μονάδα.

**Πηγές:** [Lightweight, Modular Verification for WebAssembly-to-Native Instruction Selection (ASPLOS, Crossref metadata), 2024](https://api.crossref.org/works/10.1145/3617232.3624862) · [wasmtime cranelift/isle/veri README, 2026 (accessed)](https://github.com/bytecodealliance/wasmtime/blob/main/cranelift/isle/veri/README.md) · [Scaling Instruction-Selection Verification against Authoritative ISA Semantics (PACMPL, Crossref metadata with abstract), 2025](https://api.crossref.org/works/10.1145/3764383)

### WebAssembly 3.0 (deterministic profile, SpecTec) και WasmCert-Coq

*standard, production* · SOTA-FRG-11

Wasm 3.0 (17/09/2025): GC, memory64, exceptions, tail calls, relaxed SIMD. Ορίζει ντετερμινιστική default συμπεριφορά για κάθε κατά τα άλλα μη ντετερμινιστική εντολή (floating point και NaN, relaxed vector). Είναι η πρώτη έκδοση του προτύπου που παρήχθη με το toolchain SpecTec. WasmCert-Coq: μηχανοποιεί το Wasm 2.0 μαζί με subtyping και tail-call, με soundness του interpreter WasmRef-Coq, type safety και soundness του module instantiation.

**Για το GRAIL:** Άμεση στήριξη για το INV-C08 και για τις «byte-identical roots» του KT-02, εφόσον το προφίλ απαιτηθεί ρητά.

**Πηγές:** [Wasm 3.0 Completed, 2025](https://webassembly.org/news/2025-09-17-wasm-3.0/) · [WasmCert/WasmCert-Coq, 2026 (accessed)](https://github.com/WasmCert/WasmCert-Coq)

### Wasm Component Model / WIT (WASI 0.2 → 0.3.x)

*standard, pilot* · SOTA-FRG-12

Βρίσκεται ακόμη σε WASI Developer Preview, μέσα στο W3C WebAssembly Community Group· δεν είναι ολοκληρωμένο W3C standard. Η 0.3.0 έφερε native async (async functions, streams, futures)· η 0.3.1 προσθέτει map<K,V>.

**Για το GRAIL:** Στόχος πακεταρίσματος οργάνων Forge (ICD-10, EP-02). Χρειάζεται pinning έκδοσης.

**Πηγές:** [WebAssembly/component-model, 2026 (accessed)](https://github.com/WebAssembly/component-model)

### Semantics-first single-source frameworks: K, Sail, SpecTec, PLT Redex

*tool, production* · SOTA-FRG-13

K Framework Tools 7.0: από μία formal προδιαγραφή παράγει interpreters, model checkers, verifiers και τεκμηρίωση (LLVM και Haskell backends). Sail RISC-V: υιοθετημένο από τη RISC-V International· παράγει εκτελέσιμο emulator, ορισμούς Isabelle/Rocq/Lean και τεκμηρίωση. SpecTec: με αυτό παρήχθη για πρώτη φορά το πρότυπο Wasm (3.0). PLT Redex: DSL για reduction semantics με random testing.

**Για το GRAIL:** Ανώτερο πρότυπο για το Language Forge: μία έδρα σημασιολογίας από την οποία παράγονται interpreter, prover defs και docs. Το CMP-FRG-01 ορίζει grammar, typed semantics και Lisp interpreter ως χωριστά artifacts, χωρίς δηλωμένη παραγωγή από κοινή πηγή.

**Πηγές:** [runtimeverification/k, 2026 (accessed)](https://github.com/runtimeverification/k) · [riscv/sail-riscv, 2026 (accessed)](https://github.com/riscv/sail-riscv) · [PLT Redex, 2026 (accessed)](https://docs.racket-lang.org/redex/) · [Wasm 3.0 Completed (SpecTec), 2025](https://webassembly.org/news/2025-09-17-wasm-3.0/)

### Language workbenches: Langium, Spoofax, Rascal, MPS, Racket #lang

*tool, production* · SOTA-FRG-14

Langium: TypeScript με ενσωματωμένο LSP, «spiritual successor» του Xtext. Spoofax 2.5.23 (28/04/2025): SDF3, Statix (scope graphs), Stratego. Rascal: metaprogramming με VS Code/LSP. MPS: projectional workbench, με case study νομικών DSLs. Racket: #lang που πακετάρει reader και expander.

**Για το GRAIL:** Υπαρκτά εργαλεία για τη γραμματική, το type system και το LSP του CMP-FRG-01, αντί για custom Tree-sitter + ANTLR + Lisp.

**Πηγές:** [eclipse-langium/langium, 2026 (accessed)](https://github.com/eclipse-langium/langium) · [Spoofax, 2025](https://spoofax.dev/) · [Rascal, 2026 (accessed)](https://www.rascal-mpl.org/) · [JetBrains MPS, 2026 (accessed)](https://www.jetbrains.com/mps/) · [Racket Guide: Creating Languages, 2026 (accessed)](https://docs.racket-lang.org/guide/languages.html)

### Parsing: Tree-sitter, ANTLR 4.13.2, verified/validated parsers

*tool, production* · SOTA-FRG-15

Tree-sitter: «fast enough to parse on every keystroke» και robust σε syntax errors. ANTLR 4.13.2 (03/08/2024): 10 targets (Cpp, CSharp, Dart, Java, JavaScript, PHP, Python3, Swift, TypeScript, Go), κανένα Common Lisp. Verified/validated parsers: CoStar (ALL(*) verified σε Coq), parser του CompCert μέσω Coq-verified validator LR(1) automata (ESOP 2012), verified PEG parser του CakeML.

**Για το GRAIL:** Στο trusted path χρειάζεται μία κανονιστική γραμματική με validated parser· το Tree-sitter είναι μόνο παράγωγη προβολή για IDE. Το ANTLR δεν ταιριάζει με Lisp reference.

**Πηγές:** [Tree-sitter docs, 2026 (accessed)](https://tree-sitter.github.io/tree-sitter/) · [antlr/antlr4 releases (GitHub API), 2024](https://api.github.com/repos/antlr/antlr4/releases?per_page=5) · [antlr/antlr4 README (targets), 2026 (accessed)](https://github.com/antlr/antlr4) · [slasser/CoStar, 2023](https://github.com/slasser/CoStar) · [Validating LR(1) Parsers (ESOP, Crossref metadata), 2012](https://api.crossref.org/works?query.bibliographic=Validating+LR(1)+Parsers+Jourdan+Pottier+Leroy&rows=3)

### Ελέγξιμα certificates για SAT/SMT: Lean bv_decide (LRAT), cvc5 proofs, Carcara

*tool, production* · SOTA-FRG-16

bv_decide (LeanSAT): στέλνει τον στόχο σε SAT solver (προεπιλογή CaDiCaL) και ελέγχει το LRAT UNSAT proof με verified checker μέσα στο Lean. Ενσωματώθηκε στο Lean 4 core ως Std.Tactic.BVDecide (nightly 29/08/2024). Το cvc5 εξάγει proofs σε CPC, Alethe και LFSC. Το Carcara ελέγχει και επεξεργάζεται proofs Alethe (TACAS 2023).

**Για το GRAIL:** Κάνει το «translation-validation proof» του ICD-20 ανεξάρτητα ελέγξιμο αντικείμενο PCL, αντί για απλό «unsat» του Z3 (VT-404).

**Πηγές:** [leanprover/leansat, 2024](https://github.com/leanprover/leansat) · [cvc5 proof production, 2026 (accessed)](https://cvc5.github.io/docs/latest/proofs/proofs.html) · [ufmg-smite/carcara, 2023](https://github.com/ufmg-smite/carcara)

### E-graphs: egg και egglog

*research, research-prototype* · SOTA-FRG-17

egg (POPL 2021): equality saturation με rebuilding και e-class analyses. egglog (PLDI 2023): Datalog μαζί με EqSat, με lattice-based reasoning και incremental εκτέλεση. Το repo είναι ενεργό, με Python bindings και crate 3.0.0.

**Για το GRAIL:** Μηχανή rewrites και ελέγχου ισοδυναμίας για optimizers του Compiler Forge. Δεν αναφέρεται στο πρόχειρο. Η παραγωγική χρήση δεν τεκμηριώθηκε.

**Πηγές:** [egg: Fast and Extensible Equality Saturation, 2021](https://arxiv.org/abs/2004.03082) · [Better Together: Unifying Datalog and Equality Saturation, 2023](https://arxiv.org/abs/2304.04332) · [egraphs-good/egglog, 2026 (accessed)](https://github.com/egraphs-good/egglog)

### Differential testing compilers και όρια του N-version (και για κώδικα από LLM)

*tool, production* · SOTA-FRG-18

Csmith (PLDI 2011): τυχαία προγράμματα C χωρίς undefined behavior για differential testing. YARPGen (OOPSLA 2020, PLDI 2023): πάνω από 260 bugs σε gcc, clang, ispc, dpc++, sde και alive2. Knight & Leveson (1986): η υπόθεση ανεξαρτησίας αποτυχιών στο N-version «failed statistically». arXiv 2607.02808 (07/2026): σε 224 προβλήματα και 12 LLMs, ensembles 3 και 5 εκδόσεων πέτυχαν μόνο το 0.43 και το 0.44 του εφικτού κέρδους αξιοπιστίας, κάτω από 0.3 όταν προέρχονται από το ίδιο μοντέλο. Και διαφορετικά μοντέλα αποτυγχάνουν στα ίδια tests πολύ συχνότερα απ' ό,τι αναμένεται υπό ανεξαρτησία.

**Για το GRAIL:** Ο CMP-FRG-05 χρειάζεται generators χωρίς UB και μετρούμενη διαφορετικότητα. Η συμφωνία N εκδόσεων, ιδίως από LLM, δεν αποδεικνύει ορθότητα.

**Πηγές:** [csmith-project/csmith, 2011](https://github.com/csmith-project/csmith) · [intel/yarpgen, 2023](https://github.com/intel/yarpgen) · [N-version programming (Wikipedia; cites Knight & Leveson 1986), 2026 (accessed)](https://en.wikipedia.org/wiki/N-version_programming) · [A Systematic Methodology for Evaluating Failure Independence in LLM-Generated Code (arXiv 2607.02808), 2026](https://arxiv.org/abs/2607.02808)

### LLMs σε compilers/transpilation ως proposers με verifier (2023–2026)

*research, research-prototype* · SOTA-FRG-19

LLMLift (2024): LLM με verified lifting και proofs λειτουργικής ισοδυναμίας, για 4 DSLs. LLM-Vectorizer (2024): το Alive2 επαλήθευσε μόνο το 38.2% των vectorizations (TSVC). Foundation LLM για LLVM-IR/assembly (2024): 45% round-trip disassembly, 14% exact match. LLM 14B για GIMPLE→LLVM IR (05/2026): μόνο εμπειρική αξιολόγηση, χωρίς formal TV. DARPA TRACTOR: C→Rust με static/dynamic analysis και LLMs. Tenspiler (2024): verified-lifting compiler με program synthesis, όχι LLM. Grammar prompting (2023): LLM που παράγει προγράμματα σε υπάρχοντα DSL με BNF. Αναζήτηση arXiv (09/2026) βρήκε γλώσσες σχεδιασμένες για LLMs, όχι γλώσσες με formal semantics σχεδιασμένες από LLM.

**Για το GRAIL:** Επιβεβαιώνει το PVC για το Forge: τα LLMs προτείνουν, TV/proof αποφασίζει, και η απόδοση επαλήθευσης μετριέται.

**Πηγές:** [Verified Code Transpilation with LLMs, 2024](https://arxiv.org/abs/2406.03003) · [Tenspiler: A Verified Lifting-Based Compiler for Tensor Operations, 2024](https://arxiv.org/abs/2404.18249) · [LLM-Vectorizer: LLM-based Verified Loop Vectorizer, 2024](https://arxiv.org/abs/2406.04693) · [Foundation Models of Compiler Optimization (arXiv 2407.02524), 2024](https://arxiv.org/abs/2407.02524) · [LLM Translation of Compiler Intermediate Representation, 2026](https://arxiv.org/abs/2605.08247) · [DARPA TRACTOR, 2026 (accessed)](https://darpa.mil/research/programs/translating-all-c-to-rust) · [Grammar Prompting for DSL Generation with LLMs, 2023](https://arxiv.org/abs/2305.19234) · [arXiv search: LLM design new programming language semantics, 2026 (accessed)](https://arxiv.org/search/?query=LLM+design+new+programming+language+semantics&searchtype=all&order=-announced_date_first)

### Design-space exploration πάνω σε SysML v2

*tool, production* · SOTA-FRG-20

SysML 2.0 formal (09/2025) και Systems Modeling API & Services 1.0 formal (09/2025). Solvers: MiniZinc 2.10.1 (31/08/2026, solver-independent), OR-Tools CP-SAT, Alloy 6.2.0 (09/01/2025, με mutable state και temporal logic). Clafer: η 0.5.1 (09/2023) αφαίρεσε το reasoning· instance generation και multi-objective optimization υπάρχουν μόνο στην παλαιά 0.4.5. LLMs πάνω σε SysML v2: υπάρχουν παραγωγή μοντέλων (SysTemp, 2025) και ευθυγράμμιση/fault localization (2025–2026)· δεν βρέθηκε DSE με LLM.

**Για το GRAIL:** Το «Python + SysML v2 API» του CMP-FRG-04 στηρίζεται πλέον σε formal πρότυπο. Η DSE χρειάζεται τυπικό μοντέλο μεταβλητών, περιορισμών και στόχων πάνω από solver· η 31.md P7 ορίζει μόνο τη μέθοδο αξιολόγησης.

**Πηγές:** [OMG SysML, 2025](https://www.omg.org/spec/SysML/) · [OMG Systems Modeling API and Services, 2025](https://www.omg.org/spec/SystemsModelingAPI/) · [MiniZinc, 2026](https://www.minizinc.org/) · [OR-Tools CP-SAT, 2026 (accessed)](https://developers.google.com/optimization/cp/cp_solver) · [Alloy, 2025](https://alloytools.org/) · [Clafer, 2023](https://www.clafer.org/) · [SysTemp: A Multi-Agent System for Template-Based Generation of SysML v2, 2025](https://arxiv.org/abs/2506.21608) · [arXiv API search: "SysML v2" (40 most recent), 2026 (accessed)](http://export.arxiv.org/api/query?search_query=all:%22SysML%20v2%22&max_results=40&sortBy=submittedDate&sortOrder=descending)

### Επαλήθευση και testing για κώδικα νόμου στο Catala: CUTECat, formal date arithmetic

*research, research-prototype* · SOTA-FRG-21

CUTECat (arXiv 10/2024, αναθ. 01/2025): concolic execution που χειρίζεται default logic. Παράγει «hundreds of thousands of testcases covering all branches» σε γαλλικά επιδόματα στέγασης και στην §132 του US tax code, με test cases κατανοητά σε δικηγόρους. Formal date arithmetic (arXiv 03/2024): σημασιολογία πράξεων ημερομηνιών επαληθευμένη σε F*, με abstract interpretation για στατική ανίχνευση αμφισημιών, ενσωματωμένη στο Catala· βρήκε αμφισημίες στον κώδικα γαλλικών επιδομάτων στέγασης. Ένα preprint του 06/2026 χρησιμοποιεί το Catala ως ντετερμινιστικό verifier για legal AI, χωρίς ποσοτικά αποτελέσματα στο abstract.

**Για το GRAIL:** Generators για νομικό DSL με default logic, καταλληλότεροι από Csmith/YARPGen για το KT-10 και το EXP-08. Η date arithmetic αφορά άμεσα την εφεδρεία του EXP-08 (προθεσμίες, δικονομικοί κανόνες) και τον CMP-LAW-10.

**Πηγές:** [CUTECat: Concolic Execution for Computational Law (arXiv 2410.18212), 2024](https://arxiv.org/abs/2410.18212) · [Formalizing Date Arithmetic and Statically Detecting Ambiguities for the Law (arXiv 2403.08935), 2024](https://arxiv.org/abs/2403.08935) · [Closing the Loop: Formally Verified Law as a Reward Signal for Self-Improving Legal AI (arXiv 2606.23913), 2026](https://arxiv.org/abs/2606.23913)
