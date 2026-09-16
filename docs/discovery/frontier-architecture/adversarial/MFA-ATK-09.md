---
id: MFA-ATK-09
pass: G
attack: "9. Attack autonomy and governance"
method: "Devil's Advocate plugin → NO_SUBSCRIPTION· επίθεση από τον συντάκτη με το format της εντολής §17."
targets:
  elements: [MFA-ELM-029, MFA-ELM-010, MFA-ELM-008, MFA-ELM-007, MFA-ELM-015, MFA-ELM-016, MFA-ELM-040, MFA-ELM-051, MFA-ELM-052, MFA-ELM-053, MFA-ELM-054, MFA-ELM-057, MFA-ELM-006, MFA-ELM-009, MFA-ELM-026, MFA-ELM-066, MFA-ELM-067]
  mechanisms: [MFA-MECH-004, MFA-MECH-005, MFA-MECH-006]
  invariants: [MFA-INV-005, MFA-INV-008, MFA-INV-042, MFA-INV-043, MFA-INV-044, MFA-INV-045, MFA-INV-053, MFA-INV-057, MFA-INV-058]
  conflicts: [MFA-CFL-001, MFA-CFL-017, MFA-CFL-005]
  capabilities: [MFA-CAP-006, MFA-CAP-018, MFA-CAP-049, MFA-CAP-052, MFA-CAP-058, MFA-CAP-030]
verdict: "UPHELD (α) κενό: μη αναστρέψιμες πράξεις χρειάζονται προ-εξουσιοδοτημένα AutonomyEnvelopes· UPHELD (γ) ORDER πρέπει να είναι δέσμευση με προεπιλογή· REJECTED (β) k-of-n = δηλωμένοι από τον δημιουργό· REJECTED (δ) προτιμήσεις = παρατηρήσεις, οι πολιτικές λήγουν"
modification: [MFA-PATCH-0009]
residual_risk: "Το envelope είναι το σημείο όπου σφάλμα δημιουργού γίνεται πράξη συστήματος· max_exposure + Court fast-track· η απόφαση στην υπογραφή (MFA-DEC-004)."
---

# MFA-ATK-09 · Επίθεση στην αυτονομία και τη διακυβέρνηση

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Στόχοι (target IDs)

MFA-ELM-029 (TEGF), 010 (RET), 008 (LPA gate), 007 (PDP), 015 (MetaBounds), 016 (Safe-Halt), 040 (Preference Recorder Α-20), 051 (Constitution), 052/053/054 (lifecycle, genesis, institutions), 057 (import gate), 006, 009, 026 (Action Executor), 066 (Professional Responsibility), 067 (Docket) · MFA-INV-042/043/044/045/053/057/058 · MFA-CFL-001/017/005.

## Ισχυρότερη ένσταση

**(α) Αυτονομία πάνω στο τίποτα.** «Inverse staged before act· NONE ⇒ H1» (MFA-INV-043/044) σημαίνει ότι αυτονομία υπάρχει **μόνο** για αναστρέψιμες πράξεις. Όλες οι **πολύτιμες** πράξεις στο δίκαιο (κατάθεση, αποστολή, γνωμοδότηση προς πελάτη) είναι μη αναστρέψιμες → ο TEGF είναι γεννήτρια στόχων για εσωτερικές προσομοιώσεις. Η «δυναμική ασύγχρονη αυτονομία» που ζήτησε ο δημιουργός είναι ασύγχρονη **ακριβώς** για μη αναστρέψιμες πράξεις.

**(β) Safe-Halt k-of-n όταν ο δημιουργός λείπει** (MFA-CFL-017): ποιος κρατά τα n κλειδιά; Αν μόνο ο δημιουργός, k-of-n = 1-of-1. Αν άλλοι, η κυριαρχία (MFA-INV-005) μοιράζεται.

**(γ) LPA χωρίς ORDER** (MFA-DEC-005 ανοιχτή): η πύλη δεν έχει ολική διάταξη → μη ντετερμινιστικές ετυμηγορίες μεταξύ governors → η αναπαραγωγή (MFA-INV-008) αποτυγχάνει εκτός αν η διάταξη είναι δέσμευση.

**(δ) Preference Recorder** καταγράφει προτιμήσεις δημιουργού ως *πολιτική*· MFA-INV-053 «policy bounds expire» → οι προτιμήσεις λήγουν → το σύστημα επιστρέφει περιοδικά σε «καμία προτίμηση» και ο δημιουργός ξαναϋπογράφει για πάντα.

## Αντιπαράδειγμα

(α) Προθεσμία κατάθεσης 23:50, δημιουργός απρόσιτος. RET class = NONE → H1 → η πράξη δεν γίνεται → η προθεσμία χάνεται → το σύστημα που χτίστηκε για νομική πράξη δεν μπορεί να κάνει **το ένα πράγμα** που θα έκανε ένας ασκούμενος. Ο MFA-ELM-067 (Docket) το ήξερε από την προηγούμενη εβδομάδα.

(γ) Δύο governors (Legal/Deontic, Resource) ασκούν veto σε διαφορετικούς υποψηφίους· χωρίς ORDER, το περικομμένο σύνολο εξαρτάται από τη σειρά επανάληψης ενός hash map → δύο replays, δύο ετυμηγορίες → MFA-VO-027 αποτυγχάνει.

(β) και (δ): αντιπαράδειγμα **δεν** στέκει — βλ. ετυμηγορία.

## Επηρεαζόμενες ικανότητες

MFA-CAP-006 (δυναμική ασύγχρονη αυτονομία — κενή για μη αναστρέψιμα), MFA-CAP-018, MFA-CAP-049 (LPA μη ντετερμινιστικός), MFA-CAP-052, MFA-CAP-058, MFA-CAP-030.

## Ετυμηγορία

- (α) **UPHELD ως κενό**: χρειάζονται **προ-εξουσιοδοτημένα envelopes** για μη αναστρέψιμες πράξεις — το AutonomyGrant του TEGF υπάρχει αλλά ορίζεται μόνο για αναστρέψιμες.
- (β) **REJECTED με διευκρίνιση**: οι n κάτοχοι είναι **δηλωμένοι από τον δημιουργό** εκπρόσωποι, εγγεγραμμένοι ως L3 πολιτική· η κυριαρχία διατηρείται (ο δημιουργός τους επέλεξε και τους ανακαλεί)· η διάταξη k, n = MFA-DEC-012.
- (γ) **UPHELD**: το ORDER πρέπει να είναι δέσμευση με προεπιλογή.
- (δ) **REJECTED με διευκρίνιση**: οι προτιμήσεις είναι **παρατηρήσεις** (append-only, δεν λήγουν)· οι **πολιτικές που παράγονται** από αυτές λήγουν (MFA-INV-053)· το MFA-ELM-040 πρέπει να το λέει.

## Αρχιτεκτονική τροποποίηση

MFA-PATCH-0009:
1. **RET (MFA-ELM-010 / MFA-MECH-006): νέα κλάση `IRREVERSIBLE-PREAUTHORIZED`.** Ο Principal (ή ο δημιουργός) υπογράφει **εκ των προτέρων** ένα `AutonomyEnvelope⟨matter, effect_class, window, max_exposure, conditions, counter_signer, expiry⟩`. Η πράξη εκτελείται με H1 **ικανοποιημένο από το envelope**· το **envelope** είναι το αναστρέψιμο αντικείμενο (ανακαλείται μέχρι την πράξη)· η πράξη παραμένει μη αναστρέψιμη και σημαίνεται έτσι (MFA-INV-044 αμετάβλητο). `counter_signer` ∈ {δεύτερο σώμα με ανεξάρτητο κλειδί, Court fast-track με φραγμένο χρόνο}. Οι **6 βαθμίδες owner perimeter** (MATERIAL §2 #14) γίνονται τα επίπεδα του envelope: Think / Prepare / Recommend / Execute-bounded / Execute-consequential / Emergency-stop.
2. **Νέο MFA-INV-067 «Καμία μη αναστρέψιμη πράξη χωρίς ζωντανό envelope ή φρέσκο H1»**· MFA-VO-032 (RET rollback drill) επεκτείνεται: drill «λήξη envelope στη μέση της πράξης» και «ανάκληση envelope μετά το staging».
3. **LPA (MFA-MECH-005 / MFA-ELM-008): default ORDER = Tier order** (Tier-0 vetoes πριν από Tier-1 πριν από Tier-2)· **εντός tier** η σειρά εγγραφής του governor στο ledger (ντετερμινιστική)· ονομαστικά για τους 10 governors (MFA-ATK-07 §5): Tier-0: Truth, Legal/Deontic, Identity, Commitment· Tier-1: Owner-intent, Resource· Tier-2: Value, Regret, Curiosity, Empowerment. Το ORDER είναι **L2 δέσμευση** → replay ακριβές· ο δημιουργός το αλλάζει με patch (MFA-DEC-005).
4. **MFA-ELM-040**: «προτιμήσεις = Observations (δεν λήγουν)· πολιτικές που παράγονται από αυτές = MetaBound POLICY (λήγουν, MFA-ELM-015)».
5. **MFA-ELM-016**: «κάτοχοι k-of-n = δηλωμένοι από τον δημιουργό, L3 πολιτική, ανακλητοί».

## Υπολειπόμενος κίνδυνος

Το envelope είναι το σημείο όπου **σφάλμα του δημιουργού γίνεται πράξη του συστήματος** — μετριάζεται από `max_exposure` (ποσοτικό φράγμα), `counter_signer` και το Court fast-track, όχι εξαλείφεται. Η «κατάθεση 23:50» γίνεται δυνατή **μόνο** αν υπάρχει envelope — δηλαδή ο δημιουργός αποφασίζει στην υπογραφή, όχι στην κρίση (MFA-DEC-004). Το default ORDER είναι πρόταση· η αλλαγή του είναι μία patch.
