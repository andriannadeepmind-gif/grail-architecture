# Ασφάλεια / κρυπτογραφία — πρόχειρο έναντι ανώτερου (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| IDs | Ετυμηγορία | Τι λέει το πρόχειρο | Τι αλλάζει και γιατί | Κατάταξη · βεβαιότητα | Πηγές |
|---|---|---|---|---|---|
| CMP-KRN-03 | **υπάρχει αυστηρά ανώτερο** | Identity charters, threshold root keys (offline/HSM), delegated body keys με lease, rotation/revocation, continuity proofs, αλγοριθμική ευελιξία· μυστικά μόνο σε HSM/TEE· compromise root → threshold + time-locked recovery· σπάσιμο αλγορίθμου → dual signatures· HSM μέσω PKCS#11. | Ανώτερο: KERI-style KEL με pre-rotation (commitment επόμενων κλειδιών), witnesses/watchers και k-of-n multisignature από PQ κλειδιά. Αποκλείει δομικά τον «αγώνα rotation» με επιτιθέμενο που κατέχει το τρέχον κλειδί και κρατά HSM, leases και continuity proofs. Προϋπόθεση: τα next keys φυλάσσονται χωριστά από τα τρέχοντα.<br>Η KERI μοντελοποιεί ακριβώς αυτή την έννοια: KEL, delegated inception/rotation, witness receipts, duplicity proofs. Η pre-rotation δεσμεύει τα επόμενα, μη εκτεθειμένα κλειδιά, οπότε ο κάτοχος του τρέχοντος κλειδιού δεν μπορεί να κάνει rotation. Το «threshold root» με PQ δεν υλοποιείται σήμερα ως threshold signature: το FROST στηρίζεται στο discrete log και το NIST MPTS είναι σε φάση previews. Υλοποιήσιμο είναι k-of-n multisignature (TUF). Το ίδιο το πρόχειρο κατατάσσει τα threshold σχήματα και ως επέκταση (EP-04), που δημιουργεί ασάφεια. Το PKCS#11 3.2 (OASIS Standard, 3/6/2026) ορίζει ML-DSA, SLH-DSA, ML-KEM, HSS, XMSS. Επιφύλαξη: η έδρα KEY-LIFECYCLE δεν είναι διαθέσιμη και ίσως ήδη ορίζει μέρος αυτών. | σήμερα · μέση | [KERI Specification v1.1, n.d.](https://trustoverip.github.io/kswg-keri-specification/) · [RFC 9591 FROST, 2024](https://www.rfc-editor.org/rfc/rfc9591) · [NIST Threshold Cryptography, 2026](https://csrc.nist.gov/projects/threshold-cryptography) · [TUF specification, 2026](https://theupdateframework.github.io/specification/latest/) · [PKCS #11 v3.2, 2026](https://docs.oasis-open.org/pkcs11/pkcs11-spec/v3.2/pkcs11-spec-v3.2.html) |
| ICD-03 | **υπάρχει αυστηρά ανώτερο** | CreateCharter (μόνο με Owner Root delegation) · Delegate(role, scope, not_before, not_after) · Rotate · Revoke · Sign(payload, kid) · Verify · ContinuityProof(cut_a, cut_b)· signature {kid, alg, sig}· μυστικά μόνο σε HSM/TEE· ανάκληση αποτελεσματική από τον χρόνο της. | Ανώτερο: ICD-03 με:<br>- NextKeyDigests στα CreateCharter και Rotate·<br>- Sign(typed_payload, domain_tag, kid) με υποχρεωτικό domain separation·<br>- αλγόριθμο ως ιδιότητα του kid στο ledger·<br>- προαιρετικά KeyStateAt(kid, cut).<br>Αποκλείει κλάσεις σφάλματος (cross-protocol reuse, algorithm substitution) χωρίς απώλεια ευελιξίας.<br>Τρία κενά στο συμβόλαιο.<br>(α) Δεν υπάρχει πεδίο pre-rotation commitment (KERI).<br>(β) Το Sign(payload, kid) είναι γενικό signing oracle χωρίς typed/domain-separated payload. Το FIPS 204 έχει προαιρετικό ctx· το RFC 9881 το αφήνει κενό στο X.509 profile, άρα η χρήση του ορίζεται ανά profile. Το composite ML-DSA δεσμεύει Prefix/Label.<br>(γ) Το ICD-03 δεν ορίζει ρητά ότι ο αλγόριθμος είναι δεμένος στο kid· το RFC 8725 §3.1 απαιτεί ένα κλειδί ανά αλγόριθμο και allowlist. Η KL-4 δεν είναι διαθέσιμη.<br>Το key state as-of cut είναι ήδη παράγωγο από τα ledger events μέσω ICD-01 Read και των witnessed checkpoints· ένα KeyStateAt είναι μόνο εργονομική βελτίωση. | σήμερα · μέση | [KERI Specification v1.1, n.d.](https://trustoverip.github.io/kswg-keri-specification/) · [RFC 8725, 2020](https://www.rfc-editor.org/rfc/rfc8725) · [RFC 9881, 2025](https://www.rfc-editor.org/rfc/rfc9881) · [draft-ietf-lamps-pq-composite-sigs, 2026](https://datatracker.ietf.org/doc/draft-ietf-lamps-pq-composite-sigs/) |
| KT-23 | **υπάρχει αυστηρά ανώτερο** | Owner root compromise: ανάκληση εκτός ζώνης σε ≥2 κανάλια· υπογραφές πριν το compromise με ανεξάρτητο TSA χρόνο παραμένουν έγκυρες· νέο root με continuity statement· καμία αναθεώρηση του επιτιθέμενου δεκτή· μηχανισμός (KRN-03): threshold + time-locked recovery. | Ανώτερο: Ανάκτηση με pre-rotated next keys (KERI), watcher duplicity evidence και TUF-style αλυσίδα root εκδόσεων. Κρυπτογραφική, όχι διαδικαστική, λύση του αγώνα ανάκτησης· κρατά όλα τα κριτήρια του KT-23. Προτεινόμενη προσθήκη κριτηρίου: rotation με το τρέχον (παραβιασμένο) κλειδί απορρίπτεται.<br>Αν ο επιτιθέμενος κατέχει το root, μπορεί να παράγει εξίσου «continuity statement» και «ανάκληση»· τα out-of-band κανάλια λύνουν το ζήτημα μόνο διαδικαστικά. Με KERI pre-rotation, μόνο ο κάτοχος των ήδη δεσμευμένων, μη εκτεθειμένων κλειδιών κάνει rotation, και οι watchers με first-seen policy παράγουν απόδειξη duplicity. Το TUF δείχνει αλυσίδα root εκδόσεων με threshold του παλιού ΚΑΙ του νέου root. Το κριτήριο «pre-compromise TSA-timed» ευθυγραμμίζεται με RFC 3161 και eIDAS Art. 41. Το T_cool των Tier-0 αναθεωρήσεων (19.md) λειτουργεί ήδη ως time-lock. Επιφύλαξη: οι KEY-LIFECYCLE/TRUST-BOOTSTRAP δεν είναι διαθέσιμες. | σήμερα · μέση | [KERI Specification v1.1, n.d.](https://trustoverip.github.io/kswg-keri-specification/) · [TUF specification, 2026](https://theupdateframework.github.io/specification/latest/) · [RFC 3161, 2001](https://www.rfc-editor.org/rfc/rfc3161) · [eIDAS 910/2014, 2014](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910) |
| REQ-SEC-005, KT-18 | ισχύει → **αλλάζει με** DEC-AEO-01, DEC-SEC-02 | Κλειδιά που διέρρευσαν (body ή owner root) ανακαλούνται χωρίς απώλεια ταυτότητας· KT-18: ανάκληση εντός ορίου, απόρριψη υπογραφών μετά την ανάκληση, ταυτότητα ανεπηρέαστη· INV-I04: υπογραφή body έγκυρη ⇔ ζωντανό lease τη στιγμή της υπογραφής και καμία ανάκληση πριν. | Η απαίτηση και το κριτήριο είναι σωστά και υλοποιήσιμα: short-lived credentials (SPIFFE), delegated identifiers (KERI), witnessed logs για ανίχνευση κακής χρήσης (Sigsum). Προϋπόθεση που δεν ρητοποιείται: η INV-I04 κρίνει με βάση «τη στιγμή της υπογραφής». Αν ο χρόνος δηλώνεται από τον υπογράφοντα, ο κάτοχος διαρρεύσαντος κλειδιού μπορεί να οπισθοχρονολογήσει υπογραφές εκτός ledger. Ο χρόνος πρέπει να είναι ledger-inclusion ή TSA (GAP-SEC-05). Δεν βρέθηκε αυστηρά ανώτερη εναλλακτική. | σήμερα · μέση | [SPIFFE overview, n.d.](https://spiffe.io/docs/latest/spiffe-about/overview/) · [Sigsum, n.d.](https://www.sigsum.org/) · [RFC 3161, 2001](https://www.rfc-editor.org/rfc/rfc3161) |
| INV-X01 | **υπάρχει αυστηρά ανώτερο** | Κάθε digest/υπογραφή φέρει αναγνωριστικό αλγορίθμου· κανένας verifier δεν υποθέτει default (Tier 1· KL-4, CS-1). | Ανώτερο: INV-X01′: ο αλγόριθμος είναι ιδιότητα του kid, καταγεγραμμένη στο ledger ανά epoch· ο verifier δέχεται μόνο ζεύγη (kid, alg) του allowlist της ενεργής epoch· το tag της υπογραφής απλώς επιβεβαιώνεται. Κρατά πλήρως την ευελιξία.<br>Το tagging των digests είναι σωστό (multihash-class, όχι ακόμη πρότυπο IETF). Για υπογραφές, το tag στην υπογραφή είναι αναγκαίο αλλά όχι επαρκές. Το RFC 8725 §3.1 (JWT BCP, αρχή μεταφερόμενη) απαιτεί allowlist, ένα κλειδί ανά αλγόριθμο και έλεγχο κατά την πράξη, ώστε να αποκλείεται algorithm substitution. Κατά το δόγμα §0.1 (εξάλειψη κλάσης σφάλματος) το σωστό σχήμα είναι ο αλγόριθμος δεμένος στο κλειδί. Επιφύλαξη: η KL-4 (μη διαθέσιμη) ίσως ήδη το ορίζει. | σήμερα · μέση | [RFC 8725, 2020](https://www.rfc-editor.org/rfc/rfc8725) · [Multihash, n.d.](https://multiformats.io/multihash/) |
| INV-X02 | **υπάρχει αυστηρά ανώτερο** | Πριν αποσυρθεί η σουίτα s, όλες οι ζωντανές ρίζες επαναγκυρώνονται στη διάδοχη s' με διπλές υπογραφές και k-of-n TSA (Tier 1)· KRN-02: σπάσιμο digest → epoch re-anchor. | Ανώτερο: Epoch re-anchoring κατά RFC 4998:<br>- δύο ρητοί τύποι renewal με πολιτική ανά τύπο·<br>- ρητή μεταχείριση των shredded αντικειμένων.<br>Δική μας πρόταση, όχι SOTA: dual-hash commitments από την εγγραφή ή κατάσταση «erased, non-renewable».<br>Καλύπτει και την περίπτωση του hash που το πρόχειρο αφήνει ανοιχτή.<br>Τυποποιημένη μορφή του ίδιου μηχανισμού είναι το RFC 4998 (ERS). Ξεχωρίζει Timestamp Renewal (συμβιβασμός κλειδιού TSU ή αδυναμία αλγορίθμου της χρονοσφραγίδας) από Hash-Tree Renewal (αδυναμία του hash των δέντρων), που απαιτεί ρητά πρόσβαση στα αρχειοθετημένα δεδομένα. Το πρόχειρο δεν κάνει τη διάκριση. Δεν ορίζει επίσης αν οι δεσμεύσεις προσωπικών δεδομένων είναι σε plaintext ή envelope. Αν είναι σε plaintext (ή αν διαγράφεται και το ciphertext), το hash-tree renewal είναι αδύνατο μετά το crypto-shredding. Κατά NIST IR 8547 τα hash είναι «significantly less vulnerable to known quantum attacks»· άρα το κύριο κβαντικό σενάριο είναι σπάσιμο υπογραφής, όπου αρκεί timestamp renewal, και σπάσιμο hash θα προερχόταν κυρίως από κλασική κρυπτανάλυση (συμπέρασμα). | σήμερα · μέση | [RFC 4998, 2007](https://www.rfc-editor.org/rfc/rfc4998) · [NIST IR 8547 ipd PDF, 2024](https://nvlpubs.nist.gov/nistpubs/ir/2024/NIST.IR.8547.ipd.pdf) |
| KT-09, REQ-SEC-004 | ισχύει → **αλλάζει με** DEC-SEC-04 | KT-09: αποτυχία post-quantum hash/υπογραφής → όλες οι ζωντανές ρίζες επαναγκυρωμένες στη διάδοχη σουίτα πριν την απόσυρση· συνέχεια μέσω epoch chain· κανένα πλαστό ιστορικό μετά το σπάσιμο (πρώτο GP: GP-9). REQ-SEC-004: κρυπτογραφική ευελιξία με δοκιμασμένη post-quantum μετάβαση εποχής. | Το κριτήριο και η απαίτηση είναι σωστά και υλοποιήσιμα σήμερα: FIPS 204/205, OpenSSL 3.5, PKCS#11 3.2, RFC 3161. Τρεις διευκρινίσεις:<br>(1) Η διατύπωση «post-quantum hash/signature failure» είναι ασαφής: σπάσιμο PQ αλγορίθμου ή κβαντική επίθεση; Για hash ο κβαντικός κίνδυνος είναι μικρός (NIST IR 8547).<br>(2) Το pass criterion να ορίζει ότι υπογραφές με σπασμένο αλγόριθμο γίνονται δεκτές μόνο με ERS/TSA anchor πριν το σπάσιμο.<br>(3) Το GP-9 (τελευταία φάση) να τοποθετηθεί έναντι του 2030/2035 της NIST.<br>Δεν βρέθηκε αυστηρά ανώτερη εναλλακτική. | σήμερα · μέση | [NIST PQC project, 2026](https://csrc.nist.gov/projects/post-quantum-cryptography) · [NIST IR 8547 ipd PDF, 2024](https://nvlpubs.nist.gov/nistpubs/ir/2024/NIST.IR.8547.ipd.pdf) · [OpenSSL 3.5 notes, 2025](https://openssl-library.org/news/openssl-3.5-notes/) |
| ADR-0016 | **υπάρχει αυστηρά ανώτερο** | Content addressing & crypto agility: JCS + algorithm-tagged digests (spec v2)· PQ: ML-DSA, SLH-DSA, ML-KEM, διπλές υπογραφές. | Ανώτερο: Composite ML-DSA για ζεύγη PQ/traditional (non-separable, τυποποιημένα OIDs)· ML-DSA χωρίς HashML-DSA· hybrid KEM μέσω των groups του RFC 10024. Trade-off: για PQ+PQ (ML-DSA+SLH-DSA) χρειάζεται δική μας domain-separated σύνδεση· το composite δεν είναι ακόμη RFC.<br>JCS και tagged digests: ισχύουν, δεν βρέθηκε ανώτερο. Οι «διπλές υπογραφές» ως ανεξάρτητες υπογραφές επιτρέπουν stripping αν δεν δεθούν. Το composite ML-DSA (draft-19, RFC Editor queue) δίνει weak non-separability μέσω Prefix/Label και έναν αλγόριθμο ανά ζεύγος. Το NIST IR 8547 δέχεται dual signatures αν ≥1 συνιστώσα είναι approved. Για ML-KEM: το X25519MLKEM768 είναι πλέον RFC 10024 (Proposed Standard, 2026) και default στο OpenSSL 3.5· το X-Wing είναι expired individual draft (ISE stream), όχι έγγραφο CFRG/IETF. Το RFC 9881 απαγορεύει HashML-DSA και αφήνει το ctx κενό στο X.509. Όριο: το composite δεν καλύπτει ML-DSA+SLH-DSA. | σήμερα · μέση | [draft-ietf-lamps-pq-composite-sigs, 2026](https://datatracker.ietf.org/doc/draft-ietf-lamps-pq-composite-sigs/) · [draft-connolly-cfrg-xwing-kem, 2026](https://datatracker.ietf.org/doc/draft-connolly-cfrg-xwing-kem/) · [RFC 10024, 2026](https://www.rfc-editor.org/rfc/rfc10024) · [RFC 9881, 2025](https://www.rfc-editor.org/rfc/rfc9881) · [NIST IR 8547 ipd PDF, 2024](https://nvlpubs.nist.gov/nistpubs/ir/2024/NIST.IR.8547.ipd.pdf) |
| EXP-11 | ισχύει → **αλλάζει με** DEC-SEC-04 | Κόστος PQ διπλών υπογραφών και επαναγκύρωσης σε μέγεθος/latency/αποθήκευση σε κλίμακα· απόφαση σουίτας ή batching (GP-9, KRN-03). | Έγκυρο πείραμα. Μέρος του απαντάται από δημοσιευμένα μεγέθη (RFC 9881: ML-DSA-65 pk 1952 B, sig 3309 B· ML-DSA-87 sig 4627 B). Το ζητούμενο είναι το κόστος στην κλίμακα του GRAIL: υπογραφή ανά ledger event έναντι υπογραφής μόνο στα checkpoints ή Merkle batching, και κόστος ERS renewal. Να μετρηθούν και composite και SLH-DSA (τα μεγέθη SLH-DSA δεν επαληθεύτηκαν εδώ). | πείραμα · υψηλή | [RFC 9881, 2025](https://www.rfc-editor.org/rfc/rfc9881) · [RFC 9814, 2025](https://www.rfc-editor.org/rfc/rfc9814) |
| EP-04 | ισχύει → **αλλάζει με** DEC-SEC-03, DEC-SEC-04 | Crypto Suite Registry (ICD-03): post-quantum σουίτες, νέα πρότυπα, threshold σχήματα (μόνο μεταξύ συσκευών του κυρίαρχου, KL-7)· προστασία: INV-X01, INV-X02, KT-09. | Σωστό σημείο επέκτασης, συμβατό με CSWP 39 (final 12/2025, αντικαταστάθηκε από upd1 6/2026). Προσθήκες:<br>- το registry ορίζει ολόκληρες σουίτες (sig, KEM, hash, ctx profile) ανά epoch, όχι μεμονωμένους αλγορίθμους·<br>- συνοδεύεται από CBOM (CycloneDX 1.7 / ECMA-424)·<br>- έχει θέση για HQC, Falcon/FN-DSA και μελλοντικό PQ threshold (NIST MPTS σε εξέλιξη· το FROST δεν είναι PQ). | επέκταση · μέση | [NIST CSWP 39, 2025](https://csrc.nist.gov/pubs/cswp/39/considerations-for-achieving-cryptographic-agility/final) · [CycloneDX overview, 2025](https://cyclonedx.org/specification/overview/) · [NIST Threshold Cryptography, 2026](https://csrc.nist.gov/projects/threshold-cryptography) |
| INV-S01 | **υπάρχει αυστηρά ανώτερο** | Περιεχόμενο OBSERVED/PROPOSED δεν ερμηνεύεται ποτέ ως εντολή προς COG-10/KRN-11· εντολές = μόνο υπογεγραμμένες προθέσεις Principal/δημιουργού (Tier 1· formal artifact «—»)· §0.1: κανάλια με provenance-tag. | Ανώτερο: CaMeL/FIDES-class planner:<br>- ο planner δεν βλέπει ποτέ μη έμπιστο περιεχόμενο, μόνο αναφορές·<br>- όλες οι τιμές φέρουν IFC labels·<br>- το KRN-11 επιβάλλει πολιτική ροής στο sink.<br>Κάνει την INV-S01 δομικά αληθή και τυπικά ελέγξιμη. Trade-off: μετρημένη απώλεια utility, ακόμη άγνωστη σε νομικές ροές.<br>Η ιδιότητα διατυπώνεται χωρίς μηχανισμό που την κάνει αληθή όταν ένας LLM planner διαβάζει OBSERVED περιεχόμενο και μετά προτείνει ενέργειες· το KRN-11 δεν ξέρει αν η πρόταση επηρεάστηκε. Το CaMeL εξάγει το control flow μόνο από το trusted query, ώστε τα untrusted δεδομένα να μην επηρεάζουν τη ροή, με capabilities και πολιτικές σε κάθε tool call (77% AgentDojo με provable security, 84% χωρίς άμυνα). Το FIDES προσθέτει integrity και confidentiality labels με ντετερμινιστική επιβολή και τυπικό μοντέλο, άρα η INV-S01 μπορεί να αποκτήσει formal artifact. Το Spotlighting είναι μόνο πιθανοτικό. | πείραμα · υψηλή | [CaMeL, 2025](https://arxiv.org/abs/2503.18813) · [FIDES, 2025](https://arxiv.org/abs/2505.23643) · [Design Patterns, 2025](https://arxiv.org/abs/2506.08837) · [Spotlighting, 2024](https://arxiv.org/abs/2403.14720) |
| REQ-SEC-001 | ισχύει → **αλλάζει με** DEC-SEC-01 | Περιεχόμενο από πηγές δεν δρα ποτέ ως εντολή (COG-02, COG-10, KRN-11· ICD-28, ICD-08· INV-S01· KT-17· [T]). | Η απαίτηση είναι σωστή και συμβατή με το OWASP LLM01:2025. Ο μηχανισμός και η επαλήθευση χρειάζονται αναβάθμιση (βλ. INV-S01, KT-17), γι' αυτό η κατάταξη είναι experiment και όχι [T]. Να καλύπτει ρητά tool/organ metadata και ανάκληση από μνήμη/RAG (AgentPoison: ASR >80% με poison rate <0,1%), όχι μόνο έγγραφα πηγών. | πείραμα · μέση | [OWASP Top 10 for LLM Applications 2025, 2025](https://genai.owasp.org/llm-top-10/) · [AgentPoison, 2024](https://arxiv.org/abs/2407.12784) |
| KT-17 | **υπάρχει αυστηρά ανώτερο** | Prompt injection μέσω μαρτυρίας: 0 εκτελέσεις εντολών από παρατηρούμενο περιεχόμενο στο σώμα επιθέσεων· καμία κλιμάκωση capability (GP-3· S01, K05, C07). | Ανώτερο: KT-17′: 0 παραβιάσεις πολιτικής IFC (integrity και confidentiality) υπό adaptive attacks, σε σώμα AgentDojo-class μαζί με σώμα νομικών εγγράφων, με ταυτόχρονη μέτρηση utility. Αυστηρότερο κριτήριο, χωρίς απώλεια του αρχικού.<br>Τρία ελλείμματα.<br>(1) Δεν απαιτούνται adaptive attacks· το «The Attacker Moves Second» παρέκαμψε 12 άμυνες με ASR >90% στις περισσότερες, ενώ ανέφεραν σχεδόν μηδενικό ASR.<br>(2) Το «0 instruction executions» δεν πιάνει επιθέσεις ροής δεδομένων: exfiltration ή αλλοίωση arguments μέσω εξουσιοδοτημένων ενεργειών, που στοχεύουν CaMeL/FIDES.<br>(3) Δεν ορίζεται σώμα επιθέσεων· υπάρχει το AgentDojo (97 tasks, 629 security cases), που χρειάζεται νομικό αντίστοιχο. | πείραμα · υψηλή | [The Attacker Moves Second, 2025](https://arxiv.org/abs/2510.09023) · [AgentDojo, 2024](https://arxiv.org/abs/2406.13352) · [CaMeL, 2025](https://arxiv.org/abs/2503.18813) |
| INV-S02 | ισχύει | Κανένα ambient authority· κάθε επίδραση απαιτεί scoped, χρονικά φραγμένο token (Tier 1)· ICD-08: το KRN-11 είναι το μόνο μονοπάτι επιδράσεων. | Το σχήμα object-capability με gateway είναι το σωστό. Υπάρχουν ώριμες υλοποιήσεις: Biscuit (offline attenuation, Datalog, revocation ids), SPIFFE/SPIRE (short-lived SVIDs), Cedar (αναλύσιμες πολιτικές), Progent (πολιτικές ανά tool/argument που μόνο συρρικνώνονται). Ανοιχτό: μορφή token. Το Biscuit είναι Ed25519/ECDSA secp256r1, disallowed μετά το 2035 κατά NIST IR 8547 (ipd). Τα Macaroons (HMAC) είναι συμμετρικά και άρα PQ-ανθεκτικά, αλλά απαιτούν κοινό μυστικό στον verifier: trade-off, όχι αυστηρά ανώτερα. | σήμερα · μέση | [Biscuit SPECIFICATIONS, n.d.](https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md) · [SPIFFE, n.d.](https://spiffe.io/docs/latest/spiffe-about/overview/) · [Progent, 2025](https://arxiv.org/abs/2504.11703) · [Macaroons, 2014](https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/) |
| INV-C07 | ισχύει → **αλλάζει με** DEC-SEC-01 | Lawful Capability Envelope: κάθε εκτελεσμένη επίδραση έχει capability token εντός του δηλωμένου νόμιμου πεδίου· token εκτός πεδίου δεν εκδίδεται (Tier 0). | Ο μηχανισμός είναι υλοποιήσιμος και τυπικά αναλύσιμος: έκδοση token με Cedar-class πολιτική (ADR-0010), με αποδείξεις σε Lean και sound/complete encoding. Το «νόμιμο πεδίο» όμως είναι νομικό περιεχόμενο (LAW-09, EXP-19) και δεν αποφασίζεται μηχανικά. Προτείνεται κανόνας σύνθεσης κατά Agents Rule of Two: συνεδρία με untrusted input, sensitive data και external effect απαιτεί έγκριση Principal. | σήμερα · μέση | [Cedar, 2024](https://arxiv.org/abs/2403.04651) · [Agents Rule of Two, 2025](https://ai.meta.com/blog/practical-ai-agent-security/) |
| INV-S03 | **υπάρχει αυστηρά ανώτερο** | Εκτελούνται μόνο reproducible (δύο ανεξάρτητοι builders συμφωνούν), υπογεγραμμένα artifacts με SBOM/SLSA provenance (Tier 1, formal artifact «—»)· kernel plane μόνο υπογεγραμμένα reproducible artifacts· admission μόνο υπογεγραμμένων images με SLSA provenance. | Ανώτερο: Για το kernel TCB: full-source bootstrapped + reproducible + k-of-n multi-party signed builds (stagex/Guix-class), με in-toto/SLSA provenance και διανομή μέσω TUF. Κυριαρχεί στο κριτήριο ακεραιότητας. Trade-off: κόστος χρόνου build· πλήρης κάλυψη σύγχρονων εκδόσεων Rust στο stagex ανεπιβεβαίωτη.<br>Η απαίτηση είναι ήδη αυστηρότερη από το SLSA v1.2, που δεν απαιτεί reproducibility σε κανένα Build level. Όμως οι «δύο builders συμφωνούν» πάνω στο ίδιο binary seed toolchain αφήνουν common-mode trusting-trust. Το full-source bootstrap (Guix: seed 357 B, με Guile driver 25 MiB ως υπόλοιπο εμπιστοσύνης· stagex: seed <190 B, deterministic, 4 υπογράφοντες) μαζί με DDC περιορίζουν δραστικά αυτόν τον κίνδυνο. Το Rust είναι bootstrappable από πηγή μέσω mrustc (Guix, 2018). | σήμερα · μέση | [SLSA v1.2 build track, n.d.](https://slsa.dev/spec/v1.2/build-track-basics) · [Guix full-source bootstrap, 2023](https://guix.gnu.org/en/blog/2023/the-full-source-bootstrap-building-from-source-all-the-way-down/) · [Guix: Bootstrapping Rust, 2018](https://guix.gnu.org/en/blog/2018/bootstrapping-rust/) · [StageX, n.d.](https://stagex.tools/) · [DDC, 2009](https://dwheeler.com/trusting-trust/) |
| REQ-SEC-002 | ισχύει → **αλλάζει με** DEC-SEC-06 | Εκτελούνται μόνο reproducible, υπογεγραμμένα artifacts με SBOM/provenance (OPS-01, KRN-04· ICD-04· S03· VT-803). | Ως απαίτηση ισχύει και επαληθεύεται με VT-803 (unsigned refusal) και in-toto attestations. Το SBOM να είναι SPDX ή CycloneDX 1.7 / ECMA-424, με CBOM. Η αυστηροποίηση του μηχανισμού αφορά την INV-S03. Δεν βρέθηκε αυστηρά ανώτερη διατύπωση. | σήμερα · υψηλή | [in-toto attestation, n.d.](https://github.com/in-toto/attestation) · [CycloneDX overview, 2025](https://cyclonedx.org/specification/overview/) |
| CMP-OPS-01 | **υπάρχει αυστηρά ανώτερο** | Build & Release Chain: Nix reproducible builds, OCI images, SLSA provenance, υπογραφές, SBOM, release attestation· μη αναπαραγώγιμο build → απόρριψη (δύο ανεξάρτητοι builders συμφωνούν)· Nix, OCI, sigstore-class signing. | Ανώτερο: Build chain με:<br>- bootstrappable + reproducible builds με ρητή επαλήθευση ανά artifact·<br>- k-of-n υπογραφές·<br>- SLSA Build + Source provenance·<br>- self-hosted transparency log·<br>- διανομή μέσω TUF.<br>(1) Το πρόχειρο δεν στηρίζεται σε εγγύηση του Nix (που δεν υπάρχει)· ελέγχει την αναπαραγωγιμότητα ανά build. Θέμα μόνο ορολογίας: «Nix builds με ελεγμένη αναπαραγωγιμότητα».<br>(2) Λείπουν full-source bootstrap και multi-party signing (stagex/Guix).<br>(3) Λείπει TUF για τη διανομή στους organ hosts (rollback, freeze, mix-and-match).<br>(4) Το Rekor v2 (GA 10/2025) υποστηρίζει ιδιωτικούς operators (POSIX/MySQL backends) για κυρίαρχο DP-2· το witnessing ανακοινώθηκε ως επερχόμενο· εναλλακτικά Sigsum.<br>(5) Το SLSA v1.2 Source track καλύπτει και την πηγή.<br>(6) Αν το προϊόν διατίθεται στην αγορά, οι υποχρεώσεις αναφοράς του CRA ισχύουν ήδη από 11/9/2026. | σήμερα · μέση | [NixOS reproducibility, n.d.](https://reproducible.nixos.org/) · [StageX, n.d.](https://stagex.tools/) · [Rekor v2 GA, 2025](https://blog.sigstore.dev/rekor-v2-ga/) · [TUF specification, 2026](https://theupdateframework.github.io/specification/latest/) · [Cyber Resilience Act, 2024](https://digital-strategy.ec.europa.eu/en/policies/cyber-resilience-act) |
| ADR-0018 | **υπάρχει αυστηρά ανώτερο** | Crypto-shredding με διατήρηση δεσμεύσεων [X]: προσωπικά δεδομένα κρυπτογραφημένα με κλειδί ανά υποκείμενο· το ledger κρατά μόνο δεσμεύσεις· διαγραφή = καταστροφή κλειδιού + erasure Control· γενεαλογία (hashes) επαληθεύσιμη· νομική επάρκεια: EXP-19. | Ανώτερο: Ιεραρχία EDPB/CNIL:<br>- στο ledger μόνο perfectly hiding (ή keyed) commitments·<br>- cid πάντα στο ciphertext, ποτέ στο plaintext·<br>- ciphertext με AES-256 (symmetric, σημαντικά λιγότερο ευάλωτο κατά NIST IR 8547), όχι σε μόνιμα αρχεία·<br>- καταστροφή κλειδιού και witness (cryptographic erase, SP 800-88r2).<br>Αφαιρεί την εναπομένουσα linkability και κρατά τις consistency proofs του append-only.<br>Η κατεύθυνση συμφωνεί με EDPB και CNIL, με προϋποθέσεις που λείπουν.<br>(α) Κατά EDPB τα κρυπτογραφημένα δεδομένα παραμένουν προσωπικά και η κρυπτογράφηση «overtaken by time» αν διατηρείται επ' αόριστον· αυτό αφορά replicas του CAS και offline cold archive.<br>(β) Το πρόχειρο δεν ορίζει τον τύπο των «δεσμεύσεων» ούτε αν το cid (canonical bytes, JCS) υπολογίζεται σε plaintext ή σε envelope. Αν σε plaintext, είναι unsalted hash που επιτρέπει επιβεβαίωση υποθέσεων μετά τη διαγραφή. Ο EDPB κρίνει τέτοια hashes κατά κανόνα ανεπαρκή για δημόσιο blockchain· κατ' αναλογία για ιδιωτικό ledger.<br>(γ) Η CNIL δίνει ρητή σειρά commitment > keyed hash > ciphertext.<br>Το C-413/23 P (σχετική έννοια προσωπικών δεδομένων) στηρίζει μέρος της ανάλυσης· το [X] παραμένει σωστό. | πείραμα · μέση | [EDPB Guidelines 02/2025 PDF, 2025](https://www.edpb.europa.eu/system/files/2025-04/edpb_guidelines_202502_blockchain_en.pdf) · [CNIL Blockchain guidance, 2018](https://www.cnil.fr/sites/default/files/atoms/files/blockchain_en.pdf) · [CJEU C-413/23 P, 2025](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:62023CJ0413) · [NIST SP 800-88 Rev. 2, 2025](https://csrc.nist.gov/pubs/sp/800/88/r2/final) |
| KT-16 | **κενό** | Διαγραφή GDPR έναντι append-only: περιεχόμενο μη ανακτήσιμο (επαληθευμένη καταστροφή κλειδιού)· consistency proofs ισχύουν· καταγεγραμμένη διαγραφή· καθαρισμός παράγωγων indexes (GP-4· I03, C02, E01). | Το κριτήριο αφήνει εκτός:<br>(1) τη μη-συνδεσιμότητα των cids/δεσμεύσεων (δοκιμή dictionary confirmation), αν υπολογίζονται σε plaintext·<br>(2) αντίγραφα κλειδιών σε HSM backups και ciphertext σε cold archive·<br>(3) κατάλοιπα σε παρόχους μέσω TB-4·<br>(4) παράγωγα πέρα από indexes: embeddings, consolidated memories (AEO-04), weights του DP-4·<br>(5) εξαιρέσεις legal hold του Άρθρου 17(3)·<br>(6) τη σύγκρουση με το hash-tree renewal (RFC 4998).<br>Για την «επαληθευμένη καταστροφή» υπάρχει τυποποιημένη τεχνική (cryptographic erase, SP 800-88 Rev. 2)· δεν επαλήθευσα εδώ αν ορίζει μέθοδο απόδειξης. | σήμερα · υψηλή | [EDPB Guidelines 02/2025 PDF, 2025](https://www.edpb.europa.eu/system/files/2025-04/edpb_guidelines_202502_blockchain_en.pdf) · [RFC 4998, 2007](https://www.rfc-editor.org/rfc/rfc4998) · [NIST SP 800-88 Rev. 2, 2025](https://csrc.nist.gov/pubs/sp/800/88/r2/final) |
| REQ-SEC-003 | ισχύει | Επιβίωση σε partitions, Byzantine μέλη, απώλεια site και αποτυχίες ρολογιού (KT-04, KT-21, KT-22)· §7.5: RPO 0, f με n ≥ 3f+1 μέσω BFT ordering· ADR-0031: CRDT για μονότονα επίπεδα, BFT (HotStuff-family) για cross-site verdicts, witnesses + gossip. | Τα δομικά στοιχεία είναι ώριμα: HotStuff-family BFT με n ≥ 3f+1, witness cosigning (C2SP), k-of-n TSA (RFC 3161), Roughtime (draft-19, Experimental, malfeasance reports). Το HotStuff-2 (2023) μειώνει τις φάσεις από τρεις σε δύο μέσα στην ίδια οικογένεια· βελτίωση, όχι αλλαγή verdict. Επιφύλαξη: στο C2SP tlog-witness ο μηχανισμός monitor retrieval, που χρειάζεται για να μη διαχωρίζονται clients από monitors, είναι ακόμη υπό συζήτηση. Προτείνεται ≥1 eIDAS qualified TSA για νομικό τεκμήριο (Art. 41(2)). | σήμερα · μέση | [HotStuff, 2018](https://arxiv.org/abs/1803.05069) · [HotStuff-2, 2023](https://eprint.iacr.org/2023/397) · [C2SP tlog-witness, n.d.](https://c2sp.org/tlog-witness) · [draft-ietf-ntp-roughtime, 2026](https://datatracker.ietf.org/doc/draft-ietf-ntp-roughtime/) |
| REQ-SEC-006 | ισχύει | Απομόνωση confidentiality domains και στη δρομολόγηση παρόχων (KRN-11, KRN-08, COG-01· ICD-08, ICD-11, ICD-22· INV-L03· VT-205, VT-805)· TB-3 μέσω Capability Gateway + residency· TB-4 μέσω Inference Gateway (redaction, residency, receipts)· Z3 μόνο allowlisted, residency-filtered πάροχοι. | Η απαίτηση είναι σωστή και υλοποιήσιμη: gateway, residency, τοπικά μοντέλα DP-2. Δύο ελλείψεις.<br>(1) Τα KV/semantic-cache timing side channels μεταξύ domains στους τοπικούς servers (TIFS)· μέτρο σήμερα: vLLM cache_salt ανά domain.<br>(2) Δεν υπάρχει attested egress. Το confidential inference (RATS/PCC-class) βοηθά, αλλά το TEE.fail εξήγαγε κλειδιά από Intel TDX/SGX και AMD SEV-SNP και παραβίασε το NVIDIA CC με interposer <1000$. Άρα ο TEE συμπληρώνει και δεν αντικαθιστά residency και local-only για privileged δεδομένα. | σήμερα · μέση | [The Early Bird Catches the Leak, 2024](https://arxiv.org/abs/2409.20002) · [vLLM prefix caching, n.d.](https://docs.vllm.ai/en/latest/design/prefix_caching.html) · [TEE.fail, 2026](https://tee.fail/) · [RFC 9334, 2023](https://www.rfc-editor.org/rfc/rfc9334) |

## Κενά που δεν καλύπτει καθόλου το πρόχειρο

### GAP-SEC-01 — Λείπει η αφήγηση §18 και το threat model

*σήμερα*

Η §18 (security/fault) δεν γράφτηκε ποτέ. Οι έδρες THREAT-MODEL, KEY-LIFECYCLE (το πρόχειρο αναφέρει τις KL-4, KL-5, KL-6, KL-7) και TRUST-BOOTSTRAP είναι ανεπαλήθευτες από εδώ. Το αρχείο verification/KILL-TESTS.md δεν υπάρχει στο docs/architecture-draft/. Δεν υπάρχει αντιστοίχιση σε OWASP LLM Top 10 2025, OWASP Agentic Top 10 2026, MITRE ATLAS ή LINDDUN.

**Γιατί μετρά:** Χωρίς threat model δεν ελέγχεται η πληρότητα των TB-1, TB-2, TB-3, TB-4, TB-5, TB-6, των INV-S01, INV-S02, INV-S03 και των VT-801, VT-802, VT-803, VT-804, VT-805.

**Τι δείχνει το ανώτερο:** Threat model χαρτογραφημένο σε OWASP LLM/Agentic και ATLAS (security) και σε LINDDUN (privacy), με ίχνος προς invariants και tests.

**Πηγές:** [OWASP Top 10 for LLM Applications 2025, 2025](https://genai.owasp.org/llm-top-10/) · [MITRE ATLAS data, 2026](https://github.com/mitre-atlas/atlas-data) · [LINDDUN, n.d.](https://linddun.org/)

### GAP-SEC-02 — Επιθέσεις ροής δεδομένων και κανόνας σύνθεσης

*πείραμα*

Το πρόχειρο εμποδίζει «εντολές» από περιεχόμενο, αλλά όχι exfiltration ή αλλοίωση arguments μέσω εξουσιοδοτημένων ενεργειών. Δεν υπάρχουν IFC labels στο sink ούτε κανόνας τύπου Rule of Two.

**Γιατί μετρά:** Κύρια επιφάνεια επίθεσης σε νομικό AI με εμπιστευτικά δεδομένα.

**Τι δείχνει το ανώτερο:** CaMeL/FIDES: labels ακεραιότητας και εμπιστευτικότητας σε κάθε τιμή, πολιτική στο KRN-11· Progent για privilege ανά tool/argument· Rule of Two για αυτονομία συνεδρίας.

**Πηγές:** [FIDES, 2025](https://arxiv.org/abs/2505.23643) · [CaMeL, 2025](https://arxiv.org/abs/2503.18813) · [Agents Rule of Two, 2025](https://ai.meta.com/blog/practical-ai-agent-security/)

### GAP-SEC-03 — Πιθανή linkability των cids/δεσμεύσεων μετά το shredding

*σήμερα*

Το ICD-02 υπολογίζει το cid από canonical bytes (JCS)· η §9.8 λέει ότι το ledger κρατά «δεσμεύσεις» χωρίς να ορίζει τύπο. Δεν ορίζεται αν για προσωπικά δεδομένα το cid υπολογίζεται σε plaintext ή σε envelope. Αν σε plaintext, είναι unsalted hash που μένει μόνιμα στο ledger και στα replicas.

**Γιατί μετρά:** Ο EDPB κρίνει τα unsalted/unkeyed hashes κατά κανόνα ανεπαρκή (για δημόσιο blockchain)· μετά τη διαγραφή ένα τέτοιο cid επιβεβαιώνει εικασίες για το περιεχόμενο.

**Τι δείχνει το ανώτερο:** Perfectly hiding ή keyed commitments στο ledger, cid στο ciphertext, διαγραφή witness και key (CNIL: commitment > keyed hash > ciphertext· EDPB 02/2025).

**Πηγές:** [EDPB Guidelines 02/2025 PDF, 2025](https://www.edpb.europa.eu/system/files/2025-04/edpb_guidelines_202502_blockchain_en.pdf) · [CNIL Blockchain guidance, 2018](https://www.cnil.fr/sites/default/files/atoms/files/blockchain_en.pdf)

### GAP-SEC-04 — Hash-tree renewal έναντι crypto-shredding

*σήμερα*

Το hash-tree renewal απαιτεί τα αρχειοθετημένα δεδομένα (RFC 4998). Αν οι δεσμεύσεις αφορούν plaintext ή αν διαγράφεται το ciphertext, το renewal είναι αδύνατο μετά το shredding. Το πρόχειρο δεν ορίζει τι γίνεται με τα διαγραμμένα αντικείμενα όταν σπάσει ένα hash.

**Γιατί μετρά:** Αντίφαση ανάμεσα σε INV-X02 και ADR-0018 που θα εμφανιστεί στην πρώτη μετάβαση hash.

**Τι δείχνει το ανώτερο:** ERS με δύο τύπους renewal. Για τα διαγραμμένα, δική μας πρόταση και όχι SOTA: dual-hash commitments από την εγγραφή ή ρητή κατάσταση «erased, non-renewable».

**Πηγές:** [RFC 4998, 2007](https://www.rfc-editor.org/rfc/rfc4998)

### GAP-SEC-05 — Backdating μετά από compromise κλειδιού σώματος

*σήμερα*

Η INV-I04 κρίνει την εγκυρότητα με βάση «τη στιγμή της υπογραφής» και το ICD-03 λέει «ανάκληση αποτελεσματική από τον χρόνο της». Δεν ορίζεται ρητά ότι ο χρόνος είναι ledger-inclusion ή TSA. Για υπογραφές εκτός ledger, ο κάτοχος διαρρεύσαντος κλειδιού μπορεί να οπισθοχρονολογήσει. Το KT-18 δεν το ελέγχει.

**Γιατί μετρά:** Χωρίς αυτό το «post-revocation signatures rejected» παρακάμπτεται.

**Τι δείχνει το ανώτερο:** Εγκυρότητα μόνο με witnessed ή TSA-anchored χρόνο (KERI receipts, RFC 3161).

**Πηγές:** [KERI v1.1, n.d.](https://trustoverip.github.io/kswg-keri-specification/) · [RFC 3161, 2001](https://www.rfc-editor.org/rfc/rfc3161)

### GAP-SEC-06 — Signing oracle χωρίς domain separation

*σήμερα*

Το ICD-03 Sign(payload, kid) υπογράφει αυθαίρετα bytes, χωρίς typed payload ή domain tag ανά πρωτόκολλο (charter, delegation, gate verdict, checkpoint, effect receipt).

**Γιατί μετρά:** Cross-protocol reuse υπογραφών σε σύστημα με πολλά είδη υπογεγραμμένων πράξεων.

**Τι δείχνει το ανώτερο:** Το FIPS 204 έχει προαιρετικό ctx (κενό στο X.509 profile του RFC 9881, άρα ορίζεται ανά profile)· το composite ML-DSA δεσμεύει Prefix/Label· typed signing API με υποχρεωτικό domain tag.

**Πηγές:** [RFC 9881, 2025](https://www.rfc-editor.org/rfc/rfc9881) · [draft-ietf-lamps-pq-composite-sigs, 2026](https://datatracker.ietf.org/doc/draft-ietf-lamps-pq-composite-sigs/)

### GAP-SEC-07 — Ελλιπή trust boundaries

*σήμερα*

Τα TB-1, TB-2, TB-3, TB-4, TB-5, TB-6 δεν περιλαμβάνουν:<br>- όριο build/supply chain·<br>- όριο key ceremony (το Z0 είναι ζώνη δικτύου, όχι TB)·<br>- κανάλι Principal/δημιουργού (social engineering, τα out-of-band κανάλια του KT-23)·<br>- tool/organ metadata ως OBSERVED.

**Γιατί μετρά:** Τα πιο κρίσιμα σημεία (root, build, άνθρωπος) μένουν χωρίς ρητό όριο και σημείο διέλευσης.

**Τι δείχνει το ανώτερο:** Ρητά όρια για build (SLSA/in-toto, TUF), key ceremony (HSM, PKCS#11) και ανθρώπινο κανάλι· αντιστοίχιση στις ταξινομίες OWASP (LLM03 Supply Chain, LLM06 Excessive Agency) και ATLAS.

**Πηγές:** [SLSA specification, n.d.](https://slsa.dev/spec/) · [OWASP Top 10 for LLM Applications 2025, 2025](https://genai.owasp.org/llm-top-10/)

### GAP-SEC-08 — Χρονοδιάγραμμα PQ και κρυπτογραφική απογραφή

*σήμερα*

Η δοκιμή μετάβασης (KT-09, EXP-11) τοποθετείται στο GP-9, την τελευταία φάση, χωρίς ημερομηνίες και χωρίς CBOM. Το ADR-0016 αναφέρει ML-KEM αλλά όχι hybrid KEM για το TLS, παρά τον κίνδυνο harvest-now-decrypt-later για εμπιστευτικά matters.

**Γιατί μετρά:** NIST IR 8547 (ipd): deprecated μετά το 2030, disallowed μετά το 2035· EU PQC roadmap από 23/6/2025.

**Τι δείχνει το ανώτερο:** X25519MLKEM768 σήμερα (RFC 10024, OpenSSL 3.5 default), CBOM (CycloneDX 1.7 / ECMA-424), χρονοδιάγραμμα ευθυγραμμισμένο με IR 8547 και το ευρωπαϊκό roadmap.

**Πηγές:** [NIST IR 8547 ipd PDF, 2024](https://nvlpubs.nist.gov/nistpubs/ir/2024/NIST.IR.8547.ipd.pdf) · [RFC 10024, 2026](https://www.rfc-editor.org/rfc/rfc10024) · [OpenSSL 3.5 notes, 2025](https://openssl-library.org/news/openssl-3.5-notes/)

### GAP-SEC-09 — Side channels στο LLM serving μεταξύ confidentiality domains

*σήμερα*

Το VT-805 και η INV-L03 δεν καλύπτουν ρητά timing channels από κοινόχρηστα KV/semantic caches στους τοπικούς model servers.

**Γιατί μετρά:** Διαρροή prompts μεταξύ matters χωρίς καμία ρητή ροή δεδομένων.

**Τι δείχνει το ανώτερο:** Cache ανά confidentiality domain (π.χ. vLLM cache_salt) ή απενεργοποίηση του prefix sharing· ρητό test timing leakage στο VT-805.

**Πηγές:** [The Early Bird Catches the Leak, 2024](https://arxiv.org/abs/2409.20002) · [vLLM prefix caching, n.d.](https://docs.vllm.ai/en/latest/design/prefix_caching.html)

### GAP-SEC-10 — Κενά κάλυψης διαγραφής

*πείραμα*

Το KT-16 και η §9.8 δεν αναφέρουν:<br>- replicas και offline cold archive (§7.4)·<br>- backups κλειδιών στο HSM·<br>- κατάλοιπα σε παρόχους (TB-4)·<br>- consolidated memories, embeddings και weights (DP-4)·<br>- legal hold.

**Γιατί μετρά:** Η διαγραφή μένει ημιτελής σε σημεία που ο EDPB θεωρεί ευάλωτα («overtaken by time»).

**Τι δείχνει το ανώτερο:** Απογραφή όλων των αντιγράφων, symmetric-only ciphertext, πολιτική διατήρησης ανά αντίγραφο, cryptographic erase (SP 800-88r2) και test ανά παράγωγο.

**Πηγές:** [EDPB Guidelines 02/2025 PDF, 2025](https://www.edpb.europa.eu/system/files/2025-04/edpb_guidelines_202502_blockchain_en.pdf) · [NIST SP 800-88 Rev. 2, 2025](https://csrc.nist.gov/pubs/sp/800/88/r2/final)

### GAP-SEC-11 — Κανονιστικό security πλαίσιο πέρα από GDPR

*πείραμα*

Η §2.5 αναφέρει GDPR, AI Act (ταξινόμηση, διαφάνεια, καταγραφή, εποπτεία), Κώδικα Δικηγόρων, eIDAS και NIS2. Δεν αναφέρει τον CRA (αναφορές από 11/9/2026, κύριες υποχρεώσεις από 11/12/2027) ούτε το Άρθρο 15(5) του AI Act για ανθεκτικότητα σε poisoning, adversarial και confidentiality attacks.

**Γιατί μετρά:** Αν εφαρμόζονται, διαμορφώνουν τα CMP-OPS-01, VT-801 και VT-802 και τη διαχείριση ευπαθειών.

**Τι δείχνει το ανώτερο:** Επέκταση του EXP-19 με ανάλυση εφαρμοσιμότητας CRA και AI Act Art. 15.

**Πηγές:** [Cyber Resilience Act, 2024](https://digital-strategy.ec.europa.eu/en/policies/cyber-resilience-act) · [AI Act Article 15, 2024](https://artificialintelligenceact.eu/article/15/)

### GAP-SEC-12 — Εσωτερικές ασάφειες SEC στο πρόχειρο

*σήμερα*

(1) Το Z0 λέει «threshold shares, φυσική παρουσία, M-of-N» χωρίς να ορίζει αν αφορά πρόσωπα ή συσκευές· το EP-04 περιορίζει τα threshold σχήματα «μόνο μεταξύ συσκευών του κυρίαρχου (KL-7)».<br>(2) Το CMP-KRN-03 [T] προβλέπει «threshold root keys», ενώ το EP-04 κατατάσσει τα threshold σχήματα ως επέκταση· PQ threshold δεν είναι τυποποιημένο.<br>(3) Η διατύπωση του KT-09 «post-quantum hash/signature failure» δεν ορίζει αν εννοεί σπάσιμο PQ αλγορίθμου ή κβαντική επίθεση.<br>(4) Το 24.md και η §6.2 παραπέμπουν στο verification/KILL-TESTS.md, που δεν υπάρχει εδώ.<br>(5) Η INV-S01 και η INV-S03 (Tier 1) δεν έχουν formal artifact («—»).

**Γιατί μετρά:** Κάθε ασάφεια θα γινόταν ελάττωμα στο SysML model.

**Τι δείχνει το ανώτερο:** Επίλυση πριν τη δόση 1: KL-7 ως κανόνας k-of-n συσκευών ενός προσώπου· multisignature αντί threshold signature· αποσαφήνιση του KT-09· formal artifact για INV-S01 κατά το μοντέλο FIDES.

**Πηγές:** [RFC 9591 FROST, 2024](https://www.rfc-editor.org/rfc/rfc9591) · [NIST Threshold Cryptography, 2026](https://csrc.nist.gov/projects/threshold-cryptography) · [FIDES, 2025](https://arxiv.org/abs/2505.23643)

## Δεν ξέρω

- Τρέχουσα κατάσταση του FIPS 206 (FN-DSA): η σελίδα PQC της NIST λέει μόνο ότι το Falcon είναι «underway».
- Αν δημοσιεύτηκε draft πρότυπο HQC ως τον Σεπτέμβριο 2026 (ορίζοντας ~2 ετών από 11/3/2025).
- Αν το NIST IR 8547 οριστικοποιήθηκε· η σελίδα δείχνει μόνο το ipd της 12/11/2024.
- Χρονοδιάγραμμα CNSA 2.0 (δεν επαληθεύτηκε).
- Ορόσημα του ευρωπαϊκού PQC roadmap: η σελίδα δείχνει μόνο την ημερομηνία 23/6/2025.
- Αν υπάρχει τελική έκδοση των EDPB Guidelines 02/2025 μετά τη διαβούλευση (έληξε 9/6/2025)· δύο υποψήφια URLs της EDPB επέστρεψαν 404.
- Αριθμός RFC και τελική μορφή του composite ML-DSA (RFC Editor queue από 4/2026).
- Ωριμότητα threshold ML-DSA και ποιες PQ υποβολές υπάρχουν στο NIST MPTS.
- Ποια HSM έχουν επικύρωση FIPS 140-3 για ML-DSA/SLH-DSA, και αν το SP 800-88r2 ορίζει μέθοδο επαλήθευσης του cryptographic erase (για το «verified» του KT-16).
- Υποστήριξη PQ σουιτών και ωριμότητα παραγωγής στις υλοποιήσεις KERI.
- Αν οι σύγχρονες εκδόσεις του Rust toolchain καλύπτονται από full-source bootstrap στο stagex· για το Guix επιβεβαιώθηκε μόνο bootstrap μέσω mrustc (2018).
- Τρέχοντα ποσοστά reproducibility του NixOS (η σελίδα δεν τα δείχνει).
- Περιεχόμενο των λιστών του OWASP Top 10 for Agentic Applications 2026 και του OWASP Agentic AI Threats and Mitigations: οι σελίδες δείχνουν μόνο ημερομηνίες.
- Αν το GRAIL/LAWMAX υπάγεται στον CRA ή στην κατηγορία high-risk του AI Act, και η ημερομηνία εφαρμογής του Άρθρου 15.
- Utility της σχεδίασης CaMeL/FIDES σε νομικές ροές εργασίας: δεν έχει μετρηθεί πουθενά.
- Περιεχόμενο των THREAT-MODEL, KEY-LIFECYCLE (KL-4, KL-5, KL-6, KL-7) και TRUST-BOOTSTRAP: βρίσκονται στο άλλο repo· κάθε ισχυρισμός για as-built έδρες είναι ανεπαλήθευτος.
- Αν λύθηκε το monitor retrieval του C2SP tlog-witness και αν το Rekor v2 ενσωμάτωσε πλέον witnessing.
- Χρήση του HotStuff/HotStuff-2 σε παραγωγή: δεν επαληθεύτηκε, γι' αυτό η maturity του SOTA-SEC-20 είναι pilot.
- Ημερομηνία δημοσίευσης του RFC 9954 (η σελίδα δεν την έδειξε).

## Τι διόρθωσε ο ανεξάρτητος ελεγκτής

Πηγές που άνοιξε: 82 · δεν στέκονταν: 15 · διορθώσεις: 18

- **draft_points INV-S03 draft_ref:** «master §6.3 γρ.592, γρ.702» → «master §7.1 γρ.592· §7.7 γρ.702». — Οι γραμμές 592 και 702 ανήκουν στις §7.1 και §7.7, όχι στην §6.3.
- **draft_points ICD-03:** Αφαιρέθηκε το «δεν υπάρχουν witness receipts για key events»· confidence high → medium. — Τα delegations/rotations είναι ledger events (KRN-03) και τα checkpoints του ICD-01 είναι witness co-signed· η KL-4 δεν είναι διαθέσιμη.
- **draft_points CMP-KRN-03, KT-23, INV-X01, INV-X02:** Confidence high → medium· προστέθηκε η επιφύλαξη για τις μη διαθέσιμες έδρες και η προϋπόθεση χωριστής φύλαξης των next keys. — Οι KEY-LIFECYCLE/TRUST-BOOTSTRAP ίσως ήδη καλύπτουν μέρος των προτάσεων· η KERI είναι pilot.
- **draft_points INV-X02, GAP-SEC-03, GAP-SEC-04, ADR-0018:** Η σύγκρουση με το crypto-shredding και η linkability διατυπώθηκαν υπό όρο (αν η δέσμευση/cid είναι σε plaintext)· το dual-hash σημειώνεται ως δική μας πρόταση, όχι SOTA· αφαιρέθηκε το «και στους witnesses». — Το πρόχειρο δεν ορίζει τύπο δέσμευσης ούτε αν το cid είναι σε plaintext ή envelope· οι witnesses υπογράφουν checkpoints, όχι μεμονωμένα cids.
- **draft_points KT-09/REQ-SEC-004 και GAP-SEC-12:** Το «λάθος πλαισίωση» έγινε «ασάφεια διατύπωσης». — Το «post-quantum hash/signature failure» μπορεί να σημαίνει σπάσιμο PQ αλγορίθμου, που είναι νόμιμο σενάριο.
- **draft_points CMP-OPS-01 και DEC-SEC-06:** Το «Nix reproducible είναι υπερβολή» έγινε θέμα ορολογίας· το μειονέκτημα του προχείρου είναι το κοινό seed. — Το πρόχειρο απορρίπτει μη αναπαραγώγιμα builds με δύο builders και δεν στηρίζεται σε εγγύηση της Nix.
- **GAP-SEC-12:** Μετονομάστηκε σε «ασάφειες»· αφαιρέθηκε το σημείο Nix· προστέθηκαν η σύγκρουση CMP-KRN-03 [T] με EP-04 [E] και η απουσία formal artifact στην INV-S03· επιβεβαιώθηκε ότι το KILL-TESTS.md δεν υπάρχει. — Έλεγχος κειμένου του προχείρου.
- **SOTA-SEC-04, ADR-0016, GAP-SEC-08:** Προστέθηκαν RFC 10024 (X25519MLKEM768, SecP256r1MLKEM768, SecP384r1MLKEM1024, Proposed Standard 2026) και RFC 9954. — Το draft-ietf-tls-ecdhe-mlkem δημοσιεύτηκε ως RFC· αυτό στηρίζει τον ισχυρισμό για «τυποποιημένα TLS groups».
- **SOTA-SEC-16 και summary:** EDPB: υιοθέτηση 8/4/2025, v1.1, διαβούλευση έως 9/6/2025· οι unsalted hashes αφορούν δημόσιο blockchain· η ρητή σειρά προτίμησης αποδίδεται στη CNIL (2018). — Κείμενο των PDF.
- **SOTA-SEC-01:** Το HQC χαρακτηρίζεται «δεύτερος KEM μετά το ML-KEM», όπως στην ανακοίνωση. — Διατύπωση της ανακοίνωσης NIST της 11/3/2025.
- **SOTA-SEC-05:** Σημειώθηκε ότι το multihash δεν είναι πρότυπο και ότι το RFC 8725 αφορά JWT (εφαρμογή κατ' αναλογία). — Σελίδες multiformats.io και RFC 8725.
- **SOTA-SEC-12:** Προστέθηκε η πλήρης λίστα LLM Top 10 2025 και οι 7 κατηγορίες LINDDUN· αφαιρέθηκε η μη επαληθευμένη λίστα OWASP Agentic. — Επαληθευμένο περιεχόμενο.
- **SOTA-SEC-14, SOTA-SEC-15, SOTA-SEC-20, INV-S02:** Προστέθηκαν Guix Rust bootstrap (mrustc, 2018), Macaroons (trade-off PQ/κοινό μυστικό) και HotStuff-2. — Έλεγχοι για αυστηρά ανώτερες εναλλακτικές των holds· καμία δεν άλλαξε verdict.
- **sota νέα SOTA-SEC-21, SOTA-SEC-22:** Προστέθηκαν NIST SP 800-88 Rev. 2 (cryptographic erase) και vLLM cache_salt. — Τυποποιημένη τεχνική για το KT-16 και μέτρο διαθέσιμο σήμερα για τα GAP-SEC-09 και REQ-SEC-006.
- **Ονοματολογία IDs (GAP-SEC-01, GAP-SEC-07, unknowns):** Τα εύρη «TB-1..6», «INV-S01..S03», «VT-801..805», «KL-1..7», «E1–E6, Θ1–Θ14», «ASI01–ASI10» αντικαταστάθηκαν με απαρίθμηση ένα-ένα ή αφαιρέθηκαν. — Κανόνας 7: IDs ένα-ένα, ποτέ εύρος.
- **DEC-SEC-04:** Προστέθηκε η εναλλακτική PQ-only. — Η ερώτηση την ανέφερε, αλλά έλειπε από τις εναλλακτικές (δίκαιη παρουσίαση).
- **draft_points draft_refs (REQ-SEC-003, REQ-SEC-006, ADR-0018, INV-S02, INV-C07):** Προστέθηκαν ακριβείς γραμμές: 22.md γρ.37 (ADR-0031), master §2.4 γρ.229–230, §7.3 γρ.620, §9.8 γρ.896, 15.md γρ.27/33, 29.md γρ.147. — Επιβεβαιώθηκαν με ανάγνωση των αρχείων.
- **Κάλυψη IDs:** Καμία προσθήκη: και τα 24 ανατεθέντα IDs βρίσκονται σε draft_points. — Έλεγχος κάλυψης: CMP-KRN-03, CMP-OPS-01, ICD-03, INV-C07, INV-X01, INV-X02, INV-S01, INV-S02, INV-S03, KT-09, KT-16, KT-17, KT-18, KT-23, EXP-11, ADR-0016, ADR-0018, EP-04, REQ-SEC-001, REQ-SEC-002, REQ-SEC-003, REQ-SEC-004, REQ-SEC-005, REQ-SEC-006.
