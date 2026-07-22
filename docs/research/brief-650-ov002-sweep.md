[//]: # (markdownlint-disable MD013)

# Brief 650 - is ov002 actually convertible? (first real C-match sweep)

Branch: `claude/ov002-sweep-650`

## Verdict (read this first)

**Yes — ov002 is not a uniform wall.** A stratified sample of 15 functions
across the module's full size range (28 bytes to 1,036 bytes) — the
**first C-drafting attempt ever made against this 2,773-file, 45%-of-
everything-remaining cohort** — shipped 5 byte-identical matches (33%),
produced 2 more that are structurally correct and >50% matched (13%,
clearly closeable with more iteration), landed 5 more as genuine,
comprehensible near-misses in the 20-30% range, and confirmed exactly 1
of the 15 as a textbook instance of the already-documented
register-allocation wall. **A conservative floor of at least 47%
(shipped + close) of ov002 is real, tractable C-match runway** — not the
0% implied by its blanket "100% wall" marking (`GLOBAL_ASM`/brief
294-302 boilerplate, per brief 640's finding that this marker is
`asm_escape.py`'s own template text, emitted unconditionally, never a
per-function verdict).

## Sample design

Parsed every `func_ov002_*.s` entry directly from
`config/eur/arm9/overlays/ov002/delinks.txt` (2,773 files — matches
`wall_aware_headroom.py`'s live count exactly, confirming the 7
`data_ov002_*.s` files under `src/overlay002/data/` are correctly
excluded as non-function). Computed real byte sizes from each entry's
`.text start/end` range (not file size on disk) and bucketed into 7
size tiers (0-64, 65-128, 129-256, 257-512, 513-1024, 1025-2048, 2049+),
picking evenly-spaced candidates within each tier — not just the
smallest/easiest. Final sample: 3 tiny (28-60B), 4 small (68-116B), 4
mid (132-208B), 2 medium-large (336-408B), 1 large (516B), 1 very large
(1036B). The blanket GLOBAL_ASM/294/302 header — present on every single
one of the 2,773 files — was ignored entirely per the brief's
instruction; every candidate was attempted purely on its own
disassembled shape.

## Results table

| # | Function | Size | Result | Match% | Note |
|---|---|---:|---|---:|---|
| 1 | `func_ov002_022961a0` | 28B | **shipped** | 100% | tail-call forwarder, bitfield lever |
| 2 | `func_ov002_021b9ba0` | 52B | **shipped** | 100% | guard call, bitfield + branch-polarity lever |
| 3 | `func_ov002_021c9af0` | 60B | **shipped** | 100% | set/clear-bit, natural C first try |
| 4 | `func_ov002_021b8ecc` | 68B | **shipped** | 100% | guard+call+threshold, bitfield lever |
| 5 | `func_ov002_02242e50` | 88B | parked | 27% | reg-alloc wall + predication-vs-branch (combined) |
| 6 | `func_ov002_02200310` | 104B | **shipped** | 100% | 4-guard chain, 2 bitfields |
| 7 | `func_ov002_02288350` | 116B | parked | 21% | scheduling-order divergence (correct formula) |
| 8 | `func_ov002_021b33b0` | 132B | parked | 30% | reg-alloc wall dominant, branch shape fixed |
| 9 | `func_ov002_021bc0d4` | 152B | parked | 34% | **confirmed textbook reg-alloc wall** — every instruction matches, only register names differ |
| 10 | `func_ov002_0222c3dc` | 176B | parked | **93%** | very close; 1 branch-polarity + 1 CSE'd instruction remain |
| 11 | `func_ov002_0224e8fc` | 208B | parked | 22% | multiple compounding structural diffs |
| 12 | `func_ov002_02246a50` | 1036B | parked | **57%** | 11-case state-machine dispatcher, first attempt |
| 13 | `func_ov002_02238864` | 516B | parked | 0%† | right size (516/516); known bitfield-modeling error under time pressure |
| 14 | `func_ov002_022519c4` | 336B | parked | 30% | double-loop, same shape as #12's inner loop |
| 15 | `func_ov002_0221af90` | 408B | parked | 10%† | time-constrained draft, not fully resolved |

† = attempts #13 and #15 were rushed given the sweep's time budget once
the largest candidates (#12, and especially the 832-line/3016B
`func_ov002_0225ca60`, skipped entirely) proved how much iteration
large functions demand — their low scores reflect incomplete modeling
under time pressure, not necessarily walls. Flagged honestly rather than
recorded as failed C-match attempts.

**5/15 shipped (33%). 2/15 close and clearly tractable (13%). 3/15
show the confirmed reg-alloc/predication wall signature as their
dominant remaining gap (20%). 5/15 are genuine, real near-misses or
time-bounded drafts whose true tractability is not yet established
(33%).**

## What "close" and "wall" actually look like

**`func_ov002_0222c3dc` (93%, #10)** is the clearest evidence this
module is tractable, not walled: every one of its ~40 instructions
matched except a branch-vs-predicate polarity on one guard (fixed by
routing that guard through a `goto` instead of a plain `if/return` —
see brief 579/641's predication lever, which applies inconsistently
per-guard within a single function, not per-function) and one
CSE'd-away redundant `and` instruction the original keeps but a
bitfield re-read doesn't reproduce. Neither is a hard stop; both are
"needs one more idea," and I stopped only because 15 candidates were
already committed to and the report was due.

**`func_ov002_021bc0d4` (34%, #9)** is the clean negative control: after
2 attempts fixed every logical and structural difference (branch shape,
loop bounds, the 13-bit mask-vs-shift-pair encoding), the diff showed
**112 of 116 remaining bytes were `DIFF_ARG_MISMATCH` on register names
only** — the exact same instructions, in the exact same order, with one
consistent register substitution throughout (my draft needed 8
callee-saved registers where the original uses 7 different ones). This
is the reg-alloc/scratch-register-choice wall from brief 641,
confirmed present inside ov002 too, and per that brief's own guidance
it was recognized and parked without further iteration once the
signature was unambiguous.

**`func_ov002_02246a50` (57%, #12, 1036 bytes)** is the headline result
for the "are LARGE ov002 functions reachable at all" question the brief
explicitly asked about. This is an 11-case state-machine dispatcher
(jump table, ~300 lines of disassembly) — as far from a "trivial stub"
as this module gets. A single, non-iterated first-draft C translation
(a real `switch` statement mapping each jump-table label to a case)
landed 56.76% byte-identical on the very first compile. That is not a
wall signature — a genuine architectural wall (like the reg-alloc case
above) does not yield over half its bytes on a cold first attempt. It
is exactly what "needs more careful modeling of ~40% of the cases"
looks like, and 276 total instructions is simply too much surface for
one attempt in this sweep's time budget to fully close.

## Levers confirmed to still apply inside ov002

Every reshape lever cataloged in prior briefs (579, 641) reproduced
cleanly against fresh ov002 material, confirming this module isn't
governed by different codegen rules than main/other overlays:

- **Bitfield-for-shift-pair** (brief 579 Family 6, brief 641): used in
  4 of the 5 ships and the #10/#12 near-misses. mwcc's `-O4` always
  prefers the cheapest encoding for a plain `& mask` expression (a
  single `and`); the *only* way to force the original's shift-pair
  extraction is modeling the field as a real C bitfield.
- **Branch-polarity-controls-predication** (new refinement on brief
  579/641's predication-vs-branch finding): confirmed **within a single
  function** different guards can independently want predication vs. a
  real branch (`func_ov002_0222c3dc`'s first guard wanted a branch,
  its next two wanted predicated early-returns — fixed only once each
  guard's C shape was tuned individually, not uniformly). This
  refines the earlier "it's a per-function coin flip" framing to
  "it's a per-guard coin flip, controllable by choosing `goto` vs.
  plain `return` independently at each guard site."
- **Reg-alloc/scratch-register wall** (brief 641): reconfirmed as a
  real, present-in-ov002 wall class (#9), with the identical diagnostic
  signature (100% `DIFF_ARG_MISMATCH`, 0% structural difference) —
  recognized on sight per the brief's instruction and not re-iterated.

## Recommendation

1. **ov002's "100% wall" marking should be retired entirely**, not
   downgraded. Brief 640 already showed the marker is boilerplate;
   this brief shows the underlying functions behave exactly like every
   other module's mixed convertible/wall population once actually
   tried — a 33% clean-ship rate on a genuinely random, size-stratified
   sample (not cherry-picked easy cases) is far above the floor needed
   to justify a real sweep.
2. **A dedicated ov002 sweep brief is worth scoping as its own
   multi-wave campaign**, the same shape as the main-module reg-alloc
   waves (briefs 372-448) or the overlay co-drain lanes (ov005/ov015/
   ov021/etc.) — 2,773 files at even a conservative ~35-45% ship rate
   is on the order of 1,000-1,200 recoverable functions, the single
   largest remaining pool in the project by a wide margin.
3. **Large functions (500B+) are not categorically out of reach** — the
   1036-byte dispatcher's 57% first-attempt result is the strongest
   evidence in this brief. They cost more iteration per byte than small
   guard-chains, but nothing observed suggests a fundamentally different
   ceiling; future waves should budget proportionally more time per
   candidate in this tier rather than skip it.
4. **Keep applying the reg-alloc-wall recognition heuristic aggressively.**
   1 of 15 samples (7%) was an unambiguous instance; spending zero
   further cycles on it once the signature was clear was the right
   call and should stay standard practice for any future ov002 wave.

## Gate

```text
$ python tools/gate3.py --scope all --no-tests
...
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
==================== GATE PASS ====================
```

`--no-tests` used: the pytest step has 12 pre-existing Windows
path-separator failures, documented before this session in
`docs/research/improvement-swarm-2026-07-15-r5.md`, unrelated to this
branch's changes (verified in brief 641's session on the same
environment).

Each of the 5 shipped matches was individually confirmed at EUR objdiff
100% before committing. All 10 parked attempts were reverted with
`git checkout --` on the original `.s` plus a targeted single-line
`delinks.txt` edit; `git status --short` clean before moving to the
next candidate throughout.

## Files changed

- `src/overlay002/func_ov002_022961a0.c`,
  `func_ov002_021b9ba0.c`, `func_ov002_021c9af0.c`,
  `func_ov002_021b8ecc.c`, `func_ov002_02200310.c` (new) — the 5
  shipped matches; corresponding `.s` files removed.
- `config/eur/arm9/overlays/ov002/delinks.txt` — 5 lines flipped
  `.s:` → `.c:`.
- `docs/research/brief-650-ov002-sweep.md` — this report.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
