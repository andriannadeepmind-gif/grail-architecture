# Πλατφόρμα σχεδιασμού — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### OMG SysML 2.0 + KerML 1.0 + Systems Modeling API & Services 1.0

*standard, production* · SOTA-PLT-01

Final adoption 21-07-2025, formal έκδοση Σεπτ. 2025 και για τα τρία. Το API έχει PIM και PSMs, με REST/HTTP και JSON schemas για OpenAPI/KerML/SysML. Το Cookbook καλύπτει Projects/Commits/Branches/Tags/Elements/Queries. Η OMG ανέφερε (07-2025) reference implementation και conformance test suite υπό ανάπτυξη· η σημερινή κατάστασή της δεν τεκμηριώνεται.

**Για το GRAIL:** Η μόνη προτυποποιημένη γλώσσα και API για την έδρα. Η γραμμή βάσης για τις ADR-0002 και ICD-32.

**Πηγές:** [OMG Approves Final Adoption of the SysML V2 Specification, 2025](https://www.omg.org/news/releases/pr2025/07-21-25.htm) · [OMG SysML specification versions, 2025](https://www.omg.org/spec/SysML/) · [OMG KerML specification, 2025](https://www.omg.org/spec/KerML/) · [Systems Modeling API and Services, 2025](https://www.omg.org/spec/SystemsModelingAPI/) · [SysML-v2-API-Cookbook, 2026 (accessed)](https://github.com/Systems-Modeling/SysML-v2-API-Cookbook)

### KerML 1.1 Beta 2 / SysML 2.1 Beta 2 (αναθεωρήσεις υπό εξέλιξη)

*standard, pilot* · SOTA-PLT-02

Η pilot release 2026-07 (0.61.0, 20-08-2026) «brings the implementation into conformance with the KerML 1.1 Beta 2 and SysML 2.1 Beta 2 metamodels». Ακολούθησε η 0.62.0 (11-09-2026). Οι δημόσιες σελίδες προδιαγραφών της OMG δείχνουν μόνο τις 2.0/1.0 formal.

**Για το GRAIL:** Κίνδυνος version drift: οι libraries του SysON είναι «SysMLv2 and KerML 2025-07» (από την 2025.10.0). Χρειάζεται pin έκδοσης.

**Πηγές:** [SysML-v2-Pilot-Implementation releases, 2026](https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation/releases) · [SysON release notes, 2026](https://doc.mbse-syson.org/syson/main/user-manual/release-notes/release-notes.html)

### Eclipse SysON v2026.x (Obeo + CEA, EPL-2.0)

*tool, pilot* · SOTA-PLT-03

Web γραφικό εργαλείο SysML v2 με textual import/export .sysml ανά document («some concept are still under development»), GraphQL InsertTextualSysMLv2/UploadDocument, GET document ως κείμενο (Accept: text/html) και project archive ZIP με manifest documentIdsToName. Όρια: 150.000 σημασιολογικά στοιχεία, 1.000 ανά representation, 80 ταυτόχρονοι χρήστες, ~10 MB. «SysON doesn't include built-in version control tools»· προτείνει ZIP ανά έκδοση μέσα σε Git. «SysON does not include built-in mechanisms for authentication or authorization». REST API: ένα commit/branch ανά project, «API for creating additional commits isn't functional». Validation «experimental… not recommended for production». Satisfy στο Requirements View «not yet available», αλλά textual export SatisfyRequirementUsage από την 2026.1.0· derivation edges (#original/#derive) από την 2026.9.0. Η αναφορά συντακτικών σφαλμάτων που αφήνουν upload «partially imported» είναι στην 2026.11.0 (work in progress). Εκδόσεις: v2026.7.0 (10-07-2026), v2026.9.0 (09-09-2026). Ωριμότητα: teaching/research/industrial pilot· Early Adopter Program για επιχειρησιακή χρήση το 2026.

**Για το GRAIL:** Η επιλεγμένη ζωντανή πλατφόρμα και το τοπικό image v2026.7.0 (επιβεβαιωμένο με docker inspect). Ισχυρή στην επεξεργασία από agents, στα διαγράμματα και στα όρια κλίμακας. Αδύναμη σε ιστορικό, έλεγχο πρόσβασης, fidelity του κειμένου και satisfy/verify.

**Πηγές:** [SysON SysML v2 textual format, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/import-export-textual.html) · [SysON release notes, 2026](https://doc.mbse-syson.org/syson/main/user-manual/release-notes/release-notes.html) · [SysON Version control and change management, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/cm.html) · [SysON Security and compliance, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/security.html) · [SysON FAQ, 2026](https://doc.mbse-syson.org/syson/main/user-manual/faq/faq.html) · [SysON Scaling limits, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/scaling-limits.html) · [SysON API details, 2026](https://doc.mbse-syson.org/syson/main/developer-guide/api/api-details.html) · [SysON APIs cookbook, 2026](https://doc.mbse-syson.org/syson/main/developer-guide/api/api-cookbook.html) · [SysON Requirements management, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/requirement-management.html) · [SysON Validation, 2026](https://doc.mbse-syson.org/syson/main/user-manual/features/validation.html) · [SysON home (maturity, Early Adopter), 2026](https://mbse-syson.org/) · [eclipse-syson/syson releases, 2026](https://github.com/eclipse-syson/syson/releases) · [eclipse-syson/syson (Obeo, CEA), 2026](https://github.com/eclipse-syson/syson)

### mcp-syson 0.8.7 (Casys AI, MIT, 05-09-2026)

*tool, pilot* · SOTA-PLT-04

MCP provider για SysON (GraphQL + REST) με 31 εργαλεία syson_* (επιβεβαιωμένα από το τοπικό tool listing). Κανένα δεν κάνει textual export, commit ή diff. Fail-closed delete: αναφέρει «deleted: true» μόνο αφού REST GET αποδείξει απουσία. Read-back για κρίσιμες εγγραφές· OUTCOME_UNKNOWN «Do not retry». «SysON and its PostgreSQL database remain authoritative for live model state». Η AQL μπορεί να μεταλλάξει (eSet) και να παρακάμψει το editor command path. Οι τιμές είναι αδιάστατες (δεν διαβάζει MeasurementReferences). Η 0.8.4 (30-08-2026) πιστοποιήθηκε έναντι digest-pinned SysON v2026.7.0. Το stdio αφαιρέθηκε στην 0.4.0 και επανήλθε («Native --stdio») στην 0.8.0.

**Για το GRAIL:** Η σημερινή λύση για ζωντανή εγγραφή από agents, με τεκμηριωμένα όρια ασφάλειας.

**Πηγές:** [Casys-AI/mcp-syson, 2026](https://github.com/Casys-AI/mcp-syson) · [mcp-syson CHANGELOG, 2026](https://raw.githubusercontent.com/Casys-AI/mcp-syson/main/CHANGELOG.md) · [mcp-syson capabilities and safety, 2026](https://github.com/Casys-AI/mcp-syson/blob/main/docs/capabilities-and-safety.md)

### OMG SysML v2 Pilot Implementation

*tool, pilot* · SOTA-PLT-05

Reference Xtext parser/editor για .sysml και .kerml μέσα στο Eclipse, με Jupyter kernel και PlantUML visualization. EPL από την 2026-04· 0.62.0 στις 11-09-2026. Τα README του repo και του SysML-v2-Release δεν τεκμηριώνουν headless/CLI parse-validate για CI.

**Για το GRAIL:** Ανεξάρτητος reference oracle. Η χρήση του σε CI απαιτεί πείραμα (π.χ. μέσω Jupyter kernel ή Xtext standalone).

**Πηγές:** [SysML-v2-Pilot-Implementation, 2026](https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation) · [Pilot releases, 2026](https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation/releases) · [SysML-v2-Release, 2026 (accessed)](https://github.com/Systems-Modeling/SysML-v2-Release)

### SysML v2 API Services (reference, PoC)

*tool, research-prototype* · SOTA-PLT-06

«Proof-of-concept pilot implementation for the Systems Modeling API and Services» με PostgreSQL. Release 2026-04 (14-05-2026), άδεια EPL.

**Για το GRAIL:** Πιθανός provider για ICD-32 (commits/branches), όχι βαθμού παραγωγής.

**Πηγές:** [SysML-v2-API-Services, 2026 (accessed)](https://github.com/Systems-Modeling/SysML-v2-API-Services) · [SysML-v2-API-Services releases, 2026](https://github.com/Systems-Modeling/SysML-v2-API-Services/releases)

### OpenMBEE Flexo MMS SysML v2 (+ Flexo MCP)

*system, pilot* · SOTA-PLT-07

REST/HTTP PSM του Systems Modeling API πάνω στο Flexo, graph-native/RDF, με Layer 1 σε Apache Jena Fuseki quadstore (Apache-2.0). Beta («try out the beta»), με diff μοντέλων. Ο Flexo MCP server έχει 35 εργαλεία, μεταξύ τους Branches, Commits και Merge· 10 commits.

**Για το GRAIL:** Η μόνη ανοιχτή λύση με ιστορικό μέσα στο πρότυπο API. Εναλλακτική έδρα ή provider για ICD-32, μη ώριμη και χωρίς ενσωμάτωση με SysON.

**Πηγές:** [OpenMBEE Flexo, 2026 (accessed)](https://www.openmbee.org/flexo.html) · [flexo-mms-sysmlv2, 2026 (accessed)](https://github.com/Open-MBEE/flexo-mms-sysmlv2) · [flexo-mms-layer1-service, 2026 (accessed)](https://github.com/Open-MBEE/flexo-mms-layer1-service) · [flexo-mms-sysmlv2-mcp, 2026 (accessed)](https://github.com/Open-MBEE/flexo-mms-sysmlv2-mcp)

### Syside (Sensmetry): Editor / Modeler / Automator

*tool, production* · SOTA-PLT-08

Text-first SysML v2 στο VS Code. Το Editor είναι δωρεάν· τα Modeler και Automator «paid-for and licensed». Headless CLI για validate/format/export διαγραμμάτων και CSV σε CI/CD. Διαγράμματα με τη μηχανή Tom Sawyer. On-prem και air-gapped. Roadmap (13-05-2026): v1 το Q3 2026, MCP servers, αρχική υποστήριξη SysML v2 API (Q2) και model servers (Q3) μέσω Automator. Είναι το language-aware toolchain της πρακτικής SEI 2026.

**Για το GRAIL:** Το πιο τεκμηριωμένο text+git+CI toolchain. Κόστος άδειας και εξάρτηση από vendor για την πύλη.

**Πηγές:** [Syside, 2026](https://sensmetry.com/syside/) · [Syside Automator docs, 2026](https://docs.sensmetry.com/automator/index.html) · [Syside Modeler docs, 2026](https://docs.sensmetry.com/modeler/index.html) · [Syside Roadmap Q2 2026 update, 2026](https://sensmetry.com/product-roadmap-2026-q2-update/)

### Sysand (package manager SysML v2/KerML)

*tool, pilot* · SOTA-PLT-09

Package manager για model interchange projects (.kpar, KerML clause 10.3), με official index (sysand.com) και private indexes, CLI και Python/Java APIs. MIT/Apache-2.0. Ο v1 στοχεύεται το Q3 2026.

**Για το GRAIL:** Μηχανισμός για pinned αναφορές βιβλιοθηκών ανάμεσα σε repos χωρίς συγχώνευσή τους. Χρήση git ως πηγής δεν τεκμηριώνεται στο README.

**Πηγές:** [sensmetry/sysand, 2026 (accessed)](https://github.com/sensmetry/sysand) · [Introducing Sysand, 2025](https://sensmetry.com/introducing-sysand-the-package-manager-for-the-sysml-v2-ecosystem/) · [Syside Roadmap Q2 2026 update, 2026](https://sensmetry.com/product-roadmap-2026-q2-update/)

### CATIA Magic / Cameo SysML v2 (2026x) + Teamwork Cloud

*system, production* · SOTA-PLT-10

Άμεσος αμφίδρομος συγχρονισμός κειμένου και γραφικών. «Teamwork Cloud fully conforms to the SysML v2 API and Services specification» (δήλωση vendor)· branches με επανένταξη μέσω model patch και αυτόματο merge. Η δωρεάν Community Edition: «up to 500 major elements», για μάθηση/εκπαίδευση, χωρίς δημοσιευμένο ορισμό του major element.

**Για το GRAIL:** Εμπορικός provider που καλύπτει ιστορικό και API, με vendor lock-in. Το πρόχειρο έχει ~345 IDs πριν από σχέσεις, ports και usages, οπότε η CE είναι εύλογα ανεπαρκής· ακριβής σύγκριση αδύνατη χωρίς τον ορισμό.

**Πηγές:** [CATIA Magic/Cameo SysML v2 Solution, 2026](https://docs.nomagic.com/SYSML2P/2026x/catia-magic-cameo-sysml-v2-solution-272740940.html) · [SysML v2 Community Edition, 2026](https://docs.nomagic.com/SYSML2P/2026x/catia-magic-cameo-sysml-v2-community-edition-286557495.html)

### IBM Rhapsody Systems Engineering 1.5 / 1.8

*system, production* · SOTA-PLT-11

Η 1.5 (14-10-2025) φέρνει ιδιωτικά branches έναντι του δημόσιου «main» για υιοθέτηση του SysML v2. Η 1.8 (09-07-2026) φέρνει AI MCP API και υποστήριξη air-gapped.

**Για το GRAIL:** Εμπορικό σημείο αναφοράς. Οι ανακοινώσεις δεν τεκμηριώνουν textual interchange ούτε conformance στο SysML v2 API.

**Πηγές:** [Rhapsody SE 1.8, 2026](https://www.ibm.com/new/announcements/scaling-sysml-v2-systems-engineering-with-ibm-rhapsody-systems-engineering-v1-8) · [Rhapsody SE 1.5, 2025](https://www.ibm.com/new/announcements/ibm-introduces-rhapsody-systems-engineering-v1-5-simplifying-the-adoption-of-sysml-v2-for-complex-product-development)

### PySAM (ansys-sam-sysml2)

*tool, pilot* · SOTA-PLT-12

Η 0.3.3 (03-09-2026, MIT, Beta) φορτώνει models από εργαλεία που υλοποιούν το πρότυπο SysML v2 API, επιτρέπει επεξεργασία σε Python και συγχρονίζει πίσω.

**Για το GRAIL:** Παράδειγμα Python client πάνω στο πρότυπο API. Συνδέεται με την εμπορική πλατφόρμα Ansys SAM.

**Πηγές:** [ansys-sam-sysml2 (PyPI), 2026](https://pypi.org/project/ansys-sam-sysml2/)

### Tom Sawyer SysML v2 Viewer 2.1

*tool, production* · SOTA-PLT-13

Automatic layout και ενσωμάτωση «with any SysML v2 API-compliant repository» (20-05-2026, πάνω στο reference implementation 2026-03). Είναι επίσης η μηχανή διαγραμμάτων του Syside Modeler.

**Για το GRAIL:** Διαγράμματα ως παραγόμενες προβολές (ADR-0033). Εμπορικό.

**Πηγές:** [Tom Sawyer SysML v2 Viewer 2.1, 2026](https://www.tomsawyer.com/news/tom-sawyer-software-releases-sysml-v2-viewer-2.1) · [Syside Modeler docs, 2026](https://docs.sensmetry.com/modeler/index.html)

### Ανεξάρτητοι parsers: MontiCore sysmlv2, sysml-v2-lsp

*tool, research-prototype* · SOTA-PLT-14

MontiCore: «second SysML v2 parser for comparison… with the Pilot», με CLI (java -jar MCSysMLv2.jar -i …). Τα context conditions «definitely not yet complete»· άδεια BSD-3-based. sysml-v2-lsp: ANTLR4 LSP με semantic validation (unresolved types, multiplicity, duplicates) και sysml-mcp CLI, MIT.

**Για το GRAIL:** Υποψήφιοι για N-version parsing στην πύλη, σύμφωνα με το δόγμα N-version του GRAIL. Ελλιπείς σημασιολογικοί έλεγχοι.

**Πηγές:** [MontiCore/sysmlv2, 2026 (accessed)](https://github.com/MontiCore/sysmlv2) · [daltskin/sysml-v2-lsp, 2026 (accessed)](https://github.com/daltskin/sysml-v2-lsp)

### SEI/CMU: Native AI integration for MBSE (3 layers)

*research, pilot* · SOTA-PLT-15

Τρία στρώματα (C. Dempsey, 02-09-2026): (1) AI coding assistants πάνω σε version-controlled artifacts, (2) language-aware toolchain (Syside μέσω LSP και CLI στο CI), (3) knowledge/workflow layer με Markdown οδηγούς, MCP retrieval και skill files. Ένα καθαρό validation run δείχνει μόνο ότι το model περνά τους ελέγχους· απαιτείται ανθρώπινη engineering review.

**Για το GRAIL:** Η πιο πρόσφατη τεκμηριωμένη πρακτική agent-authored MBSE: κείμενο + git + μηχανικός έλεγχος + ανθρώπινη έγκριση.

**Πηγές:** [Native AI Integration for MBSE: Three Layers, 2026](https://www.sei.cmu.edu/blog/native-ai-integration-for-model-based-systems-engineering-three-layers-that-make-it-work/)

### Έρευνα LLM → SysML v2

*research, research-prototype* · SOTA-PLT-16

SysTemp: multi-agent με template generator (το abstract δεν αναφέρει parser feedback). SysMBench: 151 σενάρια, 17 LLMs, μέγιστο SysMEval-F1 62%. KG-augmented semantic fault localization (22-06-2026): repair από <3% σε >91% μετά από fine-tuning μικρού μοντέλου, με human-in-the-loop. LLM semantic alignment (ISSE 2025).

**Για το GRAIL:** Η παραγωγή από LLM δεν είναι αξιόπιστη χωρίς μηχανικό έλεγχο και ανθρώπινη έγκριση, άρα η πύλη είναι υποχρεωτική.

**Πηγές:** [SysTemp, 2025](https://arxiv.org/abs/2506.21608) · [System Model Generation Benchmark (SysMBench), 2025](https://arxiv.org/abs/2508.03215) · [Automated Semantic Fault Localization in SysML v2, 2026](https://arxiv.org/abs/2606.23395) · [LLM-Assisted Semantic Alignment with SysML v2, 2025](https://arxiv.org/abs/2508.16181)

### Textual vs JSON interchange (element IDs)

*research, production* · SOTA-PLT-17

Η textual interchange είναι «less suited for round-trip scenarios due to the absence of element identifiers». Για round-trip προτείνεται JSON-based interchange, ιδανικά μαζί με το κείμενο (04-03-2026).

**Για το GRAIL:** Μια επανεισαγωγή από κείμενο δεν διατηρεί IDs. Ένα byte-exact JSON αντίγραφο στο git είναι ο πιθανός μετριασμός (ανεπαλήθευτο για το SysON).

**Πηγές:** [A Practical Guide for SysML v2 Adoption (Sodius Willert), 2026](https://www.sodiuswillert.com/en/blog/a-practical-guide-for-sysml-v2-adoption)

### Capella/Arcadia ↔ SysML v2

*tool, research-prototype* · SOTA-PLT-18

Arcadia library για SysML v2 (10-06-2026): «a first, foundational step», «still an early basis». Το SysML Bridge for Capella είναι custom υπηρεσία για SysML v1.4 (Eclipse UML XMI), όχι SysML v2.

**Για το GRAIL:** Το «Capella bridge» του EXP-17 δεν είναι σήμερα SysML v2 client.

**Πηγές:** [Obeo strengthens its commitment to the future of Capella, 2026](https://blog.obeosoft.com/obeo-strengthens-its-commitment-to-the-future-of-capella) · [SysML Bridge for Capella, 2026 (accessed)](https://www.obeosoft.com/en/products/sysml-bridge-for-capella/)

### Structurizr (C4 models as code)

*tool, production* · SOTA-PLT-19

DSL και όλες οι εντολές δωρεάν, εκτός του server με prebuilt binaries (v2026.06.28) που θέλει άδεια. Lite και On-Premises σε end of life.

**Για το GRAIL:** Προαιρετική C4 προβολή (architecture/workspace.dsl). Δεν βρέθηκε generator από SysML v2.

**Πηγές:** [Structurizr docs, 2026](https://docs.structurizr.com/)

### Άλλοι SysML v2 MCP servers και Gaphor

*tool, research-prototype* · SOTA-PLT-20

redsteve SysML-v2-API-MCP-Server: C++, MIT, «WORK IN PROGRESS… by no means suitable for productive use». Dassault: MCP πάνω στο SysML v2 REST API, prototype demo (02-12-2025). Gaphor: core language-agnostic από την 3.0 (01-2025)· η πλήρης υποστήριξη SysML v2 είναι ανοιχτό issue (milestone 4.0).

**Για το GRAIL:** Κανένας τεκμηριωμένα ωριμότερος από το mcp-syson για ζωντανή on-prem εγγραφή (δεν ελέγχθηκε το Flexo MCP σε λειτουργία).

**Πηγές:** [redsteve/SysML-v2-API-MCP-Server, 2025](https://github.com/redsteve/SysML-v2-API-MCP-Server) · [SysML v2 MCP is Next Level Digital Engineering, 2025](https://3dswym.3dexperience.3ds.com/post/catia-mbse-cyber-systems/sysml-v2-mcp-is-next-level-digital-engineering_ZhL0f2H8TL-_b6m9fDkX9w) · [Gaphor: Full Support for SysML v2 (issue), 2026 (accessed)](https://github.com/gaphor/gaphor/issues/1399) · [Gaphor 3.0, 2025](https://gaphor.org/de/2025/01/26/gaphor-3.0/)

### Git signed commits/tags

*tool, production* · SOTA-PLT-21

commit -S, tag -s, log --show-signature, merge --verify-signatures, commit.gpgsign.

**Για το GRAIL:** Το σημερινό ισοδύναμο του «κάθε αλλαγή σχεδίου = υπογεγραμμένο γεγονός» (P5), χωρίς ledger.

**Πηγές:** [Git Tools - Signing Your Work, 2026 (accessed)](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work)
