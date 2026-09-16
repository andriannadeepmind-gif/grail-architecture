---
id: MFA-ATK-03
pass: G
attack: "3. Attack every claimed strict-superior replacement"
method: "Devil's Advocate plugin → NO_SUBSCRIPTION· επίθεση από τον συντάκτη με το format της εντολής §17."
targets:
  replacements: ["MFA-ELM-024 (REPLACE static self-model → SPL)", "MFA-ELM-088 (REPLACE SysML/SysON seat → package as substrate)", "MFA-INV-031 (REPLACE INV-F02 absolute → levels L0–L3)"]
  elements: [MFA-ELM-024, MFA-ELM-088, MFA-ELM-090, MFA-ELM-091, MFA-ELM-020, MFA-ELM-013, MFA-ELM-006]
  mechanisms: [MFA-MECH-010, MFA-MECH-013]
  invariants: [MFA-INV-031, MFA-INV-059, MFA-INV-064]
  capabilities: [MFA-CAP-017, MFA-CAP-016, MFA-CAP-032, MFA-CAP-055, MFA-CAP-003]
verdict: "UPHELD for ELM-024 and ELM-088 (not strictly superior — Pareto); REJECTED for INV-031"
modification: [MFA-PATCH-0003]
residual_risk: "Ο έλεγχος τύπων KerML της SysML προβολής δεν μπορεί να τρέξει σε αυτή τη συνεδρία (SysON MCP απρόσιτο)· η VO μένει PENDING."
---

# MFA-ATK-03 · Επίθεση σε κάθε «αυστηρά ανώτερη» αντικατάσταση

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

Το SUPERSEDED-REGISTER δηλώνει τρία REPLACE. Η εντολή §20: «αν υπάρχει απώλεια σε οποιαδήποτε ουσιώδη διάσταση, δεν επιτρέπεται η λέξη strictly superior». Ελέγχεται καθένα.

## Στόχοι (target IDs)

MFA-ELM-024 (Metacognition & Self-Prediction, SPL — MFA-MECH-010) · MFA-ELM-088 (Canonical Design Platform) με MFA-ELM-090/091 · MFA-INV-031 (Self-modification boundary, επίπεδα) · παράπλευρα MFA-ELM-013 (OAP), MFA-ELM-006, MFA-ELM-020.

## Ισχυρότερη ένσταση

**(α) ELM-024.** Το παλιό self-model του corpus ήταν **περιγραφή ικανοτήτων** χρησιμοποιήσιμη **πριν** από κάθε πράξη («τι μπορώ»). Το SPL είναι **προβλέψεις που βαθμολογούνται μετά**. Ένα ledger προβλέψεων δεν απαντά «μπορώ το Χ;» πριν υπάρξει έστω μία πρόβλεψη: **cold start**. Η ικανότητα «αυτο-περιγραφή για σχεδιασμό» χάνεται → όχι αυστηρά ανώτερο· Pareto.

**(β) ELM-088.** Το SysON δίνει **ζωντανό model με metamodel SysML v2 τυποποιημένο (KerML), έλεγχο τύπων και validation**. Ένα πακέτο YAML + Python checker **χάνει τον έλεγχο τύπων του metamodel**: το check-package ελέγχει αναφορές και πληρότητα πεδίων, όχι τυπική ορθότητα (`satisfy`/`verify`/`#derivation` σημασιολογία, συμβατότητα ports). Απώλεια σε ουσιώδη διάσταση → όχι αυστηρά ανώτερο.

**(γ) INV-031.** Το παλιό INV-F02 «σύνταγμα, verifier set και gate ποτέ αυτο-τροποποιούνται» ήταν απόλυτο και απλό. Τα επίπεδα L0–L3 εισάγουν επιφάνεια επίθεσης: **σύγχυση επιπέδου** (μια αλλαγή που δηλώνεται L1 ενώ αγγίζει L3).

## Αντιπαράδειγμα

- (α) Νέο όργανο μόλις εισήχθη μέσω ORP: μηδέν προβλέψεις. Ο OAP (MFA-MECH-013) χρειάζεται το competence envelope του για set cover· με SPL μόνο, FidelityIndex απροσδιόριστος → ο OAP δεν μπορεί να σχεδιάσει → πέφτει στο δηλωμένο προφίλ → **άρα το δηλωμένο προφίλ (το παλιό self-model) εξακολουθεί να χρειάζεται**. Το SPL το συμπληρώνει, δεν το αντικαθιστά.
- (β) Ένα contract του πακέτου με port `in item x` που συνδέεται σε `out item y` ασύμβατου τύπου: περνά το check-package (ελέγχει ότι τα IDs υπάρχουν), απορρίπτεται από το SysON στο import. Το `platform/fidelity/GrailFidelityTest.sysml` δείχνει ότι ο έλεγχος αυτός είναι πραγματικός και μετρήσιμος στη SysON v2026.7.0.
- (γ) Δεν βρέθηκε αντιπαράδειγμα: κάθε αλλαγή L3 απαιτεί υπογραφή δημιουργού **και** αν μια αλλαγή δηλωμένη ως L1 αγγίζει L3 στοιχείο, ο έλεγχος είναι συντακτικός (ποια IDs τροποποιούνται — MFA-PATCH targets), όχι σημασιολογικός· η «σύγχυση επιπέδου» απαιτεί να αλλάξει το ID-set ενός επιπέδου, που είναι το ίδιο L3 πράξη.

## Επηρεαζόμενες ικανότητες

MFA-CAP-017 (self-model), MFA-CAP-016 (μεταγνώση), MFA-CAP-032 (OAP), MFA-CAP-055 (patchability), MFA-CAP-003 (έδρα).

## Ετυμηγορία

- (α) **UPHELD**: το REPLACE γίνεται **MERGE WITHOUT LOSS**.
- (β) **UPHELD**: το REPLACE γίνεται **SPLIT**: έδρα → υπόστρωμα (κρατιέται: το SysON **ποτέ** έδρα, λόγω silent truncation — DESIGN-START-PLAN:115)· έλεγχος τύπων → SysON (ή η reference υλοποίηση SysML v2) ως **verifier organ Tier-1 για προβολές**.
- (γ) **REJECTED**: L3 ⊇ παλιό απόλυτο σύνολο· L0–L2 προσθέτουν δομή χωρίς να αφαιρούν· η παλιά ρήτρα διατηρείται αυτούσια ως ρήτρα L3 του MFA-INV-031. Αυστηρά ανώτερο.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0003:
1. **MODIFY MFA-ELM-024**: statement = CompetenceProfile (δηλωμένο, τρεις έδρες CAPABILITY / COMPETENCE / AUTHORITY από MATERIAL §2 #12: applicability, calibration, failure envelope, evidence) **+** SPL. Cold start: το CompetenceProfile νέου οργάνου είναι **δέσμευση κλάσης Unknown** (reason: NOT_OBSERVED, plan: N βαθμολογημένες προβλέψεις, VOI από OAP) μέχρι FidelityIndex ≥ κατώφλι· ο OAP σχεδιάζει με το δηλωμένο προφίλ **σημασμένο** ως unverified και το χρησιμοποιεί μόνο σε canary. `delta: MERGE`. Register: «MERGED WITHOUT LOSS».
2. **MODIFY MFA-ELM-088**: προστίθεται ρήτρα «η SysML προβολή ελέγχεται τυπικά (KerML) από SysON ή reference implementation ως Tier-1 verifier· αποτυχία τύπων = SEMANTIC-LOSS της προβολής (μπλοκάρει, MFA-INV-052)»· MFA-VO-026 επεκτείνεται (round-trip **και** type-check). `delta: SPLIT`. DEC-PLT-01 παραμένει superseded ως *έδρα*, όχι ως *εργαλείο*.
3. MFA-INV-031: καμία αλλαγή· η ετυμηγορία καταγράφεται.

## Υπολειπόμενος κίνδυνος

Ο έλεγχος KerML της προβολής **δεν μπορεί να τρέξει εδώ** (ο MCP server `syson` απέτυχε να συνδεθεί: Windows deno path — αδυναμία εργαλείου, ΝΟΜΟΣ §14). Η MFA-VO-026 έχει status PENDING μέχρι να τρέξει ο δημιουργός το import στο SysON. Cold start του CompetenceProfile: το «δηλωμένο» προφίλ είναι ισχυρισμός του οργάνου για τον εαυτό του — γι' αυτό μόνο canary μέχρι FidelityIndex.
