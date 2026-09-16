---
id: MFA-ATK-26
pass: Ω-ASI-0.4.0 §12
attack: "26. Twin fidelity illusion & sealed-set exhaustion"
method: "Devil's Advocate plugin επέστρεψε NO_SUBSCRIPTION (MFA-DEC-101)· επίθεση από τον συντάκτη με το format της εντολής §12: ισχυρότερη ένσταση, αντιπαράδειγμα νίκης, αντιπαράδειγμα ήττας (falsifier), ετυμηγορία, τροποποίηση με patch, υπολειπόμενος κίνδυνος."
targets:
  elements: [MFA-ELM-126, MFA-ELM-119, MFA-ELM-098, MFA-ELM-089, MFA-ELM-086, MFA-ELM-088]
  alternatives: [MFA-ALT-14]
  verification: [MFA-VO-086, MFA-VO-078, MFA-VO-033, MFA-VO-049]
  telos: [MFA-TEL-08]
  capabilities: [MFA-CAP-107, MFA-CAP-100, MFA-CAP-023, MFA-CAP-038]
verdict: "Έγκυρη· επιβάλλει fidelity-tagged evidence στις εκθέσεις/manifest, POLICY-σήμανση του risk map, και item-generation ≥ exposure ως VO."
modification: [MFA-PATCH-0051]
residual_risk: "Η επάρκεια της 2PL IRT (MFA-UNK-125) και ο ρυθμός item generation με ποιότητα είναι ACTIVE UNKNOWN μέχρι CGM-E1/E2 σε πραγματικά έργα."
---

# MFA-ATK-26 · Ψευδαίσθηση πιστότητας του διδύμου και εξάντληση σφραγισμένων συνόλων: τα F1 mocks περνούν τα πάντα, ο risk map είναι αυθαίρετος, η τράπεζα έργων τελειώνει

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

Στοιχεία: MFA-ELM-126, MFA-ELM-119, MFA-ELM-098, MFA-ELM-089, MFA-ELM-086, MFA-ELM-088 · Εναλλακτικές: MFA-ALT-14 · VOs: MFA-VO-086, MFA-VO-078, MFA-VO-033, MFA-VO-049 · Ικανότητες: MFA-CAP-107, MFA-CAP-100, MFA-CAP-023, MFA-CAP-038

## Ισχυρότερη ένσταση

Το F1 δίδυμο με mocks αποδεικνύει ότι οι mocks συμπεριφέρονται όπως γράφτηκαν· κάθε «PASS» στο F1 μπορεί να διαβαστεί ως επαλήθευση της αρχιτεκτονικής ενώ επαληθεύει τον διερμηνέα. Ο risk map βαθμολογεί επιστημικές καταστάσεις με αυθαίρετους αριθμούς (0.45, 0.6) και αν γίνει πύλη, η αρχιτεκτονική κρίνεται από ένα policy-vector μεταμφιεσμένο σε μέτρηση. Η CGM τράπεζα: κάθε μέτρηση καίει items (exposure)· με 30–60 items/μέτρηση και εβδομαδιαίες μετρήσεις ανά 20 οικογένειες, μια τράπεζα 10³ items/οικογένεια εξαντλείται σε <1 έτος· η IRT 2PL για ανοιχτά νομικά έργα (πολυδιάστατα) είναι λάθος μοντέλο.

## Αντιπαράδειγμα όπου η ένσταση **νικά**

Δόση 0.5–1: όλα τα VO «περνούν» στο F1· ο δημιουργός βλέπει 87 πράσινα VO· τίποτα δεν έχει μετρηθεί σε F2+.

## Αντιπαράδειγμα όπου η ένσταση **χάνει** (ο falsifier της)

Με (α) κάθε αποτέλεσμα του διδύμου να φέρει την πιστότητά του (F1/F2/F3/F4) και το manifest να μετρά «VO με ≥F2 τεκμήριο», (β) risk numbers δηλωμένοι ως POLICY (DEC) που ποτέ δεν αποτελούν μόνοι πύλη, (γ) ρυθμό γέννησης items ≥ ρυθμό exposure (ECE/curriculum) και MIRT ως δηλωμένη εναλλακτική με έλεγχο διάστασης, το δίδυμο λέει την αλήθεια για το τι ξέρει.

## Ετυμηγορία

Έγκυρη· επιβάλλει fidelity-tagged evidence στις εκθέσεις/manifest, POLICY-σήμανση του risk map, και item-generation ≥ exposure ως VO.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0051 — βλ. `patches/MFA-PATCH-0051.yaml` (field-level, με rollback -R).

## Υπολειπόμενος κίνδυνος

Η επάρκεια της 2PL IRT (MFA-UNK-125) και ο ρυθμός item generation με ποιότητα είναι ACTIVE UNKNOWN μέχρι CGM-E1/E2 σε πραγματικά έργα.

**Κανόνας §5:** καμία ετυμηγορία εδώ δεν αφαιρεί ικανότητα· οι επιθέσεις αλλάζουν μηχανισμούς, κατωφλιώσεις, δηλώσεις και επιστημικές καταστάσεις.
