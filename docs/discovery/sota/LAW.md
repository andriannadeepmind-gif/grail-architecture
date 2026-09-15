# LAWMAX — νομική συλλογιστική — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### Magesh et al., Hallucination-Free? (τυπολογία correctness/groundedness)

*research, research-prototype* · SOTA-LAW-01

Εμπειρική αξιολόγηση (2024) εμπορικών νομικών AI research tools (Harvey-class) με RAG. Παραίσθηση = απάντηση «incorrect ή misgrounded»· misgrounded είναι η παραπομπή σε υπαρκτή πηγή που δεν στηρίζει την πρόταση. Παραισθήσεις 17%–33%, ακρίβεια 19%–65%. Οι συγγραφείς κρίνουν τα misgrounded σφάλματα δυνητικά πιο επικίνδυνα από την επινόηση απόφασης, επειδή είναι λεπτότερα και εντοπίζονται δυσκολότερα.

**Για το GRAIL:** Μέτρο για INV-L01 και KT-15: η ύπαρξη παραπομπής δεν αρκεί, χρειάζεται έλεγχος στήριξης της πρότασης. Το RAG μόνο του δεν εξαλείφει σφάλματα. Μέτρηση του 2024· νεότερη εικόνα στο SOTA-LAW-07.

**Πηγές:** [Hallucination-Free? Assessing the Reliability of Leading AI Legal Research Tools (arXiv 2405.20362), 2024](https://arxiv.org/abs/2405.20362) · [Hallucination-Free? (HTML: typology, per-tool rates), 2024](https://arxiv.org/html/2405.20362) · [Semantic Scholar record (publication venue: Journal of Empirical Legal Studies), 2024](https://api.semanticscholar.org/graph/v1/paper/arXiv:2405.20362?fields=title,year,venue,journal,publicationVenue,externalIds)

### Dahl et al., Large Legal Fictions

*research, research-prototype* · SOTA-LAW-02

Προφίλ νομικών παραισθήσεων γενικών LLM (2024): 58%–88% σε ερωτήσεις για αποφάσεις ομοσπονδιακών δικαστηρίων ΗΠΑ. Contra-factual bias (δεν διορθώνουν λανθασμένες προκείμενες του χρήστη). Τα μοντέλα δεν ξέρουν πάντα πότε παράγουν παραίσθηση.

**Για το GRAIL:** Το LLM δεν μπορεί να είναι verifier του εαυτού του. Στηρίζει PVC, INV-C04 και τον εξωτερικό citation verifier του CMP-LAW-08.

**Πηγές:** [Large Legal Fictions (Journal of Legal Analysis 16(1):64–93; arXiv 2401.01301), 2024](https://arxiv.org/abs/2401.01301)

### Legal NLP benchmarks (LegalBench, LexGLUE, LawBench, CaseHOLD, SARA)

*research, production* · SOTA-LAW-03

LegalBench: 162 εργασίες, 6 τύποι νομικής συλλογιστικής, από νομικούς. LexGLUE: σουίτα legal NLU (ACL 2022). LawBench: 20 εργασίες σε 3 γνωστικά επίπεδα, στο κινεζικό δίκαιο· συμπέρασμα: «still a long way from obtaining usable and reliable LLMs in legal tasks». CaseHOLD: >53k ερωτήσεις αναγνώρισης holding (ICAIL 2021). SARA (2020): statutory reasoning στο φορολογικό δίκαιο ΗΠΑ· χειροποίητο σύστημα Prolog έλυσε πλήρως το task, ενώ τα machine-reading μοντέλα της εποχής απέδωσαν χαμηλά.

**Για το GRAIL:** Εξωτερικά σημεία αναφοράς για VT-701. Το CaseHOLD είναι το πλησιέστερο task στην «αναγνώριση κρίσιμων λόγων» του EXP-09. Το SARA στηρίζει τον συμβολικό πυρήνα του CMP-LAW-04, αλλά μετρά μοντέλα προ του 2021.

**Πηγές:** [LegalBench (arXiv 2308.11462), 2023](https://arxiv.org/abs/2308.11462) · [LexGLUE (arXiv 2110.00976), 2022](https://arxiv.org/abs/2110.00976) · [LawBench (arXiv 2309.16289), 2023](https://arxiv.org/abs/2309.16289) · [open-compass/LawBench (GitHub: tasks based on the Chinese legal system), 2023](https://github.com/open-compass/LawBench) · [CaseHOLD (arXiv 2104.08671), 2021](https://arxiv.org/abs/2104.08671) · [A Dataset for Statutory Reasoning in Tax Law Entailment and Question Answering (arXiv 2005.05257), 2020](https://arxiv.org/abs/2005.05257)

### LEXam (ICLR 2026)

*research, research-prototype* · SOTA-LAW-04

7.537 ερωτήσεις από 340 εξετάσεις (116 μαθήματα), EN/DE, ανοιχτές και πολλαπλής επιλογής. Ensemble LLM-as-a-Judge με αυστηρή επικύρωση από ειδικούς. Τα LLM δυσκολεύονται σε ανοιχτές ερωτήσεις δομημένης πολυβηματικής νομικής συλλογιστικής.

**Για το GRAIL:** Μεθοδολογικό πρότυπο για VT-701 και VT-702: ανοιχτές ερωτήσεις με επικυρωμένο αυτόματο κριτή.

**Πηγές:** [LEXam: Benchmarking Legal Reasoning on 340 Law Exams (arXiv 2505.12864), 2025](https://arxiv.org/abs/2505.12864)

### GreekBarBench (EMNLP 2025)

*research, research-prototype* · SOTA-LAW-05

Benchmark ελεύθερου κειμένου σε θέματα των εξετάσεων του ελληνικού δικηγορικού συλλόγου, 5 πεδία δικαίου, με υποχρεωτικές παραπομπές σε διατάξεις και πραγματικά περιστατικά. Τρισδιάστατη βαθμολόγηση, LLM-as-judge με meta-evaluation (τα span-based rubrics βελτιώνουν τη συμφωνία με ειδικούς). 13 μοντέλα· τα κορυφαία ξεπερνούν τον μέσο ειδικό αλλά όχι το 95ο εκατοστημόριο.

**Για το GRAIL:** Το μόνο ελληνόγλωσσο νομικό benchmark με έλεγχο παραπομπών που εντόπισα. Εξωτερικό anchor για KT-15, VT-701 και μέτρο για INV-L01.

**Πηγές:** [GreekBarBench (arXiv 2505.17267), 2025](https://arxiv.org/abs/2505.17267)

### GDPval — blinded pairwise σύγκριση με ειδικούς

*research, pilot* · SOTA-LAW-06

44 επαγγέλματα, μεταξύ τους οι δικηγόροι· εργασίες από επαγγελματίες με μέσο όρο 14 ετών εμπειρίας, τυφλή βαθμολόγηση ανά ζεύγος από ειδικούς. Στο gold subset το καλύτερο μοντέλο κρίθηκε ισοδύναμο ή καλύτερο (win-or-tie) στο 47,6%. Inter-rater agreement 71%· αυτόματος grader 66%. Οι συγγραφείς αναγνωρίζουν ότι οι κριτές μπορεί να αναγνώριζαν την προέλευση από υφολογικές ενδείξεις.

**Για το GRAIL:** Πλησιέστερο πρωτόκολλο στο KT-15. Δείχνει δύο αδυναμίες που το KT-15 πρέπει να καλύψει: διαρροή τυφλότητας από το ύφος και όριο συμφωνίας κριτών.

**Πηγές:** [GDPval (arXiv 2510.04374), 2025](https://arxiv.org/abs/2510.04374) · [GDPval full text (HTML), 2025](https://arxiv.org/html/2510.04374)

### Vals Legal AI Report (VLAIR) και Legal Research Report — lawyer baseline

*research, pilot* · SOTA-LAW-07

(α) 27/02/2025: 7 εργασίες με ομάδα ελέγχου δικηγόρων. Τα εμπορικά νομικά AI (Harvey-class) ξεπέρασαν τη baseline σε data extraction, document Q&A, summarization, transcript analysis· η baseline ισοφάρισε το καλύτερο εργαλείο στη χρονολόγηση· οι δικηγόροι υπερείχαν σε redlining και EDGAR research.<br>(β) 14/10/2025: 200 ερωτήσεις αμερικανικής νομικής έρευνας, τυφλή βαθμολόγηση από δικηγόρους και βιβλιοθηκονόμους (accuracy 50%, authoritativeness 40%, appropriateness 10%). Νομικά AI 74–78%, γενικής χρήσης AI 78%, baseline έμπειρων δικηγόρων 69%. Κύριος διαφοροποιητής οι πηγές και οι παραπομπές (+6 μονάδες authoritativeness για τα νομικά εργαλεία)· το γενικής χρήσης AI υπερείχε σε πρόσφατη πληροφορία μέσω web search. Η έκθεση αναφέρει >370 καταγεγραμμένες περιπτώσεις δικογράφων με παραισθημένες παραπομπές παγκοσμίως.

**Για το GRAIL:** Υπαρκτό πρωτόκολλο «AI έναντι δικηγόρων» για το KT-15. Η υπεροχή εξαρτάται από την εργασία (στρωματοποίηση), και η baseline έμπειρων δικηγόρων έχει ήδη ξεπεραστεί στην αμερικανική νομική έρευνα· οι δυσκολότεροι συγκριτές είναι τα συστήματα. Μόνο δίκαιο ΗΠΑ.

**Πηγές:** [Vals Legal AI Report (VLAIR), 02/2025, 2025](https://www.vals.ai/vlair) · [VLAIR Legal Research Report (14/10/2025), 2025](https://www.vals.ai/industry-reports/vlair-10-14-25)

### LegalAgentBench — αξιολόγηση νομικών agents με progress rate

*research, research-prototype* · SOTA-LAW-08

17 corpora, 37 εργαλεία, 300 σχολιασμένες εργασίες (κινεζικό δίκαιο). Μετρά και την πρόοδο των ενδιάμεσων βημάτων (progress rate μέσω keyword analysis).

**Για το GRAIL:** Πρότυπο για end-to-end ροές (OS-01) με μέτρηση ενδιάμεσων βημάτων, συμβατό με receipts ανά βήμα.

**Πηγές:** [LegalAgentBench (arXiv 2412.17259), 2024](https://arxiv.org/abs/2412.17259)

### Νομική ανάκτηση (CLERC, LegalBench-RAG)

*research, research-prototype* · SOTA-LAW-09

CLERC: ανάκτηση αποφάσεων και retrieval-augmented analysis· zero-shot recall@1000 48,3%· το μοντέλο με τα υψηλότερα ROUGE F-scores είχε και τις περισσότερες παραισθήσεις. LegalBench-RAG: 6.858 ζεύγη πάνω σε >79M χαρακτήρες, ανάκτηση ελάχιστων σχετικών snippets.

**Για το GRAIL:** Στηρίζει τις επιλογές του CMP-LAW-05 (πολυστρατηγική ανάκτηση, coverage report, καμία εμπιστοσύνη χωρίς CMP-LAW-08). Το pinpoint snippet είναι προϋπόθεση ελέγχου στήριξης πρότασης.

**Πηγές:** [CLERC (arXiv 2406.17186), 2024](https://arxiv.org/abs/2406.17186) · [LegalBench-RAG (arXiv 2408.10343), 2024](https://arxiv.org/abs/2408.10343)

### Akoma Ntoso / AKN4EU, ELI, ECLI

*standard, production* · SOTA-LAW-10

Akoma Ntoso v1.0 (OASIS Standard, 29/08/2018): FRBR levels (Work, Expression, Manifestation, Item)· ισχύς με @start/@end και efficacy με @startEfficacy/@endEfficacy· active/passive modifications για point-in-time ενοποίηση. AKN4EU: ευρωπαϊκό profile, ρητά work in progress. ELI: 4 πυλώνες (URI, οντολογία FRBR, RDFa/JSON-LD, συγχρονισμός με sitemap/Atom). ECLI: πενταμερές αναγνωριστικό + Dublin Core (Council conclusions 29/04/2011). Η εφαρμογή ELI/ECLI στην Ελλάδα δεν επαληθεύτηκε.

**Για το GRAIL:** Κανονικά πρότυπα για CMP-LAW-02, CMP-KNW-05 και ταυτοποίηση αυθεντιών στο CMP-LAW-08. Η διάκριση ισχύος/efficacy τεκμηριώνει το ανώτερο του INV-L04.

**Πηγές:** [Akoma Ntoso Version 1.0 Part 1: XML Vocabulary (OASIS Standard), 2018](https://docs.oasis-open.org/legaldocml/akn-core/v1.0/akn-core-v1.0-part1-vocabulary.html) · [AKN4EU (EU Vocabularies), 2026](https://op.europa.eu/en/web/eu-vocabularies/akn4eu) · [ELI register — About, 2026](https://eur-lex.europa.eu/eli-register/about.html) · [European Case Law Identifier (ECLI) — e-Justice, 2026](https://e-justice.europa.eu/topics/legislation-and-case-law/european-case-law-identifier-ecli_en)

### LegalRuleML Core 1.0

*standard, production* · SOTA-LAW-11

OASIS Standard (30/08/2021): defeasibility (strict/defeasible rules, defeaters, Override για superiority)· δεοντικά Obligation, Permission, Prohibition, Right· temporal characteristics InForce, Efficacious, Applicability, Enforceability· μεταδεδομένα Jurisdiction/Authority· Alternatives για πολλαπλές ερμηνείες· isomorphism N:M κανόνα ↔ πηγής.

**Για το GRAIL:** Αναφορά για τον δεοντικό/defeasible πυρήνα του CMP-LAW-04, τη διατήρηση εναλλακτικών ερμηνειών (ATMS §8.8) και την ιχνηλασιμότητα κανόνα → διάταξη as-of· τεκμηριώνει το ανώτερο του INV-L04.

**Πηγές:** [LegalRuleML Core Specification Version 1.0 (OASIS Standard), 2021](https://docs.oasis-open.org/legalruleml/legalruleml-core-spec/v1.0/legalruleml-core-spec-v1.0.html)

### Rules-as-code: Catala, OpenFisca, Blawx

*tool, pilot* · SOTA-LAW-12

Catala (ICFP 2021): default logic ως first-class χαρακτηριστικό (README)· απόδειξη ορθότητας των βασικών βημάτων μεταγλώττισης σε F*· στην αξιολόγηση εντόπισε ένα bug σε επίσημη υλοποίηση· κατά το README research project της Inria με compiler «yet unstable». OpenFisca: σε παραγωγή σε δημόσιους φορείς (Βαρκελώνη, LexImpact της Γαλλικής Εθνοσυνέλευσης, Ιαπωνία). Blawx: reasoner SWI-Prolog/s(CASP) με εξηγήσεις· «not production-quality», για εκπαιδευτική/πειραματική χρήση.

**Για το GRAIL:** Υπαρκτή εναλλακτική έναντι της μελλοντικής LexDSL (GP-8) για τους εκτελέσιμους κανόνες των CMP-LAW-04 και CMP-LAW-10· ο Catala μπορεί να λειτουργήσει και ως ανεξάρτητη N-version αναφορά.

**Πηγές:** [Catala: A Programming Language for the Law (arXiv 2103.03198), 2021](https://arxiv.org/abs/2103.03198) · [CatalaLang/catala (GitHub README), 2026](https://github.com/CatalaLang/catala) · [OpenFisca, 2026](https://openfisca.org/en/) · [Lexpedite/blawx (GitHub), 2026](https://github.com/Lexpedite/blawx)

### Argumentation και θεωρία αποδείξεων (Carneades· hybrid theory· legal probabilism)

*research, research-prototype* · SOTA-LAW-13

Carneades: μοντέλο επιχειρημάτων και βάρους απόδειξης (Gordon, Prakken, Walton, Artificial Intelligence 2007) και λογισμικό 4.3 (2017) με argumentation schemes και αξιολόγηση επιχειρημάτων· 2η θέση και στα τέσσερα grounded tracks του ICCMA 2015. Hybrid theory επιχειρημάτων, ιστοριών και ποινικής μαρτυρίας (Bex, van Koppen, Prakken, Verheij, AI & Law 2010). Legal probabilism (SEP, 2021): Bayesian network idioms (Fenton, Neil, Lagnado 2013)· ανοιχτά προβλήματα paradoxes of proof και naked statistical evidence. Για τα άρθρα 2007/2010 επαληθεύτηκαν μόνο μεταδεδομένα.

**Για το GRAIL:** Αναφορά για typed argument graphs (CMP-LAW-04, CMP-CCP-02) και για το CMP-LAW-03: βάρος απόδειξης, αποδεικτικά standards, σύγκριση σεναρίων.

**Πηγές:** [Carneades Argumentation System, 2017](https://carneades.github.io/) · [Gordon, Prakken, Walton — The Carneades model of argument and burden of proof (Artificial Intelligence 171:875–896), Semantic Scholar record, 2007](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1016/j.artint.2007.04.010?fields=title,authors,year,venue,journal,abstract) · [Bex, van Koppen, Prakken, Verheij — A hybrid formal theory of arguments, stories and criminal evidence (AI & Law 18:123–152), Semantic Scholar record, 2010](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1007/s10506-010-9092-x?fields=title,authors,year,venue,journal,abstract) · [Legal Probabilism (Stanford Encyclopedia of Philosophy), 2021](https://plato.stanford.edu/entries/legal-probabilism/)

### Πρόβλεψη δικαστικών αποφάσεων και η κριτική της· adversarial προσομοίωση δίκης

*research, research-prototype* · SOTA-LAW-14

Chalkidis, Androutsopoulos, Aletras (ACL 2019): πρόβλεψη αποφάσεων ΕΔΔΑ. Medvedeva, Wieling, Vols (AI & Law 31:195–212, online 2022): διακρίνουν outcome identification, outcome-based judgement categorisation και outcome forecasting και κατατάσσουν τις υπάρχουσες μελέτες σε αυτές. AgentCourt (2024, v2 2025): προσομοίωση 1.000 αστικών υποθέσεων με adversarial evolvable lawyer agents· +12,1% έναντι των αρχικών agents (CourtBench).

**Για το GRAIL:** Στηρίζει τον στόχο του EXP-09 (κρίσιμοι λόγοι αντί για έκβαση)· το leakage-free as-of backtest (VT-705) αντιστοιχεί στο forecasting της διάκρισης Medvedeva (συναγωγή). Προηγούμενο γεννήτριας αντεπιχειρημάτων για το CMP-LAW-07.

**Πηγές:** [Neural Legal Judgment Prediction in English (arXiv 1906.02059), 2019](https://arxiv.org/abs/1906.02059) · [Medvedeva, Wieling, Vols — Rethinking the field of automatic prediction of court decisions (AI & Law 31:195–212), Semantic Scholar record with abstract, 2022](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1007/s10506-021-09306-3?fields=title,authors,year,venue,journal,abstract) · [AgentCourt (arXiv 2408.08089), 2024](https://arxiv.org/abs/2408.08089)

### Πρότυπα δεδομένων νομικών υποθέσεων (SALI LMSS, FOLIO, LEDES)

*standard, production* · SOTA-LAW-15

SALI LMSS: κοινή γλώσσα κατάταξης υποθέσεων, χρόνου, εγγράφων και οργανισμών. FOLIO (μετονομασία του SOLI): >18.000 νομικές έννοιες σε OWL, CC-BY 4.0, με μεταφράσεις σε πολλές γλώσσες· στόχος η διαλειτουργικότητα πολλών νομικών προτύπων. LEDES: XML Ebilling 2.2, LEDES API v1 (2020), UTBMS, budgeting format.

**Για το GRAIL:** Εξωτερικά λεξιλόγια για το ICD-19 (matters, εργασίες, παραδοτέα, billing) και για τη διαλειτουργικότητα του CMP-LAW-01. Η κάλυψη ελληνικών κατηγοριών δικαίου δεν επαληθεύτηκε.

**Πηγές:** [SALI Alliance — LMSS, 2026](https://www.sali.org/) · [FOLIO — Federated Open Legal Information Ontology, 2025](https://openlegalstandard.org/) · [LEDES, 2026](https://ledes.org/)

### EU AI Act (Κανονισμός 2024/1689) όπως αποτυπώνεται στον tracker (ενημ. 31/08/2026)

*standard, production* · SOTA-LAW-16

- Annex III 8(a): συστήματα για χρήση από ή για λογαριασμό δικαστικής αρχής (έρευνα/ερμηνεία πραγματικών και δικαίου, εφαρμογή), ή ανάλογη χρήση σε ADR.<br>- Art. 3(3), 3(11): provider είναι και όποιος αναπτύσσει σύστημα και το θέτει σε λειτουργία για ίδια χρήση.<br>- Art. 6(3): εξαιρέσεις από τον υψηλό κίνδυνο· το profiling φυσικών προσώπων μένει πάντα υψηλού κινδύνου· 6(4): τεκμηρίωση και καταχώριση (Art. 49(2)) όταν ο πάροχος κρίνει ότι σύστημα του Annex III δεν είναι υψηλού κινδύνου.<br>- Art. 4 (AI literacy, από 02/02/2025): εμφανίζεται τροποποιημένο από το Digital Omnibus (νέες παρ. 2–3)· η ακριβής ισχύουσα διατύπωση δεν επαληθεύτηκε.<br>- Art. 5(1)(f): απαγόρευση συμπερασμού συναισθημάτων σε χώρο εργασίας/εκπαίδευσης, εκτός ιατρικών λόγων ή λόγων ασφάλειας.<br>- Art. 14(4)(b) automation bias· Art. 26 υποχρεώσεις deployer: μόνο για υψηλό κίνδυνο.<br>- Art. 50: 50(1) δήλωση αλληλεπίδρασης με AI (provider)· 50(2) machine-readable σήμανση συνθετικού περιεχομένου, και κειμένου (provider)· 50(4) εξαίρεση editorial ελέγχου μόνο για κείμενα που δημοσιεύονται για ενημέρωση του κοινού σε θέματα δημόσιου ενδιαφέροντος.<br>- Ημερομηνίες: Art. 50 από 02/08/2026, μεταβατικό 50(2) έως 02/12/2026· Chapter III §1–3 για Annex III από 02/12/2027, για Annex I από 02/08/2028. Πρόταση Omnibus 19/11/2025· αριθμός πράξης και έναρξη ισχύος δεν επαληθεύτηκαν.

**Για το GRAIL:** Ορίζει τα Control Records του CMP-LAW-09 και το EXP-19. Ο βοηθός δικηγόρου κατά κανόνα δεν είναι Annex III 8(a)· χρήση σε ADR ή για λογαριασμό δικαστικής αρχής θα τον καθιστούσε υψηλού κινδύνου. Οι υποχρεώσεις provider του Art. 50 ισχύουν ήδη.

**Πηγές:** [AI Act Annex III, 2024](https://artificialintelligenceact.eu/annex/3/) · [AI Act Article 3, 2024](https://artificialintelligenceact.eu/article/3/) · [AI Act Article 4 (with Digital Omnibus amendment markers), 2026](https://artificialintelligenceact.eu/article/4/) · [AI Act Article 5, 2024](https://artificialintelligenceact.eu/article/5/) · [AI Act Article 6, 2024](https://artificialintelligenceact.eu/article/6/) · [AI Act Article 14, 2024](https://artificialintelligenceact.eu/article/14/) · [AI Act Article 26, 2024](https://artificialintelligenceact.eu/article/26/) · [AI Act Article 49, 2024](https://artificialintelligenceact.eu/article/49/) · [AI Act Article 50, 2024](https://artificialintelligenceact.eu/article/50/) · [AI Act implementation timeline (updated 31/08/2026), 2026](https://artificialintelligenceact.eu/implementation-timeline/) · [Digital Omnibus on AI Regulation Proposal (European Commission), 2025](https://digital-strategy.ec.europa.eu/en/library/digital-omnibus-ai-regulation-proposal)

### Εγκεκριμένο από ρυθμιστή AI-driven δικηγορικό γραφείο (SRA, Αγγλία και Ουαλία)

*system, production* · SOTA-LAW-17

Η SRA ενέκρινε στις 06/05/2025 το πρώτο AI-driven γραφείο (είσπραξη οφειλών μέσω small claims έως τη δίκη). Δικλίδες: επώνυμοι ρυθμιζόμενοι solicitors φέρουν την τελική ευθύνη για κάθε έξοδο· το σύστημα δεν προτείνει νομολογία, ως «high-risk area» για LLMs· δεν είναι αυτόνομο και προχωρά μόνο σε βήμα που ενέκρινε ο πελάτης· διαδικασίες για συγκρούσεις συμφερόντων και απόρρητο· αυξημένη αρχική εποπτεία. Όπως κάθε ρυθμιζόμενο γραφείο, οφείλει ελάχιστη ασφαλιστική κάλυψη.

**Για το GRAIL:** Ρυθμιστικό προηγούμενο για το «νομικό ίδρυμα» του T7· επιβεβαιώνει την υπογραφή Principal (ADR-0026)· ο αποκλεισμός νομολογίας αφορά το INV-L01 (DEC-LAW-03).

**Πηγές:** [SRA approves first AI-driven law firm, 2025](https://www.sra.org.uk/sra/news/press/garfield-ai-authorised/)

### Cedar — analysable policy language

*tool, pilot* · SOTA-LAW-18

Γλώσσα εξουσιοδότησης με sound και complete λογική κωδικοποίηση για ακριβή ανάλυση πολιτικών· ιδιότητες σχεδίασης αποδεδειγμένες σε Lean· υλοποίηση σε Rust, open source· καλύτερη απόδοση από OpenFGA και Rego. Χρήση σε παραγωγή δεν επαληθεύτηκε από την πηγή.

**Για το GRAIL:** Υποψήφια policy language για τα Control Records του CMP-LAW-09 (ADR-0010, Cedar-class [X]): μηχανικός έλεγχος ότι οι κανονιστικοί έλεγχοι δεν συγκρούονται.

**Πηγές:** [Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization (arXiv 2403.04651), 2024](https://arxiv.org/abs/2403.04651)

### Cognitive forcing έναντι overreliance

*research, research-prototype* · SOTA-LAW-19

Πείραμα με 199 συμμετέχοντες: οι cognitive forcing functions μείωσαν σημαντικά την υπερβολική εμπιστοσύνη στο AI, περισσότερο από απλές εξηγήσεις. Κόστος: χαμηλότερη ικανοποίηση· ωφελούνται περισσότερο όσοι έχουν υψηλό κίνητρο νοητικής προσπάθειας.

**Για το GRAIL:** Μηχανισμός για ουσιαστικό, όχι τυπικό, sign-off του Principal (INV-L02, CMP-HUM-01)· συνδέεται με το Art. 14(4)(b).

**Πηγές:** [To Trust or to Think (arXiv 2102.09692), 2021](https://arxiv.org/abs/2102.09692)

### eIDAS 2 / EUDI Wallet και OpenID4VP 1.0

*standard, production* · SOTA-LAW-20

Κανονισμός 2024/1183 (11/04/2024, European Digital Identity Framework): κατά την αιτ. 56, ιδιώτες relying parties που οφείλουν strong user authentication πρέπει να δέχονται EUDI Wallets. OpenID4VP 1.0: Final, 09/07/2025, με DCQL, selective disclosure, cross-device flows· υποστηρίζει W3C VC, ISO mdoc, SD-JWT VC.

**Για το GRAIL:** Συγκεκριμένη σύνδεση για αυθεντικοποίηση και επαλήθευση ιδιοτήτων πελάτη (π.χ. εκπροσώπηση νομικού προσώπου) στο CMP-LAW-12 και στο ICD-23· εξειδικεύει το «eIDAS/OIDC» του προχείρου. Διαθεσιμότητα wallet στην Ελλάδα άγνωστη.

**Πηγές:** [Regulation (EU) 2024/1183 (European Digital Identity Framework), 2024](https://eur-lex.europa.eu/eli/reg/2024/1183/oj) · [OpenID for Verifiable Presentations 1.0 (Final), 2025](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)

### Ελληνικά νομικά δεδομένα και πηγές

*research, pilot* · SOTA-LAW-21

Greek Legal Code: >47.000 κατηγοριοποιημένα ελληνικά νομοθετήματα (NLLP 2021). search.et.gr: αναζήτηση ΦΕΚ με ελεύθερο κείμενο και ειδική αναζήτηση νομοθεσίας· δεν αναφέρεται API ή bulk/open data. Αναζήτηση αποφάσεων Αρείου Πάγου: web φόρμα με πεδία αριθμού, ημερομηνιών και διατάξεων· δεν φάνηκε ECLI ούτε API. Αρχική σελίδα ΔΣΑ (09/2026): καμία ορατή οδηγία για AI.

**Για το GRAIL:** Αφορά την attested ingestion των CMP-LAW-02 και CMP-KNW-04 και τα δεδομένα backtest του EXP-09. Η απουσία εμφανούς ECLI/API κάνει την ταυτοποίηση και την πληρότητα νομολογίας ανοιχτό ζήτημα.

**Πηγές:** [Multi-granular Legal Topic Classification on Greek Legislation (arXiv 2109.15298), 2021](https://arxiv.org/abs/2109.15298) · [Εθνικό Τυπογραφείο — Αναζήτηση ΦΕΚ, 2026](https://search.et.gr/el/) · [Άρειος Πάγος — Αναζήτηση αποφάσεων, 2026](https://www.areiospagos.gr/nomologia/apofaseis.asp) · [ΔΣΑ (Athens Bar Association), 2026](https://www.dsa.gr/)

### Κανονιστικό πλαίσιο δεδομένων και επαγγέλματος (EDPB, CCBE)

*standard, production* · SOTA-LAW-22

EDPB Opinion 28/2024 (18/12/2024): ανωνυμία AI models (πρέπει να αποδεικνύεται), legitimate interest, συνέπειες παράνομης επεξεργασίας στην ανάπτυξη. EDPB Guidelines 02/2025 για blockchain (14/04/2025, διαβούλευση έως 09/06/2025): να αποφεύγεται η αποθήκευση προσωπικών δεδομένων σε blockchain όταν συγκρούεται με τις αρχές. CCBE: Guide on the use of AI-based tools by lawyers and law firms in the EU (31/03/2022).

**Για το GRAIL:** Στοιχεία για το EXP-19 (crypto-shredding έναντι append-only), για τη μάθηση μεταξύ υποθέσεων (GAP-LAW-06) και για τα Control Records απορρήτου του CMP-LAW-09.

**Πηγές:** [EDPB Opinion 28/2024 on AI models, 2024](https://www.edpb.europa.eu/our-work-tools/our-documents/opinion-board-art-64/opinion-282024-certain-data-protection-aspects_en) · [EDPB adopts guidelines on processing personal data through blockchains, 2025](https://www.edpb.europa.eu/news/news/2025/edpb-adopts-guidelines-processing-personal-data-through-blockchains-and-ready_en) · [CCBE AI4Lawyers (guide listing), 2022](https://www.ccbe.eu/actions/events/ai4lawyers/)

### Τυπική αριθμητική ημερομηνιών με ανίχνευση αμφισημίας (Catala dates-calc, ESOP 2024)

*tool, research-prototype* · SOTA-LAW-23

Βιβλιοθήκη (OCaml, Python, C) για ημερομηνίες και περιόδους σε ημέρες/μήνες/έτη, με ρητά ορισμένους τελεστές στρογγυλοποίησης και επιλέξιμα rounding modes για την πρόσθεση μηνών/ετών. Συνοδεύει τη δημοσίευση «Formalizing Date Arithmetic and Statically Detecting Ambiguities for the Law» (ESOP 2024). Διαβάστηκε μόνο το README, όχι το άρθρο.

**Για το GRAIL:** Κλείνει την κλάση σφάλματος που ο διπλός υπολογισμός του CMP-LAW-10 δεν πιάνει: δύο μέθοδοι μπορεί να συμφωνούν στην ίδια σιωπηλή στρογγυλοποίηση ενώ ο κανόνας είναι αμφίσημος.

**Πηγές:** [CatalaLang/dates-calc (GitHub; cites the ESOP 2024 paper), 2024](https://github.com/CatalaLang/dates-calc)

### Moise / JaCaMo — οργανωσιακό μοντέλο πολυπρακτορικών συστημάτων

*tool, research-prototype* · SOTA-LAW-24

Οργανωσιακή πλατφόρμα για πολυπρακτορικά συστήματα με ρόλους, ομάδες και αποστολές (missions): agents και μηχανισμοί επιβολής αναφέρονται σε ρητή οργανωσιακή προδιαγραφή. Μέρος της πλατφόρμας JaCaMo· τελευταία ενημέρωση σελίδας 12/2023.

**Για το GRAIL:** Πλησιέστερος γενικός συγκριτής για τα Organization Charters του CMP-LAW-11 (και του CMP-CIV-02). Δεν αξιολόγησα αν είναι ανώτερος του Charter DSL με ελέγχους Alloy/SMT.

**Πηγές:** [Moise — organisational platform for MAS (part of JaCaMo), 2023](https://moise-lang.github.io/)

### Γαλλία: απαγόρευση judge analytics (ν. 2019-222, άρθ. 33)

*standard, production* · SOTA-LAW-25

Ο ν. 2019-222 απαγορεύει την επαναχρησιμοποίηση δεδομένων ταυτότητας δικαστών με σκοπό την αξιολόγηση, ανάλυση, σύγκριση ή πρόβλεψη των επαγγελματικών τους πρακτικών, με ποινικές κυρώσεις. Επαληθεύτηκε το κείμενο της δημοσίευσης στην επίσημη εφημερίδα· η τρέχουσα ενοποιημένη μορφή δεν ελέγχθηκε.

**Για το GRAIL:** Ευρωπαϊκό προηγούμενο για το DEC-LAW-04: η μοντελοποίηση σε επίπεδο δικαστή μπορεί να είναι παράνομη σε κράτος μέλος. Για την Ελλάδα δεν ξέρω.

**Πηγές:** [Loi n° 2019-222 (Légifrance, JORF), 2019](https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000038261631)
