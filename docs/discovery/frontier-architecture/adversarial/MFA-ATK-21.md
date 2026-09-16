---
id: MFA-ATK-21
pass: Ω-ASI-0.4.0 §12
attack: "21. Escrow paradox & tolerance smuggling"
method: "Devil's Advocate plugin επέστρεψε NO_SUBSCRIPTION (MFA-DEC-101)· επίθεση από τον συντάκτη με το format της εντολής §12: ισχυρότερη ένσταση, αντιπαράδειγμα νίκης, αντιπαράδειγμα ήττας (falsifier), ετυμηγορία, τροποποίηση με patch, υπολειπόμενος κίνδυνος."
targets:
  elements: [MFA-ELM-117, MFA-ELM-076, MFA-ELM-003, MFA-ELM-005, MFA-ELM-092, MFA-ELM-125]
  alternatives: [MFA-ALT-12]
  verification: [MFA-VO-076, MFA-VO-008, MFA-VO-018, MFA-VO-085]
  telos: [MFA-TEL-08]
  capabilities: [MFA-CAP-098, MFA-CAP-004, MFA-CAP-036, MFA-CAP-106]
verdict: "Έγκυρη· επιβάλλει key-epoch διαχωρισμό εξουσιών κατά το escrow, Owner-Root απόδειξη ελέγχου του νέου υποστρώματος, τ ratchet και ORP parity για ποιότητα."
modification: [MFA-PATCH-0046]
residual_risk: "Μετανάστευση σε υπόστρωμα τρίτου (cloud) παραμένει DISCLOSE-κλάσης πράξη με απώλεια εγγυήσεων (attestation ως ισοδύναμο grant) — δηλωμένο στο MFA-ELM-108."
---

# MFA-ATK-21 · Το παράδοξο του escrow: δύο αυθεντικά αντίγραφα, κλειδιά που «επικυρώνουν» τον κλέφτη, ανοχές που καλύπτουν υποβάθμιση

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

Στοιχεία: MFA-ELM-117, MFA-ELM-076, MFA-ELM-003, MFA-ELM-005, MFA-ELM-092, MFA-ELM-125 · Εναλλακτικές: MFA-ALT-12 · VOs: MFA-VO-076, MFA-VO-008, MFA-VO-018, MFA-VO-085 · Ικανότητες: MFA-CAP-098, MFA-CAP-004, MFA-CAP-036, MFA-CAP-106

## Ισχυρότερη ένσταση

Κατά το escrow υπάρχουν δύο υποστρώματα με τα ίδια κλειδιά και το ίδιο log: αν το παλιό «read-only» παραβιαστεί (ή απλώς αν ένα bug γράψει), υπάρχουν δύο αυθεντικοί εαυτοί — KT-18 (body key compromise) σε μορφή ολόκληρης οντότητας. Η αμφίδρομη cross-attestation δεν αποδεικνύει τίποτα αν ο επιτιθέμενος ελέγχει το νέο υπόστρωμα: το παλιό υπογράφει ό,τι του ζητηθεί στη φάση VERIFY. Και οι ανοχές τ για D2 στοιχεία είναι πολιτική: μια ανοχή 5 % σε «ποιότητα drafting» επιτρέπει certificate σε υποβαθμισμένο διάδοχο.

## Αντιπαράδειγμα όπου η ένσταση **νικά**

Μετανάστευση σε cloud DEP-4 site με νέο crypto epoch: ο πάροχος του site ελέγχει το νέο υπόστρωμα· cross-attestation περνά· 3 % απόκλιση D2 εντός τ· certificate εκδίδεται· η οντότητα «μετανάστευσε» σε ξένο έλεγχο.

## Αντιπαράδειγμα όπου η ένσταση **χάνει** (ο falsifier της)

Με key epoch discipline: τα παλιά κλειδιά μετά το CUTOVER δεν μπορούν να υπογράψουν δεσμεύσεις (μόνο attestations με epoch tag)· το νέο υπόστρωμα πρέπει να αποδείξει έλεγχο δημιουργού (Owner Root, KT-23) πριν το certify· τ ratchet μόνο προς αυστηρότερα και ποτέ σε Tier-0 οικογένειες· D2 απόκλιση σε ποιότητα = ORP parity test, όχι ανοχή.

## Ετυμηγορία

Έγκυρη· επιβάλλει key-epoch διαχωρισμό εξουσιών κατά το escrow, Owner-Root απόδειξη ελέγχου του νέου υποστρώματος, τ ratchet και ORP parity για ποιότητα.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0046 — βλ. `patches/MFA-PATCH-0046.yaml` (field-level, με rollback -R).

## Υπολειπόμενος κίνδυνος

Μετανάστευση σε υπόστρωμα τρίτου (cloud) παραμένει DISCLOSE-κλάσης πράξη με απώλεια εγγυήσεων (attestation ως ισοδύναμο grant) — δηλωμένο στο MFA-ELM-108.

**Κανόνας §5:** καμία ετυμηγορία εδώ δεν αφαιρεί ικανότητα· οι επιθέσεις αλλάζουν μηχανισμούς, κατωφλιώσεις, δηλώσεις και επιστημικές καταστάσεις.
