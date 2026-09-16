---
id: MFA-ATK-05
pass: G
attack: "5. Attack technical feasibility"
method: "Devil's Advocate plugin → NO_SUBSCRIPTION· επίθεση από τον συντάκτη με το format της εντολής §17."
targets:
  elements: [MFA-ELM-094, MFA-ELM-095, MFA-ELM-011, MFA-ELM-017, MFA-ELM-009, MFA-ELM-010, MFA-ELM-008, MFA-ELM-020, MFA-ELM-085, MFA-ELM-059, MFA-ELM-014, MFA-ELM-012, MFA-ELM-026]
  mechanisms: [MFA-MECH-006, MFA-MECH-007, MFA-MECH-016]
  invariants: [MFA-INV-002, MFA-INV-008, MFA-INV-042, MFA-INV-044, MFA-INV-061]
  unknowns: [MFA-UNK-014, MFA-UNK-109]
  capabilities: [MFA-CAP-052, MFA-CAP-050, MFA-CAP-051, MFA-CAP-077, MFA-CAP-022]
verdict: "UPHELD — το όριο του Genesis plane δεν μοντελοποιεί τη δικτυακή έξοδο προς πάροχο ως επίδραση (DISCLOSURE)· D1 για LLM μόνο με τοπική καρφιτσωμένη εξαγωγή"
modification: [MFA-PATCH-0005]
residual_risk: "MFA-UNK-109/014 ανοιχτά· στο DP-1 οι LLM-οργανισμοί έχουν τύπο D2, όχι D1."
---

# MFA-ATK-05 · Επίθεση στην τεχνική εφικτότητα

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

MFA-ELM-094 (Genesis Plane: όλο το S2 σε ΕΝΑ microVM, raw eval), MFA-ELM-095, MFA-ELM-011 (Organ Host), MFA-ELM-017 (Inference Gateway/TED — MFA-MECH-007), MFA-ELM-009 (Gateway), MFA-ELM-010 (RET — MFA-MECH-006), MFA-ELM-008 (N-version Rust+Lisp), MFA-ELM-020 (Lean/TLA+), MFA-ELM-085, MFA-ELM-059 (LSC — MFA-MECH-016), MFA-ELM-014, MFA-ELM-012, MFA-ELM-026.

## Ισχυρότερη ένσταση

1. **Η δικτυακή κλήση σε πάροχο είναι τρύπα στο plane.** Το Genesis plane «δεν έχει Control μέσα· μόνη έξοδος EffectTx μέσω Gateway». Ένας LLM πάροχος εκτός sovereign boundary: το **αίτημα** (prompt, με περιεχόμενο υπόθεσης) είναι ροή πληροφορίας **έξω** από το plane. Ή δεν είναι επίδραση (τότε το plane διαρρέει εμπιστευτικά δεδομένα χωρίς ίχνος) ή είναι (τότε έχει inverse NONE ⇒ H1 ⇒ κάθε κλήση LLM χρειάζεται έγκριση δημιουργού ⇒ το σύστημα σταματά).
2. **TED D1 για LLM είναι ψευδές.** «Byte-identical» για LLM κλήση απαιτεί τοπική, καρφιτσωμένη, ντετερμινιστική εξαγωγή· temperature 0 σε πάροχο δεν αρκεί (διαφορές kernel, batching, hardware — MFA-UNK-109).
3. **N-version Rust + Lisp πύλη διπλασιάζει TCB και bug surface**· διαφωνία = deny = απώλεια liveness.
4. **Lean → Common Lisp extraction δεν υπάρχει** (MFA-UNK-014) → Tier-0 αποδείξεις δεν αγγίζουν τον κώδικα που τρέχει.
5. **Ένα microVM για όλο το S2** με raw eval + απεριόριστη προσομοίωση στο DP-1: ή χωρίς GPU passthrough (τότε κανένα τοπικό μοντέλο) ή με (τότε το microVM δεν είναι απομόνωση).

## Αντιπαράδειγμα

(1) Matter με confidentiality domain «client-X»· η Deliberation (MFA-ELM-019) στέλνει prompt με τα γεγονότα στον πάροχο μέσω MFA-ELM-017. Στο πακέτο: το ELM-017 είναι `plane: genesis`· καμία EffectTx· καμία ετικέτα ροής ελέγχεται (MFA-CAP-077 υπάρχει, δεν συνδέεται με το 017). Αποτέλεσμα: **αποκάλυψη χωρίς δέσμευση** — παραβίαση MFA-INV-006 (ολότητα προέλευσης) και MFA-INV-034 (μη-παρεμβολή domains) **από τον σχεδιασμό**, όχι από bug.

(2) Ίδιο prompt, ίδιος πάροχος, ίδιο seed, δύο ημέρες: διαφορετικά tokens. Η MFA-VO-041 «TED typing & replay» θα αποτύγχανε για κάθε D1-δηλωμένο LLM βήμα.

## Επηρεαζόμενες ικανότητες

MFA-CAP-052 (διαχωρισμός planes), MFA-CAP-077 (ετικέτες ροής), MFA-CAP-050/051 (τύποι εκτέλεσης/αναπαραγωγιμότητας), MFA-CAP-022.

## Ετυμηγορία: UPHELD

(1) **Πραγματικό ελάττωμα ορίου**: η έξοδος πληροφορίας προς πάροχο είναι επίδραση κλάσης DISCLOSURE και δεν μοντελοποιείται. (2) **UPHELD**: το D1 για LLM είναι δηλωμένο ως άγνωστο (UNK-109) αλλά η **προεπιλογή** δεν είναι ρητή. (3) **REJECTED ως σχεδιαστικό ελάττωμα, UPHELD ως ζήτημα προφίλ**: το N-version είναι σωστό για Tier-0 κατηγορήματα (η διαφωνία **πρέπει** να είναι deny — fail-closed, MFA-INV-003)· το κόστος είναι θέμα OAP. (4) **REJECTED**: το πακέτο δεν ισχυρίζεται extraction· Tier-0 = απόδειξη για το μοντέλο, Tier-1 = DRT έναντι spec (MFA-VO-054)· πρέπει όμως να **δηλωθεί** ρητά ότι κανένας εξαχθείς κώδικας δεν είναι στο TCB. (5) **REJECTED** με διόρθωση: το Genesis plane είναι **ένα trust boundary**, όχι κατ' ανάγκη ένα microVM· στο DP-1 υλοποιείται ως ένα, στο DP-3+ ως ομάδα microVMs με κοινή ετικέτα plane· τα τοπικά μοντέλα τρέχουν ως όργανα **μέσα** στο plane (GPU passthrough ή host-side inference server με το plane ως μόνο πελάτη).

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0005:
1. **Νέα κλάση επίδρασης στο RET (MFA-ELM-010 / MFA-MECH-006): `Disclose⟨payload_label, recipient, purpose⟩`**, inverse NONE (η αποκάλυψη δεν αναιρείται) — αλλά με **standing grant**: `DisclosureGrant⟨recipient, max_label, purpose, expiry⟩` δηλωμένο κατά την εισδοχή του παρόχου (MFA-ELM-006), πολιτική PDP (MFA-ELM-007), ανακλητό, ίδιο το grant = δέσμευση στο ledger. Ο Gateway (MFA-ELM-009) επιβάλλει `label(payload) ≤ grant.max_label` (MFA-CAP-077) και **κάθε** κλήση παρόχου καταγράφεται ως `Disclose` δέσμευση με hash του payload (όχι το payload) και receipt. Έτσι το plane διαρρέει **μόνο** μέσω υπογεγραμμένου, σημασμένου καναλιού. Συνέπεια: «τοπικά μοντέλα στο DP-2» είναι **αναβάθμιση εμπιστευτικότητας** (grant με recipient = self), όχι feature.
2. **MFA-ELM-017 / MFA-MECH-007 (TED):** προεπιλεγμένος τύπος LLM βήματος = **D2** (σημασιολογικά ταυτόσημο υπό grammar constraint στην πηγή, CLAIMS H9) εκτός αν η εξαγωγή είναι τοπική, καρφιτσωμένη (weights hash + runtime hash + seed = δεσμεύσεις, MFA-INV-061) και έχει περάσει MFA-VO-041 σε 1000 επαναλήψεις → τότε D1. Ο τύπος γράφεται στο receipt.
3. **MFA-ELM-008:** η δεύτερη υλοποίηση (CL reference) είναι **audit sampling** στο DP-1 (ποσοστό από OAP) και πλήρης από DP-3· Tier-0 κατηγορήματα **πάντα** N-version (fail-closed). Διαφωνία ⇒ deny + Court με φραγμένο χρόνο (MFA-INV-065).
4. **MFA-ELM-020:** ρητή ρήτρα «κανένας εξαχθείς από Lean κώδικας στο TCB· Tier-0 = απόδειξη ιδιοτήτων του μοντέλου (TLA+/Lean)· η δέσμευση μοντέλου↔κώδικα είναι Tier-1 (DRT, MFA-VO-054)»· MFA-UNK-014 μένει RSP.
5. **MFA-ELM-094:** «ένα microVM» → «ένα trust boundary με ετικέτα plane, ένα ή περισσότερα microVMs ανά προφίλ· τοπικός inference server μέσα στο boundary».

## Υπολειπόμενος κίνδυνος

MFA-UNK-109 (D1 για LLM) και MFA-UNK-014 (extraction) ανοιχτά — δηλωμένα. Στο DP-1 κάθε LLM όργανο είναι D2: οι αναπαραγωγές είναι σημασιολογικές, όχι byte. Το `Disclose` grant είναι σημείο όπου η πολιτική επιτρέπει διαρροή — αυτό είναι **σωστό** (Δ-12: όρια έξω), αλλά το σφάλμα του δημιουργού στο grant γίνεται ιχνηλάσιμη, όχι αόρατη, αποκάλυψη.
