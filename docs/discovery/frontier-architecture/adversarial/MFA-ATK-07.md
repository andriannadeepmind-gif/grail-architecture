---
id: MFA-ATK-07
pass: G
attack: "7. Attack hidden capability deletion"
method: "Devil's Advocate plugin → NO_SUBSCRIPTION· επίθεση από τον συντάκτη με το format της εντολής §17."
targets:
  elements: [MFA-ELM-001, MFA-ELM-004, MFA-ELM-021, MFA-ELM-031, MFA-ELM-035, MFA-ELM-036, MFA-ELM-042, MFA-ELM-044, MFA-ELM-045, MFA-ELM-047, MFA-ELM-055, MFA-ELM-063, MFA-ELM-064, MFA-ELM-068, MFA-ELM-071, MFA-ELM-092, MFA-ELM-034, MFA-ELM-052]
  mechanisms: [MFA-MECH-001, MFA-MECH-002]
  invariants: [MFA-INV-019, MFA-INV-004, MFA-INV-035]
  registers: ["CAPABILITY-CONSERVATION.md", "SUPERSEDED-REGISTER.md", "tools/check-package.py R6"]
  capabilities: [MFA-CAP-008, MFA-CAP-009, MFA-CAP-039, MFA-CAP-040, MFA-CAP-047]
verdict: "UPHELD — πραγματικός κίνδυνος διαγραφής: 33 ADR και 27 EXP εκτός R6 (5 ADR και 10 EXP χωρίς καμία αναφορά στο πακέτο)· οι 10 άξονες κατάστασης και οι 5 χρόνοι της ύλης δεν είναι επαληθεύσιμα παρόντες"
modification: [MFA-PATCH-0007]
residual_risk: "Τα EXP μένουν έρευνα· καθένα έχει πρόγραμμα (RSP) και δόση όπου τρέχει το πρώτο πείραμα."
---

# MFA-ATK-07 · Επίθεση στην κρυφή διαγραφή ικανοτήτων

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

Το Capability Conservation Ledger και η R6 του `tools/check-package.py` (75 CMP, 32 ICD, 40 INV, 24 KT — **όχι** 33 ADR, **όχι** 27 EXP) · MFA-ELM-068 (Practice Unit Templates, «δεν ξέρω»), 092 (Human Continuity Port [E]), 031 (Reflective Tower [EP]), 036 (Consolidation EXP-13), 055 (EXP-26), 047 (EXP-25), 063 (EXP-24), 064 (EXP-09), 071 · MFA-ELM-001/004/035/021/042 έναντι MATERIAL §2 (10 άξονες, 5 χρόνοι, 10 τύποι μνήμης, 10 governors, 3 έδρες) · MFA-ELM-034, 052, 044, 045.

## Ισχυρότερη ένσταση

«RETAINED AS RESEARCH FRONTIER» είναι το συνώνυμο του πακέτου για «dropped». 27 EXP και αρκετά στοιχεία ωριμότητας E/X είναι παρκαρισμένα. Η R6 ελέγχει CMP/ICD/INV/KT — **όχι** τις 33 ADR, **όχι** τα 27 EXP: 33 αποφάσεις και 27 πειράματα μπορούν να εξαφανιστούν χωρίς να το πιάσει κανένας έλεγχος. Και οι 35 γραμμές του MATERIAL §2 (οι υποβαθμίσεις που η Φάση Α έκανε στην ύλη του δημιουργού — «το σημαντικότερο εύρημα») — προσγειώθηκε καθεμία σε **συγκεκριμένο πεδίο** στοιχείου; Ή έγιναν πρόζα στο statement;

## Αντιπαράδειγμα (μετρημένο, όχι υποθετικό)

- `grep` του πακέτου (YAML + mechanisms + alternatives): **ADR-0001, ADR-0004, ADR-0005, ADR-0028, ADR-0032 δεν αναφέρονται πουθενά.** Η ADR-0005 (Propose–Verify–Commit· «η μία πόρτα») είναι **η κεντρική** απόφαση του corpus.
- **EXP-05, 06, 11, 12, 14, 15, 17, 18, 20, 23 δεν αναφέρονται πουθενά** (10 από 27). EXP-15 (local-model sovereignty quality gap) είναι ακριβώς το πείραμα που η MFA-ATK-05 χρειάζεται.
- **10 άξονες κατάστασης** (MATERIAL §2 #5: source_integrity, evidentiary_support, formal_validity, temporal_applicability, interpretive_status, causal_support, strategic_value, execution_status, freshness, authorization): το `state_model` του MFA-ELM-001 λέει «journals + heads + epoch + nogoods». Αν ο τύπος Commitment έχει ένα πεδίο `evidence`, **9 άξονες χάθηκαν** — πουθενά δεν αποδεικνύεται ότι δεν χάθηκαν.
- **Πέντε χρόνοι, δύο ιστορίες** (MATERIAL §2 #10: συμβάντος, παρατήρησης, νομικής ισχύος, καταχώρισης, διαδικαστικός): το MFA-ELM-004 λέει «διτεμπορικά cuts, typed legal time». Διτεμπορικό = 2 από 5.
- **10 τύποι μνήμης** (#4): MFA-ELM-035 απαριθμεί 6 (episodic/semantic/procedural/autobiographical/working/prospective).
- **10 governors** (#11): MFA-MECH-005 λέει «governors με stops/cannot» χωρίς να τους ονομάζει.
- **6 βαθμίδες owner perimeter** (#14: Think → Prepare → Recommend → Execute bounded → Execute consequential → Emergency stop): πουθενά ως απαρίθμηση.
- **4 μηχανισμοί λήθης + EVIDENCE-ORPHANED** (#29): MFA-ELM-035 λέει «crypto-shredding» — 1 από 4.

## Επηρεαζόμενες ικανότητες

MFA-CAP-008 (χρόνος: 2/5), MFA-CAP-009 (μνήμη: 6/10), MFA-CAP-039/040 (τυποποιημένη απουσία **ανά πεδίο**, #9: μόνο σε επίπεδο δέσμευσης), MFA-CAP-047, MFA-CAP-049 (governors ανώνυμοι).

## Ετυμηγορία: UPHELD

Πραγματική διαγραφή — όχι πρόθεση, αλλά **μη επαληθεύσιμη παρουσία**, που κατά το άρθρο 6 του ΝΟΜΟΥ ισοδυναμεί με σιωπηλή παράλειψη. Το πακέτο διεκδικεί «κανένα capability δεν εξαφανίστηκε σιωπηλά» χωρίς έλεγχο για τα 2/3 των πηγών.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0007:
1. **CAPABILITY-CONSERVATION.md**: τρεις επιπλέον πίνακες με **τύχη + πεδίο στοιχείου** ανά γραμμή: (α) 33 ADR, (β) 27 EXP, (γ) 35 γραμμές MATERIAL §2. Κανένα «RETAINED AS RESEARCH FRONTIER» χωρίς RSP-id **και** αριθμό δόσης.
2. **MFA-ELM-001 / MFA-MECH-001 (state_model):** κάθε Commitment φέρει `status_axes` = record των **10 αξόνων**, καθένας ∈ {value, Absent(reason ∈ {NOT_APPLICABLE, UNKNOWN, NOT_OBSERVED, NOT_YET_DERIVED, CONTESTED, WITHHELD_BY_AUTHORITY})} (MATERIAL §2 #5 + #9: τυποποιημένη απουσία **ανά πεδίο**, ποτέ κενό). Ο Void Ledger (MFA-MECH-002) δεικτοδοτεί ανά άξονα.
3. **MFA-ELM-004 (state_model):** `Times⟨t_event, t_observed, t_legal_effect, t_recorded, t_procedural⟩`, καθένας typed· διτεμπορικό = (t_event, t_recorded) ⊂ 5· «δύο ιστορίες» = (τι ίσχυε, τι μπορούσε να γνωρίζει ο πράττων στο t_observed)· MFA-INV-019 (no silent time default) ισχύει **και για τους πέντε**· MFA-INV-035 αναφέρει t_legal_effect/t_procedural ρητά.
4. **MFA-ELM-035:** 10 τύποι μνήμης της ύλης ως απαρίθμηση με ρυθμό μεταβολής/ορίζοντα ανά τύπο (τα 6 υπάρχοντα + sensory-buffer, affective/valuation, social/model-of-others, meta/self — από MATERIAL §2 #4) και **4 μηχανισμοί λήθης** (decay, suppression, cryptographic erasure, structural tombstone) + impact event EVIDENCE-ORPHANED (#29).
5. **MFA-MECH-005 / MFA-ELM-008:** οι 10 governors **ονομάζονται** (Truth, Legal/Deontic, Owner-intent, Value, Regret, Curiosity, Empowerment, Commitment, Identity, Resource — #11) με bid/veto/evidence/counterfactual-cost ανά governor· ο **default ORDER** (MFA-ATK-09) διατάσσει αυτά τα 10.
6. **MFA-ELM-010 / MFA-ELM-007:** το owner perimeter **6 βαθμίδων** (#14) ως απαρίθμηση των AutonomyGrant επιπέδων· Think = μηδέν side effect = Genesis plane εξ ορισμού.
7. **tools/check-package.py R10:** κάθε ADR-0001…0033 και EXP-01…27 και MATERIAL §2 #1…35 αναφέρεται **ακριβώς μία φορά** στο CAPABILITY-CONSERVATION.md με τύχη ≠ κενό.

## Υπολειπόμενος κίνδυνος

Τα EXP παραμένουν έρευνα — αυτό δεν είναι διαγραφή, είναι η φύση τους — αλλά καθένα δένεται τώρα σε RSP και δόση. Ο κίνδυνος που μένει: γραμμές της ύλης που **δεν** μπήκαν στο MATERIAL §2 (η ύλη έχει 455 μηχανισμούς, το §2 έχει 35) — το πακέτο καλύπτει ό,τι η Φάση Α αναγνώρισε ως υποβάθμιση, όχι τους 455· αυτό δηλώνεται στο COUNT-PROVENANCE ως όριο (τίμια άγνοια, όχι ισχυρισμός πληρότητας).
