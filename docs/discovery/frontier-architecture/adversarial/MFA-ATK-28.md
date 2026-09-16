---
id: MFA-ATK-28
pass: Ω-ASI-0.4.0 §12
attack: "28. Radically different competitors under the ASI lens (§12)"
method: "Devil's Advocate plugin επέστρεψε NO_SUBSCRIPTION (MFA-DEC-101)· επίθεση από τον συντάκτη με το format της εντολής §12: ισχυρότερη ένσταση, αντιπαράδειγμα νίκης, αντιπαράδειγμα ήττας (falsifier), ετυμηγορία, τροποποίηση με patch, υπολειπόμενος κίνδυνος."
targets:
  elements: [MFA-ELM-100, MFA-ELM-104, MFA-ELM-112, MFA-ELM-114, MFA-ELM-116, MFA-ELM-124, MFA-ELM-125, MFA-ELM-127, MFA-ELM-097, MFA-ELM-086]
  alternatives: [MFA-ALT-6, MFA-ALT-7, MFA-ALT-8, MFA-ALT-9, MFA-ALT-10, MFA-ALT-11, MFA-ALT-12, MFA-ALT-13, MFA-ALT-14]
  verification: [MFA-VO-014, MFA-VO-015, MFA-VO-067, MFA-VO-075]
  telos: [MFA-TEL-08, MFA-TEL-01]
  capabilities: [MFA-CAP-081, MFA-CAP-083, MFA-CAP-097, MFA-CAP-106, MFA-CAP-054]
verdict: "Καμία Pareto κυριαρχία προς καμία κατεύθυνση (όπως ATK-17)· ο ισχυρισμός «η σύνθεση είναι στο ταβάνι» σημαίνει: κανένας άξονας δεν ΑΠΟΚΛΕΙΕΤΑΙ και κάθε άξονας μετριέται· οι ALT-8…14 γίνονται baselines στο harness όπου υλοποιούνται φθηνά (ALT-9 proxy = TGPS-only· ALT-13 proxy = 0.3.0 lean· ALT-12 proxy = SMF FROM_SCRATCH) και πειράματα ALTn-E1/E2."
modification: [MFA-PATCH-0053]
residual_risk: "Αν σε 2 δόσεις η ALT-8 proxy (SMF DEP-4 χωρίς receipts/OC) υπερέχει της σύνθεσης σε ΟΛΕΣ τις οικογένειες με περιθώριο > verification tax, η σύνθεση πρέπει να μειώσει τον φόρο (κοκκομετρία), όχι τις εγγυήσεις — δηλωμένο· ACTIVE UNKNOWN."
---

# MFA-ATK-28 · Οι ριζικά διαφορετικοί ανταγωνιστές (ALT-8…14) και ο απλούστερος (ALT-6/7): Pareto υπό ASI-φακό

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

Στοιχεία: MFA-ELM-100, MFA-ELM-104, MFA-ELM-112, MFA-ELM-114, MFA-ELM-116, MFA-ELM-124, MFA-ELM-125, MFA-ELM-127, MFA-ELM-097, MFA-ELM-086 · Εναλλακτικές: MFA-ALT-6, MFA-ALT-7, MFA-ALT-8, MFA-ALT-9, MFA-ALT-10, MFA-ALT-11, MFA-ALT-12, MFA-ALT-13, MFA-ALT-14 · VOs: MFA-VO-014, MFA-VO-015, MFA-VO-067, MFA-VO-075 · Ικανότητες: MFA-CAP-081, MFA-CAP-083, MFA-CAP-097, MFA-CAP-106, MFA-CAP-054

## Ισχυρότερη ένσταση

Επτά αρχιτεκτονικές, καθεμία με μία πρώτη αρχή που η σύνθεση δεν έχει ως ΜΟΝΗ αρχή: κλίμακα (ALT-8), απόδειξη (ALT-9), πληθυσμός (ALT-10), ελεύθερη ενέργεια (ALT-11), γενιές (ALT-12), επαλήθευση oracles (ALT-13), αυτο-επανεγγραφή με απόδειξη (ALT-14). Κάθε μία κυριαρχεί τη σύνθεση σε ≥1 άξονα. Ο απλούστερος ανταγωνιστής (ALT-6/7) κυριαρχεί στον χρόνο 1. Η σύνθεση, ως join όλων, κινδυνεύει να είναι η χειρότερη σε κάθε άξονα (jack of all trades).

## Αντιπαράδειγμα όπου η ένσταση **νικά**

Ανά άξονα: ALT-8 capability/$ · ALT-9 ορθότητα · ALT-10 ανθεκτικότητα · ALT-11 ενοποίηση · ALT-12 καθαρότητα διαδοχής · ALT-13 χρόνος-προς-αξία/TCB · ALT-14 εγγύηση RSI · ALT-6/7 έτος 1.

## Αντιπαράδειγμα όπου η ένσταση **χάνει** (ο falsifier της)

Καμία ALT δεν περνά ΟΛΑ τα KT: ALT-8 χάνει KT-06/16/01/19· ALT-9 KT-12/15· ALT-10 KT-08/13· ALT-11 KT-06/17· ALT-12 χρόνο-προς-διόρθωση· ALT-13 κυριαρχία (OBJ-010/054)· ALT-14 δεν πράττει. Η σύνθεση απορροφά την πρώτη αρχή καθεμιάς ΩΣ ΜΗΧΑΝΙΣΜΟ/ΣΤΑΔΙΟ/ΠΡΟΦΙΛ (SMF DEP-4, TGPS/OC, ECE/G_Ω, AIDC, VSC γενιές, STP S0–S2, RAGen με απόδειξη όπου υπάρχει) και πληρώνει το κόστος ενοποίησης (ATK-27) — μετρήσιμο από CGM.

## Ετυμηγορία

Καμία Pareto κυριαρχία προς καμία κατεύθυνση (όπως ATK-17)· ο ισχυρισμός «η σύνθεση είναι στο ταβάνι» σημαίνει: κανένας άξονας δεν ΑΠΟΚΛΕΙΕΤΑΙ και κάθε άξονας μετριέται· οι ALT-8…14 γίνονται baselines στο harness όπου υλοποιούνται φθηνά (ALT-9 proxy = TGPS-only· ALT-13 proxy = 0.3.0 lean· ALT-12 proxy = SMF FROM_SCRATCH) και πειράματα ALTn-E1/E2.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0053 — βλ. `patches/MFA-PATCH-0053.yaml` (field-level, με rollback -R).

## Υπολειπόμενος κίνδυνος

Αν σε 2 δόσεις η ALT-8 proxy (SMF DEP-4 χωρίς receipts/OC) υπερέχει της σύνθεσης σε ΟΛΕΣ τις οικογένειες με περιθώριο > verification tax, η σύνθεση πρέπει να μειώσει τον φόρο (κοκκομετρία), όχι τις εγγυήσεις — δηλωμένο· ACTIVE UNKNOWN.

**Κανόνας §5:** καμία ετυμηγορία εδώ δεν αφαιρεί ικανότητα· οι επιθέσεις αλλάζουν μηχανισμούς, κατωφλιώσεις, δηλώσεις και επιστημικές καταστάσεις.
