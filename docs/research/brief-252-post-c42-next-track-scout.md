[//]: # (markdownlint-disable MD013 MD041)

# Brief 252 — scout the next track after C-42

**Status:** survey + ranked next-track proposal, one byte-identical
pilot. Direct-mwcc only (no ROM build, no SHA1). All cohort counts are
EUR, computed against `build/eur/analysis/wall_predictions.json`
filtered to UNMATCHED picks via `next_targets.collect_matched_ranges`
(the `complete`-TU signal, same as the family hunter).

## Headline

**The next track is one more recipe-drain phase, not a strategic
pivot yet.** The exact-sibling vein that powered C-42 is mined out
(no clean family > 28 picks, all low-yield), BUT a *different* mature
wall is badly under-drained: **C-39 (bit-extract) is only 15% drained
in ov002** — 216 matched vs 1215 unmatched. The clean, recipe-ready
slice is **121 small sole-C-39 picks** (≤ 0x80), and the pilot
compiled **byte-identical first try** with the existing C-39 bitfield
recipe.

Recommendation order:

1. **Resume C-39 ov002 drain** (brief 254) — verified coercible,
   mature recipe, biggest clean vein. Highest near-term unit yield.
2. *Then* pivot. Of the three standing strategic tracks, the
   **permuter wave** ranks first (it is the only tool for the 1203
   no-prediction picks — the largest truly-unclassified cohort).
   `.s`→`.c` (574 files) is quality-only (0 `complete_units`).
   Track-2 long-form (933 funcs = 49% of unmatched bytes) is the
   long-run byte play but the lowest unit-throughput.

## (A) NON-C-42 unmatched cohort survey

### Per-wall ranking (sole-prediction = least ambiguous)

`predict_walls.py` is a multi-cue HINT classifier — C-1 and C-23 fire
on ~3700/3300 picks each and overlap heavily, so raw counts overcount.
The honest signal is **sole-prediction** picks (exactly one wall id),
unmatched:

| Wall | Sole-pred unmatched | Class | Note |
|---|---:|---|---|
| C-1 | 406 | coercible* | predication; over-fires, C-1r variant permanent — unpiloted, low confidence |
| StyleA | 348 | routing | `.legacy.c` epilogue; routing alone ≠ match (body must also transfer) |
| **C-42** | 322 | coercible | the cohort brief 253 is finishing |
| C-23 | 237 | routing | `.legacy.c` MMIO base-fold; over-fires |
| **C-39** | 164 | **coercible** | **bit-extract; 159 of 164 in ov002; pilot byte-identical** |
| C-36 | 112 | patcher | literal-tail trim trap (build-patcher concern, not a recipe) |
| C-15 | 76 | routing | legacy-tier peephole |
| P-11 | 51 | permanent | reg-allocator plateau |
| C-22 | 27 | coercible | adjacent-bitfield |
| P-9 | 22 | permanent | mvn/sub |

\* "coercible" is the wall *class*; it does not mean every sole-pred
pick drains. C-1/C-23 are flagged low-confidence (heuristic over-fire,
unpiloted this session).

### Exact-sibling families are exhausted (did not pan out)

`find_pattern_clusters.py --min-unmatched 2` (the exact `(size,
reloc-sig)` tool that drove C-42's high-yield waves) finds **73
ready-to-propagate clusters / 495 unmatched**, but the distribution is
flat and low-yield:

- Largest cluster: 28 unmatched, **33% est. yield [LOW]** (sig=0 —
  same-size zero-reloc leaf functions, a weak signal).
- The strongest signal (sig ≥ 1) clusters cap at ~17 unmatched.

There is **no next C-42** — no large clean exact-sibling family
remains. Falsification: `python tools/find_pattern_clusters.py
--version eur --min-unmatched 2 --top 30`; a family with ≥ 50
unmatched at ≥ 70% yield would disprove this — none exists.

## (A) Top candidate — C-39 bit-extract drain (ov002)

### Classification

Existing coercible wall **C-39** (bit-extract family; gotcha 6 +
sub-shapes a–e). Not a new wall — codegen-walls.md is untouched.
The finding is that it is **under-drained**, not that it is new.

| C-39 family in ov002 | Count |
|---|---:|
| matched (`complete`) | 216 |
| unmatched | 1215 |
| → of which sole-C-39 (clean) | 159 |
| → sole-C-39 and ≤ 0x80 (recipe-ready) | **121** (41 ≤ 0x40 + 80 ≤ 0x80) |

**Caveat (did not pan out as stated):** the raw "1215 unmatched"
overstates drainable work. 943 of the 1215 are > 0x80 — large
functions that merely *contain* a bit-extract, not clean C-39 thunks
(e.g. `func_ov002_02221b24` is a 6-case switch with one buried
`lsl#31;lsr#31`). Those belong to Track-2, not a C-39 drain. The
honest recipe-ready cohort is the **121 small sole-C-39 picks**.

### Recipe sketch (verified)

Pilot `func_ov002_0223fd2c` (0x28) orig:

```text
push  {r3, lr}
ldrh  r1, [r0, #2]      ; u16 field @ +2
lsl   r1, r1, #31       ; \ extract bit 0  (C-39: bitfield, NOT `& 1`)
lsr   r1, r1, #31       ; /
rsb   r1, r1, #1        ; 1 - bit0
lsl   r1, r1, #16       ; \ u16 zero-extend (0xffff is not an ARM imm,
lsr   r1, r1, #16       ; /  so this stays a shift-pair — coercible)
bl    func_ov002_0223dad0
mov   r0, #1
pop   {r3, pc}
```

Recipe (research artifact — not shipped):

```c
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };   /* bitfield @ +2 */
extern void helper(struct S *self, u16 arg);
int f(struct S *self) {
    helper(self, 1 - self->bit0);   /* bitfield read + 1-x + u16 cast */
    return 1;
}
```

**Falsification test (RESULT: passed):** compile the recipe at mwcc
2.0/sp1p5; predict byte-identical to orig. Outcome — **10/10
instructions identical** (`bl` differs only by the unlinked reloc).
Contrast probes confirm the mechanism: a plain `self->flags & 1`
(no bitfield) emits `and r1,#1` (wrong); `self->bit0 == 0` emits
`moveq/movne` predication (wrong). Only the bitfield + `1 - x` form
matches.

### Picks unblocked + expected yield

121 recipe-ready sole-C-39 ov002 picks. The cohort is C-39-*family*
but shape-diverse: the bit-extract is the common thread, wrapped in
different tails that map to **existing** catalog gotchas —

- clean `helper(self, bitexpr); return K` → base recipe (pilot,
  `func_ov002_02221af8`).
- XOR of two bitfields (`func_ov002_02204168`: `eor r0, bit0, bit14`)
  → gotcha 4 (XOR operand order) + gotcha 6.
- sign-check branch (`func_ov002_021f5058`: `movs; bpl`) → gotcha 5
  (if-then, not early-return).
- reg-alloc-sensitive arg order (`func_ov002_02221af8`: `mov r3, r0`
  to free r0) → gotcha 7.

Because the wrappers diverge, expect **70–90% yield** (the mature
catalog handles the wrappers, but not a single-recipe sibling drain
like C-42's best waves). Even at 70%, 121 picks ≈ 85 units — larger
than any remaining exact-sibling family.

## (B) The three standing strategic tracks

For *after* the C-39 drain thins. Cohort sizes (EUR, unmatched):

| Track | Cohort | `complete_units` yield | Notes |
|---|---|---|---|
| **Permuter wave** | 1203 no-prediction picks (1023 are 0x41–0x100) + 132 P-11 | low/pick (~10–30% hist.) but largest cohort | Only tool for the unclassified residue; automates source-form search. Slow. |
| `.s`→`.c` upgrade | 574 `.s` files | **0** (already `complete`) | Pure decomp-purity/maintainability; no metric gain. Some C-15/StyleA/C-23 punts may now have a `.c` recipe; C-31/32/34 are `.s`-mandatory. |
| Track-2 long-form | 933 funcs > 0x200 = **49% of unmatched bytes** (315 > 0x400) | very low/pick, high effort | Highest `matched_code_percent` lever; ov002 (414) + main (278). Lowest unit-throughput. |

**Recommended (of the three): permuter wave.** Rationale: the
no-prediction residue (1203) is the largest cohort with no recipe at
all — exactly what the permuter exists for — and it is unit-dense
(mostly medium 0x41–0x100 functions, not the giant Track-2 tail).
`.s`→`.c` yields zero units; Track-2 yields the most *bytes* but the
fewest *units* per session, so it is the long-run play, not the next
pivot.

This is a recommendation by cohort sizing, not a coercibility claim —
no permuter run was done this session (it needs the build harness, out
of direct-mwcc scope). The honest test for brief 254+ is: a permuter
batch over 20 no-prediction 0x41–0x80 picks; if it lands < ~3 matches,
the residue is harder than P-10/E-07-class and Track-2 should jump the
queue.

## Recommended pilot for brief 254

**Brief 254 = C-39 ov002 bit-extract drain, wave 1.** Pilot pick
`func_ov002_0223fd2c` (verified byte-identical this session). Worklist:
the 121 sole-C-39 ≤ 0x80 ov002 picks, smallest-first; lead with the
clean `bit-extract → helper → return K` shape, then the gotcha-4/5/7
wrappers. Pre-flight: recipe-gotchas.md gotcha 6 (bitfield not `&
MASK`). Hard cap + STOP-on-resist per brief 253's discipline; report
the clean-vs-wrapped split so the brain can time the permuter pivot.

## What did not pan out

1. **No next exact-sibling vein.** `find_pattern_clusters` tops out at
   28 unmatched / 33% yield — the C-42-style high-homogeneity play is
   over.
2. **"C-39 has 1215 left" overstates it.** 943 are big functions that
   only contain a bit-extract; the drainable clean cohort is ~121.
3. **C-1 (406) / C-23 (237) sole cohorts look large but are
   over-firing heuristics** (3772 / 3340 total fires) and include
   permanent variants (C-1r). Not piloted this session → flagged
   low-confidence, NOT recommended without their own falsification
   pilot.
4. **StyleA (348)** is a routing *hint*, not a match guarantee — the
   body must also transfer on the legacy tier. Unpiloted; deferred.

## Reproducibility

Cohort counts (re-runnable as the cohort drains):

```python
import json, sys; sys.path.insert(0, "tools")
from next_targets import collect_matched_ranges, is_addr_matched
from pathlib import Path
d = json.load(open("build/eur/analysis/wall_predictions.json"))
m = collect_matched_ranges(Path("config/eur"))
unm = {k: [p["id"] for p in v] for k, v in d.items()
       if not is_addr_matched(m, k.split(":")[0], int(k.split(":")[1], 16))}
# sole-prediction histogram, no-prediction count, per-module C-39, etc.
```

Pilot harness: exact `build.ninja` mwcc 2.0/sp1p5 cflags (drop `-MD`)
+ `arm-none-eabi-objdump -d -r --architecture=armv5te` (the arch flag
is required or `bx` mis-decodes). Orig truth = `dsd`-delinked
`build/eur/delinks/_dsd_gap@ov002_*.o`.

## Cross-references

- `docs/research/brief-251-c42-family-hunter-and-drain-wave7.md` —
  C-42 histogram + pivot recommendation this brief acts on.
- `docs/research/codegen-walls.md` § C-39 — the wall being resumed.
- `docs/research/recipe-gotchas.md` — gotchas 4 / 5 / 6 / 7 (the C-39
  wrapper recipes).
- `tools/find_pattern_clusters.py`, `tools/predict_walls.py`,
  `tools/c42_family_hunter.py` — the landscape tooling used.
