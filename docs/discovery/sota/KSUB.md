# World OS / πυρήνας — υπόστρωμα — το ανώτερο σήμερα (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

### C2SP tlog-tiles / tlog-checkpoint / tlog-cosignature / tlog-witness

*standard, production* · SOTA-KSUB-01

Στατικό HTTP API tiles για transparency logs. Όλες οι Merkle πράξεις γίνονται κατά RFC 6962, με μόνο SHA-256, και ο client υπολογίζει μόνος τα inclusion/consistency proofs από cacheable tiles. Checkpoint είναι ένα signed note (origin, size, root) που δέχεται πολλαπλές υπογραφές, με τις άγνωστες να αγνοούνται. Για τον log προβλέπεται SHOULD Ed25519, αλλά επιτρέπεται και άλλος note αλγόριθμος. Η cosignature v1.0.1 (28/3/2026) είναι μόνο Ed25519· το v1.1.0-rc.1 (23/4/2026) προσθέτει ML-DSA-44 ως SHOULD για νέες εγκαταστάσεις. Ο witness (v1.0.0, 31/3/2026) κρατά μόνο το τελευταίο επαληθευμένο checkpoint ανά log και συνυπογράφει μόνο μετά από έγκυρο consistency proof. Ο μηχανισμός ανάκτησης από monitors κατά του split-view είναι «still under discussion».

**Για το GRAIL:** Υποψήφιο προφίλ για τα proofs, τα checkpoints και το witnessing του CMP-KRN-01/ICD-01 και του REQ-KRN-002.

**Πηγές:** [C2SP tlog-tiles, 2026](https://c2sp.org/tlog-tiles) · [C2SP tlog-checkpoint, 2026](https://c2sp.org/tlog-checkpoint) · [C2SP tlog-cosignature (v1.0.1), 2026](https://c2sp.org/tlog-cosignature) · [C2SP tlog-cosignature v1.1.0-rc.1 (ML-DSA-44), 2026](https://github.com/C2SP/C2SP/blob/tlog-cosignature/v1.1.0-rc.1/tlog-cosignature.md) · [C2SP tlog-witness, 2026](https://c2sp.org/tlog-witness) · [C2SP tags, 2026](https://github.com/C2SP/C2SP/tags)

### Tessera (transparency-dev) + Sigstore Rekor v2

*tool, production* · SOTA-KSUB-02

Go βιβλιοθήκη για tile-based logs, «logical successor» του Trillian v1. Η v1.0.0 κυκλοφόρησε στις 22/9/2025, ενώ το README τη δηλώνει production ready ήδη από το v0.2.0 beta. Έχει drivers POSIX, AWS και GCP, antispam, σύγχρονη δημοσίευση μέσω PublicationAwaiter και C2SP tlog-witness με witness policies. Το Trillian δηλώνει maintenance mode και συστήνει Tessera σε νέους operators. Το Rekor v2 έγινε GA στις 10/10/2025 με tile-backed backend Tessera και public-good instance με 99.5% SLO. Στις 28/6/2026 όμως το Sigstore δήλωσε ότι το sigstore.dev κρατά το Rekor v1 ως default «for the foreseeable future», λόγω breaking changes στους clients και της επερχόμενης PQC μετάβασης.

**Για το GRAIL:** Αποδεδειγμένη υλοποίηση του προφίλ C2SP, με sovereign POSIX backend (EP-05). Η απόφαση του Sigstore δείχνει ότι η PQ μετάβαση των tlogs θεωρείται ακόμη ανοιχτή.

**Πηγές:** [transparency-dev/tessera, 2026](https://github.com/transparency-dev/tessera) · [Tessera v1.0.0 release (GitHub API), 2025](https://api.github.com/repos/transparency-dev/tessera/releases/tags/v1.0.0) · [google/trillian README (maintenance mode), 2026](https://github.com/google/trillian) · [sigstore/rekor-tiles README, 2025](https://raw.githubusercontent.com/sigstore/rekor-tiles/main/README.md) · [Rekor v2 GA, 2025](https://blog.sigstore.dev/rekor-v2-ga/) · [sigstore.dev and Rekor evolution, 2026](https://blog.sigstore.dev/rekor-evolution/)

### RFC 9162 (CT 2.0) — καθεστώς

*standard, production* · SOTA-KSUB-03

Experimental RFC του 2021 που κάνει obsolete το RFC 6962. Εισάγει IANA registry hash algorithms, με τον αλγόριθμο ως αμετάβλητη παράμετρο κάθε log. Το Static CT API κρατά το write path του RFC 6962, αντικαθιστά το read path με tiles και δεν αναφέρει το RFC 9162.

**Για το GRAIL:** Το πρόχειρο βασίζει τα proofs στο RFC 9162. Η ευελιξία του είναι ευελιξία ανά log, όχι μέσα στο ίδιο log, άρα το trade-off έναντι των tiles είναι στενότερο απ' όσο φαίνεται.

**Πηγές:** [RFC 9162 info page, 2021](https://www.rfc-editor.org/info/rfc9162) · [RFC 9162 text, 2021](https://www.rfc-editor.org/rfc/rfc9162) · [C2SP Static CT API, 2026](https://c2sp.org/static-ct-api)

### Witness Network / Sigsum

*system, pilot* · SOTA-KSUB-04

Το Witness Network είναι κοινοτική υπηρεσία που τηρεί λίστες εγκεκριμένων logs και witnesses πάνω στο C2SP tlog-witness και δηλώνει «experimental / work-in-progress». Το Sigsum είναι σύστημα διαφάνειας υπογραφών με threshold witnesses. Καμία από τις δύο σελίδες δεν έχει ημερομηνία.

**Για το GRAIL:** Προσφέρει ανεξάρτητους witnesses (SH-11) χωρίς bespoke «witness gossip». Η ωριμότητά του είναι χαμηλή.

**Πηγές:** [Witness Network, 2026](https://witness-network.org/) · [Sigsum, 2026](https://www.sigsum.org/)

### AT Protocol repositories + DASL/DRISL

*system, production* · SOTA-KSUB-05

Ένα repository ανά account, με signed commits, Merkle Search Tree (SHA-256, fanout 4), CID links και κωδικοποίηση DRISL CBOR. Τα signing keys είναι rotatable μέσω του DID document, και το repo εξάγεται σε CAR v1. Το DASL είναι αυστηρό υποσύνολο IPFS CIDs/IPLD· το DRISL είναι deterministic CBOR profile. Στηρίζει τον γράφο του Bluesky.

**Για το GRAIL:** Αποδεικνύει σε μεγάλη κλίμακα το μοτίβο «υπογεγραμμένη, content-addressed ιστορία ανά ταυτότητα με έναν συγγραφέα». Είναι άμεσο ανάλογο των KRN-01/02 και του INV-I04.

**Πηγές:** [AT Protocol Repository spec, 2026](https://atproto.com/specs/repository) · [DASL, 2026](https://dasl.ing/)

### CIDv1 (multicodec + multihash)

*standard, production* · SOTA-KSUB-06

Αυτο-περιγραφόμενη διεύθυνση <version><content-type multicodec><multihash>, με εκδόσεις ώστε η ίδια η μορφή να εξελίσσεται. Στον πίνακα multicodec το raw έχει code 0x55 (permanent) και το json-jcs code 0xb601 (draft).

**Για το GRAIL:** Προσθέτει την ετικέτα codec/canonicalization που λείπει από το {alg, digest} του ICD-02, και υπάρχει ήδη code για JCS.

**Πηγές:** [multiformats/cid, 2026](https://github.com/multiformats/cid) · [multicodec table.csv, 2026](https://raw.githubusercontent.com/multiformats/multicodec/master/table.csv)

### Deterministic serializations: RFC 8785 JCS, CBOR CDE, dCBOR

*standard, pilot* · SOTA-KSUB-07

Το JCS είναι Informational RFC (2020). Απαιτεί I-JSON και σειριοποιεί αριθμούς κατά ECMAScript· τα binary δεδομένα μόνο ως JSON strings (π.χ. Base64). Το CBOR CDE (draft-ietf-cbor-cde-13, 13/10/2025, intended BCP) είναι σήμερα Expired. Το dCBOR (draft-mcnally-deterministic-cbor-18, 10/8/2026) είναι ατομικό draft χωρίς IETF stream.

**Για το GRAIL:** Κανένα deterministic CBOR δεν είναι RFC. Το JCS επαρκεί για JSON, όχι για blobs.

**Πηγές:** [RFC 8785, 2020](https://www.rfc-editor.org/rfc/rfc8785) · [draft-ietf-cbor-cde, 2025](https://datatracker.ietf.org/doc/draft-ietf-cbor-cde/) · [draft-mcnally-deterministic-cbor, 2026](https://datatracker.ietf.org/doc/draft-mcnally-deterministic-cbor/)

### Hybrid Logical Clocks (Kulkarni, Demirbas et al.)

*research, production* · SOTA-KSUB-08

Το HLC διατηρεί την ιδιότητα e hb f ⇒ l.e < l.f, με \|l.e − pt.e\| φραγμένο και χώρο O(1). Χωρά στο 64-bit NTP timestamp και ανέχεται τα NTP kinks. Το CockroachDB υλοποιεί HLC· όταν ένας κόμβος διαπιστώσει ότι απέχει από τουλάχιστον τους μισούς κόμβους κατά 80% του μέγιστου offset, τερματίζεται αμέσως.

**Για το GRAIL:** Επιβεβαιώνει το ADR-0017 και δίνει συγκεκριμένη πολιτική για παραβίαση του ε (KT-21).

**Πηγές:** [Logical Physical Clocks and Consistent Snapshots in Globally Distributed Databases (tech report 2014-04), 2014](https://cse.buffalo.edu/tech-reports/2014-04.pdf) · [Murat Demirbas: Hybrid Logical Clocks, 2014](https://muratbuffalo.blogspot.com/2014/07/hybrid-logical-clocks.html) · [CockroachDB transaction layer (HLC, max offset), 2026](https://docs.cockroachlabs.com/docs/stable/architecture/transaction-layer) · [CockroachDB: Living without atomic clocks, 2022](https://www.cockroachlabs.com/blog/living-without-atomic-clocks/)

### Αυθεντικοποιημένος και νομικός χρόνος: NTS (RFC 8915), Roughtime, RFC 3161, eIDAS Art. 41

*standard, production* · SOTA-KSUB-09

Το NTS (Standards Track, 2020) δίνει αυθεντικοποίηση, anti-replay και TLS 1.3 key establishment στο NTP. Το Roughtime (draft-ietf-ntp-roughtime-19, 17/3/2026) βρίσκεται στο RFC Editor queue ως Experimental και επιτρέπει proofs of malfeasance. Το RFC 3161 (2001, ενημερωμένο από το RFC 5816) δίνει proof-of-existence από TSA. Το eIDAS (910/2014) Art. 41 δίνει τεκμήριο ακρίβειας μόνο στις qualified electronic time stamps από QTSP.

**Για το GRAIL:** Κλείνει το κενό του προχείρου, όπου το ε του HLC στηρίζεται σε μη αυθεντικοποιημένο NTP. Προσθέτει νομικό τεκμήριο στις χρονοσφραγίδες του LAWMAX.

**Πηγές:** [RFC 8915, 2020](https://www.rfc-editor.org/rfc/rfc8915) · [draft-ietf-ntp-roughtime, 2026](https://datatracker.ietf.org/doc/draft-ietf-ntp-roughtime/) · [RFC 3161, 2001](https://www.rfc-editor.org/rfc/rfc3161) · [Regulation (EU) 910/2014 (eIDAS), 2014](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910)

### Bitemporal stores: XTDB v2, PostgreSQL 18

*system, production* · SOTA-KSUB-10

Το XTDB v2 είναι immutable SQL database με bitemporal λειτουργίες κατά SQL:2011, άδεια MPL 2.0, GA από τις 5/6/2025. Το PostgreSQL 18 (25/9/2025) προσθέτει PRIMARY KEY/UNIQUE WITHOUT OVERLAPS, foreign keys με PERIOD και uuidv7().

**Για το GRAIL:** Υποψήφιες μηχανές για παράγωγες διτεμπορικές προβολές (ADR-0015, EP-05), όχι για την αλήθεια.

**Πηγές:** [XTDB docs, 2026](https://docs.xtdb.com/) · [XTDB blog: Launching XTDB v2, 2025](https://xtdb.com/blog) · [PostgreSQL 18 release notes, 2025](https://www.postgresql.org/docs/18/release-18.html)

### Durable execution: Temporal, Restate, DBOS

*system, production* · SOTA-KSUB-11

Temporal: ντετερμινιστικός workflow code με replay του Event History· χρόνος και τυχαιότητα μόνο μέσω SDK APIs· αλλαγές κώδικα με Worker Versioning ή patching. Restate: journal κάθε βήματος, virtual objects με single-writer, idempotency keys, και immutable deployments όπου κάθε invocation μένει pinned στην έκδοση όπου ξεκίνησε. DBOS: versioning ώστε τα workflows να ανακάμπτουν μόνο σε συμβατό κώδικα. Το paper του DBOS (PVLDB 2022) προτείνει distributed transactional DBMS ως βάση cluster OS και επισημαίνει ότι το provenance απουσιάζει από τα σημερινά OS.

**Για το GRAIL:** Είναι η βιομηχανική μορφή του INV-C08. Δείχνει ότι το replay χρειάζεται pinning της έκδοσης κώδικα, που λείπει από το πρόχειρο.

**Πηγές:** [Temporal workflow definition, 2026](https://docs.temporal.io/workflow-definition) · [Restate durable execution, 2026](https://docs.restate.dev/concepts/durable_execution) · [Restate versioning, 2026](https://docs.restate.dev/operate/versioning) · [DBOS architecture (versioning), 2026](https://docs.dbos.dev/architecture) · [DBOS: A DBMS-oriented Operating System, 2022](https://www.vldb.org/pvldb/vol15/p21-skiadopoulos.pdf)

### Deterministic simulation testing: FoundationDB, TigerBeetle VOPR, Antithesis

*tool, production* · SOTA-KSUB-12

Ολόκληρο το cluster εκτελείται σε μία ντετερμινιστική διεργασία με fault injection σε δίκτυο, δίσκο και μηχανές. Στο VOPR τα clock, network και disk είναι stubs, και κάθε bug αναπαράγεται από το seed μαζί με το commit hash. Το Antithesis προσφέρει deterministic simulation για κατανεμημένα συστήματα.

**Για το GRAIL:** Στηρίζει το OPS-02 και την εκτέλεση των KT-21/KT-22 σε DST πριν από τον κώδικα.

**Πηγές:** [FoundationDB Simulation and Testing, 2026](https://apple.github.io/foundationdb/testing.html) · [TigerBeetle VOPR, 2026](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/internals/vopr.md) · [Antithesis docs, 2026](https://antithesis.com/docs/)

### Consensus replication: Raft, Viewstamped Replication (TigerBeetle)

*research, production* · SOTA-KSUB-13

Replicated log με commit πλειοψηφίας, ώστε κανένας κόμβος να μην εφαρμόσει διαφορετική εντολή στην ίδια θέση. Το TigerBeetle χρησιμοποιεί Viewstamped Replication, υποθέτει ότι ο δίσκος θα αστοχήσει, κρατά checksummed και hash-chained δεδομένα και σταματά με ασφάλεια (safe halt) αντί για σιωπηλή απώλεια.

**Για το GRAIL:** Αποδεδειγμένος μηχανισμός για RPO 0 και HA ενός single-writer journal. Το πρόχειρο δεν τον ορίζει.

**Πηγές:** [Raft, 2026](https://raft.github.io/) · [TigerBeetle safety, 2026](https://docs.tigerbeetle.com/concepts/safety/)

### Wasm Component Model: WASI 0.3, Wasm 3.0 DET profile, Wasmtime LTS, wRPC

*standard, production* · SOTA-KSUB-14

Το WASI 0.2.0 κυκλοφόρησε τον Ιανουάριο 2024, με patches έως 0.2.12. Το 0.3.0 (11/6/2026) προσθέτει native async (async func, stream, future) και ακολούθησε το 0.3.1 (11/8/2026)· υλοποιείται στο Wasmtime 46+. Το WIT ορίζει packages με semver, worlds, interfaces και resources/handles. Το Wasm 3.0 DET profile ορίζει canonical NaN και fixed relaxed SIMD, αλλά τα memory.grow/table.grow μένουν μη ντετερμινιστικά. Το Wasmtime βγάζει μηνιαία major έκδοση, με LTS κάθε 12η και υποστήριξη 24 μηνών· τελευταία είναι η v48.0.2 (10/9/2026). Το wRPC μεταφέρει WIT πάνω από δίκτυο, με bindings Rust/Go και transports TCP, QUIC, WebTransport, WebSockets και Unix sockets.

**Για το GRAIL:** Βάση του ICD-10/EP-02. Δίνει ορισμό για το «deterministic mode» και ενιαίο IDL για τοπικά και απομακρυσμένα organs.

**Πηγές:** [WASI roadmap, 2026](https://wasi.dev/roadmap) · [WebAssembly/WASI, 2026](https://github.com/WebAssembly/WASI) · [Wasm 3.0 profiles, 2026](https://webassembly.github.io/spec/core/appendix/profiles.html) · [Wasmtime stability & release, 2026](https://docs.wasmtime.dev/stability-release.html) · [Wasmtime releases, 2026](https://github.com/bytecodealliance/wasmtime/releases) · [WIT, 2026](https://component-model.bytecodealliance.org/design/wit.html) · [wRPC README, 2026](https://raw.githubusercontent.com/bytecodealliance/wrpc/main/README.md)

### Sandboxes: Firecracker, Hyperlight, gVisor

*tool, production* · SOTA-KSUB-15

Το Firecracker είναι KVM microVM με minimal device model και jailer, και στηρίζει τα Lambda και Fargate. Το vsock του μεσολαβεί AF_UNIX στον host και AF_VSOCK στον guest, ως κανάλι ανεξάρτητο από network interface. Το Hyperlight είναι micro-VM χωρίς kernel ή OS, με guests ELF σε no_std Rust ή C· είναι CNCF sandbox, pre-1.0, με hyperlight-wasm. Το gVisor είναι application kernel σε userspace (Sentry), με αντάλλαγμα μειωμένη συμβατότητα και υψηλότερο κόστος ανά syscall.

**Για το GRAIL:** Επιλογές για το CMP-KRN-12. Το Hyperlight ταιριάζει σε Wasm ή no_std organs, όχι σε SBCL image.

**Πηγές:** [Firecracker, 2026](https://github.com/firecracker-microvm/firecracker) · [Firecracker vsock, 2026](https://github.com/firecracker-microvm/firecracker/blob/main/docs/vsock.md) · [Hyperlight, 2026](https://github.com/hyperlight-dev/hyperlight) · [gVisor docs, 2026](https://gvisor.dev/docs/)

### Capability microkernels & hardware: seL4 (+MCS), LionsOS, Genode, Zircon, CHERI

*system, production* · SOTA-KSUB-16

Το seL4 έχει formal verification, και οι security proofs ολοκληρώθηκαν σε AArch64 (ανακοίνωση 24/8/2026). Τα MCS scheduling contexts επιβάλλουν budget/period με sporadic server για temporal isolation. Το LionsOS (v0.4.0) πάνω σε seL4 δεν έχει ακόμη «concrete verification story». Το Genode είναι framework ειδικών OS με αναδρομικό sandbox model, πάνω σε seL4, NOVA, Fiasco.OC, Linux κ.ά. Τα Zircon handles φέρουν rights, μεταφέρονται ρητά μέσω channels, και δεν υπάρχει πρόσβαση χωρίς handle. Η CHERI Alliance έχει 50+ μέλη.

**Για το GRAIL:** Αφορά το κατώτερο όριο του TCB (ADR-0004), το EP-03 και το «capability hardware» του EP-02, και δίνει πρότυπο budgets για το ICD-11.

**Πηγές:** [seL4 About, 2026](https://sel4.systems/About/) · [seL4 MCS tutorial, 2026](https://docs.sel4.systems/Tutorials/mcs.html) · [LionsOS, 2026](https://lionsos.org/) · [Genode, 2026](https://genode.org/about/index) · [Zircon handles, 2026](https://fuchsia.dev/fuchsia-src/concepts/kernel/handles) · [CHERI Alliance, 2026](https://cheri-alliance.org/)

### Rust OS / verified Rust: Asterinas, Theseus, Verus

*research, research-prototype* · SOTA-KSUB-17

Το Asterinas είναι framekernel: το unsafe Rust περιορίζεται στο OSTD, υποστηρίζει 230+ Linux syscalls, είχε δύο papers στο USENIX ATC 2025 και τελευταία έκδοση την 0.18.1 (1/9/2026). Το Theseus είναι ερευνητικό Rust OS, «not yet mature», με στόχο live evolution και fault recovery. Το Verus επαληθεύει στατικά προδιαγραφές σε Rust και είναι σε ενεργή ανάπτυξη.

**Για το GRAIL:** Τεκμηριώνει ότι η ζωντανή αντικατάσταση kernel components (REQ-ABS-002) μένει έρευνα. Δίνει δρόμο για επαλήθευση Rust TCB.

**Πηγές:** [Asterinas, 2026](https://github.com/asterinas/asterinas) · [Theseus OS, 2026](https://github.com/theseus-os/Theseus) · [Verus, 2026](https://github.com/verus-lang/verus)

### Supervision runtimes: Erlang/OTP 29, Apache Pekko, Orleans, Ray

*system, production* · SOTA-KSUB-18

OTP: supervisors με στρατηγικές one_for_one, one_for_all, rest_for_one και simple_one_for_one, και restart intensity/period (προεπιλογή 1 ανά 5s)· η OTP 29.0 κυκλοφόρησε στις 13/5/2026. Pekko: fork του Akka 2.6.x πριν το Akka περάσει σε BSL. Orleans: virtual actors με αυτόματη activation, placement και grain versioning. Ray: η κατάσταση του actor χάνεται στο restart (ξανατρέχει ο constructor), με max_restarts· ισχύει owner fate-sharing, όχι supervision trees με στρατηγικές.

**Για το GRAIL:** Στηρίζει το ADR-0013 και ορίζει τα σκέλη του EXP-06.

**Πηγές:** [Erlang/OTP news, 2026](https://www.erlang.org/news) · [OTP supervisor principles, 2026](https://www.erlang.org/doc/system/sup_princ.html) · [Apache Pekko, 2026](https://pekko.apache.org/) · [Orleans overview, 2026](https://learn.microsoft.com/en-us/dotnet/orleans/overview) · [Ray actor fault tolerance, 2026](https://docs.ray.io/en/latest/ray-core/fault_tolerance/actors.html)

### Event transport: NATS JetStream 2.14, Apache Kafka 4.x

*system, production* · SOTA-KSUB-19

Το NATS 2.14 (30/4/2026) προσθέτει high-throughput publishing σε JetStream· από το 2.12 (22/9/2025) ο κύκλος εκδόσεων είναι 6μηνος. Το 2025 η Synadia επιχείρησε έξοδο του NATS από το CNCF και μετάβαση σε BUSL· η διαφορά λύθηκε με παραμονή στο CNCF (1/5/2025). Το Kafka 4.0 (18/3/2025) λειτουργεί χωρίς ZooKeeper, με KIP-848 GA και KIP-932 σε early access. Ακολούθησαν η 4.3.0 (22/5/2026) και η 4.3.1 (25/6/2026).

**Για το GRAIL:** Αφορά το ADR-0014/EP-06. Ο κίνδυνος διακυβέρνησης και άδειας είναι πραγματικός, αλλά το «transport ≠ truth» τον περιορίζει.

**Πηγές:** [NATS blog, 2026](https://nats.io/blog/) · [CNCF: Protecting NATS, 2025](https://www.cncf.io/blog/2025/05/01/protecting-nats-and-the-integrity-of-open-source-cncfs-commitment-to-the-community/) · [Apache Kafka 4.0.0 announcement, 2025](https://kafka.apache.org/blog/2025/03/18/apache-kafka-4.0.0-release-announcement/) · [Apache Kafka blog, 2026](https://kafka.apache.org/blog)

### AI agent OS: AIOS, MemGPT

*research, research-prototype* · SOTA-KSUB-20

Το AIOS (COLM 2025, αναθεώρηση 12/8/2025) βάζει σε «AIOS kernel» scheduling, context, memory, storage και access control για LLM agents και αναφέρει έως 2.1x ταχύτερη εκτέλεση. Το MemGPT (2023) εφαρμόζει virtual context management κατά το πρότυπο της ιεραρχίας μνήμης των OS.

**Για το GRAIL:** Είναι η αντίθετη σχολή από το ADR-0004. Χρήσιμο ως πρότυπο scheduling και context για το COG-01, όχι για TCB.

**Πηγές:** [AIOS: LLM Agent Operating System, 2025](https://arxiv.org/abs/2403.16971) · [MemGPT: Towards LLMs as Operating Systems, 2023](https://arxiv.org/abs/2310.08560)

### Observability: OpenTelemetry GenAI semconv, W3C Trace Context

*standard, pilot* · SOTA-KSUB-21

Οι GenAI spans (inference, embeddings, execute_tool, invoke_agent) είναι σε Development στη v1.37.0. Οι instrumentations που ήταν σε v1.36.0 ή παλαιότερη κάνουν opt-in με OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental. Οι συμβάσεις μεταφέρθηκαν στο semantic-conventions-genai, που καλύπτει και MCP. Το W3C Trace Context είναι Recommendation (23/11/2021).

**Για το GRAIL:** Αφορά το ICD-24/OPS-04: correlation traceparent ↔ event_cid, με τα ασταθή GenAI attributes πίσω από adapter.

**Πηγές:** [OTel GenAI semconv (moved notice), 2026](https://opentelemetry.io/docs/specs/semconv/gen-ai/) · [semantic-conventions-genai, 2026](https://github.com/open-telemetry/semantic-conventions-genai) · [GenAI spans v1.37.0, 2025](https://github.com/open-telemetry/semantic-conventions/blob/v1.37.0/docs/gen-ai/gen-ai-spans.md) · [W3C Trace Context, 2021](https://www.w3.org/TR/trace-context/)

### Reproducible builds & supply chain: Nix, Guix full-source bootstrap, SLSA 1.2

*tool, production* · SOTA-KSUB-22

Μελέτη του MSR 2025 σε 709.816 πακέτα του nixpkgs (2017–2023) μέτρησε bitwise reproducibility 69–91% με ανοδική τάση και rebuildability πάνω από 99%. Το Guix (26/4/2023) χτίζει γράφο 22.000+ κόμβων από seed 357 bytes. Το SLSA 1.1 έχει αποσυρθεί· η 1.2 είναι Approved και προσθέτει Source track.

**Για το GRAIL:** Αφορά το ADR-0029/OPS-01: το Nix είναι τεκμηριωμένο, και το full-source bootstrap είναι ισχυρότερο για artifacts του TCB.

**Πηγές:** [Does Functional Package Management Enable Reproducible Builds at Scale? Yes, 2025](https://arxiv.org/abs/2501.15919) · [Guix full-source bootstrap, 2023](https://guix.gnu.org/en/blog/2023/the-full-source-bootstrap-building-from-source-all-the-way-down/) · [SLSA v1.1 (Retired), 2026](https://slsa.dev/spec/v1.1/) · [SLSA v1.2, 2026](https://slsa.dev/spec/v1.2/)

### Contract IDLs & tooling: OpenAPI 3.2, AsyncAPI 3.1, Protobuf Editions 2024, JSON Schema 2020-12, TypeSpec, Buf

*standard, production* · SOTA-KSUB-23

Το OpenAPI 3.2.0 (19/9/2025) προσθέτει sequential/streaming media types (και SSE), QUERY και webhooks. Το AsyncAPI είναι στην 3.1.0 με NATS bindings. Τα Protobuf Editions αντικαθιστούν τα proto2/proto3, με τελευταία την 2024. Το JSON Schema 2020-12 παραμένει τρέχον. Το TypeSpec έχει emitters για OpenAPI3 και JSON Schema· Protobuf/WIT δεν επαληθεύτηκαν. Το Buf ελέγχει breaking changes σε επίπεδα FILE, PACKAGE, WIRE_JSON και WIRE.

**Για το GRAIL:** Αφορά το ADR-0025/REQ-INT-001: επικαιροποίηση εκδόσεων και κανόνας παραγωγής των bindings από τη μία έδρα.

**Πηγές:** [OpenAPI 3.2.0, 2025](https://spec.openapis.org/oas/v3.2.0.html) · [AsyncAPI latest, 2026](https://www.asyncapi.com/docs/reference/specification/latest) · [Protobuf Editions, 2026](https://protobuf.dev/editions/overview/) · [JSON Schema specification, 2026](https://json-schema.org/specification) · [TypeSpec docs, 2026](https://typespec.io/docs/) · [Buf breaking, 2026](https://buf.build/docs/breaking/)

### Verification-guided development (Cedar) και όρια του N-version

*research, production* · SOTA-KSUB-24

Στο Cedar, ένα εκτελέσιμο Lean model αποδείχθηκε και συγκρίθηκε με την Rust υλοποίηση με differential random testing: 4 bugs βρέθηκαν μέσω proofs και 21 μέσω DRT/PBT. Οι Knight & Leveson (IEEE TSE 12(1), 1986) απέρριψαν στατιστικά την ανεξαρτησία αστοχιών στο N-version programming (δευτερογενής πηγή).

**Για το GRAIL:** Το N-version του προχείρου ανιχνεύει διαφωνίες αλλά δεν εγγυάται ορθότητα όταν οι εκδόσεις συμφωνούν. Χρειάζεται VGD.

**Πηγές:** [How We Built Cedar: A Verification-Guided Approach, 2024](https://arxiv.org/abs/2407.01688) · [N-version programming (Knight & Leveson 1986 citation), 2026](https://en.wikipedia.org/wiki/N-version_programming)

### RFC 9170 — Long-term viability of protocol extension mechanisms

*standard, production* · SOTA-KSUB-25

Informational RFC του IAB (2021): «Mechanisms that aren't used are the ones that fail most often». Συστήνει ενεργή χρήση των μηχανισμών επέκτασης, GREASE και ρητή τεκμηρίωση των invariants.

**Για το GRAIL:** Κατ' αναλογία για το §28: EPs που δεν ασκούνται κινδυνεύουν να απολιθωθούν.

**Πηγές:** [RFC 9170, 2021](https://www.rfc-editor.org/rfc/rfc9170)

### Leases & fencing tokens

*research, production* · SOTA-KSUB-26

Ένα lease χωρίς fencing token δεν είναι ασφαλές απέναντι σε GC pauses και καθυστερήσεις. Η λύση είναι μονότονο token που ο πόρος ελέγχει και με το οποίο απορρίπτει παλαιότερα tokens.

**Για το GRAIL:** Για τη μοναδικότητα body του ICD-12/INV-I04, ο έλεγχος πρέπει να γίνεται στο ledger.

**Πηγές:** [Kleppmann: How to do distributed locking, 2016](https://martin.kleppmann.com/2016/02/08/how-to-do-distributed-locking.html)

### AWS ClockBound

*tool, pilot* · SOTA-KSUB-27

Daemon και client library που δίνουν Clock Error Bound ως ζεύγος (earliest, latest), από NTP, PTP Hardware Clock ή VMClock. Διατίθεται ως Rust crate και C FFI.

**Για το GRAIL:** Κάνει μετρήσιμο το ε του HLC (GAP-KSUB-06). Η έκταση χρήσης εκτός AWS δεν επαληθεύτηκε.

**Πηγές:** [aws/clock-bound, 2026](https://github.com/aws/clock-bound)

### EDPB Guidelines 02/2025 (blockchain και προσωπικά δεδομένα)

*standard, pilot* · SOTA-KSUB-28

Έκδοση 1.1 για δημόσια διαβούλευση (υιοθέτηση 8/4/2025, διαβούλευση έως 9/6/2025). Κρίνει μη ενδεδειγμένη την εγγραφή προσωπικών δεδομένων σε clear, encrypted ή hashed μορφή σε blockchain· αυτά πρέπει να φυλάσσονται off-chain. Ως μέτρα προτείνει salted ή keyed hash με salt/κλειδί off-chain, και perfectly hiding commitments που γίνονται άχρηστα μόλις διαγραφούν τα δεδομένα και ο witness. Απαιτεί DPIA και erasure by design.

**Για το GRAIL:** Άμεσο για append-only ledger και CAS με προσωπικά δεδομένα (KT-16, REQ-MEM-002, ShredEnvelope).

**Πηγές:** [EDPB Guidelines 02/2025 v1.1 (PDF), 2025](https://www.edpb.europa.eu/system/files/2025-04/edpb_guidelines_202502_blockchain_en.pdf) · [EDPB adopts guidelines on blockchains, 2025](https://www.edpb.europa.eu/news/news/2025/edpb-adopts-guidelines-processing-personal-data-through-blockchains-and-ready_en) · [EDPB Guidelines 02/2025 consultation page, 2025](https://www.edpb.europa.eu/our-work-tools/documents/public-consultations/2025/guidelines-022025-processing-personal-data_en)
