# Ασφάλεια / κρυπτογραφία — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### NIST PQC standards (FIPS 203 ML-KEM, FIPS 204 ML-DSA, FIPS 205 SLH-DSA) + HQC + Falcon

*standard, production* · SOTA-SEC-01

Τελικά FIPS από 13/8/2024 («can and should be put into use now»)· HQC επιλέχθηκε 11/3/2025 ως δεύτερος KEM μετά το ML-KEM (τελικό πρότυπο σε ~2 έτη)· Falcon σε διαδικασία τυποποίησης (underway).

**Για το GRAIL:** Βάση για ADR-0016, EP-04, INV-X02, CMP-KRN-03· HQC ως διάδοχος KEM στο Crypto Suite Registry.

**Πηγές:** [NIST Post-Quantum Cryptography project, 2026](https://csrc.nist.gov/projects/post-quantum-cryptography) · [HQC announced as a 4th round selection, 2025](https://csrc.nist.gov/news/2025/hqc-announced-as-a-4th-round-selection) · [FIPS 204 ML-DSA, 2024](https://csrc.nist.gov/pubs/fips/204/final)

### NIST IR 8547 (ipd) — PQC transition timeline

*standard, pilot* · SOTA-SEC-02

Initial public draft 12/11/2024 (καμία τελική έκδοση στη σελίδα). ECDSA, EdDSA, RSA, finite-field/ECDH: 112-bit deprecated μετά το 2030, όλα disallowed μετά το 2035. Symmetric (hash, XOF, block ciphers, KDF, DRBG): «significantly less vulnerable to known quantum attacks», η NIST δεν αναμένει μετάβαση. Dual signatures αποδεκτές αν ≥1 συνιστώσα είναι NIST-approved. FAQ: ο Grover δίνει μικρό ή μηδενικό πλεονέκτημα έναντι AES.

**Για το GRAIL:** Διορθώνει την πλαισίωση του κβαντικού κινδύνου (υπογραφές/KEM, όχι SHA-2)· θέτει ορόσημα έναντι του GP-9.

**Πηγές:** [NIST IR 8547 ipd, 2024](https://csrc.nist.gov/pubs/ir/8547/ipd) · [NIST IR 8547 ipd PDF, 2024](https://nvlpubs.nist.gov/nistpubs/ir/2024/NIST.IR.8547.ipd.pdf) · [NIST PQC FAQs, n.d.](https://csrc.nist.gov/Projects/post-quantum-cryptography/faqs)

### Composite ML-DSA (IETF LAMPS)

*standard, pilot* · SOTA-SEC-03

ML-DSA σε hybrid με RSASSA-PKCS1-v1.5, RSASSA-PSS, ECDSA, Ed25519, Ed448 (18 συνδυασμοί)· υπογράφεται το Prefix \|\| Label \|\| len(ctx) \|\| ctx \|\| PH(M)· weak non-separability· καμία παραλλαγή SUF-CMA έναντι κβαντικού αντιπάλου· δεν καλύπτει SLH-DSA· draft-19 (21/4/2026), RFC Editor queue.

**Για το GRAIL:** Ανώτερο από ανεξάρτητες «διπλές υπογραφές» (ADR-0016, INV-X02) για ζεύγη PQ/traditional· ένα alg id ανά ζεύγος (INV-X01).

**Πηγές:** [draft-ietf-lamps-pq-composite-sigs, 2026](https://datatracker.ietf.org/doc/draft-ietf-lamps-pq-composite-sigs/)

### PQ implementation readiness: OpenSSL 3.5, PKCS#11 3.2, RFC 9881, RFC 9814, SP 800-227, RFC 10024

*tool, production* · SOTA-SEC-04

OpenSSL 3.5.0 (8/4/2025): ML-KEM, ML-DSA, SLH-DSA· default TLS keyshares X25519MLKEM768 και X25519.<br>PKCS#11 v3.2, OASIS Standard (3/6/2026): ML-DSA, ML-KEM, SLH-DSA, HSS, XMSS/XMSSMT.<br>RFC 9881 (2025), ML-DSA στο X.509: ctx κενό σε αυτό το profile, HashML-DSA MUST NOT· ML-DSA-65 pk 1952 B / sig 3309 B, ML-DSA-87 sig 4627 B.<br>RFC 9814 (2025): SLH-DSA στο CMS.<br>SP 800-227 final (18/9/2025): συστάσεις για KEMs.<br>RFC 10024 (Proposed Standard, 2026): X25519MLKEM768, SecP256r1MLKEM768, SecP384r1MLKEM1024 για TLS 1.3, πάνω στο RFC 9954 (Informational).

**Για το GRAIL:** Κάνει το CMP-KRN-03 (HSM μέσω PKCS#11), την PQ σουίτα και το hybrid TLS [T] σήμερα· δεδομένα για το EXP-11.

**Πηγές:** [OpenSSL 3.5 release notes, 2025](https://openssl-library.org/news/openssl-3.5-notes/) · [PKCS #11 v3.2, 2026](https://docs.oasis-open.org/pkcs11/pkcs11-spec/v3.2/pkcs11-spec-v3.2.html) · [RFC 9881 ML-DSA in X.509, 2025](https://www.rfc-editor.org/rfc/rfc9881) · [RFC 9814 SLH-DSA in CMS, 2025](https://www.rfc-editor.org/rfc/rfc9814) · [NIST SP 800-227, 2025](https://csrc.nist.gov/pubs/sp/800/227/final) · [RFC 10024 PQ/T Hybrid Key Agreement for TLS 1.3, 2026](https://www.rfc-editor.org/rfc/rfc10024) · [RFC 9954 Hybrid Key Exchange in TLS 1.3, n.d.](https://www.rfc-editor.org/rfc/rfc9954)

### Crypto agility practice: NIST CSWP 39, CBOM (CycloneDX 1.7 / ECMA-424), multihash, RFC 8725

*standard, production* · SOTA-SEC-05

CSWP 39 final 19/12/2025, αποσύρθηκε 29/6/2026 υπέρ του CSWP 39upd1. CycloneDX 1.7 (21/10/2025) και ECMA-424 (10/12/2025), με cryptography registry (CBOM). Multihash: self-describing digests (TLV: function code, length, digest)· spec υπό προετοιμασία για το IETF, όχι πρότυπο. RFC 8725 (BCP 225, JWT) §3.1: allowlist αλγορίθμων· κάθε κλειδί με ακριβώς έναν αλγόριθμο, έλεγχος κατά την πράξη.

**Για το GRAIL:** Εξειδικεύει τα INV-X01 και EP-04: αλγόριθμος δεμένος στο κλειδί, κρυπτογραφική απογραφή. Το RFC 8725 αφορά JWT· η αρχή μεταφέρεται κατ' αναλογία.

**Πηγές:** [NIST CSWP 39, 2025](https://csrc.nist.gov/pubs/cswp/39/considerations-for-achieving-cryptographic-agility/final) · [CycloneDX specification overview, 2025](https://cyclonedx.org/specification/overview/) · [Multihash, n.d.](https://multiformats.io/multihash/) · [RFC 8725 JWT BCP, 2020](https://www.rfc-editor.org/rfc/rfc8725)

### KERI (Key Event Receipt Infrastructure) v1.1

*standard, pilot* · SOTA-SEC-06

Self-certifying identifiers με append-only Key Event Log. Pre-rotation σε «unexposed but pre-committed» κλειδιά. Witness pools (KAWA) με receipts, watchers με first-seen policy, nonrepudiable duplicity proofs, delegated inception/rotation, SQAR (Surprise Quantum Attack Recovery). Δηλώνει crypto agility pre- και post-quantum.

**Για το GRAIL:** Αντιστοιχία στο CMP-KRN-03 και ICD-03 (charter, delegate, rotate, revoke, continuity). Λύνει κρυπτογραφικά τον αγώνα ανάκτησης του KT-23, υπό την προϋπόθεση ότι τα next keys φυλάσσονται χωριστά από τα τρέχοντα.

**Πηγές:** [KERI Specification v1.1 (ToIP KSWG), n.d.](https://trustoverip.github.io/kswg-keri-specification/)

### Transparency & witnessing: C2SP tlog-witness, Sigsum, IETF KEYTRANS, Sigstore Rekor v2

*system, production* · SOTA-SEC-07

C2SP tlog-witness: οι witnesses ελέγχουν checkpoint signature και consistency proof και επιστρέφουν timestamped cosignature· ο μηχανισμός monitor retrieval είναι ακόμη υπό συζήτηση. Sigsum: δημόσιο log υπογραφών με witnesses για ανίχνευση κακής χρήσης κλειδιού. KEYTRANS protocol-05 (6/7/2026, WG I-D): log tree και prefix tree. Rekor v2 GA 10/10/2025: tile-backed (Tessera), backends GCP/AWS/MySQL/POSIX· το ενσωματωμένο witnessing ανακοινώθηκε ως επερχόμενο.

**Για το GRAIL:** Ανίχνευση κακής χρήσης κλειδιών (KT-18, KT-23) και διαφάνεια release signatures (CMP-OPS-01)· συμβατό με τα witnessed checkpoints του ICD-01.

**Πηγές:** [C2SP tlog-witness, n.d.](https://c2sp.org/tlog-witness) · [Sigsum, n.d.](https://www.sigsum.org/) · [IETF KEYTRANS WG, n.d.](https://datatracker.ietf.org/wg/keytrans/about/) · [draft-ietf-keytrans-protocol, 2026](https://datatracker.ietf.org/doc/draft-ietf-keytrans-protocol/) · [Rekor v2 GA, 2025](https://blog.sigstore.dev/rekor-v2-ga/)

### Long-term evidence & time: RFC 4998 ERS, RFC 3161, eIDAS Art. 41, Roughtime

*standard, production* · SOTA-SEC-08

ERS (Proposed Standard, 2007): Timestamp Renewal (συμβιβασμός κλειδιού TSU ή αδυναμία αλγορίθμου της χρονοσφραγίδας) έναντι Hash-Tree Renewal (αδυναμία του hash των δέντρων)· το δεύτερο απαιτεί πρόσβαση στα αρχειοθετημένα δεδομένα. RFC 3161 (updated by RFC 5816): tokens SHOULD be time-stamped again. eIDAS Art. 41(2): το qualified time stamp έχει τεκμήριο ακρίβειας ημερομηνίας/ώρας και ακεραιότητας. Roughtime draft-19 (Experimental), σε τελικό στάδιο προς RFC· malfeasance reports από αλυσίδες απαντήσεων πολλών servers.

**Για το GRAIL:** Τυποποιημένη μορφή του INV-X02· νομική ισχύς χρονοσφραγίδων για LAWMAX· KT-21, KT-23 (pre-compromise TSA-timed υπογραφές), GAP-SEC-05.

**Πηγές:** [RFC 4998 Evidence Record Syntax, 2007](https://www.rfc-editor.org/rfc/rfc4998) · [RFC 3161 TSP, 2001](https://www.rfc-editor.org/rfc/rfc3161) · [eIDAS Regulation 910/2014, 2014](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910) · [draft-ietf-ntp-roughtime, 2026](https://datatracker.ietf.org/doc/draft-ietf-ntp-roughtime/)

### Threshold/multisig: FROST RFC 9591, NIST MPTS (IR 8214C), TUF root rotation

*standard, pilot* · SOTA-SEC-09

FROST: threshold Schnorr (Informational, 2024), βασίζεται στο discrete log, άρα όχι PQ· trusted dealer ή DKG (το DKG εκτός εμβέλειας). NIST IR 8214C final 20/1/2026· previews υποβολών Ιανουάριος και Ιούλιος 2026, τρίτος γύρος 29–30/9/2026· καμία τυποποιημένη PQ threshold. TUF spec 1.0.36: το νέο root υπογράφεται από threshold του παλιού ΚΑΙ του νέου root· κάθε keyid μετρά μία φορά.

**Για το GRAIL:** Για PQ root σήμερα: k-of-n multisignature (TUF-style) αντί threshold signature· PQ threshold ως επέκταση του EP-04.

**Πηγές:** [RFC 9591 FROST, 2024](https://www.rfc-editor.org/rfc/rfc9591) · [NIST Threshold Cryptography project, 2026](https://csrc.nist.gov/projects/threshold-cryptography) · [TUF specification, 2026](https://theupdateframework.github.io/specification/latest/)

### Prompt injection by design: CaMeL, FIDES, Design Patterns, Dual LLM, Progent

*research, research-prototype* · SOTA-SEC-10

CaMeL: το control flow εξάγεται μόνο από το trusted query, untrusted δεδομένα δεν επηρεάζουν τη ροή· capabilities και πολιτικές σε κάθε tool call· 77% εργασιών AgentDojo με provable security (84% χωρίς άμυνα). FIDES: planner με confidentiality και integrity labels, ντετερμινιστική επιβολή πολιτικών, primitives επιλεκτικής απόκρυψης, τυπικό μοντέλο. Design Patterns (2025): Action-Selector, Plan-Then-Execute, LLM Map-Reduce, Dual LLM, Code-Then-Execute, Context-Minimization. Dual LLM (2023): privileged και quarantined LLM με controller. Progent: συμβολικοί κανόνες σε tools/arguments, SMT για narrowing/expansion, το action space μόνο συρρικνώνεται χωρίς έγκριση.

**Για το GRAIL:** Ο μηχανισμός που λείπει από την INV-S01 και το KT-17.

**Πηγές:** [Defeating Prompt Injections by Design (CaMeL), 2025](https://arxiv.org/abs/2503.18813) · [Securing AI Agents with Information-Flow Control (FIDES), 2025](https://arxiv.org/abs/2505.23643) · [Design Patterns for Securing LLM Agents against Prompt Injections, 2025](https://arxiv.org/abs/2506.08837) · [The Dual LLM pattern, 2023](https://simonwillison.net/2023/Apr/25/dual-llm-pattern/) · [Progent, 2025](https://arxiv.org/abs/2504.11703)

### Injection evaluation & structural rules: AgentDojo, adaptive attacks, Spotlighting, AgentPoison, Rule of Two

*research, pilot* · SOTA-SEC-11

AgentDojo: 97 tasks, 629 security test cases. «The Attacker Moves Second» (10/2025): 12 άμυνες παρακάμφθηκαν με ASR >90% στις περισσότερες, ενώ οι περισσότερες ανέφεραν αρχικά σχεδόν μηδενικό ASR. Spotlighting: ASR από >50% σε <2% (πιθανοτική άμυνα). AgentPoison: μέσο ASR >80% με poison rate <0,1%, σε RAG driving, knowledge-intensive QA και EHRAgent. Agents Rule of Two (31/10/2025): όχι ταυτόχρονα [A] untrusted input, [B] sensitive data/systems, [C] αλλαγή κατάστασης ή εξωτερική επικοινωνία χωρίς human-in-the-loop.

**Για το GRAIL:** Κριτήρια και σώμα επιθέσεων για KT-17 και VT-801· κανόνας σύνθεσης για το INV-C07.

**Πηγές:** [AgentDojo, 2024](https://arxiv.org/abs/2406.13352) · [The Attacker Moves Second, 2025](https://arxiv.org/abs/2510.09023) · [Spotlighting, 2024](https://arxiv.org/abs/2403.14720) · [AgentPoison, 2024](https://arxiv.org/abs/2407.12784) · [Agents Rule of Two, 2025](https://ai.meta.com/blog/practical-ai-agent-security/)

### Threat taxonomies: OWASP LLM Top 10 2025, OWASP Agentic Top 10 2026, MITRE ATLAS, LINDDUN

*standard, production* · SOTA-SEC-12

OWASP LLM 2025: LLM01 Prompt Injection, LLM02 Sensitive Information Disclosure, LLM03 Supply Chain, LLM04 Data and Model Poisoning, LLM05 Improper Output Handling, LLM06 Excessive Agency, LLM07 System Prompt Leakage, LLM08 Vector and Embedding Weaknesses, LLM09 Misinformation, LLM10 Unbounded Consumption. OWASP Top 10 for Agentic Applications 2026 (9/12/2025) και OWASP Agentic AI Threats and Mitigations (17/2/2025): δημοσιεύσεις επιβεβαιωμένες, το περιεχόμενο των λιστών δεν επαληθεύτηκε. MITRE ATLAS data 2026.05. LINDDUN (KU Leuven DistriNet): Linking, Identifying, Non-repudiation, Detecting, Data Disclosure, Unawareness, Non-compliance.

**Για το GRAIL:** Εξωτερικό πλέγμα κάλυψης για την §18 που δεν γράφτηκε και για την απρόσιτη έδρα THREAT-MODEL.

**Πηγές:** [OWASP Top 10 for LLM Applications 2025, 2025](https://genai.owasp.org/llm-top-10/) · [OWASP Top 10 for Agentic Applications 2026, 2025](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/) · [OWASP Agentic AI Threats and Mitigations, 2025](https://genai.owasp.org/resource/agentic-ai-threats-and-mitigations/) · [MITRE ATLAS data, 2026](https://github.com/mitre-atlas/atlas-data) · [LINDDUN, n.d.](https://linddun.org/)

### Supply-chain frameworks: SLSA v1.2, in-toto attestations, TUF

*standard, production* · SOTA-SEC-13

SLSA v1.2 (Approved): Build track L0, L1, L2, L3· κανένα Build level δεν απαιτεί reproducible ή hermetic build· το Source track επανεισάγεται στο 1.2. in-toto: DSSE envelope, statement, predicates (SLSA provenance, SPDX, CycloneDX, VSA). TUF: CNCF graduated· ρόλοι root, targets, snapshot, timestamp· προστασία από arbitrary installation, rollback, indefinite freeze, mix-and-match, fast-forward και από συμβιβασμό κλειδιών κάτω από το threshold.

**Για το GRAIL:** Η INV-S03 είναι αυστηρότερη από το SLSA· το TUF καλύπτει τη διανομή artifacts στους organ hosts, που λείπει από το πρόχειρο.

**Πηγές:** [SLSA specification, n.d.](https://slsa.dev/spec/) · [SLSA v1.2 Build track basics, n.d.](https://slsa.dev/spec/v1.2/build-track-basics) · [in-toto Attestation Framework, n.d.](https://github.com/in-toto/attestation) · [The Update Framework, n.d.](https://theupdateframework.io/) · [TUF specification, 2026](https://theupdateframework.github.io/specification/latest/)

### Reproducible & bootstrappable builds: Guix FSB, stagex, DDC

*system, production* · SOTA-SEC-14

Reproducible: οποιοσδήποτε αναπαράγει bit-by-bit πανομοιότυπα artifacts. Guix full-source bootstrap (26/4/2023): γράφος >22.000 κόμβων από seed 357 bytes, x86_64/i686· ως driver απομένει στατικό Guile 25 MiB. Guix Rust (2018): bootstrap από πηγή μέσω mrustc, χωρίς binary rustc. stagex: seed <190 bytes, deterministic, υπογραφές 4 maintainers με hardware-backed PGP. DDC (Wheeler, 2005 και 2009): ανίχνευση trusting-trust με δεύτερο compiler. NixOS: η Nix από μόνη της δεν εγγυάται αναπαραγωγιμότητα.

**Για το GRAIL:** Ισχυρότερο από τους «δύο builders» για το kernel TCB (INV-S03, CMP-OPS-01)· περιορίζει δραστικά, όχι μηδενίζει, το common-mode trusting-trust.

**Πηγές:** [Reproducible builds definition, n.d.](https://reproducible-builds.org/docs/definition/) · [Guix full-source bootstrap, 2023](https://guix.gnu.org/en/blog/2023/the-full-source-bootstrap-building-from-source-all-the-way-down/) · [Guix: Bootstrapping Rust, 2018](https://guix.gnu.org/en/blog/2018/bootstrapping-rust/) · [StageX, n.d.](https://stagex.tools/) · [Countering Trusting Trust (DDC), 2009](https://dwheeler.com/trusting-trust/) · [NixOS reproducibility, n.d.](https://reproducible.nixos.org/)

### Authorization & workload identity: Cedar, Biscuit, Macaroons, SPIFFE/SPIRE

*tool, production* · SOTA-SEC-15

Cedar (2024): μοντέλο και αποδείξεις ιδιοτήτων σε Lean, sound και complete logical encoding για ανάλυση πολιτικών, υλοποίηση σε Rust. Biscuit (Eclipse): capability tokens με public key, offline attenuation με blocks, Datalog, revocation ids· Ed25519 (default) και ECDSA secp256r1, καμία PQ. Macaroons (NDSS 2014): chained HMACs με caveats, άρα μόνο συμμετρική κρυπτογραφία. SPIFFE/SPIRE: short-lived SVIDs (X.509/JWT), node και workload attestation, αυτόματη rotation.

**Για το GRAIL:** Υλοποιήσεις για INV-S02, INV-C07, ADR-0010 και για τα leases των bodies.

**Πηγές:** [Cedar paper, 2024](https://arxiv.org/abs/2403.04651) · [Biscuit, n.d.](https://github.com/eclipse-biscuit/biscuit) · [Biscuit SPECIFICATIONS, n.d.](https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md) · [Macaroons, 2014](https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/) · [SPIFFE overview, n.d.](https://spiffe.io/docs/latest/spiffe-about/overview/)

### GDPR vs append-only: EDPB Guidelines 02/2025, CNIL blockchain guidance, CJEU C-413/23 P

*standard, pilot* · SOTA-SEC-16

EDPB 02/2025 v1.1 (υιοθέτηση 8/4/2025, έκδοση διαβούλευσης έως 9/6/2025):<br>- η τεχνική αδυναμία δεν δικαιολογεί μη συμμόρφωση·<br>- τα κρυπτογραφημένα δεδομένα παραμένουν προσωπικά· η κρυπτογράφηση «overtaken by time» αν το blockchain διατηρείται επ' αόριστον·<br>- salted/keyed hash: μετά τη διαγραφή key/salt δεν πρέπει να είναι linkable· unsalted/unkeyed hashes κατά κανόνα ανεπαρκή για δημόσιο blockchain·<br>- perfectly hiding commitment: μετά τη διαγραφή δεδομένων και witness γίνεται «useless».<br>CNIL (Σεπτ. 2018): ρητή σειρά προτίμησης commitment > keyed hash > ciphertext· με διαγραφή witness ή key το αποτέλεσμα κινείται «closer to» erasure· perfectly hiding commitment μαζί με διαγραφή witness και τιμής ⇒ ανώνυμο.<br>CJEU C-413/23 P (4/9/2025): τα pseudonymised δεδομένα δεν είναι αναγκαστικά προσωπικά για αποδέκτη χωρίς εύλογα μέσα ταυτοποίησης.

**Για το GRAIL:** Ορίζει τις προϋποθέσεις για ADR-0018 και KT-16 και την είσοδο του EXP-19· η δήλωση για unsalted hashes αφορά δημόσιο blockchain και εφαρμόζεται κατ' αναλογία στο ιδιωτικό ledger του GRAIL.

**Πηγές:** [EDPB adopts guidelines on blockchain (news), 2025](https://www.edpb.europa.eu/news/news/2025/edpb-adopts-guidelines-processing-personal-data-through-blockchains-and-ready_en) · [EDPB Guidelines 02/2025 PDF, 2025](https://www.edpb.europa.eu/system/files/2025-04/edpb_guidelines_202502_blockchain_en.pdf) · [CNIL Blockchain guidance (EN), 2018](https://www.cnil.fr/sites/default/files/atoms/files/blockchain_en.pdf) · [CJEU C-413/23 P EDPS v SRB, 2025](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:62023CJ0413)

### Confidential computing & attestation: RFC 9334 RATS, Private Cloud Compute, TEE.fail

*research, pilot* · SOTA-SEC-17

RFC 9334 (Informational, 2023): Attester, Verifier, Relying Party· Evidence και Attestation Results. PCC (10/6/2024): stateless computation, enforceable guarantees, no privileged runtime access, non-targetability, verifiable transparency. TEE.fail (IEEE S&P'26): DDR5 interposer <1000$· εξαγωγή attestation keys από Intel TDX/SGX, ιδιωτικών ECDSA κλειδιών σε AMD SEV-SNP, παραβίαση του NVIDIA CC με «δανεικά» attestation keys.

**Για το GRAIL:** Το TB-4 (provider egress) μπορεί να προσθέσει attested inference, αλλά ο TEE δεν αντικαθιστά residency και τοπικά μοντέλα για privileged δεδομένα.

**Πηγές:** [RFC 9334 RATS, 2023](https://www.rfc-editor.org/rfc/rfc9334) · [Private Cloud Compute, 2024](https://security.apple.com/blog/private-cloud-compute/) · [TEE.fail, 2026](https://tee.fail/)

### LLM serving side channels (KV / semantic cache)

*research, research-prototype* · SOTA-SEC-18

Timing side channels σε KV cache και semantic cache· token-by-token ανάκτηση κοινών prefixes, δηλαδή system prompts και prompts άλλων χρηστών, σε multi-tenant serving (αποδεκτό στο IEEE TIFS).

**Για το GRAIL:** Κίνδυνος cross-matter leakage στους τοπικούς model servers του DP-2 (REQ-SEC-006, VT-805).

**Πηγές:** [The Early Bird Catches the Leak, 2024](https://arxiv.org/abs/2409.20002)

### EU regulatory security frame: CRA, EU PQC roadmap, AI Act Art. 15

*standard, production* · SOTA-SEC-19

CRA: σε ισχύ από 10/12/2024· υποχρεώσεις αναφοράς από 11/9/2026· κύριες υποχρεώσεις από 11/12/2027. EU PQC coordinated implementation roadmap: 23/6/2025 (ορόσημα μη επαληθευμένα). AI Act Art. 15(5): ανθεκτικότητα high-risk συστημάτων σε data poisoning, model poisoning, adversarial examples, confidentiality attacks, model flaws.

**Για το GRAIL:** Δυνητικές υποχρεώσεις για LAWMAX/GRAIL· η εφαρμοσιμότητα κρίνεται στο EXP-19.

**Πηγές:** [Cyber Resilience Act, 2024](https://digital-strategy.ec.europa.eu/en/policies/cyber-resilience-act) · [EU PQC coordinated implementation roadmap, 2025](https://digital-strategy.ec.europa.eu/en/library/coordinated-implementation-roadmap-transition-post-quantum-cryptography) · [AI Act Article 15, 2024](https://artificialintelligenceact.eu/article/15/)

### BFT ordering: HotStuff, HotStuff-2

*research, pilot* · SOTA-SEC-20

HotStuff (2018· PODC'19): partial synchrony, n = 3f+1, linear view change, responsiveness. HotStuff-2 (2023): δύο φάσεις ανά view αντί τριών, με optimistic responsiveness και χωρίς ουσιαστική πρόσθετη πολυπλοκότητα.

**Για το GRAIL:** Στηρίζει το REQ-SEC-003 και το ADR-0031 («HotStuff-family»)· το HotStuff-2 είναι βελτίωση latency μέσα στην ίδια οικογένεια.

**Πηγές:** [HotStuff, 2018](https://arxiv.org/abs/1803.05069) · [HotStuff-2, 2023](https://eprint.iacr.org/2023/397)

### NIST SP 800-88 Rev. 2 — Media Sanitization (Cryptographic Erase)

*standard, production* · SOTA-SEC-21

Guidelines for Media Sanitization, Rev. 2 (Σεπτ. 2025), αντικαθιστά την Rev. 1 (2014)· περιλαμβάνει το cryptographic erase ως τεχνική sanitization. Οι απαιτήσεις επαλήθευσης δεν ελέγχθηκαν εδώ.

**Για το GRAIL:** Τυποποιημένη βάση για το «επαληθευμένη καταστροφή κλειδιού» του KT-16 και το ADR-0018.

**Πηγές:** [NIST SP 800-88 Rev. 2, 2025](https://csrc.nist.gov/pubs/sp/800/88/r2/final)

### vLLM prefix-cache isolation (cache_salt)

*tool, production* · SOTA-SEC-22

Το cache_salt μπαίνει στο hash του πρώτου block, ώστε μόνο αιτήματα με το ίδιο salt να μοιράζονται KV blocks· στοχεύει ρητά timing side channels.

**Για το GRAIL:** Μέτρο διαθέσιμο σήμερα για GAP-SEC-09 και REQ-SEC-006: ένα salt ανά confidentiality domain.

**Πηγές:** [vLLM Automatic Prefix Caching design, n.d.](https://docs.vllm.ai/en/latest/design/prefix_caching.html)
