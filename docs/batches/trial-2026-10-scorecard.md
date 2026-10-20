# Light-workflow trial scorecard (2026-10-06 to 2026-10-20)

The four measures set in `docs/state.md` when the trial began, read on
2026-10-20 from `main` after #1658. Natural-C comes from
`python tools/progress.py --version eur`.

## 1. Verified progress

| | Trial start (#1634) | Trial end (#1658) | Change |
|---|---:|---:|---:|
| Natural-C | 414,738 B (17.38%) | 877,558 B (36.78%) | +462,820 B |
| EUR units in C | 7,767 | 9,887 | +2,120 |
| EUR units in `.s` | 4,714 | 2,594 | -2,120 |

| Phase | Dates | PRs | Functions | Natural-C |
|---|---|---|---:|---:|
| Batches relayed by the owner | Oct 6-17 | #1636-#1654 (15 batches) | 659 | +89,516 B |
| Outside contribution | Oct 14 | #1651 | 1 | +192 B |
| Factory (Sonnet 5.5, then GPT-6.1 Sol) | Oct 17-20 | #1655-#1658 | 1,460 | +373,112 B |

Every function counted is merged and passed the three-region gate.

## 2. Owner burden

| Phase | Prompts relayed by the owner | Per matched function |
|---|---|---|
| Batches | Counted on Oct 6 (16) and Oct 17 (6); Oct 7 was not counted, so the total is about 35-40 | about 1 per 17 |
| Factory | 0: per night the owner said "run it" and later approved one merge | 0 |

The owner gave one merge approval per PR (20 in all), as the merge rule
requires.

## 3. Safety

- Every merged PR passed `gate3.py --scope all` on the exact merged tree, or
  on a tree proven identical, and had an independent Verifier review, except
  the one-function outside contribution #1651 (Brain review and gate).
- No match was lost: units in C only grew, and every gate rebuilt three
  byte-identical ROMs.
- Caught before merge: baseline lines removed that a combined tree still
  needed (gate), a compiler intrinsic the invariants check did not know (CI),
  a tidy-pass bug that hid 7,376 B as asm-C (Verifier), and fake-match idioms
  (`volatile` locals and casts, `do { } while (0)`), each fixed or reverted
  to `.s`.
- Open: batch 16 (8 functions on `worker/batch-16`) was never reviewed or
  merged.

## 4. Failures kept

The ledger grew from 1,886 to 7,221 rows (2,143 shipped, 3,189 parked from
the trial's batches and factory lanes); `validate_attempts.py` reports 0
errors. Factory parks record each tier's best score from the factory's own
try log, not from the agent's report. Functions an agent never got to test
(timeouts, the Oct 20 service outage) have no row because nothing was tried.

## Cost

Factory night 1 (four Sonnet 5.5 lanes) used about 11% of the owner's weekly
Claude allowance. Each GPT-6.1 Sol night used about 20-25% of the weekly
ChatGPT Codex allowance and almost no Claude.

## For the owner to decide

The trial has ended. Its result supports keeping the factory as the main way
of matching, with Brain review and one merge approval per night, and using
relayed batches only for work the factory cannot do. Recording that choice
in `docs/state.md` is the owner's decision.
