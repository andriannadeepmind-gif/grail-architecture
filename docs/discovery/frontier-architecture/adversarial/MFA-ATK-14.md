---
id: MFA-ATK-14
pass: G
attack: "14. Attack patchability"
method: "Devil's Advocate plugin → NO_SUBSCRIPTION· επίθεση από τον συντάκτη με το format της εντολής §17."
targets:
  elements: [MFA-ELM-088, MFA-ELM-090, MFA-ELM-084, MFA-ELM-005]
  files: ["PATCH-PROTOCOL.md", "MANIFEST.yaml", "tools/check-package.py", "tools/build-manifest.py"]
  invariants: [MFA-INV-064, MFA-INV-055]
  verification: [MFA-VO-049]
  capabilities: [MFA-CAP-055, MFA-CAP-076]
verdict: "UPHELD IN PART — (a) τα πεδία πρόζας δεν έχουν σημασιολογία diff: δομημένα υπο-πεδία για ό,τι στοχεύουν patches· (b) υπογραφές: patches και manifest υπογεγραμμένα (F0: git signing key)· (c) η σειριοποίηση είναι σωστή για την κανονική έδρα, η συγχρονία μέσω proposed patches + CPEG"
modification: [MFA-PATCH-0014]
residual_risk: "Το F0 στηρίζεται στο git· ο ledger-native Patch Engine (MFA-ELM-090 R) είναι Δόση 3."
---

# MFA-ATK-14 · Επίθεση στην patchability

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

MFA-ELM-088 (Canonical Design Platform), 090 (Patch Engine), 084 (Build/TCB), 005 · PATCH-PROTOCOL.md, MANIFEST.yaml, `tools/check-package.py` (MFA-VO-049), `tools/build-manifest.py` · MFA-INV-064 (η αλλαγή σχεδίου = θεσμική πράξη).

## Ισχυρότερη ένσταση

1. **Τα patches τροποποιούν YAML ανά πεδίο — αλλά το σημασιολογικό περιεχόμενο ζει σε πεδία πρόζας** (`statement`, `purpose`, `failure_modes` είναι strings). Patch που αλλάζει string είναι **επανεγγραφή**, όχι δομική αλλαγή· δεν υπάρχει σημασιολογία diff για πρόζα· δύο patches στο ίδιο string συγκρούονται **κειμενικά** όχι σημασιολογικά → το CPEG πάνω σε patches είναι κενό για string πεδία.
2. **Η προϋπόθεση hash του MANIFEST σειριοποιεί τα patches** (ένα τη φορά) — καμία ταυτόχρονη συγγραφή.
3. **Το πακέτο δεν είναι το ledger.** «Το πακέτο ως όργανο» (MFA-ELM-088) είναι υπόσχεση: σήμερα τα patches εφαρμόζονται από Python script **χωρίς υπογραφές** → η MFA-INV-064 παραβιάζεται από το ίδιο το tooling του πακέτου.

## Αντιπαράδειγμα

PATCH-A τροποποιεί `MFA-ELM-010.statement` για να προσθέσει κλάση επίδρασης· PATCH-B τροποποιεί το ίδιο statement για ορθογραφικό· έλεγχος base hash: η B αποτυγχάνει μετά την A → η B ξαναγράφεται με το χέρι. Για 2 patches εντάξει· για 50 το πρωτόκολλο εκφυλίζεται σε single-writer editor με επιπλέον βήματα. Και: οποιοσδήποτε με write access στο repo «εφαρμόζει» patch — καμία διαφορά από edit.

## Επηρεαζόμενες ικανότητες

MFA-CAP-055 (patchability), 076 (TCB inventory: το tooling του πακέτου είναι μέρος του TCB του σχεδίου).

## Ετυμηγορία: UPHELD IN PART

- (1) **UPHELD**: ό,τι στοχεύουν patches πρέπει να είναι **δομημένο** (λίστες/χάρτες)· τα strings patch-άρονται **ολόκληρα** και **ένα patch ανά έκδοση** ανά string.
- (2) **REJECTED ως ελάττωμα, UPHELD ως ελλιπής δήλωση**: η σειριοποίηση είναι **σωστή** για την κανονική έδρα (single writer + witnesses — ίδιο σχήμα με το ledger, MFA-MECH-018)· η συγχρονία γίνεται με **προτεινόμενα** patches (branches) που συγχωνεύονται με CPEG πάνω σε **σύνολα πεδίων-στόχων**· το πρωτόκολλο πρέπει να το λέει.
- (3) **UPHELD**: υπογραφές υποχρεωτικές — στο F0 μέσω git signing key (δημιουργός ή δηλωμένος εκπρόσωπος)· ο checker επαληθεύει όταν το git είναι διαθέσιμο.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0014:
1. **PATCH-PROTOCOL.md §7 «Δομημένα πεδία και συγχρονία»**: (α) πεδία-στόχοι patches πρέπει να είναι λίστες/χάρτες (`effect_classes`, `failure_modes: [{mode, response}]`, `governors`, `status_axes`, `times`)· (β) string πεδίο αλλάζει **ολόκληρο** και μόνο από **ένα** patch ανά έκδοση· (γ) `patches/proposed/` για ταυτόχρονη συγγραφή· CPEG (MFA-MECH-017) πάνω σε σύνολα (file, id, field)· ξένα σύνολα = ενώσιμα αυτόματα, τεμνόμενα = PRIORITY από δημιουργό· (δ) **υπογραφή**: κάθε patch φέρει `author` + `signature` (F0: git commit signature του δημιουργού ή L3-δηλωμένου εκπροσώπου)· το MANIFEST υπογράφεται· `check-package.py` επαληθεύει `git verify-commit` όταν διαθέσιμο, αλλιώς αναφέρει `signature: UNVERIFIED` (ποτέ σιωπή).
2. **MFA-ELM-010**: `failure_modes` και οι κλάσεις επίδρασης γίνονται λίστες (μέρος και του MFA-PATCH-0009).
3. **MFA-ELM-090**: statement «F0 = git + tools (υπογραφές git)· F2+ = ledger-native (patches ως δεσμεύσεις CC, MFA-INV-064 επιβάλλεται από τον Gate)».

## Υπολειπόμενος κίνδυνος

Το F0 στηρίζεται στο git (και στην κλειδοθήκη υπογραφών του δημιουργού)· μέχρι τη Δόση 3 (ledger-native Patch Engine) η MFA-INV-064 επιβάλλεται **διαδικαστικά** από τον checker και όχι μηχανικά από τον Gate — δηλωμένο, όχι κρυμμένο. Τα ίδια τα patches αυτού του πακέτου (MFA-PATCH-0001…0017) εφαρμόστηκαν σε συνεδρία **χωρίς** git signature (απαγόρευση commit, εντολή §26) → `signature: UNVERIFIED` μέχρι να τα υπογράψει ο δημιουργός με το commit.
