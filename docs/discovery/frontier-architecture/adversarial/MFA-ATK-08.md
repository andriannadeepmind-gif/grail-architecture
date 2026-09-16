---
id: MFA-ATK-08
pass: G
attack: "8. Attack the canonical substrate"
method: "Devil's Advocate plugin → NO_SUBSCRIPTION· επίθεση από τον συντάκτη με το format της εντολής §17."
targets:
  elements: [MFA-ELM-001, MFA-ELM-002, MFA-ELM-004, MFA-ELM-005, MFA-ELM-079, MFA-ELM-083, MFA-ELM-088, MFA-ELM-035, MFA-ELM-041]
  mechanisms: [MFA-MECH-001, MFA-MECH-014]
  contracts: [MFA-CON-033, MFA-CON-001, MFA-CON-002]
  invariants: [MFA-INV-006, MFA-INV-011, MFA-INV-018, MFA-INV-022, MFA-INV-039, MFA-INV-041, MFA-INV-054, MFA-INV-061]
  capabilities: [MFA-CAP-003, MFA-CAP-007, MFA-CAP-057, MFA-CAP-037]
verdict: "UPHELD για (β) σύγκρουση INV-006/018 vs INV-011 (νέα MFA-CFL-035) και (γ) DPO = σημασιολογία κανόνων όχι ledger· REJECTED για (α) με διόρθωση: canonical encoding ως παράμετρος epoch"
modification: [MFA-PATCH-0008]
residual_risk: "Τα residue commitments διαρρέουν metadata (σχήμα, πλήθος εξαρτώμενων)· αποδεκτό ανά confidentiality domain — απόφαση δημιουργού."
---

# MFA-ATK-08 · Επίθεση στο κανονικό υπόστρωμα (Commitment Calculus πάνω σε αναστρέψιμο υπεργράφημα)

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

MFA-ELM-001 (Commitment Store), 002 (CAS), 004, 005 (Crypto Epoch & Allowlist), 079, 083, 088 · MFA-MECH-001 (CC: 8 κανόνες ASSERT/OBSERVE/DERIVE/DELEGATE/CONTEST/RESOLVE/REVOKE/FORGET), MFA-MECH-014 (SLM) · MFA-INV-006/011/018/022/039/041/054/061 · MFA-CON-033.

## Ισχυρότερη ένσταση

**(α) «Έδρα ανεξάρτητη σειριοποίησης» αντιφάσκει με το content addressing.** Ένα hash **είναι** σειριοποίηση (JCS + digest). Το content addressing δένει την έδρα σε **μία** κωδικοποίηση bytes για πάντα· η επαναγκύρωση epoch (MFA-INV-039) καλύπτει τη συνάρτηση hash, όχι την κωδικοποίηση.

**(β) FORGET σε append-only Merkle log = crypto-shredding.** Οι αποδείξεις inclusion για shredded φύλλα επαληθεύονται δομικά αλλά το περιεχόμενο έχει φύγει → η **ολότητα προέλευσης** (MFA-INV-006) παραβιάζεται **από τον σχεδιασμό** κάθε φορά που τρέχει FORGET· η διάδοση taint (MFA-INV-018) μέσα από shredded κόμβο είναι αδύνατη. Το πακέτο έχει δύο invariants που αντιφάσκουν (006/018 vs 011) και **καμία** MFA-CFL για αυτό.

**(γ) «Διτεμπορικό υπεργράφημα με DPO rewriting».** Το DPO απαιτεί dangling condition: απαγορεύεται διαγραφή κόμβου με ακμές. Το REVOKE «διαγράφει» ακμές εξουσίας· αν μοντελοποιείται ως tombstone, το γράφημα είναι **μονότονο** και το «DPO rewriting» είναι διακόσμηση (ornamental sophistication).

## Αντιπαράδειγμα

(β) Διαγραφή GDPR (MFA-VO-016) προσωπικών δεδομένων πελάτη που είναι **είσοδος** ετυμηγορίας Court: shred το φύλλο → η απόδειξη της ετυμηγορίας αναφέρει hash χωρίς preimage → η ετυμηγορία **δεν μπορεί ποτέ να επαναεπαληθευτεί** → MFA-INV-022 («ετυμηγορία μόνο με διαδικασία») ισχύει ιστορικά αλλά είναι μη επαληθεύσιμο· η αντίστροφη διάσχιση taint (MFA-VO-006) μέσα από τον κόμβο επιστρέφει Unknown χωρίς λόγο. Η σύγκρουση είναι αμοντελοποίητη.

(γ) REVOKE(token t): στο ledger προστίθεται δέσμευση REVOKE με στόχο t· το t **παραμένει**· κάθε έλεγχος εξουσίας διαβάζει «t ∧ ¬revoked(t)». Κανένα DPO. Το ίδιο για FORGET (tombstone + shred). Το ledger είναι μονότονο σύνολο δεσμεύσεων με παράγωγο «τρέχον» γράφημα.

(α) Αντιπαράδειγμα **δεν** βρέθηκε: η επαναγκύρωση epoch (MFA-ELM-005) μπορεί να περιλάβει την κωδικοποίηση αν το allowlist την ονομάζει· σήμερα δεν την ονομάζει.

## Επηρεαζόμενες ικανότητες

MFA-CAP-003, MFA-CAP-007 (προέλευση vs διαγραφή), MFA-CAP-057 (διαγραφή με διατήρηση δεσμεύσεων — υπόσχεται ακριβώς αυτό που η (β) λέει ότι δεν ορίζεται), MFA-CAP-037.

## Ετυμηγορία

- (α) **REJECTED με διόρθωση**: η έδρα είναι η **άλγεβρα δεσμεύσεων**· η κανονική κωδικοποίηση είναι παράμετρος epoch· το allowlist (MFA-ELM-005, MFA-INV-038) πρέπει να απαριθμεί **και** κωδικοποιήσεις, ώστε η αλλαγή κωδικοποίησης να είναι epoch re-anchor (MFA-INV-039), όχι ρήξη.
- (β) **UPHELD** — πραγματική, αμοντελοποίητη σύγκρουση invariants.
- (γ) **UPHELD** — το ledger είναι μονότονο· το DPO είναι η σημασιολογία **επανεγγραφής συνόλων κανόνων** (Forge, CPEG, ORP) και όχι του ledger· πρέπει να ειπωθεί, αλλιώς είναι διακόσμηση.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0008:
1. **Νέα MFA-CFL-035 «Ολότητα προέλευσης vs διαγραφή»**, side_a: MFA-INV-006/018 (ολότητα, διάδοση), side_b: MFA-INV-011 + MFA-VO-016 (διαγραφή με shredding). **Resolution shape**: το shredded φύλλο αφήνει **residue commitment** ⟨hash, schema, evidence_class, dependents_count, erasure_act_receipt⟩· η διάδοση taint αντιμετωπίζει το residue ως **TAINT-UNKNOWN** και αναγκάζει τους εξαρτώμενους σε CONTESTED· ετυμηγορίες με shredded εισόδους σημαίνονται `re_verifiable: false` (τιμή του άξονα `formal_validity` — MFA-ATK-07 §2). **MFA-INV-006 επαναδιατυπώνεται**: «ολότητα **γενεαλογίας** (lineage), όχι περιεχομένου». Resolution condition: MFA-VO-016 + MFA-VO-006 τρέχουν **μαζί** (shred → taint reversal → 100 % εξαρτώμενων CONTESTED εντός Δ).
2. **MFA-MECH-001 / MFA-ELM-001 / MFA-INV-041**: «το ledger είναι μονότονο (append-only, tombstones για REVOKE/FORGET)· το τρέχον γράφημα είναι παράγωγο fold· το DPO είναι η σημασιολογία επανεγγραφής **κανόνων** στο Forge/ORP/CPEG (MFA-MECH-017) — ποτέ του ledger». Το statement του ELM-001 αλλάζει αντίστοιχα· η ALT-5 «αναστρέψιμο υπεργράφημα» παραμένει ως **η σημασιολογία των κανόνων**, όχι της αποθήκης.
3. **MFA-ELM-005**: το allowlist ανά epoch απαριθμεί hash, υπογραφή, KEM **και canonical encoding** (JCS-class)· επαναγκύρωση καλύπτει και κωδικοποίηση.

## Υπολειπόμενος κίνδυνος

Τα residue commitments διαρρέουν metadata (σχήμα, πλήθος εξαρτώμενων, κλάση τεκμηρίου) — για GDPR αυτό είναι συνήθως αποδεκτό (pseudonymised structural data), αλλά είναι **απόφαση δημιουργού ανά confidentiality domain** (MFA-DEC-009) και ελέγχεται στο EXP-19 (crypto-shredding adequacy). Το `re_verifiable: false` σε ετυμηγορία είναι μόνιμη απώλεια επαληθευσιμότητας — σωστά ονομασμένη, όχι κρυμμένη.
