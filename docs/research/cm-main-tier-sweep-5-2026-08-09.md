# cm-main-tier-sweep-5: the matched-pair experiment — callee count beats size by design, not by accident (2026-08-09)

## Purpose, and a correction of record

Sweep-4 found callee count predicts ship rate far better than shape
(46%→83% monotonic), and a brain review independently validated the
finding statistically — but flagged that sweep-4's own round doc
never actually reported a byte total. `wall_aware_headroom.py`'s
`total`/`candidate`/`coercible` columns are **file counts**
(`d["candidate"] += 1` in the tool's own source), not byte sums; a
before/after delta of those columns equaling the ship count is a
valid *count* cross-check but tells you nothing about bytes, since it
is mathematically guaranteed to equal the ship count regardless of
what the actual function sizes were. Sweep-4's PR cited this delta as
if it verified bytes. It didn't. This round's byte total (below) is
computed the correct way: summing each shipped function's
`.text start`/`end` span directly from `delinks.txt`.

The brain also found that within sweep-4's own dispatched pool, size
was strongly predictive (64-127B 87%, 128-191B 86%, 192-255B 65%,
256B+ 33%) while callee count was comparatively flat (71-76% across
the 4/5-6/7+ call buckets) — meaning sweep-4's pool, which pulled on
callee count alone and let size float up to 2.2x its training
population's mean, could not by itself rule out "callee count is a
size proxy." This round settles that question by design.

## Part 1 — the matched-pair experiment

**Design.** 50 candidates, all from the SAME narrow 128-192B size
band, split into two arms of 25: `LOW` (0-1 callee calls) and `HIGH`
(4+ callee calls). Size cannot explain a difference between the arms
by construction. The two arms were additionally tier-matched exactly
— 14 legacy + 11 legacy_sp3 in each — after an initial naive
per-arm sort produced a real imbalance (14 legacy/11 legacy_sp3 in
LOW vs. 2 legacy/23 legacy_sp3 in HIGH) that would itself have
confounded the comparison; the fix used the LOW arm's binding
constraint (only 11 legacy_sp3 candidates existed in that pool) as
the shared ratio for both arms.

**Stated prior:** HIGH ships 75-85%, LOW ships 45-60% (a 20-35 point
gap), based on the callee-count effect holding up within a single
mwcc tier in the sweep-4 retrospective, and a brain regression
finding that controlling for size made the callee coefficient GROW
(0.315→0.428), not shrink.

**Result:**

| Batch | LOW (0-1 calls) | HIGH (4+ calls) | Gap |
|---|---:|---:|---:|
| 1 | 2/5 (40%) | 3/5 (60%) | +20 |
| 2 | 3/5 (60%) | 5/5 (100%) | +40 |
| 3 | 1/5 (20%) | 4/5 (80%) | +60 |
| 4 | 1/5 (20%) | 4/5 (80%) | +60 |
| 5 | 3/5 (60%) | 3/5 (60%) | 0 |
| **Total** | **10/25 (40%)** | **19/25 (76%)** | **+36** |

**The gap is real, large, and — combined across 5 independent
batches — EXCEEDS the stated prior (36 points vs. the predicted
20-35).** Four of five batches showed a substantial gap (20-60
points); one batch (5) showed a tie, which per the round's own design
was framed in advance as an equally valid outcome, not a failure —
and it is: a single batch's local result is exactly the kind of
noise a 5-batch aggregate exists to average over, and the aggregate
result is unambiguous. **Callee count is a genuine, independent
predictor of ship rate, not a proxy for size.** This closes the
question sweep-4's own retrospective could not, since only 8
historical records had both ≥128B and 4+ calls before this round.

## Part 2 — yield dispatch, and a self-critique

**Design.** 50 more candidates on the best current selector: 4+
callee calls, size ≤192B (deliberately excluding the 192-255B and
256B+ bands sweep-4's data showed shipping worse).

**Stated prior:** 80-88%, above sweep-4's 75%.

**Result:** 36/50 = **72%** — below sweep-4's own 75%, and a real
miss against the stated prior (8-16 points low).

**Why, honestly.** The 80-88% prediction combined two separate
marginal observations — "≤192B ships well" and "4+ calls ships
well" — and assumed they'd compound favorably, without a directly-
measured joint base rate for exactly that combination. That is a
milder version of the SAME extrapolation trap this round's Part 1 was
designed to catch sweep-4 making. Two batches independently flagged a
plausible partial explanation not tested by this round's design:
batch 2 found its hardest Part 2 candidates were disproportionately
ones with an INDIRECT call (`blx` through a function-pointer field)
rather than a direct `bl`, and batch 5 found its own Part 2 pool's
mean size (129B) ran meaningfully smaller than its PART1-HIGH pool's
(152B) within the same batch, suggesting the size-vs-callee
interaction may not be fully flat even below the 192B ceiling. Both
observations are flagged as candidates for a future round to test
deliberately, not asserted as proven — this round's design did not
isolate either variable.

**Combined shipped: 65/100.** PART1-LOW 10, PART1-HIGH 19, PART2 36.

## Mechanism probe: why does callee count predict ship rate?

Using `attempts.tsv`'s `park_class` column across all 4 prior sweeps'
main-module parks (138 resolvable rows — the `.s` file still exists
for every one, so callee count could be recomputed directly rather
than trusted from a stale label), bucketed by the parked candidate's
own callee count:

| Callee bucket | N | reg-alloc-ish | scheduling/predication-ish | other |
|---|---:|---:|---:|---:|
| 0-1 calls | 76 | 24 (31.6%) | 30 (39.5%) | 22 (28.9%) |
| 2-3 calls | 30 | 14 (46.7%) | 5 (16.7%) | 11 (36.7%) |
| 4+ calls | 32 | 19 (59.4%) | 8 (25.0%) | 5 (15.6%) |

(Categorization is a coarse keyword match on the `park_class` string
— `reg-alloc-ish` matches "reg-alloc"/"register"/P-20/P-23/P-28/P-30-
family strings; `scheduling/predication-ish` matches P-36/P-31/P-32/
P-33/"schedul"/"predicat"/"pipeline". Full raw `park_class` strings
are in the ledger for anyone who wants a different split.)

**The pattern holds and sharpens with more data than the brain's
preliminary N=113/N=7 look**: reg-alloc-ish share of parks rises
monotonically with callee count (31.6%→46.7%→59.4%); scheduling/
predication-ish share is highest at 0-1 calls (39.5%) and drops
sharply above that. This is consistent with the mechanism the brain
proposed: more call boundaries pin more register state via the ABI
(every `bl` fixes what's live across it), leaving mwcc's scheduler
fewer degrees of freedom to diverge from a straightforward
translation — but as call boundaries pin down scheduling freedom,
what residual difficulty remains concentrates in genuine register-
allocation choices instead. **Proposing this as a documented
observation, not (yet) a numbered lever or wall** — it describes a
shift in WHICH wall family a park is likely to hit as callee count
rises, not a fix for any of them individually.

## Byte total — computed correctly this round

**9,732 bytes**, summed directly from `config/eur/arm9/delinks.txt`'s
`.text start`/`end` span for each of the 65 newly-`.c`-suffixed
files (cross-checked against each batch's own independently-reported
byte sum: 2032 + 2088 + 1828 + 1604 + 2180 = 9,732 — exact match).
`wall_aware_headroom.py`'s file-count deltas (below, correctly
labeled) are a secondary, count-only cross-check — not a byte
measure.

## Process notes

**`park_one.py`'s ledger recording stayed clean** — all 5 batches
passed full diagnostic flags on every park, confirmed via
`tools/validate_attempts.py` (a new ledger-hygiene tool that landed
mid-sweep-4): 0 hard errors, 1 advisory shape-conflict flag on a
single row (`0x02095418`, batch 4 — `shape` and `park_class` describe
the same underlying finding at two granularities; not a data error,
left as recorded).

**New, genuinely novel process finding**: `func_02080728` (batch 5)
structurally routed to `legacy_sp3` correctly, but that tier's mwcc
1.2/sp3 assembler doesn't recognize the `clz` mnemonic the body
needs. Solved by hand-transliterating into an inline-`asm` block
filed under the plain (mwcc 2.0) tier instead — since inline asm
bypasses the compiler's own codegen, only the assembler's mnemonic
table matters, decoupling "structural tier" from "which assembler can
actually build this file." Documented as C-93.

## Lever and wall catalogue additions

6 new C-levers (C-89 through C-94: guard-clause polarity inversion
for predication; zero-init array element type controls stmia-pair
vs. byte-loop lowering; array-decay vs. pointer-variable typing for
bare-address globals; a pre-zeroed-boolean assignment idiom; the
inline-asm tier-override for unsupported mnemonics described above;
an unnecessary cached local forcing a genuinely extra register), 2
new tentative P-walls (P-48: passthrough-parameter register eviction
under bit-arithmetic pressure; P-49: RSB-immediate constant-fusion,
a P-40 sub-case), and extensions to C-45 (the range-fold lever
generalizes from `switch` to plain `if (a==X||a==Y)`) and C-73
(`volatile` can be needed for cross-statement scheduling adjacency,
not just CSE-reload freshness). P-36 gained 3 new sub-shapes (9: a
confirmed 2-instance boolean-materialization-order wall; 10: literal
register-set store-order; 11: loop-invariant-constant register
residency, also a confirmed 2-instance finding) plus one further
tentative single-instance note (a `cmp`-vs-`movs` canonicalization
resistance). Full text in `docs/research/codegen-walls.md`.
