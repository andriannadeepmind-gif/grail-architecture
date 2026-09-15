# World OS / πυρήνας — εκτελέσιμο σύνταγμα, capabilities, controls — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### Cedar + verification-guided development

*system, production* · SOTA-KGOV-01

Γλώσσα εξουσιοδότησης σε Rust. Αποδεδειγμένα σε Lean: ικανοποιημένο forbid ⇒ deny· allow μόνο με explicit permit· αλλιώς default deny· ανεξαρτησία από σειρά και διπλότυπα· sound type checking (validation)· sound slicing· sound και complete symbolic compilation. VGD: εκτελέσιμο μοντέλο σε Lean και DRT/PBT έναντι της Rust υλοποίησης. Οι αποδείξεις βρήκαν 4 bugs στον validator και το DRT/PBT άλλα 21 σε διάφορα μέρη του Cedar. Σε παραγωγή στο Amazon Verified Permissions (Cedar 4.7). CNCF Sandbox από 2025-10-08.

**Για το GRAIL:** Είναι το ίδιο το «Cedar-class» του ADR-0010 και πρότυπο μεθοδολογίας για το reference του KRN-06: αποδεδειγμένο spec με DRT έναντι της υλοποίησης.

**Πηγές:** [How We Built Cedar: A Verification-Guided Approach, 2024](https://arxiv.org/abs/2407.01688) · [Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization, 2024](https://arxiv.org/abs/2403.04651) · [cedar-spec / cedar-lean (proven properties), 2026](https://github.com/cedar-policy/cedar-spec/tree/main/cedar-lean) · [What is Amazon Verified Permissions, 2026](https://docs.aws.amazon.com/verifiedpermissions/latest/userguide/what-is-avp.html) · [CNCF project: Cedar, 2025](https://www.cncf.io/projects/cedar/)

### Cedar Analysis (SymCC) και Zelkova

*tool, production* · SOTA-KGOV-02

Cedar Analysis (2025-06-16): Cedar Symbolic Compiler γραμμένος σε Lean, με soundness και completeness, πάνω σε SMT solvers (π.χ. CVC5). Το CLI ελέγχει ισοδυναμία, σχέση permissiveness, shadowed permits, αδύνατες συνθήκες, forbid overrides και complete denials. Προηγούμενο σε παραγωγή: Zelkova (FMCAD 2018), SMT κωδικοποίηση των πολιτικών AWS· κατά το paper καλείται εκατομμύρια φορές ημερησίως.

**Για το GRAIL:** Κάνει μηχανικά ελέγξιμο ότι μια αναθεώρηση ή ένα νέο control μόνο στενεύει τα δικαιώματα. Βάση για τα VT-203 και VT-302 πέρα από το Alloy.

**Πηγές:** [Introducing Cedar Analysis, 2025](https://aws.amazon.com/blogs/opensource/introducing-cedar-analysis-open-source-tools-for-verifying-authorization-policies/) · [Semantic-based automated reasoning for AWS access policies using SMT, 2018](https://www.amazon.science/publications/semantic-based-automated-reasoning-for-aws-access-policies-using-smt)

### Policy in Amazon Bedrock AgentCore + Dogwood

*system, pilot* · SOTA-KGOV-03

Αναχαιτίζει όλη την κίνηση των agents μέσω των AgentCore Gateways και αξιολογεί κάθε αίτημα με ντετερμινιστικές πολιτικές Cedar πριν την πρόσβαση στο tool, έξω από τον κώδικα του agent. NL authoring→Cedar, με automated reasoning που εντοπίζει υπερβολικά επιτρεπτικές, υπερβολικά περιοριστικές ή ανέφικτες πολιτικές. Modes LOG_ONLY/ENFORCE· decision logs σε CloudWatch. Τα temporal policies γράφονται σε Dogwood (Cedar-compatible: formerly within, since within, count, sum). Το ιστορικό τους περιορίζεται σε session, με session ID που δίνει ο καλών· παράθυρο ≤24h, ≤25 temporal policies ανά engine. Προσθήκη ή αλλαγή temporal policy ακυρώνει τα ενεργά sessions. Ο ανοικτός reference interpreter του Dogwood δηλώνει ρητά ότι δεν προορίζεται για παραγωγή. Η managed υλοποίηση του AgentCore είναι άλλο πράγμα, με ανεπιβεβαίωτο καθεστώς GA.

**Για το GRAIL:** Η πλησιέστερη υπαρκτή υλοποίηση του KRN-11 + KRN-05 για agents. Δείχνει και τα όρια: η τεκμηρίωση λέει ρητά ότι ένα count-based rate limit ισχύει ανά session και μηδενίζεται με νέο session.

**Πηγές:** [Policy in Amazon Bedrock AgentCore, 2026](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/policy.html) · [Temporal policies (AgentCore), 2026](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/policy-temporal.html) · [dogwood-policy/dogwood, 2026](https://github.com/dogwood-policy/dogwood)

### AWS Service Control Policies ως guardrails

*system, production* · SOTA-KGOV-04

Τα SCPs δεν χορηγούν ποτέ δικαιώματα· ορίζουν το μέγιστο διαθέσιμο σύνολο. Τα effective permissions είναι η τομή τους (και των RCPs) με τις identity- και resource-based policies, και ένα explicit deny σε οποιοδήποτε επίπεδο αποκλείει την ενέργεια. Τα μηνύματα AccessDenied δηλώνουν τον τύπο της πολιτικής που αρνήθηκε και μόνο σε ορισμένες περιπτώσεις το ARN της· όταν αρνούνται πολλοί τύποι, αναφέρεται μόνο ένας.

**Για το GRAIL:** Προηγούμενο σε κλίμακα για το INV-C02: το control είναι εξωτερικό όριο, όχι αλλαγή ικανότητας. Και προηγούμενο κλιμακωτής ορατότητας της άρνησης.

**Πηγές:** [Service control policies (SCPs), 2026](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) · [Troubleshoot access denied error messages, 2026](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_access-denied.html)

### OPA/Rego, ReBAC (Zanzibar/OpenFGA), AuthZEN, ABAC

*standard, production* · SOTA-KGOV-05

OPA: CNCF Graduated (2021-01-29), τελευταία έκδοση v1.20.2 (2026-09-03). Τα decision logs έχουν decision_id, bundle revision και masking· η τεκμηρίωση δεν αναφέρει υπογραφή ή integrity protection. Zanzibar (USENIX ATC 2019): relation tuples, zookies (opaque timestamp για freshness), external consistency απέναντι στο new-enemy problem. OpenFGA: CNCF Incubating (2025-10-28). OpenID AuthZEN Authorization API 1.0: Final (Ιαν. 2026), για διαλειτουργικότητα PEP↔PDP. NIST SP 800-162 (2014, αναθ. 2019): ABAC.

**Για το GRAIL:** Εναλλακτικές για το KRN-05. Το AuthZEN είναι ο φυσικός εξωτερικός binding του Decide (ICD-05). Τα zookies δείχνουν πώς δένεται το Decide σε cut.

**Πηγές:** [CNCF: Open Policy Agent, 2021](https://www.cncf.io/projects/open-policy-agent-opa/) · [OPA releases, 2026](https://github.com/open-policy-agent/opa/releases) · [OPA decision logs, 2026](https://www.openpolicyagent.org/docs/management-decision-logs) · [Zanzibar: Google's Consistent, Global Authorization System, 2019](https://research.google/pubs/zanzibar-googles-consistent-global-authorization-system/) · [Zanzibar paper, annotated copy (AuthZed), 2019](https://zanzibar.tech/) · [CNCF: OpenFGA, 2025](https://www.cncf.io/projects/openfga/) · [OpenID AuthZEN WG, 2026](https://openid.net/wg/authzen/) · [NIST SP 800-162, 2019](https://csrc.nist.gov/pubs/sp/800/162/upd2/final)

### Object-capability security (seL4, WASI, Miller)

*research, production* · SOTA-KGOV-06

seL4: capability = unforgeable token που συνιστά δικαίωμα πρόσβασης σε αντικείμενο. Το Mint αντιγράφει capability ορίζοντας access rights και badge· το Revoke διαγράφει όλες τις child capabilities· ο πυρήνας έχει εκτενή τυπική επαλήθευση. WASI: ένα Wasm module/component ξεκινά χωρίς ambient authority και κάνει μόνο ό,τι του χορηγεί ρητά ο host. WASI 0.2.0 κυκλοφόρησε 2024-01-25· το WASI 0.3 έχει κυκλοφορήσει, με native async στο Component Model. Robust Composition (Miller, PhD JHU 2006): σύνθεση ανεξάρτητα γραμμένων, δυνητικά εχθρικών components (E, CapDesk).

**Για το GRAIL:** Θεμέλιο του ισχυρισμού του KRN-11 ότι η παράκαμψη δεν αναπαρίσταται. Υλοποιήσιμο σήμερα με Wasmtime/WASI.

**Πηγές:** [seL4 capabilities tutorial, 2026](https://docs.sel4.systems/Tutorials/capabilities.html) · [seL4 API reference (CNode Mint/Revoke), 2026](https://docs.sel4.systems/projects/sel4/api-doc.html) · [About seL4, 2026](https://sel4.systems/About/) · [WASI, 2026](https://wasi.dev/) · [Component Model, 2024](https://component-model.bytecodealliance.org/) · [Robust Composition (abstract), 2006](https://papers.agoric.com/papers/robust-composition/abstract/)

### Attenuable και sender-constrained capability tokens

*standard, production* · SOTA-KGOV-07

Biscuit (Eclipse, spec έως v3.3): bearer token με offline attenuation, επαλήθευση μόνο με το root public key, γλώσσα εξουσιοδότησης Datalog, third-party blocks. Macaroons (NDSS 2014): nested, chained HMACs με caveats. UCAN 1.0.0: delegation και invocation REQUIRED, revocation RECOMMENDED· κάθε delegation MUST είτε επαναλαμβάνει είτε στενεύει (attenuate) τις capabilities. SPIFFE: workload identity, CNCF Graduated 2022-08-23. DPoP (RFC 9449, 2023, Standards Track): sender-constraining με PoP. OAuth Transaction Tokens (draft-11, 2026-07-30): διάδοση user/workload identity και authorization context σε call chain εντός trust domain. MCP authorization (τρέχουσα έκδοση 2026-07-28): OAuth 2.1· RFC 8707 resource indicators και audience validation· ο server δεν δέχεται ούτε διαμετακομίζει άλλα tokens.

**Για το GRAIL:** Ορίζουν τη σημασιολογία που λείπει από το capability token του ICD-08: attenuation, delegation chain, revocation, PoP και διάδοση ανάμεσα σε όργανα.

**Πηγές:** [Biscuit docs, 2026](https://doc.biscuitsec.org/) · [Biscuit SPECIFICATIONS.md, 2026](https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md) · [Macaroons, 2014](https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/) · [UCAN spec, 2026](https://github.com/ucan-wg/spec) · [CNCF: SPIFFE, 2022](https://www.cncf.io/projects/spiffe/) · [RFC 9449 DPoP, 2023](https://www.rfc-editor.org/rfc/rfc9449.html) · [OAuth Transaction Tokens draft, 2026](https://datatracker.ietf.org/doc/draft-ietf-oauth-transaction-tokens/) · [MCP Authorization 2026-07-28, 2026](https://modelcontextprotocol.io/specification/2026-07-28/basic/authorization)

### CaMeL

*research, research-prototype* · SOTA-KGOV-08

Εξάγει ρητά τη ροή ελέγχου και δεδομένων από το έμπιστο αίτημα και την εκτελεί σε custom interpreter περιορισμένης Python. Οι capabilities είναι tags πάνω σε κάθε τιμή (provenance, επιτρεπόμενοι αναγνώστες), και οι security policies ελέγχονται σε κάθε tool call· τα untrusted δεδομένα δεν αλλάζουν τη ροή του προγράμματος. AgentDojo: 77% των εργασιών με provable security, έναντι 84% χωρίς άμυνα.

**Για το GRAIL:** Δείχνει ότι δεν αρκεί να εξουσιοδοτείται η κλήση· πρέπει να ελέγχεται και η προέλευση των ορισμάτων της επίδρασης.

**Πηγές:** [Defeating Prompt Injections by Design, 2025](https://arxiv.org/abs/2503.18813) · [Defeating Prompt Injections by Design (HTML), 2025](https://arxiv.org/html/2503.18813)

### FIDES (information-flow control για agents)

*research, research-prototype* · SOTA-KGOV-09

Planner που παρακολουθεί confidentiality και integrity labels, επιβάλλει ντετερμινιστικά IFC policies και υποστηρίζει selective hiding. Τυπικό μοντέλο: με τις policies εφαρμοσμένες σε κάθε tool, εγγυάται non-interference για την integrity των tool calls και explicit secrecy για την confidentiality (δέχεται περιορισμένη implicit διαρροή). Αξιολόγηση σε AgentDojo· όλοι οι συγγραφείς από τη Microsoft (2025).

**Για το GRAIL:** Φυσικό ταίρι για το TB-3/INV-L03: τα confidentiality domains γίνονται labels που ρέουν μέχρι το gateway.

**Πηγές:** [Securing AI Agents with Information-Flow Control, 2025](https://arxiv.org/abs/2505.23643) · [Securing AI Agents with Information-Flow Control (HTML), 2025](https://arxiv.org/html/2505.23643)

### Privilege control και runtime enforcement για agents

*research, research-prototype* · SOTA-KGOV-10

Progent (2025): τα δικαιώματα είναι symbolic rules πάνω σε tool names/args, με ντετερμινιστικό έλεγχο. Ένας SMT solver εφαρμόζει αυτόματα τις στενώσεις, ενώ οι διευρύνσεις θέλουν έγκριση (monotonic confinement). AgentSpec (ICSE 2026): DSL με triggers/predicates/enforcement και overhead της τάξης ms. Design Patterns (2025): action-selector, plan-then-execute, LLM map-reduce, dual LLM, code-then-execute, context-minimization. VIGIL (2026): policy language για temporal dependencies, argument constraints και value-flow, σε SMT πάνω σε πεπερασμένα traces· >95% recall, FPR <10%· χωρίς τυπική επαλήθευση του enforcement. Invariant Guardrails: Python-inspired matching rules για τη συμπεριφορά agents, ως proxy μεταξύ εφαρμογής και MCP/LLM. LlamaFirewall (2025): PromptGuard 2, Agent Alignment Checks, CodeShield.

**Για το GRAIL:** Το monotonic confinement είναι η μορφή κυριαρχίας του εντολέα πάνω στα δικαιώματα. Τα patterns δίνουν προφίλ οργάνων για το gateway. Το VIGIL είναι υποψήφιο για ακολουθιακά controls, αλλά χωρίς εγγύηση fail-closed.

**Πηγές:** [Progent, 2025](https://arxiv.org/abs/2504.11703) · [AgentSpec, 2025](https://arxiv.org/abs/2503.18666) · [Design Patterns for Securing LLM Agents against Prompt Injections (HTML), 2025](https://arxiv.org/html/2506.08837) · [VIGIL: Runtime Enforcement of Behavioral Specifications in AI Agent Skills, 2026](https://arxiv.org/abs/2606.26524) · [Invariant Guardrails, 2026](https://github.com/invariantlabs-ai/invariant) · [LlamaFirewall, 2025](https://arxiv.org/abs/2505.03574)

### AI Control: protocols και control evaluations

*research, pilot* · SOTA-KGOV-11

Greenblatt κ.ά. (ICML 2024): trusted editing, untrusted monitoring με anti-collusion, defer-to-trusted, αξιολογημένα απέναντι σε σκόπιμη υπονόμευση. Ctrl-Z (2025): resample protocols στο BashBench· το attack success πέφτει από 58% σε 7%, με 5% κόστος στην απόδοση μη κακόβουλου agent. ControlArena (UK AI Security Institute + Redwood Research): βιβλιοθήκη με 18 settings.

**Για το GRAIL:** Λείπει μεθοδολογία που να ελέγχει adversarially τα gate/gateway/registry απέναντι σε όργανα που συνεργάζονται.

**Πηγές:** [AI Control: Improving Safety Despite Intentional Subversion, 2024](https://arxiv.org/abs/2312.06942) · [Ctrl-Z: Controlling AI Agents via Resampling, 2025](https://arxiv.org/abs/2504.10374) · [ControlArena, 2026](https://github.com/UKGovernmentBEIS/control-arena)

### Συντάγματα μοντέλων (CAI, CCAI, Constitutional Classifiers, Model Spec)

*research, production* · SOTA-KGOV-12

Constitutional AI (2022): οι αρχές χρησιμοποιούνται ως training signal (SL + RLAIF). Collective CAI (FAccT 2024): αρχές από δημόσια συμμετοχή. Constitutional Classifiers (2025): runtime classifiers παραγόμενοι από constitution· >3.000 ώρες red teaming, +0,38% απόλυτη αύξηση refusals σε production traffic, 23,7% inference overhead. OpenAI Model Spec (2026-08-18): chain of command root > system > developer > user > guideline.

**Για το GRAIL:** Είναι πιθανοτικά «συντάγματα» συμπεριφοράς των γεννητριών, όχι εκτελέσιμα κατηγορήματα μεταβάσεων. Στο trusted path το GOV-01 είναι αυστηρότερο· οι classifiers συμπληρώνουν το TB-4.

**Πηγές:** [Constitutional AI, 2022](https://arxiv.org/abs/2212.08073) · [Collective Constitutional AI, 2024](https://arxiv.org/abs/2406.07814) · [Constitutional Classifiers, 2025](https://arxiv.org/abs/2501.18837) · [OpenAI Model Spec, 2026](https://model-spec.openai.com/2026-08-18.html)

### Γλώσσες κανόνων (Catala, LegalRuleML, ODRL, IG 2.0)

*standard, production* · SOTA-KGOV-13

Catala (ICFP 2021): γλώσσα για τη μετάφραση νόμων σε κώδικα (default logic), με τα βασικά βήματα του compiler αποδεδειγμένα σε F*· το repo του Inria το χαρακτηρίζει ερευνητικό έργο με ακόμη ασταθή compiler. LegalRuleML Core 1.0 (OASIS Standard, 2021-08-30): obligation/permission/prohibition, strict/defeasible/defeater, χρονικές διαστάσεις (entry, efficacy, applicability). ODRL 2.2 (W3C Rec, 2018-02-15): permission/prohibition/duty, conflict perm/prohibit/invalid (προεπιλογή invalid). IG 2.0 codebook (v5, 2024): regulative και constitutive statements.

**Για το GRAIL:** Ώριμες επιλογές για τη deontic και defeasible σημασιολογία των άρθρων, που λείπει από το GOV-01.

**Πηγές:** [Catala: A Programming Language for the Law, 2021](https://arxiv.org/abs/2103.03198) · [CatalaLang/catala, 2026](https://github.com/CatalaLang/catala) · [LegalRuleML Core 1.0, 2021](https://docs.oasis-open.org/legalruleml/legalruleml-core-spec/v1.0/legalruleml-core-spec-v1.0.html) · [ODRL Information Model 2.2, 2018](https://www.w3.org/TR/odrl-model/) · [Institutional Grammar 2.0 Codebook, 2024](https://arxiv.org/abs/2008.08937)

### Automated Reasoning checks (Bedrock Guardrails)

*system, production* · SOTA-KGOV-14

Εξάγει formal rules και σχήμα μεταβλητών από έγγραφο πολιτικής και παράγει fidelity report (coverage, accuracy, grounding). Επικυρώνει την έξοδο LLM (VALID/INVALID/TRANSLATION_AMBIGUOUS/TOO_COMPLEX κ.ά.) μόνο σε detect mode. Το VALID εγγυάται μόνο για ό,τι αποτυπώνεται σε μεταβλητές της πολιτικής· δεν προστατεύει από prompt injection· η μετάφραση NL→logic γίνεται με foundation models. Γενικά διαθέσιμο σε 6 regions (US/EU).

**Για το GRAIL:** Δείχνει το ρεαλιστικό όριο του «εκτελέσιμου συντάγματος» από φυσική γλώσσα και του REQ-GOV-005.

**Πηγές:** [Automated Reasoning checks in Amazon Bedrock Guardrails, 2026](https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-automated-reasoning-checks.html)

### Επαληθευμένοι MFOTL runtime monitors

*research, research-prototype* · SOTA-KGOV-15

Schneider και Traytel (AFP, 2019-07-04): monitor για metric first-order temporal logic, επαληθευμένος σε Isabelle, ως απλοποιημένη παραλλαγή του MonPoly. Η σύγκριση με τυχαίες εισόδους αποκάλυψε σφάλματα στα βελτιστοποιημένα αλλά ανεπαλήθευτα εργαλεία.

**Για το GRAIL:** Κατάλληλο για controls με χρονικές ή ακολουθιακές συνθήκες πάνω στο ledger ως event stream, εκεί όπου το Cedar είναι stateless.

**Πηγές:** [Formalization of a Monitoring Algorithm for MFOTL, 2019](https://www.isa-afp.org/entries/MFOTL_Monitor.html)

### Υπογεγραμμένα verdicts και fail-closed admission

*standard, production* · SOTA-KGOV-16

SLSA v1.2 (Approved· Build και Source tracks). VSA: in-toto predicate με verifier, policy (URI+digest), resourceUri, verificationResult PASSED/FAILED και verifiedLevels· ο καταναλωτής επαληθεύει πρώτα την υπογραφή του envelope. in-toto Attestation Framework: spec v1, κατά το repo ακόμη υπό ανάπτυξη. Sigstore policy-controller: Kubernetes admission controller με opt-in ανά namespace· ως προεπιλογή απορρίπτει images που δεν ταιριάζουν σε policy, ρυθμίσιμο σε warn/allow. Rekor (v2): transparency log. K8s ValidatingAdmissionPolicy (GA από v1.30): CEL, failurePolicy Fail (προεπιλογή)/Ignore, actions Deny/Warn/Audit.

**Για το GRAIL:** Υπαρκτό πρότυπο για το σχήμα του Gate Verdict (ICD-06) και για το AdmitArtifact (ICD-04).

**Πηγές:** [SLSA v1.2, 2026](https://slsa.dev/spec/v1.2/) · [SLSA Verification Summary Attestation, 2026](https://slsa.dev/spec/v1.2/verification_summary) · [in-toto Attestation Framework, 2026](https://github.com/in-toto/attestation) · [Sigstore policy-controller, 2026](https://docs.sigstore.dev/policy-controller/overview/) · [Rekor, 2026](https://docs.sigstore.dev/logging/overview/) · [Kubernetes ValidatingAdmissionPolicy, 2024](https://kubernetes.io/docs/reference/access-authn-authz/validating-admission-policy/)

### Root of trust: TUF και FROST

*standard, production* · SOTA-KGOV-17

TUF spec v1.0.36 (τελ. ενημέρωση 2026-08-05): root role με threshold υπογραφών και offline κλειδιά. Κάθε νέο root (N+1) πρέπει να υπογράφεται από threshold κλειδιών του N και από threshold του N+1· expiration απέναντι σε indefinite freeze attacks· delegations. FROST (RFC 9591, Ιούν. 2024): threshold Schnorr signatures δύο γύρων· Informational (CFRG), όχι Standards Track.

**Για το GRAIL:** k-of-n κλειδιά του ίδιου δημιουργού μειώνουν το single-key risk χωρίς να παραβιάζουν το KL-7, όπως ήδη προβλέπει το EP-04 του προχείρου.

**Πηγές:** [The Update Framework Specification, 2026](https://theupdateframework.github.io/specification/latest/) · [RFC 9591 FROST, 2024](https://www.rfc-editor.org/rfc/rfc9591.html)

### Διαδικασίες αναθεώρησης σε παραγωγή (Tezos, Polkadot OpenGov)

*system, production* · SOTA-KGOV-18

Tezos: proposal → exploration (quorum και supermajority >80%) → cooldown για δοκιμές σε test networks → promotion (ίδια κατώφλια) → adoption με αυτόματη ενεργοποίηση στο Mainnet· περίπου 14 ημέρες ανά περίοδο. Polkadot OpenGov: 15 origins/tracks με δικές τους παραμέτρους· lead-in, decision, confirmation και enactment periods· conviction voting με delegation ανά track· Technical Fellowship whitelist για επισπευσμένη διαδρομή· Referendum Canceller και Killer.

**Για το GRAIL:** Επιβεβαιώνουν tiers και ψύξη. Δείχνουν επισπευσμένη διαδρομή και ακύρωση, που λείπουν από το πρόχειρο.

**Πηγές:** [Tezos governance, 2026](https://docs.tezos.com/architecture/governance) · [Polkadot OpenGov, 2026](https://wiki.polkadot.com/learn/learn-polkadot-opengov/)

### Ρυθμιστικό πλαίσιο: AI Act Art.14/12 και NIST AI RMF

*standard, production* · SOTA-KGOV-19

Art.14(4)(d): απόφαση να μη χρησιμοποιηθεί το σύστημα ή override/reverse της εξόδου. Art.14(4)(e): παρέμβαση ή διακοπή μέσω «stop» button ή ανάλογης διαδικασίας, ώστε το σύστημα να σταματά σε ασφαλή κατάσταση. Art.12(1): αυτόματη καταγραφή γεγονότων σε όλη τη διάρκεια ζωής. Υποχρεώσεις high-risk από 2027-12-02 (Annex III) και 2028-08-02 (Annex I)· το AI Omnibus (πρόταση 2025-11-19) σε ισχύ από 2026-07-27. NIST AI RMF 1.0 (2023-01-26, υπό αναθεώρηση στο πλαίσιο του White House AI Action Plan) και NIST AI 600-1 (2024-07-26).

**Για το GRAIL:** Το ledger καλύπτει το Art.12· το Art.14(4)(e) απαιτεί safe-halt, που το πρόχειρο δεν ορίζει.

**Πηγές:** [AI Act Article 14, 2026](https://artificialintelligenceact.eu/article/14/) · [AI Act Article 12, 2026](https://artificialintelligenceact.eu/article/12/) · [AI Act implementation timeline, 2026](https://artificialintelligenceact.eu/implementation-timeline/) · [Digital Omnibus on AI, 2026](https://digital-strategy.ec.europa.eu/en/library/digital-omnibus-ai-regulation-proposal) · [NIST AI RMF, 2026](https://www.nist.gov/itl/ai-risk-management-framework) · [NIST AI 600-1, 2024](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence)

### Αξιοπιστία capability evaluations

*research, research-prototype* · SOTA-KGOV-20

AI Sandbagging (2024, αναθ. 2025): τα μοντέλα μπορούν να υποαποδίδουν επιλεκτικά σε dangerous-capability evals ή να κρύβουν ικανότητες πίσω από password. Noise Injection (2024, NeurIPS 2025): με θόρυβο στα βάρη, τα sandbagging μοντέλα εμφανίζουν ανώμαλη βελτίωση ενώ τα κανονικά υποβαθμίζονται — κατά τους συγγραφείς, model-agnostic σήμα ανίχνευσης. Adding Error Bars to Evals (2024): super-population, paired comparisons, power analysis.

**Για το GRAIL:** Το KRN-04 δέχεται ικανότητες μόνο από evidence. Χωρίς προστασία από sandbagging και χωρίς στατιστικό κριτήριο, το ND ratchet παραπλανάται.

**Πηγές:** [AI Sandbagging, 2024](https://arxiv.org/abs/2406.07358) · [Noise Injection Reveals Hidden Capabilities of Sandbagging Language Models, 2024](https://arxiv.org/abs/2412.01784) · [Adding Error Bars to Evals, 2024](https://arxiv.org/abs/2411.00640)

### Delegation tokens για αλυσίδες agents (AIP/IBCT) και authorization propagation

*research, research-prototype* · SOTA-KGOV-21

AIP (2026): Invocation-Bound Capability Tokens σε δύο μορφές — compact mode (υπογεγραμμένο JWT, single-hop) και chained mode (Biscuit με Datalog, multi-hop delegation) — με attenuation και provenance, για γεφύρωση MCP και A2A. Reference implementations σε Python και Rust· οι ίδιοι οι συγγραφείς αναφέρουν 100% απόρριψη σε 600 επιθέσεις. Authorization Propagation in Multi-Agent AI Systems (2026): η διατήρηση permission invariants σε delegation είναι ιδιότητα επιπέδου workflow· προτείνει task-scoped authorization envelopes και execution-count revocation.

**Για το GRAIL:** Προφίλ του Biscuit για αλυσίδες οργάνων, υποψήφιο για multi-hop χρήση του ICD-08. Ερευνητικό, χωρίς ανεξάρτητη αξιολόγηση.

**Πηγές:** [AIP: Agent Identity Protocol for Verifiable Delegation, 2026](https://arxiv.org/abs/2603.24775) · [Authorization Propagation in Multi-Agent AI Systems, 2026](https://arxiv.org/abs/2605.05440)
