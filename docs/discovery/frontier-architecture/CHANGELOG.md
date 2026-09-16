# CHANGELOG — μία γραμμή ανά patch (PATCH-PROTOCOL §4.5)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Patch | Πράξη | Τίτλος | Στόχοι | Status | Rollback |
|---|---|---|---|---|---|
| MFA-PATCH-0001 | MODIFY | Το Telos ως ζεύγος (επιδιώξεις, διάταξη στις αντιφάσεις)· falsifier για το TEL-08 (MFA-ATK-01) | 1 | APPLIED (2026-09-16) | MFA-PATCH-0001-R |
| MFA-PATCH-0002 | ADD | Προσθήκη MFA-ALT-7 (weights-only continual learner) — η εναλλακτική που είχε αποκλειστεί a priori (MFA-ATK-02) | 1 | APPLIED (2026-09-16) | MFA-PATCH-0002-R |
| MFA-PATCH-0003 | MODIFY | ELM-024 REPLACE→MERGE (CompetenceProfile + SPL, cold start ως Unknown)· ELM-088 REPLACE→SPLIT (SysON ως Tier-1 verifier προβολών) (MFA-ATK-03) | 4 | APPLIED (2026-09-16) | MFA-PATCH-0003-R |
| MFA-PATCH-0004 | MODIFY | AFP δίπλευρος νόμος κ_min ≤ κ < 1/λ_max· αρνητικά anchors στο SLM/GCP· αποφασίσιμο τμήμα CPEG (MFA-ATK-04) | 10 | APPLIED (2026-09-16) | MFA-PATCH-0004-R |
| MFA-PATCH-0005 | MODIFY | Κλάση επίδρασης Disclose + DisclosureGrant· TED προεπιλογή D2 για LLM· Genesis plane = trust boundary· N-version ως audit sampling στο DP-1 (MFA-ATK-05) | 11 | APPLIED (2026-09-16) | MFA-PATCH-0005-R |
| MFA-PATCH-0006 | MODIFY | ELM-081 RETAIN→STRENGTHEN (commitment-aware retrieval)· ELM-087 RETAIN→STRENGTHEN (αποφάσεις δειγματοληψίας ως δεσμεύσεις) (MFA-ATK-06) | 4 | APPLIED (2026-09-16) | MFA-PATCH-0006-R |
| MFA-PATCH-0007 | MODIFY | 10 άξονες κατάστασης ανά δέσμευση· 5 χρόνοι/2 ιστορίες· 10 τύποι μνήμης + 4 μηχανισμοί λήθης· 10 ονομασμένοι governors· 6 βαθμίδες owner perimeter (MFA-ATK-07) | 11 | APPLIED (2026-09-16) | MFA-PATCH-0007-R |
| MFA-PATCH-0008 | ADD | MFA-CFL-035 ολότητα προέλευσης vs διαγραφή (residue commitment)· ledger μονότονο, DPO = σημασιολογία κανόνων· κωδικοποίηση στο epoch allowlist· VO για MFA-INV-066 (MFA-ATK-08) | 10 | APPLIED (2026-09-16) | MFA-PATCH-0008-R |
| MFA-PATCH-0009 | ADD | AutonomyEnvelope για μη αναστρέψιμες πράξεις (κλάση IRREVERSIBLE-PREAUTHORIZED)· MFA-INV-067· προεπιλεγμένο ORDER του LPA· προτιμήσεις = παρατηρήσεις· k-of-n δηλωμένοι (MFA-ATK-09) | 12 | APPLIED (2026-09-16) | MFA-PATCH-0009-R |
| MFA-PATCH-0010 | ADD | MFA-MECH-019 Proposal Distribution Evolution (PDE)· ablation obligation ανά στοιχείο γνωσιακού πυρήνα· ρήτρα TEL-05· MFA-RSP-016 (MFA-ATK-10) | 11 | APPLIED (2026-09-16) | MFA-PATCH-0010-R |
| MFA-PATCH-0011 | ADD | Ταυτότητα F-επιπέδων συμπεριφορική (fidelity-gap δεσμεύσεις)· MFA-ELM-098 Environment Model (World Twin)· F-επίπεδο ως διάνυσμα ανά όργανο/δρώντα (MFA-ATK-11) | 9 | APPLIED (2026-09-16) | MFA-PATCH-0011-R |
| MFA-PATCH-0012 | ADD | MFA-INV-059 από ταυτότητα σε Galois connection (πιστότητα υπό zoom)· εντολές cockpit = προτάσεις RET· MFA-VO-056 διακριτική ισχύς cockpit· omitted_count στις εξηγήσεις (MFA-ATK-12) | 7 | APPLIED (2026-09-16) | MFA-PATCH-0012-R |
| MFA-PATCH-0013 | MODIFY | HELD_OUT σε ξεχωριστή φυσική συσκευή ή προαγωγές EIM-UNVERIFIED· MFA-INV-065 με αριθμό ανά προφίλ· OAP με ενέργεια· σχήμα Πολιτισμών ανά προφίλ (MFA-ATK-13) | 8 | APPLIED (2026-09-16) | MFA-PATCH-0013-R |
| MFA-PATCH-0014 | MODIFY | PATCH-PROTOCOL §7: δομημένα πεδία, υπογραφές, συγχρονία, εργαλείο· ELM-090 F0/F2+ (MFA-ATK-14) | 3 | APPLIED (2026-09-16) | MFA-PATCH-0014-R |
| MFA-PATCH-0015 | MODIFY | Δόση 0 = «ο copilot που δίνει receipts» (CC-lite 4 κανόνων, verifier σκέλη 1–3, emission barrier)· σειρά γένεσης· πύλη δόσης = KT (MFA-ATK-15) | 7 | APPLIED (2026-09-16) | MFA-PATCH-0015-R |
| MFA-PATCH-0016 | ADD | MFA-INV-068 παγωμένος Tier-0 kernel· SPLIT MFA-ELM-020 → 020 (Suite) + MFA-ELM-099 (Tier-0 Kernel)· δύο όψεις της πύλης (advisory/effective)· EIM μετρά εξάρτηση oracle από ετυμηγορίες (MFA-ATK-16) | 12 | APPLIED (2026-09-16) | MFA-PATCH-0016-R |
| MFA-PATCH-0017 | MODIFY | Ο ανταγωνιστής (ALT-6/7) ως baseline μέσα στο harness· MFA-VO-015 τρίτο σκέλος· lean profile πρώτο (MFA-ATK-17) | 4 | APPLIED (2026-09-16) | MFA-PATCH-0017-R |
| MFA-PATCH-0018 | MODIFY | Pass I κύκλος 1: envelope pre-simulation στο World Twin (σύνθεση ATK-09 × ATK-11)· κρυφός άξονας time_to_correction· MFA-INV-068 ↔ MFA-VO-053 | 14 | APPLIED (2026-09-16) | MFA-PATCH-0018-R |
| MFA-PATCH-0019 | MODIFY | Συμπληρώσεις από το Capability Conservation Ledger: 12 typed σφάλματα με υποχρεωτική συμπεριφορά· πιστότητα αρχείου στο drafting· κλάσεις απομόνωσης στον Organ Host· delta διορθώσεις (004, 025, 049 → STRENGTHEN· CON-032 → SPLIT) | 8 | APPLIED (2026-09-16) | MFA-PATCH-0019-R |
| projection sync 0.3.0 | — | diagrams/MFA-DIA-16.mmd: πλήθη 68/56/99 και «32 νέες VO» ευθυγραμμισμένα με τις έδρες (PATCH-PROTOCOL §6)· ξαναεπικυρώθηκε με το Mermaid plugin μαζί με το MFA-DIA-14 | 1 | APPLIED (2026-09-16) | — |
| MFA-PATCH-0000 | ADD | Γένεση του πακέτου (Pass A–F, 2026-09-16) | όλα | APPLIED | — |

## Εκδόσεις

| package_version | Τι | Πότε |
|---|---|---|
| 0.1.0 | Γένεση: Pass A–F (OBJECTIVE-SPACE, CAPABILITY-LATTICE, 6 ALT, 18 MECH, 97 ELM, 46 CON, 66 INV, 55 VO, 34 UNK, 34 CFL, 15 RSP, 17 DIA) | 2026-09-16 |
| 0.2.0 | Pass G+H: 17 επιθέσεις, MFA-PATCH-0001…0017 (ALT-7, MECH-019, ELM-098/099, INV-067/068, VO-056, CFL-035, RSP-016) | 2026-09-16 |
| 0.3.0 | Pass I: κύκλος 1 (MFA-PATCH-0018)· κύκλοι 2–3 χωρίς νέα λύση → σταθερό σημείο· MFA-PATCH-0019 (ledger completions)· DECISION-LOG, ledgers, TECHNICAL-ARCHITECTURE, ROADMAP, README | 2026-09-16 |

Semver: MINOR για ADD/SPLIT/MERGE (0.1→0.2→0.3)· κανένα SUPERSEDE/DEPRECATE στοιχείου με status APPROVED (τίποτα δεν είναι APPROVED) → κανένα MAJOR.
