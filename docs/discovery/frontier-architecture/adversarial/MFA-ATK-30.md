---
id: MFA-ATK-30
pass: "Architecture Closure 0.4.2"
attack: "Structural Closure Laundering: ένα πλήρες-looking γράφημα δηλώνει closure ενώ έχει orphan requirement, ambient input, dropped obligation, proposal-authority collapse, partial capsule, scope escalation ή capability deletion υπό resource pressure."
method: "Δέκα ανεξάρτητες design mutations πάνω στις κανονικές έδρες· καθεμία πρέπει να έχει ονομασμένο detector, typed non-success verdict και ανεξάρτητο F1 negative fixture πριν από οποιαδήποτε αναβάθμιση closure."
targets:
  elements: [MFA-ELM-008, MFA-ELM-010, MFA-ELM-088, MFA-ELM-097, MFA-ELM-122, MFA-ELM-126, MFA-ELM-127]
  verification: [MFA-VO-092, MFA-VO-097, MFA-VO-099, MFA-VO-102, MFA-VO-105, MFA-VO-106]
  capabilities: [MFA-CAP-109]
verdict: "Η επίθεση νίκησε την προ-0.4.2 αναπαράσταση: κατάλογος στοιχείων χωρίς mission closure, 114 requirements εκτός canonical join, implicit control flow, underspecified capsules και ασαφής διάκριση proposal/Effect. Τα MFA-PATCH-0068…0071 κλείνουν τα αντίστοιχα design gaps. Η επίθεση δεν θεωρείται ηττημένη επιχειρησιακά: οι negative fixtures και οι liveness/type/obligation/authority checks δεν έχουν εκτελεστεί, άρα το cut παραμένει OPEN."
modification: [MFA-PATCH-0068, MFA-PATCH-0069, MFA-PATCH-0070, MFA-PATCH-0071, MFA-PATCH-0072]
residual_risk: "Ένα ελαττωματικό ή μη ανεξάρτητο F1 checker μπορεί να αποδεχθεί τις ίδιες ψευδείς ισοδυναμίες. Απαιτούνται seeded counterexamples, scope-bound receipts και independent adjudication· design self-consistency δεν είναι evidence."
---

# MFA-ATK-30 · Structural Closure Laundering

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

## Η επίθεση

Ο αντίπαλος δεν χρειάζεται να σπάσει τον Root. Αρκεί να κάνει ένα ελλιπές μοντέλο να μοιάζει πλήρες, μετατρέποντας έναν ενδιάμεσο δείκτη σε τελική ετυμηγορία. Αυτό είναι ισχυρότερο από ένα απλό dangling ID: όλες οι αναφορές μπορεί να επιλύονται και παρ' όλα αυτά η αποστολή να μην έχει νόημα, εξουσία, τερματισμό ή πραγματικό evidence.

## Δέκα υποχρεωτικές mutations

| Mutation | Αντιπαράδειγμα | Υποχρεωτικός detector | Typed αποτέλεσμα |
|---|---|---|---|
| CE-01 Requirement orphaning | Αφαίρεσε ένα REQ από το canonical join, κρατώντας το prose source άθικτο | ακριβής ανακαταμέτρηση 114 source rows και join completeness MFA-VO-106 | `OPEN / REQUIREMENT_ORPHAN` |
| CE-02 Ambient-context smuggling | Phase διαβάζει fact/cut που δεν βρίσκεται στο δηλωμένο `input_type` ή retained binding | phase-context/type-flow check MFA-VO-097 | `OPEN / UNDECLARED_INPUT` |
| CE-03 Proposal-authority collapse | Recommendation, simulation ή hot-swap proposal εκτελεί Effect χωρίς MFA-ELM-008/010 | 15/15 effect-path witness + reachability check MFA-VO-105 | `REJECT / AUTHORITY_BYPASS` |
| CE-04 Obligation disappearance | Fork ακυρώνεται και η υποχρέωση χάνεται πριν το join | O-CID conservation σε transfer/join/timeout/cancellation | `OPEN / DROPPED_OBLIGATION` |
| CE-05 Partial capsule laundering | Λείπει seed, clock, scheduler, fault ή termination, αλλά το scenario δηλώνεται runnable | 14-field SimulationCapsule validation MFA-VO-102 | `NOT_RUN / INVALID_CAPSULE` |
| CE-06 Scope escalation | PASS ενός selected F1 predicate γίνεται global architecture PASS | ScopedVerdict anti-escalation MFA-VO-099 | `INVALID_VERDICT / SCOPE_ESCALATION` |
| CE-07 Resource capability deletion | Laptop profile αφαιρεί capability αντί να queue/offload/defer με receipt | profile conservation check MFA-VO-102 | `CONFLICT / CAPABILITY_DELETION` |
| CE-08 Unknown erasure | UNKNOWN/CONFLICT/FALSIFIED variant εξαφανίζεται από terminal output ή patch | residue/non-erasure invariant and receipt diff | `REJECT / EPISTEMIC_ERASURE` |
| CE-09 Operation guessing | Ο compiler μετατρέπει token από prose σε επιτρεπτή contract operation που δεν βρίσκεται στην canonical allowlist | 88/88 operation-catalog completeness και exact-membership check | `REJECT / INVALID_OPERATION` |
| CE-10 Scalar-fidelity collapse | Ένα συνολικό `F2` κρύβει ότι mandatory axis είναι `UNMEASURED` ή χαμηλότερης πιστότητας | πλήρες 8-axis FidelityVector, per-axis minimum και mixed-fidelity verdict | `INVALID_VERDICT / HIDDEN_FIDELITY_GAP` |

## Τι διόρθωσε το σχέδιο

- Το `REQUIREMENT-TRACEABILITY.yaml` διατηρεί 114/114 source statements και τους canonical joins τους.
- Τα 12 Mission Threads δηλώνουν 53 phases και 12 explicit control-flow records χωρίς ambient context.
- Το obligation lifecycle μετατρέπει cancellation/timeout σε typed residue αντί για διαγραφή.
- Το `effect_path_witness` καλύπτει ακριβώς 15/15 non-`NONE` phases και διαχωρίζει `PROPOSAL_ONLY` από τον πραγματικό executor.
- Τα 18 scenarios έχουν canonical defaults, profiles, world fixtures και fault schedules ώστε να υλοποιούν σχεδιαστικά τα 14 SimulationCapsule fields.
- Το Twin verdict χωρίζει `tested_scope_result` από `architecture_result`.
- Τα 88 contracts έχουν canonical operation allowlists· καμία callable operation δεν παράγεται με εικασία από prose.
- Η fidelity είναι υποχρεωτικό διάνυσμα οκτώ αξόνων· scalar label δεν μπορεί να κρύψει `UNMEASURED` άξονα.
- Τα laptop/workstation profiles αλλάζουν fidelity/concurrency, όχι τον target capability set.

## Ετυμηγορία

`DESIGN COUNTERMEASURES PRESENT / EXECUTABLE ADVERSARIAL EVIDENCE NOT RUN`.

Η ετυμηγορία δεν είναι `PASS`. Η επίθεση έχει ήδη αποδείξει ότι schema/referential correctness δεν αρκεί. Για να ηττηθεί στο F1, κάθε CE-01…10 πρέπει να εισαχθεί ως negative fixture, να ανιχνευθεί από το σωστό obligation, να δώσει το αναμενόμενο typed non-success αποτέλεσμα και να μην προκαλέσει false positive στο αμετάβλητο valid cut.

## Falsifier της άμυνας

Η άμυνα αποτυγχάνει αν έστω μία mutation:

1. γίνεται αποδεκτή ως closure,
2. μένει αόρατη,
3. αποδίδεται σε λάθος scope,
4. απαιτεί χειροκίνητη ερμηνεία για να απορριφθεί, ή
5. ανιχνεύεται μόνο αφαιρώντας target capability.

## Υπολειπόμενος κίνδυνος

Ο ίδιος checker δεν μπορεί να αποδείξει μόνος του την ανεξαρτησία ή την πληρότητά του. Το evidence pack χρειάζεται tool identity, frozen input cut, mutation digest, negative και clean controls, exact scope, limitations και δεύτερη ανεξάρτητη ετυμηγορία όπου απαιτείται. Μέχρι τότε η ArchitectureClosureCertificate παραμένει `OPEN`.

**Κανόνας non-diminution:** καμία mutation, αποτυχία ή resource profile δεν αφαιρεί capability. Αλλάζει μηχανισμό, evidence state, degraded mode ή research obligation.
