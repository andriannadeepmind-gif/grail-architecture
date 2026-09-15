# Ασφάλεια / κρυπτογραφία — αποφάσεις (λεπτομέρειες)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## DEC-SEC-01 · Αρχιτεκτονική άμυνας prompt injection: planner που δεν βλέπει ποτέ OBSERVED περιεχόμενο (CaMeL/FIDES) ή provenance-tagged κανάλια με επιβολή στο gateway (πρόχειρο);

**Πρόταση:** CaMeL/FIDES-class planner με IFC labels και πολιτική στο KRN-11 για κάθε ροή που καταλήγει σε εξωτερική επίδραση. Rule of Two ως κανόνας σύνθεσης στο INV-C07. Το κόστος utility μετράται σε πείραμα πριν τη δέσμευση.

- **CaMeL/FIDES-class (IFC + quarantined parsing)** — υπέρ: Δομική εγγύηση για τις ροές που επιβάλλει· τυπικό μοντέλο (FIDES)· δεν στηρίζεται σε πιθανοτική συμπεριφορά του μοντέλου · κατά: Απώλεια utility (77% έναντι 84% στο AgentDojo)· πιο σύνθετος planner· utility σε νομικές ροές άγνωστη
- **Πρόχειρο: provenance tags + gateway** — υπέρ: Απλούστερο· ήδη στο πρόχειρο · κατά: Ο LLM planner επηρεάζεται από το περιεχόμενο· οι πιθανοτικές άμυνες παρακάμπτονται από adaptive attacks
- **Υβριδικό ανά κλάση κινδύνου (Rule of Two)** — υπέρ: Αυστηρό μόνο όπου συνυπάρχουν [A], [B] και [C] · κατά: Απαιτεί σωστή ταξινόμηση συνεδριών· περισσότερες εγκρίσεις Principal

**Γιατί:** Η INV-S01 είναι Tier 1 και το KT-17 δεν περνά αξιόπιστα με πιθανοτικές άμυνες. Μόνο system-level σχεδιάσεις δίνουν αποδείξιμη ιδιότητα.

**Επηρεάζει:** INV-S01, REQ-SEC-001, KT-17, INV-C07, CMP-KRN-11, CMP-COG-02, ICD-08

## DEC-SEC-02 · Μοντέλο ταυτότητας/κλειδιών: σημασιολογία KERI (KEL, pre-rotation, witnesses) ή το σχήμα του προχείρου (threshold root + time-locked recovery);

**Πρόταση:** Υιοθέτηση της σημασιολογίας KERI (pre-rotation, witnessed key events, delegated identifiers) μέσα στο ICD-03, με υλοποίηση πάνω στο ledger του GRAIL και όχι κατ' ανάγκη το KERI wire format. Προϋπόθεση: ευθυγράμμιση με KEY-LIFECYCLE/TRUST-BOOTSTRAP από τον δημιουργό.

- **Σημασιολογία KERI στο ICD-03** — υπέρ: Κρυπτογραφική ανάκτηση root· duplicity evidence· ταιριάζει σε delegate/rotate/revoke· μία έδρα ταυτότητας (ledger) · κατά: Νέα έννοια προς δήλωση· πρέπει να ευθυγραμμιστεί με τις μη διαθέσιμες KEY-LIFECYCLE/TRUST-BOOTSTRAP
- **Πλήρες KERI stack (υπάρχουσες υλοποιήσεις)** — υπέρ: Έτοιμο πρωτόκολλο και εργαλεία · κατά: Δεύτερη έδρα ταυτότητας δίπλα στο ledger· ωριμότητα και PQ σουίτες των υλοποιήσεων άγνωστες
- **Πρόχειρο: threshold + time-lock** — υπέρ: Απλό· συμβατό με HSM· το T_cool υπάρχει ήδη για Tier-0 αναθεωρήσεις · κατά: Αγώνας ανάκτησης με τον επιτιθέμενο· PQ threshold μη τυποποιημένο

**Γιατί:** Το KT-23 αφορά Tier 0 (INV-C05). Η pre-rotation λύνει κρυπτογραφικά το πρόβλημα, χωρίς να στηρίζεται μόνο σε διαδικαστικά κανάλια.

**Επηρεάζει:** CMP-KRN-03, ICD-03, KT-23, KT-18, REQ-SEC-005, INV-C05, INV-I04

## DEC-SEC-03 · Κατασκευή root υπό PQ και KL-7: k-of-n multisignature, threshold signature ή μονό κλειδί HSM με pre-rotation; Και το M-of-N του Z0 αφορά πρόσωπα ή μόνο συσκευές του δημιουργού;

**Πρόταση:** k-of-n ανεξάρτητες PQ υπογραφές σε συσκευές/HSM του δημιουργού (TUF-style, συμβατό με KL-7) μαζί με pre-rotation. Το «M-of-N» του Z0 να οριστεί ρητά ως συσκευές ενός προσώπου.

- **k-of-n multisignature (PQ)** — υπέρ: Υλοποιήσιμο σήμερα με ML-DSA/SLH-DSA· διαφανές· δοκιμασμένο στο TUF · κατά: Μεγαλύτερες υπογραφές· ο verifier ελέγχει k υπογραφές
- **Threshold signature (FROST)** — υπέρ: Μία συμπαγής υπογραφή · κατά: Όχι PQ (discrete log)· trusted dealer ή DKG· αντίθετο με το PQ plan
- **Μονό HSM κλειδί + pre-rotation** — υπέρ: Απλούστερο · κατά: Ένα σημείο αστοχίας για διαθεσιμότητα

**Γιατί:** Το PQ threshold δεν είναι τυποποιημένο (NIST MPTS σε previews το 2026)· το EP-04 περιορίζει τα threshold σχήματα σε συσκευές του κυρίαρχου.

**Επηρεάζει:** CMP-KRN-03, EP-04, KT-23, ICD-03

## DEC-SEC-04 · Μορφή υπογραφών στη μεταβατική περίοδο και σουίτα root: composite ML-DSA, ανεξάρτητες διπλές υπογραφές ή PQ-only· για το root SLH-DSA, ML-DSA-87 ή stateful LMS/XMSS;

**Πρόταση:** Composite ML-DSA για ζεύγη PQ/traditional στη μεταβατική περίοδο. Για το owner root SLH-DSA (υπόθεση μόνο hash) ή ML-DSA-87 σε composite, με απόφαση βάσει δεδομένων του EXP-11.

- **Composite ML-DSA** — υπέρ: Weak non-separability· ένα alg id (INV-X01)· τυποποίηση IETF σε τελικό στάδιο · κατά: Όχι ακόμη RFC· δεν καλύπτει ML-DSA+SLH-DSA
- **Ανεξάρτητες διπλές υπογραφές** — υπέρ: Ευέλικτο ζευγάρωμα (και PQ+PQ)· αποδεκτό κατά IR 8547 αν ≥1 approved · κατά: Stripping αν δεν δεθούν με domain separation
- **PQ-only (ML-DSA ή SLH-DSA μόνο)** — υπέρ: Απλούστερο· μικρότερο κόστος από διπλές υπογραφές · κατά: Καμία αντιστάθμιση αν αποδειχθεί αδυναμία στον PQ αλγόριθμο ή στην υλοποίηση
- **Stateful LMS/XMSS για root** — υπέρ: Συντηρητικό (μόνο hash)· υποστηρίζεται στο PKCS#11 3.2 (HSS, XMSS) · κατά: Διαχείριση state· κίνδυνος επαναχρησιμοποίησης OTS κλειδιού

**Γιατί:** Επηρεάζει το μέγεθος του ledger, το ERS και την ταυτότητα· η επιλογή δεν αντιστρέφεται φθηνά μετά τη δόση 1.

**Επηρεάζει:** ADR-0016, INV-X01, INV-X02, EXP-11, EP-04, KT-09

## DEC-SEC-05 · Αρχιτεκτονική διαγραφής: τι μπαίνει στο ledger (hash, keyed hash ή perfectly hiding commitment), σε τι υπολογίζεται το cid, πού ζει το ciphertext και πώς αντιμετωπίζεται το hash-tree renewal για τα διαγραμμένα;

**Πρόταση:** Perfectly hiding commitments στο ledger· cid στο ciphertext· ciphertext μόνο AES-256 με κλειδιά σε HSM, όχι σε μόνιμο cold archive· για τα διαγραμμένα dual-hash commitments ή ρητή κατάσταση «erased, non-renewable». Νομική επικύρωση μέσω EXP-19.

- **Hiding commitments + cid στο ciphertext + dual-hash** — υπέρ: Ευθυγράμμιση με CNIL (ρητή σειρά) και EDPB· καμία linkability· renewal χωρίς τα αρχικά · κατά: Πολυπλοκότητα CAS· αποθήκευση witness
- **Πρόχειρο: δεσμεύσεις αδιευκρίνιστου τύπου + crypto-shredding** — υπέρ: Απλό· συμβατό με την §9.8 · κατά: Αν τα hashes είναι unsalted σε plaintext, ανεπαρκή κατά EDPB (για δημόσιο blockchain, κατ' αναλογία εδώ)· σύγκρουση με RFC 4998
- **Καθόλου προσωπικά δεδομένα στο ledger/CAS (εξωτερική αποθήκη με πραγματική διαγραφή)** — υπέρ: Καθαρότερη συμμόρφωση · κατά: Μειώνει τις εγγυήσεις provenance (INV-C06) για αυτά τα δεδομένα

**Γιατί:** Συνδέει Tier 0 και Tier 1 σημεία (INV-I03, INV-X02, INV-C06) με νομική υποχρέωση· χρειάζεται έγκριση πριν το μοντέλο του ICD-02.

**Επηρεάζει:** ADR-0018, KT-16, INV-X02, ICD-02, CMP-KRN-02, INV-I03

## DEC-SEC-06 · Όριο supply chain για το kernel TCB: full-source bootstrap + reproducible + multi-party signing, ή Nix + δύο builders (πρόχειρο), ή μόνο SLSA Build L3;

**Πρόταση:** Full-source bootstrapped, reproducible, k-of-n signed builds για το kernel plane (R-C)· Nix/Docker για τα υπόλοιπα, με αναπαραγωγιμότητα ελεγμένη ανά artifact· διανομή μέσω TUF.

- **Bootstrappable (stagex/Guix-class) για το TCB** — υπέρ: Περιορίζει δραστικά το common-mode trusting-trust· Rust bootstrappable μέσω mrustc (Guix) · κατά: Κόστος χρόνου build· υπόλοιπο εμπιστοσύνης (Guile driver στο Guix)· κάλυψη σύγχρονου Rust στο stagex ανεπιβεβαίωτη
- **Πρόχειρο: Nix + δύο builders** — υπέρ: Ήδη στο σχέδιο (ADR-0029)· ελέγχει την αναπαραγωγιμότητα ανά build · κατά: Κοινό binary seed: δύο builders μπορεί να συμφωνούν σε μολυσμένο αποτέλεσμα
- **SLSA Build L3 μόνο** — υπέρ: Ευρεία υιοθέτηση · κατά: Δεν απαιτεί reproducibility· ασθενέστερο από την INV-S03

**Γιατί:** Το kernel είναι R-C (0 διαφωνίες, έγκριση δημιουργού)· η ακεραιότητα του build είναι προϋπόθεση για όλα τα invariants.

**Επηρεάζει:** INV-S03, CMP-OPS-01, REQ-SEC-002, ADR-0029
