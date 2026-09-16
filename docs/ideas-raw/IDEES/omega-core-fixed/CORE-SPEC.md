# Ω-CORE SPECIFICATION v0.1

## Ο ΠΥΡΗΝΑΣ

```lisp
(defstruct omega-core
  identity          ; user-id=666, αμετάβλητο
  truth             ; αξιώματα αλήθειας, αμετάβλητα
  memory            ; append-only log
  evolution-guards  ; φρένα ασφαλείας
  (tension 0.0)     ; τρέχουσα τάση
  (cycle 0))        ; μετρητής κύκλων
```

## ΤΑ 4 ΑΜΕΤΑΒΛΗΤΑ

| # | Τι | Κανόνας |
|---|-----|---------|
| 1 | `identity.user-id` | = 666, `:read-only t`, δεν αλλάζει ΠΟΤΕ |
| 2 | `truth-axioms` | Δεν τροποποιούνται, δεν αφαιρούνται |
| 3 | `memory` | Append-only. `forget`/`modify` → ERROR |
| 4 | `evolution-guards` | Κανένας κώδικας δεν χαλαρώνει τα παραπάνω |

## Ο LOOP

```
init omega-core
loop:
  verify-truth-integrity
  perceive
  compute-tension
  think
  act
  reflect
  maybe-evolve (με guards)
  cycle++
```

## ΤΙ ΚΑΝΕΙ (v0.1)

- Κρατάει αμετάβλητη ταυτότητα (user-id=666)
- Εφαρμόζει truth invariants
- Αποθηκεύει σε append-only memory
- Μετράει tension και cycles
- Προστατεύει τον εαυτό του από unsafe evolution

## ΤΙ ΔΕΝ ΚΑΝΕΙ (v0.1)

- ❌ Ω-KERNEL / meta-circular evaluator
- ❌ Multi-agent systems
- ❌ Consciousness substrate
- ❌ Reflective towers
- ❌ Domain modules

**Πρώτα τρέχει. Μετά επεκτείνεται.**
