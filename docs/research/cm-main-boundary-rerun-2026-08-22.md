# cm-main-boundary-rerun: the 193-256 B slice re-tested at matched effort — 0/20 shipped (2026-08-22)

## Purpose

`cm-main-exploit-drain-2` (#1536) tested the 193-256B slice and reported 0/40,
then disclosed — correctly — that Part 2 got materially less iteration than
Part 1, and declined to invoke the decision memo's Outcome B on a confounded
number. The brain's independent read of that round's own `match_pct`
distribution (Part 1 median 17.8%, 2/27 ≥85%; Part 2 median 12.9%, 1/40 ≥85%,
only a ~5-point gap and biased in Part 1's favor) argued the confound probably
didn't change the answer — but couldn't prove it without a clean re-run. This
round is that re-run: **20 fresh candidates, sampled from the untouched
remainder of the same slice, under Part 1's full protocol** (2-4 fastmatch
iterations, real struct-layout and register-order experiments before
parking).

## Pool re-derivation

`wall_aware_headroom.py --exclude-attempted --min-size 193 --max-size 256`
plus the same `≥4 bl/blx` filter #1536 used, run fresh at this item's `main`
(`ece11cf53`): **224 candidates / 50,548 B**. Reconciles exactly with the
brain's own count (264 − 40 attempted = 224) and with the module distribution
stated in the kickoff (ov002 115, main 99, then single digits: ov008 3, ov010
2, ov000/ov005/ov014/ov019/ov020 1 each).

Sampled 20, stratified across the 9 modules that actually have candidates
(floor 1 each, remainder split between ov002/main proportional to their share,
capped at 8 per module so neither dominates), fixed seed for reproducibility.
Screened every address against every `**Affected picks**` line in
`codegen-walls.md` before freezing the partition — zero collisions, and zero
overlap with #1536's already-attempted 40 (verified directly against that
round's 40 addresses). Draw: main 6, ov002 7, and one each from ov000, ov005,
ov008, ov010, ov014, ov019, ov020 — this is what the pool's actual composition
supports, not an artificially forced even split.

## Result: 0/20 shipped (0%)

Every one of the 20 got genuine, multi-attempt effort — several got
substantially more than the 2-4 iteration floor. None shipped. Full ledger
detail below; the shape of *why* is at least as informative as the headline
number.

### The canary problem, reported straight

The brief requires hand-verifying one candidate end-to-end — fastmatch 100%,
real `ninja sha1` PASS — before dispatching the rest, and picking a different
one if the first doesn't ship. **No candidate in this 20-sample reached
100%, including after switching candidates repeatedly.** The two closest:

- `func_ov005_021ad284` (ov005, 216B) — a 3-state mode dispatch, reached
  **92.6%** (4 residual words, all the identical `r0`-vs-`r1` register-choice
  pattern on the switch selector). Tried: `switch` vs. `if`/`else if` (the
  latter inverted branch polarity and dropped to 5.6%), hoisting `mode` into
  a local before vs. after the accumulator, an explicit unused second
  parameter to shift register pressure, unsigned vs. signed field typing.
  None moved the residual. The *identical* 4-word pattern, on a
  structurally-identical mode-switch, already appears in #1536's own
  `func_ov014_021b2eec` at 92.2% — this is now two independent confirmations
  of a real, named wall (see catalog update below), not noise.
- `func_ov014_021b280c` (ov014, 252B) — a VRAM-register-clear + bitfield
  dispatch, reached **87.3%** (8 residual words, all pure instruction/operand
  reordering the compiler re-canonicalizes regardless of source statement
  order). Applying the C-95 lever (a real 3-bit bitfield instead of a
  shift-pair or manual mask) took this from 44-52% to 87% in one step —
  genuine, reusable progress — but the remaining reordering residual didn't
  respond to five further source variations (read order, cast placement,
  redundant-mask restoration, OR-operand order).

Ten distinct candidates were tried specifically hunting for a canary before
the 20-sample was worked systematically (`func_020264f0` 57.4%,
`func_020990e0`/`func_0209f7fc`/`func_020886a0`/`func_ov010_021b6514` all
0.0% on structural mismatches, `func_ov019_021b3e38` 21.1%,
`func_ov002_02204380` 35.3%, `func_ov002_02262804` 10.7% — the last sharing
`021ad284`'s exact switch-selector wall). **The pipeline itself is not in
question** — `fastmatch.py` tracked every source change precisely and
consistently throughout this session (0%→57%→92% on one candidate as fixes
landed, correctly flagging regressions when a "fix" made things worse), and
the ship mechanics (`batch_sha1.py` → `record_shipped.py`) are independently
proven working across two prior rounds (#1524, #1536, 78 combined real
ships). What did not happen is a **new** ship from **this** sample, despite
trying every one of it.

### Per-candidate results (all 20, sorted)

| Address | Module | Size | match_pct | park_class |
|---|---|---:|---:|---|
| `020886a0` | main | 256B | 0.0 | reg-alloc |
| `0209f7fc` | main | 204B | 0.0 | reg-alloc |
| `020990e0` | main | 196B | 0.0 | reg-alloc |
| `02086d70` | main | 212B | 0.0 | reg-alloc |
| `020330e4` | main | 204B | 0.0 | reg-alloc |
| `021b6514` | ov010 | 208B | 0.0 | reg-alloc |
| `021aaa80` | ov020 | 252B | 0.0 | reg-alloc |
| `0228130c` | ov002 | 236B | 0.0 | P-20-row-offset |
| `0223252c` | ov002 | 204B | 3.9 | P-20-row-offset |
| `0224a038` | ov002 | 232B | 4.9 | P-20-row-offset |
| `021adc50` | ov000 | 212B | 5.5 | reg-alloc |
| `02249818` | ov002 | 256B | 5.9 | P-20-row-offset |
| `02262804` | ov002 | 224B | 10.7 | register-choice |
| `021abbf0` | ov008 | 236B | 13.6 | reg-alloc |
| `021b3e38` | ov019 | 200B | 21.1 | reg-alloc |
| `02204380` | ov002 | 204B | 35.3 | reg-alloc |
| `020264f0` | main | 244B | 57.4 | reg-alloc |
| `02233c50` | ov002 | 220B | 63.6 | P-20-row-offset |
| `021b280c` | ov014 | 252B | 87.3 | reg-alloc-instr-scheduling |
| `021ad284` | ov005 | 216B | 92.6 | register-choice |

**Median 5.2%. 2/20 (10%) at ≥85%. 16/20 (80%) below 50%. 8/20 at a flat
0.0%** (structural mismatches — extra/missing register-padding words, wrong
branch polarity, or compile-time argument-count errors on the more
speculative multi-stack-argument calls — not near-misses).

This shape does **not** look like an under-iterated sample waiting for one
more pass: the distribution is bottom-heavy with a long thin tail, not a pile
of 70-90%-ers. It is consistent with #1536's own Part 1/Part 2 comparison and
with `cm-main-tier-sweep-7` Part 2's 16% on the wider 200-376B band — this
20-sample simply landed lower, on a smaller n, which is expected sampling
variance in the same direction, not a contradiction.

### The P-20 row-offset wall, once more

5 of the 20 (all ov002) hit the confirmed `(self&1)*0x868` row-offset table
(`data_ov002_022cf16c`/`022cf178`/`022cf17c`/`022cf17c`/`022cf180`/`022cf1a4`
siblings) and reproduced the family's register-permutation residual with zero
exceptions — the same outcome as Part 1's 7/7 and Part 2's 8/8 in #1536. That
is now **20 consecutive hits across three independent rounds with zero
ships**, the strongest-evidenced wall in the whole campaign. `codegen-walls.md`
is updated below with this round's confirmations.

### A second wall gets its second independent confirmation

`func_ov005_021ad284` (this round, 92.6%) and `func_ov014_021b2eec` (#1536,
92.2%) are two **structurally-independent** functions — different modules,
different field offsets, different callees — that both reduce to a 3-case
mode-switch on a struct's first field, and both plateau on the identical
4-word `r0`-vs-`r1` register-choice residual for the switch selector,
unmoved by switch-vs-if/else, declaration order, or added dummy parameters.
This meets the campaign's own n=2/independent-provenance bar for a confirmed
member; recorded as a new named sub-variant under P-20 below
(`P-20-mode-switch-selector`).

## Answering the round's question

The decision thresholds, stated before this round ran:

- **≥25% ships** → the cap is not real, #1536's 0% was an effort artifact.
- **≤10% ships** → the cap is real at matched effort.
- **10-25%** → consistent with sweep-7 Part 2's 16%, workable but poor.

**Result: 0/20 = 0%.** Below the ≤10% line. Combined with #1536's own 0/40
and the effort-distribution argument the brain made before this round
started (Part 1 vs. Part 2 medians differ by only ~5 points, biased in Part
1's favor), and now this round's fully-matched-effort 0%, the honest position
is: **the cap is real.** Per `docs/research/post-small-pool-strategy.md`
Outcome B, this is the brief's recommendation to make explicit — not a
unilateral redirect this PR performs on its own, per that memo's own
statement that the owner re-orders it "by saying so in plain English."

## Gate

Three separate region gates, each `--clean`:

```
gx-spirit-caller_eur.nds: OK
[eur] SHA1 PASS

gx-spirit-caller_usa.nds: OK
[usa] SHA1 PASS

gx-spirit-caller_jpn.nds: OK
[jpn] SHA1 PASS
```

`check_activation_invariant.py` (`origin/main..HEAD`):

```
function .c added:       0
function .s deleted:     0
delinks activations:     0
data .c additions:       0 (informational)
check_activation_invariant: FAIL — no source or activation changes in the
  requested range; refusing a vacuous pass
```

**This FAIL is expected and correct, not a regression** — this round shipped
zero candidates, so there is genuinely nothing to verify: 0 `.c` added = 0
`.s` deleted = 0 activations = 0 shipped ledger rows, all self-consistently
zero. The tool's refusal to rubber-stamp a vacuous diff is exactly the
behavior the invariant exists to provide; treating a real zero as a pass
would be the actual bug.

`check_delink_dupes.py`: `OK (81 delinks.txt, no duplicate .text addresses)`.

`gate3.py --scope tests`: no new park-class raw values this round (all reused
existing mapped values from #1524/#1536: `reg-alloc`, `register-choice`,
`reg-alloc-instr-scheduling`, `P-20-row-offset`). `3328 passed, 15 skipped,
76 subtests passed, 0 failed`.

## Ledger

20 new `attempts.tsv` rows, all `result=parked`, all via `park_one.py`, none
hand-added. No `record_shipped.py` rows this round — genuinely zero ships,
not an omission.
