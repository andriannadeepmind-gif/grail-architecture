# DECISION-LOG — οι αποφάσεις του πακέτου (MFA-DEC-nnn) και το ημερολόγιο σταθερού σημείου (Pass I)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

Έδρα των `MFA-DEC-nnn`. Κάθε απόφαση εδώ έχει **status PROPOSED** μέχρι ο δημιουργός να γράψει «εγκρίνω» (Δ-8, Δ-10)· η έγκριση είναι patch `RECLASSIFY` (PATCH-PROTOCOL §5). Οι αποφάσεις με `owner: creator` **δεν** αποφασίζονται από το πακέτο — το πακέτο δίνει πρόταση, εναλλακτικές και τι ισχύει μέχρι τότε (προεπιλογή). Καμία απόφαση δεν είναι έγκυρη αν παραβιάζει τον ΑΠΟΛΥΤΟ ΝΟΜΟ ΜΗ ΥΠΟΒΑΘΜΙΣΗΣ (`docs/NOMOS-MI-YPOVATHMISIS.md`)· κάθε σημαντική απόφαση έχει Devil's Advocate record (στήλη ATK).

Σχέση με τα `DEC-X-01…23` και `Δ-0…13` του `DECISIONS-FOR-CREATOR.md`: τα MFA-DEC είναι οι αποφάσεις που **προέκυψαν από το πακέτο** (Pass B–I) και είτε εξειδικεύουν είτε αντικαθιστούν DEC-X/Δ· η στήλη «προέλευση» δείχνει ποια.

## 1. Μητρώο αποφάσεων

| ID | Απόφαση | Πρόταση του πακέτου | Εναλλακτικές | Μέχρι την έγκριση ισχύει | Προέλευση | ATK | Owner | Status |
|---|---|---|---|---|---|---|---|---|
| **MFA-DEC-001** | Επαναδιατύπωση του T8 («χωρίς επανασχεδιασμό πυρήνα») ώστε να συμβιβάζεται με τον Moving Horizon (διάδοχος) | T8 αληθές σε επίπεδο L0–L2 (MFA-INV-031)· ο διάδοχος είναι πράξη L3 από εξωτερική αρχή (MFA-INV-049)· το T8 ξαναγράφεται: «κανένας επανασχεδιασμός πυρήνα **από μέσα**» | (α) T8 απόλυτο → κανένας διάδοχος ποτέ (MFA-TEL-02)· (β) T8 διαγράφεται → διάδοχος χωρίς όριο | η πρόταση (MFA-CFL-003) | DEC-X-04, MATERIAL §5 #7 | ATK-01, ATK-16 | creator | PROPOSED |
| **MFA-DEC-002** | Υπάρχει δημόσια εγκατάσταση (TEL-07 «Δημόσιο Παρατηρητήριο»); | Όχι στη Δόση 0–2· το TEL-07 μένει **προαιρετικό προφίλ** με trust domain + import gate (MFA-ELM-057)· απόφαση ξανά μετά τη Δόση 3 με δεδομένα MFA-VO-045/047 | (α) ναι από την αρχή· (β) ποτέ (TEL-05 σκέτο) | όχι· ιδιωτική κυριαρχία (MFA-OBJ-010) | Pass B, MFA-CFL-012 | ATK-01, ATK-17 | creator | PROPOSED |
| **MFA-DEC-003** | Η μία έδρα του σχεδίου: Δ-1′ = serialization-independent υπόστρωμα (MFA-ELM-088), SysML/SysON/YAML/Mermaid προβολές· το SysON Tier-1 verifier προβολών (KerML) | Δ-1′ όπως στο MFA-ELM-088 v3 (μετά MFA-PATCH-0003)· αλλαγή του CLAUDE.md Φάση Β: «ζωντανό SysML v2 model στο SysON» → «υπόστρωμα με SysON προβολή + type-check» | (α) SysON ζωντανή έδρα (DEC-PLT-01)· (β) κείμενο SysML στο git έδρα (Δ-1) | Δ-1 (κείμενο στο git) — το πακέτο είναι το προσχέδιο της Δ-1′ | Δ-1, DEC-X-01, MFA-CFL-031 | ATK-03, ATK-14 | creator | PROPOSED |
| **MFA-DEC-004** | Κατώφλια αυτονομίας: ποιες κλάσεις επίδρασης παίρνουν AutonomyGrant (REVERSIBLE) και ποιες AutonomyEnvelope (IRREVERSIBLE-PREAUTHORIZED)· max_exposure· counter_signer | Grant: REVERSIBLE εντός matter με budget· Envelope: μόνο για κλάσεις που ο Principal υπογράφει εκ των προτέρων (κατάθεση εντός προθεσμίας, αποστολή εγκεκριμένου εγγράφου), max_exposure ανά matter, counter_signer = Court fast-track ≤ 15′ ή δεύτερο σώμα· owner perimeter 0–5 (MATERIAL §2 #14) | (α) κανένα envelope (αυτονομία μόνο αναστρέψιμα — απορρίφθηκε ATK-09)· (β) envelope χωρίς counter_signer | κανένα envelope ενεργό· κάθε IRREVERSIBLE = φρέσκο H1 | MFA-CFL-001, ATK-09 | ATK-09 | creator | PROPOSED |
| **MFA-DEC-005** | ORDER μεταξύ veto των 10 governors του LPA | Προεπιλογή: Tier-0 {Truth, Legal/Deontic, Identity, Commitment} → Tier-1 {Owner-intent, Resource} → Tier-2 {Value, Regret, Curiosity, Empowerment}· εντός tier σειρά εγγραφής· ORDER = L2 δέσμευση | (α) Owner-intent στο Tier-0· (β) Resource πριν Legal (απορρίπτεται: κόστος veto πάνω από νόμο = ΝΟΜΟΣ §8) | η προεπιλογή (MFA-PATCH-0009) | MFA-UNK-001, MATERIAL §9.1 | ATK-09, ATK-07 | creator | PROPOSED |
| **MFA-DEC-006** | Κύρωση της διάταξης των 17 αντιφάσεων του TEL-08 (`contradiction_order`) ως μέρος του Telos | Όπως στο OBJECTIVE-SPACE.yaml MFA-TEL-08 v2· κάθε γραμμή που δεν αναφέρει άλλη MFA-DEC εγκρίνεται με αυτή | ανά γραμμή: αντιστροφή μηχανισμού/πολιτικής | η διάταξη ως προεπιλογή | ATK-01, MFA-PATCH-0001 | ATK-01 | creator | PROPOSED |
| **MFA-DEC-007** | Αντικειμενική συνάρτηση του OAP και τα φράγματα ανά προφίλ: λόγος κόστους αξιολόγησης ≤ 3/5/5/10 (DEP-1/2/3/4), energy_envelope (Wh/matter) | Οι αριθμοί του MFA-INV-065 v2· ενέργεια: DEP-1 ≤ 50 Wh/matter, DEP-2 ≤ 200, DEP-3 ≤ 1 kWh, DEP-4 ≤ 5 kWh (πρόταση, μετριέται από MFA-VO-050) | (α) χωρίς φράγμα (απορρίπτεται: το σύστημα κρίνει τον εαυτό του, ATK-13)· (β) αυστηρότερα | οι αριθμοί ως προεπιλογή | ATK-13, MFA-CFL-008/015 | ATK-13 | creator | PROPOSED |
| **MFA-DEC-008** | Η μία έδρα σχημάτων: LinkML (παράγει JSON Schema 2020-12 + SHACL/OWL/JSON-LD + SysML item defs) ή JSON Schema | LinkML, υπό τον όρο round-trip LinkML→JSON Schema με JCS πριν από τη Δόση 2 (MFA-UNK-105)· αν αποτύχει, JSON Schema έδρα | JSON Schema έδρα (ADR-0025/KSUB) | LinkML | MFA-CFL-022, DEC-X-06 | ATK-06 | creator | PROPOSED |
| **MFA-DEC-009** | Ποια metadata μένουν στο residue commitment μετά από shredding, ανά confidentiality domain | Residue = ⟨hash, schema, evidence_class, dependents_count, erasure_act_receipt⟩ σε κάθε domain· ΚΑΝΕΝΑ πεδίο περιεχομένου· EXP-19 ελέγχει επάρκεια GDPR | (α) μόνο hash (χάνεται η δυνατότητα CONTESTED διάδοσης)· (β) + schema μόνο | η πρόταση (MFA-CFL-035) | ATK-08, DEC-X-13 | ATK-08 | creator | PROPOSED |
| **MFA-DEC-010** | Αποδοχή της Δόσης 0 = «ο copilot που δίνει receipts» (CC-lite 4 κανόνων, verifier σκέλη 1–3, emission barrier, ένα matter) — 8 εβδομάδες· Δόση 0.5 παράλληλα: Lean spec των 8 κανόνων | Όπως στο IMPLEMENTATION-ROADMAP.md· πρώτο βήμα = GENESIS-CEREMONY.md + `CommitmentCalculusLite.lean` | (α) υπόστρωμα πρώτα χωρίς αξία (απορρίφθηκε ATK-15)· (β) 8 κανόνες από την αρχή (ρίσκο UNK-101 πρώτο) | τίποτα δεν χτίζεται (εντολή §26) | ATK-15, ATK-17 | ATK-15 | creator | PROPOSED |
| **MFA-DEC-011** | Ledger fault model: crash-fault με witnesses (κόμβοι υπό έλεγχο δημιουργού) ή BFT σε 4 failure domains από τώρα | Crash-fault + witness cosignatures + RPO 0 σε ≥3 sites (DEP-3+)· BFT μόνο για διάταξη Verdicts cross-site (MFA-INV-026, MFA-MECH-018) | BFT ledger από τη Δόση 0 (κόστος ×3, καμία επιπλέον εγγύηση όσο όλοι οι κόμβοι είναι του δημιουργού) | crash-fault | MFA-UNK-110, MFA-CFL-019, DEC-X-11 | ATK-16 | creator | PROPOSED |
| **MFA-DEC-012** | Πολιτική μη-διαθεσιμότητας του δημιουργού: κάτοχοι k-of-n της καθολικής παύσης και της έγκρισης L3 όταν ο δημιουργός λείπει | n = 3 δηλωμένοι εκπρόσωποι (L3 πολιτική, ανακλητοί), k = 2 για παύση, k = 3 για L3 πράξη· χωρίς εκπροσώπους: μόνο παύση από Tier-0 triggers, καμία L3 πράξη (fail-closed) | (α) 1-of-1 (ο δημιουργός μόνο)· (β) Court ως L3 υποκατάστατο (απορρίπτεται: MFA-INV-005) | 1-of-1· καμία L3 πράξη εν απουσία | MFA-CFL-017, MFA-UNK-012, DEC-X-20 | ATK-09 | creator | PROPOSED |
| **MFA-DEC-013** | Τι είναι CoR / MoR (OMEGA-GUIDE) — μία πρόταση από τον δημιουργό | Το πακέτο δεν σχεδιάζει τίποτα γι' αυτά μέχρι να οριστούν (MFA-UNK-106)· αν είναι «Chain/Model of Reasoning», αντιστοιχούν σε MFA-ELM-019 traces + MFA-ELM-093 προβολή | — | τίποτα | CLAIMS U2 | — | creator | PROPOSED |
| **MFA-DEC-014** | Δεύτερη φυσική συσκευή για τον HELD_OUT ρόλο στο DP-1/2 (scorer + sealed sets) | Ναι — phone-class ή φθηνό VPS υπό κλειδιά δημιουργού· αλλιώς κάθε προαγωγή στο laptop είναι EIM-UNVERIFIED (canary-only) | όχι (τότε DP-1 = lean profile με παγωμένα όργανα, δηλωμένο) | canary-only | ATK-13, MFA-INV-048 | ATK-13 | creator | PROPOSED |
| **MFA-DEC-015** | Επιλογή Telos: MFA-TEL-08 (Lean-Collapsible Maximum) ως APPROVED, τα υπόλοιπα REJECTED BY CREATOR ή optional profile | TEL-08 με contradiction_order (MFA-DEC-006) | TEL-05 (χωρίς lean collapse)· TEL-04· TEL-07 ως προφίλ | TEL-08 RECOMMENDED, όχι APPROVED· χτίζεται μόνο το robust substrate (τομή) | Pass B, PATCH-PROTOCOL §5 | ATK-01 | creator | PROPOSED |

Αποφάσεις που **δεν** χρειάζονται τον δημιουργό (owner: package) και ισχύουν ήδη — καταγράφονται για ιχνηλασιμότητα:

| ID | Απόφαση | Τεκμήριο | ATK |
|---|---|---|---|
| MFA-DEC-101 | Το Devil's Advocate plugin επέστρεψε `NO_SUBSCRIPTION` και στα δύο εργαλεία που δοκιμάστηκαν· οι 17 επιθέσεις εκτελέστηκαν από τον συντάκτη με το πλήρες format της εντολής §17· δηλώνεται ως αδυναμία εργαλείου (ΝΟΜΟΣ §14), όχι ως επιλογή | adversarial/MFA-ATK-01…17 (header `method`) | — |
| MFA-DEC-102 | Ο MCP server `syson` δεν συνδέθηκε (Windows deno path)· ο KerML έλεγχος της προβολής (MFA-VO-026) μένει PENDING | MFA-VO-026 `status_note` | ATK-03 |
| MFA-DEC-103 | Τα patches εφαρμόζονται μηχανικά (`tools/apply-patch.py`), με το `-R` γραμμένο από το εργαλείο πριν το APPLIED· υπογραφές `UNVERIFIED` μέχρι το commit του δημιουργού | PATCH-PROTOCOL §7 | ATK-14 |
| MFA-DEC-104 | Οι 16 αμοιβαίες εξαρτήσεις στοιχείων (R8a) δεν είναι ελάττωμα: λύνονται με σειρά γένεσης (TECHNICAL-ARCHITECTURE §Bootstrap) | check-package WARN R8a | ATK-15 |
| MFA-DEC-105 | Το `docs/discovery/POST-VERDICT-ARCHITECTURE-PLAN.md` **δεν υπήρχε** στο HEAD f5baa98 (η εντολή το θεωρεί «υφιστάμενο»)· δημιουργείται ως human-readable entry point | `git ls-files docs/discovery` | — |

## 2. Ημερολόγιο σταθερού σημείου (Pass I)

Κανόνας (εντολή §7): `invent → compare → attack → revise` μέχρι **δύο διαδοχικοί πλήρεις κύκλοι** να μην παράγουν νέα λύση που (α) βελτιώνει αυστηρά έστω μία ουσιώδη ικανότητα χωρίς να αποδυναμώνει άλλη, ή (β) αποκαλύπτει προηγουμένως κρυφή διάσταση σύγκρισης. Δεν αποδεικνύει καθολικό ταβάνι· αποδεικνύει ότι δεν σταματήσαμε στην πρώτη εύλογη λύση.

### Κύκλος 0 — Pass C → H (MFA-PATCH-0001…0017)

Invent: MFA-ALT-1…6, MFA-MECH-001…018. Compare: OBJECTIVE-SPACE Pareto μέτωπο, SUPERSEDED-REGISTER. Attack: MFA-ATK-01…17. Revise: 17 patches (2 ADD εναλλακτικής/μηχανισμού, 2 νέα στοιχεία ELM-098/099, 2 νέα invariants INV-067/068, 1 VO-056, 1 CFL-035, 1 RSP-016, 1 MECH-019, 2 REPLACE → MERGE/SPLIT). **Παρήγαγε νέες λύσεις: ΝΑΙ.**

### Κύκλος 1 — πάνω στην αρχιτεκτονική v0.2 (MFA-PATCH-0018)

| # | Υποψήφια επινόηση / σύγκριση | Αυστηρά ανώτερο; | Κρυφή διάσταση; | Έκβαση |
|---|---|---|---|---|
| 1.1 | **Envelope pre-simulation**: πριν υπογραφεί AutonomyEnvelope (ATK-09), shadow run της μη αναστρέψιμης πράξης στο World Twin (ATK-11) → foreseen_effects στον counter_signer | **ΝΑΙ** — βελτιώνει MFA-CAP-006/030 χωρίς να αποδυναμώνει ικανότητα· το κόστος είναι πόρος υπό OAP· NONE δηλώνεται όπου ο Twin είναι deferred | — | MFA-PATCH-0018 |
| 1.2 | Άξονας σύγκρισης **time_to_correction** (από λάθος δέσμευση μέχρι 100 % εξαρτώμενων σημασμένων) | — | **ΝΑΙ** — δεν αλλάζει καμία σχέση κυριαρχίας (TEL-08 μη κυριαρχούμενο· ALT-7 υστερεί) | MFA-PATCH-0018 (pareto_axes) |
| 1.3 | Έλεγχος R3b: MFA-INV-068 χωρίς VO στα verifies | ελάττωμα του PATCH-0016, όχι επινόηση | — | MFA-PATCH-0018 (VO-053) |
| 1.4 | «Mixture of verifiers» (PDE για επαληθευτές) | ΟΧΙ — ήδη N-version + EIM (MFA-MECH-009)· το μείγμα για επαληθευτές θα έκρυβε τη διαφωνία που η πύλη πρέπει να δείχνει (MFA-INV-058) | — | απορρίπτεται |
| 1.5 | Contest bounties (πληρωμή για διαψεύσεις) ως μηχανισμός Court | ΟΧΙ αυστηρά — MFA-ELM-047 (economy, EXP-25) το περιέχει· κίνδυνος Goodhart χωρίς HELD_OUT scorer | — | παραμένει EXP-25 |
| 1.6 | Ledger BFT από τη Δόση 0 | ΟΧΙ — Pareto (κόστος ×3, καμία επιπλέον εγγύηση όσο οι κόμβοι είναι του δημιουργού) | — | MFA-DEC-011 |
| 1.7 | Cockpit «σε απουσία δημιουργού» (delegation dashboard) | ΟΧΙ — MFA-ELM-016 k-of-n + MFA-DEC-012 το καλύπτουν· UI ζήτημα, όχι αρχιτεκτονικό | — | απορρίπτεται |

Attack του 1.1 (εντός κύκλου): «στο DP-1 ο Twin είναι deferred, άρα η βελτίωση είναι κενή» → REJECTED: το `presimulation: NONE` δηλώνεται στο receipt και ο counter_signer το βλέπει· η βελτίωση είναι υπό συνθήκη πιστότητας, όχι κενή (ίδιο σχήμα με MFA-INV-060). **Παρήγαγε νέες λύσεις: ΝΑΙ (1.1, 1.2).**

### Κύκλος 2 — πάνω στην αρχιτεκτονική v0.3 (μετά MFA-PATCH-0018)

| # | Υποψήφια | Αυστηρά ανώτερο; | Κρυφή διάσταση; | Έκβαση |
|---|---|---|---|---|
| 2.1 | Foreseen_effects **και** για REVERSIBLE πράξεις με grant | ΟΧΙ — Pareto: το inverse ήδη φράσσει τη ζημιά· διπλασιάζει κόστος shadow (MFA-INV-065)· επιτρέπεται ως πολιτική OAP, όχι ως μηχανισμός | — | πολιτική (MFA-DEC-007) |
| 2.2 | Οι 10 governors ως 10 όργανα υπό ORP (αντί για μητρώο) | ΟΧΙ — ήδη «governors επίπεδο 2 (Court)» με register/EIM· ORP για governors = ίδιο μονοπάτι | — | ήδη |
| 2.3 | Residue commitments με zero-knowledge απόδειξη σχήματος (κρύβει και το schema) | Pareto: κερδίζει εμπιστευτικότητα, χάνει CONTESTED διάδοση ανά άξονα (χρειάζεται το schema)· PQ-ZK ανώριμο (MFA-INV-066) | — | εναλλακτική στο MFA-DEC-009 (β) |
| 2.4 | Δεύτερος άξονας: **time_to_first_receipt** (πόσο γρήγορα ο Principal βλέπει receipt) | ΟΧΙ — υποπερίπτωση του time_to_useful_answer | ΟΧΙ | απορρίπτεται |
| 2.5 | «Επιθέσεις ως VO»: κάθε MFA-ATK να είναι μόνιμη υποχρέωση επαλήθευσης | ΟΧΙ αυστηρά — οι επιθέσεις που παρήγαγαν invariant έγιναν ήδη INV+VO (067/068/056/060/059)· οι υπόλοιπες είναι κρίσεις, όχι μετρήσεις (θα παραβίαζαν MFA-INV-055) | — | απορρίπτεται |
| 2.6 | CC-lite με 5 κανόνες (+CONTEST) στη Δόση 0 | ΟΧΙ — Pareto: CONTEST χρειάζεται Both/ATMS (Δόση 1)· στη Δόση 0 η αμφισβήτηση είναι Void entry (CONTESTED reason) | — | παραμένει 4 |
| 2.7 | World Twin ως ξεχωριστός Πολιτισμός (trust domain) | ΟΧΙ — ο Twin είναι Genesis-plane προσομοίωση· ως Πολιτισμός θα εξέδιδε δεσμεύσεις με εξουσία (παραβίαση MFA-INV-050 πνεύματος) | — | απορρίπτεται |

**Παρήγαγε νέες λύσεις: ΟΧΙ.** (7 υποψήφιες· 0 αυστηρά ανώτερες· 0 νέες διαστάσεις· 2 Pareto trade-offs καταγεγραμμένες ως εναλλακτικές αποφάσεων.)

### Κύκλος 3 — πάνω στην ίδια αρχιτεκτονική v0.3

| # | Υποψήφια | Αυστηρά ανώτερο; | Κρυφή διάσταση; | Έκβαση |
|---|---|---|---|---|
| 3.1 | Αντίστροφη κατεύθυνση Galois: η σκηνή ως έδρα και το ledger ως προβολή («spatial-first») | ΟΧΙ — χάνει σειριοποίηση-ανεξαρτησία (MFA-CAP-003)· η ALT-3 το είχε εξετάσει | — | απορρίπτεται |
| 3.2 | GCP replay σε 5 Πολιτισμούς παράλληλα με πλειοψηφία loss map | ΟΧΙ — Pareto: κόστος ×5· η ετυμηγορία ήδη απαιτεί δημιουργό + HELD_OUT (MFA-INV-049)· πλειοψηφία θα έκρυβε διαφωνία (MFA-INV-023) | — | απορρίπτεται |
| 3.3 | Άξονας **explainability-at-depth** (πόσο βαθιά μπορεί να πάει η εξήγηση χωρίς omitted_count>0) | ΟΧΙ — μετρική του MFA-ELM-093 (VO), όχι άξονας Telos· δεν διακρίνει υποψηφίους (όλοι με ledger = ∞) | ΟΧΙ | γίνεται measures της MFA-VO-048 (χωρίς patch: ήδη «κανένα ανεξήγητο κενό») |
| 3.4 | Ανθρώπινη βεβαίωση ως Tier-3 (αντί «χωριστή κλάση») | ΟΧΙ — απορρίφθηκε στο DEC-X-08: θα έδινε στην ανθρώπινη γνώμη θέση στην κλίμακα απόδειξης (MFA-INV-063) | — | απορρίπτεται |
| 3.5 | Εξαγωγή του lean profile ως ανεξάρτητο προϊόν (χωρίς robust substrate) | ΟΧΙ — αυτό είναι ο ανταγωνιστής (ALT-6)· χάνει receipts/taint/συνέχεια (ATK-17) | — | απορρίπτεται |
| 3.6 | Ο HELD_OUT να ψηφίζει με βάρος 0.5 | ΟΧΙ — παραβιάζει MFA-INV-050 και το επιχείρημα ανεξαρτησίας (MFA-MECH-018 §5) | — | απορρίπτεται |

**Παρήγαγε νέες λύσεις: ΟΧΙ.** Δύο διαδοχικοί πλήρεις κύκλοι (2, 3) χωρίς αυστηρά ανώτερη λύση ή νέα διάσταση **μέσα στον εξετασμένο χώρο** (7 εναλλακτικές, 19 μηχανισμοί, 17 επιθέσεις, 18 patches). **Σταθερό σημείο: ΝΑΙ, υπό αυτόν τον όρο.** Ό,τι δεν εξετάστηκε παραμένει MFA-UNK-019 (όγδοη πρώτη αρχή).

## 3. Τι χρειάζεται «εγκρίνω» πριν από τη Φάση Β (σειρά)

1. **MFA-DEC-015** (Telos TEL-08) μαζί με **MFA-DEC-006** (διάταξη αντιφάσεων) — χωρίς αυτά χτίζεται μόνο το robust substrate.
2. **MFA-DEC-010** (Δόση 0) και **MFA-DEC-003** (έδρα Δ-1′ — αλλάζει το CLAUDE.md Φάση Β).
3. **MFA-DEC-004, 005, 012, 014** (αυτονομία, ORDER, απουσία, δεύτερη συσκευή) — μπορούν να μείνουν στις προεπιλογές για τη Δόση 0.
4. **MFA-DEC-001, 002, 007, 008, 009, 011, 013** — πριν από τη Δόση 2.
