# cm-main-tier-sweep-6: does the callee-count selector transfer off `main`? (2026-08-14)

## Purpose

`cm-main-tier-sweep-5` (#1494) closed the question of whether callee count
is a genuine independent selector on `main`: a matched-pair design (same
128–192B size band, tier-matched 14 legacy + 11 legacy_sp3 per arm) found
0-1 calls shipping 40% vs 4+ calls shipping 76% — a 36-point gap, Fisher
exact p=0.021. Everything measured so far (sweeps 1-5, ~500 attempts) was
one module. This round replicates the same design on `ov002` — a
different module, with a much more heavily-mined pool (~700+ prior
attempts across 17 sweeps, vs `main`'s ~500 across 5) — to test whether
the selector is a property of the compiler (should transfer) or a
property of `main` (shouldn't).

## Stated prior (before pulling candidates)

Formed during pool construction, before any candidate was dispatched:
**the direction should hold** — the proposed mechanism (more `bl`
boundaries pin more register state via the ABI, leaving mwcc's scheduler
fewer degrees of freedom to diverge from a straightforward translation)
is a property of the compiler and the calling convention, not of `main`
specifically, so there is no reason it would flip sign on a different
module. But **the magnitude should likely be smaller than `main`'s 36
points**, because `ov002`'s pool has already been mined far more
aggressively (17 sweeps vs `main`'s 5) — the remaining unattempted
candidates in *both* arms should skew toward harder residue than `main`'s
comparatively fresher pool did, compressing both arms' ship rates toward
a floor and narrowing the observed gap. Estimated range: **15-25 points**,
with both arms' absolute rates lower than `main`'s 40%/76%.

**Result: 28-point gap (24% vs 52%)** — outside the top of the stated
range by 3 points, but much closer to it than to `main`'s 36-point gap,
and the direction prediction held exactly. Read as a reasonably
well-calibrated prior: right on direction, right that the gap would
shrink, off by a few points on how much.

## Part 1 — the matched-pair replication

**Design.** Pulled `ov002`'s full `--exclude-attempted` pool (1,865
candidates), then applied two additional exclusion passes before
building arms: every address named anywhere in
`docs/research/codegen-walls.md`'s P-wall index, and every address named
in `cm-ov002-unknown-sweep-2` through `-17` plus briefs 650/654 (883
unique address-like tokens total, 110 of which hit the pool and were
removed on top of the 195 `attempts.tsv` already excluded) — closing the
gap the round's own brief flagged (`attempts.tsv` alone only covers ~350
of `ov002`'s ~700 real prior attempts).

Tier and callee count were computed mechanically per candidate from the
`.s` body (exact-token `bl`/`blx` line count for callees; a
prologue/epilogue pattern match for tier — see **Tier-classifier
correction** below, since this pre-pass turned out to have a real bug).
Band: **149-255B**, chosen for population (77 candidates at 0-1 calls,
188 at 4+) with a width similar to sweep-5's 64B band on `main`.

**Tier match, as designed.** `ov002`'s remaining pool has **zero**
`legacy` (Style A) candidates left at all, and only 80 `legacy_sp3`
candidates total pool-wide — of which only **6** have 0-1 calls. That 6
is the true ceiling on `legacy_sp3` representation in the LOW arm
regardless of band choice; this round's design took all 6 that fell in
the chosen band's neighborhood (4 landed in 149-255B) as the binding
constraint, matching HIGH to it via nearest-size selection:

| Arm | n | mean size | median | min | max | tier (as designed) |
|---|---:|---:|---:|---:|---:|---|
| LOW (0-1 calls) | 25 | 199.5B | 192B | 172B | 252B | 4 legacy_sp3 + 21 default |
| HIGH (4+ calls) | 25 | 201.3B | 192B | 172B | 252B | 4 legacy_sp3 + 21 default |

Sizes matched tightly (0.9% relative mean difference, tighter than
sweep-5's 159.4 vs 155.7 on `main`).

**Tier match, as it actually turned out — a real classifier bug, caught
by the batches' own ROUTE-BEFORE-YOU-DRAFT discipline.** The mechanical
pre-pass flagged 8 candidates (4 per arm) as `legacy_sp3` from a `sub
sp, sp, #4` prologue match alone. Four of those eight — **exactly
half** — turned out to be `default` tier on a real compile:
`0x0229e5a0` (LOW), `0x021d0e18`, `0x02216334`, `0x021c3d84` (all HIGH).
The mechanism, confirmed directly by one batch: default tier (mwcc
2.0/sp1p5) can *also* emit `sub sp, sp, #4` when the natural push list —
including an r3 register that's part of the function's real callee-save
set, not an alignment spill — still leaves the stack short of 8-byte
alignment by one word. The pre-pass's "any `sub sp,#4` ⇒ mwcc 1.2
family" rule doesn't account for that case. All four misclassifications
went the same direction (flagged `legacy_sp3`, actually `default`) —
consistent with a one-sided bug, not noise.

**True, ground-truth tier composition** (from what each batch actually
compiled, not from the label they were handed):

| Arm | legacy_sp3 (true) | default (true) |
|---|---:|---:|
| LOW | 3 (12%) | 22 (88%) |
| HIGH | 1 (4%) | 24 (96%) |

**This is the honest answer to "were the arms tier-matched": no, not as
tightly as designed.** The pre-registered 4-vs-4 became 3-vs-1 once
routed for real. Per this round's own instruction, that imbalance is
reported rather than glossed over. Two things bound how much it can
matter: the absolute numbers are small (a 3-vs-1 split within n=25 each),
and the direction argues against inflating the result — sweep-4's
mechanical re-classification found `legacy_sp3` ships *better* than
`default` on `main` (74.7% vs a lower default-tier baseline), so if that
holds here, the LOW arm's higher `legacy_sp3` share should have given it
a small artificial *boost* relative to HIGH, not a penalty. LOW still
shipped at less than half HIGH's rate. If tier has any effect on this
imbalance at all, it argues the true callee-count effect is at least as
large as the raw 28 points, not smaller.

**Ship-rate result:**

| Arm | Shipped | Rate |
|---|---:|---:|
| LOW (0-1 calls) | 6/25 | **24.0%** |
| HIGH (4+ calls) | 13/25 | **52.0%** |
| **Gap** | | **+28.0 points** |

Per-batch (5 candidates LOW + 5 HIGH per batch):

| Batch | LOW | HIGH | Gap |
|---|---:|---:|---:|
| 1 | 2/5 (40%) | 3/5 (60%) | +20 |
| 2 | 0/5 (0%) | 4/5 (80%) | +80 |
| 3 | 2/5 (40%) | 3/5 (60%) | +20 |
| 4 | 1/5 (20%) | 1/5 (20%) | 0 |
| 5 | 1/5 (20%) | 2/5 (40%) | +20 |

Four of five batches showed HIGH beating LOW (20-80 points); one (batch
4) tied at 20% each — the same "one batch shows a tie or reversal, the
aggregate is unambiguous" pattern sweep-5 documented on `main`.

**Conclusion: the selector transfers.** Direction confirmed, magnitude
smaller than `main` as predicted (28 vs 36 points), consistent with a
compiler-level mechanism rather than a `main`-specific artifact. Given
`ov002`'s much more heavily-mined pool, a real question for a future
round is whether a *fresher* (less-mined) module would reproduce closer
to `main`'s 36 points — this round can't distinguish "the effect is
genuinely smaller off `main`" from "the effect is the same size but
`ov002`'s residue is harder in a way correlated with, but not caused by,
callee count."

## Part 2 — yield dispatch

**Design.** 50 more candidates on the campaign's best current selector
(4+ calls, ≤192B — sweep-5's exact formula, applied prospectively here
since this round doesn't have its own size-band finding yet), drawn from
the remaining pool after Part 1 (only 72 candidates existed at this
exact combination after exclusions — a tight but sufficient population).

**Result:** 20/48 attempted = **41.7%** (20/50 of the dispatched pool =
40.0% — 2 candidates went unattempted; see **Process notes**). Below
both arms' Part 1 rate is not the right comparison (Part 2 mixes sizes
88-192B, wider and skewed smaller than Part 1's 149-255B band, and
includes candidates *below* the population Part 1 sampled), but it's
consistent with a 40-52% range for "any 4+-call candidate in this size
neighborhood" on `ov002` — well below `main`'s Part 2 result (72%),
again consistent with the heavier-mining explanation.

## Combined totals

**39/98 attempted shipped (39.8%), 6,864 bytes.** Cross-validated two
independent ways: `check_activation_invariant.py` (39 `.c` added / 39
`.s` deleted / 39 delinks activations, exact match) and
`generate_state_table.py`'s regenerated byte counter (shipped `.text`
382,842 → 389,706 B, a delta of exactly 6,864 B; EUR natural-C 15.86% →
16.15%).

**Natural-C vs hand-written-asm split: 39 natural C, 0 hand-written
asm.** Every batch reported zero `asm_escape`/inline-asm files this
round — a cleaner split than sweep-5's 64 natural C + 1 asm (the `clz`
case).

| Part | Attempted | Shipped | Rate | Bytes |
|---|---:|---:|---:|---:|
| PART1-LOW | 25 | 6 | 24.0% | see below |
| PART1-HIGH | 25 | 13 | 52.0% | see below |
| PART2 | 48 (2 not attempted) | 20 | 41.7% | see below |
| **Total** | **98** | **39** | **39.8%** | **6,864** |

Per-batch shipped bytes (self-reported, cross-checked against the
combined delinks-span sum above): batch1 1,568B, batch2 1,708B, batch3
1,644B, batch4 572B, batch5 1,372B — sum 6,864B, exact match.

## Process notes

**Canary.** The first-picked candidate (`0x0229e5a0`, batch 1) walled
before any ship happened — parked cleanly against the existing **P-1**
catalogue entry (shift-pair vs. mask-collapse), so the canary rolled
forward to the batch's second candidate, `0x021f3318`, which shipped at
100%. That ship got a full byte-verify beyond the standing protocol: a
real, single-region `python tools/configure.py eur && ninja sha1` in the
batch's own fresh worktree (not just `fastmatch.py`), confirming the
toolchain/base/tier-routing wiring was correct before batches 2-5
dispatched. In hindsight this was **more expensive than necessary** — a
fresh worktree's first `ninja sha1` is a full rebuild (~21 minutes,
thousands of files), where the established protocol is `fastmatch.py`-
only per-candidate iteration with the 3-region gate deferred to the very
end. Batches 2-5 and the rest of batch 1 were corrected to `fastmatch.py`-
only immediately after the canary passed; the one full build stayed
confined to the canary.

**Batch 4's stop condition.** The round's STOP rule is "15 *consecutive*
parks with no ship." Batch 4 stopped after candidate 18 with 2 candidates
(`0x02296240`, `0x021faab4`) left unattempted, citing "the 15-park
threshold" — but the actual longest consecutive-park run at that point
was 6 (candidates 13-18), not 15; the batch had accumulated **15 total
parks** (not consecutive) across its 18 attempts. This is a real,
if minor, misapplication of the stop rule — reported rather than
corrected after the fact, since re-dispatching for 2 candidates wasn't
judged worth the overhead against an already-clear 98-attempt result.

**Gate.** `gate3.py --scope all --clean` was run twice. The first run's
background invocation used `nohup ... & disown`, which detached the
process from the harness's own tracking — the tool reported the
*launcher* script as complete (instant, since it just spawns and
returns) rather than the actual multi-hour `gate3.py` process, which was
still running when checked. Caught by reading the log rather than
trusting the notification, exactly the failure mode this project's own
docs warn about repeatedly. The actual first run, waited out properly,
came back `GATE FAIL` — all three regions passed SHA1 byte-identical,
but `docs/state-table.md` was stale (a real, checkable failure, not a
false one). Fixed with `tools/generate_state_table.py`, committed, and
gate3 was re-run in full (this time without detaching) —
**GATE PASS**, all three regions, all 3,248 tests.

## Ledger integrity

All 59 parked candidates across all 5 batches have a confirmed
`attempts.tsv` row (cross-checked programmatically against the full
100-candidate dispatch list — zero missing, zero duplicates, zero stray
addresses). The `brief`/batch-tag column is inconsistently populated
(some batches tagged every row including ships, batch 5's rows show
`unknown`) — a cosmetic ledger-hygiene gap, not a data-loss one; every
substantive field (addr, module, size, tier, result, match%, park_class)
is present and correct on every row.

## Candidate wall/lever observations (not yet numbered)

Several recurring residuals surfaced across batches that look like real,
reproducible families but weren't cross-referenced against the full
13k-line `codegen-walls.md` catalogue carefully enough this round to
mint numbers responsibly. Flagged here for a future round to number
properly rather than risk a wrong or duplicate entry:

- **mul-dest-swap + LS-vs-EQ condition-code residual** — recurred 4x in
  batch 1's "do-while slot-scan" shape family; zero movement across
  every rephrasing tried.
- **"Off-mul" scratch/final register swap** — new to this round's
  observers, recurred 3x in batch 3's per-player array-scan family
  (`(player&1)*0x868`'s intermediate vs. final value land in swapped
  physical registers); resisted every reordering/temp-splitting trick.
- **Register-role-rotation + LS-vs-EQ mnemonic** — recurred 5x in batch
  4's "per-side record-scan, validate via 1-3 gate callees" family,
  identical residual (68-79% match, word-count-correct) across every
  instance sharing the shape.
- **Register-numbering-permutation cascade (P-36-adjacent)** — recurred
  repeatedly in batch 5's "per-player array loop" family. A real,
  validated lever was found alongside it: switching an apparent `for`
  loop to `do`/`while` (matching the original's unconditional-first-
  iteration structure) removed a spurious upfront `count<=0` guard and
  lifted 3 candidates from ~12% to 65-73% match — only the register-
  numbering residual remained after that fix.
- **Scratch-register-renaming ("T-1")** — batch 2 tagged several parks
  (r1-vs-r2, r2-vs-r3, r4-vs-r5 register choice) with an ad hoc `T-1`
  label since nothing in the handed lever set matched cleanly; worth
  checking against the existing catalogue for a real match before
  minting a new number.

Smaller confirmed-lever notes from batch reports, useful for future
`ov002` rounds: bitfield reads must use a `struct {u16 bit:1;}` view,
never `&1` (batch 2); a composite `flag + (val<<1)` on a shared id-word
needs `+` not `|` even though the bit patterns are equivalent (batch 2);
`goto shared_tail` only wins when ≥2 real return sites converge, one
early return already predicates naturally (batches 2 and 3, matching
`ov002_core.h`'s documented gotcha); an `if(cond) return 1; return 0;`
two-statement form (not a collapsed `return cond;`) reproduces a
conditional-stack-restore epilogue the collapsed form loses (batch 3);
declaration order of same-lifetime locals frequently flips which
physical register mwcc assigns and is worth one cheap trial (batch 2).

## Next question

The direction transferred; the magnitude didn't fully. A clean follow-up
is picking a **fresher** module (fewer prior sweeps, more of a
population resembling `main`'s pre-sweep-1 state) to test whether 36
points is closer to the "true" effect size and `ov002`'s 28 is the
mined-pool artifact, or whether 28 is closer to true and `main`'s 36 was
itself on the high end of noise.
