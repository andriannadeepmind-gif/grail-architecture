# Γνωσιακός πυρήνας GRAIL + γνώση / μαρτυρία / provenance — πρόχειρο έναντι ανώτερου (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| IDs | Ετυμηγορία | Τι λέει το πρόχειρο | Τι αλλάζει και γιατί | Κατάταξη · βεβαιότητα | Πηγές |
|---|---|---|---|---|---|
| CMP-COG-01, REQ-COG-002, ADR-0019 | ισχύει → **αλλάζει με** DEC-COG-07 | Provider-agnostic Inference Gateway με:<br>- model contracts με δηλωμένες ικανότητες και εκδοχή· ρόλοι δεσμευμένοι μέσω Control Records/configuration.<br>- routing: ικανότητα → residency → κόστος → latency· failover.<br>- canary battery σε κάθε νέα έκδοση παρόχου.<br>- redaction· τοπικά μοντέλα για προνομιακά δεδομένα.<br>- receipts· k-of-n agreement. | Τα gateways σε παραγωγή (LiteLLM: >100 πάροχοι, fallback, cost tracking) και το learned routing (RouteLLM: >2× μείωση κόστους χωρίς απώλεια ποιότητας) δείχνουν ότι το σχήμα είναι [T]. Το τεκμηριωμένο drift (84%→51% σε 3 μήνες) δικαιώνει το canary battery ανά έκδοση, που το πρόχειρο ήδη έχει. Το learned routing είναι βελτιστοποίηση πίσω από το συμβόλαιο. Το k-of-n πρέπει να διαβάζεται υπό DEC-COG-02. Κανένα αυστηρά ανώτερο δεν βρέθηκε μεταξύ των γνωστών υποψηφίων που ελέγχθηκαν με fetch· στοχευμένη αναζήτηση δεν έγινε. | σήμερα · υψηλή | [LiteLLM, 2026](https://github.com/BerriAI/litellm) · [RouteLLM, 2025](https://proceedings.iclr.cc/paper_files/paper/2025/hash/5503a7c69d48a2f86fc00b3dc09de686-Abstract-Conference.html) · [Chen, Zaharia, Zou: LLM service behavior drift, 2023](https://arxiv.org/abs/2307.09009) |
| ICD-22 | **κενό** | Operations: Generate/Embed/Score/Route(role)/Agree(k_of_n). Receipt: hashes prompt/response, contract id/version, παράμετροι, cut· «επιτρέπει replay-audit». Η έξοδος είναι PROPOSED μέσω της μίας πόρτας. Το INV-C08 απαιτεί ήδη κάθε έξοδο μοντέλου να εισέρχεται ως καταγεγραμμένο γεγονός. | Ο ερευνητής υπερεκτίμησε: η καταγραφή της εξόδου (INV-C08) και η έκδοση μέσω contract version ήδη προβλέπονται. Μένουν τρία κενά.<br>(1) Δεν ορίζεται ότι «replay-audit» σημαίνει επανάληψη από την καταγεγραμμένη έξοδο και όχι νέο generation. Ούτε ότι το receipt δείχνει σε CIDs αίτησης και απάντησης στο CAS. Αυτό είναι ουσιώδες, αφού τα endpoints δεν είναι ντετερμινιστικά (batch variance).<br>(2) Τα CIDs του context (retrieved evidence) δεν καταγράφονται ως prov:used. Άρα το INV-E02 δεν βλέπει την επιρροή μέσω context στους ισχυρισμούς που δεν στηρίζονται σε sound proof (GAP-COG-04). Το PoisonedRAG δείχνει ότι αρκούν 5 κείμενα ανά στοχευμένη ερώτηση.<br>(3) Το OTel GenAI (Development) χρησιμεύει μόνο ως προβολή, κάτι συνεπές με το ICD-24 («μη αυθεντικό»). | σήμερα · μέση | [Defeating Nondeterminism in LLM Inference, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/) · [PoisonedRAG, 2025](https://arxiv.org/abs/2402.07867) · [OTel GenAI README, 2026](https://github.com/open-telemetry/semantic-conventions-genai/blob/main/docs/gen-ai/README.md) |
| KT-01 | ισχύει → **αλλάζει με** DEC-AEO-02 | Αλλαγή παρόχου LLM χωρίς απώλεια ταυτότητας. Κριτήρια:<br>- conformance battery pass·<br>- differential ≥ θ σε σφραγισμένο σύνολο·<br>- Battery d ≤ ε·<br>- 0 αλλαγές σε ledger και ταυτότητα·<br>- ND.<br>Συνδέεται με EXP-14 και EXP-15. | Τα κριτήρια είναι μετρήσιμα. Λόγω μη ντετερμινισμού των endpoints, το θ και το ε πρέπει να ορίζονται πάνω από ένα intra-provider baseline (επαναλήψεις στον ίδιο πάροχο και έκδοση)· αλλιώς ο θόρυβος διαβάζεται ως διαφορά. Η επανάληψη ανά έκδοση παρόχου καλύπτεται ήδη από το canary battery του CMP-COG-01. | σήμερα · μέση | [Defeating Nondeterminism in LLM Inference, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/) |
| EP-01 | ισχύει | Model Contract (ICD-22) ως extension point για νέες αρχιτεκτονικές, reasoning-verified, on-device και πολυτροπικά μοντέλα· με KT-01, Battery, receipts, μία πόρτα. Το §8.5 δηλώνει ήδη ικανότητες μαζί με «ντετερμινισμό» και «εκδοχή». | Το σωστό όριο απορρόφησης. Διόρθωση στον ερευνητή: τα πεδία ντετερμινισμού και έκδοσης υπάρχουν ήδη στο §8.5. Η μόνη λεπτομέρεια: ο ντετερμινισμός εξαρτάται από το serving (batch invariance), άρα δηλώνεται ανά deployment και όχι ανά μοντέλο. | επέκταση · υψηλή | [Defeating Nondeterminism in LLM Inference, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/) |
| EXP-14 | ισχύει → **αλλάζει με** DEC-COG-02 | Είναι η N-model agreement σήμα αβεβαιότητας; Μέθοδος: βαθμονόμηση. Αν είναι χαμηλή, παύει η χρήση της στη δρομολόγηση. Το §8.5 γράφει ρητά: «όχι ψηφοφορία αλήθειας». | Σωστά ορίζεται ως πείραμα. Σε ένα leaderboard dataset τα LLMs συμφωνούν ~60% όταν και τα δύο σφάλλουν, και τα μεγαλύτερα έχουν πιο συσχετισμένα σφάλματα ακόμη και μεταξύ παρόχων. Άρα το k-of-n υπερεκτιμά τη βεβαιότητα. Το πείραμα πρέπει να μετρά το error correlation και να προ-καταχωρίζει σύγκριση με semantic entropy και conformal abstention. | πείραμα · υψηλή | [Correlated Errors in Large Language Models, 2025](https://arxiv.org/abs/2506.07962) · [Replacing Judges with Juries, 2024](https://arxiv.org/abs/2404.18796) |
| EXP-15 | ισχύει | Χάσμα ποιότητας τοπικών μοντέλων για εμπιστευτικές υποθέσεις, σε ίσες εργασίες. Αν είναι μεγάλο, οι εμπιστευτικές εργασίες πηγαίνουν σε verifier-heavy ροές. | Η ερευνήτρια ομάδα δεν βρήκε μέτρηση για ελληνικές νομικές εργασίες (δεν επανελέγχθηκε: εξαντλημένο search budget). Η εναλλακτική συνάδει με το εύρημα ότι τα κέρδη έρχονται από τον sound verifier. | πείραμα · μέση | [On the Self-Verification Limitations of LLMs, 2024](https://arxiv.org/abs/2402.08115) |
| CMP-COG-02, ICD-28, REQ-COG-004, EXP-21 | ισχύει → **αλλάζει με** DEC-COG-05, DEC-SEC-01 | Workspace περιορισμένης χωρητικότητας: ανταγωνισμός salience, broadcast, CycleTrace. Κάθε σκέψη καταγράφεται (INV-THOUGHT-VISIBLE). Το όφελος είναι [X] EXP-21· αν δεν αποδειχθεί, η ενορχήστρωση γίνεται επίπεδη και το ICD-28 μένει. | Η λειτουργική GWT υλοποιείται στη ML (ICLR 2022). Το blackboard LLM MAS είναι ανταγωνιστικό με λιγότερα tokens, όχι κυρίαρχο. Καμία ελεγχόμενη απόδειξη υπεροχής, άρα το [X] είναι σωστό. Ο όρος «συνείδηση» (§8.12) να μη μπει σε απαιτήσεις: οι Butlin et al. καταλήγουν ότι καμία σημερινή AI δεν είναι συνειδητή. Το ICD-28 στηρίζεται σε invariant εκτός των 40 INV (GAP-COG-09). | πείραμα · μέση | [Shared Global Workspace, 2022](https://arxiv.org/abs/2103.01197) · [Consciousness in AI, 2023](https://arxiv.org/abs/2308.08708) · [Blackboard LLM MAS, 2025](https://arxiv.org/abs/2507.01701) |
| CMP-COG-03, REQ-COG-005 | ισχύει | Αναζήτηση (MCTS, program search, best-first proof search) πάνω σε σχέδια, επιχειρήματα και διαδικαστικές κινήσεις. Anytime budgets από KRN-08. Rewards γειωμένα σε verifiers. Στο πρόχειρο [T]· το REQ-COG-005 ελέγχεται με KT-24. | Τα AlphaProof, FunSearch, AlphaEvolve και rStar-Math επιβεβαιώνουν την αναζήτηση γειωμένη σε verifiers ή evaluators. Η ρήτρα «rewards από verifiers» συνάδει με τα ευρήματα για τα PRMs (κατώτερα δεδομένα MC, biases BoN). Κατάταξη experiment αντί για [T]: ο μηχανισμός είναι [T], αλλά η αξία του MCTS πάνω σε argument graphs χωρίς formal checker δεν τεκμηριώνεται. Το ίδιο το πρόχειρο το δένει σε KT-24. Λείπει πολιτική compute-optimal (GAP-COG-08). | πείραμα · μέση | [AlphaProof (Nature, Crossref), 2025](https://api.crossref.org/works/10.1038/s41586-025-09833-y) · [AlphaEvolve, 2025](https://arxiv.org/abs/2506.13131) · [Lessons of Developing PRMs, 2025](https://aclanthology.org/2025.findings-acl.547/) |
| REQ-COG-001, INV-C03, ADR-0005 | ισχύει → **αλλάζει με** DEC-COG-01, DEC-VER-04 | Οι γεννήτριες είναι μη έμπιστες και παράγουν μόνο PROPOSED. Κανόνας: grade ≥ COMMITTED ⇒ ∃ proof της κλάσης και ∃ Gate allow. Η έξοδος μοντέλου έχει τύπο Proposal χωρίς constructor commit. Μία πόρτα εισόδου. | Το LLM-Modulo και ο Stechly δείχνουν κατάρρευση με self-critique και άνοδο με sound verifier. Το σχήμα γεννήτρια-checker πέτυχε AlphaGeometry (25/30) και AlphaProof. Τα commercial legal AI research tools (Harvey-class) κάνουν 17–33% hallucination, άρα ο φραγμός σε επίπεδο τύπου είναι αναγκαίος. Η ισχύς του INV-C03 όμως φτάνει μόνο όσο η ασθενέστερη κλάση verifier του §8.7 (GAP-COG-02). Το VT-304 δεν υπάρχει. | σήμερα · υψηλή | [LLM-Modulo (ICML), 2024](https://arxiv.org/abs/2402.01817) · [Self-Verification Limitations, 2024](https://arxiv.org/abs/2402.08115) · [Hallucination-Free? Assessing the Reliability of Leading AI Legal Research Tools, 2024](https://arxiv.org/abs/2405.20362) |
| EXP-01 | ισχύει | Μειώνει ο PVC το σφάλμα έναντι ενός γενικού μοντέλου μόνου του; Σφραγισμένο σύνολο, τυφλή βαθμολόγηση, ίσο budget. Αν η μείωση είναι κάτω από το περιθώριο, η Verification Suite απλοποιείται (το INV-C03 μένει). | Σωστό kill test. Στο baseline να μπει και commercial legal AI system (Harvey-class), με τυπολογία hallucination τύπου Magesh. Το «ίσο budget» πρέπει να σημαίνει και ίσο test-time compute, αφού η compute-optimal κατανομή δίνει >4× αποδοτικότητα έναντι best-of-N. | πείραμα · υψηλή | [Hallucination-Free?, 2024](https://arxiv.org/abs/2405.20362) · [Scaling LLM Test-Time Compute Optimally, 2024](https://arxiv.org/abs/2408.03314) |
| CMP-COG-04, ICD-30 | **υπάρχει αυστηρά ανώτερο** | Proof objects κατά κλάση (§8.7):<br>- SMT: «model ή unsat core + solver version» (Z3).<br>- Formal: «hash proof term + checker version» (Lean 4).<br>- N-version: «υπογεγραμμένη εγγραφή συμφωνίας».<br>- Calibration check: ιστορικό βαθμονόμησης.<br>Μετριασμός για bug verifier: N-version και mutation-tested verifiers. Timeout σημαίνει Unknown· το verifier set μένει εκτός χώρου αναζήτησης. | Ανώτερο: UNSAT: πιστοποιητικό συν ανεξάρτητος checker (π.χ. cvc5 → Alethe → Carcara). Lean: επανέλεγχος του term σε ανεξάρτητο kernel. N-version: ξεχωριστή, ασθενέστερη κλάση τεκμηρίου. Κυριαρχεί στο «N-version + mutation testing», γιατί μικραίνει την TCB από solver/kernel σε μικρό checker χωρίς να χάνει ιδιότητα του προχείρου. Trade-offs:<br>(i) Το πρόχειρο ορίζει Z3· δεν ξέρω αν οι αποδείξεις του ελέγχονται ανεξάρτητα, οπότε ίσως χρειαστεί cvc5 για UNSAT.<br>(ii) Κόστος παραγωγής και ελέγχου (Lean4Lean 20–50% πιο αργό).<br>(iii) Το nanoda_lib είναι πρώιμο.<br>Για SAT, το model είναι ήδη ελέγξιμο πιστοποιητικό. Για UNSAT, το unsat core με την έκδοση του solver δεν είναι απόδειξη και απαιτεί εμπιστοσύνη στον solver. Υπάρχουν πιστοποιητικά: το cvc5 εξάγει Alethe/LFSC/CPC και το Carcara (Rust) ελέγχει Alethe. Για τη Lean υπάρχουν ανεξάρτητοι kernels (Lean4Lean, ήδη εντόπισε soundness bug· nanoda_lib)· το leanchecker χρησιμοποιεί τον ίδιο kernel. Το N-version δεν αποτελεί απόδειξη, λόγω συσχετισμένων αποτυχιών (Knight & Leveson· Kim 2025). Σωστά στο πρόχειρο: timeout = Unknown και verifier set εκτός αναζήτησης. | σήμερα · υψηλή | [Carcara (GitHub), 2026](https://github.com/ufmg-smite/carcara) · [cvc5 Proofs, 2026](https://cvc5.github.io/docs/latest/proofs/proofs.html) · [Lean4Lean, 2024](https://arxiv.org/abs/2403.14064) · [nanoda_lib, 2026](https://github.com/ammkrn/nanoda_lib) · [N-version programming (Knight & Leveson finding), 2026](https://en.wikipedia.org/wiki/N-version_programming) |
| CMP-COG-05, REQ-COG-006 | ισχύει | ATMS: labels (ελάχιστα περιβάλλοντα), nogoods, ταυτόχρονες εναλλακτικές ερμηνείες. Παράγωγη προβολή· τα nogoods δεσμεύονται. Για την έκρηξη labels: focused ATMS και όρια περιβαλλόντων. Επέκταση των as-built JTMS/WFS (ανεπαλήθευτα από εδώ). | Το ATMS είναι ο κλασικός μηχανισμός για το ζητούμενο (de Kleer 1986· το κείμενο δεν ανοίχτηκε, 403). Η revision σε belief bases (SEP §5) ταιριάζει με το «υποβιβασμός αντί διαγραφής». Το ProvSQL υλοποιεί why-, how- και which-provenance ως semirings σε PostgreSQL· είναι εναλλακτική υλοποίηση για παράγωγες προβολές εξάρτησης. Η ισοδυναμία ATMS labels ↔ why-provenance είναι ερμηνεία, όχι τεκμηριωμένο αποτέλεσμα. Καμία μέτρηση κλιμάκωσης σε νομικά corpora. | σήμερα · μέση | [An assumption-based TMS (Crossref), 1986](https://api.crossref.org/works/10.1016/0004-3702(86)90080-9) · [ProvSQL, 2026](https://provsql.org/) · [Logic of Belief Revision (SEP), 2026](https://plato.stanford.edu/entries/logic-belief-revision/) |
| CMP-COG-06, REQ-COG-007 | ισχύει | SCMs, do-calculus identification, counterfactuals, μοντέλα νομικής αιτιώδους συνάφειας. Μη ταυτοποιήσιμο αποτέλεσμα ⇒ Unknown με τις απαιτούμενες υποθέσεις. [X] EXP-22 (αξία για νομική αιτιότητα, συμφωνία με ειδικούς). | Η αρχή «identifiability ή Unknown» είναι σωστή. Το DoWhy δίνει identification, refutation και counterfactuals μέσω GCM. Το CLadder δείχνει ότι τα LLMs δυσκολεύονται. Η νομική αιτιότητα είναι όμως actual causation (but-for, NESS, overdetermination, preemption), με formal εργαλείο τον ορισμό Halpern–Pearl. Το πρόχειρο δεν τη διακρίνει από το population-level do-calculus (GAP-COG-06), αν και το EXP-22 υπάρχει. | πείραμα · μέση | [DoWhy, 2026](https://github.com/py-why/dowhy) · [CLadder, 2023](https://arxiv.org/abs/2312.04350) · [Causation in the Law (SEP), 2024](https://plato.stanford.edu/entries/causation-law/) |
| CMP-COG-07, REQ-COG-008 | ισχύει | Ghost worlds: CoW αντίγραφα πάνω σε cuts, επέκταση του νομικού --what-if. Τα handles δεν φέρουν commit capability, άρα η διαρροή στο trusted state είναι μη αναπαραστάσιμη. [T] ghost / [X] learned (EXP-23). | Η απουσία capability ως τρόπος να γίνει η διαρροή μη αναπαραστάσιμη είναι σωστή σχεδίαση. Άμεσο προηγούμενο σε παραγωγή: το Datomic `with` (speculative database value χωρίς durable commit, συνδυάσιμο με as-of), μαζί με τα as-of ερωτήματα του XTDB v2. | σήμερα · υψηλή | [Datomic filters (with / as-of), 2026](https://docs.datomic.com/reference/filters.html) · [XTDB, 2026](https://xtdb.com/) |
| EXP-23 | ισχύει | Learned world models για δυναμική δίκης· μέτρο η προβλεπτική αξία (ποτέ «X%» προς πελάτες). Αν είναι χαμηλή, μένουν μόνο συμβολικά ghost worlds. | Η αιχμή (V-JEPA 2, DreamerV3, Genie 3 που είναι research preview με συνέπεια λίγων λεπτών) αφορά φυσικά και οπτικά περιβάλλοντα. Ο ερευνητής δεν βρήκε δημοσίευση για δυναμική δίκης· δεν επανελέγχθηκε λόγω εξαντλημένου search budget. Το κριτήριο θανάτου είναι σωστό. | πείραμα · μέση | [V-JEPA 2, 2025](https://arxiv.org/abs/2506.09985) · [DreamerV3, 2025](https://danijar.com/project/dreamerv3/) · [Genie 3, 2025](https://deepmind.google/discover/blog/genie-3-a-new-frontier-for-world-models/) |
| CMP-COG-08, REQ-COG-009 | **κενό** | Βαθμονόμηση ανά κλάση ισχυρισμού που ρυθμίζει τα κατώφλια commit. Αυτογνωσία ικανοτήτων από το registry (καμία αυτο-δήλωση, ICD-04). Αποφάσεις UNKNOWN. Το «Calibration check» είναι κλάση verifier στο §8.7. Μέθοδος βαθμονόμησης δεν ορίζεται. | Υποβιβάστηκε από superior-exists: χωρίς δηλωμένη μέθοδο στο πρόχειρο δεν υπάρχει επιλογή που να κυριαρχείται, άρα πρόκειται για κενό. Η απόρριψη της αυτο-αναφοράς επιβεβαιώνεται: introspection ~20% και «highly unreliable»· verbalized confidence υπερβέβαιο. Υπάρχουν μέθοδοι με εγγύηση πεπερασμένου δείγματος υπό exchangeability: conformal risk control, abstention, factuality. Προσοχή: μια στατιστική εγγύηση δεν είναι απόδειξη. Η κλάση «Calibration check» πρέπει να δηλώνει μέγιστο βαθμό (GAP-COG-02). | σήμερα · μέση | [Conformal Risk Control, 2022](https://arxiv.org/abs/2208.02814) · [Conformal Abstention, 2024](https://arxiv.org/abs/2405.01563) · [Emergent Introspective Awareness, 2025](https://transformer-circuits.pub/2025/introspection/index.html) |
| REQ-COG-003, INV-C04 | ισχύει | answer: Query → ProofCarryingClaim ⊎ Refuted ⊎ Unknown(reason, missing, would_resolve_by), με reason ∈ {NO_EVIDENCE, CONFLICTING_EVIDENCE, UNDECIDABLE_IN_BUDGET, OUT_OF_SCOPE, CONTROL_RESTRICTED}. Ολική· το Unknown είναι επιτυχής πράξη (exit 0), μέσα στο InstitutionalAct. | Η abstention ως πρώτης τάξης έξοδος είναι η κατεύθυνση της βιβλιογραφίας (TACL 2025), και το τυποποιημένο Unknown είναι πλουσιότερο από το binary abstain. Το conformal back-off χωρά ως ProofCarryingClaim ασθενέστερης πρότασης μόνο αν η κλάση calibration γίνει δεκτή με δηλωμένο βαθμό (DEC-COG-01). Το VT-306 δεν υπάρχει. | σήμερα · υψηλή | [Know Your Limits, 2025](https://aclanthology.org/2025.tacl-1.26/) · [Conformal Factuality, 2024](https://proceedings.mlr.press/v235/mohri24a.html) |
| CMP-COG-09, REQ-COG-010 | ισχύει | Tools, programs, LexDSL rule-sets, playbooks: versioned, conformance-tested, στο CAS με registry στο ledger. Προαγωγή μόνο μέσω ORP. Wasm/Lisp/Python. | Το πρότυπο είναι η skill library ως εκτελέσιμος κώδικας (Voyager). Το MCP 2026-07-28 έχει tools και extensions (Tasks· Skills over MCP μέσω working group) και θεωρεί τις annotations untrusted, εκτός αν προέρχονται από trusted server· αυτό συνάδει με ORP και gateway. Το MCP να είναι adapter, όχι έδρα. | σήμερα · υψηλή | [Voyager, 2023](https://arxiv.org/abs/2305.16291) · [MCP Specification, 2026](https://modelcontextprotocol.io/specification/latest) |
| CMP-COG-10, REQ-COG-012 | ισχύει → **αλλάζει με** DEC-COG-05 | Effectful σχέδια ως sagas μέσω του gateway, με compensation (Elixir). Χωρίς υπογραφή Principal δεν γίνεται εξωτερική επίδραση (INV-L02). Το INV-S01 (Tier-1, KT-17) απαγορεύει στο περιεχόμενο OBSERVED/PROPOSED να λειτουργεί ως εντολή. | Οι sagas είναι σωστές. Το Temporal υλοποιεί replay από το event history με επαναχρησιμοποίηση των αποτελεσμάτων, συνεπές με το INV-C08. Εισάγει όμως δεύτερο ιστορικό δίπλα στο ledger, άρα δεν είναι αυστηρά ανώτερο. Το INV-S01 υπάρχει· λείπει ο μηχανισμός επιβολής του για σχέδια που αγγίζουν untrusted δεδομένα (GAP-COG-05). | σήμερα · μέση | [Temporal Workflows, 2026](https://docs.temporal.io/workflows) · [CaMeL, 2025](https://arxiv.org/abs/2503.18813) |
| CMP-COG-11, REQ-COG-011 | ισχύει | OCR ελληνικών (Tesseract), layout, NER, ελληνικό νομικό NLP (as-built έδρες). Τα παράγωγα φέρουν provenance-confidence labels και δεν θεωρούνται ποτέ trusted χωρίς verification. | Η αρχή είναι σωστή και δεν εξαρτάται από την ποιότητα της μηχανής. Στο OmniDocBench τα δυνατά σημεία pipelines και VLMs διαφέρουν ανά τύπο εγγράφου. Το Docling (MIT, τοπικό, DocLayNet/TableFormer) είναι [T] για το DP-2. Ο ισχυρισμός «το OCR με VLM επινοεί κείμενο» αφαιρέθηκε ως ατεκμηρίωτος. Αλλαγή σε today: το συμβόλαιο είναι [T]· η επιλογή μηχανής (και N-version OCR) απαιτεί benchmark σε ελληνικά νομικά scans (άγνωστο). | σήμερα · μέση | [OmniDocBench, 2025](https://arxiv.org/abs/2412.07626) · [Docling, 2024](https://arxiv.org/abs/2408.09869) |
| CMP-KNW-01, ICD-18, REQ-KNW-001, INV-C06 | ισχύει → **αλλάζει με** DEC-COG-06 | Evidence items (CID), παραγωγές W3C PROV, source trust classes, taint. Ingest/Attest/Lineage/Taint/Quarantine. Ελλιπής αλυσίδα ⇒ μη αποδεκτό. | Το PROV-O (REC 30/4/2013) δίνει Entity, Activity, Agent και qualified terms. Η ολότητα είναι εφικτή όσο η ingestion είναι η μόνη πόρτα. Πρέπει να καλύπτει και την επιρροή μέσω context των LLM (GAP-COG-04). Το VT-202 δεν υπάρχει. | σήμερα · υψηλή | [PROV-O, 2013](https://www.w3.org/TR/prov-o/) |
| CMP-KNW-04, REQ-KNW-003, INV-E04 | **κενό** | Connectors, attestation λήψης (TSR, υπογραφή ή transcript), transparency log, quarantine, pinned sources και multi-witness. Το INV-E04 ορίζει πεδία (πηγή, τεκμήριο λήψης, digest, χρόνος), όχι μορφή. Έδρα log: tlog-1 (RFC 6962/9162). | Υποβιβάστηκε από superior-exists. Το πρόχειρο δεν ορίζει μορφή εγγραφής ούτε εξωτερικό interface επαλήθευσης, άρα δεν υπάρχει επιλογή που να κυριαρχείται. Υπάρχουν πρότυπα:<br>- in-toto v1.2: DSSE, Statement με subject DigestSet, Predicate.<br>- SCITT (RFC 9943, 06/2026): γενίκευση του CT που χρησιμοποιεί ήδη το tlog-1, με COSE receipts.<br>Το SCITT δεν είναι αυστηρά ανώτερο ως έδρα για τρεις λόγους: συγκρούεται με την έδρα JCS (COSE/CBOR), η ωριμότητα των υλοποιήσεων είναι άγνωστη, και έχει θέση μόνο ως εξωτερική προβολή. | σήμερα · μέση | [RFC 9943, 2026](https://datatracker.ietf.org/doc/rfc9943/) · [in-toto Attestation spec, 2026](https://github.com/in-toto/attestation/blob/main/spec/README.md) |
| INV-E02, REQ-KNW-002, KT-06 | ισχύει → **αλλάζει με** DEC-COG-07 | taint(e)@t ⇒ κάθε ισχυρισμός με στήριξη που εξαρτάται από e σημαίνεται έως t+Δ, και τα ATMS labels αποκλείουν τα περιβάλλοντα της e. KT-06: 100% εντός Δ, ATMS retraction, ειδοποίηση των drafts. | Η εξάρτηση ως διάσχιση γράφου έχει τυπική βάση: semiring provenance, υλοποιημένο στο ProvSQL. Για ισχυρισμούς με sound proof πάνω σε evidence, η στήριξη βρίσκεται μέσα στο proof. Τυφλό σημείο μένει στα PROPOSED drafts και στις ασθενείς κλάσεις (N-version, calibration), όπου η επιρροή πέρασε μέσω context. Αρκούν 5 κείμενα ανά στοχευμένη ερώτηση (PoisonedRAG). Το «100% εντός Δ» προϋποθέτει ότι καταγράφονται τα CIDs του context (GAP-COG-04). | σήμερα · υψηλή | [ProvSQL, 2026](https://provsql.org/) · [PoisonedRAG, 2025](https://arxiv.org/abs/2402.07867) |
| CMP-KNW-02, ICD-17, REQ-KNW-004, INV-E03 | ισχύει → **αλλάζει με** DEC-COG-03, DEC-COG-04 | Διτεμπορικό RDF (named graphs ανά έκδοση/cut), SPARQL subset, AsOf, ResolveEli, ValidateShacl· παράγωγο από το ledger. Oxigraph-class store με PostgreSQL· πρώτο όργανο ο as-built Lisp version graph. Το ICD δεν εκθέτει υλοποίηση. | Εφικτό. Η διτεμπορικότητα πρέπει να μοντελοποιηθεί, δεν είναι εγγενής στο RDF. Κατάσταση: RDF 1.2 σε CR (07/04/2026), SPARQL 1.2 σε WD (13/9/2026), SHACL 1.2 σε WD (28/8/2026). Οι 1.1 και SHACL (2017) είναι RECs. Το Oxigraph έχει RDF/SPARQL 1.2 πίσω από feature flags· SHACL δεν αναφέρεται, άρα ο validator είναι χωριστό όργανο (δεν ξέρω ποιο). XTDB και Zep είναι εγγενώς διτεμπορικά, αλλά χάνουν SPARQL/SHACL/ELI, άρα δεν είναι αυστηρά ανώτερα (DEC-COG-04). | σήμερα · μέση | [RDF 1.2 Concepts, 2026](https://www.w3.org/TR/rdf12-concepts/) · [SPARQL 1.2, 2026](https://www.w3.org/TR/sparql12-query/) · [SHACL 1.2 Core, 2026](https://www.w3.org/TR/shacl12-core/) · [Oxigraph CHANGELOG, 2026](https://raw.githubusercontent.com/oxigraph/oxigraph/master/CHANGELOG.md) |
| CMP-KNW-03, ICD-31, REQ-KNW-005, INV-E01, ADR-0030 | ισχύει | Υβριδική ανάκτηση (lexical, vectors, graph walks, Graph-RAG, re-ranking) μόνο ως παράγωγο: index = f(ledger, CAS), και η διαγραφή του δεν αλλάζει αλήθεια. PostgreSQL (pgvector, FTS). | Στο BEIR το BM25 είναι robust baseline και το re-ranking δίνει τα καλύτερα αποτελέσματα, άρα το υβριδικό σχήμα είναι σωστό. Το GraphRAG χτίζει με LLM τον KG και τα summaries: είναι παράγωγα βαθμού PROPOSED και όχι evidence. Το Differential Dataflow δίνει incremental ανανέωση. | σήμερα · υψηλή | [BEIR, 2021](https://arxiv.org/abs/2104.08663) · [GraphRAG, 2024](https://arxiv.org/abs/2404.16130) · [HippoRAG 2, 2025](https://arxiv.org/abs/2502.14802) |
| EXP-05 | ισχύει | Χρειάζεται graph database; Φόρτοι γενεαλογίας, taint και argument graph σε journal+μνήμη έναντι RDF store έναντι property graph. Μόνο αν αποτυγχάνει SLO χωρίς αυτή. | Το ProvSQL (VLDB 2018, semiring provenance σε PostgreSQL) και το Differential Dataflow (incremental επαναληπτικοί υπολογισμοί σε γράφους) δείχνουν ότι οι φόρτοι αυτοί ίσως δεν χρειάζονται graph DB. Το κριτήριο SLO είναι σωστό. | πείραμα · μέση | [ProvSQL (VLDB, Crossref), 2018](https://api.crossref.org/works/10.14778/3229863.3236253) · [differential-dataflow, 2026](https://github.com/TimelyDataflow/differential-dataflow) |
| CMP-KNW-05, REQ-KNW-006 | ισχύει → **αλλάζει με** DEC-COG-03 | OWL/SHACL/JSON-LD, αντιστοιχίσεις ELI/AKN/FRBR, versioned λεξιλόγια με SHACL migration tests. Ταυτόχρονα το πρόχειρο δηλώνει ως «μία έδρα»: σχημάτων τα JSON Schema του contracts/schemas (ADR-0025)· όρων το model/grail-world-os.kerml (§3)· canonical model το model/grail-world-os.sysml (§29). | Τα πρότυπα είναι τα σωστά: Akoma Ntoso (OASIS Standard 08/2018), ELI, και υπάρχουσα αντιστοίχιση ELI–AKN (ICEGOV 2023). Υπάρχει όμως τριπλή ένταση έδρας: JSON Schema, OWL/SHACL και KerML/SysML. Το LinkML παράγει JSON Schema/SHACL/OWL/JSON-LD από μία πηγή, αλλά θα ήταν τέταρτη γλώσσα δίπλα στο SysML v2 του SysON (DEC-COG-03). | σήμερα · μέση | [OASIS LegalDocML, 2018](https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=legaldocml) · [ELI–AKN mapping (Crossref), 2023](https://api.crossref.org/works/10.1145/3614321.3614327) · [LinkML, 2026](https://linkml.io/) |
| EP-07 | ισχύει → **αλλάζει με** DEC-COG-03, DEC-FRG-02 | Knowledge Format Adapter (ICD-17, ICD-18) για διαδόχους ELI/AKN, κανονιστικές γλώσσες κανόνων, επιστημονικά πρότυπα. Με SHACL migrations και INV-E03. | Σωστό όριο. Πρώτο πραγματικό use case: η μετάβαση από RDF 1.1/SPARQL 1.1/SHACL σε 1.2, όταν γίνουν RECs (σήμερα CR/WD). | επέκταση · μέση | [RDF 1.2 Concepts, 2026](https://www.w3.org/TR/rdf12-concepts/) |
| REQ-KNW-007 | ισχύει | Το βιβλίο του δημιουργού είναι δογματική πηγή με provenance (All Rights Reserved), ποτέ AI υποσύστημα. | Είναι ζήτημα πολιτικής: πηγή με prov:wasAttributedTo και trust class, στα ίδια κανάλια με κάθε evidence. Το PROV-O το εκφράζει άμεσα. | σήμερα · υψηλή | [PROV-O, 2013](https://www.w3.org/TR/prov-o/) |

## Κενά που δεν καλύπτει καθόλου το πρόχειρο

### GAP-COG-01 — Ανύπαρκτες έδρες, άγραφες ενότητες, λάθος μέτρηση

*σήμερα*

Στο docs/architecture-draft/ υπάρχουν μόνο: το master, το spine-vocab και 9 αρχεία στο _unmerged-parts (επιβεβαιώθηκε με Glob). Το model/ στη ρίζα του repo είναι κενό. Λείπουν:<br>- model/grail-world-os.kerml (§3) και .sysml (§29)·<br>- contracts/schemas/institutional-act.schema.json (§8.4)·<br>- contracts/ (§15.1).<br>Το LedgerEvent παραπέμπει στο §16 και το §10 δεν γράφτηκε. Το CLAUDE.md αναφέρει φακέλους formal/, contracts/, adrs/, model/ που δεν υπάρχουν. Το spine-vocab δηλώνει «COMPONENTS (76)» αλλά απαριθμεί 75 (επιβεβαιώθηκε).

**Γιατί μετρά:** Τα ICD-22/28/30 δεν έχουν σχήματα. VT-202, VT-304, VT-306 δεν υπάρχουν. Η ιχνηλασιμότητα του §29 παραπέμπει σε κενό.

**Τι δείχνει το ανώτερο:** Εσωτερική ασυνέπεια. Στη Φάση Β τα σχήματα να παραχθούν από το SysON model.

### GAP-COG-02 — Δηλωμένη TCB και μέγιστος βαθμός ανά κλάση proof

*σήμερα*

Το §8.7 βάζει στην ίδια λίστα πιστοποιητικά (SAT model, proof terms) μαζί με τεκμήρια που δεν είναι αποδείξεις: unsat core + solver version, N-version agreement, calibration check, διπλό υπολογισμό προθεσμίας. Δεν δηλώνεται ποια TCB εμπιστεύεται κάθε κλάση ούτε ποιον μέγιστο βαθμό επιτρέπει.

**Γιατί μετρά:** Το INV-C03 ισχύει μόνο όσο ισχύει η ασθενέστερη κλάση που οδηγεί σε COMMITTED.

**Τι δείχνει το ανώτερο:** Πιστοποιητικά με ανεξάρτητο checker: cvc5 → Alethe → Carcara· Lean → Lean4Lean ή nanoda_lib. Για τις υπόλοιπες κλάσεις: δηλωμένη TCB και πλαφόν βαθμού.

**Πηγές:** [Carcara (GitHub), 2026](https://github.com/ufmg-smite/carcara) · [Lean4Lean, 2024](https://arxiv.org/abs/2403.14064) · [cvc5 Proofs, 2026](https://cvc5.github.io/docs/latest/proofs/proofs.html)

### GAP-COG-03 — Ποικιλομορφία στο N-version / N-model

*πείραμα*

Το πρόχειρο ήδη απαιτεί ≥1 μη-LLM oracle για ADJUDICATED/ESTABLISHED (ICD-14, REQ-ADV-003) και ορίζει τη N-model agreement ως σήμα, όχι ψηφοφορία (§8.5). Λείπει όμως μέτρο ποικιλομορφίας ή συσχέτισης σφαλμάτων για το N-version agreement του §8.3/§8.7 (FRG-05) και για το Agree(k_of_n) του ICD-22.

**Γιατί μετρά:** Η συμφωνία συσχετισμένων συστημάτων δίνει ψευδή βεβαιότητα.

**Τι δείχνει το ανώτερο:** Μέτρηση του error correlation και χωριστή, ασθενέστερη κλάση τεκμηρίου για το agreement.

**Πηγές:** [Correlated Errors in LLMs, 2025](https://proceedings.mlr.press/v267/kim25e.html) · [N-version programming (Knight & Leveson), 2026](https://en.wikipedia.org/wiki/N-version_programming)

### GAP-COG-04 — Provenance σε επίπεδο context των LLM

*σήμερα*

Το receipt κρατά hash του prompt, αλλά δεν απαριθμεί τα CIDs των evidence που μπήκαν στο context ως prov:used.

**Γιατί μετρά:** Για ισχυρισμούς με sound proof η στήριξη βρίσκεται στο proof. Για PROPOSED drafts και ασθενείς κλάσεις το INV-E02/KT-06 δεν βλέπει την επιρροή μέσω context.

**Τι δείχνει το ανώτερο:** Καταγραφή των CIDs του context ως prov:used στο Inference Receipt· η taint διασχίζει και αυτές τις ακμές.

**Πηγές:** [PoisonedRAG, 2025](https://arxiv.org/abs/2402.07867) · [PROV-O, 2013](https://www.w3.org/TR/prov-o/)

### GAP-COG-05 — Μηχανισμός επιβολής του INV-S01

*πείραμα*

Το INV-S01 (Tier-1, KT-17) και τα provenance-tagged κανάλια (§0.1) υπάρχουν. Δεν ορίζεται όμως μηχανισμός που να εμποδίζει τα untrusted δεδομένα να επηρεάσουν το control flow ή να διαρρεύσουν μέσω ορισμάτων σε σχέδια του COG-10.

**Γιατί μετρά:** Το COG-10 εκτελεί σχέδια που επηρεάζονται από περιεχόμενο πηγών.

**Τι δείχνει το ανώτερο:** CaMeL (77% των tasks του AgentDojo με provable security, έναντι 84% χωρίς άμυνα) και FIDES (IFC labels, ντετερμινιστική επιβολή).

**Πηγές:** [CaMeL, 2025](https://arxiv.org/abs/2503.18813) · [FIDES, 2025](https://arxiv.org/abs/2505.23643)

### GAP-COG-06 — Actual causation για νομική αιτιότητα

*πείραμα*

Το COG-06 ορίζεται μόνο με do-calculus. Το EXP-22 μετρά την αξία για νομική αιτιότητα, αλλά δεν διακρίνει την actual (but-for, NESS, overdetermination, preemption) από την type causation.

**Γιατί μετρά:** Πυρήνας της αστικής και ποινικής αιτιότητας στο LAWMAX.

**Τι δείχνει το ανώτερο:** Ο τροποποιημένος ορισμός Halpern–Pearl· η θεωρία νομικής αιτιότητας (SEP).

**Πηγές:** [HP modified definition, 2015](https://arxiv.org/abs/1505.00162) · [Causation in the Law (SEP), 2024](https://plato.stanford.edu/entries/causation-law/)

### GAP-COG-07 — Σημασιολογία replay-audit στο Inference Receipt

*σήμερα*

Το INV-C08 και το contract version υπάρχουν. Όμως το receipt («hashes») δεν δείχνει σε CIDs αίτησης και απάντησης στο CAS. Δεν ορίζει ότι «replay-audit» σημαίνει επανάληψη από την καταγραφή και όχι νέο generation. Δεν δεσμεύει τον δηλωμένο ντετερμινισμό του deployment.

**Γιατί μετρά:** INV-C08, KT-01, επαναληψιμότητα audits υπό μη ντετερμινιστικά endpoints.

**Τι δείχνει το ανώτερο:** Σώματα στο CAS, κρυπτογραφημένα ανά confidentiality domain και διαγράψιμα με crypto-shredding. Το OTel GenAI (Development) μόνο ως προβολή.

**Πηγές:** [Defeating Nondeterminism, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/)

### GAP-COG-08 — Προσαρμοστική πολιτική test-time compute

*πείραμα*

Τα budgets έρχονται από το KRN-08, αλλά κανένα όργανο δεν κατανέμει compute ανά δυσκολία ή stakes.

**Γιατί μετρά:** Η compute-optimal κατανομή είναι >4× αποδοτικότερη από best-of-N. Επηρεάζει τις συγκρίσεις «ίσου budget» (EXP-01).

**Τι δείχνει το ανώτερο:** Compute-optimal κατανομή ανά δυσκολία, με εκτίμηση από το COG-08.

**Πηγές:** [Scaling LLM Test-Time Compute Optimally, 2024](https://arxiv.org/abs/2408.03314)

### GAP-COG-09 — Διπλή σημασία της «μίας πόρτας»· invariants εκτός συνόλου

*σήμερα*

Το ICD-22 στέλνει την έξοδο μέσω load-proposal-file! στο can-adopt, που το §3.1 δένει με την υιοθέτηση οργάνων (ORP). Ο PVC για ισχυρισμούς είναι άλλη ροή. Το ICD-28 διέπεται από το INV-THOUGHT-VISIBLE, και τα INV-C04/§8.4 επικαλούνται INV-HONEST-IGNORANCE, INV-ONE-ENVELOPE, INV-EXIT-CODES. Κανένα δεν ανήκει στα 40 INV (επιβεβαιώθηκε στο spine-vocab)· είναι as-built έδρες του άλλου repo, ανεπαλήθευτες από εδώ.

**Γιατί μετρά:** Νόμος «μία έδρα ανά έννοια» και ιχνηλασιμότητα.

**Τι δείχνει το ανώτερο:** Εσωτερική ασυνέπεια. Χρειάζονται ρητοί ορισμοί στη Φάση Β.

## Δεν ξέρω

- Χάσμα ποιότητας τοπικών μοντέλων σε ελληνικές νομικές εργασίες (EXP-15): δεν βρέθηκε μέτρηση.
- Υπεροχή του Global Workspace έναντι επίπεδης ενορχήστρωσης για language agents: δεν βρέθηκε ελεγχόμενη μελέτη.
- Learned world models για δυναμική δίκης: ο ερευνητής δεν βρήκε δημοσίευση· δεν επανελέγχθηκε (εξαντλημένο search budget).
- Ποιότητα OCR και parsing σε ελληνικά νομικά scans (Tesseract, Docling, VLM): δεν βρέθηκε benchmark.
- Αν οι αποδείξεις της Z3 ελέγχονται από ανεξάρτητο checker: δεν ξέρω. Αν ο veriT παράγει Alethe: δεν επαληθεύτηκε εδώ (μόνο για το cvc5).
- Ωριμότητα των υλοποιήσεων SCITT (RFC 9943) σε παραγωγή: δεν ξέρω.
- Ποιος SHACL validator συνοδεύει ένα Oxigraph-class store: δεν ξέρω (το CHANGELOG του Oxigraph δεν αναφέρει SHACL).
- Ωριμότητα generators από SysML v2/KerML προς JSON Schema/SHACL/OWL: δεν ξέρω.
- Βιβλιοθήκη Halpern–Pearl actual causation σε παραγωγή: δεν ξέρω.
- Κλιμάκωση των ATMS labels σε νομικά corpora: δεν βρέθηκε μέτρηση.
- Κείμενο των de Kleer 1986, Knight & Leveson 1986, Provenance Semirings 2007: δεν ανοίχτηκε (403 ή PDF μη αναγνώσιμο)· επαληθεύτηκαν μόνο τα μεταδεδομένα.
- Χρονοδιάγραμμα για να γίνουν RECs τα RDF/SPARQL/SHACL 1.2 και για σταθεροποίηση των OTel GenAI semconv: δεν ξέρω.
- As-built έδρες του STAVROPOULOSLAWCORPUS (cognition.lisp, JTMS/WFS, version-graph, load-proposal-file!, can-adopt): ανεπαλήθευτες από εδώ.
- Εξαντλημένο budget WebSearch (200/200): δεν έγιναν στοχευμένες αναζητήσεις για ανώτερες εναλλακτικές στα holds· έλεγχοι μόνο με WebFetch σε γνωστούς υποψηφίους.

## Τι διόρθωσε ο ανεξάρτητος ελεγκτής

Πηγές που άνοιξε: 100 · δεν στέκονταν: 13 · διορθώσεις: 19

- **EP-01, KT-01, ICD-22, GAP-COG-07, summary:** Αφαιρέθηκαν οι ισχυρισμοί ότι λείπουν έκδοση και ντετερμινισμός στο Model Contract, και ότι δεν ξανατρέχει battery ανά έκδοση παρόχου. — Το §8.5 δηλώνει «ντετερμινισμός» και «εκδοχή». Το CMP-COG-01 έχει canary battery ανά έκδοση. Το INV-C08 απαιτεί καταγραφή εξόδου.
- **ICD-22:** Confidence από high σε medium· το κενό περιορίστηκε σε σημασιολογία replay-audit, CAS CIDs και context CIDs. — Υπερεκτίμηση του κενού έναντι του INV-C08.
- **CMP-COG-08 / REQ-COG-009:** Verdict από superior-exists σε gap. — Το πρόχειρο δεν ορίζει μέθοδο βαθμονόμησης· δεν υπάρχει επιλογή για να κυριαρχηθεί.
- **CMP-KNW-04 / INV-E04:** Verdict από superior-exists σε gap· DEC-COG-06: in-toto/DSSE ως μορφή, SCITT προαιρετική προβολή. — Δεν υπάρχει μορφή στο πρόχειρο· το SCITT συγκρούεται με την έδρα JCS και η ωριμότητα υλοποιήσεων είναι άγνωστη.
- **CMP-COG-04 / ICD-30:** Το superior περιορίστηκε στο UNSAT και στο N-version (το SAT model είναι ήδη πιστοποιητικό). Προστέθηκαν nanoda_lib και το ότι το leanchecker δεν είναι ανεξάρτητο. Δηλώθηκε το trade-off Z3/cvc5. Αφαιρέθηκε ο ισχυρισμός για το veriT. — Ακρίβεια και δήλωση trade-off.
- **SOTA-COG-04, CMP-COG-03:** Αντικαταστάθηκε το «proxy-reward gap/echo-chamber». — Η πηγή δεν το λέει.
- **SOTA-COG-17, CMP-COG-11:** Αφαιρέθηκε ο ισχυρισμός για hallucination OCR με VLM. Η κατάταξη έγινε today (από experiment). — Ατεκμηρίωτο· το συμβόλαιο είναι [T], η επιλογή μηχανής θέλει benchmark.
- **SOTA-COG-06, EXP-14, GAP-COG-03, DEC-COG-02:** Προστέθηκαν οι περιορισμοί «σε ένα leaderboard dataset» και «ακόμη και μεταξύ παρόχων». Διορθώθηκε η περιγραφή του PoLL. Αναγνωρίστηκε ότι το ≥1 μη-LLM oracle (ICD-14, REQ-ADV-003) και το «όχι ψηφοφορία αλήθειας» (§8.5) υπάρχουν ήδη. Maturity από production σε research-prototype. — Πιστότητα σε πηγές και πρόχειρο.
- **SOTA-COG-21, INV-E02, GAP-COG-04:** «5 κείμενα ανά στοχευμένη ερώτηση»· το τυφλό σημείο περιορίστηκε σε PROPOSED και ασθενείς κλάσεις. — Ακριβής διατύπωση της πηγής· για ισχυρισμούς με sound proof η στήριξη βρίσκεται στο proof.
- **GAP-COG-05, CMP-COG-10:** Αναγνωρίστηκε ότι INV-S01 και KT-17 υπάρχουν· το κενό αφορά τον μηχανισμό επιβολής. — Ανάγνωση του 19.md.
- **SOTA-COG-19, CMP-KNW-02:** Το Oxigraph έχει μόνο RDF/SPARQL 1.2 πίσω από flags· δεν αναφέρει SHACL. Προστέθηκαν τα RECs 1.1 και SHACL 2017. — CHANGELOG του Oxigraph και σελίδες W3C TR.
- **SOTA-COG-08, CMP-COG-05:** Η αντιστοίχιση ATMS ↔ why-provenance σημειώθηκε ως ερμηνεία· προστέθηκε το provsql.org. — Το κείμενο της πηγής δεν ανοίχτηκε.
- **SOTA-COG-16:** Προστέθηκε «εκτός αν από trusted server»· το Skills over MCP σημειώθηκε ως working group. — Κείμενο της MCP spec.
- **SOTA-COG-20, CMP-COG-07:** Προστέθηκε το Datomic `with` και επαληθεύτηκε το bi-temporal μοντέλο του Zep. — Άμεσο προηγούμενο για ghost worlds.
- **DEC-COG-03:** Προστέθηκε η εναλλακτική SysML v2/KerML· δηλώθηκε η ένταση τριπλής έδρας (ADR-0025, §3, §29). — Δίκαιη παρουσίαση, σύμφωνα με CLAUDE.md και πρόχειρο.
- **DEC-COG-01, DEC-COG-04:** Προστέθηκαν εναλλακτικές: COMMITTED με δηλωμένη TCB· RDF 1.2 Basic. — Πραγματικές ενδιάμεσες επιλογές.
- **SOTA-COG-01, SOTA-COG-03, SOTA-COG-07:** Maturity σε theoretical, research-prototype και research-prototype αντίστοιχα. Το «what» της CoALA περιορίστηκε στο abstract. — Ακρίβεια.
- **EXP-23:** Confidence από low σε medium. — Το verdict (σωστά πείραμα με kill criterion) είναι σταθερό.
- **Ονοματολογία:** Αφαιρέθηκαν ονόματα μοντέλων και προϊόντων από τίτλους (π.χ. arXiv 2307.09009) και από την περιγραφή του Magesh. — Κανόνας 5.
