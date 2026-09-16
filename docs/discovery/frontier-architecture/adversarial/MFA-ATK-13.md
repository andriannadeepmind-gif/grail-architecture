---
id: MFA-ATK-13
pass: G
attack: "13. Attack resource feasibility"
method: "Devil's Advocate plugin → NO_SUBSCRIPTION· επίθεση από τον συντάκτη με το format της εντολής §17."
targets:
  profiles: [MFA-DEP-1, MFA-DEP-2, MFA-DEP-3, MFA-DEP-4, MFA-DEP-5]
  elements: [MFA-ELM-013, MFA-ELM-097, MFA-ELM-096, MFA-ELM-011, MFA-ELM-017, MFA-ELM-056, MFA-ELM-050, MFA-ELM-073, MFA-ELM-085, MFA-ELM-020, MFA-ELM-086, MFA-ELM-048, MFA-ELM-059, MFA-ELM-065, MFA-ELM-076]
  mechanisms: [MFA-MECH-013, MFA-MECH-009, MFA-MECH-018]
  invariants: [MFA-INV-048, MFA-INV-050, MFA-INV-065]
  objectives: [MFA-OBJ-030]
  capabilities: [MFA-CAP-032, MFA-CAP-033, MFA-CAP-054, MFA-CAP-075, MFA-CAP-029]
verdict: "UPHELD — το DP-1 δεν ικανοποιεί EIM (5 «ανεξάρτητοι» Πολιτισμοί στην ίδια μηχανή = ανεξαρτησία 0)· ο HELD_OUT πρέπει να είναι σε ξεχωριστή φυσική συσκευή ή οι προαγωγές μπλοκάρουν· το φράγμα κόστους αξιολόγησης πρέπει να είναι δηλωμένη παράμετρος ανά προφίλ"
modification: [MFA-PATCH-0013]
residual_risk: "Το κόστος δεύτερης συσκευής είναι πραγματικό· χωρίς αυτήν, DP-1 = lean profile με παγωμένα όργανα — δηλωμένο."
---

# MFA-ATK-13 · Επίθεση στην εφικτότητα πόρων

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

MFA-DEP-1…5 · MFA-ELM-013 (OAP, MFA-MECH-013), 097 (lean), 096, 011, 017, 056 (Civilization Quorum: «5 microVMs στο DP-1», MFA-MECH-018), 050 (CAM-NS πληθυσμοί), 073 (evolution sandbox), 085 (DST), 020 (Lean/TLA+), 086 (harness, EIM MFA-MECH-009), 048 (Court panels), 059 (LSC: διπλός front-end), 065 (5-σκελής verifier), 076 · MFA-INV-048/050/065 · MFA-OBJ-030.

## Ισχυρότερη ένσταση

1. **Οι «5 Πολιτισμοί = 5 microVMs» στο laptop είναι μυθοπλασία ανεξαρτησίας.** Ίδιο hardware, ίδιο OS, ίδιος δίσκος, ίδια σύνδεση, ίδιος πάροχος: η «supply independence» του EIM είναι 0· «held-out στην ίδια μηχανή με το κρινόμενο» δεν είναι held-out — η MFA-INV-048 παραβιάζεται **από το ίδιο το DP-1**.
2. **Το σύστημα ξοδεύει τον προϋπολογισμό του κρίνοντας τον εαυτό του.** N-version πύλες, shadow runs ×2, CAM-NS πληθυσμοί, DST, Court panels, διπλός LSC front-end, 5-σκελής επαλήθευση κάθε παραπομπής: ο λόγος αξιολόγηση/παραγωγή θα είναι > 10. Η MFA-INV-065 λέει «φραγμένο» χωρίς αριθμό.
3. **LLM κόστος**: κάθε δέσμευση περνά από differential δεύτερο front-end (LSC S6) + 5 σκέλη → ≥ 2× inference ανά είσοδο.

## Αντιπαράδειγμα

DP-1 με 64 GB RAM: 5 microVMs × (μοντέλο + evaluators) → αδύνατο με τοπικό μοντέλο πάνω από ~7B· άρα οι 5 «Πολιτισμοί» είναι 5 διεργασίες που καλούν **τον ίδιο** απομακρυσμένο πάροχο → supply independence = 0 → EIM PASS αδύνατο → **οι προαγωγές παγώνουν στο DP-1** (MFA-CON-041) → το προφίλ laptop **δεν μπορεί ποτέ να εξελίξει όργανο**. Το πακέτο το παρουσιάζει ως «5 microVMs (DST μόνο)» — δηλαδή το παραδέχεται σιωπηλά.

## Επηρεαζόμενες ικανότητες

MFA-CAP-033 (πέντε προφίλ ένα σύστημα — το DP-1 είναι διαφορετικό σύστημα ως προς την εξέλιξη), 075 (μετρητής ανεξαρτησίας = 0), 032 (OAP χωρίς φράγμα ενέργειας), 054, 029.

## Ετυμηγορία: UPHELD

Το DP-1 δεν ικανοποιεί το EIM· το πακέτο **πρέπει να το πει** και να δώσει τη διέξοδο: HELD_OUT σε **ξεχωριστή φυσική συσκευή** υπό κλειδιά δημιουργού (δεύτερο laptop, phone-class, ή φθηνό VPS) — αλλιώς προαγωγές **EIM-UNVERIFIED** (το όργανο τρέχει μόνο ως canary, ποτέ cutover). Το φράγμα κόστους αξιολόγησης πρέπει να είναι **αριθμός ανά προφίλ**.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0013 (τα MFA-DEP-n ζουν στο TECHNICAL-ARCHITECTURE.md §Deployment):
1. **Κάθε MFA-DEP-n αποκτά πεδίο `held_out_site`.** DP-1: «1 VOTING + 1 HELD_OUT ελάχιστο· ο HELD_OUT σε **ξεχωριστή φυσική συσκευή** (δικαιολογείται και phone-class: τρέχει μόνο sealed sets + scorer)· αλλιώς `promotion: EIM-UNVERIFIED → canary-only`». Η MFA-INV-048 μένει **απόλυτη**· η MFA-INV-050 (held-out ποτέ δεν ψηφίζει) το κάνει φθηνό: ο HELD_OUT δεν χρειάζεται μοντέλο, χρειάζεται scorer + sealed sets.
2. **MFA-INV-065 με αριθμό ανά προφίλ**: λόγος κόστους αξιολόγησης/παραγωγής ≤ 3 (DP-1), ≤ 5 (DP-2/3), ≤ 10 (DP-4)· ο OAP (MFA-MECH-013) το χειρίζεται ως **περιορισμό** του set cover: αν η πλήρης αξιολόγηση υπερβαίνει, υποχωρεί το **εύρος** (audit sampling της N-version, MFA-ATK-05· δειγματοληψία του δεύτερου front-end LSC S6· CAM-NS πληθυσμός μικρότερος) και **ποτέ η κλάση απόδειξης** (Tier-0 κατηγορήματα πάντα πλήρη). MFA-VO-050 μετρά τον λόγο ανά δόση.
3. **OAP**: η αντικειμενική συνάρτηση περιλαμβάνει **ενέργεια (Wh ανά matter)** με envelope ανά προφίλ (πεδίο `energy_envelope` στα MFA-DEP-n).
4. **Πέντε Πολιτισμοί**: N=3f+1 με f=1 (4 VOTING) + h=1 HELD_OUT = 5 είναι το **πλήρες** σχήμα (DP-4)· DP-1/2 = {1 VOTING, 1 HELD_OUT remote}· DP-3 = {4 VOTING σε ≥2 hosts, 1 HELD_OUT remote}. Το MFA-ELM-056 statement και το resource_model διορθώνονται.

## Υπολειπόμενος κίνδυνος

Το κόστος μιας δεύτερης συσκευής είναι πραγματικό αλλά μικρό (scorer + sealed sets). Χωρίς αυτήν, το DP-1 είναι **lean profile με παγωμένα όργανα** — αυτό δηλώνεται τώρα ρητά αντί να κρύβεται πίσω από «5 microVMs». Ο λόγος ≤ 3 στο DP-1 είναι πρόταση· η μέτρηση (MFA-VO-050) τον διορθώνει.
