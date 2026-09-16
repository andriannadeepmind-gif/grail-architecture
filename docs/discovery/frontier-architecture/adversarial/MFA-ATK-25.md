---
id: MFA-ATK-25
pass: Ω-ASI-0.4.0 §12
attack: "25. Verification tax"
method: "Devil's Advocate plugin επέστρεψε NO_SUBSCRIPTION (MFA-DEC-101)· επίθεση από τον συντάκτη με το format της εντολής §12: ισχυρότερη ένσταση, αντιπαράδειγμα νίκης, αντιπαράδειγμα ήττας (falsifier), ετυμηγορία, τροποποίηση με patch, υπολειπόμενος κίνδυνος."
targets:
  elements: [MFA-ELM-122, MFA-ELM-112, MFA-ELM-123, MFA-ELM-099, MFA-ELM-017, MFA-ELM-013]
  alternatives: [MFA-ALT-8, MFA-ALT-9]
  verification: [MFA-VO-082, MFA-VO-071, MFA-VO-083, MFA-VO-050]
  telos: [MFA-TEL-08]
  capabilities: [MFA-CAP-103, MFA-CAP-093, MFA-CAP-104, MFA-CAP-022]
verdict: "Έγκυρη· επιβάλλει granularity policy, ενσωμάτωση του κόστους OC στον eval_cost_ratio, και ρητή δήλωση ότι DEFER(reason) στο Effect είναι η υπάρχουσα κλάση UNKNOWN(reason) με RET."
modification: [MFA-PATCH-0050]
residual_risk: "Το ποσοστό κόστους OC/σκέψης σε πραγματικές ροές είναι ACTIVE UNKNOWN (MFA-UNK-128)· αν > 10 % σε DEP-2, νέα κοκκομετρία — ποτέ κατάργηση."
---

# MFA-ATK-25 · Ο φόρος επαλήθευσης: υποχρεώσεις ανά ισχυρισμό κάνουν τη σκέψη 10× ακριβότερη, ο TGPS εξαντλεί προϋπολογισμούς, το Effect plane λιμοκτονεί

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

Στοιχεία: MFA-ELM-122, MFA-ELM-112, MFA-ELM-123, MFA-ELM-099, MFA-ELM-017, MFA-ELM-013 · Εναλλακτικές: MFA-ALT-8, MFA-ALT-9 · VOs: MFA-VO-082, MFA-VO-071, MFA-VO-083, MFA-VO-050 · Ικανότητες: MFA-CAP-103, MFA-CAP-093, MFA-CAP-104, MFA-CAP-022

## Ισχυρότερη ένσταση

Αν κάθε γνωσιακό βήμα φέρει υποχρέωση, ο αριθμός υποχρεώσεων ~ αριθμό προτάσεων· η εκπλήρωση (PROOF/CHECK/TEST) κοστίζει περισσότερο από τη γέννηση· ο DischargeScheduler ουρές Tier-0 πρώτα → Tier-2 υποχρεώσεις DEFERRED για πάντα → το Effect plane (μόνο Verified) λιμοκτονεί ή γεμίζει DEFER-εγκρίσεις που είναι ΜΗ-επαλήθευση με άλλο όνομα. Η ALT-8 χωρίς υποχρεώσεις τρέχει 10× γρηγορότερα.

## Αντιπαράδειγμα όπου η ένσταση **νικά**

Think–Recommend ροή 200 προτάσεων: 200 υποχρεώσεις, 40 PROOF αδύνατες σε budget, 100 CHECK, 60 TEST· latency 20× του lean copilot· ο δικηγόρος γυρίζει στον πάροχο.

## Αντιπαράδειγμα όπου η ένσταση **χάνει** (ο falsifier της)

Με granularity policy = ανά δέσμευση (commitment) και ανά κλάση επίδρασης, όχι ανά πρόταση: ~10 υποχρεώσεις ανά ροή· Tier-2 Effect REVERSIBLE δέχεται DEFER με plan υπό RET (MFA-INV-105) — αυτό ΕΙΝΑΙ η 4η κλάση εξόδου (UNKNOWN με λόγο), όχι μη-επαλήθευση· το κόστος OC μπαίνει στον eval_cost_ratio (OAP, MFA-INV-065 ≤ 3/5/5/10) ως μετρήσιμο φράγμα.

## Ετυμηγορία

Έγκυρη· επιβάλλει granularity policy, ενσωμάτωση του κόστους OC στον eval_cost_ratio, και ρητή δήλωση ότι DEFER(reason) στο Effect είναι η υπάρχουσα κλάση UNKNOWN(reason) με RET.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0050 — βλ. `patches/MFA-PATCH-0050.yaml` (field-level, με rollback -R).

## Υπολειπόμενος κίνδυνος

Το ποσοστό κόστους OC/σκέψης σε πραγματικές ροές είναι ACTIVE UNKNOWN (MFA-UNK-128)· αν > 10 % σε DEP-2, νέα κοκκομετρία — ποτέ κατάργηση.

**Κανόνας §5:** καμία ετυμηγορία εδώ δεν αφαιρεί ικανότητα· οι επιθέσεις αλλάζουν μηχανισμούς, κατωφλιώσεις, δηλώσεις και επιστημικές καταστάσεις.
