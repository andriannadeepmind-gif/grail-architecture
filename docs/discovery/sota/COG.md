# Γνωσιακός πυρήνας GRAIL + γνώση / μαρτυρία / provenance — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### CoALA (Cognitive Architectures for Language Agents)

*research, theoretical* · SOTA-COG-01

Εννοιολογικό πλαίσιο: modular memory components, δομημένος χώρος ενεργειών (εσωτερική μνήμη και εξωτερικό περιβάλλον), γενικευμένη διαδικασία απόφασης.

**Για το GRAIL:** Ταξινομία αναφοράς για COG-02/08/09 και για τη διεπαφή με τη μνήμη AEO. Αν η CoALA ορίζει κάτι ανάλογο με commit υπό proof, δεν επαληθεύτηκε πέρα από το abstract.

**Πηγές:** [Cognitive Architectures for Language Agents (TMLR camera-ready v3), 2024](https://arxiv.org/abs/2309.02427)

### LLM-Modulo και όρια αυτο-επαλήθευσης

*research, research-prototype* · SOTA-COG-02

Τα autoregressive LLMs δεν σχεδιάζουν και δεν αυτο-επαληθεύονται μόνα τους, αλλά λειτουργούν ως «universal approximate knowledge sources» σε βρόχο με εξωτερικούς model-based verifiers. Με self-critique η απόδοση καταρρέει, με sound εξωτερική επαλήθευση ανεβαίνει σημαντικά.

**Για το GRAIL:** Άμεση τεκμηρίωση για τον PVC (ADR-0005, INV-C03).

**Πηγές:** [Position: LLMs Can't Plan, But Can Help Planning in LLM-Modulo Frameworks (ICML), 2024](https://proceedings.mlr.press/v235/kambhampati24a.html) · [On the Self-Verification Limitations of LLMs on Reasoning and Planning Tasks, 2024](https://arxiv.org/abs/2402.08115)

### Neurosymbolic με verifier στον βρόχο (AlphaGeometry, AlphaProof, FunSearch, AlphaEvolve)

*system, research-prototype* · SOTA-COG-03

Γλωσσικό μοντέλο προτείνει, συμβολικός/formal/αυτόματος evaluator κρίνει. AlphaGeometry: 25/30 προβλήματα γεωμετρίας IMO (01/2024). AlphaProof: επίπεδο αργυρού μεταλλίου στην IMO 2024 με RL σε Lean (Nature, online 12/11/2025). FunSearch: ο evaluator «guards against hallucinations». AlphaEvolve: εξελικτικός coding agent με ανάδραση από evaluators.

**Για το GRAIL:** Η αναζήτηση γειωμένη σε verifiers (COG-03/04) φτάνει σε αποτελέσματα αιχμής. Στο νομικό πεδίο δεν τεκμηριώνεται αντίστοιχος πλήρης checker.

**Πηγές:** [AlphaGeometry: An Olympiad-level AI system for geometry, 2024](https://deepmind.google/discover/blog/alphageometry-an-olympiad-level-ai-system-for-geometry/) · [Olympiad-level formal mathematical reasoning with reinforcement learning (Nature, Crossref metadata), 2025](https://api.crossref.org/works/10.1038/s41586-025-09833-y) · [FunSearch: Making new discoveries in mathematical sciences using LLMs, 2023](https://deepmind.google/discover/blog/funsearch-making-new-discoveries-in-mathematical-sciences-using-large-language-models/) · [AlphaEvolve: A coding agent for scientific and algorithmic discovery, 2025](https://arxiv.org/abs/2506.13131)

### Test-time compute, PRMs, MCTS

*research, research-prototype* · SOTA-COG-04

Η compute-optimal κατανομή ανά prompt βελτιώνει την αποδοτικότητα >4× έναντι best-of-N. rStar-Math: MCTS με SLM-based process reward model και code-augmented CoT· MATH 58.8%→90.0% σε μοντέλο 7B. PRMs: η σύνθεση δεδομένων με Monte Carlo estimation δίνει κατώτερα PRMs και η αξιολόγηση Best-of-N έχει biases. Τα frontier μοντέλα έχουν «remarkably weak out-of-box verification».

**Για το GRAIL:** COG-03 (budgets, rewards γειωμένα σε verifiers) και COG-08 (κατανομή compute).

**Πηγές:** [Scaling LLM Test-Time Compute Optimally can be More Effective than Scaling Model Parameters, 2024](https://arxiv.org/abs/2408.03314) · [rStar-Math, 2025](https://arxiv.org/abs/2501.04519) · [The Lessons of Developing Process Reward Models in Mathematical Reasoning (Findings ACL), 2025](https://aclanthology.org/2025.findings-acl.547/) · [Sample, Scrutinize and Scale, 2025](https://arxiv.org/abs/2502.01839)

### Ανεξάρτητα ελέγξιμα proof certificates (cvc5/Alethe + Carcara· ανεξάρτητοι Lean kernels)

*tool, pilot* · SOTA-COG-05

Το cvc5 εξάγει αποδείξεις σε CPC, Alethe και LFSC. Το Carcara (Rust, Apache-2.0, TACAS 2023) είναι checker και elaborator για Alethe. Για τη Lean 4:<br>- Lean4Lean: ελέγχει όλο το mathlib, 20–50% πιο αργό, εντόπισε και διορθώθηκε ένα soundness bug.<br>- nanoda_lib: εξωτερικός type checker σε Rust, πρώιμο στάδιο.<br>- leanchecker (πρώην lean4checker): χρησιμοποιεί τον ίδιο kernel, άρα δεν είναι ανεξάρτητο.

**Για το GRAIL:** Κάνει το proof object ελέγξιμο χωρίς εμπιστοσύνη στον solver ή στον kernel (COG-04, ICD-30).

**Πηγές:** [Carcara (GitHub), 2026](https://github.com/ufmg-smite/carcara) · [cvc5 documentation: Proofs, 2026](https://cvc5.github.io/docs/latest/proofs/proofs.html) · [Lean4Lean: Verifying a Typechecker for Lean, in Lean, 2024](https://arxiv.org/abs/2403.14064) · [nanoda_lib (GitHub), 2026](https://github.com/ammkrn/nanoda_lib) · [lean4checker (archived, merged as leanchecker), 2026](https://github.com/leanprover/lean4checker)

### Συσχετισμένες αποτυχίες σε N-version και N-model

*research, research-prototype* · SOTA-COG-06

Knight & Leveson (IEEE TSE 12(1), 1986): η υπόθεση ανεξαρτησίας των αποτυχιών σε N-version προγράμματα απορρίφθηκε στατιστικά (δευτερογενής πηγή· το κείμενο της εργασίας δεν ανοίχτηκε). Kim et al. (ICML 2025), >350 LLMs: σε ένα leaderboard dataset τα μοντέλα συμφωνούν ~60% όταν και τα δύο σφάλλουν. Τα μεγαλύτερα και ακριβέστερα μοντέλα έχουν ισχυρά συσχετισμένα σφάλματα, ακόμη και με διαφορετικές αρχιτεκτονικές και παρόχους. PoLL: panel μικρότερων μοντέλων από διαφορετικές οικογένειες υπερέχει ενός μεγάλου judge, με λιγότερο intra-model bias και >7× χαμηλότερο κόστος.

**Για το GRAIL:** Περιορίζει το βάρος του N-version/N-model agreement (§8.3, §8.5, §8.7) και αφορά το EXP-14.

**Πηγές:** [An experimental evaluation of the assumption of independence in multiversion programming (Crossref metadata), 1986](https://api.crossref.org/works/10.1109/TSE.1986.6312924) · [N-version programming (Wikipedia, για το εύρημα Knight & Leveson), 2026](https://en.wikipedia.org/wiki/N-version_programming) · [Correlated Errors in Large Language Models (ICML), 2025](https://proceedings.mlr.press/v267/kim25e.html) · [Replacing Judges with Juries, 2024](https://arxiv.org/abs/2404.18796)

### Αβεβαιότητα και abstention (semantic entropy, conformal)

*research, research-prototype* · SOTA-COG-07

Semantic entropy (Nature 2024): εντοπίζει confabulations μετρώντας αβεβαιότητα στον χώρο του νοήματος. Conformal factuality: back-off σε λιγότερο ειδικό ισχυρισμό με εγγύηση ορθότητας 80–90%. Conformal abstention: εγγύηση για το hallucination rate. Conformal risk control: εγγύηση αναμενόμενης απώλειας για κάθε μονότονη loss, υπό exchangeability. Survey abstention (TACL 2025). Το verbalized confidence των LLMs είναι υπερβέβαιο (ICLR 2024).

**Για το GRAIL:** Μέθοδοι για τα κατώφλια του COG-08 και για το Unknown (INV-C04).

**Πηγές:** [Detecting hallucinations in LLMs using semantic entropy (OATML, Nature paper), 2024](https://oatml.cs.ox.ac.uk/blog/2024/06/19/detecting_hallucinations_2024.html) · [Language Models with Conformal Factuality Guarantees (ICML), 2024](https://proceedings.mlr.press/v235/mohri24a.html) · [Mitigating LLM Hallucinations via Conformal Abstention, 2024](https://arxiv.org/abs/2405.01563) · [Conformal Risk Control, 2022](https://arxiv.org/abs/2208.02814) · [Know Your Limits: A Survey of Abstention in LLMs (TACL), 2025](https://aclanthology.org/2025.tacl-1.26/) · [Can LLMs Express Their Uncertainty? (ICLR), 2024](https://arxiv.org/abs/2306.13063)

### ATMS, provenance semirings, ProvSQL, AGM σε belief bases

*research, pilot* · SOTA-COG-08

ATMS (de Kleer, Artificial Intelligence 28(2), 1986): τα μεταδεδομένα επαληθεύτηκαν, το κείμενο δεν ανοίχτηκε (403). Provenance semirings (PODS 2007): τα μεταδεδομένα επαληθεύτηκαν. ProvSQL: επέκταση PostgreSQL με (m-)semiring provenance (Boolean, counting, why-, how-, which-provenance, πιθανότητες, Shapley). MIT. VLDB 2018. SEP (αναθ. 29/7/2026): AGM και ειδική ενότητα για belief bases (contraction, consolidation, revision).

**Για το GRAIL:** Υλοποιήσιμη τυπική βάση για COG-05, INV-E02, KT-06. Η αντιστοίχιση ATMS labels ↔ why-provenance είναι ερμηνεία, όχι ισχυρισμός πηγής.

**Πηγές:** [An assumption-based TMS (Crossref metadata), 1986](https://api.crossref.org/works/10.1016/0004-3702(86)90080-9) · [Provenance semirings (Crossref metadata), 2007](https://api.crossref.org/works/10.1145/1265530.1265535) · [ProvSQL (GitHub), 2026](https://github.com/PierreSenellart/provsql) · [ProvSQL website (supported semirings), 2026](https://provsql.org/) · [Logic of Belief Revision (SEP), 2026](https://plato.stanford.edu/entries/logic-belief-revision/)

### Αιτιακή συμπερασματολογία: DoWhy, CLadder, Halpern–Pearl, νομική αιτιότητα

*tool, production* · SOTA-COG-09

DoWhy (MIT): identification, estimation, refutation API, και counterfactuals μέσω GCM. CLadder (NeurIPS 2023): η τυπική αιτιακή συλλογιστική είναι «highly challenging» για τα LLMs. Τροποποιημένος ορισμός Halpern–Pearl (IJCAI 2015) για την actual causation. SEP (αναθ. 2/2024): στο δίκαιο κυριαρχεί το but-for, με εναλλακτική το NESS· η overdetermination και η preemption είναι γνωστά προβλήματα.

**Για το GRAIL:** COG-06: το identification είναι [T]. Η νομική αιτιότητα είναι όμως actual causation.

**Πηγές:** [DoWhy (GitHub), 2026](https://github.com/py-why/dowhy) · [CLadder, 2023](https://arxiv.org/abs/2312.04350) · [A Modification of the Halpern-Pearl Definition of Causality, 2015](https://arxiv.org/abs/1505.00162) · [Causation in the Law (SEP), 2024](https://plato.stanford.edu/entries/causation-law/)

### Learned world models (V-JEPA 2, DreamerV3, Genie 3)

*research, research-prototype* · SOTA-COG-10

V-JEPA 2: pretraining σε >1M ώρες βίντεο, <62 ώρες ρομποτικού βίντεο, zero-shot planning σε βραχίονες Franka. DreamerV3 (Nature 2025): >150 tasks με μία ρύθμιση. Genie 3 (5/8/2025): 720p/24fps, περιβάλλοντα «largely consistent for several minutes», limited research preview.

**Για το GRAIL:** EXP-23, COG-07: η αιχμή αφορά φυσικά και οπτικά περιβάλλοντα.

**Πηγές:** [V-JEPA 2, 2025](https://arxiv.org/abs/2506.09985) · [DreamerV3 project page, 2025](https://danijar.com/project/dreamerv3/) · [Genie 3: A new frontier for world models, 2025](https://deepmind.google/discover/blog/genie-3-a-new-frontier-for-world-models/)

### Global Workspace και blackboard για AI

*research, research-prototype* · SOTA-COG-11

Shared workspace όπου τα modules ανταγωνίζονται για πρόσβαση λόγω περιορισμένου bandwidth (ICLR 2022). Butlin et al. 2023: καμία σημερινή AI δεν είναι συνειδητή, αλλά δεν υπάρχουν προφανή τεχνικά εμπόδια. Φιλοσοφικό επιχείρημα υπέρ language agents υπό GWT (2024). Blackboard LLM MAS (2025): ανταγωνιστικό με λιγότερα tokens.

**Για το GRAIL:** COG-02, EXP-21: καμία ελεγχόμενη απόδειξη υπεροχής.

**Πηγές:** [Coordination Among Neural Modules Through a Shared Global Workspace (ICLR), 2022](https://arxiv.org/abs/2103.01197) · [Consciousness in Artificial Intelligence, 2023](https://arxiv.org/abs/2308.08708) · [A Case for AI Consciousness: Language Agents and GWT, 2024](https://arxiv.org/abs/2410.11407) · [Exploring Advanced LLM Multi-Agent Systems Based on Blackboard Architecture, 2025](https://arxiv.org/abs/2507.01701)

### Όρια ενδοσκόπησης LLM

*research, research-prototype* · SOTA-COG-12

Με concept injection, το καλύτερο μοντέλο πετυχαίνει ~20% στις βέλτιστες συνθήκες· κατά τους συγγραφείς οι ικανότητες είναι «highly unreliable; failures of introspection remain the norm». Το self-prediction advantage αποτυγχάνει σε σύνθετα και OOD tasks.

**Για το GRAIL:** Στηρίζει την επιλογή του COG-08 να μην εμπιστεύεται την αυτο-αναφορά.

**Πηγές:** [Emergent Introspective Awareness in Large Language Models, 2025](https://transformer-circuits.pub/2025/introspection/index.html) · [Looking Inward: Language Models Can Learn About Themselves by Introspection, 2024](https://arxiv.org/abs/2410.13787)

### Prompt injection by design: CaMeL, FIDES

*research, research-prototype* · SOTA-COG-13

CaMeL: εξάγει control και data flow από το έμπιστο ερώτημα και χρησιμοποιεί capabilities κατά της εξαγωγής δεδομένων. Λύνει 77% των tasks του AgentDojo με provable security (84% το σύστημα χωρίς άμυνα). FIDES: planner με labels εμπιστευτικότητας και ακεραιότητας, ντετερμινιστική επιβολή πολιτικών, dynamic taint-tracking.

**Για το GRAIL:** COG-02/10: μηχανισμός επιβολής για το INV-S01.

**Πηγές:** [Defeating Prompt Injections by Design, 2025](https://arxiv.org/abs/2503.18813) · [Securing AI Agents with Information-Flow Control, 2025](https://arxiv.org/abs/2505.23643)

### Πολυπαροχικά gateways, routing, drift, μη ντετερμινισμός, OTel GenAI

*tool, production* · SOTA-COG-14

LiteLLM: >100 πάροχοι, retry/fallback, cost tracking, spend management· open-source με commercial enterprise άδεια. RouteLLM (ICLR 2025): >2× μείωση κόστους χωρίς απώλεια ποιότητας. Drift: σε εμπορική υπηρεσία LLM, ίδιο task 84%→51% σε 3 μήνες (2023). Μη ντετερμινισμός: τα endpoints είναι μη ντετερμινιστικά επειδή το φορτίο (άρα το batch size) αλλάζει και τα kernels δεν είναι batch-invariant· το κείμενο («Defeating Nondeterminism», 10/9/2025) στοχεύει σε batch-invariant kernels. OTel GenAI semconv: status Development.

**Για το GRAIL:** COG-01, ICD-22, EP-01, KT-01.

**Πηγές:** [LiteLLM (GitHub), 2026](https://github.com/BerriAI/litellm) · [RouteLLM (ICLR), 2025](https://proceedings.iclr.cc/paper_files/paper/2025/hash/5503a7c69d48a2f86fc00b3dc09de686-Abstract-Conference.html) · [Chen, Zaharia, Zou: LLM service behavior drift (arXiv 2307.09009), 2023](https://arxiv.org/abs/2307.09009) · [Defeating Nondeterminism in LLM Inference, 2025](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/) · [OTel GenAI semantic conventions README, 2026](https://github.com/open-telemetry/semantic-conventions-genai/blob/main/docs/gen-ai/README.md)

### Durable execution (Temporal)

*system, production* · SOTA-COG-15

Το event history είναι «the source of truth». Ο κώδικας της ροής ξαναπαίζεται ντετερμινιστικά. Το αποτέλεσμα κάθε activity καταγράφεται και στο replay «is reused, not recomputed».

**Για το GRAIL:** Υλοποίηση για sagas και INV-C08 (COG-10)· εισάγει δεύτερο ιστορικό.

**Πηγές:** [Temporal Workflows documentation, 2026](https://docs.temporal.io/workflows)

### Skill libraries και MCP

*standard, production* · SOTA-COG-16

Voyager: skill library ως εκτελέσιμος κώδικας, με επαναληπτικό prompting και self-verification. MCP (spec 2026-07-28): resources, prompts, tools, elicitation, και extensions (Tasks· «Skills over MCP» μέσω working group· MCP Apps). Η spec ορίζει ότι οι annotations των εργαλείων θεωρούνται untrusted, εκτός αν προέρχονται από trusted server.

**Για το GRAIL:** COG-09/10 ως adapters πίσω από ORP και gateway.

**Πηγές:** [Voyager, 2023](https://arxiv.org/abs/2305.16291) · [Model Context Protocol Specification (latest), 2026](https://modelcontextprotocol.io/specification/latest)

### Document parsing (OmniDocBench, Docling)

*tool, production* · SOTA-COG-17

OmniDocBench (CVPR 2025): αξιολογεί pipeline μεθόδους και end-to-end VLMs και αναδεικνύει δυνατά και αδύναμα σημεία ανά τύπο εγγράφου. Docling: MIT, τοπική εκτέλεση, DocLayNet (layout) και TableFormer (πίνακες).

**Για το GRAIL:** COG-11.

**Πηγές:** [OmniDocBench, 2025](https://arxiv.org/abs/2412.07626) · [Docling Technical Report, 2024](https://arxiv.org/abs/2408.09869)

### Provenance και attestation: PROV-O, SCITT, in-toto, VC 2.0, C2PA

*standard, production* · SOTA-COG-18

PROV-O: W3C REC, 30/4/2013 (Entity, Activity, Agent, used, wasDerivedFrom, wasAttributedTo, qualified terms). RFC 9943 (SCITT architecture): Proposed Standard, 06/2026· γενίκευση του CT (RFC 9162), με COSE_Sign1 signed statements και receipts κατά RFC 9942. Η ωριμότητα των υλοποιήσεων είναι άγνωστη. in-toto attestation v1.2: Envelope (προτεινόμενο DSSE v1.0), Statement με subject DigestSet, Predicate, Bundle. VC 2.0: W3C REC, 15/5/2025. C2PA 2.2 (1/5/2025): hard και soft bindings.

**Για το GRAIL:** KNW-01/04, ICD-18, INV-E04, INV-C06.

**Πηγές:** [PROV-O, 2013](https://www.w3.org/TR/prov-o/) · [RFC 9943: An Architecture for Trustworthy and Transparent Digital Supply Chains, 2026](https://datatracker.ietf.org/doc/rfc9943/) · [in-toto Attestation Framework spec, 2026](https://github.com/in-toto/attestation/blob/main/spec/README.md) · [in-toto attestation v1 Envelope (DSSE), 2026](https://github.com/in-toto/attestation/blob/main/spec/v1/envelope.md) · [Verifiable Credentials Data Model v2.0, 2025](https://www.w3.org/TR/vc-data-model-2.0/) · [C2PA Technical Specification 2.2, 2025](https://spec.c2pa.org/specifications/specifications/2.2/specs/_attachments/C2PA_Specification.pdf)

### RDF/SPARQL/SHACL (1.1/REC και 1.2/σε εξέλιξη), Oxigraph, Akoma Ntoso/ELI

*standard, pilot* · SOTA-COG-19

Recommendations: RDF 1.1 (25/2/2014), SPARQL 1.1 (21/3/2013), SHACL (20/7/2017). Σε εξέλιξη:<br>- RDF 1.2 Concepts: CR Snapshot 07/04/2026, με triple terms και επίπεδα Full/Basic conformance.<br>- SPARQL 1.2: WD 13/9/2026.<br>- SHACL 1.2 Core: WD 28/8/2026.<br>Oxigraph: RDF 1.2 και SPARQL 1.2 πίσω από τα features `rdf-12`/`sparql-12`· SHACL δεν αναφέρεται στο CHANGELOG. Akoma Ntoso 1.0: OASIS Standard, 08/2018. Αντιστοίχιση ELI–AKN: ICEGOV 2023.

**Για το GRAIL:** KNW-02/05, ICD-17, EP-07.

**Πηγές:** [RDF 1.2 Concepts, 2026](https://www.w3.org/TR/rdf12-concepts/) · [SPARQL 1.2 Query Language, 2026](https://www.w3.org/TR/sparql12-query/) · [SHACL 1.2 Core, 2026](https://www.w3.org/TR/shacl12-core/) · [RDF 1.1 Concepts, 2014](https://www.w3.org/TR/rdf11-concepts/) · [SPARQL 1.1 Query Language, 2013](https://www.w3.org/TR/sparql11-query/) · [SHACL, 2017](https://www.w3.org/TR/shacl/) · [Oxigraph CHANGELOG, 2026](https://raw.githubusercontent.com/oxigraph/oxigraph/master/CHANGELOG.md) · [OASIS LegalDocML TC, 2018](https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=legaldocml) · [Mapping ELI and AKN Ontologies (Crossref metadata), 2023](https://api.crossref.org/works/10.1145/3614321.3614327)

### Διτεμπορικά και speculative stores (XTDB v2, Zep/Graphiti, Datomic with)

*system, production* · SOTA-COG-20

XTDB v2: διτεμπορικό (πότε συνέβη / πότε καταγράφηκε), SQL:2011, αμετάβλητα δεδομένα, MPL-2.0. Zep/Graphiti: bi-temporal μοντέλο (T γεγονότων, T′ ingestion) με t_valid/t_invalid στις ακμές. Datomic `with`: speculative database value χωρίς durable commit, συνδυάσιμο με `as-of`.

**Για το GRAIL:** KNW-02 και ghost worlds πάνω σε cuts (COG-07).

**Πηγές:** [XTDB, 2026](https://xtdb.com/) · [Zep: A Temporal Knowledge Graph Architecture for Agent Memory, 2025](https://arxiv.org/html/2501.13956) · [Datomic filters (with / as-of), 2026](https://docs.datomic.com/reference/filters.html)

### Retrieval: hybrid, GraphRAG, HippoRAG 2, poisoning

*research, production* · SOTA-COG-21

BEIR (NeurIPS 2021): το BM25 είναι «robust baseline»· re-ranking και late interaction δίνουν τα καλύτερα zero-shot αποτελέσματα, με υψηλό κόστος. GraphRAG: LLM χτίζει entity KG και community summaries. HippoRAG 2 (ICML 2025): Personalized PageRank με ενσωμάτωση passages. PoisonedRAG (USENIX Security 2025): 90% επιτυχία επίθεσης με 5 κακόβουλα κείμενα ανά στοχευμένη ερώτηση, σε βάση εκατομμυρίων κειμένων· οι άμυνες που δοκιμάστηκαν ήταν ανεπαρκείς.

**Για το GRAIL:** KNW-03, ICD-31, INV-E02.

**Πηγές:** [BEIR, 2021](https://arxiv.org/abs/2104.08663) · [From Local to Global: A Graph RAG Approach, 2024](https://arxiv.org/abs/2404.16130) · [From RAG to Memory (HippoRAG 2), 2025](https://arxiv.org/abs/2502.14802) · [PoisonedRAG, 2025](https://arxiv.org/abs/2402.07867)

### Incremental συντήρηση παράγωγων (Differential Dataflow)

*tool, production* · SOTA-COG-22

Ενημερώνει τα αποτελέσματα μόνο όπου αλλάζουν οι είσοδοι, και σε επαναληπτικούς υπολογισμούς (iterate: reachability, k-core). Παράδειγμα του README: degree distribution σε γράφο 10M κόμβων/50M ακμών· αλλαγή μίας ακμής σε ~230µs έναντι ~15s αρχικού υπολογισμού (~10^5×).

**Για το GRAIL:** INV-E01, EXP-05.

**Πηγές:** [differential-dataflow (GitHub), 2026](https://github.com/TimelyDataflow/differential-dataflow)

### LinkML (σχήμα από μία πηγή)

*tool, production* · SOTA-COG-23

Από YAML σχήμα παράγει >30 μορφές: JSON Schema, OWL, SHACL, ShEx, JSON-LD, SQL DDL, Python/Pydantic/TypeScript/Java/Rust. Apache 2.0.

**Για το GRAIL:** Ένταση «μίας έδρας» σχημάτων (ADR-0025 έναντι KNW-05 έναντι canonical model).

**Πηγές:** [LinkML, 2026](https://linkml.io/)
