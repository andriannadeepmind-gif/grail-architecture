---
id: MFA-ATK-06
pass: G
attack: "6. Attack hidden mainstream anchoring"
method: "Devil's Advocate plugin → NO_SUBSCRIPTION· επίθεση από τον συντάκτη με το format της εντολής §17."
targets:
  elements: [MFA-ELM-002, MFA-ELM-003, MFA-ELM-005, MFA-ELM-006, MFA-ELM-007, MFA-ELM-009, MFA-ELM-012, MFA-ELM-014, MFA-ELM-079, MFA-ELM-080, MFA-ELM-081, MFA-ELM-082, MFA-ELM-083, MFA-ELM-084, MFA-ELM-087, MFA-ELM-097, MFA-ELM-025, MFA-ELM-019]
  contracts: [MFA-CON-031, MFA-CON-024, MFA-CON-017]
  invariants: [MFA-INV-017, MFA-INV-034]
  capabilities: [MFA-CAP-010, MFA-CAP-034, MFA-CAP-076, MFA-CAP-079, MFA-CAP-054, MFA-CAP-015]
verdict: "UPHELD IN PART — το υπόστρωμα ορθά mainstream (T-κλάση φθηνή)· η ένσταση πιάνει στα RETAIN που δεν εκμεταλλεύονται το υπόστρωμα: MFA-ELM-081, MFA-ELM-087"
modification: [MFA-PATCH-0006]
residual_risk: "Το lean profile γίνεται το μόνο που χτίζεται (failure mode TEL-08)· αντίμετρο: ratchet KT-15 ανά δόση + MFA-VO-024 ανά νέο όργανο."
---

# MFA-ATK-06 · Επίθεση στην κρυφή αγκύρωση στο mainstream

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

Όλα τα RETAIN των S0/S1/S8/S9: MFA-ELM-002 (CAS), 003 (threshold keys/HSM), 005, 006, 007 (PDP), 009 (gateway), 012, 014 (event fabric), 079 (PROV store), 080 (bitemporal KG), 081 (retrieval), 082, 083 (LinkML/SHACL), 084 (SLSA), 087 (OpenTelemetry-class) · MFA-ELM-097 (lean = «ο Copilot μέσα στο GRAIL») · MFA-ELM-019 (MCTS), 025.

## Ισχυρότερη ένσταση

Τα S0/S1/S8/S9 είναι **κατάλογος υποδομής 2024–2026**: Merkle logs (RFC 9162), HLC, Biscuit-class tokens, SLSA, LinkML/SHACL, OpenTelemetry, microVMs, MCTS. Η Δ-13 «βιβλιογραφία = κάτω φράγμα» έγινε **«βιβλιογραφία = το σχέδιο»**. Το lean profile είναι κυριολεκτικά ο Copilot. Πού είναι η επινόηση **στο υπόστρωμα**; Η εντολή ζήτησε blank sheet· το υπόστρωμα είναι bill of materials. Και η δεύτερη αιχμή: **RETAIN** σε 14 στοιχεία σημαίνει ότι δεν ρωτήθηκε καν τι θα έκανε το νέο υπόστρωμα (CC, Void, planes) **δυνατό** σε αυτά.

## Αντιπαράδειγμα

**MFA-ELM-081 Retrieval Layer — RETAIN**: hybrid BM25 + dense + rerank είναι κάθε RAG stack του 2025. Τίποτα στο πακέτο δεν κάνει την ανάκτηση **commitment-aware**: ανάκτηση κατά κλάση τεκμηρίου, κατά κατάσταση αμφισβήτησης (CONTESTED/Both), κατά διτεμπορική τομή (t_known), κατά confidentiality domain — ενώ όλα αυτά υπάρχουν **δίπλα** στο ledger. Η επινόηση που το υπόστρωμα καθιστά δυνατή λείπει **ακριβώς** στο στρώμα όπου ζει το LAWMAX. Δεύτερο: **MFA-ELM-087 Observability — RETAIN**: «μη αυθεντική με correlation» — αλλά οι αποφάσεις δειγματοληψίας traces δεν καταγράφονται· τα ablation studies (KT-24) χάνουν δεδομένα χωρίς να το ξέρουν.

## Επηρεαζόμενες ικανότητες

MFA-CAP-010 (αναπαράσταση γνώσης χωρίς commitment-aware πρόσβαση), MFA-CAP-034 (παρατηρησιμότητα), MFA-CAP-015 (η διαβούλευση ανακτά «κείμενα», όχι δεσμεύσεις), MFA-CAP-054.

## Ετυμηγορία: UPHELD IN PART

- **Απορρίπτεται** ότι το mainstream υπόστρωμα είναι ελάττωμα: το robust substrate (MFA-ELM-096) **πρέπει** να είναι βαρετό — εκεί οι κλάσεις απόδειξης T είναι φθηνές, η Δ-13 λέει κάτω φράγμα *όχι* απαγόρευση χρήσης, και η επινόηση του πακέτου είναι στο **τι τρέχει πάνω** στο υπόστρωμα (CC, planes, Void, TEGF, GCP, CQ) — 18 δοσιέ.
- **Γίνεται δεκτό** για MFA-ELM-081 και MFA-ELM-087: RETAIN χωρίς να ρωτηθεί τι κάνει δυνατό το νέο υπόστρωμα.
- **Γίνεται δεκτό** ως γενικός κανόνας: κάθε RETAIN πρέπει να έχει μία γραμμή «τι θα το έκανε STRENGTHEN και γιατί όχι» — αλλιώς είναι μη-εξέταση. Ελέγχθηκαν τα 14: 002, 003, 005, 006, 007, 009, 012, 014, 079, 080, 082, 083, 084 → παραμένουν RETAIN/STRENGTHEN με αιτιολογία (στο SUPERSEDED-REGISTER)· 081, 087 → STRENGTHEN.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0006:
1. **MFA-ELM-081 → STRENGTHEN: «Commitment-aware retrieval».** Ερώτημα = ⟨query, cut t_known, evidence_class_filter, contest_state_filter, domain⟩· αποτέλεσμα = **δεσμεύσεις με receipts**, όχι κείμενα· η ίδια η ανάκτηση είναι δέσμευση OBSERVE (index → δεν είναι αλήθεια, MFA-INV-017 ισχύει: το αποτέλεσμα δείχνει σε δεσμεύσεις του ledger, ποτέ σε αντίγραφα). MFA-CON-031 αποκτά τα πεδία· νέα υπο-υποχρέωση στη MFA-VO-003: replacement του retrieval engine δεν αλλάζει το σύνολο των επιστρεφόμενων CIDs σε σφραγισμένο σύνολο ερωτημάτων (μόνο τη σειρά).
2. **MFA-ELM-087 → STRENGTHEN:** οι αποφάσεις δειγματοληψίας είναι δεσμεύσεις Observation (ποσοστό, seed, παράθυρο) στο observability journal, ώστε το ablation (MFA-VO-024) να ξέρει τι **δεν** είδε· correlation προς ledger υποχρεωτική ανά span.
3. SUPERSEDED-REGISTER: στήλη «γιατί όχι STRENGTHEN» για κάθε RETAIN.

## Υπολειπόμενος κίνδυνος

Ο πραγματικός κίνδυνος της ένστασης δεν είναι το υπόστρωμα, είναι **η ροή του έργου**: το lean profile (mainstream) χτίζεται πρώτο (MFA-ATK-15/17) και μπορεί να γίνει το μόνο που χτίζεται ποτέ. Το TEL-08 το δηλώνει ως failure mode· τα αντίμετρα είναι διαδικαστικά (ratchet KT-15 σε κάθε δόση· κάθε δόση κλείνει με KT που αποτυγχάνει χωρίς το νέο της όργανο, MFA-VO-024) — όχι αρχιτεκτονικά. Ο δημιουργός αποφασίζει τον ρυθμό.
