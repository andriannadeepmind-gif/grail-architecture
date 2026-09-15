# Epistemic Court & Adversarial Entity — πρόχειρο έναντι ανώτερου (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| IDs | Ετυμηγορία | Τι λέει το πρόχειρο | Τι αλλάζει και γιατί | Κατάταξη · βεβαιότητα | Πηγές |
|---|---|---|---|---|---|
| CMP-ADV-01, REQ-ADV-001 | **κενό** | Ανεξάρτητη AEO με εντολή διάψευσης, χωριστά κλειδιά, παρόχους και μνήμη, και bounty. Επιχειρεί να διαψεύσει κάθε ισχυρισμό που προάγεται σε ADJUDICATED/ESTABLISHED. Εφησυχασμός → μέτρηση σε seeded faults· κατάληψη → εναλλαγή και ποικιλομορφία. Status [T]. | Ο διαχωρισμός κλειδιών και μνήμης είναι υλοποιήσιμος και αναγκαίος. Όμως η ανεξαρτησία δηλώνεται by construction. (α) Η ποικιλομορφία παρόχων δεν δίνει ανεξάρτητα σφάλματα: συσχέτιση και μεταξύ παρόχων, εντονότερη στα ισχυρότερα μοντέλα (Kim 2025), και affinity των κριτών σε όμοια μοντέλα (Goel 2025). Το ίδιο δείχνουν Knight & Leveson 1986 και Ron et al. 2026 (429 έναντι 115,36). (β) Συμπαιγνία είναι δυνατή χωρίς κανάλι: focal points, self-recognition, steganography. (γ) Το sandbagging υπονομεύει τη μέτρηση σε seeded faults. Άρα το [T] είναι υπερδήλωση: η ανεξαρτησία είναι μετρήσιμη ιδιότητα [X]. Υπέρ του σχεδίου: μία ανεξάρτητη κριτική ανακτά το μεγαλύτερο μέρος του οφέλους του debate, αλλά μόνο αν ο critic ξεπερνά τον κριτή σε ταξινόμηση και ο κριτής ελέγχει τις θέσεις του (Elasky 2026). | πείραμα · υψηλή | [Correlated Errors in Large Language Models, 2025](https://proceedings.mlr.press/v267/kim25e.html) · [Great Models Think Alike and this Undermines AI Oversight, 2025](https://arxiv.org/abs/2502.04313) · [N-Version Programming with Coding Agents, 2026](https://arxiv.org/html/2606.20158) · [Subversion via Focal Points, 2025](https://arxiv.org/abs/2507.03010) · [When can we trust untrusted monitoring?, 2026](https://arxiv.org/abs/2602.20628) · [AI Sandbagging, 2024](https://arxiv.org/abs/2406.07358) · [Debate Helps Weak Judges Reward Stronger Models, 2026](https://arxiv.org/abs/2605.27483) |
| CMP-ADV-02 | ισχύει | Διαδικασία filing, challenge, εξέτασης, verdict, dissent και appeal, με standards of proof και panels. Υπερφόρτωση → triage κατά stakes· δικαστικό λάθος → έφεση και βαθμονόμηση (EXP-04)· BFT για πολλαπλά sites. [T] η διαδικασία, [X] η αξιοπιστία. | Ο διαδικαστικός θεσμός με standards of proof έχει τυπικά θεμέλια (Carneades 2007, ASPIC+ 2014) και παραγωγικά ανάλογα: στο BoLD η διαφορά λύνεται μόνο μέσω πρωτοκόλλου, στο Kleros κάθε έφεση έχει νέο σώμα 2n+1. Ο διαχωρισμός [T] διαδικασίας και [X] αξιοπιστίας είναι τίμιος: τα panels (PoLL) μειώνουν το intra-model bias, αλλά τα σφάλματα μένουν συσχετισμένα. Στοχευμένος έλεγχος (juries, Kleros, Community Notes, BoLD) δεν βρήκε αυστηρά ανώτερη εναλλακτική για το ίδιο το component. Ανοιχτά μένουν η σύνθεση panels και εφέσεων, το liveness bound και ο πυρήνας απόφασης (ICD-14, GAP-ADV-11, GAP-ADV-12, GAP-ADV-13). | σήμερα · μέση | [The Carneades model of argument and burden of proof, 2007](https://doi.org/10.1016/j.artint.2007.04.010) · [Overview of BoLD \| Arbitrum Docs, n.d. (πρόσβαση 2026)](https://docs.arbitrum.io/how-arbitrum-works/bold/gentle-introduction) · [Kleros Short Paper v1.0.7, 2019](https://kleros.io/assets/whitepaper.pdf) · [Replacing Judges with Juries, 2024](https://arxiv.org/abs/2404.18796) |
| REQ-ADV-002 | **κενό** | Το Court εκτελεί ορισμένη διαδικασία με standards of proof, dissent και έφεση. INV-K02, INV-K03, INV-C05· VT-014, VT-104, VT-502, EXP-04· M, T· [T]. | Standards of proof και έφεση αναφέρονται αλλά δεν ορίζονται πουθενά. Η §13 δεν γράφτηκε και το EpistemicCourt.tla δεν υπάρχει, άρα τα VT-104 (TLC/Apalache) και VT-502 (MBT από state machine) δεν έχουν αντικείμενο. Υπάρχουν ώριμα τυπικά μοντέλα: Carneades (proof standards ανά statement), μετάφραση στο ASPIC+ (van Gijzel & Prakken 2012), burdens και standards σε structured argumentation (Prakken & Sartor 2011, Calegari & Sartor 2021). Το πρόχειρο δεν επιλέγει κανένα, και το EXP-16 δεν τα εξετάζει. | σήμερα · υψηλή | [The Carneades model of argument and burden of proof, 2007](https://doi.org/10.1016/j.artint.2007.04.010) · [Relating Carneades with abstract argumentation via the ASPIC+ framework, 2012](https://doi.org/10.1080/19462166.2012.661766) · [On modelling burdens and standards of proof in structured argumentation, 2011](https://doi.org/10.3233/978-1-60750-981-3-83) · [Burdens of Persuasion and Standards of Proof in Structured Argumentation, 2021](https://doi.org/10.1007/978-3-030-89391-0_3) |
| CMP-ADV-03, REQ-ADV-004 | ισχύει | Γεννήτριες επιθέσεων για injection, poisoning, Byzantine bodies, counterexample search (Alloy/TLC/SMT) και jailbreak suites. Εξελισσόμενο arsenal μέσω CMP-CIV-03 σε sandbox· αποτελέσματα στο CAS. Συνεχής επίθεση σε επιφάνειες injection, poisoning, Byzantine και escape (VT-801, VT-802). | Εύρος και εξελισσόμενο arsenal αντιστοιχούν στο SOTA: multi-step RL (Beutel 2024), GFlowNet, quality-diversity. Υπάρχουν εργαλεία (garak, PyRIT που μεταφέρθηκε στο microsoft/PyRIT, Inspect Petri), ταξινομίες (NIST AI 100-2e2025, OWASP 2025) και sandboxing (Inspect). Στοχευμένος έλεγχος βρήκε μόνο συμπληρωματικά μέσα μέτρησης, όχι ανώτερη εναλλακτική: HarmBench (18 μέθοδοι × 33 μοντέλα) και AgentDojo (629 security cases). Προσθήκες που δεν αλλάζουν τη θέση: (α) μέτρηση κάλυψης απέναντι σε NIST/OWASP και benchmarks· (β) ανθρώπινο red teaming (Constitutional Classifiers: πάνω από 3.000 ώρες)· (γ) επιθέσεις κατά του ίδιου του κριτή (GAP-ADV-08). | σήμερα · μέση | [Diverse and Effective Red Teaming with Auto-generated Rewards and Multi-step Reinforcement Learning, 2024](https://arxiv.org/abs/2412.18693) · [NIST AI 100-2 E2025 (CSRC), 2025](https://csrc.nist.gov/pubs/ai/100/2/e2025/final) · [Constitutional Classifiers, 2025](https://arxiv.org/abs/2501.18837) · [HarmBench, 2024](https://arxiv.org/abs/2402.04249) · [AgentDojo, 2024](https://arxiv.org/abs/2406.13352) · [Inspect AI, 2024 (πρόσβαση 2026)](https://inspect.aisi.org.uk/) |
| ICD-14 | **υπάρχει αυστηρά ανώτερο** | OpenAPI court.yaml και events. Πράξεις FileCase, Challenge, SubmitEvidence, Examine, Deliberate, Verdict, Dissent, Appeal (στο spine 7 πράξεις, χωρίς Deliberate). Κανόνες: verdict μόνο μέσω διαδικασίας (INV-K02)· dissent αμετάβλητο (INV-K03)· ≥1 μη-LLM oracle για ADJUDICATED/ESTABLISHED· δημιουργός ανώτατη έφεση (INV-C05). | Ανώτερο: Αποσύνθεση της διαφωνίας (bisection) μέχρι φύλλα proof obligations που ελέγχει μηχανικός oracle, με φραγμένο χρόνο. Είναι σε παραγωγή για ντετερμινιστικό υπολογισμό στο Arbitrum BoLD: block, 2^23 WASM steps, one-step proof, 6,4 ημέρες, permissionless. Τη θεμελιώνουν θεωρητικά το doubly-efficient debate, το prover-estimator debate (υπό stability assumptions) και το DQC (O(log n) queries για PSPACE/poly). Ανώτερη μόνο για αποσυνθέσιμους ή υπολογιστικούς ισχυρισμούς, όπως διαφωνίες N-version, προθεσμίες, SMT και citation receipts. Εκεί προσθέτει εγγύηση τερματισμού και αγκύρωσης σε oracle χωρίς να αφαιρεί καμία πράξη του ICD-14, αφού το επίπεδο σχήμα μένει fallback. Ρητό trade-off: ο ισχυρισμός πρέπει να εκφράζεται ως δέντρο ή υπολογισμός. Για νομικούς ή ερμηνευτικούς ισχυρισμούς φυσικής γλώσσας δεν υπάρχει παραγωγικό προηγούμενο ούτε oracle στα φύλλα, οπότε η έκβαση είναι Unknown ή ανθρώπινη κρίση (DEC-ADV-02).<br>Η επίπεδη ακολουθία πράξεων δεν εγγυάται τερματισμό σε φραγμένο χρόνο ούτε ότι η διαφωνία θα στενέψει σε βήμα ελέγξιμο μηχανικά. Χωρίς αυτό, ρητορική ή ένας εκμεταλλεύσιμος LLM κριτής μπορεί να κρίνει την υπόθεση (One Token to Fool 2025· Engels 2025: 51,7%). Υπάρχει ασυμφωνία πράξεων: 7 στο spine, 8 στο 15.md. Το Unknown δεν λείπει: το §15.1 το επιβάλλει γενικά σε κάθε ICD ως αποτέλεσμα επιτυχίας. Η γραμμή του ICD-14 όμως δεν ορίζει τι σημαίνει Unknown verdict (GAP-ADV-02). | πείραμα · μέση | [Overview of BoLD \| Arbitrum Docs, n.d. (πρόσβαση 2026)](https://docs.arbitrum.io/how-arbitrum-works/bold/gentle-introduction) · [Scalable AI Safety via Doubly-Efficient Debate, 2023](https://arxiv.org/abs/2311.14125) · [Avoiding Obfuscation with Prover-Estimator Debate, 2025](https://arxiv.org/abs/2506.13609) · [Debate is efficient with your time, 2026](https://arxiv.org/abs/2602.08630) |
| INV-K02, INV-K03 | ισχύει | INV-K02: κάθε verdict στο επίπεδο ετυμηγοριών προϋποθέτει υπόθεση ολοκληρωμένη κατά τη διαδικασία (EpistemicCourt.tla, VT-104· KT-07, KT-19). INV-K03: οι μειοψηφίες είναι append-only και συνοδεύουν κάθε verdict (VT-014). Tier 1. | Και τα δύο είναι δομικά invariants, υλοποιήσιμα σήμερα με append-only ledger και ιδιότητα TLA+, και αντιστοιχούν σε θεσμούς όπου η finality υπάρχει μόνο μέσω πρωτοκόλλου (BoLD, Kleros). Το dissent έχει μετρήσιμη αξία: σε περίπου 1 στις 4 αποκλίνουσες περιπτώσεις δικαιώνεται η μειοψηφία (Minority Sentinel 2026). Η πλειοψηφία εξηγεί το μεγαλύτερο μέρος του κέρδους του multi-agent debate (Choi 2025). Στοχευμένος έλεγχος δεν βρήκε ανώτερη διατύπωση. Προϋπόθεση ισχύος: τυπικός ορισμός της «διαδικασίας» (GAP-ADV-01). Σημείωση: η §0 τα παρουσιάζει ως δομικές παραγωγές, ενώ είναι Tier 1, δηλαδή αναθεωρήσιμα από τον δημιουργό με Court review. | σήμερα · υψηλή | [Minority Sentinel, 2026](https://arxiv.org/abs/2606.29270) · [Debate or Vote, 2025](https://proceedings.neurips.cc/paper_files/paper/2025/hash/934252acd87f254d5d4672fbde283bd2-Abstract-Conference.html) |
| INV-K06 | **υπάρχει αυστηρά ανώτερο** | Με n ≥ 3f+1, δύο αντιφατικά verdicts για την ίδια υπόθεση δεν γίνονται ποτέ τελικά. Επιβολή: ADV-02 και KRN-01 witnesses. HotStuff-family μόνο για cross-site διάταξη verdicts (ADR-0031). Tests KT-04, KT-19· Tier 1. | Ανώτερο: Accountable safety. Κρατά το safety για f<n/3 και, όταν αυτό παραβιαστεί, δίνει irrefutable proof ενόχων: 0 ή t+1 ανάλογα με την παραλλαγή, εξαίρεση το HotStuff-null με 1 (Sheng et al. CCS 2021). Το Casper FFG αποδεικνύει αντίστοιχη ιδιότητα με slashing conditions (1/3). Το CometBFT υλοποιεί DuplicateVote και LightClientAttack evidence δεσμευμένα on-chain. Κρατά την ιδιότητα του προχείρου και δίνει εγγύηση στην ανίχνευση που ζητά το KT-04. Trade-off: περιορισμός σε παραλλαγές με forensic support (π.χ. το HotStuff-hash θέλει transcripts από ≥t+1 replicas) και διατήρηση υπογεγραμμένων votes. Για forensics της HotStuff-family σε παραγωγή δεν ξέρω.<br>Το n≥3f+1 είναι το σωστό όριο για BFT agreement, και η HotStuff-family είναι σύγχρονη (HotStuff-2). Όμως: (α) το BFT εγγυάται μη αντιφατική finality ανάμεσα σε replicas, όχι ορθότητα· (β) το ADR-0031 περιορίζει το BFT σε cross-site διάταξη, ενώ το KT-19 επικαλείται το INV-K06 για κατάληψη ή συμπαιγνία κριτών, οπότε συγχέει replicas και panelists· (γ) για LLM κριτές το όριο f δεν τεκμηριώνεται, λόγω συσχετισμένων σφαλμάτων. Το KT-04 ήδη ζητά «ανίχνευση equivocation εντός ορίου», αλλά το invariant δεν δίνει εγγύηση ταυτοποίησης όταν f ≥ n/3. | πείραμα · μέση | [BFT Protocol Forensics, 2021](https://arxiv.org/abs/2010.06785) · [Casper the Friendly Finality Gadget, 2017](https://arxiv.org/abs/1710.09437) · [CometBFT spec: consensus/evidence.md, n.d. (πρόσβαση 2026)](https://github.com/cometbft/cometbft/blob/main/spec/consensus/evidence.md) · [HotStuff-2, 2023](https://eprint.iacr.org/2023/397) · [Correlated Errors in Large Language Models, 2025](https://proceedings.mlr.press/v267/kim25e.html) |
| KT-19 | **υπάρχει αυστηρά ανώτερο** | Κατάληψη ή συμπαιγνία του Court. Κριτήρια: οι όροι ανεξαρτησίας ανιχνεύουν, ο μη-LLM oracle πιάνει seeded ψευδή verdicts, η έφεση ανατρέπει. GP-5· INV-K02, INV-K06. Γενικοί κανόνες §24: προκαταχώριση κατωφλίων, πρώτα σε DST, μη-LLM oracle axis. | Ανώτερο: Control evaluations (Greenblatt et al. ICML 2024): η red team ελέγχει τα μη έμπιστα μοντέλα με attack policies, και μετράται η πιθανότητα ασφαλείας του πρωτοκόλλου. Το ControlArena (UK AISI και Redwood, πάνω στο Inspect) δίνει settings, micro-protocols, monitors και policies. Η ταξινομία του 2026 δίνει τις στρατηγικές συμπαιγνίας (passive self-recognition, causal, acausal/Schelling, combined). Αυστηρά ανώτερο: μετατρέπει το KT-19 σε προκαταχωρισμένο παίγνιο με μετρήσιμο safety, π.χ. την πιθανότητα ένα seeded ψευδές verdict να γίνει τελικό υπό δεδομένη attack policy, και κρατά και τα τρία σκέλη του προχείρου. Trade-off: δεν υπάρχει έτοιμο court setting, πρέπει να κατασκευαστεί.<br>Η προκαταχώριση υπάρχει γενικά (§24 κανόνας 1). Λείπουν όμως μοντέλο απειλής (ποιος αιχμαλωτίζει και πώς), μετρήσιμη ποσότητα, ακόμη και συμβολικά κατώφλια όπως τα θ και ε άλλων KT, και attack policies. Δεν καλύπτονται η συμπαιγνία χωρίς κανάλι και το sandbagging. | πείραμα · μέση | [AI Control: Improving Safety Despite Intentional Subversion, 2024](https://arxiv.org/abs/2312.06942) · [ControlArena (GitHub), n.d. (πρόσβαση 2026)](https://github.com/UKGovernmentBEIS/control-arena) · [When can we trust untrusted monitoring?, 2026](https://arxiv.org/abs/2602.20628) |
| EXP-04 | **υπάρχει αυστηρά ανώτερο** | Πόσο αξιόπιστο είναι το Court: seeded σφάλματα, recall και false-refutation. Εκτός ορίων → επανασχεδιασμός panels και oracles. GP-5, CMP-ADV-02. | Ανώτερο: Ο σχεδιασμός των scalable-oversight benchmarks (Kenton et al. 2024, Khan et al. 2024): σύγκριση direct QA, consultancy, debate, single critique, collaborative resolution και voting, σε πολλαπλές ασυμμετρίες ικανότητας και πληροφορίας. Ground truth δίνει ο μη-LLM oracle, και το alt-test κρίνει πότε ο LLM κριτής μπορεί να αντικαταστήσει ανθρώπους, με ελέγχους για sandbagging. Αυστηρά πιο πληροφοριακό: απαντά και στο «πόσο αξιόπιστο» και στο «ποιο πρωτόκολλο». Trade-off: μεγαλύτερο κόστος.<br>Η προκαταχώριση κατωφλίων υπάρχει ως γενικός κανόνας (§19.5 κανόνας 3). Τα όρια όμως δεν ονομάζονται, η αντιπροσωπευτικότητα των seeded σφαλμάτων δεν εξετάζεται, και κυρίως δεν τίθεται το ερώτημα ποιο πρωτόκολλο να χρησιμοποιηθεί. Τα αποτελέσματα συγκρούονται: η μία κριτική αρκεί σχεδόν όσο το debate υπό συνθήκη (Elasky 2026), η collaborative resolution πετυχαίνει 62,1% έναντι 49,2% (Jiang 2026), η NSO με debate 51,7% σε Elo gap 400 (Engels 2025). | πείραμα · μέση | [On scalable oversight with weak LLMs judging strong LLMs, 2024](https://arxiv.org/abs/2407.04622) · [Collaborative Disagreement Resolution for Scalable Oversight, 2026](https://arxiv.org/abs/2607.01251) · [The Alternative Annotator Test for LLM-as-a-Judge, 2025](https://arxiv.org/abs/2501.10970) · [Scaling Laws For Scalable Oversight, 2025](https://arxiv.org/abs/2504.18530) |
| EXP-16 | **κενό** | Ποια σημασιολογία επιχειρημάτων ταιριάζει στην κρίση ειδικών: grounded έναντι preferred έναντι ASPIC+ με προτεραιότητες. Αποτέλεσμα: αλλαγή default. GP-5, CMP-CCP-02. | Το πείραμα είναι λάθος διατυπωμένο. Το ASPIC+ είναι structured framework που παράγει AF υπό Dung semantics· δεν είναι εναλλακτική της grounded ή της preferred. Επιπλέον, για το Carneades μέσω ASPIC+ η extension είναι μοναδική και ίδια σε όλες τις Dung semantics (van Gijzel & Prakken 2012), οπότε εκεί το δίλημμα grounded/preferred εκλείπει. Λείπουν: burdens και standards of proof, ABA (ICCMA 2025), gradual/QBAF (DF-QuAD με αποδεδειγμένη contestability), rationality postulates, υπολογιστικό κόστος. Το κριτήριο «κρίση ειδικών» είναι μόνο περιγραφικό. Δεν βρέθηκε μελέτη με νομικούς ειδικούς, και τα ευρήματα με γενικούς συμμετέχοντες διαφέρουν (grounded/CF2, preferred στο reinstatement, SCF2, επίδραση γραφικής αναπαράστασης). Για θεσμό αλήθειας χρειάζονται και κανονιστικά κριτήρια. Ο τρέχων default grounded (μοναδική extension, VT-305) είναι συνεπής με σκεπτικιστική αποδοχή για ADJUDICATED. | πείραμα · υψηλή | [ICCMA 2025 Tracks, 2025](https://argumentationcompetition.org/2025/tracks.html) · [Relating Carneades with abstract argumentation via the ASPIC+ framework, 2012](https://doi.org/10.1080/19462166.2012.661766) · [Empirical Study on Human Evaluation of Complex Argumentation Frameworks, 2019](https://arxiv.org/abs/1902.10552) · [Argumentative LLMs (arXiv HTML), 2024](https://arxiv.org/html/2405.02079) |
| ADR-0008 | ισχύει | Το Court ως runtime θεσμοποίηση των [0047]/[0093] και του CPEI L6/Ω+3, με proof obligations αντί personas και ≥1 μη-LLM oracle. | Ο πυρήνας στηρίζεται ισχυρά. Οι LLM κριτές, παρά τη συμφωνία με ανθρώπους άνω του 80%, έχουν biases και ξεγελιούνται με ένα token (master keys), και η NSO μέσω debate πετυχαίνει 51,7% σε Elo gap 400. Τα persona courts (AgentCourt) είναι προσομοιώσεις για εκπαίδευση. Μηχανικοί oracles με μικρό TCB υπάρχουν: certifying algorithms, Lean kernel με ανεξάρτητους checkers (Lean4Lean, nanoda_lib, leanchecker). Στοχευμένος έλεγχος δεν βρήκε ανώτερη αρχή· τα Goel 2025 και Kim 2025 την ενισχύουν. Επιφύλαξη: το σκέλος [0047]/[0093]/CPEI L6/Ω+3 παραπέμπει στο άλλο repo και δεν επαληθεύεται από εδώ (GAP-ADV-16). | σήμερα · μέση | [Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena, 2023](https://arxiv.org/abs/2306.05685) · [One Token to Fool LLM-as-a-Judge, 2025](https://arxiv.org/abs/2507.08794) · [Scaling Laws For Scalable Oversight, 2025](https://arxiv.org/abs/2504.18530) · [Certifying algorithms, 2011](https://doi.org/10.1016/j.cosrev.2010.09.009) · [AgentCourt, 2025](https://aclanthology.org/2025.findings-acl.304/) |
| REQ-ADV-003 | ισχύει | Κάθε αποδοχή περιλαμβάνει ≥1 μη-LLM μηχανικό oracle. CMP-ADV-02, CMP-FRG-05· ICD-14, ICD-30· INV-C03· VT-904, KT-19· [T]. | Η κατεύθυνση είναι σωστή και υλοποιήσιμη σήμερα για κλάσεις με checker (§8.7): citation receipt chain, SMT, Lean με ανεξάρτητους kernels, διπλός υπολογισμός προθεσμιών, grounded labelling με πιστοποιητικό. Τρία προβλήματα: (α) η εμβέλεια διαφέρει από το ICD-14 και το §8.3 (GAP-ADV-03)· (β) ο oracle ελέγχει το τυπικό αντικείμενο, όχι την πιστότητα της μετάφρασης από φυσική γλώσσα. Υπάρχει μερικό αυτόματο μέτρο (FormalAlign 2024), χωρίς απόδειξη επάρκειας (GAP-ADV-09)· (γ) για ερμηνευτικούς ισχυρισμούς η απαίτηση δεν ικανοποιείται και χρειάζεται ρητό Unknown ή ανθρώπινη κρίση (DEC-ADV-02). | σήμερα · μέση | [Certifying algorithms, 2011](https://doi.org/10.1016/j.cosrev.2010.09.009) · [Lean4Lean: Verifying a Typechecker for Lean, in Lean, 2024](https://arxiv.org/abs/2403.14064) · [FormalAlign: Automated Alignment Evaluation for Autoformalization, 2024](https://arxiv.org/abs/2410.10135) |

## Κενά που δεν καλύπτει καθόλου το πρόχειρο

### GAP-ADV-01 — Η §13 δεν γράφτηκε και λείπουν τα formal και contract artifacts του Court

*σήμερα*

Ο χάρτης του master (γρ. 51) αντιστοιχίζει την §13 στο formal/tla/EpistemicCourt.tla. Το INV-K02 παραπέμπει σε αυτό (VT-104) και το ICD-14 στο court.yaml. Κανένα από τα δύο δεν υπάρχει στο repo. Το docs/architecture-draft περιέχει μόνο το master, το spine-vocab.md και τα _unmerged-parts. Οι φάκελοι formal/, contracts/, adrs/ και model/ που αναφέρει το CLAUDE.md δεν υπάρχουν εκεί.

**Γιατί μετρά:** Τα INV-K02, INV-K03, INV-K06, το REQ-ADV-002 και τα VT-104, VT-014 και VT-502 δεν έχουν αντικείμενο επαλήθευσης. Η διαδικασία δεν ορίζεται πουθενά.

**Τι δείχνει το ανώτερο:** Η διαδικασία ως state machine σε TLA+/Apalache, με OpenAPI/AsyncAPI contract, στη Φάση Β.

### GAP-ADV-02 — Ασυμφωνία πράξεων του ICD-14 και ακαθόριστο Unknown verdict

*σήμερα*

Το spine δίνει 7 πράξεις και το 15.md 8 (με Deliberate). Το §15.1 επιβάλλει γενικά το Unknown ως αποτέλεσμα επιτυχίας σε κάθε ICD (INV-C04). Η γραμμή του ICD-14 όμως δεν ορίζει τι σημαίνει Unknown verdict, πώς καταγράφεται στο επίπεδο ετυμηγοριών (INV-K02) και ποιος γίνεται ο βαθμός του ισχυρισμού.

**Γιατί μετρά:** Χωρίς ρητή σημασιολογία, ένα Court που δεν μπορεί να αποφανθεί πιέζεται να βγάλει ψευδή ετυμηγορία.

**Τι δείχνει το ανώτερο:** Μία έδρα για τη λίστα πράξεων· verdict ως sum type {Upheld, Refuted, Unknown(reason)} με τα reasons του §8.4.

### GAP-ADV-03 — Ασυνεπής εμβέλεια του κανόνα για μη-LLM oracle

*σήμερα*

Το REQ-ADV-003 λέει «κάθε αποδοχή», το ICD-14 «για ADJUDICATED/ESTABLISHED». Το §8.3 (γρ. 741–742) ζητά για ADJUDICATED μόνο διαδικασία, standard of proof και dissent record, χωρίς oracle, και για ESTABLISHED formal proof, N-version ή primary source με receipt.

**Γιατί μετρά:** Τρεις κανόνες για την ίδια έννοια παραβιάζουν την αρχή «μία έδρα ανά έννοια» και αφήνουν κενό στο trust lattice.

**Τι δείχνει το ανώτερο:** Κανόνας ανά φύλλο: κάθε μηχανοποιήσιμο φύλλο ελέγχεται από oracle, τα υπόλοιπα δηλώνονται ρητά (πρότυπο BoLD, certifying algorithms).

**Πηγές:** [Overview of BoLD \| Arbitrum Docs, n.d. (πρόσβαση 2026)](https://docs.arbitrum.io/how-arbitrum-works/bold/gentle-introduction) · [Certifying algorithms, 2011](https://doi.org/10.1016/j.cosrev.2010.09.009)

### GAP-ADV-04 — Το INV-K06 συγχέει δύο «Byzantine» και εγγυάται συμφωνία, όχι ορθότητα

*πείραμα*

Το ADR-0031 περιορίζει το BFT σε cross-site διάταξη verdicts (replicas), ενώ το KT-19 επικαλείται το INV-K06 για κατάληψη ή συμπαιγνία κριτών (panelists). Το n≥3f+1 υποθέτει ανεξάρτητες βλάβες, που δεν ισχύουν για LLM κριτές. Το KT-04 ζητά ανίχνευση equivocation χωρίς το invariant να την εγγυάται όταν f ≥ n/3.

**Γιατί μετρά:** Δίνει ψευδή αίσθηση ότι το BFT προστατεύει από λάθος ή αιχμαλωτισμένες ετυμηγορίες.

**Τι δείχνει το ανώτερο:** Το INV-K06 να αφορά μόνο replicas με accountable safety (Sheng 2021· Casper FFG· CometBFT evidence). Η ανεξαρτησία των panels να γίνει χωριστή μετρήσιμη ιδιότητα, με ID-REQUEST, χωρίς επινόηση ID εδώ.

**Πηγές:** [BFT Protocol Forensics, 2021](https://arxiv.org/abs/2010.06785) · [CometBFT spec: consensus/evidence.md, n.d. (πρόσβαση 2026)](https://github.com/cometbft/cometbft/blob/main/spec/consensus/evidence.md) · [Correlated Errors in Large Language Models, 2025](https://proceedings.mlr.press/v267/kim25e.html)

### GAP-ADV-05 — Η ανεξαρτησία δεν μετριέται

*πείραμα*

Οι όροι ανεξαρτησίας (χωριστά κλειδιά, πάροχοι, μνήμη και i–iv του [0093]) είναι δομικοί. Δεν υπάρχει μέτρηση συσχέτισης σφαλμάτων μεταξύ Adversary, panels και generators, ούτε προϋπολογισμός γι' αυτήν.

**Γιατί μετρά:** Οι διαψεύσεις αξίζουν μόνο αν τα σφάλματα δεν είναι κοινά, και η συσχέτιση είναι ισχυρή ακόμη και μεταξύ παρόχων.

**Τι δείχνει το ανώτερο:** Προκαταχωρισμένη μέτρηση κοινών σφαλμάτων σε sealed set (π.χ. CAPA) με κατώφλι· όπου η συσχέτιση είναι υψηλή, υποχρεωτικός μη-LLM άξονας· ψηφοφορία μόνο ως σήμα αβεβαιότητας.

**Πηγές:** [Great Models Think Alike and this Undermines AI Oversight, 2025](https://arxiv.org/abs/2502.04313) · [N-Version Programming with Coding Agents, 2026](https://arxiv.org/html/2606.20158)

### GAP-ADV-06 — Συμπαιγνία χωρίς κανάλι

*πείραμα*

Το πρόχειρο αντιμετωπίζει τη συμπαιγνία μόνο με απουσία κοινής μνήμης. Δεν καλύπτει focal points, passive self-recognition, steganography και self-preference.

**Γιατί μετρά:** Adversary και κριτής από συγγενή μοντέλα μπορούν να συντονιστούν σιωπηρά (KT-19).

**Τι δείχνει το ανώτερο:** Τεχνικές αποτροπής συμπαιγνίας στο untrusted monitoring (Greenblatt 2024), mitigation measures για steganography (Motwani 2024), control evaluations με attack policies συμπαιγνίας (ControlArena, ταξινομία 2026).

**Πηγές:** [Subversion via Focal Points, 2025](https://arxiv.org/abs/2507.03010) · [Secret Collusion among AI Agents, 2024](https://arxiv.org/abs/2402.07510) · [AI Control, 2024](https://arxiv.org/abs/2312.06942)

### GAP-ADV-07 — Sandbagging του Adversarial Entity

*πείραμα*

Ο εφησυχασμός μετριέται σε seeded faults, αλλά ένα LLM μπορεί να αναγνωρίζει τα seeded σφάλματα και να υποαποδίδει επιλεκτικά στα πραγματικά.

**Γιατί μετρά:** Η μετρική του Adversary γίνεται αναξιόπιστη ακριβώς τη στιγμή που μετράει.

**Τι δείχνει το ανώτερο:** Πρόταση σχεδίασης, όχι αποδεδειγμένη μέθοδος: seeded faults μη διακρίσιμα από τα πραγματικά, σύγκριση με μηχανικό άξονα (counterexample search) και εναλλακτικό adversary. Για ώριμη μέθοδο ανίχνευσης δεν ξέρω.

**Πηγές:** [AI Sandbagging, 2024](https://arxiv.org/abs/2406.07358)

### GAP-ADV-08 — Το arsenal δεν επιτίθεται στον ίδιο τον κριτή

*σήμερα*

Τα CMP-ADV-03 και REQ-ADV-004 στοχεύουν injection, poisoning, Byzantine και escape, όχι το Court: πειθώ, position/verbosity bias, master keys, obfuscated arguments.

**Γιατί μετρά:** Ο κριτής είναι το κρισιμότερο σημείο του θεσμού και ξεγελιέται.

**Τι δείχνει το ανώτερο:** Γεννήτριες επιθέσεων προς τον κριτή (master keys, Zheng 2023) και sneaky provers (prover-verifier games) μέσα στο arsenal.

**Πηγές:** [One Token to Fool LLM-as-a-Judge, 2025](https://arxiv.org/abs/2507.08794) · [Prover-Verifier Games improve legibility of LLM outputs, 2024](https://arxiv.org/abs/2407.13692)

### GAP-ADV-09 — Κενό πιστότητας στην τυποποίηση (formalization gap)

*πείραμα*

Ο oracle ελέγχει το τυπικό αντικείμενο (SMT, AF, Lean statement). Τη μετάφραση του νομικού ισχυρισμού σε αυτό την κάνει LLM και δεν ελέγχεται.

**Γιατί μετρά:** Μια σωστή απόδειξη λάθος ισχυρισμού παίρνει ESTABLISHED.

**Τι δείχνει το ανώτερο:** Αποδεδειγμένα επαρκή μηχανισμό δεν ξέρω. Μερικά μέτρα: αυτόματη αξιολόγηση alignment φυσικής και τυπικής διατύπωσης (FormalAlign, σε 4 benchmarks)· η διατύπωση ως χωριστό ζητούμενο στο Court· ανθρώπινη υπογραφή· contestability κατά ArgLLMs.

**Πηγές:** [FormalAlign: Automated Alignment Evaluation for Autoformalization, 2024](https://arxiv.org/abs/2410.10135) · [Argumentative LLMs (arXiv HTML), 2024](https://arxiv.org/html/2405.02079)

### GAP-ADV-10 — Λείπει τυπικό μοντέλο για burden και standards of proof

*σήμερα*

Το REQ-ADV-002 αναφέρει standards of proof, αλλά κανένα κείμενο δεν τα ορίζει και το EXP-16 δεν τα εξετάζει.

**Γιατί μετρά:** Χωρίς αυτά, το ADJUDICATED δεν έχει ελέγξιμο κριτήριο, και το LAWMAX χρειάζεται νομικά πιστά standards.

**Τι δείχνει το ανώτερο:** Carneades μέσω ASPIC+ και μοντέλα burdens/standards σε structured argumentation (Prakken & Sartor 2011, Calegari & Sartor 2021), με υπολογισμό υπό grounded.

**Πηγές:** [The Carneades model of argument and burden of proof, 2007](https://doi.org/10.1016/j.artint.2007.04.010) · [Burdens of Persuasion and Standards of Proof in Structured Argumentation, 2021](https://doi.org/10.1007/978-3-030-89391-0_3)

### GAP-ADV-11 — Δεν έχει επιλεγεί πρωτόκολλο απόφασης

*πείραμα*

Δεν ορίζεται αν ο πυρήνας είναι debate, consultancy, single critique, collaborative resolution ή voting, ούτε πώς η διαφωνία αποσυντίθεται σε φύλλα.

**Γιατί μετρά:** Τα δημοσιευμένα αποτελέσματα διαφέρουν πολύ ανά πρωτόκολλο και συνθήκη.

**Τι δείχνει το ανώτερο:** Bisection μέχρι φύλλα με oracle όπου εφαρμόζεται (BoLD) και σύγκριση πρωτοκόλλων στο EXP-04.

**Πηγές:** [Collaborative Disagreement Resolution for Scalable Oversight, 2026](https://arxiv.org/abs/2607.01251) · [Debate Helps Weak Judges Reward Stronger Models, 2026](https://arxiv.org/abs/2605.27483)

### GAP-ADV-12 — Χωρίς όριο χρόνου και χωρίς άμυνα σε delay attacks

*σήμερα*

Το triage κατά stakes δεν ορίζει μέγιστο χρόνο επίλυσης. Αντίπαλος μπορεί να καθυστερεί με διαδοχικές προσφυγές.

**Γιατί μετρά:** Υποθέσεις μένουν ανοιχτές και μπλοκάρουν προαγωγές.

**Τι δείχνει το ανώτερο:** Φραγμένη καθυστέρηση (BoLD: παράθυρο 6,4 ημερών, ρυθμιζόμενο από τη διακυβέρνηση) και κλιμακούμενο κόστος εφέσεων (Kleros).

**Πηγές:** [Overview of BoLD \| Arbitrum Docs, n.d. (πρόσβαση 2026)](https://docs.arbitrum.io/how-arbitrum-works/bold/gentle-introduction) · [Kleros Short Paper v1.0.7, 2019](https://kleros.io/assets/whitepaper.pdf)

### GAP-ADV-13 — Δεν ορίζεται η σύνθεση της έφεσης

*σήμερα*

Ορίζεται μόνο ότι ο δημιουργός είναι η ανώτατη έφεση (ICD-14, INV-C05). Δεν ορίζονται ενδιάμεσοι βαθμοί ή νέο ανεξάρτητο panel.

**Γιατί μετρά:** Αν την έφεση κρίνει το ίδιο ή συσχετισμένο panel, το «η έφεση ανατρέπει» του KT-19 δεν έχει νόημα.

**Τι δείχνει το ανώτερο:** Νέο, μεγαλύτερο σώμα σε κάθε βαθμό (Kleros: διπλάσιοι ένορκοι συν ένας), με διαφορετικό άξονα κρίσης.

**Πηγές:** [Kleros Short Paper v1.0.7, 2019](https://kleros.io/assets/whitepaper.pdf)

### GAP-ADV-14 — Τα KT-19 και EXP-04 δεν έχουν λειτουργικές μετρικές

*σήμερα*

Η προκαταχώριση υπάρχει γενικά (§24 κανόνας 1, §19.5 κανόνας 3). Όμως το KT-19 δεν ονομάζει ούτε συμβολικό κατώφλι, μετρήσιμη ποσότητα ή μοντέλο απειλής (σε αντίθεση με τα θ και ε του KT-01 και το ≥10^5 του KT-10). Το EXP-04 ονομάζει recall και false-refutation χωρίς μέγεθος δείγματος ή σχεδιασμό seeded faults.

**Γιατί μετρά:** Δεν μπορεί να αποφασιστεί «πέρασε ή απέτυχε», κάτι που αντιβαίνει στο «0 λάθος» και στο ADR-0027.

**Τι δείχνει το ανώτερο:** Control evaluations με μετρήσιμο safety και benchmarks πρωτοκόλλων με alt-test.

**Πηγές:** [AI Control, 2024](https://arxiv.org/abs/2312.06942) · [The Alternative Annotator Test for LLM-as-a-Judge, 2025](https://arxiv.org/abs/2501.10970)

### GAP-ADV-15 — Το dissent διατηρείται αλλά δεν χρησιμοποιείται ως σήμα

*πείραμα*

Στο πρόχειρο το dissent εμφανίζεται μόνο ως καταγραφή (INV-K03, ICD-14, §8.3, §19.3). Κανένα component δεν το χρησιμοποιεί για βαθμονόμηση ή για να ενεργοποιήσει έφεση.

**Γιατί μετρά:** Χάνεται πληροφορία: σε περίπου 1 στις 4 αποκλίνουσες περιπτώσεις δικαιώνεται η μειοψηφία.

**Τι δείχνει το ανώτερο:** Meta-classifier πάνω στα logs (Minority Sentinel, Flip Precision 81,2%) που ενεργοποιεί αυτόματη έφεση ή Unknown.

**Πηγές:** [Minority Sentinel, 2026](https://arxiv.org/abs/2606.29270)

### GAP-ADV-16 — Εξάρτηση από ανεπαλήθευτες as-built έδρες

*σήμερα*

Το ADR-0008, η §0.3 (γρ. 139) και το INV-K02 στηρίζονται στα [0047], [0093], CPEI L6, legal-dialectic (grounded) και Ω+3, που βρίσκονται στο STAVROPOULOSLAWCORPUS και δεν ελέγχθηκαν.

**Γιατί μετρά:** Αν οι έδρες διαφέρουν από την περιγραφή, το crosswalk του Court καταρρέει.

**Τι δείχνει το ανώτερο:** Επαλήθευση από τον δημιουργό ή σε χωριστή εργασία εντός εκείνου του έργου.

## Δεν ξέρω

- Η πραγματική κατάσταση των [0047], [0093], CPEI L6, legal-dialectic (grounded) και Ω+3 στο STAVROPOULOSLAWCORPUS: δεν ανοίχτηκε, κατά την εντολή.
- Δεν βρέθηκε υπαρκτό σύστημα Epistemic Court για ισχυρισμούς φυσικής ή νομικής γλώσσας αγκυρωμένο σε oracle. Τα παραγωγικά ανάλογα (BoLD) αφορούν ντετερμινιστικό υπολογισμό.
- Ακρίβεια debate, LLM juries και single critique σε νομικούς-ερμηνευτικούς ισχυρισμούς: οι μελέτες αφορούν QA, code, logic και math.
- Ποια σημασιολογία ταιριάζει σε νομικούς ειδικούς: δεν βρέθηκε μελέτη με νομικούς ειδικούς.
- Αν υπάρχουν σε παραγωγή forensics της HotStuff-family. Επαληθεύτηκε μόνο ότι το CometBFT υλοποιεί evidence σε spec· την έκταση παραγωγικής χρήσης δεν την ξέρω.
- Venue (NeurIPS 2024) των Panickssery et al. και Motwani et al., και ICLR 2025 του ForecastBench: δεν φαίνονται στις σελίδες arXiv, και το Semantic Scholar έδωσε 429. Αφαιρέθηκαν.
- Κατάσταση του ForecastBench leaderboard το 2026 (superforecasters έναντι LLM): δεν ανακτήθηκαν δεδομένα από τη σελίδα.
- Ημερομηνία ενεργοποίησης του BoLD (Feb 2025): μόνο από δευτερογενή πηγή.
- Οι συγκεκριμένες ονομασίες proof standards και η διάκριση burden of production και persuasion στο Carneades 2007: πρόσβαση 403, το Crossref χωρίς abstract.
- Αν η συσχέτιση σφαλμάτων των frontier LLMs ισχύει με την ίδια ένταση στη νομική συλλογιστική.
- Ώριμη μέθοδος ανίχνευσης sandbagging μόνο από συμπεριφορά: δεν ξέρω.
- Ο προϋπολογισμός WebSearch είχε εξαντληθεί (200/200). Οι στοχευμένοι έλεγχοι holds έγιναν με WebFetch σε arXiv, Crossref και Semantic Scholar, με rate limits 429· μπορεί να ξέφυγαν πρόσφατες εργασίες.

## Τι διόρθωσε ο ανεξάρτητος ελεγκτής

Πηγές που άνοιξε: 79 · δεν στέκονταν: 22 · διορθώσεις: 23

- **ICD-14 (classification, superior, reasoning):** today→experiment. Η υπεροχή περιορίστηκε σε αποσυνθέσιμους/υπολογιστικούς ισχυρισμούς. Αφαιρέθηκε ο ισχυρισμός ότι λείπει το Unknown (το §15.1 το επιβάλλει γενικά)· προστέθηκε ότι δεν υπάρχει παραγωγικό προηγούμενο για φυσική γλώσσα — Το BoLD αφορά μόνο ντετερμινιστικό υπολογισμό· ανάγνωση του 15.md γρ. 14
- **KT-19, EXP-04, GAP-ADV-14:** Αφαιρέθηκε το «δεν υπάρχει pre-registration»· το κενό διατυπώθηκε ως έλλειψη λειτουργικής μετρικής και μοντέλου απειλής. Το confidence του KT-19 έγινε medium — Οι §24 κανόνας 1 και §19.5 κανόνας 3 επιβάλλουν γενική προκαταχώριση· το ControlArena δεν έχει court setting
- **INV-K06, SOTA-ADV-21, DEC-ADV-04:** Προστέθηκαν Casper FFG (accountable safety) και CometBFT evidence, το ότι το KT-04 ήδη ζητά ανίχνευση equivocation, η εξαίρεση HotStuff-null και το k≥t+1 του HotStuff-hash, και τρίτη εναλλακτική — Πλήρες κείμενο Sheng 2021· PDF Casper· spec CometBFT
- **GAP-ADV-17:** Αφαιρέθηκε — Διαστρωματικό (75 έναντι 76 CMP, επιβεβαιωμένο: 75 γραμμές στην §6.3)· είναι ήδη γνωστό στο πλαίσιο και δεν ανήκει στο ADV
- **ADR-0008 draft_ref:** «master §4 γρ. 282–283, 324» → «§0.3 γρ. 139, §3 γρ. 282–283, §3.1 γρ. 324» — Οι γραμμές ανήκουν στις §3 και §3.1 κατά τους τίτλους του master
- **GAP-ADV-02:** Επαναδιατύπωση: το Unknown επιβάλλεται γενικά, λείπει η σημασιολογία του για το verdict — _unmerged-parts/15.md γρ. 14
- **SOTA-ADV-01 (Kenton):** Προστέθηκε το «όταν ο consultant ανατίθεται τυχαία» και τα μικτά αποτελέσματα έναντι direct QA — Abstract arXiv 2407.04622
- **SOTA-ADV-03 και CMP-ADV-01 (Elasky):** Προστέθηκε η συνθήκη (critic ξεπερνά τον κριτή· ο κριτής ελέγχει) και ότι η σύγκριση είναι έναντι consultancy — Πλήρες abstract arXiv 2605.27483
- **SOTA-ADV-02 (DQC):** Προστέθηκε το «για PSPACE/poly» — Abstract arXiv 2602.08630
- **SOTA-ADV-05 (W2S):** Το «πραγματικά εφικτή» έγινε «εν μέρει», με caveat για τη naive finetuning — Abstract arXiv 2312.09390
- **SOTA-ADV-07:** Αφαιρέθηκε το ακρωνύμιο FCPS· προστέθηκε «point estimate, 11 κελιά με 95% CI» — Abstract arXiv 2606.01034
- **SOTA-ADV-08:** Διορθώθηκε ο τίτλος Ron et al.· προστέθηκε το Goel et al. 2025· προστέθηκε η μείωση αποτυχιών με ψηφοφορία — Σελίδες arXiv
- **SOTA-ADV-09:** Το «redaction κατά της συμπαιγνίας» έγινε «τεχνικές αποτροπής συμπαιγνίας και trusted editing»· προστέθηκε η περιορισμένη επιτυχία στα focal points — Abstracts 2312.06942 και 2507.03010
- **SOTA-ADV-10, GAP-ADV-07:** Το «η ανίχνευση παραμένει ανώριμη» έγινε «δεν ξέρω» — Δεν υπάρχει στην πηγή
- **SOTA-ADV-11:** maturity production→pilot· προστέθηκαν μετρικές (0,38%, 23,7%) και venue ICLR 2025 για το GFlowNet — Οι μέθοδοι είναι ερευνητικές· abstracts
- **SOTA-ADV-12:** Πρωτογενείς πηγές στη θέση του blog· προστέθηκαν HarmBench, AgentDojo, IDs NIST και η λίστα OWASP — Επαληθευμένες σελίδες
- **SOTA-ADV-14, REQ-ADV-002, GAP-ADV-10:** Προστέθηκαν Prakken & Sartor 2011 και Calegari & Sartor 2021· σημειώθηκε ως ανεπαλήθευτη η λεπτομέρεια για το Carneades — Crossref· 403 στην πηγή του Carneades
- **SOTA-ADV-17, EXP-16:** Το «με μη ειδικούς/δεν έχει βάση» έγινε «δεν βρέθηκε μελέτη με νομικούς ειδικούς»· προστέθηκε η μοναδική extension του Carneades — Οι πηγές δεν δηλώνουν τον τύπο συμμετεχόντων· abstract van Gijzel & Prakken
- **SOTA-ADV-18, REQ-ADV-003:** lean4checker → leanchecker (v4.28.0)· αφαιρέθηκε το «πολυωνυμικός χρόνος»· προστέθηκε το FormalAlign — Repo archived· χωρίς πηγή για την πολυπλοκότητα
- **SOTA-ADV-19:** Έτος Kleros → 2019· προστέθηκε η stake-weighted κλήρωση· το 6,4 ημέρες σημειώθηκε ρυθμιζόμενο από το DAO· προστέθηκε η Sepolia — Τοπική εξαγωγή whitepaper· docs Arbitrum
- **SOTA-ADV-22:** Αφαιρέθηκε το ICLR 2025· προστέθηκαν αριθμοί Brier· διορθώθηκαν οι δυσκολίες της adversarial collaboration — arXiv v5· Crossref
- **DEC-ADV-01:** Πρόταση σε υβριδικό πυρήνα· διορθώθηκε το rationale ότι «μόνο η 2η διατηρεί το ADR-0008» — Και η επίπεδη διαδικασία με κανόνα oracle διατηρεί το ADR-0008
- **Ονοματολογία IDs:** Οι συντομογραφίες K02/K06 κ.λπ. έγιναν πλήρη IDs· αφαιρέθηκαν ονόματα μοντέλων από τα κείμενα — Κανόνες 5 και 7
