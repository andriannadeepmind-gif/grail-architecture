---
id: MFA-ATK-19
pass: Ω-ASI-0.4.0 §12
attack: "19. Concept / causal / hypothesis hallucination"
method: "Devil's Advocate plugin επέστρεψε NO_SUBSCRIPTION (MFA-DEC-101)· επίθεση από τον συντάκτη με το format της εντολής §12: ισχυρότερη ένσταση, αντιπαράδειγμα νίκης, αντιπαράδειγμα ήττας (falsifier), ετυμηγορία, τροποποίηση με patch, υπολειπόμενος κίνδυνος."
targets:
  elements: [MFA-ELM-109, MFA-ELM-110, MFA-ELM-111, MFA-ELM-105, MFA-ELM-030, MFA-ELM-022, MFA-ELM-083]
  alternatives: [MFA-ALT-9, MFA-ALT-11]
  verification: [MFA-VO-068, MFA-VO-069, MFA-VO-070, MFA-VO-062]
  telos: [MFA-TEL-08]
  capabilities: [MFA-CAP-089, MFA-CAP-090, MFA-CAP-091, MFA-CAP-092]
verdict: "Έγκυρη· επιβάλλει: (α) OGE birth απαιτεί residual επιβεβαιωμένο από ≥2 ανεξάρτητες πηγές (LWM ΚΑΙ World Twin/held-out replay), (β) CDCE δέχεται natural experiments/instrumental variables από τη διακύμανση του docket ως INT-ισοδύναμες με ρητή ετικέτα NAT, και World Twin παρεμβάσεις με ετικέτα πιστότητας, (γ) AHE: υποθέσεις χωρίς εφικτό venue = DEFERRED(NOT_YET_OBSERVABLE), εκτός κατάταξης· έλεγχος ποτέ στη γεννήτρια του explanandum."
modification: [MFA-PATCH-0044]
residual_risk: "Η πυκνότητα φυσικών πειραμάτων στο νομικό ledger (MFA-UNK-116) παραμένει ACTIVE UNKNOWN· αν είναι χαμηλή, το CDCE δίνει κυρίως PARTIAL_BOUNDS — δηλωμένα, όχι σημειακά."
---

# MFA-ATK-19 · Ψευδαίσθηση εννοιών και αιτιών: OGE γεννά artifacts του LWM, το CDCE δεν μπορεί να «κάνει do» στο δικαστήριο, το AHE παράγει υποθέσεις χωρίς εφικτό έλεγχο

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

Στοιχεία: MFA-ELM-109, MFA-ELM-110, MFA-ELM-111, MFA-ELM-105, MFA-ELM-030, MFA-ELM-022, MFA-ELM-083 · Εναλλακτικές: MFA-ALT-9, MFA-ALT-11 · VOs: MFA-VO-068, MFA-VO-069, MFA-VO-070, MFA-VO-062 · Ικανότητες: MFA-CAP-089, MFA-CAP-090, MFA-CAP-091, MFA-CAP-092

## Ισχυρότερη ένσταση

Τα residuals που τροφοδοτούν τον OGE προέρχονται από το LWM: ένα κακοβαθμονομημένο LWM παράγει συστηματικά residuals που ο OGE «εξηγεί» με νέες έννοιες — έννοιες του μοντέλου, όχι του κόσμου (κέρδος G>θ στο sealed split του ΙΔΙΟΥ LWM). Το CDCE υπόσχεται παρεμβάσεις, αλλά στο νομικό πεδίο σχεδόν καμία μεταβλητή δεν δέχεται do(): δεν αλλάζεις τον δικαστή· άρα όλες οι ακμές μένουν UND/OBS και η VOI μηχανή δεν έχει τι να προτείνει. Το AHE κατατάσσει με EFV αλλά η P_refute απαιτεί venue: υποθέσεις χωρίς εφικτό έλεγχο παίρνουν EFV=0 ή, χειρότερα, ελέγχονται στο LWM που τις γέννησε (κυκλικότητα).

## Αντιπαράδειγμα όπου η ένσταση **νικά**

Νομικό πεδίο χωρίς World Twin δρώντες βαθμονομημένους (Δόση 1–2): ο OGE γεννά 40 έννοιες με G>θ που καμία δεν χρησιμοποιείται downstream· το CDCE 0 INT ακμές· το AHE 100 % Genesis-only έλεγχοι.

## Αντιπαράδειγμα όπου η ένσταση **χάνει** (ο falsifier της)

Με World Twin δρώντες από docket (Δόση 3) και φυσικά πειράματα (διακύμανση σύνθεσης δικαστηρίων, μεταβολές νόμου = quasi-interventions με χρονική διάταξη): το CDCE αποκτά INT-ισοδύναμες ακμές· ο OGE με cross-check έναντι World Twin/held-out replay δεν γεννά artifacts του LWM· το AHE με venue-feasibility δεν κατατάσσει ανέλεγκτα.

## Ετυμηγορία

Έγκυρη· επιβάλλει: (α) OGE birth απαιτεί residual επιβεβαιωμένο από ≥2 ανεξάρτητες πηγές (LWM ΚΑΙ World Twin/held-out replay), (β) CDCE δέχεται natural experiments/instrumental variables από τη διακύμανση του docket ως INT-ισοδύναμες με ρητή ετικέτα NAT, και World Twin παρεμβάσεις με ετικέτα πιστότητας, (γ) AHE: υποθέσεις χωρίς εφικτό venue = DEFERRED(NOT_YET_OBSERVABLE), εκτός κατάταξης· έλεγχος ποτέ στη γεννήτρια του explanandum.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0044 — βλ. `patches/MFA-PATCH-0044.yaml` (field-level, με rollback -R).

## Υπολειπόμενος κίνδυνος

Η πυκνότητα φυσικών πειραμάτων στο νομικό ledger (MFA-UNK-116) παραμένει ACTIVE UNKNOWN· αν είναι χαμηλή, το CDCE δίνει κυρίως PARTIAL_BOUNDS — δηλωμένα, όχι σημειακά.

**Κανόνας §5:** καμία ετυμηγορία εδώ δεν αφαιρεί ικανότητα· οι επιθέσεις αλλάζουν μηχανισμούς, κατωφλιώσεις, δηλώσεις και επιστημικές καταστάσεις.
