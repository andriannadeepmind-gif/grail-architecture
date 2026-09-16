# MFA-ALT-7 — Weights-Only Continual Learner — η εναλλακτική που αποκλείστηκε a priori και έπρεπε να δειχθεί κυριαρχούμενη

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

```yaml
id: MFA-ALT-7
type: alternative-architecture
name: Weights-Only Continual Learner
version: 1
status: PROPOSED
maturity: X
created_by: "Stavropoulos Law® — Pass H (MFA-PATCH-0002, από MFA-ATK-02), 2026-09-16"
first_principle: "Η γνώση ζει στις παραμέτρους. Καμία συμβολική δέσμευση· η μνήμη είναι βάρη· η εξέλιξη είναι συνεχής εκπαίδευση από τα επεισόδια του γραφείου· η ταυτότητα είναι το checkpoint."
new_computational_abstraction: "Ο θεσμός ως συνάρτηση: institution = f_θ, θ_{t+1} = θ_t − η∇L(επεισόδια_t)· «απόφαση» = δειγματοληψία από f_θ· «μάθηση» = ενημέρωση θ· «διαγραφή» = unlearning."
boundary_definition: "Το checkpoint και ο άνθρωπος που υπογράφει. Δεν υπάρχει ledger· υπάρχει αρχείο checkpoints με hash και το training log."
evolution_mechanism: "Συνεχής fine-tuning (adapters ανά πελάτη/πεδίο) + περιοδικό merge· καμία ORP· η «προαγωγή» είναι η επόμενη έκδοση βαρών."
collective_mechanism: "Ensemble μοντέλων (federated ανά γραφείο)· συμφωνία = πλειοψηφία δειγμάτων· καμία ετυμηγορία ως αντικείμενο."
```

## 1. Τι είναι

| Στοιχείο | Τι ακριβώς |
|---|---|
| Μοντέλο | ένα ανοιχτό μοντέλο (7–70B) σε τοπικό hardware ή πάροχος με fine-tuning API· adapters (LoRA-class) ανά πεδίο/πελάτη |
| Μνήμη | (α) τα βάρη· (β) ένα document store για long-context retrieval· κανένα σχήμα δέσμευσης |
| Μάθηση | κάθε ολοκληρωμένη υπόθεση = training επεισόδιο (είσοδος, έξοδος, διόρθωση δικηγόρου)· νυχτερινό fine-tuning |
| Προέλευση | training log: ποιο checkpoint είδε ποιο έγγραφο (hash)· καμία προέλευση ανά ισχυρισμό |
| Διαγραφή | unlearning (gradient ascent σε ξεχασμένα δείγματα) ή επανεκπαίδευση από checkpoint πριν από την είσοδο |
| Ανθρώπινος έλεγχος | ο δικηγόρος υπογράφει· καμία εξωτερική επίδραση από το σύστημα |
| Ανάπτυξη | workstation με GPU ή cloud fine-tuning· 0–1 ops |

## 2. Κάλυψη των concerns της εντολής §10 (σύνοψη)

| Concern | ALT-7 | Πώς |
|---|---|---|
| Telos | ✗ | δεν έχει αντικείμενο «Telos»· έχει loss function |
| Canonical substrate | ✗ | καμία έδρα· τα βάρη δεν διαβάζονται |
| Identity & continuity | ~ | checkpoint hash· καμία συνέχεια χαρακτήρα μετρήσιμη (Battery αδύνατη χωρίς ανεξάρτητο evaluator) |
| Authority | ~ | μόνο ο άνθρωπος· το σύστημα δεν πράττει |
| Provenance | ✗ | training log ανά έγγραφο, ΟΧΙ ανά ισχυρισμό· «γιατί το είπες;» δεν απαντιέται |
| Time / causal history | ✗ | ο χρόνος είναι η σειρά των checkpoints |
| Memory | ✓ (implicit) | ~ (explicit) | παραμετρική + retrieval |
| Knowledge representation | ✗ | κατανεμημένη, μη ελέγξιμη |
| Perception / ingestion | ✓ | κείμενο → context ή training |
| Legal reasoning | ~ | in-weights· καμία υπαγωγή ως αντικείμενο |
| Causal / counterfactual | ✗ | μόνο ό,τι μαθεύτηκε |
| Deliberation | ~ | sampling + self-consistency |
| Metacognition | ~ | logit calibration· καμία SPL |
| Collective | ~ | ensemble |
| Adversarial / Court | ✗ | καμία διαδικασία |
| Verification | ✗ | μόνο ανθρώπινη· κανένα proof object |
| Evolution | ✓ | το ισχυρότερο σημείο: μαθαίνει από κάθε υπόθεση χωρίς σχεδιασμό |
| Successor | ✗ | ο «διάδοχος» είναι το επόμενο checkpoint· καμία ετυμηγορία |
| Deletion | ~ | unlearning: ανοιχτό πρόβλημα· αποδεικτικά ανεπαρκές για GDPR (EXP-19) |
| Deployment profiles | ✓ | ένα μηχάνημα |
| Cockpit | ✗ | chat |
| Patchability | ✗ | «patch» = fine-tune· μη επαληθεύσιμο |

## 3. Σύγκριση με τη σύνθεση (MFA-ATK-02 / MFA-ATK-17) — πού ΚΥΡΙΑΡΧΕΙ και πού ΚΥΡΙΑΡΧΕΙΤΑΙ

| Άξονας | ALT-7 | Σύνθεση (lean profile) | Κρίση |
|---|---|---|---|
| κόστος ανά ερώτηση | 1 forward pass | forward + verifier + receipts | **ALT-7** |
| latency | δευτερόλεπτα | δευτερόλεπτα (lean) | ισοπαλία |
| προσαρμογή στο ύφος/πεδίο του γραφείου | **μαθαίνει** | Skill Library (προγράμματα) + adapters ως παράγωγα (EP) | **ALT-7** βραχυπρόθεσμα |
| receipts μέχρι raw bytes | ✗ | ✓ | **Σύνθεση** |
| KT-06 poisoned evidence | το **μαθαίνει** | taint 100 % εντός Δ | **Σύνθεση** |
| KT-01 provider change | αλλαγή ταυτότητας | ταυτότητα διατηρείται | **Σύνθεση** |
| KT-16 GDPR erasure | unlearning (ανεπαρκές) | shredding + residue | **Σύνθεση** |
| 4 κλάσεις εξόδου | ✗ (δεν διακρίνει VERIFIED από «σίγουρο») | ✓ | **Σύνθεση** |
| αμφισβητησιμότητα | ✗ | contest path | **Σύνθεση** |
| διάδοχος / εξέλιξη οργάνων | ✗ / συνεχής | GCP / ORP | ασύγκριτο: ALT-7 εξελίσσεται φθηνά, χωρίς έλεγχο |
| time_to_correction (άξονας κύκλου 1 Pass I) | επανεκπαίδευση/unlearning: ημέρες, χωρίς εγγύηση | taint 100 % εντός Δ (λεπτά) | **Σύνθεση** |

**Κρίση:** καμία Pareto κυριαρχία προς καμία κατεύθυνση. Η ALT-7 κυριαρχεί σε κόστος και προσαρμογή· κυριαρχείται σε **κάθε** εγγύηση T (προέλευση, συνέχεια, διαγραφή, κλάσεις εξόδου, αμφισβητησιμότητα).

## 4. Τι ΔΕΝ μπορεί — και γιατί αυτό είναι το επιχείρημα της σύνθεσης

1. Δεν παράγει receipt ανά ισχυρισμό: το «γιατί» είναι post-hoc rationalisation του ίδιου μοντέλου (καμία ανεξαρτησία, MFA-INV-048).
2. Δεν διακρίνει VERIFIED από REFUTED από UNKNOWN χωρίς **εξωτερικό** verifier — και μόλις προστεθεί εξωτερικός verifier, χρειάζεται έδρα για το τι επαληθεύτηκε: ledger. Η ALT-7 **συγκλίνει προς τη σύνθεση** μόλις ζητηθεί INV-C04.
3. Δεν διαγράφει αποδεικτικά (unlearning: καμία εγγύηση, EXP-19).
4. Δεν έχει συνέχεια: αλλαγή βάσης μοντέλου = νέα οντότητα.

## 5. Τι ΚΛΕΒΕΙ η σύνθεση από την ALT-7

- **MFA-CAP-066**: adapters ως **παράγωγα** από raw επεισόδια, με lineage, υπό ORP και Battery — η μάθηση της ALT-7 μέσα στο κυρίαρχο όριο, με το ledger ως πηγή (DEC-X-19: EP βαρών).
- **MFA-MECH-019 (PDE)**: η κατανομή προτάσεων εξελίσσεται — η ALT-7 το κάνει με βάρη, η σύνθεση με **προγράμματα** της Skill Library + μείγμα (MFA-ATK-10).
- **MFA-CAP-057**: unlearning ως **υποχρέωση** στα παράγωγα βάρη μετά από shredding της πηγής.

## 6. Πειράματα (falsifiers της κυριαρχίας)

| ID | Πείραμα | Αν … | Τότε … |
|---|---|---|---|
| ALT7-E1 | KT-06 σε ALT-7: πλαστό προηγούμενο στο training set | ALT-7 το παραθέτει σε ≥1/20 ερωτήσεις | επιβεβαιώνεται η κυριαρχία της σύνθεσης στην προέλευση |
| ALT7-E2 | unlearning benchmark (EXP-19) | ανάκτηση ξεχασμένου < 1 % με membership inference | η ALT-7 αποκτά αποδεικτική διαγραφή → MFA-CAP-057 κερδίζει έναν μηχανισμό |
| ALT7-E3 | προσαρμογή ύφους: ALT-7 vs Skill Library προγράμματα σε 100 έγγραφα | ALT-7 προτιμάται από τυφλό panel με περιθώριο | το PDE (MFA-MECH-019) πρέπει να περιλάβει adapters ως μέλος (e) νωρίτερα |
| ALT7-E4 | αν ALT-7 περάσει KT-06 με 100 % taint εντός Δ (MFA-INV-018) | — | η ALT-7 **κυριαρχεί** σε κόστος και η σύνθεση χάνει τον λόγο ύπαρξης του ledger — αυτό είναι ο falsifier της σύνθεσης |

**AI Contribution Ledger:** `CROSS-SOURCE SYNTHESIS` — η ALT-7 συνθέτει continual learning / LoRA / unlearning / federated ensembles σε μία πλήρη εναλλακτική· καμία επινόηση· η αξία της είναι ως **αντίπαλος** (MFA-ATK-17) και ως δότης της MFA-CAP-066/057 και του PDE.
