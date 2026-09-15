# Epistemic Court & Adversarial Entity — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### AI safety via debate και εμπειρικά αποτελέσματα debate

*research, research-prototype* · SOTA-ADV-01

Δύο πράκτορες αντιπαρατίθενται και κρίνει ασθενέστερος κριτής. Με βέλτιστο παίγνιο απαντώνται ερωτήματα PSPACE με πολυωνυμικό κριτή (Irving et al. 2018). Με debate, μη ειδικά μοντέλα φτάνουν 76% και άνθρωποι 88%, έναντι 48% και 60% των naive baselines (Khan et al. ICML 2024). Το debate υπερέχει του consultancy σε όλα τα tasks (math, code, logic, multimodal) όταν ο consultant ανατίθεται τυχαία. Έναντι direct QA υπερέχει μόνο σε extractive QA με information asymmetry· αλλού τα αποτελέσματα είναι μικτά (Kenton et al. NeurIPS 2024). Το self-play των debaters αυξάνει την ακρίβεια του κριτή, ενώ για consultancy δεν βρέθηκε τέτοια σχέση (Arnesen et al. 2024).

**Για το GRAIL:** Θεμέλιο για Court όπου ασθενέστερος κριτής εποπτεύει ισχυρότερους. Το όφελος εξαρτάται από την ασυμμετρία πληροφορίας και από το baseline, άρα δεν είναι γενικό.

**Πηγές:** [AI safety via debate, 2018](https://arxiv.org/abs/1805.00899) · [Debating with More Persuasive LLMs Leads to More Truthful Answers, 2024](https://proceedings.mlr.press/v235/khan24a.html) · [On scalable oversight with weak LLMs judging strong LLMs, 2024](https://arxiv.org/abs/2407.04622) · [Training Language Models to Win Debates with Self-Play Improves Judge Accuracy, 2024](https://arxiv.org/abs/2409.16636)

### Complexity-theoretic debate: doubly-efficient, prover-estimator, DQC, safety case

*research, theoretical* · SOTA-ADV-02

Doubly-efficient debate: η έντιμη στρατηγική κερδίζει με προσομοίωση πολυωνυμικού αριθμού βημάτων, και για στοχαστικά συστήματα (Brown-Cohen, Irving, Piliouras 2023). Prover-estimator debate: αντιμετωπίζει το obfuscated arguments problem με υπολογιστικό κόστος του έντιμου συγκρίσιμο με του αντιπάλου, υπό stability assumptions (2025, αναθ. 2026). Debate Query Complexity: η PSPACE/poly είναι ακριβώς η κλάση που αποφασίζεται με O(log n) queries (2026). Safety case sketch με debate: τέσσερις ρητοί ισχυρισμοί και ανοιχτά προβλήματα (Buhl et al. 2025).

**Για το GRAIL:** Θεωρητική βάση για διαδικασία που στενεύει τη διαφωνία σε λίγα ελέγξιμα βήματα, και πρότυπο safety case για το Court. Οι εγγυήσεις προϋποθέτουν ότι ο ισχυρισμός είναι υπολογισμός.

**Πηγές:** [Scalable AI Safety via Doubly-Efficient Debate, 2023](https://arxiv.org/abs/2311.14125) · [Avoiding Obfuscation with Prover-Estimator Debate, 2025](https://arxiv.org/abs/2506.13609) · [Debate is efficient with your time, 2026](https://arxiv.org/abs/2602.08630) · [An alignment safety case sketch based on debate, 2025](https://arxiv.org/abs/2505.03989)

### Σύγκριση πρωτοκόλλων oversight 2025–2026

*research, research-prototype* · SOTA-ADV-03

Proposer-critic debate σε code και logic tasks που ελέγχονται προγραμματιστικά: κέρδος έναντι consultancy μόνο όταν η ικανότητα ταξινόμησης του critic ξεπερνά του κριτή και ο κριτής ελέγχει τις θέσεις του critic αντί να τις συνοψίζει. Αυτό ίσχυσε σε 3 από 5 ζεύγη, και μία ανεξάρτητη κριτική ανακτά το μεγαλύτερο μέρος του οφέλους (Elasky et al. 2026). Η collaborative disagreement resolution δίνει 62,1% ακρίβεια κριτή έναντι 49,2% του standard debate (Jiang et al. ICML 2026). NSO σε general Elo gap 400: Mafia 13,5%, Debate 51,7%, Backdoor Code 10,0%, Wargames 9,4% (Engels et al. NeurIPS 2025).

**Για το GRAIL:** Το πρωτόκολλο είναι ανοιχτό εμπειρικό ερώτημα, και κανένα LLM πρωτόκολλο δεν αρκεί ως άγκυρα εμπιστοσύνης.

**Πηγές:** [Debate Helps Weak Judges Reward Stronger Models, 2026](https://arxiv.org/abs/2605.27483) · [Collaborative Disagreement Resolution for Scalable Oversight, 2026](https://arxiv.org/abs/2607.01251) · [Scaling Laws For Scalable Oversight, 2025](https://arxiv.org/abs/2504.18530)

### Multi-agent debate έναντι ψηφοφορίας· αξία της μειοψηφίας

*research, research-prototype* · SOTA-ADV-04

Η majority voting εξηγεί το μεγαλύτερο μέρος των κερδών του multi-agent debate. Το debate επάγει martingale πάνω στις πεποιθήσεις και από μόνο του δεν αυξάνει την αναμενόμενη ορθότητα (Choi, Zhu, Li NeurIPS 2025). Λόγω συσχετισμένων σφαλμάτων, σε περίπου 1 στις 4 αποκλίνουσες περιπτώσεις η μειοψηφία έχει δίκιο. Meta-classifier πάνω στα logs πετυχαίνει Flip Precision 81,2%, δηλαδή ακρίβεια των αποφάσεων ανατροπής (Minority Sentinel 2026).

**Για το GRAIL:** Στηρίζει το INV-K03 (το dissent είναι σήμα) και δείχνει ότι η πλειοψηφία LLM δεν είναι ετυμηγορία αλήθειας.

**Πηγές:** [Debate or Vote: Which Yields Better Decisions in Multi-Agent Large Language Models, 2025](https://proceedings.neurips.cc/paper_files/paper/2025/hash/934252acd87f254d5d4672fbde283bd2-Abstract-Conference.html) · [Minority Sentinel: When to Overturn Majority Voting in Multi-Agent LLM Debates, 2026](https://arxiv.org/abs/2606.29270)

### Prover-verifier games (legibility) και weak-to-strong

*research, research-prototype* · SOTA-ADV-05

Μικροί verifiers εκπαιδεύονται απέναντι σε helpful και sneaky provers. Η legibility μεταφέρεται σε ανθρώπους με χρονικό περιορισμό: η ακρίβειά τους αυξάνεται στις helpful λύσεις και μειώνεται στις sneaky (Kirchner et al. 2024). Ισχυρά μοντέλα εκπαιδευμένα με ετικέτες ασθενούς επόπτη τον ξεπερνούν, αλλά η naive finetuning απέχει πολύ από πλήρη ανάκτηση ικανοτήτων (Burns et al. 2023).

**Για το GRAIL:** Στηρίζει την απαίτηση ο Adversary να παράγει μαρτυρίες ελέγξιμες από ασθενέστερους ή μηχανικούς ελεγκτές. Η εποπτεία από ασθενέστερο είναι εν μέρει μόνο εφικτή.

**Πηγές:** [Prover-Verifier Games improve legibility of LLM outputs, 2024](https://arxiv.org/abs/2407.13692) · [Weak-to-Strong Generalization: Eliciting Strong Capabilities With Weak Supervision, 2023](https://arxiv.org/abs/2312.09390)

### Biases και ευπάθειες του LLM-as-judge

*research, research-prototype* · SOTA-ADV-06

Position, verbosity και self-enhancement bias και περιορισμένη συλλογιστική, παρότι οι ισχυροί LLM κριτές συμφωνούν με ανθρώπους σε ποσοστό άνω του 80% (Zheng et al. NeurIPS 2023 D&B). Self-preference σε γραμμική συσχέτιση με την ικανότητα αυτο-αναγνώρισης (Panickssery et al. 2024). «Master keys»: σύμβολα όπως «:» ή «.» και φράσεις όπως «Thought process:» προκαλούν ψευδώς θετικές ανταμοιβές. Mitigation είναι το data augmentation με κομμένες εξόδους (Master-RMs), δηλαδή αντίδραση εκ των υστέρων (Zhao et al. 2025).

**Για το GRAIL:** Ο LLM κριτής είναι επιφάνεια επίθεσης, παρά την καλή μέση συμφωνία. Αυτό δικαιολογεί τον μη-LLM oracle και red-team γεννήτριες κατά του κριτή.

**Πηγές:** [Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena, 2023](https://arxiv.org/abs/2306.05685) · [LLM Evaluators Recognize and Favor Their Own Generations, 2024](https://arxiv.org/abs/2404.13076) · [One Token to Fool LLM-as-a-Judge, 2025](https://arxiv.org/abs/2507.08794)

### LLM juries και βαθμονόμηση panels

*research, pilot* · SOTA-ADV-07

PoLL: panel πολλών μικρότερων μοντέλων από disjoint οικογένειες ξεπερνά έναν μεγάλο κριτή, με λιγότερο intra-model bias και πάνω από 7 φορές χαμηλότερο κόστος (Verga et al. 2024). Finite-Calibration Regime Map: με λίγες ανθρώπινες ετικέτες, το scalar/reliability aggregation έχει χαμηλότερο MSE από το unrestricted joint-table calibration σε 16 από 20 κελιά κατά point estimate. Σε 11 κελιά τα 95% διαστήματα εξαιρούν το μηδέν (4 datasets, 7 κριτές· Zhu, Xie, Rao 2026). Alt-test: στατιστική διαδικασία που δικαιολογεί την αντικατάσταση ανθρώπων σχολιαστών από LLM με μέτριο δείγμα ετικετών (Calderon, Reichart, Dror 2025).

**Για το GRAIL:** Μέθοδοι για τα panels του CMP-ADV-02 και για τον σχεδιασμό του EXP-04.

**Πηγές:** [Replacing Judges with Juries: Evaluating LLM Generations with a Panel of Diverse Models, 2024](https://arxiv.org/abs/2404.18796) · [A Finite-Calibration Regime Map for LLM Judge Panels, 2026](https://arxiv.org/abs/2606.01034) · [The Alternative Annotator Test for LLM-as-a-Judge, 2025](https://arxiv.org/abs/2501.10970)

### Συσχετισμένα σφάλματα και όρια της ποικιλομορφίας (N-version)

*research, research-prototype* · SOTA-ADV-08

Σε πάνω από 350 LLMs, όταν σφάλλουν και τα δύο μοντέλα συμφωνούν στο 60% των περιπτώσεων. Τα μεγαλύτερα και ακριβέστερα μοντέλα έχουν ισχυρά συσχετισμένα σφάλματα ακόμη και με διαφορετική αρχιτεκτονική και πάροχο, με συνέπειες για το LLM-as-judge (Kim et al. ICML 2025). Οι LLM κριτές ευνοούν μοντέλα όμοια με τον εαυτό τους, και τα λάθη γίνονται πιο όμοια όσο αυξάνεται η ικανότητα (μετρική CAPA· Goel et al. 2025). Knight & Leveson 1986: 27 ανεξάρτητες εκδόσεις, οι ταυτόχρονες αποτυχίες ξεπέρασαν στατιστικά σημαντικά την πρόβλεψη της ανεξαρτησίας. Ron, Baudry, Monperrus 2026 με coding agents: 429 coincident failures έναντι 115,36 αναμενόμενων (z=29,20). Η ποικιλία γλωσσών, agents και μοντέλων έδωσε περιορισμένη προστασία, αλλά οι τριάδες με ψηφοφορία μείωσαν τις αποτυχίες από 387,44 σε 130,99.

**Για το GRAIL:** Διαψεύδει την «ανεξαρτησία by construction» του CMP-ADV-01 και θέτει σε αμφισβήτηση το όριο f του INV-K06 όταν οι κόμβοι είναι LLM κριτές. Η πλεονασματικότητα βοηθά, αλλά δεν δίνει ανεξαρτησία.

**Πηγές:** [Correlated Errors in Large Language Models, 2025](https://proceedings.mlr.press/v267/kim25e.html) · [Great Models Think Alike and this Undermines AI Oversight, 2025](https://arxiv.org/abs/2502.04313) · [An experimental evaluation of the assumption of independence in multiversion programming (IEEE TSE SE-12(1):96–109), 1986](https://doi.org/10.1109/TSE.1986.6312924) · [N-Version Programming with Coding Agents, 2026](https://arxiv.org/html/2606.20158)

### AI Control, ControlArena και συμπαιγνία χωρίς κανάλι

*tool, pilot* · SOTA-ADV-09

Πρωτόκολλα ανθεκτικά σε σκόπιμη υπονόμευση: untrusted monitoring με τεχνικές αποτροπής συμπαιγνίας και trusted editing, που αξιολογούνται απέναντι σε στρατηγικές υπονόμευσης (red/blue team) (Greenblatt et al. ICML 2024). ControlArena (UK AISI και Redwood Research, MIT): thin wrapper πάνω στο Inspect με settings (π.χ. code sabotage, data poisoning), micro-protocols, policies, monitors και μετρικές safety και usefulness. Ταξινομία συμπαιγνίας: passive self-recognition, causal, acausal (Schelling points) και combined (Gardner-Challis et al. 2026). Μοντέλα σε απομόνωση συμπαίζουν μερικές φορές πάνω σε μη προφανή σήματα, με περιορισμένη συνολική επιτυχία (Järviniemi 2025). Steganographic collusion: οι σημερινές ικανότητες είναι περιορισμένες αλλά αυξάνονται (Motwani et al. 2024).

**Για το GRAIL:** Άμεσο SOTA για τους όρους ανεξαρτησίας και το KT-19: η απουσία κοινής μνήμης είναι αναγκαία αλλά όχι επαρκής. Το ControlArena δεν έχει έτοιμο setting για δικαστήριο.

**Πηγές:** [AI Control: Improving Safety Despite Intentional Subversion, 2024](https://arxiv.org/abs/2312.06942) · [ControlArena (GitHub, UK AISI & Redwood Research), n.d. (πρόσβαση 2026)](https://github.com/UKGovernmentBEIS/control-arena) · [When can we trust untrusted monitoring? A safety case sketch across collusion strategies, 2026](https://arxiv.org/abs/2602.20628) · [Subversion via Focal Points: Investigating Collusion in LLM Monitoring, 2025](https://arxiv.org/abs/2507.03010) · [Secret Collusion among AI Agents: Multi-Agent Deception via Steganography, 2024](https://arxiv.org/abs/2402.07510)

### AI sandbagging

*research, research-prototype* · SOTA-ADV-10

Frontier μοντέλα μπορούν να υποαποδίδουν επιλεκτικά σε αξιολογήσεις επικίνδυνων ικανοτήτων, διατηρώντας τη γενική απόδοση. Με fine-tuning κρύβουν ικανότητες πίσω από password, και αυτό γενικεύεται σε held-out benchmarks (van der Weij et al. 2024). Για ώριμη μέθοδο ανίχνευσης δεν ξέρω· η πηγή δείχνει μόνο την ευπάθεια.

**Για το GRAIL:** Adversarial Entity που είναι LLM μπορεί να εφησυχάζει στρατηγικά. Η μέτρηση σε seeded faults θέλει προστασίες.

**Πηγές:** [AI Sandbagging: Language Models can Strategically Underperform on Evaluations, 2024](https://arxiv.org/abs/2406.07358)

### Automated και ανθρώπινο red teaming

*research, pilot* · SOTA-ADV-11

LM-generated test cases (Perez et al. EMNLP 2022). Multi-step RL με auto-generated rewards (και rule-based) για διαφορετικές και αποτελεσματικές επιθέσεις, μαζί με prompt injection (Beutel et al. 2024). GFlowNet attackers (Lee et al. ICLR 2025). Quality-diversity red teaming (Wang et al. 2025). Constitutional Classifiers: σε πάνω από 3.000 ώρες red teaming κανείς δεν βρήκε universal jailbreak για τα περισσότερα target queries, με +0,38% refusals σε production traffic και 23,7% inference overhead (2025).

**Για το GRAIL:** Αντιστοιχεί στο εξελισσόμενο arsenal του CMP-ADV-03. Το ανθρώπινο red teaming μεγάλης κλίμακας παραμένει μέρος της αξιολόγησης.

**Πηγές:** [Red Teaming Language Models with Language Models, 2022](https://aclanthology.org/2022.emnlp-main.225/) · [Diverse and Effective Red Teaming with Auto-generated Rewards and Multi-step Reinforcement Learning, 2024](https://arxiv.org/abs/2412.18693) · [Learning diverse attacks on large language models for robust red-teaming and safety tuning, 2024](https://arxiv.org/abs/2405.18540) · [Quality-Diversity Red-Teaming, 2025](https://arxiv.org/abs/2506.07121) · [Constitutional Classifiers: Defending against Universal Jailbreaks across Thousands of Hours of Red Teaming, 2025](https://arxiv.org/abs/2501.18837)

### Εργαλεία, benchmarks και ταξινομίες red team: garak, PyRIT, Petri, HarmBench, AgentDojo, NIST AI 100-2e2025, OWASP

*standard, production* · SOTA-ADV-12

garak (NVIDIA): scanner με probes για prompt injection, jailbreak, data leakage, hallucination κ.ά. PyRIT (Microsoft): open-source framework εντοπισμού κινδύνων GenAI· το Azure/PyRIT αρχειοθετήθηκε στις 27-03-2026 και συνεχίζει ως microsoft/PyRIT. Inspect Petri (Meridian Labs, v3.0): auditing agent με seed instructions, πολυγυρισμένες αλληλεπιδράσεις, simulated tools με rollback και judge scoring. HarmBench: τυποποιημένη αξιολόγηση automated red teaming, 18 μέθοδοι × 33 μοντέλα (2024). AgentDojo: 97 tasks και 629 security test cases για prompt injection σε agents (2024). NIST AI 100-2e2025 (τελικό, 24-03-2025): Indirect Prompt Injection (NISTAML.015), Clean-label Poisoning (NISTAML.012), Misaligned Outputs (NISTAML.027). OWASP Top 10 for LLM Applications 2025 (LLM01 Prompt Injection έως LLM10 Unbounded Consumption) και χωριστό Agentic Security Initiative.

**Για το GRAIL:** Αναφορά για μέτρηση κάλυψης του arsenal (REQ-ADV-004) και επαναχρήσιμα εργαλεία.

**Πηγές:** [garak (GitHub, NVIDIA), n.d. (πρόσβαση 2026)](https://github.com/NVIDIA/garak) · [PyRIT (GitHub, Microsoft), n.d. (πρόσβαση 2026)](https://github.com/microsoft/PyRIT) · [Petri / Inspect Petri (GitHub), n.d. (v3.0, πρόσβαση 2026)](https://github.com/safety-research/petri) · [HarmBench: A Standardized Evaluation Framework for Automated Red Teaming and Robust Refusal, 2024](https://arxiv.org/abs/2402.04249) · [AgentDojo: A Dynamic Environment to Evaluate Prompt Injection Attacks and Defenses for LLM Agents, 2024](https://arxiv.org/abs/2406.13352) · [NIST AI 100-2 E2025 (CSRC), 2025](https://csrc.nist.gov/pubs/ai/100/2/e2025/final) · [OWASP Top 10 for LLM Applications 2025, 2025](https://genai.owasp.org/llm-top-10/)

### Inspect (UK AISI) και sandboxing

*tool, production* · SOTA-ADV-13

Open-source framework αξιολογήσεων (UK AI Security Institute και Meridian Labs) με datasets, solvers και scorers. Οι scorers είναι είτε ντετερμινιστικοί (π.χ. includes()) είτε model-graded (model_graded_qa()). Sandboxes: Docker, Kubernetes, Modal, Proxmox, Vagrant και extension API. Το Inspect Sandboxing Toolkit δίνει plugins για Docker Compose, Kubernetes και Proxmox.

**Για το GRAIL:** Έτοιμο υπόστρωμα για τα campaigns του ICD-26, το EXP-04 και το KT-19. Η διάκριση ντετερμινιστικού και model-graded scorer αντιστοιχεί στη διάκριση μη-LLM oracle και LLM κριτή.

**Πηγές:** [Inspect AI, 2024 (πρόσβαση 2026)](https://inspect.aisi.org.uk/) · [aisi-sandboxing (GitHub), n.d.](https://github.com/UKGovernmentBEIS/aisi-sandboxing)

### Structured argumentation με burdens και standards of proof (ASPIC+, Carneades, Prakken–Sartor, Calegari–Sartor)

*research, research-prototype* · SOTA-ADV-14

ASPIC+: strict και defeasible rules, επιθέσεις σε premises, defeasible inferences και conclusions, προτιμήσεις και rationality postulates (Modgil & Prakken 2014). Carneades: μοντέλο επιχειρήματος και burden of proof με proof standards ανά statement εμπνευσμένα από το δίκαιο (Gordon, Prakken, Walton 2007). Οι συγκεκριμένες ονομασίες standards και η διάκριση production και persuasion δεν επαληθεύτηκαν εδώ. Μετάφραση Carneades→ASPIC+: ισχύουν τα rationality postulates, και το Carneades επάγει μοναδική Dung extension, ίδια σε όλες τις σημασιολογίες του Dung (van Gijzel & Prakken 2012). Μοντελοποίηση burdens και standards of proof σε structured argumentation (Prakken & Sartor 2011· Calegari & Sartor 2021).

**Για το GRAIL:** Ώριμο τυπικό μοντέλο για τα standards of proof του REQ-ADV-002, που το πρόχειρο αναφέρει χωρίς να τα ορίζει.

**Πηγές:** [The ASPIC+ framework for structured argumentation: a tutorial, 2014](https://doi.org/10.1080/19462166.2013.869766) · [The Carneades model of argument and burden of proof, 2007](https://doi.org/10.1016/j.artint.2007.04.010) · [Relating Carneades with abstract argumentation via the ASPIC+ framework for structured argumentation, 2012](https://doi.org/10.1080/19462166.2012.661766) · [On modelling burdens and standards of proof in structured argumentation, 2011](https://doi.org/10.3233/978-1-60750-981-3-83) · [Burdens of Persuasion and Standards of Proof in Structured Argumentation, 2021](https://doi.org/10.1007/978-3-030-89391-0_3)

### ICCMA 2025: solvers επιχειρηματολογίας

*tool, production* · SOTA-ADV-15

Tracks: main, heuristics, dynamic (μέσω IPAFAIR) και ABA. Semantics: CO, PR, ST, SST, ID. Η stage εξαιρείται ρητά και η grounded δεν περιλαμβάνεται. Προβλήματα: DC (credulous), DS (skeptical), SE (ένα extension).

**Για το GRAIL:** Εργαλεία και σημείο αναφοράς κόστους για το EXP-16, με το ABA ως εναλλακτικό structured formalism.

**Πηγές:** [ICCMA - Competition 2025 - Solvers/Tracks, 2025](https://argumentationcompetition.org/2025/tracks.html)

### Gradual/QBAF semantics και Argumentative LLMs

*research, research-prototype* · SOTA-ADV-16

Τα ArgLLMs κατασκευάζουν argumentation frameworks από LLM και αποφασίζουν με τυπική συλλογιστική. Κάθε απόφαση εξηγείται και αμφισβητείται. Ορίζονται ιδιότητες contestability (AAAI-25, Freedman et al.). Proposition 1: η DF-QuAD ικανοποιεί base score και argument relation contestability· το quadratic energy model ικανοποιεί τις strong εκδοχές.

**Για το GRAIL:** Εναλλακτική σημασιολογία που λείπει από το EXP-16, για contestable διαβάθμιση αντί δυαδικής αποδοχής.

**Πηγές:** [Argumentative Large Language Models for Explainable and Contestable Claim Verification, 2025](https://ojs.aaai.org/index.php/AAAI/article/view/33637) · [Argumentative Large Language Models for Explainable and Contestable Claim Verification (arXiv HTML), 2024](https://arxiv.org/html/2405.02079)

### Εμπειρικές γνωσιακές μελέτες σημασιολογιών

*research, research-prototype* · SOTA-ADV-17

Σε 12 frameworks με 3 έως 8 επιχειρήματα, grounded και CF2 είναι οι καλύτεροι predictors, με δύο στρατηγικές συμμετεχόντων (Cramer & Guillaume 2019). Η SCF2 ικανοποιεί δύο νέες αρχές ορθολογικής κρίσης (Cramer & van der Torre 2019). Στο reinstatement η ανάκαμψη είναι μερική και τα ευρήματα στηρίζουν την preferred έναντι της grounded (Rahwan et al. Cognitive Science 2010). Σε 96 συμμετέχοντες, η συμμόρφωση με αρχές επιχειρηματολογίας διαφέρει ανά αρχή και είναι καλύτερη με γραφική αναπαράσταση (Teovanović, Vesić, Yun, AIJ).

**Για το GRAIL:** Τα ευρήματα διαφέρουν ανά σημασιολογία και μορφή παρουσίασης. Δεν βρέθηκε μελέτη με νομικούς ειδικούς, άρα το EXP-16 δεν έχει προηγούμενο για ειδικούς.

**Πηγές:** [Empirical Study on Human Evaluation of Complex Argumentation Frameworks, 2019](https://arxiv.org/abs/1902.10552) · [SCF2 -- an Argumentation Semantics for Rational Human Judgments on Argument Acceptability, 2019](https://arxiv.org/abs/1908.08406) · [Behavioral Experiments for Assessing the Abstract Argumentation Semantics of Reinstatement, 2010](https://doi.org/10.1111/j.1551-6709.2010.01123.x) · [Human compliance with computational argumentation principles, 2026 (DOI 2025)](https://doi.org/10.1016/j.artint.2025.104457)

### Μηχανικοί oracles με μικρό TCB: certifying algorithms και ανεξάρτητοι Lean checkers

*tool, production* · SOTA-ADV-18

Certifying algorithms: το πρόγραμμα επιστρέφει την τιμή και ένα certificate (witness), που ελέγχει checker. Αν η τιμή είναι λάθος, κανένα witness δεν περνά τον έλεγχο (McConnell, Mehlhorn, Näher, Schweitzer, CSR 5(2) 2011· slides Mehlhorn). Lean4Lean: πλήρης εξωτερικός typechecker του Lean 4 γραμμένος σε Lean. Είναι 20–50% πιο αργός, ελέγχει όλο το mathlib και εντόπισε ένα soundness bug (Carneiro 2024). nanoda_lib: ανεξάρτητος type checker σε Rust πάνω σε lean4export. Το lean4checker αρχειοθετήθηκε· η λειτουργία ενσωματώθηκε ως leanchecker στο toolchain από το v4.28.0.

**Για το GRAIL:** Υλοποιεί σήμερα τον «≥1 μη-LLM oracle» με N-version checkers για τα αποδείξιμα φύλλα.

**Πηγές:** [Certifying algorithms (Computer Science Review 5(2):119–161), 2011](https://doi.org/10.1016/j.cosrev.2010.09.009) · [Certifying Algorithms (slides, K. Mehlhorn), n.d.](https://people.mpi-inf.mpg.de/~mehlhorn/ftp/CertifyingAlgs.pdf) · [Lean4Lean: Verifying a Typechecker for Lean, in Lean, 2024](https://arxiv.org/abs/2403.14064) · [nanoda_lib (GitHub), n.d.](https://github.com/ammkrn/nanoda_lib) · [lean4checker (GitHub, archived), n.d. (πρόσβαση 2026)](https://github.com/leanprover/lean4checker)

### Αντιπαλικοί θεσμοί επίλυσης διαφορών σε παραγωγή: Arbitrum BoLD, Kleros

*system, production* · SOTA-ADV-19

BoLD: bisection σε block, big step (2^23 WASM steps) και one step. Το one-step proof υποβάλλεται στο συμβόλαιο OneStepProof στην parent chain. Είναι permissionless, με bonds που χάνει η ανέντιμη πλευρά, και παράθυρο 6,4 ημερών που μπορεί να αλλάξει το DAO. Ενεργό σε Arbitrum One, Nova και Sepolia· ενεργοποίηση Feb 2025 κατά δευτερογενή πηγή. Kleros (Short Paper v1.0.7, 2019): πιθανότητα κλήρωσης ενόρκου ανάλογη με το staked token, κίνητρα Schelling point. Κάθε νέα έφεση έχει διπλάσιους ενόρκους συν έναν, με εκθετικά αυξανόμενα τέλη.

**Για το GRAIL:** Αποδεικνύει σε παραγωγή αντιπαλική διαδικασία αγκυρωμένη σε μηχανικό oracle με φραγμένο χρόνο, αλλά μόνο για ντετερμινιστικό υπολογισμό (BoLD). Δίνει και πρότυπο κλιμακούμενης έφεσης (Kleros).

**Πηγές:** [Overview of BoLD \| Arbitrum Docs, n.d. (πρόσβαση 2026)](https://docs.arbitrum.io/how-arbitrum-works/bold/gentle-introduction) · [Stage 1 Fraud Proofs Go Live (blog, δευτερογενής), 2026](https://blockeden.xyz/blog/2026/02/01/stage-1-fraud-proofs-arbitrum-optimism-base-l2-security/) · [Kleros Short Paper v1.0.7, 2019](https://kleros.io/assets/whitepaper.pdf)

### Community Notes: bridging algorithm, LLM γράφουν και άνθρωποι κρίνουν

*system, production* · SOTA-ADV-20

Matrix-factorization bridging: προβάλλονται σημειώσεις με απήχηση σε ετερογενείς ομάδες, και όσοι τις είδαν έκαναν σημαντικά λιγότερο resharing (Wojcik et al. 2022). Πρόταση οικοσυστήματος όπου άνθρωποι και LLMs γράφουν σημειώσεις, ενώ η κρίση μένει στους ανθρώπους, με RLCF (Li et al. 2025).

**Για το GRAIL:** Πρότυπο διαχωρισμού γεννήτριας και κριτή, όπου την εξουσία κρίσης δεν την έχει ο LLM.

**Πηγές:** [Birdwatch: Crowd Wisdom and Bridging Algorithms can Inform Understanding and Reduce the Spread of Misinformation, 2022](https://arxiv.org/abs/2210.15723) · [Scaling Human Judgment in Community Notes with LLMs, 2025](https://arxiv.org/abs/2506.24118)

### BFT: HotStuff-2 και accountable safety (BFT forensics, Casper FFG, CometBFT evidence)

*research, production* · SOTA-ADV-21

HotStuff-2: partially synchronous BFT με O(n^2) worst-case επικοινωνία, optimistically linear, δύο φάσεις (Malkhi & Nayak 2023). BFT Protocol Forensics (Sheng et al. CCS 2021): όταν παραβιάζεται η safety με περισσότερους Byzantine από το όριο, δίνεται irrefutable proof για τουλάχιστον d ενόχους. Το d είναι 0 ή t+1 ανάλογα με την παραλλαγή· εξαίρεση το HotStuff-null με 1. Το HotStuff-hash θέλει transcripts από τουλάχιστον t+1 replicas, το LibraBFT έχει ισχυρό forensic support, και τα σύγχρονα πρωτόκολλα με 2t+1 replicas δεν έχουν κανένα. Casper FFG: αποδεδειγμένο accountable safety, όπου δύο αντιφατικά finalized checkpoints απαιτούν να παραβιάσει slashing condition το 1/3 των validators (Buterin & Griffith 2017). CometBFT spec: DuplicateVoteEvidence και LightClientAttackEvidence διαδίδονται και δεσμεύονται on-chain· την τιμωρία την αφήνει στην εφαρμογή.

**Για το GRAIL:** Άμεσα σχετικό με το INV-K06 και το ADR-0031: το accountable safety προσθέτει κρυπτογραφική ταυτοποίηση ενόχων πέρα από το όριο 3f+1. Η υλοποίηση accountability υπάρχει (spec CometBFT)· για την HotStuff-family σε παραγωγή δεν ξέρω.

**Πηγές:** [HotStuff-2: Optimal Two-Phase Responsive BFT, 2023](https://eprint.iacr.org/2023/397) · [BFT Protocol Forensics, 2021](https://arxiv.org/abs/2010.06785) · [Casper the Friendly Finality Gadget, 2017](https://arxiv.org/abs/1710.09437) · [CometBFT spec: consensus/evidence.md, n.d. (πρόσβαση 2026)](https://github.com/cometbft/cometbft/blob/main/spec/consensus/evidence.md)

### Επιστημικοί θεσμοί βαθμονόμησης: forecasting benchmarks και adversarial collaboration

*research, pilot* · SOTA-ADV-22

ForecastBench (v5, 28-02-2025): Brier. Οι superforecasters πετυχαίνουν 0,096 έναντι 0,121 του κοινού και 0,122 του κορυφαίου LLM στο υποσύνολο 200 ερωτήσεων (p<0,001). Η κατάσταση του leaderboard το 2026 δεν επαληθεύτηκε. Adversarial collaboration: 29 επιστήμονες σε 13 έργα αναφέρουν υψηλή ποιότητα και βαθύτερη κατανόηση αντί για «νικητές», με περισσότερη αρχική προσπάθεια. Το δείγμα περιλαμβάνει μόνο όσους ολοκλήρωσαν (Isch, Tetlock, Clark 2025).

**Για το GRAIL:** Μεθοδολογία βαθμονόμησης του Court (VT-704, EXP-04) χωρίς προβλέψεις έκβασης, κατά το Prediction Doctrine. Η κοινή προκαταχώριση του κρίσιμου τεστ ταιριάζει με το Challenge.

**Πηγές:** [ForecastBench: A Dynamic Benchmark of AI Forecasting Capabilities, 2025](https://arxiv.org/html/2409.19839v5) · [Reflections on adversarial collaboration from the adversaries: was it worth it?, 2025](https://doi.org/10.1007/s11186-025-09634-2)

### AgentCourt (persona-based προσομοίωση δικαστηρίου)

*research, research-prototype* · SOTA-ADV-23

Προσομοιωμένη αίθουσα με LLM δικαστές, δικηγόρους και διαδίκους. Το AdvEvol, σε 1.000 αστικές υποθέσεις, βελτιώνει τους δικηγόρους-agents κατά 12,1% στο CourtBench (Chen et al. ACL Findings 2025).

**Για το GRAIL:** Αντι-παράδειγμα: οι personas χρησιμεύουν για εκπαίδευση και προσομοίωση (CMP-LAW-07), όχι ως θεσμός απόφασης. Επιβεβαιώνει το «proof obligations, όχι personas».

**Πηγές:** [AgentCourt: Simulating Court with Adversarial Evolvable Lawyer Agents, 2025](https://aclanthology.org/2025.findings-acl.304/)
