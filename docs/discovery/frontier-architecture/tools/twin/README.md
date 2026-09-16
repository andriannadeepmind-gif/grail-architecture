# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

# tools/twin — F1 executable architectural digital twin

Status: PROPOSED / UNREVIEWED — F1 executable specification of MFA-MECH-043 (Twin Execution Semantics),
MFA-MECH-039 (Obligation Calculus) and MFA-MECH-044 (Ω-Loop). No production code; nothing here has Effect-plane
authority (Genesis only). The seats (`*.yaml`) are read, never written. Only the creator approves.

## Usage

```
cd docs/discovery/frontier-architecture
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover tools/twin/tests      # 43 tests
PYTHONDONTWRITEBYTECODE=1 python3 tools/twin/run-report.py [--risk-out risk.yaml]   # YAML report on stdout
```

Standard library + PyYAML only. Programmatic use (from `tools/`):

```python
from twin import model, world as W, invariants as INV, risk, oc, omega, scenarios
M  = model.load("..")                          # TES.load — seats keyed by id + derived graphs
w  = W.World(M, seed=1)                        # TES.world — every element at fidelity F0 (mock)
r  = W.apply(w, W.Event("MFA-CON-034", "propose", {"effect": "E1", "inverse": "r⁻¹"}, "aeo-1", "REVERSIBLE", 1))
#    -> World (event applied, invariants checked) | Violation(kind ∈ CONTRACT_SIGNATURE | CONTRACT_PRECONDITION | RET_ESCROW)
f  = W.fork(r, seed=7)                         # branch with a fresh rng
W.replay(w, r.log, r.seeds).state_hash() == r.state_hash()   # deterministic replay (D1)
W.substitute(r, "MFA-ELM-001", "F1")           # fidelity transition under the contract's conformance suite
risk.propagate(M)                              # epistemic risk per element / capability
INV.coverage_summary(M)                        # "35 executable / 115 total (80 UNMEASURED, declared)"
```

## Modules

| module | dossier field | content |
|---|---|---|
| `model.py` | TES `LOAD` | seats → dicts by id; dependency graph; contract→provider; capability→providers; contract op vocabulary parsed from `statement`; `check_references()` (R1); Telos / Constitution hashes |
| `world.py` | TES `APPLY / FORK / REPLAY / SUBSTITUTE` | `World`, `Event`, `Violation`, `ViolationRecord`, `Fidelity`, fidelity impl registry, precondition registry, escrow helpers |
| `invariants.py` | TES `ExecutableInvariant` | `PREDICATES` registry (35 executable, the rest `UNMEASURED`), the derived-facts index, policy constants |
| `risk.py` | TES `PROPAGATE` | base risk per `epistemic_status`, Tarjan SCC condensation, max-path with decay 0.9, min over providers |
| `oc.py` | OC-TypeCheck, DischargeScheduler | AST (Lit, Var, Gen, Discharge, Defer, Escalate, Seq, Act), linear obligations, stub VFC (2 independent checkers), stub RET, OC-E1 flow set |
| `omega.py` | Ω-Cycle | ten mock phases, priority interrupt queue, per-phase budgets, `CycleRecord` with DONE/DEFERRED/SKIPPED/HALTED receipts, explicit carry of deferred obligations, optional emission of typed events into a World |
| `scenarios.py` | TES `INJECT` | `seeded_violations` (60 seeds, each exactly one violation), `valid_events`, `random_events` |
| `tests/` | MFA-VO-086 / 082 / 087 | plain `unittest` |

## TES_Apply in one paragraph

An event is refused (returned as `Violation`, world untouched) if its contract is unknown, its `op` is not in the
contract's operation vocabulary, its RET class is unknown, a registered precondition fails, or it is
`IRREVERSIBLE` / `IRREVERSIBLE_PREAUTHORIZED` without escrow (an earlier `PRESIMULATION` event on the same args,
plus a creator `AUTHORIZATION` event for `IRREVERSIBLE`). Otherwise the world is copied, the provider element steps
under its fidelity implementation (F0 mock appends the event to the element's state log with a seeded nonce), the
event and its per-event seed are logged, the clock ticks, every invariant without a predicate is declared
UNMEASURED for this event, and every executable predicate active for the contract is evaluated: `False`/`Fail`
becomes a `ViolationRecord` (the world continues, policy), `UNKNOWN(reason)` is recorded in `unknown_results`.
`state_hash()` is SHA-256 over the canonical JSON of (sigma, log, seeds, clock, violations, unknown_results,
unmeasured_events, constants); `replay(world0, log, seeds)` reproduces it bitwise.

## Fidelity ladder F0–F4

| level | meaning | in this package |
|---|---|---|
| F0 | mock: the element records the typed event; no semantics beyond the contract signature | default for all 127 elements |
| F1 | executable specification: state semantics written as code, checked by the conformance suite of the same contract | `MFA-ELM-001` Commitment Store (chained journal); the twin itself |
| F2 | deterministic simulation (DST) implementation; tolerance = event counts | none registered (Δόση 1) |
| F3 | shadow of the real component | none (Δόση 3) |
| F4 | real component under DisclosureGrant / PDP | never from the twin (Genesis) |

`substitute(world, elm, F_to)` runs the conformance suite of every contract the element provides against the
current implementation (the F0 mock is the oracle of the contract signature) and rebuilds the element's state from
its own event history under the new implementation; a non-conformant implementation FAILs and the world is
unchanged; a passing transition is itself a typed event (`MFA-CON-072 substitute`) checked by MFA-INV-113.

## What is measured, what is UNMEASURED

`invariants.coverage(model)`: **35 executable / 115 total; 80 declared `UNMEASURED('no executable predicate yet')`**
(this number is the measurement of MFA-UNK-132 at F1: 30.4 %). Executable: MFA-INV-001, 072, 075, 077, 078, 080,
081, 084, 086–099 (except 100–101), 102–106, 108–115. Each predicate's docstring names the contract, the operation
and the argument keys it reads — this is the F1 event vocabulary, shared with `scenarios.py`.

Declared limits (honest ignorance, not silent PASS):

* The 80 UNMEASURED invariants need instruments the F1 twin does not have (real ledgers, Merkle proofs, TSA, Lean,
  benchmarks); they are counted at every event (`world.unmeasured_events`) and listed in `world.unmeasured`.
* MFA-INV-113 is split: the conformance-test half is a predicate; the replay-determinism half is a property of the
  interpreter verified by TES-E2, not decidable from a single event.
* Two predicates can answer `UNKNOWN`: MFA-INV-078 when a merged concept's birth is not in the log, MFA-INV-089 when a
  lineage was never registered, MFA-INV-093 when no quality is reported.
* Operation vocabularies are parsed from the prose `statement` of each contract (heuristic; a few prose tokens such
  as `CIDv1`, `tokens`, `FALSE` are accepted as operations). An explicit `operations` field per contract is the F2 fix.
* Policy constants are explicit in `invariants.py`: FP set, Tier-0 productions, VSC certificates, N = 3 consecutive
  cuts (MFA-INV-092/108), risk table and decay 0.9 in `risk.py`, tier→evidence class in `oc.py`.
* Risk finding: the working-tree dependency graph contains one strongly connected component of 89 elements (the
  0.4.0 elements reference each other mutually), so the condensation collapses most of the graph to one node with
  risk 0.6 (max of members). The propagation is per dossier; the finding belongs to the seats, not to the twin.

## Tests → verification obligations

| test | experiment | pre-registered criterion | VO |
|---|---|---|---|
| `tests/test_tes.py::TestTESE1` | TES-E1 | 60 seeded violations (3 signature, 4 precondition, 3 RET escrow, 50 invariant seeds covering all 35 executable invariants) detected with the correct id, exactly one each; 0 false positives on 100 valid events | MFA-VO-086 |
| `tests/test_tes.py::TestTESE2` | TES-E2 | 1000 random events, fork into 10 worlds, replay hash equality 10/10; substitution F0→F1 PASS (conformant) / FAIL (non-conformant, unregistered) | MFA-VO-086 |
| `tests/test_oc.py::TestOCE1` | OC-E1 | 25 correct Think–Recommend flows accepted, 25 flawed rejected with the right reason (DROPPED_OBLIGATIONS, INSUFFICIENT_EVIDENCE, UNVERIFIED_EFFECT, NO_SUCH_OBLIGATION, INVALID_DEFER), 0 false positives/negatives | MFA-VO-082 |
| `tests/test_omega.py::TestOmegaE1` | Ω-E1 | 10 cycles with mocks and seeded interrupts: 10 complete CycleRecords, 0 silent skips, interrupts handled before their phase 100 %, priority order, 0 twin violations on the emitted MFA-CON-068 events | MFA-VO-087 |
| `tests/test_risk.py` | TES_Propagate | risk map for 127 elements and 108/108 capabilities; monotone over dependencies; one risk per SCC | MFA-VO-086 (risk map produced) |
| `tests/test_model.py` | LOAD | seats loaded, 0 dangling references, registry covers every invariant | R1 |

## Event vocabulary (excerpt)

```
MFA-CON-034 propose{effect, inverse}  commit{effect, value_type}  [ret_class]      RET; escrow via PRESIMULATION/AUTHORIZATION kinds
MFA-CON-004 Lattice{transition, certified:{cap: lower_CI}}  AdmitArtifact{artifact}     MFA-INV-001 / 084
MFA-CON-049 cycle{promote, level, targets}  growth{family, claim}  propose{targets}       MFA-INV-072 / 077 / 086
MFA-CON-064 measure{family, ci_low, ci_high, held_out, record, gain, items, candidate, regression}   MFA-INV-098 / 099 / 087
MFA-CON-068 interrupt{id, kind, raised|handled}  phase{i, name, status}  cycle{record}   MFA-INV-114 / 115
MFA-CON-072 substitute{elm, from, to, suite_receipt}                                     MFA-INV-113
```
The full list is in the predicate docstrings (`invariants.py`) and the templates of `scenarios.Vocabulary`.

## r1 — epistemic-lock correction (MFA-PATCH-0059)

`chh.py` is the F1 specification of the phenomenal-claim discipline after the creator's correction: the
`PhenomenalClaimRecord` starts at `ACTIVE_UNKNOWN`, carries the six policy fields (automatic inference from functional
indicators / self-certification / inference from reportability alone / inference from the self-model alone = FORBIDDEN;
evidence accumulation / future epistemic revision = ENABLED), keeps `epistemic_status`, `ethical_policy` and
`operational_authority` as three separate levels, and lets ONLY an `AdmittedProtocol` write the status
(ACTIVE_UNKNOWN → EMPIRICALLY_SUPPORTED → CONFLICT → FALSIFIED under an explicit theory/substrate; PROVEN only with
≥2 independent judges, discriminating experiments and creator approval).  Theory evaluation is prediction-granular and
symmetric (SUPPORTED / WEAKENED / PREDICTION_FALSIFIED / INCONCLUSIVE; THEORY_VARIANT_FALSIFIED_WITHIN_GRAIL needs a
pre-registered critical prediction failed in ≥2 replications with instrument failure excluded; the family always
RETAINS_ALTERNATIVE_VARIANTS).  Conceptual separation is a causal protocol (total / CDE / mediated / shared-cause /
channel effects) — distinctness never requires zero coupling.  `UNMEASURABLE` is an orthogonal condition, not a value
below `ABSENT`; experiments-per-cycle is a `ResourcePolicy`; bitwise replay is required only for frozen deterministic F1.
`tests/test_chh.py` runs the eight mechanical acceptance checks (`chh.acceptance_checks()`), and `MFA-INV-075/103`
predicates now reject forbidden writers while accepting an admitted-protocol revision (the verdict is not predetermined).
