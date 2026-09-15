# DESIGN-START-PLAN — Δομή του model στο SysON και πρώτες δόσεις

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

**Κατάσταση:** ΠΡΟΤΑΣΗ. Ισχύει μόνο μετά από «εγκρίνω» του δημιουργού (CLAUDE.md, Φάση Β).

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
3. **Invariants:** μοντελοποιούνται με `require constraint {…}` σε requirement ή `assert constraint {…}` σε usage, που δουλεύουν· όχι με σώμα σε `constraint def`.

Αυτά τροφοδοτούν την απόφαση για την έδρα του model (`DECISIONS-FOR-CREATOR.md`) και τις συμβάσεις μοντελοποίησης (§2).

### 1.5 Ελεγκτές SysML v2 που δοκιμάστηκαν

| Ελεγκτής | Πώς έτρεξε | Αποτέλεσμα |
|---|---|---|
| **Spec42** v0.52.0 (MIT, Elan8) | Build για Linux, με SHA256 ίδιο με το επίσημο. Έτρεξε σε container χωρίς δίκτυο, με δίσκο μόνο για ανάγνωση, ως χρήστης χωρίς δικαιώματα. Εγκατάσταση εκτός repo: `%LOCALAPPDATA%\grail-tools\spec42\0.52.0\`. | ✓ `transition` ως όνομα → error, exit 1 (το SysON το έκοβε σιωπηλά)· ✗ `after` και `verify` ως ονόματα → δεν τα πιάνει· ✗ ψευδές error σε έγκυρο `perform cycle.propose;`· ⚠ «not structurally implemented» σε ορισμένες μορφές· σωστοί κωδικοί εξόδου (0/1)· με `--warnings-as-errors` οι προειδοποιήσεις γίνονται λάθη. |
| Parser του Syside ενσωματωμένος στο SysON (`syside-cli dump`) | μέσα στο container του SysON | ✗ δεν αναφέρει λάθη: σε άκυρη είσοδο δίνει exit 0 και απλώς μικρότερο δέντρο. Από εδώ προέρχεται η σιωπηλή αποκοπή. |

Συμπέρασμα: **κανένας δωρεάν ελεγκτής από όσους δοκιμάστηκαν δεν αρκεί μόνος του.** Χρειάζονται δύο ανεξάρτητοι, και όταν διαφωνούν η δόση σταματά (Δ-2, Δ-5).

---

## 2. Δομή του model — πρόταση, ισχύει μετά από «εγκρίνω» Δ-1…Δ-7

### 2.1 Πακέτα και αρχεία

Το root package είναι το `GRAIL_World_OS`, με τα πακέτα της CLAUDE.md. Γράφεται ένα αρχείο ανά πακέτο, και ανά στρώμα όπου χρειάζεται. Έτσι τα diffs διαβάζονται, και κάθε πακέτο ελέγχεται και «προβάρεται» χωριστά.

| Πακέτο | Αρχείο | Περιεχόμενο | Κατασκευές SysML v2 (όλες μετρημένες στην §1.4) |
|---|---|---|---|
| `Telos` | `model/telos.sysml` | T0–T9 | `requirement def <'T1'>` + `doc` |
| `Stakeholders` | `model/stakeholders.sysml` | SH-01…SH-14 και οι concerns τους | `part def`, `concern def` + `stakeholder` |
| `Requirements` | `model/requirements/<περιοχή>.sysml` | REQ-* ανά περιοχή (KRN, COG, …) | `requirement def`/usage, `subject`, `require constraint`, `#derivation` από Telos |
| `Functions` | `model/functions.sysml` | F-1…F-20 και τα σενάρια OS-01…OS-16 ως ροές | `action def` με `in`/`out`, εμφωλευμένα actions, `flow` |
| `LogicalArchitecture` | `model/logical/<στρώμα>.sysml` | CMP-* ανά στρώμα | `part def`, `port def`, parts, `satisfy`, `allocate` |
| `Interfaces` | `model/interfaces.sysml` | ICD-* | `interface def` με `end`, `port def` με items |
| `Constitution` | `model/constitution.sysml` | INV-* και tiers | `requirement def` + `require constraint` (σύμβαση 3), metadata Tier |
| `Verification` | `model/verification.sysml` | VT-*, KT-*, EXP-* | `verification def` + `objective { verify … }` |
| `ExtensionPoints` | `model/extension-points.sysml` | EP-* | `abstract part def`, `variation`/`variant` |
| (βιβλιοθήκη) | `model/library/grail-kernel.sysml` | ο semantic kernel του GRAIL και τα metadata (Status [T]/[X]/[E], Tier) | `metadata def`, βασικοί ορισμοί (Δ-3) |

### 2.2 Συμβάσεις μοντελοποίησης

Όλες προκύπτουν από τις μετρήσεις.

1. **Τα IDs του προχείρου γίνονται short names:** `requirement def <'REQ-KRN-001'> LedgerRecordsEveryTransition`.
2. **Κανένα όνομα δεν είναι δεσμευμένη λέξη** της SysML v2 (π.χ. `transition`, `after`, `verify`, `state`, `flow`)· αν χρειαστεί, μπαίνει σε εισαγωγικά. Το ελέγχουν οι ελεγκτές (Δ-5, βήμα 1).
3. **Invariants:** γράφονται με `require constraint {…}` μέσα σε requirement ή με `assert constraint {…}` μέσα σε usage, **όχι** ως σώμα `constraint def`, που μετρήθηκε ότι δεν επιλύεται.
4. **Κατάσταση και Tier** δηλώνονται ως metadata, όχι ως ελεύθερο κείμενο.
5. **Ιχνηλασιμότητα μόνο με πρότυπες σχέσεις:**
   - `#derivation`: Telos → REQ·
   - `satisfy`: REQ → CMP·
   - `verify`: VT/KT → REQ·
   - `allocate`: F → CMP.

   Καμία ιχνηλασιμότητα μέσα σε σχόλια.
6. **Ονόματα στοιχείων στα αγγλικά, `doc` στα ελληνικά** με αγγλικούς τεχνικούς όρους, για να διαβάζεις εσύ το σχέδιο. Εναλλακτικά όλα στα αγγλικά, όπως ήθελε ο κανόνας του προχείρου για τα machine artifacts. Είναι επιλογή σου.
7. **Κάθε αρχείο ξεκινά με κεφαλίδα copyright** ως σχόλιο `//`, που ο parser αγνοεί (μετρημένο).

### 2.3 Όψεις για τον δημιουργό, για να βλέπεις και να αποφασίζεις

- **Ροές:** τα σενάρια OS-01…OS-16 παράγονται από το πακέτο `Functions` ως διαγράμματα Mermaid στο `docs/views/`, και τα βλέπεις στο GitHub, ακόμη και από κινητό.
- **Ιχνηλασιμότητα:** ο πίνακας REQ → CMP → ICD → INV → Test **παράγεται** από το model (`docs/views/traceability.md`), δεν γράφεται με το χέρι.
- **Πρόβα (Δ-7):**
  - εκτελέσιμες προδιαγραφές TLA+ για τους κρίσιμους μηχανισμούς, που τις ελέγχει εξαντλητικά ο model checker·
  - προσομοίωση των σεναρίων OS με stubs και έγχυση βλαβών.

  Τα αποτελέσματα βγαίνουν ως διαγράμματα ακολουθίας βήμα-βήμα (`docs/views/rehearsal/`), μαζί με κάθε αντιπαράδειγμα που βρέθηκε.

---

## 3. Πρώτες δόσεις — μετά από «εγκρίνω»

| Δόση | Περιεχόμενο | Είσοδος | Πύλη (Δ-5) |
|---|---|---|---|
| **0 — τεχνική** | επιλογή δεύτερου ελεγκτή με το `platform/fidelity/GrailFidelityTest.sysml`· script ελέγχου με δύο ελεγκτές και κανόνες πληρότητας, και ως GitHub Action· σκελετός της πρόβας (Δ-7): TLA+ toolchain (TLC/Apalache) σε container και προσομοιωτής σεναρίων που διαβάζει το model· ενημέρωση CLAUDE.md/README κατά Δ-1 | Δ-1…Δ-7 | ο έλεγχος τρέχει και πέφτει κόκκινος στα γνωστά λάθη· η πρόβα βρίσκει ένα εσκεμμένα φυτεμένο λάθος σχεδίου |
| **1 — Telos, Stakeholders, Requirements** | πακέτα `Telos`, `Stakeholders`, `Requirements`· `#derivation` για κάθε REQ | T0–T9, SH, οι 114 REQ με την ετυμηγορία τους (Δ-6), όσα GAP-* εγκριθούν ως νέες απαιτήσεις | ελεγκτές· καμία REQ χωρίς Telos· «εγκρίνω» |
| **2 — Functions, LogicalArchitecture, Interfaces** | F-*, τα 75 CMP ανά στρώμα, τα 32 ICD με ports/items, `satisfy`, `allocate`, σενάρια ροής· πρόβα των κρίσιμων μηχανισμών και των σεναρίων | οι αρχές Α-1…Α-12 και οι αποφάσεις ανά στρώμα | ελεγκτές· κάθε REQ έχει CMP και ICD· **πρόβα χωρίς αντιπαράδειγμα**· «εγκρίνω» |
| **3 — Constitution, Verification, ExtensionPoints** | INV-* (σύμβαση 3), VT/KT/EXP με `verify`, EP-*· τα invariants μπαίνουν στην πρόβα | τα εγκεκριμένα DEC για επαλήθευση (Α-9) | πλήρης: κάθε REQ ↔ test· **κανένα invariant δεν σπάει στην πρόβα**· «εγκρίνω» |

Μετά από κάθε δόση γίνονται commit, υπογεγραμμένο tag και push, και ακολουθεί **παύση για έλεγχο από τον δημιουργό** (CLAUDE.md).

Το `platform/export-model.ps1` χρειάζεται μόνο όσο το SysON χρησιμοποιείται ως αντίγραφο εργασίας. Με έδρα το κείμενο (Δ-1), τα αρχεία του `model/` γράφονται απευθείας και ελέγχονται από την πύλη.
