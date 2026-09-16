# PATCH-PROTOCOL — πώς αλλάζει το πακέτο χωρίς ολική επανεγγραφή

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

Έδρα: αυτό το αρχείο. Ισχύει για κάθε αρχείο του `docs/discovery/frontier-architecture/` και για το `docs/discovery/POST-VERDICT-ARCHITECTURE-PLAN.md`. Η μορφή προκύπτει από την εντολή Ω-MAXIMUM §18–§19 και εξειδικεύεται εδώ. Καμία αλλαγή στο πακέτο δεν γίνεται εκτός patch· κανένα patch δεν διαγράφει ιστορία.

## 1. Χώρος ονομάτων και σταθερότητα των IDs

Κάθε στοιχείο του πακέτου φέρει ID στον χώρο `MFA-*` (Maximum Frontier Architecture). Τα IDs:

- **δεν αντικαθιστούν** κανένα canonical ID του corpus (`REQ-*`, `CMP-*`, `ICD-*`, `INV-*`, `KT-*`, `EXP-*`, `ADR-*`, `EP-*`, `T0–T9`)· όπου ένα στοιχείο MFA αντιστοιχεί σε canonical στοιχείο, η αντιστοίχιση γράφεται στο πεδίο `source_provenance` και στο `RELATIONS.yaml` (σχέση `corresponds-to`, `supersedes`, `strengthens`, `splits`, `merges`)·
- **δεν γίνονται admitted architecture** χωρίς Creator Approval· μέχρι τότε κάθε στοιχείο έχει `status: PROPOSED`·
- **παραμένουν σταθερά** σε κάθε διόρθωση: ένα ID δεν αλλάζει όταν αλλάζει τίτλος, θέση, αρχείο ή περιεχόμενο· αν το περιεχόμενο αλλάζει ριζικά, το στοιχείο παίρνει `SUPERSEDE` και **νέο** ID·
- **δεν επαναχρησιμοποιούνται** ποτέ: ένα ID που πήρε `DEPRECATE` ή `SUPERSEDE` μένει στο αρχείο με την τελική του κατάσταση.

| Πρόθεμα | Είδος | Έδρα |
|---|---|---|
| `MFA-OBJ-nnn` | επιδίωξη (Objective Space) | `OBJECTIVE-SPACE.yaml` |
| `MFA-TEL-nn` | υποψήφιο Telos (Telos Candidate Lattice) | `OBJECTIVE-SPACE.yaml` |
| `MFA-CAP-nnn` | ικανότητα (Capability Lattice) | `CAPABILITY-LATTICE.yaml` |
| `MFA-ELM-nnn` | αρχιτεκτονικό στοιχείο (υποσύστημα, όργανο, δομή) | `ARCHITECTURE-ELEMENTS.yaml` |
| `MFA-CON-nnn` | συμβόλαιο / διεπαφή | `CONTRACTS.yaml` |
| `MFA-INV-nnn` | αναλλοίωτο | `INVARIANTS.yaml` |
| `MFA-UNK-nnn` | άγνωστο με σχέδιο παρατήρησης | `UNKNOWNS.yaml` |
| `MFA-CFL-nnn` | σύγκρουση με διατήρηση και των δύο πλευρών | `CONFLICTS.yaml` |
| `MFA-RSP-nnn` | ερευνητικό / κατασκευαστικό πρόγραμμα | `RESEARCH-PROGRAMS.yaml` |
| `MFA-MECH-nnn` | επινόηση με Mechanism Dossier | `INVENTIONS.yaml` + `mechanisms/MFA-MECH-nnn.md` |
| `MFA-VO-nnn` | υποχρέωση επαλήθευσης | `VERIFICATION-OBLIGATIONS.yaml` |
| `MFA-REL-nnnn` | σχέση μεταξύ στοιχείων | `RELATIONS.yaml` |
| `MFA-ALT-n` | εναλλακτική πλήρης αρχιτεκτονική (Pass C) | `alternatives/MFA-ALT-n.md` |
| `MFA-ATK-nn` | αντιπαλική επίθεση (Pass G) | `adversarial/MFA-ATK-nn.md` |
| `MFA-DIA-nn` | διάγραμμα Mermaid | `diagrams/MFA-DIA-nn.mmd` |
| `MFA-DEC-nnn` | απόφαση του πακέτου | `DECISION-LOG.md` |
| `MFA-DEP-n` | προφίλ ανάπτυξης | `TECHNICAL-ARCHITECTURE.md` §Deployment |
| `MFA-PATCH-nnnn` | patch | `patches/MFA-PATCH-nnnn.yaml` |

## 2. Πράξεις patch

Κάθε αλλαγή είναι ακριβώς μία από τις εννέα πράξεις της εντολής §18, με τη σημασιολογία που ορίζεται εδώ:

| Πράξη | Σημασία | Τι απαγορεύεται |
|---|---|---|
| `ADD` | νέο στοιχείο με νέο ID | προσθήκη στοιχείου χωρίς `source_provenance` και χωρίς `created_by` |
| `MODIFY` | αλλαγή πεδίων υπάρχοντος στοιχείου, ίδιο ID, `version += 1` | αλλαγή που μειώνει `capabilities` χωρίς εγγραφή στο `CAPABILITY-CONSERVATION.md` |
| `RELINK` | αλλαγή σχέσεων (`RELATIONS.yaml`) χωρίς αλλαγή στοιχείων | σιωπηλή αφαίρεση σχέσης `satisfies`/`verifies` χωρίς αντικαταστάτη |
| `SPLIT` | ένα στοιχείο → ≥2 νέα στοιχεία· το παλιό παίρνει `status: SPLIT` και `superseded_by: [νέα]` | απώλεια ικανότητας στο άθροισμα των νέων |
| `MERGE` | ≥2 στοιχεία → 1 νέο· τα παλιά παίρνουν `status: MERGED` | `MERGE` που δεν είναι `MERGED WITHOUT LOSS` κατά το Capability Conservation Ledger |
| `SUPERSEDE` | νέο στοιχείο αντικαθιστά παλιό· το παλιό μένει με `status: SUPERSEDED`, `superseded_by` | η λέξη «strictly superior» χωρίς Delta Ledger εγγραφή με capability vector πριν/μετά |
| `DEPRECATE` | στοιχείο βγαίνει από την ενεργή αρχιτεκτονική χωρίς αντικαταστάτη | `DEPRECATE` με αιτιολογία «για ευκολία»· απαιτείται μία από τις οκτώ τύχες του Ledger — η `DROPPED FOR CONVENIENCE` δεν υπάρχει |
| `RESTORE` | επαναφορά στοιχείου από `DEPRECATED`/`SUPERSEDED` σε ενεργό | επαναφορά χωρίς αναφορά στο patch που το είχε αποσύρει |
| `RECLASSIFY` | αλλαγή `type`, `maturity` ή `status` χωρίς αλλαγή ουσίας | ανύψωση `maturity` χωρίς νέο τεκμήριο στο `verification` |

## 3. Μορφή patch

Κάθε patch είναι ένα αρχείο `patches/MFA-PATCH-nnnn.yaml`:

```yaml
id: MFA-PATCH-0001
title: <μία γραμμή>
operation: ADD | MODIFY | RELINK | SPLIT | MERGE | SUPERSEDE | DEPRECATE | RESTORE | RECLASSIFY
targets: [MFA-ELM-012, MFA-CON-004]      # τα IDs που αλλάζουν
base:
  package_version: 0.1.0                  # από το MANIFEST.yaml
  file_hashes:                            # SHA-256 κάθε αρχείου που αγγίζει το patch, ΠΡΙΝ
    ARCHITECTURE-ELEMENTS.yaml: <sha256>
preconditions:                            # τι πρέπει να ισχύει για να εφαρμοστεί
  - "MFA-ELM-012.status == PROPOSED"
change:                                   # η ακριβής αλλαγή, ανά πεδίο
  MFA-ELM-012:
    state_model: <νέα τιμή>
rationale: <γιατί — με αναφορά σε αρχείο:γραμμή ή σε MFA-ATK-nn / MFA-DEC-nnn>
evidence: [<πηγή>, ...]                   # τεκμήρια· «καμία» γράφεται ρητά
affected_dependencies: [MFA-ELM-020]      # στοιχεία που εξαρτώνται από τους στόχους
capability_impact:                        # υποχρεωτικό, ακόμη και αν είναι μηδενικό
  gained: []
  at_risk: []
  ledger_entry: CAPABILITY-CONSERVATION.md#<anchor>
migration: <πώς μεταβαίνει ό,τι ήδη αναφέρεται στους στόχους>
verification: <ποιος έλεγχος αποδεικνύει ότι το patch έκανε αυτό που λέει — π.χ. tools/check-package.py>
rollback: MFA-PATCH-nnnn-R                # το αντίστροφο patch, γραμμένο μαζί
author: <Stavropoulos Law® ή ο ρόλος που το προτείνει>
status: PROPOSED | APPLIED | REJECTED
```

Το αντίστροφο patch (`-R`) γράφεται **μαζί** με το ευθύ και έχει τα ίδια πεδία· χωρίς αυτό το ευθύ δεν εφαρμόζεται.

## 4. Πώς εφαρμόζεται ένα patch

1. Έλεγχος ότι τα `file_hashes` της βάσης ταιριάζουν με το τρέχον `MANIFEST.yaml` — αλλιώς το patch **δεν εφαρμόζεται** και ξαναγράφεται πάνω στη νέα βάση.
2. Έλεγχος των `preconditions`.
3. Εφαρμογή της αλλαγής **μόνο** στα πεδία των `targets`· κάθε στόχος παίρνει `version += 1` και μία εγγραφή στο `change_history` του: `{patch: MFA-PATCH-nnnn, op, date, summary}`.
4. Ενημέρωση `MANIFEST.yaml` (νέοι SHA-256, `package_version` κατά semver: `MAJOR` για `SUPERSEDE`/`DEPRECATE` στοιχείου με `status: APPROVED`, `MINOR` για `ADD`/`SPLIT`/`MERGE`, `PATCH` για τα υπόλοιπα).
5. Ενημέρωση `CHANGELOG.md` (μία γραμμή ανά patch) και, όπου απαιτείται, `CAPABILITY-CONSERVATION.md` και `SUPERSEDED-REGISTER.md`.
6. Εκτέλεση `tools/check-package.py`: κάθε αναφορά σε ID επιλύεται, κάθε στοιχείο έχει τα υποχρεωτικά πεδία, κάθε `superseded_by` δείχνει σε υπαρκτό ID, καμία ικανότητα του Ledger δεν έμεινε χωρίς τύχη.
7. Το patch παίρνει `status: APPLIED`. **Ποτέ δεν διαγράφεται**: το `patches/` είναι append-only, όπως και το ιστορικό κάθε στοιχείου.

## 5. Το Telos ως στοιχείο που διορθώνεται με patch

Το Telos δεν κλειδώνεται (εντολή §4). Το `OBJECTIVE-SPACE.yaml` κρατά το πλέγμα υποψηφίων `MFA-TEL-nn` και τη συνιστώμενη σύνθεση με `status: RECOMMENDED`. Η επιλογή του δημιουργού είναι ένα patch `RECLASSIFY` (`RECOMMENDED → APPROVED` σε ένα, `REJECTED BY CREATOR` στα άλλα)· η αλλαγή Telos αργότερα είναι `SUPERSEDE` του υποψηφίου, και ο **χάρτης ευαισθησίας** (`OBJECTIVE-SPACE.yaml: sensitivity_map`) λέει εκ των προτέρων ποια `MFA-ELM-*` πρέπει να ξαναδούν patch — τα υπόλοιπα (το «robust substrate») δεν αγγίζονται.

## 6. Projections

Το `TECHNICAL-ARCHITECTURE.md`, το `POST-VERDICT-ARCHITECTURE-PLAN.md` και τα διαγράμματα `diagrams/*.mmd` είναι **προβολές** των YAML αρχείων. Όταν ένα patch αλλάζει YAML, η προβολή ενημερώνεται στο ίδιο patch (πεδίο `change`), ποτέ ανάποδα. Αν προβολή και YAML διαφωνούν, ισχύει το YAML και η διαφωνία είναι ελάττωμα προς patch.

## 7. Δομημένα πεδία, υπογραφές και συγχρονία (MFA-PATCH-0014, από MFA-ATK-14)

1. **Δομημένα πεδία.** Ό,τι στοχεύουν patches πρέπει να είναι λίστα ή χάρτης, όχι πρόζα: `effect_classes`, `failure_modes: [{mode, response}]`, `governors`, `default_order`, `status_axes`, `times`, `memory_types`, `owner_perimeter`, `ablation_kt`. Ένα string πεδίο (`statement`, `purpose`) αλλάζει **ολόκληρο** και μόνο από **ένα** patch ανά έκδοση του στοιχείου — δύο patches στο ίδιο string της ίδιας έκδοσης συγκρούονται εξ ορισμού (κειμενικά, όχι σημασιολογικά) και το δεύτερο ξαναγράφεται.
2. **Υπογραφές.** Κάθε patch φέρει `author` και, στο F0, υπογράφεται με το git signing key του δημιουργού ή L3-δηλωμένου εκπροσώπου (commit signature)· το `MANIFEST.yaml` υπογράφεται με το commit που το παράγει. Το `tools/check-package.py` επαληθεύει `git verify-commit` όταν το git είναι διαθέσιμο, αλλιώς αναφέρει `signature: UNVERIFIED` — ποτέ σιωπή. Τα MFA-PATCH-0001…0017 εφαρμόστηκαν στη συνεδρία 2026-09-16 **χωρίς** commit (εντολή §26) → `signature: UNVERIFIED` μέχρι να τα υπογράψει ο δημιουργός με το commit.
3. **Συγχρονία.** Η κανονική έδρα είναι single-writer (ίδιο σχήμα με το ledger, MFA-MECH-018)· η ταυτόχρονη συγγραφή γίνεται με **προτεινόμενα** patches στο `patches/proposed/` (ένα branch ανά συγγραφέα)· η συγχώνευση είναι CPEG (MFA-MECH-017) πάνω σε σύνολα (αρχείο, id, πεδίο): ξένα σύνολα ενώνονται αυτόματα, τεμνόμενα απαιτούν PRIORITY από τον δημιουργό· η σειρά εφαρμογής είναι απόφαση του δημιουργού.
4. **Εργαλείο.** `tools/apply-patch.py` εφαρμόζει το §4 μηχανικά (έλεγχος base hashes, preconditions, αλλαγή μόνο στα πεδία των targets, `version += 1`, `change_history`, παραγωγή του `-R` με τις προηγούμενες τιμές, `status: APPLIED`). Το `-R` γράφεται από το εργαλείο **πριν** το ευθύ πάρει APPLIED, ώστε το ζεύγος να υπάρχει μαζι (§3).
5. **F0 → F2+.** Στο F0 (αυτό το πακέτο) το ledger του σχεδίου είναι το git· από τη Δόση 3 ο Patch Engine (MFA-ELM-090) είναι ledger-native: patches ως δεσμεύσεις CC, η MFA-INV-064 επιβάλλεται από τον Gate και όχι διαδικαστικά από τον checker.
