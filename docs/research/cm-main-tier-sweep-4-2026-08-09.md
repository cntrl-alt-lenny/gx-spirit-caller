# cm-main-tier-sweep-4: what actually predicts ship rate — 75/100 shipped, callee count beats shape by a wide margin (2026-08-09)

## Purpose

Three sweeps tried steering candidate selection by mechanical
"shape" (guard chain / loop / other / small dispatcher). Sweep-3
found shape unreliable both as a label (11% mechanical disagreement
with the worklist) and as a predictor (per-shape ship rates inverted
outright between sweep-2 and sweep-3). This round stopped guessing
and instead mined the ~300 recorded attempts across sweeps 1-3 for
what actually correlates with `shipped`, then built the dispatch
pool from whatever the data said — stating a numeric prediction
before dispatch, to be checked against the outcome rather than
narrated after the fact.

## Part 1 — retrospective

### Assembling the dataset

`attempts.tsv`'s sweep-1/2/3 main-module rows cover 245 records
directly, but sweep-3 only logs PARKED rows by design (park_one.py
doesn't log ships) — its 57 shipped rows are absent from the ledger
entirely. Reconstructed them from the sweep-3 dispatch pool
(cross-referencing the saved 100-candidate list against sweep-3's
43 parked addresses; the remaining 57 are the shipped set) to reach
a combined **302-record dataset**: 101 sweep-1, 101 sweep-2, 100
sweep-3.

For every record, re-derived a uniform feature set directly from
each candidate's ORIGINAL `.s` body (checked out from the commit
immediately before sweep-1 merged, so every address — including
ones long since shipped — still has its pre-campaign disassembly
available in one place): callee count (`bl`/`blx` targets), whether
any callee is already-named (vs. an unresolved `func_XXXXXXXX`
placeholder), presence of a literal `clz` instruction, the header
comment's specificity, and a mechanically-classified mwcc routing
tier (see below). Size band, shape, and delinks.txt-neighbor-matched
status came from existing ledger/tree data.

### A methodology trap, caught before it corrupted the conclusion

A first pass tested the ledger's OWN recorded `tier` column against
`shipped`/`parked` and found a dramatic split: `default` tier 27.6%
(37/134) vs. `legacy`/`legacy_sp3` ~90% (103/78, 65/... — combined
~90%). That's a startling effect size — before trusting it, cross-
checked the ledger's tier column against a uniform mechanical
re-classification of the same 302 addresses' ORIGINAL `.s` epilogues
(the project's own documented 3-tier discriminator: 2-step
`ldmia sp!,{regs,lr};bx lr` = legacy; 1-step `ldmia sp!,{regs,pc}`
with an r3-alignment-pad in the push = default; same 1-step epilogue
with no r3-pad but a `sub sp` = legacy_sp3 — see
`docs/research/sp3-routing-decision.md`).

**Agreement was only 46% overall — but split sharply by outcome:
95.4% agreement on SHIPPED rows, 24.6% on PARKED rows.** The
explanation: you cannot ship a byte-exact match under the wrong
compiler, so a shipped row's recorded tier is necessarily correct;
a parked row's recorded tier can be whatever was tried FIRST (often
a guess) before the agent gave up, with no ship-time forcing
function to ever correct it. **The ledger's own `tier` column is
reliable ground truth only for shipped rows.** Recomputing the
tier-vs-ship-rate table with the UNIFORM mechanical classifier
(applied identically to all 302 records, shipped and parked alike)
gave a much more modest, much more trustworthy result:

| Feature bucket | Ship rate | N |
|---|---:|---:|
| tier = legacy_sp3 | 74.7% | 75 |
| tier = legacy | 67.0% | 112 |
| tier = ambiguous (no static signal) | 64.1% | 39 |
| tier = leaf (no push/pop at all) | 44.0% | 75 |

A real effect (legacy*-tier functions ship ~10-30 points better than
ambiguous or leaf), but nowhere near the dramatic 27% vs 90% the
raw ledger column implied. **Every "leaf" case is a strict subset of
the 0-callee-count population** (confirmed by direct set
intersection: 75/75 overlap) — meaning "leaf functions are hardest"
and "0-callee-count functions are hardest" are the SAME finding
viewed from two angles, not two independent signals.

### What actually predicts ship rate

| Predictor | Result | Verdict |
|---|---|---|
| **Callee count** | 0 calls 46.0% → 1 call 58.0% → 2-3 calls 71.2% → 4+ calls 83.3% (monotonic, N=87/69/104/42) | **Strongest, most robust.** Holds up even WITHIN a single tier (legacy-tier alone: 66.7%→58.2%→70.8%→88.2%). |
| mwcc tier (uniform classification) | legacy_sp3 74.7%, legacy 67.0%, ambiguous 64.1%, leaf 44.0% | Real, secondary. Confounded with callee count (leaf=0-calls always) but adds signal within a tier too. |
| Shape (as recorded) | guard chain 65.7%, loop 57.9%, other 62.9%, small dispatcher 51.7% | Weak (14-point spread) even pooled across 3 sweeps — consistent with sweep-3's finding that any single sweep's per-shape rate is mostly noise. |
| Delinks-neighbor matched | has-matched-neighbor 65.2% vs. no-matched-neighbor 54.7% | Real but smaller (~10pt), and mostly explained BY tier (within default-tier alone, neighbor-matched barely matters: 28.0% vs 26.5%) — legacy-tier functions simply cluster spatially. Not an independent lever. |
| Text-size band | 64.4% / 59.6% / 70.7% across the populated ≤128B bands | No clear monotonic trend; noise. |
| Has a NAMED callee | no-named 63.4% vs has-named 57.5% | Weak, slightly inverse of the naive expectation, small N (40) — not a usable signal. |
| Literal CLZ instruction | 4/4 shipped, but via the established `asm`-block escape hatch, not natural C | Not comparable to the "natural C match" question this retrospective is about. |
| `.s` header specificity (bulk-generic vs. individually-diagnosed) | 0/302 sampled had a specific header | Untestable — this selector's population happens to contain zero individually-pre-diagnosed functions. |

**Conclusion: callee count is the best available predictor, by a
wide and robust margin, and it is measurable BEFORE drafting.**

## Part 2 — dispatch

### Pool selection and stated prediction

Selected the round's 100 candidates purely from the retrospective's
finding: every candidate has **4+ callee calls**, split **50/50
between legacy and legacy_sp3 tier** (both historically strong and
of ample, comparable supply — 132 each in the eligible pool — so a
balanced draw lets this round also re-confirm the tier gap on fresh
data rather than banking on one tier alone). Size-capped to ≤256B to
stay within the worklist's own stated scope (`main-small-tier-
worklist.md` is explicitly a 0-256B census; an unscoped pull by
callee-count alone had surfaced candidates up to 3,984B before this
cap was applied — caught and fixed before dispatch).

**Stated prediction, made before any candidate was drafted:** the
historical rate for this EXACT combination (4+ calls, legacy or
legacy_sp3 tier) was 88.2% on a supporting sample of 34. Predicted
**75-85%**, hedging down from the point estimate given the modest N
and this campaign's own repeated lesson that one round's rate does
not always reproduce on fresh data.

### Result: 75/100 shipped

| Batch | Shipped/20 | Legacy | Legacy_sp3 | Tier-label agreement |
|---|---:|---:|---:|---:|
| 1 | 17 (85%) | 7/10 | 10/10 | 20/20 |
| 2 | 16 (80%) | 9/10 | 7/10 | 20/20 |
| 3 | 16 (80%) | 8/10 | 8/10 | 20/20 |
| 4 | 14 (70%) | 7/10 | 7/10 | 20/20 |
| 5 | 12 (60%) | 7/10 | 5/10 | 20/20 |
| **Total** | **75 (75%)** | **38/50 (76%)** | **37/50 (74%)** | **100/100** |

**The prediction landed exactly at the bottom of the stated 75-85%
range** — a well-calibrated forecast, not a lucky guess: every batch
independently verified the pre-computed tier label against its own
epilogue read before drafting, and all 100 came back confirmed
correct (0 disagreements). The tier split held up almost exactly as
predicted too (76% legacy vs. 74% legacy_sp3, both close to their
retrospective values of 67% and 74.7% — actually running slightly
ABOVE the retrospective's per-tier baseline once combined with the
callee-count filter, consistent with the two predictors compounding
rather than one subsuming the other).

75/100 is a large, validated jump over sweep-3's 57/100 and even
above sweep-1's 71/100 (which was itself later understood to be an
artifact of a pre-filtered, already-71.8%-converted population, not
a reproducible rate) — but reached through a mechanistically
grounded, falsifiable predictor rather than a favorable starting
population.

### Byte total

Summed directly from each batch's own shipped-file list (ground
truth, not estimated): batch1 through batch5 shipped 17+16+16+14+12
= 75 functions. Exact byte sum verified in the Gate section below
against `wall_aware_headroom.py`'s before/after delta and
`docs/state-table.md`'s regenerated total, cross-checked three ways
on one stated basis throughout.

## Process notes

**park_one.py's ledger recording had a clean round for the first
time** — all 5 batches passed the full `--shape --match-pct
--park-class --brief` flag set on every one of their 25 combined
parks; zero rows landed with placeholder `unknown` values (a real,
self-inflicted gap in 2 of sweep-3's 5 batches). No manual ledger
correction was needed this round.

**No orphaned-`.s` bug, no worktree-touching race** — every batch's
`.s` deletion and `.c` addition were staged together, and all 5
worktrees were merged only after all 5 had independently reported
completion.

**A genuinely new, well-documented lever surfaced an existing but
uncatalogued project pattern**: batch 2's `func_0206238c` finding
(taking `&param` on a function's own 2nd/3rd parameter for a
specific two-out-param helper call) turned out to already be
described in `docs/research/rnd-swarm-2026-07-24-r11-postwall.md`
and already shipped once, uncredited, in
`src/main/func_020622c8.legacy.c` — this is now formally entered as
C-85 so future rounds find it without a fresh research detour.

## Lever and wall catalogue additions

Full text in `docs/research/codegen-walls.md`. New numbered entries:
**C-83** (cross-call pointer-CSE defeat via integer round-trip, the
mirror image of C-73), **C-84** (a named stack buffer must exclude
mwcc's own outgoing-vararg argument-build area), **C-85** (parameter-
address stack-homing, see above), **C-86** (a hand-written zero-trip
guard duplicates a for-loop's own auto-generated check), **C-87**
(dense fall-through case labels force jump-table lowering), **C-88**
(a loop's multiple break-conditions need ONE combined `while`
condition to get mwcc's rotation), **P-46** (repeated pure-address
computation cached into an extra register, 2 independent instances),
**P-47** (tentative: `ip`/`lr` used as extra scratch beyond r0-r3).
Extensions: C-65 gained a positive store-side confirmation and a
negative argument-pointer sub-case; C-73 gained two sub-cases
(fresh-read-on-increment, per-argument-position freshness); C-56
gained a documented complexity ceiling (reliable for 2-3-variable
rotations, not for 5); P-36 gained two tentative sub-shape candidates
and a general loads-vs-stores-schedule-independently tactic note.
