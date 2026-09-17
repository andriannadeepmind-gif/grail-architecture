# GRAIL — Maximum Frontier Architecture (MFA) package

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

Το modular, patch-addressable αρχιτεκτονικό πακέτο του GRAIL / World OS. **Frozen base: 0.4.0 / commit `6768c6c` · current design snapshot: 0.4.1 · status: PROPOSED / UNREVIEWED — τίποτα δεν είναι admitted architecture πριν από Creator Approval.** Ο παρών κύκλος αλλάζει μόνο το σχέδιο: καμία γραμμή παραγωγικού κώδικα και καμία αλλαγή στα `.sysml`. Το commit του πακέτου είναι preservation snapshot, όχι κύρωση του σχεδίου.

## Τι είναι

Το `BEST_FOUND_IN_EXAMINED_SPACE_UNDER_DECLARED_AXES` τεχνικό σχέδιο του συγκεκριμένου cut — όχι ισχυρισμός αποδεδειγμένου architecture ceiling. Τα εννέα αρχικά περάσματα διατηρούνται ως ιστορία· η 0.4.1 διορθώνει Root/Telos separation, status collapse, fail-open evidence, untyped dependency cycles, promotion/evaluator coupling και claim traceability χωρίς να μειώνει τον στόχο ASI.

Ανθρώπινο σημείο εισόδου: `docs/discovery/POST-VERDICT-ARCHITECTURE-PLAN.md`.

## Πώς διαβάζεται (σειρά)

1. `POST-VERDICT-ARCHITECTURE-PLAN.md` (../) — τι αποφασίζεται, τι χτίζεται πρώτο, τι μένει ανοιχτό.
2. `DECISION-LOG.md` — MFA-DEC-001…015 (χρειάζονται «εγκρίνω»), MFA-DEC-101…105 (αποφάσεις του πακέτου), ημερολόγιο Pass I.
3. `TECHNICAL-ARCHITECTURE.md` — η ανθρώπινη προβολή του σχεδίου· `diagrams/MFA-DIA-00.mmd` είναι ο master map και τα `01…25` οι λεπτομερείς όψεις.
4. `IMPLEMENTATION-ROADMAP.md` — Δόση 0 («ο copilot που δίνει receipts») … Δόση 5, πύλη κάθε δόσης, το ακριβές πρώτο βήμα.
5. Κανονικές έδρες: `ARCHITECTURE-METAMODEL` (Root, statuses, evidence, dependencies, risk, Civilizations/trust topology) · `CLAIM-DISPOSITIONS` (113 claims) · `OBJECTIVE-SPACE` (58 OBJ, 8 TEL) · `CAPABILITY-LATTICE` (108 CAP) · `ARCHITECTURE-ELEMENTS` (127 ELM) · `CONTRACTS` (78) · `INVARIANTS` (124) · `VERIFICATION-OBLIGATIONS` (96) · `UNKNOWNS` (61) · `CONFLICTS` (50) · `RESEARCH-PROGRAMS` (40) · `INVENTIONS` (44) · `RELATIONS` (παράγεται).
6. `alternatives/` (14) · `mechanisms/` / `inventions/` · `adversarial/` (29) · `patches/` · `diagrams/` (26 Mermaid sources: master `00` + detail `01…25`).
7. Ledgers: `CAPABILITY-CONSERVATION.md` (278 γραμμές, 0 DROPPED FOR CONVENIENCE) · `SUPERSEDED-REGISTER.md` (Delta Ledger, REPLACE με capability vectors) · `AI-CONTRIBUTION-LEDGER.md` · `COUNT-PROVENANCE.md` · `CHANGELOG.md`.
8. `PATCH-PROTOCOL.md` + `tools/` (`check-package.py` R1–R12, `apply-patch.py`, `build-manifest.py`, `count-provenance.py`) · `MANIFEST.yaml` (SHA-256 κάθε αρχείου).

## Οι τρεις αλήθειες που το πακέτο λέει για τον εαυτό του

- **Το πλεονέκτημα του έτους 1 δεν είναι νοημοσύνη** — είναι receipts μέχρι raw bytes, taint 100 % εντός Δ, συνέχεια κατά την αλλαγή παρόχου, τέσσερις κλάσεις εξόδου, αποδεικτική διαγραφή (MFA-ATK-10/17). Η κατανομή προτάσεων γίνεται ενδογενής με το MFA-MECH-019 (R, διαψεύσιμο).
- **Το Telos δεν κλειδώνεται εδώ**: MFA-TEL-08 συνιστάται με ρητή διάταξη 17 αντιφάσεων· χτίζεται πρώτα η τομή (MFA-ELM-096).
- **Τι δεν έγινε**: Devil's Advocate plugin NO_SUBSCRIPTION (οι επιθέσεις είναι του συντάκτη)· SysON MCP απρόσιτο (KerML έλεγχος PENDING). Η υπογραφή κάθε patch προέρχεται από το commit που το περιέχει· μια working-tree μορφή παραμένει UNVERIFIED μέχρι να διατηρηθεί σε commit.

## Πώς αλλάζει

Μόνο με patch (`PATCH-PROTOCOL.md`): `python3 tools/apply-patch.py patches/MFA-PATCH-nnnn.yaml` → `python3 tools/check-package.py` → `python3 tools/build-manifest.py <version>`. Το `-R` γράφεται από το εργαλείο. Το Telos, μια απόφαση, ένα στοιχείο: όλα IDs, όλα patch.


## Ω-ASI 0.4.0 — frozen source και 0.4.1 design correction

Η 0.4.0 διατηρεί την ASI ως REQUIRED target και προσθέτει τους μηχανισμούς/ικανότητες/πειραματικά προγράμματα. Η 0.4.1 δεν αφαιρεί τίποτα: καθιστά ρητό τι είναι στόχος, σχέδιο, realization, evidence, authority και operational scope. Τα `MFA-PATCH-0020…0025` παραμένουν μηχανικά εφαρμοσμένα αλλά authority=`PROVISIONAL`, ενώ η ακριβής mandate provenance παραμένει `MFA-UNK-134` μέχρι exact receipt. Μόνο ο δημιουργός εγκρίνει.
