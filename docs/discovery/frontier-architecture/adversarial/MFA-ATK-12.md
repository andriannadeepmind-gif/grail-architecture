---
id: MFA-ATK-12
pass: G
attack: "12. Attack the Cockpit"
method: "Devil's Advocate plugin → NO_SUBSCRIPTION· επίθεση από τον συντάκτη με το format της εντολής §17."
targets:
  elements: [MFA-ELM-091, MFA-ELM-093, MFA-ELM-092, MFA-ELM-069, MFA-ELM-043, MFA-ELM-032, MFA-ELM-040]
  mechanisms: [MFA-MECH-008]
  invariants: [MFA-INV-059, MFA-INV-047, MFA-INV-055, MFA-INV-004]
  contracts: [MFA-CON-039, MFA-CON-023]
  capabilities: [MFA-CAP-031, MFA-CAP-069, MFA-CAP-070, MFA-CAP-030, MFA-CAP-040]
verdict: "UPHELD για MFA-INV-059 όπως διατυπώθηκε (ταυτότητα ⇒ Galois connection) και για misclick (εντολές = RET προτάσεις)· REJECTED για «το 3D δεν προσθέτει τίποτα» — αλλά γίνεται διαψεύσιμο (νέα MFA-VO-056)"
modification: [MFA-PATCH-0012]
residual_risk: "Κόστος 3D στο DP-1: cockpit σε 2D/text (OAP)· αν η VO-056 δεν δείξει διακριτική διαφορά, το 3D γίνεται προαιρετικός renderer — ποτέ διαγραφή."
---

# MFA-ATK-12 · Επίθεση στο Cockpit

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

MFA-ELM-091 (Creator Cockpit, CGP — MFA-MECH-008), 093 (Explanation Projector), 092 (Human Continuity Port [E]), 069 (Client Portal), 043 (Speech-Act Router), 032 (Emission Barrier), 040 · MFA-INV-059 (Projection round-trip identity), 047 · MFA-CON-039/023.

## Ισχυρότερη ένσταση

1. **Θέατρο.** Ένα 3D cockpit για δικηγορικό γραφείο είναι θέατρο. Η a11y λειτουργία είναι text — άρα **όλη** η γεωμετρία είναι προαιρετική· τι ικανότητα προσθέτει το 3D; (ornamental sophistication).
2. **«RTS εντολές ως θεσμικές πράξεις»** = ένα misclick είναι υπογεγραμμένη πράξη.
3. **MFA-INV-059 «projection round-trip identity» είναι αδύνατο για απωλεστική προβολή.** Ένα 3D σε level-of-detail **αναγκαστικά** παραλείπει· είτε το invariant είναι ψευδές είτε η προβολή δεν είναι απωλεστική (τότε δεν είναι cockpit, είναι dump).

## Αντιπαράδειγμα

Ledger με 10⁷ δεσμεύσεις· η σκηνή σε LOD δείχνει 10³ κόμβους· `pick(scene, ray)` πάνω σε **συναθροισμένο** κόμβο επιστρέφει **ποιο** CID; Το round-trip της σκηνής προς την τομή του ledger είναι αδύνατο· το invariant **όπως διατυπώθηκε** αποτυγχάνει σε κάθε συνάθροιση. Misclick: «rollback» εντολή στο RTS πάνω σε λάθος φύλλο → αν η εντολή είναι commit, χάθηκε παράθυρο εργασίας.

## Επηρεαζόμενες ικανότητες

MFA-CAP-031 (χωρική αλληλεπίδραση), 069 (εξήγηση ως προβολή), 070 (αμφισβητησιμότητα — το contest path χρειάζεται να δείξει **τι** αμφισβητείται), 030, 040.

## Ετυμηγορία

- (3) **UPHELD**: η MFA-INV-059 πρέπει να επαναδιατυπωθεί ως **πιστότητα υπό zoom** — σύνδεση Galois, όχι ταυτότητα.
- (2) **UPHELD**: οι εντολές του cockpit είναι **προτάσεις RET**, ποτέ commits· ήδη υπονοείται («θεσμικές πράξεις» = μέσω της μίας πόρτας) αλλά πρέπει να **δηλωθεί** στο contract.
- (1) **REJECTED**, με υποχρέωση: η ικανότητα που προσθέτει η γεωμετρία είναι **χωρική μνήμη του χώρου επιχειρημάτων** και **ταυτόχρονη ορατότητα** περιοχών Unknown (ομίχλη) και Both (ρήγματα) σε κλίμακα που το κείμενο δεν δείχνει — αλλά αυτό είναι **ισχυρισμός** μέχρι να μετρηθεί (MFA-INV-055 ισχύει και για το cockpit).

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0012:
1. **MFA-INV-059 επαναδιατύπωση «Projection faithfulness (Galois connection)»**: α: LedgerCut → Scene (αφαίρεση), γ: SceneObject → 𝒫(CID) (συγκεκριμενοποίηση)· απαιτείται α∘γ∘α = α (idempotent υπό zoom), κάθε εμφανιζόμενο αντικείμενο αντιστοιχεί σε **μη κενό** σύνολο CIDs, και κάθε CID της τομής είναι **προσβάσιμο με zoom** (reachability)· ο ντετερμινισμός (ίδια cut, ίδιο seed ⇒ ίδια σκηνή) παραμένει. MFA-VO-026/034 επαναδιατυπώνονται: round-trip = γ∘α επιστρέφει υπερσύνολο που περιέχει το επιλεγμένο, όχι ταυτότητα.
2. **MFA-CON-039**: «κάθε εντολή του cockpit είναι πρόταση RET (MFA-ELM-010)· ο renderer δεν έχει commit path· επιβεβαίωση = υπογεγραμμένη πράξη με receipt· undo = RET window».
3. **Νέα MFA-VO-056 «Cockpit discriminative power»** (εφαρμογή MFA-INV-055): σε σφραγισμένα έργα (εύρεση αντίφασης, εύρεση αγνώστου που μπλοκάρει, σύγκριση δύο φύλλων) μετράται χρόνος-εύρεσης και ποσοστό λάθους 3D vs 2D vs text· αν καμία διακριτική διαφορά μετά από N έργα, το 3D **RECLASSIFY** σε προαιρετικό renderer (MFA-MECH-008 R_mode), ποτέ διαγραφή· MFA-INV-059 προστίθεται στα verified.
4. **MFA-ELM-093 (Explanation Projector)**: κάθε εξήγηση φέρει `depth` και `omitted_count` (πόσες δεσμεύσεις συνοψίστηκαν) — ο άνθρωπος βλέπει **ότι** παραλείφθηκε κάτι (MFA-INV-047: κανένα ανεξήγητο βαθμωτό ⇒ κανένα ανεξήγητο **κενό**).

## Υπολειπόμενος κίνδυνος

Στο DP-1 το cockpit τρέχει 2D/text (OAP) — άρα η VO-056 τρέχει από το DP-2. Ο κίνδυνος «RTS εντολή σε λάθος φύλλο» παραμένει ως **σφάλμα χρήστη με receipt και undo**, όχι ως αόρατο σφάλμα. Το Human Continuity Port (MFA-ELM-092) παραμένει [E] και δεν αγγίζεται από αυτή την επίθεση εκτός από το ότι κάθε μελλοντική διεπαφή του περνά από την ίδια σύνδεση Galois.
