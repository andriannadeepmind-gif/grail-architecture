# DESIGN-START-PLAN — Δομή του model στο SysON και πρώτες δόσεις

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Κατάσταση:** ΠΡΟΤΑΣΗ. Ισχύει μόνο μετά από «εγκρίνω» του δημιουργού (CLAUDE.md, Φάση Β).

---

## 0. Η μέθοδος: από την αρχή ως το τέλος (Δ-8)

Τρεις κανόνες που δεν παραβιάζονται:

1. **Τίποτα δεν ζει σε μνήμη.** Κάθε έννοια, απόφαση και ανοιχτό ερώτημα είναι στοιχείο του model, με ID και κατάσταση: ανοιχτό, εγκεκριμένο ή απορρίφθηκε. Κάθε συνεδρία ξεκινά από το model και το CLAUDE.md. Ό,τι δεν είναι στο model δεν υπάρχει.
2. **Μία κατεύθυνση, χωρίς κύκλους.** Τα επίπεδα κλείνουν με τη σειρά. Σε ανώτερο επίπεδο επιστρέφουμε μόνο όταν ένα κατώτερο αποδεικνύει ότι είναι λάθος. Τότε γράφεται μια καταγεγραμμένη αλλαγή (change record) που δείχνει τι επηρεάζεται, και δεν ανοίγει ξανά συζήτηση.
3. **Κανένας υποβιβασμός.** Ο στόχος κάθε στοιχείου είναι το ανώτερο δυνατό. Η έλλειψη προηγούμενου δεν χαμηλώνει τον στόχο: του προσθέτει πείραμα [X] και συμβόλαιο από σήμερα [E]. Το «δεν ξέρω» αφορά μόνο γεγονότα, ποτέ τη φιλοδοξία.

Τα εννέα επίπεδα:

| # | Επίπεδο | Ερώτημα | Κλείνει όταν |
|---|---|---|---|
| L0 | Telos | Γιατί υπάρχει το σύστημα και πώς μετριέται ότι πέτυχε | κάθε T έχει μετρήσιμο κριτήριο |
| L1 | Σκηνές | Τι συμβαίνει στον κόσμο του: σενάρια λειτουργίας, stakeholders, concerns | κάθε T εμφανίζεται σε τουλάχιστον μία σκηνή |
| L2 | Απαιτήσεις | Τι πρέπει να ισχύει | κάθε απαίτηση προέρχεται από T ή σκηνή και έχει κριτήριο αποδοχής |
| L3 | Λειτουργίες | Τι κάνει το σύστημα σε κάθε σκηνή | κάθε σκηνή είναι αλυσίδα λειτουργιών, και κάθε απαίτηση ανατίθεται σε λειτουργία |
| L4 | Components | Ποιος το κάνει | κάθε λειτουργία ανήκει σε component, και κάθε component έχει ευθύνη, κατάσταση, τρόπους αστοχίας και κλάση αντικατάστασης, και έχει περάσει τον πίνακα εγκάρσιων θεμάτων |
| L5 | Interfaces και δεδομένα | Πώς μιλούν τα components | κάθε ροή έχει interface με πλήρη υπογραφή, τύπους, σφάλματα, απάντηση «Unknown» και έκδοση |
| L6 | Invariants | Τι δεν σπάει ποτέ | κάθε invariant έχει τυπική διατύπωση και σημείο επιβολής |
| L7 | Πρόβα και επαλήθευση | Πώς ξέρουμε ότι ισχύει | κάθε απαίτηση και κάθε invariant έχει test, και μηχανισμοί και σκηνές τρέχουν στην πρόβα χωρίς αντιπαράδειγμα |
| L8 | Υλοποίηση | Με τι χτίζεται και με ποια σειρά | κάθε component έχει τεχνολογία, κάθε [X] έχει πείραμα, και υπάρχει σειρά υλοποίησης |

**Πίνακας εγκάρσιων θεμάτων.** Στο L4 κάθε component απαντά ρητά σε όλα τα θέματα: ταυτότητα και κλειδιά · ασφάλεια και prompt injection · χρόνος · provenance · αστοχία και ανάκαμψη · Byzantine συμπεριφορά · εξέλιξη και αντικατάσταση · παρατηρησιμότητα · κόστος και πόροι · νομικά και απόρρητο · «Unknown». Ένα κενό κελί σημαίνει ανοιχτό component.

**Πώς κλείνει κάθε επίπεδο:** με την πύλη της Δ-5: δύο ανεξάρτητοι ελεγκτές, κανόνες πληρότητας ανά είδος στοιχείου, πρόβα με έλεγχο vacuity, αντιπαλική επιθεώρηση με τουλάχιστον δύο ανεξάρτητους άξονες και έναν μη-LLM μηχανικό oracle, και «εγκρίνω» του δημιουργού με δική του υπογραφή (Δ-10).

**Δύο κατευθύνσεις ελέγχου.** Η εργασία πάει προς τα κάτω, αλλά στα L4–L5 ξανατρέχει το επιχείρημα non-foreclosure του §0.2 του προχείρου: για κάθε T, ποια ιδιότητα του πυρήνα, αν έλειπε, θα το απέκλειε για πάντα; Ό,τι μπαίνει στον πυρήνα χωρίς ωριμότητα [T] σημειώνεται [X] με σταθερό συμβόλαιο.

**Όταν ένα πείραμα αποτύχει,** ο στόχος δεν αφαιρείται: ακολουθεί επανασχεδιασμός και συμβόλαιο επέκτασης (EP) με δικό του πείραμα.

**Αντιστοίχιση με τις δόσεις του CLAUDE.md:**

| Δόση | Επίπεδα |
|---|---|
| 1 | L0–L2, με τις σκηνές σε δικό τους πακέτο |
| 2 | L3–L5, μαζί με τα invariants των μηχανισμών που μπαίνουν στην πρόβα |
| 3 | L6–L7 |
| μετά | L8 |

**Έρευνα:** γίνεται μόνο όπου μια απόφαση σχεδιασμού εξαρτάται από γεγονός που δεν ξέρω. Είναι στοχευμένη και γίνεται από τον browser του λάπτοπ, ώστε να μην υπάρχει όριο αναζητήσεων.

---

## 1. Τεχνική ετοιμότητα — επαληθευμένη σε αυτό το μηχάνημα, 2026-09-15

### 1.1 SysON σε λειτουργία — ✅

- `eclipsesyson/syson` **v2026.7.0** (build 2026-07-10, EPL-2.0), pinned με digest στο `platform/docker-compose.yml`, με PostgreSQL σε named volume. Ακούει μόνο στο `127.0.0.1:8180`· container `healthy`, HTTP 200.
- Υπάρχει νεότερη έκδοση: η τεκμηρίωση του SysON αναφέρει v2026.9.0. **Δεν δοκιμάστηκε εδώ.**
- Το SysML v2 REST API του SysON απαντά (`/api/rest/projects`, `/commits`, `/elements`, `/roots`), αλλά δίνει **ένα μόνο commit ανά project** («The one and only commit for this project»). Το SysON δεν κρατά ιστορικό εκδόσεων· το ιστορικό του model είναι μόνο ό,τι γράφεται στο git.

### 1.2 mcp-syson: δημιουργία και διαγραφή test project — ✅

- mcp-syson 0.8.7 (31 εργαλεία). Κύκλος που πέρασε: `syson_project_create` → `syson_model_create` → `syson_element_insert_sysml` (requirement def, part def, usages, `satisfy`) → ανάγνωση με `syson_element_children` (5 στοιχεία, μαζί με το `SatisfyRequirementUsage`) → `syson_project_delete` → `syson_project_list` κενή. Επαναλήφθηκε με δεύτερο test project (13 έγγραφα δοκιμών), που επίσης διαγράφηκε.
- Το mcp-syson **δεν** έχει εργαλεία εξαγωγής/εισαγωγής κειμένου, commit, branch ή diff.
- Ιδιορρυθμία: το `syson_model_create` με `root_package_name` αφήνει στο έγγραφο και ένα κενό `package Package1;`.

### 1.3 Εξαγωγή κειμένου SysML v2 στο `model/` — ✅

Η τεκμηρίωση του SysON αναφέρει μόνο το «Download» του UI. Ο μηχανισμός βρέθηκε στον κώδικα, στο tag v2026.7.0: sirius-web `DocumentDownloadController` και SysON `SysMLv2DocumentExporter`.

| Βήμα | Κλήση |
|---|---|
| project id | `GET /api/rest/projects` |
| editing context | `POST /api/graphql` → `viewer.project.currentEditingContext.id` |
| λίστα εγγράφων | `GET /api/projects/{id}` → zip → `manifest.json` → `documentIdsToName` |
| πλήρες model | `documents/{doc}.json` στο ίδιο zip |
| κείμενο SysML v2 | `GET /api/editingcontexts/{ec}/documents/{doc}` με **`Accept: text/html`**. Ο exporter του SysON απαντά μόνο σε `text/html`· με οποιοδήποτε άλλο `Accept` το SysON επιστρέφει 404. |

Το script `platform/export-model.ps1` (PowerShell 7, χωρίς εξαρτήσεις) κάνει staging και ελέγχους πριν αγγίξει το `model/`, και γράφει:

| Αρχείο | Περιεχόμενο |
|---|---|
| `model/<έγγραφο>.sysml` | όψη κειμένου, με κεφαλίδα από γραμμές `//` που ο parser αγνοεί |
| `model/.syson/<έγγραφο>.json` | το JSON του SysON byte-for-byte — **το πλήρες model** |
| `model/.syson/manifest.json` | id εγγράφου → όνομα |
| `model/.syson/text-fidelity.txt` | πιστότητα κάθε όψης κειμένου: ονόματα που λείπουν, κατασκευές που τυπώνονται λάθος, μηνύματα του exporter. Ντετερμινιστικό, χωρίς timestamps. Ένα έγγραφο με εύρημα σημειώνεται LOSSY και μέσα στο ίδιο το `.sysml`. |

Το `.gitattributes` (`model/** -text`) κρατά τα αρχεία του `model/` byte-exact στο git.

Δοκιμές που πέρασαν:

- εξαγωγή → upload του κειμένου ως νέου εγγράφου → νέα εξαγωγή: **ταυτόσημο byte προς byte**, και για το αρχείο με την κεφαλίδα·
- αρνητική: ανύπαρκτο project → exit 1, τίποτα δεν γράφεται·
- σε 13 έγγραφα δοκιμών, η αναφορά πιστότητας σήμανε κάθε γνωστή απώλεια και κανένα καθαρό έγγραφο.

Για το πραγματικό model η εντολή είναι `pwsh -File platform/export-model.ps1 -Project GRAIL-World-OS`. Το project θα δημιουργηθεί στη Φάση Β· μέχρι τότε το `model/` μένει κενό.

### 1.4 Πιστότητα του SysON v2026.7.0 για τις κατασκευές του GRAIL — μετρημένη

Κάθε γραμμή είναι αποτέλεσμα upload → εξαγωγής κειμένου → σύγκρισης με το JSON του model. ✓ = διατηρείται · ✗ = χάνεται ή αλλοιώνεται.

| Κατασκευή | Εισαγωγή (upload / `insert_sysml`) | Όψη κειμένου |
|---|---|---|
| `package`, `part def`/`part`, `attribute` (και με αρχική τιμή), `item def`, `enum def` | ✓ | ✓ |
| `port def` με `in`/`out`, conjugation `~`, `interface def` με `end` | ✓ | ✓ |
| χρήση `interface … connect …` | ✓ (InterfaceUsage) | ✗ τυπώνεται `connection` |
| `requirement def <'REQ-KRN-001'>` (short id), `doc`, `subject`, `require constraint {…}` | ✓ | ✓ (οι τύποι αναφέρονται με το short id) |
| `satisfy … by …` | ✓ | ✓ (ως `assert satisfy`, ισοδύναμο) |
| `#derivation connection` (RequirementDerivation) | ✓ | ✓ |
| `concern def` + `stakeholder` | ✓ | ✓ |
| `frame concern` | ✓ | ✗ τυπώνεται `assume concern` |
| `dependency from … to …` | ✓ | ✗ παραλείπεται |
| `action def` με παραμέτρους `in`/`out`, εμφωλευμένα actions, `flow`, `perform` | ✓ | ✓ (`flow from … to …`, ισοδύναμο) |
| `allocation def`, `allocation … allocate … to …`, `allocate … to …` | ✓ | ✓ |
| `verification def` + `objective { verify … }` | ✓ | ✗ παραλείπεται (ο exporter καταγράφει «not yet handled») |
| `variation` / `variant` | ✓ | ✗ χάνεται το `variant` |
| `abstract part def`, `metadata def` | ✓ | ✓ |
| `constraint def` με σώμα που αναφέρεται σε δικά του features (παραμέτρους ή attributes) | ✗ οι αναφορές μένουν ανεπίλυτες (report: «Unable to resolve name») | ✗ η έκφραση παραλείπεται |
| `assert constraint {…}` σε usage· `assert constraint x : Def;` | ✓ | ✓ |
| δεσμευμένη λέξη ως όνομα χωρίς εισαγωγικά (`transition`, `after`, `verify`) — άκυρη SysML v2 | ✗ **σιωπηλή αποκοπή όλων όσων ακολουθούν**, με «επιτυχία» (upload: κενό report· `insert_sysml`: `inserted:true`) | — |

Τρία συμπεράσματα για τον σχεδιασμό:

1. **Άκυρη είσοδος = σιωπηλή αποκοπή.** Άρα κάθε εγγραφή στο SysON χρειάζεται (α) έλεγχο σύνταξης με ανεξάρτητο parser πριν, και (β) ανάγνωση και σύγκριση ονομάτων μετά. Η πύλη εξαγωγής δεν μπορεί να δει τέτοια απώλεια: ό,τι δεν εισήχθη δεν υπάρχει στο model.
2. **Η όψη κειμένου δεν είναι πλήρης** ακριβώς σε κατασκευές που χρειάζεται το GRAIL: verification cases (οικογένειες VT), σώματα invariants ως `constraint def`, `dependency`, `variant`, `interface`, `frame`. Το JSON του `model/.syson/` είναι πλήρες.
3. **Invariants:** στο SysON δουλεύουν τα `require constraint {…}` και `assert constraint {…}`, όχι το σώμα ενός `constraint def`. Επειδή όμως η έδρα είναι το κείμενο (Δ-1), αυτό δεν περιορίζει τη γλώσσα: βλ. σύμβαση 3 (§2.2).

Αυτά τροφοδοτούν την απόφαση για την έδρα του model (`DECISIONS-FOR-CREATOR.md`) και τις συμβάσεις μοντελοποίησης (§2).

### 1.5 Ελεγκτές SysML v2 που δοκιμάστηκαν

| Ελεγκτής | Πώς έτρεξε | Αποτέλεσμα |
|---|---|---|
| **Spec42** v0.52.0 (MIT, Elan8) | Build για Linux, με SHA256 ίδιο με το επίσημο. Έτρεξε σε container χωρίς δίκτυο, με δίσκο μόνο για ανάγνωση, ως χρήστης χωρίς δικαιώματα. Εγκατάσταση εκτός repo: `%LOCALAPPDATA%\grail-tools\spec42\0.52.0\`. | ✓ `transition` ως όνομα → error, exit 1 (το SysON το έκοβε σιωπηλά)· ✗ `after` και `verify` ως ονόματα → δεν τα πιάνει· ✗ ψευδές error σε έγκυρο `perform cycle.propose;`· ⚠ «not structurally implemented» σε ορισμένες μορφές· σωστοί κωδικοί εξόδου (0/1)· με `--warnings-as-errors` οι προειδοποιήσεις γίνονται λάθη. |
| Parser του Syside ενσωματωμένος στο SysON (`syside-cli dump`) | μέσα στο container του SysON | ✗ δεν αναφέρει λάθη: σε άκυρη είσοδο δίνει exit 0 και απλώς μικρότερο δέντρο. Από εδώ προέρχεται η σιωπηλή αποκοπή. |

Συμπέρασμα: **κανένας δωρεάν ελεγκτής από όσους δοκιμάστηκαν δεν αρκεί μόνος του.** Χρειάζονται δύο ανεξάρτητοι, και όταν διαφωνούν η δόση σταματά (Δ-2, Δ-5).

---

## 2. Δομή του model — πρόταση, ισχύει μετά από «εγκρίνω» Δ-0…Δ-11

### 2.1 Πακέτα και αρχεία

Το root package είναι το `GRAIL_World_OS`, με τα πακέτα της CLAUDE.md. Γράφεται ένα αρχείο ανά πακέτο, και ανά στρώμα όπου χρειάζεται. Έτσι τα diffs διαβάζονται, και κάθε πακέτο ελέγχεται και «προβάρεται» χωριστά.

| Πακέτο | Αρχείο | Περιεχόμενο | Κατασκευές SysML v2 (όλες μετρημένες στην §1.4) |
|---|---|---|---|
| `Telos` | `model/telos.sysml` | T0–T9 | `requirement def <'T1'>` + `doc` |
| `Stakeholders` | `model/stakeholders.sysml` | SH-01…SH-14 και οι concerns τους | `part def`, `concern def` + `stakeholder` |
| `Requirements` | `model/requirements/<περιοχή>.sysml` | REQ-* ανά περιοχή (KRN, COG, …) | `requirement def`/usage, `subject`, `require constraint`, `#derivation` από Telos |
| `OperationalContext` | `model/context.sysml` | εμβέλεια και ρητά εκτός εμβέλειας (§2.2 του προχείρου, αλλάζουν μόνο με συνταγματική αναθεώρηση), system context, trust boundaries TB-1…TB-6, κανονιστικά όρια | `part def`, connections, `requirement def` |
| `Scenarios` | `model/scenarios.sysml` | οι σκηνές OS-01…OS-16, και όσες λείπουν: κλοπή root κλειδιού (KT-23), safe-halt, διαδοχή δημιουργού, ανάκαμψη μετά από καταστροφή (KT-22), απόσυρση/fork/merge | `use case def`, `concern`, ροές |
| `Functions` | `model/functions.sysml` | F-1…F-20, που υλοποιούν τις σκηνές | `action def` με `in`/`out`, εμφωλευμένα actions, `flow` |
| `LogicalArchitecture` | `model/logical/<στρώμα>.sysml` | CMP-* ανά στρώμα | `part def`, `port def`, parts, `satisfy`, `allocate` |
| `Interfaces` | `model/interfaces.sysml` | ICD-* | `interface def` με `end`, `port def` με items |
| `Constitution` | `model/constitution.sysml` | INV-* και tiers | ένα `constraint def` ανά invariant, που το αναφέρουν `require constraint`/`assert constraint` (σύμβαση 3)· metadata Tier |
| `Verification` | `model/verification.sysml` | VT-*, KT-*, EXP-* | `verification def` + `objective { verify … }` |
| `ExtensionPoints` | `model/extension-points.sysml` | EP-* | `abstract part def`, `variation`/`variant` |
| `Deployment` | `model/deployment.sysml` | planes, deployment profiles, ζώνες, RPO/RTO, fault model ανά στρώμα και profile, απογραφή TCB | `part`, `allocate`, `requirement def` |
| `Hazards` | `model/hazards.sysml` | ανάλυση κινδύνων STPA: losses, hazards, control structure, unsafe control actions | `part def`, connections, `requirement def` |
| `Rationale` | `model/rationale.sysml` | αποφάσεις (DEC, ADR), κενά (GAP), change records, ανοιχτά ερωτήματα, με κατάσταση και συνθήκη επανεξέτασης | `metadata def`, `dependency` |
| (βιβλιοθήκη) | `model/library/grail-kernel.sysml` | ο semantic kernel του GRAIL, τα metadata (Status [T]/[X]/[E], Tier), το μητρώο εδρών (κάθε έννοια μία έδρα· TLA+, Lean, Cedar και σχήματα δεδομένων αναφέρονται με URI και hash ή παράγονται) και η μία κλίμακα βαθμών τεκμηρίωσης | `metadata def`, βασικοί ορισμοί (Δ-3) |

### 2.2 Συμβάσεις μοντελοποίησης

Όλες προκύπτουν από τις μετρήσεις.

1. **Τα IDs του προχείρου γίνονται short names:** `requirement def <'REQ-KRN-001'> LedgerRecordsEveryTransition`.
2. **Κανένα όνομα δεν είναι δεσμευμένη λέξη** της SysML v2 (π.χ. `transition`, `after`, `verify`, `state`, `flow`)· αν χρειαστεί, μπαίνει σε εισαγωγικά. Το ελέγχουν οι ελεγκτές (Δ-5, βήμα 1).
3. **Invariants:** κάθε invariant γράφεται **μία φορά** ως `constraint def` στο πακέτο `Constitution`, και το αναφέρουν όσα requirements και usages το χρειάζονται (`require constraint x : Def;`, `assert constraint x : Def;`). Η έδρα είναι το κείμενο (Δ-1), οπότε η γλώσσα δεν περιορίζεται από εργαλείο που δεν είναι έδρα· η απώλεια του SysON στα σώματα των `constraint def` (§1.4) καταγράφεται ως δηλωμένη απώλεια προβολής. Η προηγούμενη σύμβαση υποβίβαζε τη γλώσσα εξαιτίας του SysON (διόρθωση κατά DEC-X-01).
4. **Κατάσταση και Tier** δηλώνονται ως metadata, όχι ως ελεύθερο κείμενο.
5. **Ιχνηλασιμότητα μόνο με πρότυπες σχέσεις:**
   - `#derivation`: Telos → REQ·
   - `satisfy`: REQ → CMP·
   - `verify`: VT/KT → REQ·
   - `allocate`: F → CMP·
   - τυποποιημένες σχέσεις (metadata ή `dependency` με δηλωμένο είδος) για REQ ↔ INV, CMP ↔ ICD (provider/consumer) και INV → σημείο επιβολής.

   Καμία ιχνηλασιμότητα μέσα σε σχόλια.
6. **Ονόματα στοιχείων στα αγγλικά, `doc` στα ελληνικά** με αγγλικούς τεχνικούς όρους, για να διαβάζεις εσύ το σχέδιο. Εναλλακτικά όλα στα αγγλικά, όπως ήθελε ο κανόνας του προχείρου για τα machine artifacts. Είναι επιλογή σου.
7. **Κάθε αρχείο ξεκινά με κεφαλίδα copyright** ως σχόλιο `//`, που ο parser αγνοεί (μετρημένο).

### 2.3 Όψεις για τον δημιουργό, για να βλέπεις και να αποφασίζεις

- **Ροές:** οι σκηνές παράγονται από τα πακέτα `Scenarios` και `Functions` ως διαγράμματα Mermaid στο `docs/views/`, και τις βλέπεις στο GitHub, ακόμη και από κινητό.
- **Ιχνηλασιμότητα:** ο πίνακας REQ → CMP → ICD → INV → Test **παράγεται** από το model (`docs/views/traceability.md`), δεν γράφεται με το χέρι.
- **Πρόβα (Δ-7):**
  - εκτελέσιμες προδιαγραφές TLA+ για τους κρίσιμους μηχανισμούς, που τις ελέγχει εξαντλητικά ο model checker·
  - προσομοίωση των σεναρίων OS με stubs και έγχυση βλαβών.

  Τα αποτελέσματα βγαίνουν ως διαγράμματα ακολουθίας βήμα-βήμα (`docs/views/rehearsal/`), μαζί με κάθε αντιπαράδειγμα που βρέθηκε.

---

## 3. Πρώτες δόσεις — μετά από «εγκρίνω»

| Δόση | Περιεχόμενο | Είσοδος | Πύλη (Δ-5) |
|---|---|---|---|
| **0 — τεχνική** | επιλογή του ζεύγους ελεγκτών ανάμεσα σε Spec42, Syside, OMG Pilot, MontiCore, sysml-v2-lsp, με το `platform/fidelity/GrailFidelityTest.sysml` και τα κριτήρια της Δ-2· script ελέγχου με δύο ελεγκτές και κανόνες πληρότητας, **ίδιος κώδικας** τοπικά και στο GitHub Action (όχι χωριστός runner)· σκελετός της πρόβας (Δ-7): TLA+ toolchain (TLC/Apalache) σε container και προσομοιωτής σκηνών που διαβάζει το model· EXP-18 (απόδοση και εκφραστικότητα της σημασιολογίας σε Lean, από το οποίο εξαρτάται η Α-2)· κλειδί έγκρισης σε δική σου συσκευή και προστασία main/tags (Δ-10)· ενημέρωση CLAUDE.md/README κατά Δ-1 και Δ-9 | Δ-0…Δ-11 | ο έλεγχος τρέχει και πέφτει κόκκινος στα γνωστά λάθη· η πρόβα βρίσκει ένα εσκεμμένα φυτεμένο λάθος σχεδίου |
| **1 — Telos, Context, Stakeholders, Scenarios, Requirements** | πακέτα `Telos` (με μετρήσιμο κριτήριο για κάθε T, Δ-0), `OperationalContext`, `Stakeholders` (και όσοι λείπουν: υποκείμενα δεδομένων, φορέας, provider/deployer κατά AI Act, ασφαλιστής/πιστοποιητής), `Scenarios`, `Requirements`· `#derivation` για κάθε REQ | T0–T9, SH, OS, οι 114 REQ με την ετυμηγορία τους και τον κανόνα της Δ-6, όσα GAP-* εγκριθούν ως νέες απαιτήσεις· **εγκεκριμένα τα Μέρη Α και Β**, και οι αποφάσεις του Μέρους Γ που αλλάζουν στοιχεία της Δόσης 1 (DEC-X-03) | ελεγκτές· καμία REQ χωρίς Telos ή σκηνή· αντιπαλική επιθεώρηση· «εγκρίνω» |
| **2 — Functions, LogicalArchitecture, Interfaces, Deployment, Hazards** | F-*, τα CMP ανά στρώμα (75, και όσα εγκριθούν μέσω ID-REQUEST), τα 32 ICD με ports/items, `satisfy`, `allocate`, fault model και TCB· ανάλυση κινδύνων STPA· πρόβα των κρίσιμων μηχανισμών μαζί με τα invariants τους, και των σκηνών | πριν από τη δόση κρίνεται η EXP-19 (νομική ανάλυση: AI Act, GDPR, Κώδικας Δικηγόρων)· οι αποφάσεις ανά στρώμα που χρειάζεται η δόση | ελεγκτές· κάθε REQ έχει CMP και ICD· κάθε CMP έχει λειτουργία· σωστή κατεύθυνση εξαρτήσεων· **πρόβα χωρίς αντιπαράδειγμα και με έλεγχο vacuity**· «εγκρίνω» |
| **3 — Constitution, Verification, ExtensionPoints** | τα υπόλοιπα INV-* (σύμβαση 3), VT/KT/EXP με `verify` και στατιστικό σχέδιο, EP-* με το πρότυπο συμβολαίου (ID, stub interface, πύλη ενεργοποίησης, πείραμα, invariants, περιοδικό drill)· assurance case | τα εγκεκριμένα DEC για επαλήθευση (Α-9) | πλήρης: κάθε REQ ↔ μέθοδος επαλήθευσης· **κανένα invariant δεν σπάει στην πρόβα**· «εγκρίνω» |

Μετά από κάθε δόση γίνονται commit, υπογεγραμμένο tag και push, και ακολουθεί **παύση για έλεγχο από τον δημιουργό** (CLAUDE.md).

Το `platform/export-model.ps1` χρειάζεται μόνο όσο το SysON χρησιμοποιείται ως αντίγραφο εργασίας. Με έδρα το κείμενο (Δ-1), τα αρχεία του `model/` γράφονται απευθείας και ελέγχονται από την πύλη.
