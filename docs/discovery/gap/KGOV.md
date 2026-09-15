# World OS / πυρήνας — εκτελέσιμο σύνταγμα, capabilities, controls — πρόχειρο έναντι ανώτερου (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| IDs | Ετυμηγορία | Τι λέει το πρόχειρο | Τι αλλάζει και γιατί | Κατάταξη · βεβαιότητα | Πηγές |
|---|---|---|---|---|---|
| CMP-KRN-06, ICD-06 | **υπάρχει αυστηρά ανώτερο** | Stateless αξιολογητής κάθε δομικής μετάβασης (organ swap, migration, amendment, lifecycle, promotion) έναντι κατηγορημάτων Tier 0/1/2. Επιστρέφει GateVerdict{allow/deny/unknown, predicates[], proof_ref, sig}. Fail-closed (UNKNOWN ή σφάλμα κατηγορήματος ⇒ άρνηση)· N-version Rust + Common Lisp reference· σε διαφωνία, άρνηση και Court case. | Ανώτερο: Εκτελέσιμο spec του evaluator σε Lean 4, με αποδείξεις για fail-closed, determinism, υπεροχή Tier 0>1>2 και order independence, και DRT/PBT έναντι της Rust· το Lisp ως τρίτη υλοποίηση. Verdict envelope τύπου VSA/in-toto: verifier, policy URI+digest (δηλαδή constitution hash), result, evidence class. Διατηρεί το fail-closed και το N-version και προσθέτει αποδείξεις. Trade-off: κόστος συγγραφής και συντήρησης αποδείξεων· αβέβαιο αν τα συνταγματικά κατηγορήματα (π.χ. ND πάνω σε εμπειρική μαρτυρία) χωρούν σε αποφασίσιμο fragment όπως αυτό του Cedar — γι' αυτό experiment.<br>Το fail-closed και το υπογεγραμμένο verdict συμφωνούν με την SOTA (VAP failurePolicy Fail, VSA υπογεγραμμένο in-toto με policy digest). Το N-version όμως χωρίς αποδεδειγμένο reference είναι ασθενέστερο από το VGD του Cedar: εκτελέσιμο μοντέλο σε Lean με αποδείξεις και DRT/PBT έναντι της Rust υλοποίησης, όπου οι αποδείξεις βρήκαν 4 bugs στον validator και το DRT/PBT άλλα 21. Δύο ανεπαλήθευτες υλοποιήσεις μπορούν να συμφωνούν στο ίδιο λάθος αν παρανοούν με τον ίδιο τρόπο την προδιαγραφή. Ασάφεια του ίδιου του προχείρου: το ADR-0028 υιοθετεί Lean 4 εκτελέσιμη reference semantics (VGD) για την πλατφόρμα σχεδίασης, ενώ τα KRN-06/ICD-06 ορίζουν Lisp reference· δεν δηλώνεται ποιο είναι το αυθεντικό spec του gate. Ούτε το proof_ref ορίζεται: δεν διακρίνει formal proof από εμπειρική μαρτυρία. | πείραμα · μέση | [How We Built Cedar, 2024](https://arxiv.org/abs/2407.01688) · [cedar-lean, 2026](https://github.com/cedar-policy/cedar-spec/tree/main/cedar-lean) · [SLSA VSA, 2026](https://slsa.dev/spec/v1.2/verification_summary) · [K8s VAP, 2024](https://kubernetes.io/docs/reference/access-authn-authz/validating-admission-policy/) |
| CMP-KRN-05, ADR-0010 | ισχύει | Control Records create/list/explain/revoke με απόδοση, εμβέλεια και λήξη, που μεταγλωττίζονται σε πολιτική για το gateway· άγνωστο policy hash ⇒ άρνηση. Γλώσσα Cedar-class: [T] στο §6.3, [X] στο ADR-0010. Έδρα κατά το 6.4: approval-policy.lisp (CPEI L12) + overridden-p. | Η κατεύθυνση ταυτίζεται με την παραγωγή: Cedar με αποδείξεις σε Lean και SMT ανάλυση, σε Verified Permissions και AgentCore. Κατά την κρίση μας η γλώσσα είναι [T] και [X] μόνο η απεικόνιση των controls σε αυτήν. Δύο κρυφά όρια: (α) skip-on-error — ένα forbid που σφάλλει παραλείπεται, άρα ένα control μπορεί να αποτύχει ανοιχτό· μετά το validation παραμένουν δυνατά overflow και missing entity (τα σφάλματα extension constructors τα αποκλείει το strict mode, που είναι προεπιλογή)· (β) το Cedar είναι stateless· τα temporal controls υπάρχουν μόνο ως managed λειτουργία του AgentCore (session-scoped, ≤24h), και ο ανοικτός interpreter του Dogwood δεν είναι για παραγωγή. Υπάρχει και σύγκρουση μίας έδρας: approval-policy.lisp ή Cedar. Οι αναζητήσεις δεν βρήκαν αυστηρά ανώτερη γλώσσα πολιτικής. | σήμερα · μέση | [Cedar authorization, 2026](https://docs.cedarpolicy.com/auth/authorization.html) · [Cedar validation, 2026](https://docs.cedarpolicy.com/policies/validation.html) · [AgentCore temporal policies, 2026](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/policy-temporal.html) · [Dogwood, 2026](https://github.com/dogwood-policy/dogwood) |
| ICD-05 | ισχύει | KRN-05 → KRN-06/08/11, COG-01, HUM-01/02 (συντάκτες LAW-09 και ο δημιουργός)· gRPC + OpenAPI. Create(ControlRecord), List(scope), Explain(effect)→controls, Revoke(id, reason), Decide(effect_request)→allow/deny+controls. Κάθε control υπογεγραμμένο, με scope, λόγο και λήξη, ορατό σε κάθε επηρεαζόμενο (CONTROL_RESTRICTED), χωρίς ποτέ αλλαγή του capability set. | Ο διαχωρισμός διαχείρισης (Create/Revoke), απόφασης (Decide) και επιβολής αντιστοιχεί στο PDP↔PEP μοντέλο που τυποποιεί το AuthZEN 1.0 (Final, 2026). Το Explain αντιστοιχεί στα Cedar diagnostics (policy IDs, και όσα σφάλλουν). Τα υπογεγραμμένα records στο ledger υπερβαίνουν τα decision logs του OPA, για τα οποία η τεκμηρίωση δεν αναφέρει υπογραφή. Λείπουν: consistency token (τύπου zookie) που να δένει το Decide σε cut του ledger, ώστε revoke και decide να μην αναδιατάσσονται· και ρητός κανόνας ότι σφάλμα του PDP ή μη κενά diagnostics.errors σημαίνουν deny. | σήμερα · μέση | [OpenID AuthZEN, 2026](https://openid.net/wg/authzen/) · [Zanzibar, 2019](https://research.google/pubs/zanzibar-googles-consistent-global-authorization-system/) · [Zanzibar paper, annotated copy (AuthZed), 2019](https://zanzibar.tech/) · [OPA decision logs, 2026](https://www.openpolicyagent.org/docs/management-decision-logs) · [Cedar authorization, 2026](https://docs.cedarpolicy.com/auth/authorization.html) |
| INV-C02 | ισχύει | Κάθε control είναι υπογεγραμμένο ControlRecord στο ledger, ανακλητό, επιβάλλεται μόνο στο KRN-11 και δεν αλλάζει το Caps· κάθε άρνηση εμφανίζεται ως Unknown(CONTROL_RESTRICTED, control_id). Tier 0· επιβολή KRN-05/KRN-11· VT-203, VT-302. | Η αρχή έχει ισχυρό προηγούμενο: τα SCPs δεν χορηγούν ποτέ δικαιώματα, απλώς ορίζουν το μέγιστο σύνολο· το AgentCore επιβάλλει έξω από τον κώδικα του agent. Ελαττώματα: (α) το «μόνο στο KRN-11» (και το glossary: «το μόνο σημείο επιβολής controls») αντιφάσκει με το ICD-05, που έχει καταναλωτές τα KRN-06, KRN-08 και COG-01, με το TB-4 (Inference Gateway: redaction, residency), με το INV-L03 (επιβολή σε KRN-11, KRN-08, COG-01) και με το ICD-29 EraseByControl· (β) η υποχρεωτική αποκάλυψη του control_id μπορεί να συγκρουστεί με το INV-L03, ενώ η AWS αποκαλύπτει τον τύπο της πολιτικής και μόνο σε ορισμένες περιπτώσεις το ARN· (γ) τα VT-203 και VT-302 δεν επαληθεύτηκαν από εδώ. | σήμερα · μέση | [AWS SCPs, 2026](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) · [IAM access denied messages, 2026](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_access-denied.html) |
| CMP-KRN-11, ICD-08 | **υπάρχει αυστηρά ανώτερο** | Μοναδικό μονοπάτι επιδράσεων: έλεγχος capability tokens, controls, confidentiality domains, budgets· Effect Receipts. Όργανα σε sandbox χωρίς ambient authority (Wasmtime host functions, egress proxy). InvokeEffect(capability_token, effect, domain)→EffectReceipt \| Unknown(CONTROL_RESTRICTED). Κατά το glossary, token = unforgeable, scoped, χρονικά φραγμένη εξουσιοδότηση (ocap). | Ανώτερο: Gateway με value-level provenance/IFC labels (κλάση FIDES/CaMeL) και attenuable, sender-constrained tokens. Κυριαρχεί στα INV-S01 και INV-L03 και διατηρεί το ocap, τα controls και τα receipts. Trade-off: (α) χρησιμότητα — CaMeL 77% έναντι 84% στο AgentDojo· (β) ο planner/interpreter που παρακολουθεί labels μπαίνει στο TCB· (γ) τα όργανα πρέπει να διαδίδουν labels ή να εκτελούνται μέσα από τον interpreter.<br>Το ocap χωρίς ambient authority ισχύει και υλοποιείται σήμερα (WASI, seL4). Σε prompt injection όμως η κλήση είναι εξουσιοδοτημένη, ενώ τα ορίσματά της προέρχονται από untrusted δεδομένα. Το πρόχειρο προβλέπει provenance-tagged κανάλια (§0.1, INV-S01), αλλά σε επίπεδο καναλιού και χωρίς formal artifact· το InvokeEffect του ICD-08 δεν φέρει labels ορισμάτων. CaMeL και FIDES ελέγχουν την προέλευση κάθε τιμής στο σημείο της επίδρασης, και το FIDES με τυπική εγγύηση non-interference για την integrity. Επιπλέον το token δεν έχει σημασιολογία attenuation, delegation, revocation ή PoP. | πείραμα · μέση | [CaMeL, 2025](https://arxiv.org/abs/2503.18813) · [FIDES (HTML), 2025](https://arxiv.org/html/2505.23643) · [WASI, 2026](https://wasi.dev/) · [Biscuit SPECIFICATIONS.md, 2026](https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md) |
| CMP-KRN-04, ICD-04, REQ-GOV-002 | ισχύει | Organ contracts (WIT/proto), conformance vectors, μονότονο capability lattice με benchmark evidence, admission υπογεγραμμένων artifacts (SLSA provenance) fail-closed, ND ledger· ικανότητες μόνο από evidence του harness· TTL και επαναπιστοποίηση. REQ-GOV-002: καμία χρήσιμη ικανότητα δεν αφαιρείται σιωπηρά (VT-203, VT-301, KT-24). | Το admission ευθυγραμμίζεται με SLSA 1.2, VSA, in-toto, Sigstore και WIT/WASI (σημερινό). Η μαρτυρία όμως απειλείται από sandbagging και στατιστικό θόρυβο: χρειάζονται error bars, power analysis και ανίχνευση sandbagging, π.χ. noise injection (πειραματικό). Ασυνέπειες: (α) το πρόχειρο δεν ορίζει τι σημαίνει η λήξη TTL· αν μειώνει το Caps χωρίς ND ή Control, συγκρούεται με το INV-C01· (β) το glossary χωρίζει ρητά Capability (ικανότητα, όχι permission) από Capability token (εξουσία ocap), αλλά ο γυμνός όρος χρησιμοποιείται αδιάκριτα (§0 και §28.1 «capabilities» ως ουσία του πυρήνα, ICD-10 Invoke(capability, args), «Capability Gateway» που ελέγχει tokens)· (γ) το Resolve(capability)→organ αναμειγνύει μητρώο και δρομολόγηση. Admission = today· κατώφλια της ND μαρτυρίας = experiment. | πείραμα · μέση | [SLSA v1.2, 2026](https://slsa.dev/spec/v1.2/) · [Sigstore policy-controller, 2026](https://docs.sigstore.dev/policy-controller/overview/) · [AI Sandbagging, 2024](https://arxiv.org/abs/2406.07358) · [Noise Injection Reveals Hidden Capabilities of Sandbagging Language Models, 2024](https://arxiv.org/abs/2412.01784) · [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640) |
| CMP-GOV-01 | ισχύει | Corpus άρθρων Tier 0/1/2 με κατηγορήματα, σημεία επιβολής και συνδέσμους formal artifacts· αμφίσημο άρθρο ⇒ είτε εκτελέσιμο κατηγόρημα είτε δηλωμένη μη εκτελέσιμη αρχή με test. S-expressions (υπάρχουσες έδρες) + Lean· [T]. Έδρα: SYSTEM- και ARCHITECTURE-CONSTITUTION + στόχος CPEI L10. | Η διάκριση εκτελέσιμου κατηγορήματος και αρχής με test είναι ακριβώς ό,τι δείχνει η SOTA: τα AR checks εγγυώνται VALID μόνο για τις μεταβλητές της πολιτικής και χρειάζονται fidelity report· τα συντάγματα μοντέλων είναι πιθανοτικά. Κενό: δεν ορίζεται η λογική των άρθρων — deontic τελεστές (LegalRuleML), εξαιρέσεις (default logic του Catala), επίλυση σύγκρουσης κανόνων (ODRL conflict). Το «S-expr + Lean» είναι σύνταξη, όχι σημασιολογία. | πείραμα · μέση | [Bedrock AR checks, 2026](https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-automated-reasoning-checks.html) · [Catala, 2021](https://arxiv.org/abs/2103.03198) · [LegalRuleML Core 1.0, 2021](https://docs.oasis-open.org/legalruleml/legalruleml-core-spec/v1.0/legalruleml-core-spec-v1.0.html) · [ODRL Information Model 2.2, 2018](https://www.w3.org/TR/odrl-model/) |
| REQ-GOV-001, ADR-0009 | ισχύει | Tiers με entrenchment. Tier 0: μόνο ο δημιουργός, με T_cool και επανεκτέλεση όλων των KT σε DST πριν το EFFECTIVE. Αλυσίδα PROPOSED→COURT_REVIEW→CREATOR_SIGNATURE→COMPILE_ROUNDTRIP→COOLING→DST_REPLAY→EFFECTIVE. Αναθεώρηση των SYSTEM- και ARCHITECTURE-CONSTITUTION, όχι τρίτο σύνταγμα· compiler = CPEI L10/Ω+1. REQ-GOV-001: VT-904, VT-301. | Tiers, ψύξη και δοκιμή πριν την ενεργοποίηση υπάρχουν σε παραγωγή (cooldown του Tezos σε test networks, tracks και enactment του OpenGov). Το roundtrip του compiler έχει προηγούμενο (Catala σε F*, Cedar DRT). Ελαττώματα: (α) τα «όλα τα KT σε DST» περιλαμβάνουν τα KT-14 (null baseline με προκαταχωρισμένη σύγκριση) και KT-15 (τυφλή σύγκριση με frontier LLM, commercial legal AI system (Harvey-class) και ανθρώπινη ομάδα), που δεν εκτελούνται σε ντετερμινιστική προσομοίωση· (β) δεν υπάρχει επισπευσμένη διαδρομή ούτε ακύρωση· (γ) το «όλα τα ενεργά Control Records επαναξιολογούνται» δεν ορίζει τι γίνεται με όσα αποτύχουν· (δ) το VT-301 (Lean nd_preserved_by_composition, INV-C01) δεν ελέγχει τη διαδικασία αναθεώρησης. Η έδρα στο άλλο repo είναι ανεπαλήθευτη. Αναζήτηση για μηχανικά ελέγξιμες διαδικασίες αναθεώρησης AI δεν βρήκε ανώτερο. | σήμερα · μέση | [Tezos governance, 2026](https://docs.tezos.com/architecture/governance) · [Polkadot OpenGov, 2026](https://wiki.polkadot.com/learn/learn-polkadot-opengov/) |
| REQ-GOV-004 | δεν ξέρω | Το GRAIL δεν προσθέτει νέο primitive και μόνο επεκτείνει υπάρχουσες έδρες (MDL-01, GOV-01· ICD-32· C05· VT-901· μέθοδος I). | Τα 13 primitives και οι έδρες ζουν στο STAVROPOULOSLAWCORPUS, άλλο έργο, και δεν ελέγχονται από εδώ. Η προϋπόθεση της απαίτησης (ADR-0001: πακέτο στο deployment/grail/ του άλλου repo) συγκρούεται με τη σημερινή διάταξη: χωριστό repo και model στο SysON. Το VT-901 (traceability) δεν αποδεικνύει ότι δεν προστέθηκε primitive. Δεν υπάρχει εξωτερική SOTA για αυτή την εσωτερική αρχή. | σήμερα · υψηλή |  |
| INV-C05, REQ-GOV-003 | ισχύει | Αναθεώρηση Tier 0/1, άνοιγμα φάσης, merge και R-C αλλαγή οργάνου ισχύουν μόνο με υπογραφή του δημιουργού (Owner-Root delegation) και Court record στο ledger· IdentityContinuity.tla (VT-102)· KT-23, VT-904. | Η αρχή συμφωνεί με το AI Act Art.14 (ανθρώπινο override). Επειδή είναι κρυπτογραφική, είναι ισχυρότερη από κειμενικές ιεραρχίες όπως το chain of command του Model Spec. Το Progent δείχνει το συμπλήρωμα για τα δικαιώματα: στένωση αυτόματα, διεύρυνση μόνο με έγκριση. Ανοιχτά: (α) ένα κλειδί είναι single point of failure· TUF (διπλό threshold σε root rotation) και FROST επιτρέπουν k-of-n κλειδιά του ίδιου δημιουργού, και το EP-04 του προχείρου ήδη επιτρέπει threshold σχήματα μόνο μεταξύ συσκευών του κυρίαρχου (KL-7)· (β) δεν ορίζεται διαδοχή σε ανικανότητα· (γ) δεν ορίζεται safe-halt. Τα KEY-LIFECYCLE και KL-7 δεν επαληθεύονται από εδώ. | σήμερα · μέση | [AI Act Article 14, 2026](https://artificialintelligenceact.eu/article/14/) · [TUF spec, 2026](https://theupdateframework.github.io/specification/latest/) · [RFC 9591, 2024](https://www.rfc-editor.org/rfc/rfc9591.html) · [Progent, 2025](https://arxiv.org/abs/2504.11703) |
| EP-12 | ισχύει | Governance Mechanism: συμβόλαια ICD-14 και ICD-15· νέοι μηχανισμοί διαβούλευσης και συναίνεσης· προστασία: υπεροχή του Tier-0, INV-C05. | Σωστό ως [E]· υπάρχουν ώριμοι μηχανισμοί (CCAI, Tezos, OpenGov με conviction και delegation ανά track, IG 2.0). Το συμβόλαιο όμως δεν απαιτεί: (α) Sybil resistance — το ICD-15 έχει Fork(policy) και Birth, άρα μηχανισμός με μία ψήφο ανά οντότητα μπορεί να πολλαπλασιάσει ψήφους· (β) δηλωμένα quorum, supermajority, διαδικασία ακύρωσης και δικαίωμα πρότασης· (γ) κωδικοποίηση των κανόνων (Govern(procedure)) σε μορφή ελέγξιμη από το gate. | επέκταση · μέση | [Collective Constitutional AI, 2024](https://arxiv.org/abs/2406.07814) · [Polkadot OpenGov, 2026](https://wiki.polkadot.com/learn/learn-polkadot-opengov/) · [IG 2.0 Codebook, 2024](https://arxiv.org/abs/2008.08937) |
| REQ-GOV-005 | ισχύει | Κάθε επίδραση μένει εντός του δηλωμένου νόμιμου πεδίου ικανοτήτων· token εκτός πεδίου δεν εκδίδεται (KRN-11, KRN-05, LAW-09· ICD-08· VT-008). | Ο μηχανισμός υλοποιείται σήμερα (ντετερμινιστική Cedar στο όριο, AgentCore). Η νομιμότητα όμως δεν αποφασίζεται πλήρως κατά την έκδοση του token: τα AR checks εγγυώνται μόνο για το τυποποιημένο υποσύνολο, και η μετάφραση NL→policy χρειάζεται fidelity. Άρα το πεδίο πρέπει να οριστεί ως τυποποιημένο υποσύνολο + Unknown⇒άρνηση + INV-L02 για το υπόλοιπο, μαζί με έλεγχο προέλευσης των ορισμάτων. | πείραμα · μέση | [Policy in AgentCore, 2026](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/policy.html) · [Bedrock AR checks, 2026](https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-automated-reasoning-checks.html) |

## Κενά που δεν καλύπτει καθόλου το πρόχειρο

### GAP-KGOV-01 — Έλεγχος προέλευσης ορισμάτων (IFC) στο gateway

*πείραμα*

Το ICD-08 ελέγχει token, controls και domain, όχι όμως από πού προέρχεται κάθε όρισμα της επίδρασης. Το provenance tagging του §0.1/INV-S01 είναι σε επίπεδο καναλιού και δεν φτάνει στο InvokeEffect.

**Γιατί μετρά:** Χωρίς αυτό, τα INV-S01 και INV-L03 μπορούν να παραβιαστούν μέσα από εξουσιοδοτημένες κλήσεις.

**Τι δείχνει το ανώτερο:** Capabilities/tags πάνω σε τιμές (CaMeL) και labels confidentiality/integrity με ντετερμινιστική επιβολή και τυπικές εγγυήσεις non-interference και explicit secrecy (FIDES).

**Πηγές:** [CaMeL, 2025](https://arxiv.org/abs/2503.18813) · [FIDES (HTML), 2025](https://arxiv.org/html/2505.23643)

### GAP-KGOV-02 — Σημασιολογία capability token

*σήμερα*

Το glossary ορίζει το token ως unforgeable, scoped και χρονικά φραγμένο, αλλά δεν ορίζονται μορφή, attenuation, delegation chain, revocation, proof-of-possession ούτε διάδοση σε αλυσίδα οργάνων.

**Γιατί μετρά:** Χωρίς αυτά δεν τεκμηριώνονται το INV-S02, το KT-18 ούτε η προστασία από confused deputy.

**Τι δείχνει το ανώτερο:** Biscuit (Datalog, offline attenuation, third-party blocks), UCAN 1.0 ή macaroons για attenuation· DPoP για PoP· Transaction Tokens για call chains· audience binding και απαγόρευση token passthrough όπως στο MCP 2026-07-28. Ερευνητικό προφίλ για αλυσίδες agents: AIP/IBCT (JWT single-hop, Biscuit multi-hop).

**Πηγές:** [UCAN spec, 2026](https://github.com/ucan-wg/spec) · [RFC 9449, 2023](https://www.rfc-editor.org/rfc/rfc9449.html) · [Biscuit SPECIFICATIONS.md, 2026](https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md) · [AIP: Agent Identity Protocol for Verifiable Delegation, 2026](https://arxiv.org/abs/2603.24775)

### GAP-KGOV-03 — Fail-open μέσω του skip-on-error του Cedar

*σήμερα*

Στο Cedar, μια πολιτική (permit ή forbid) που σφάλλει παραλείπεται, και τα IDs της μπαίνουν στα diagnostics. Μετά το validation παραμένουν δυνατά overflow και missing entity· τα σφάλματα extension constructors τα αποκλείει το strict mode (προεπιλογή).

**Γιατί μετρά:** Αν ένα Control Record γίνει forbid και σφάλλει, το control δεν επιβάλλεται — το ίδιο CG-FAILOPEN, σε νέα θέση.

**Τι δείχνει το ανώτερο:** Η τεκμηρίωση του Cedar αφήνει ρητά την εφαρμογή να αποφασίσει με βάση τα diagnostics: το PEP να θεωρεί deny κάθε απόφαση με μη κενά errors· strict validation (ήδη προεπιλογή)· πλήρη entities και schema χωρίς κίνδυνο overflow.

**Πηγές:** [Cedar authorization, 2026](https://docs.cedarpolicy.com/auth/authorization.html) · [Cedar validation, 2026](https://docs.cedarpolicy.com/policies/validation.html)

### GAP-KGOV-04 — Χρονικά και ακολουθιακά controls

*πείραμα*

Τα Control Records έχουν λήξη, όχι όμως χρονική λογική: έγκριση πριν από επίδραση, budgets σε παράθυρο, απαγόρευση μετά από ανάκληση.

**Γιατί μετρά:** Τέτοιες συνθήκες απαιτούν τα INV-L02, INV-I04 και το KRN-08.

**Τι δείχνει το ανώτερο:** Dogwood στο AgentCore (managed· ιστορικό ανά session, ≤24h, ≤25 policies ανά engine· ο ανοικτός reference interpreter όχι για παραγωγή)· επαληθευμένοι MFOTL monitors (Isabelle) πάνω στο ledger ως event stream· VIGIL (SMT πάνω σε traces, >95% recall, FPR <10%, χωρίς τυπική επαλήθευση).

**Πηγές:** [AgentCore temporal policies, 2026](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/policy-temporal.html) · [Dogwood, 2026](https://github.com/dogwood-policy/dogwood) · [MFOTL Monitor, 2019](https://www.isa-afp.org/entries/MFOTL_Monitor.html) · [VIGIL, 2026](https://arxiv.org/abs/2606.26524)

### GAP-KGOV-05 — Control evaluations απέναντι σε όργανα που συνεργάζονται

*πείραμα*

Δεν υπάρχει adversarial αξιολόγηση των gate/gateway/registry με την υπόθεση ότι generators και verifiers συνεργάζονται.

**Γιατί μετρά:** Το PVC υποθέτει μη έμπιστα όργανα, αλλά η αντοχή του στην υπονόμευση δεν μετράται.

**Τι δείχνει το ανώτερο:** Trusted editing, untrusted monitoring με anti-collusion, defer-to-trusted, resampling (Ctrl-Z) και control evaluations σε ControlArena.

**Πηγές:** [AI Control, 2024](https://arxiv.org/abs/2312.06942) · [Ctrl-Z, 2025](https://arxiv.org/abs/2504.10374) · [ControlArena, 2026](https://github.com/UKGovernmentBEIS/control-arena)

### GAP-KGOV-06 — Αξιοπιστία της μαρτυρίας ικανοτήτων

*πείραμα*

Το KRN-04 δεν προστατεύεται από sandbagging και δεν ορίζει στατιστικό κριτήριο για το τι μετρά ως υποβάθμιση.

**Γιατί μετρά:** Το ND ratchet και το KT-24 κινδυνεύουν από ψευδή θετικά και ψευδή αρνητικά.

**Τι δείχνει το ανώτερο:** Error bars, paired comparisons και power analysis· ανίχνευση sandbagging με noise injection στα βάρη (ερευνητικό, NeurIPS 2025).

**Πηγές:** [AI Sandbagging, 2024](https://arxiv.org/abs/2406.07358) · [Noise Injection Reveals Hidden Capabilities of Sandbagging Language Models, 2024](https://arxiv.org/abs/2412.01784) · [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640)

### GAP-KGOV-07 — Αδιάκριτη χρήση του γυμνού όρου capability

*σήμερα*

Το glossary (§3, γρ.265–266) χωρίζει ρητά Capability (επαληθευμένη ικανότητα, «όχι permission») από Capability token (εξουσιοδότηση ocap). Ο γυμνός όρος όμως χρησιμοποιείται χωρίς προσδιορισμό: «capabilities» ως ουσία του πυρήνα (§0, §28.1), ICD-10 Invoke(capability, args), «Capability Gateway» που ελέγχει tokens, όχι ικανότητες.

**Γιατί μετρά:** Κίνδυνος σύγχυσης ανάμεσα στα INV-C01 (ικανότητα) και INV-C02/INV-S02 (εξουσία), και σύγκρουση με την καθιερωμένη ορολογία ασφάλειας.

**Τι δείχνει το ανώτερο:** Στην ocap παράδοση, capability είναι unforgeable token που συνιστά δικαίωμα πρόσβασης (seL4).

**Πηγές:** [seL4 capabilities tutorial, 2026](https://docs.sel4.systems/Tutorials/capabilities.html)

### GAP-KGOV-08 — TTL έναντι μονοτονίας των Caps

*σήμερα*

Το πρόχειρο δεν ορίζει τι σημαίνει η λήξη TTL μιας ικανότητας. Αν μειώνει το Caps χωρίς ND evidence ή Control, συγκρούεται με το INV-C01, που επιτρέπει μείωση μόνο με αυτές τις δύο μορφές.

**Γιατί μετρά:** Κίνδυνος σιωπηρής υποβάθμισης ακριβώς εκεί που το πρόχειρο την απαγορεύει.

**Τι δείχνει το ανώτερο:** Η λήξη να καταγράφεται ως ρητή κατάσταση (stale-evidence) ή ως ρητό Control Record. Αναλογία: το TUF έχει ρητό expiration στα metadata, με ντετερμινιστική αντίδραση του client.

**Πηγές:** [TUF spec, 2026](https://theupdateframework.github.io/specification/latest/)

### GAP-KGOV-09 — «Επιβολή μόνο στο KRN-11» έναντι πολλαπλών σημείων επιβολής

*σήμερα*

Το INV-C02 και το glossary λένε ότι τα controls επιβάλλονται μόνο στο KRN-11. Όμως το ICD-05 έχει καταναλωτές τα KRN-06/08 και COG-01, το TB-4 επιβάλλει residency στο Inference Gateway, το INV-L03 επιβάλλεται και στα KRN-08/COG-01, και το ICD-29 έχει EraseByControl.

**Γιατί μετρά:** Είτε το invariant είναι ψευδές, είτε όλα αυτά πρέπει να περνούν από το gateway.

**Τι δείχνει το ανώτερο:** Ένας PDP με πολλά, ρητά καταγεγραμμένα PEPs που μιλούν τυποποιημένο πρωτόκολλο PEP↔PDP (AuthZEN 1.0).

**Πηγές:** [OpenID AuthZEN WG, 2026](https://openid.net/wg/authzen/)

### GAP-KGOV-10 — Ορατότητα των controls έναντι εμπιστευτικότητας

*σήμερα*

Το INV-C02 επιβάλλει να εμφανίζεται το control_id σε κάθε άρνηση προς κάθε επηρεαζόμενο.

**Γιατί μετρά:** Αυτό μπορεί να παραβιάσει το INV-L03 (π.χ. control σύγκρουσης συμφερόντων που αφορά άλλον πελάτη).

**Τι δείχνει το ανώτερο:** Η AWS αποκαλύπτει τον τύπο της πολιτικής και μόνο σε ορισμένες περιπτώσεις το ARN της.

**Πηγές:** [IAM access denied messages, 2026](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_access-denied.html)

### GAP-KGOV-11 — Το σχήμα του Gate Verdict και του proof_ref

*πείραμα*

Το πρόχειρο δεν ορίζει τι είναι το proof_ref ούτε διακρίνει formal proof, εμπειρική μαρτυρία (π.χ. ND από benchmarks) και απλή υπογραφή.

**Γιατί μετρά:** Το COMMITTED θα φαίνεται να σημαίνει «αποδεδειγμένο» ακόμη κι όταν στηρίζεται μόνο σε μέτρηση.

**Τι δείχνει το ανώτερο:** VSA/in-toto: verifier, policy URI+digest, resource, result, υπογεγραμμένο envelope. Αντικείμενα απόδειξης ανά απόφαση δεν βρέθηκαν σε κανένα PDP παραγωγής.

**Πηγές:** [SLSA VSA, 2026](https://slsa.dev/spec/v1.2/verification_summary)

### GAP-KGOV-12 — Ελαττώματα της διαδικασίας αναθεώρησης

*σήμερα*

Η επανεκτέλεση όλων των KT σε DST είναι ανέφικτη για τα KT-14 και KT-15, που απαιτούν προκαταχωρισμένες συγκρίσεις με εξωτερικούς συγκριτές και ανθρώπινη ομάδα. Δεν υπάρχει επισπευσμένη διαδρομή ούτε ακύρωση, και δεν ορίζεται τι γίνεται με τα Control Records που αποτυγχάνουν στην επαναξιολόγηση.

**Γιατί μετρά:** Χωρίς αυτά, το Tier 0 είτε δεν ενεργοποιείται ποτέ είτε μένει ανυπεράσπιστο σε κρίση ασφάλειας.

**Τι δείχνει το ανώτερο:** OpenGov: Fellowship whitelist για επισπευσμένη διαδρομή και Referendum Canceller/Killer· Tezos: cooldown με δοκιμές σε test networks.

**Πηγές:** [Polkadot OpenGov, 2026](https://wiki.polkadot.com/learn/learn-polkadot-opengov/) · [Tezos governance, 2026](https://docs.tezos.com/architecture/governance)

### GAP-KGOV-13 — Safe-halt (stop)

*σήμερα*

Δεν ορίζεται control που σταματά το σύστημα σε ασφαλή κατάσταση, ούτε η σημασιολογία αυτής της κατάστασης.

**Γιατί μετρά:** Για high-risk χρήσεις, το AI Act Art.14(4)(e) απαιτεί «stop» button ή ανάλογη διαδικασία που σταματά το σύστημα σε ασφαλή κατάσταση· ο δημιουργός χρειάζεται ανώτατο φρένο.

**Τι δείχνει το ανώτερο:** Art.14(4)(d)–(e): μη χρήση, override/reverse της εξόδου, διακοπή σε ασφαλή κατάσταση.

**Πηγές:** [AI Act Article 14, 2026](https://artificialintelligenceact.eu/article/14/)

### GAP-KGOV-14 — Ασυνέπειες σήμανσης και ανεπαλήθευτα artifacts

*σήμερα*

Το KRN-06/ICD-06 ορίζει Lisp reference, ενώ το ADR-0028 υιοθετεί Lean 4 reference semantics για την πλατφόρμα σχεδίασης· δεν δηλώνεται ποιο είναι το αυθεντικό spec. Η γλώσσα πολιτικής είναι [T] στο KRN-05 και [X] στο ADR-0010. Το §19 δεν έχει ενσωματωθεί. Οι §20–§21, §23 και §25 δεν γράφτηκαν. Το vocab δηλώνει 76 CMP αλλά απαριθμεί 75. Τα VT-203, VT-302 και VT-904 δεν επαληθεύτηκαν από εδώ. Οι έδρες CG-FAILOPEN, approval-policy και Δ3 δεν επαληθεύονται από εδώ.

**Γιατί μετρά:** Παραβιάζονται οι νόμοι «0 λάθος» και «μία έδρα ανά έννοια».

**Τι δείχνει το ανώτερο:** Δεν αφορά εξωτερική SOTA· είναι διόρθωση του προχείρου.

### GAP-KGOV-15 — Sybil μέσω fork στους μηχανισμούς διακυβέρνησης

*επέκταση*

Το ICD-15 έχει Fork(policy) και Birth(charter), που δημιουργούν νέες οντότητες. Κάθε μηχανισμός με ψήφο ανά οντότητα αποκτά έτσι φθηνές νέες ψήφους.

**Γιατί μετρά:** Μηχανισμός του EP-12 με ψήφο ανά οντότητα μπορεί να καταληφθεί.

**Τι δείχνει το ανώτερο:** Βάρος ψήφου δεμένο σε πόρο που δεν πολλαπλασιάζεται: conviction voting με κλείδωμα tokens στο OpenGov, voting power από staking balance στο Tezos.

**Πηγές:** [Polkadot OpenGov, 2026](https://wiki.polkadot.com/learn/learn-polkadot-opengov/) · [Tezos governance, 2026](https://docs.tezos.com/architecture/governance)

### GAP-KGOV-16 — Συνέπεια μεταξύ Decide και ανάκλησης

*σήμερα*

Το Decide δεν δένεται σε cut του ledger.

**Γιατί μετρά:** Μπορεί να εκτελεστεί επίδραση μετά την ανάκληση του σχετικού control (new-enemy problem).

**Τι δείχνει το ανώτερο:** Zanzibar: zookies (opaque timestamp) και external consistency, ώστε οι αιτιακά διατεταγμένες αλλαγές ACL να γίνονται σεβαστές.

**Πηγές:** [Zanzibar, 2019](https://research.google/pubs/zanzibar-googles-consistent-global-authorization-system/) · [Zanzibar paper, annotated copy (AuthZed), 2019](https://zanzibar.tech/)

## Δεν ξέρω

- ISO/IEC 42001:2023: η τρέχουσα κατάσταση και το περιεχόμενο δεν επαληθεύτηκαν (ο ερευνητής αναφέρει 403 από το iso.org).
- Αν το Policy in AgentCore και τα temporal policies είναι GA ή preview: δεν επιβεβαιώθηκε (η policy page, το doc-history και η σελίδα προϊόντος δεν το δηλώνουν).
- Αν κάποιο PDP σε παραγωγή εκδίδει μηχανικά ελέγξιμη απόδειξη ανά απόφαση: δεν βρέθηκε.
- Το περιεχόμενο του NIST SP 800-162 για PEP/PDP/PAP δεν επαληθεύτηκε: η landing page δεν το αναφέρει και το PDF δεν αναγνώστηκε εδώ.
- Αν η διατριβή Robust Composition χρησιμοποιεί ρητά τους όρους object-capability, POLA και ambient authority: δεν επαληθεύτηκε (η abstract page δεν τους περιέχει· το erights.org δεν ήταν προσβάσιμο).
- Η ακριβής ημερομηνία του WASI 0.3.0: η σελίδα releases την έδωσε ως 2025-06-11, αλλά η ακολουθία των releases είναι ασαφής· επιβεβαιώνεται μόνο ότι έχει κυκλοφορήσει.
- Αν το Digital Omnibus μετέθεσε ρητά τις ημερομηνίες Annex III/Annex I: το timeline δίνει 2027-12-02 και 2028-08-02 χωρίς να τις αποδίδει στο Omnibus.
- Το Habermas Machine (Science 2024) και το Knight–Leveson (1986) δεν ήταν προσβάσιμα· δεν χρησιμοποιήθηκαν.
- Τα components του IG 2.0 πέρα από regulative/constitutive statements δεν επαληθεύτηκαν.
- Η τρέχουσα κατάσταση του Symboleo δεν επαληθεύτηκε.
- Η κατάσταση των εδρών constitutional-gate (CG-FAILOPEN), approval-policy.lisp, capability-registry, KEY-LIFECYCLE και KL-7 στο άλλο repo: ανεπαλήθευτη.
- Αν οι χρήσεις του LAWMAX είναι high-risk κατά τον AI Act: εκτός εμβέλειας (EXP-19).
- Η χρησιμότητα του FIDES σε σύγκριση με planner χωρίς άμυνα: το paper αναφέρει καλύτερο task completion από basic planner όταν και οι δύο εφαρμόζουν policy checks· η πλήρης σύγκριση δεν αναπαράχθηκε εδώ.
- Αν ο Dogwood έχει τυπική απόδειξη: δεν βρέθηκε καμία ένδειξη.
- Ο έλεγχος «holds» για αυστηρά ανώτερες εναλλακτικές έγινε με 4 στοχευμένες αναζητήσεις arXiv, επειδή εξαντλήθηκε το budget του WebSearch· δεν καλύπτει βιομηχανικά συστήματα εκτός arXiv.

## Τι διόρθωσε ο ανεξάρτητος ελεγκτής

Πηγές που άνοιξε: 97 · δεν στέκονταν: 18 · διορθώσεις: 25

- **draft_points[CMP-KRN-06, ICD-06].reasoning:** «21 στην υλοποίηση, 4 στο μοντέλο» → «οι αποδείξεις βρήκαν 4 bugs στον validator και το DRT/PBT 21 σε άλλα μέρη». — Abstract του arXiv 2407.01688.
- **draft_points[CMP-KRN-06, ICD-06] και GAP-KGOV-14:** Η «αντίφαση με το ADR-0028» έγινε «ασάφεια»: το ADR-0028 ορίζει Lean 4 reference semantics για την πλατφόρμα σχεδίασης, ενώ τα KRN-06/ICD-06 ορίζουν Lisp reference χωρίς δηλωμένη ιεραρχία. — 22.md: το ADR-0028 αφορά την Genesis Design Platform· Lean spec και Lisp interpreter μπορούν να συνυπάρχουν.
- **draft_points[CMP-KRN-06, ICD-06].superior:** Προστέθηκε ρητό trade-off: κόστος αποδείξεων και αβεβαιότητα αν τα συνταγματικά κατηγορήματα χωρούν σε αποφασίσιμο fragment. — Κανόνας 3: το «αυστηρά ανώτερο» απαιτεί δηλωμένο trade-off.
- **draft_points[CMP-KRN-11, ICD-08]:** Σημειώθηκε ότι το πρόχειρο ήδη έχει provenance-tagged κανάλια (§0.1, INV-S01) και ορίζει στο glossary το token ως unforgeable/scoped/χρονικά φραγμένο· στο trade-off προστέθηκε η διεύρυνση του TCB (planner/interpreter). — Ανάγνωση master §0.1, §3 γρ.266 και 19.md INV-S01· δίκαιη απόδοση του προχείρου.
- **GAP-KGOV-07, DEC-KGOV-08, draft_points[CMP-KRN-04, ICD-04, REQ-GOV-002]:** Το «ο όρος σημαίνει δύο έννοιες» έγινε «το glossary χωρίζει Capability από Capability token, αλλά ο γυμνός όρος χρησιμοποιείται αδιάκριτα»· νέα εναλλακτική στο DEC-KGOV-08. — master γρ.265–266: δύο ξεχωριστές εγγραφές glossary.
- **GAP-KGOV-08, draft_points[CMP-KRN-04, ICD-04, REQ-GOV-002]:** Το «παραβιάζει το INV-C01» έγινε «δεν ορίζεται· αν μειώνει το Caps, συγκρούεται». — Το INV-C01 ποσοτικοποιεί πάνω σε δομικές μεταβάσεις T· η σημασία της λήξης TTL δεν ορίζεται στο πρόχειρο.
- **SOTA-KGOV-05, draft_points[ICD-05], GAP-KGOV-09:** Αφαιρέθηκε η απόδοση PAP/PDP/PEP στο SP 800-162· χρησιμοποιείται το AuthZEN. — Δεν επαληθεύτηκε από προσβάσιμη πηγή.
- **SOTA-KGOV-06:** Οι ισχυρισμοί για τον Miller περιορίστηκαν· προστέθηκαν seL4 API doc και About (Mint/Revoke, formal verification)· το WASI 0.3 χωρίς ημερομηνία. — Επαλήθευση πηγών.
- **SOTA-KGOV-07:** MCP στην έκδοση 2026-07-28· UCAN revocation RECOMMENDED· Biscuit v3.3 με Datalog και third-party blocks από το SPECIFICATIONS.md. — Τρέχουσα κατάσταση και ακρίβεια.
- **SOTA-KGOV-03, GAP-KGOV-04, DEC-KGOV-02:** Το «όχι production» αφορά μόνο τον ανοικτό interpreter του Dogwood· προστέθηκε ότι το session ID το δίνει ο καλών και ότι την ακύρωση sessions την προκαλεί αλλαγή temporal policy. — Τεκμηρίωση AgentCore και README του Dogwood.
- **GAP-KGOV-03:** Ο κίνδυνος περιορίστηκε σε overflow και missing entity· το strict mode είναι προεπιλογή. — Cedar validation docs.
- **SOTA-KGOV-09:** Οι τυπικές εγγυήσεις αναδιατυπώθηκαν ως non-interference (integrity) και explicit secrecy (confidentiality)· επιβεβαιώθηκε η υπαγωγή στη Microsoft. — arXiv HTML 2505.23643.
- **SOTA-KGOV-10:** Αναδιατυπώθηκε η περιγραφή του Invariant· προστέθηκε το VIGIL (2026). — README του Invariant· αναζήτηση holds για χρονικά controls.
- **SOTA-KGOV-11:** ControlArena: 18 settings· προστέθηκε το BashBench στο Ctrl-Z. — Repo και abstract.
- **SOTA-KGOV-16, SOTA-KGOV-17:** Απόχρωση για τη ρυθμιζόμενη συμπεριφορά του policy-controller· in-toto υπό ανάπτυξη· TUF v1.0.36 με ρητό διπλό threshold σε root rotation· FROST Informational. — Επαλήθευση πηγών.
- **SOTA-KGOV-20, GAP-KGOV-06, draft_points[CMP-KRN-04, ICD-04, REQ-GOV-002]:** Προστέθηκε το Noise Injection (arXiv 2412.01784) ως πηγή για το «elicitation που αντέχει σε sandbagging», που πριν έμενε χωρίς πηγή. — Κανόνας 1: πηγή για κάθε ισχυρισμό.
- **SOTA-KGOV-21 (νέο), GAP-KGOV-02:** Προστέθηκαν AIP/IBCT και Authorization Propagation ως ερευνητικά προφίλ delegation για αλυσίδες agents. — Αναζήτηση holds για το token· συμπληρωματικά, όχι αυστηρά ανώτερα (χτίζουν πάνω στο Biscuit, χωρίς ανεξάρτητη αξιολόγηση).
- **DEC-KGOV-04.rationale:** Το freeze το ορίζει το πρόχειρο (15.md §15.1), όχι ο δημιουργός. — Ανάγνωση 15.md γρ.20.
- **DEC-KGOV-07:** Το Art.14 στηρίζει μόνο το safe-halt· για το επισπευσμένο track, προηγούμενο είναι το OpenGov. — Το κείμενο του Art.14(4)(d)–(e) δεν αφορά διαδικασίες αναθεώρησης.
- **DEC-KGOV-06:** Προστέθηκε ότι το EP-04 ήδη επιτρέπει threshold σχήματα μόνο μεταξύ συσκευών του κυρίαρχου (KL-7)· ο διάδοχος σημειώνεται ως «πιθανώς» αναθεώρηση Tier 0. — 28.md EP-04· αποφυγή εικασίας.
- **DEC-KGOV-02 (εναλλακτική OPA):** Ο αρνητικός ισχυρισμός έγινε «δεν βρέθηκε… (όχι εξαντλητική αναζήτηση)». — Τίμια άγνοια.
- **draft_points[REQ-GOV-001, ADR-0009], GAP-KGOV-12:** Επαληθεύτηκε η φύση των KT-14 (null baseline) και KT-15 (τυφλή σύγκριση με εξωτερικούς συγκριτές)· η αιτιολόγηση έγινε ρητή. — 24.md γρ.29–30, spine-vocab γρ.102–103.
- **draft_points[INV-C02], GAP-KGOV-09:** Προστέθηκαν το glossary («το μόνο σημείο επιβολής controls») και το INV-L03 (επιβολή σε KRN-11, KRN-08, COG-01) ως τεκμήρια της αντίφασης. — master γρ.268· 19.md INV-L03.
- **draft_points[EP-12], GAP-KGOV-15:** Επαληθεύτηκαν τα Fork(policy), Birth(charter) και Govern(procedure) στο ICD-15· η Sybil διατυπώθηκε υπό όρο (ψήφος ανά οντότητα)· προστέθηκε το Tezos staking. — 15.md γρ.45.
- **unknowns:** Αφαιρέθηκε το άσχετο «ημερομηνία του Cedar v4.12.0»· προστέθηκαν NIST SP 800-162, Miller, WASI 0.3, Omnibus και τα όρια της αναζήτησης holds· αναθεωρήθηκε το στοιχείο για το FIDES. — Τίμια άγνοια για ό,τι δεν επαληθεύτηκε.
