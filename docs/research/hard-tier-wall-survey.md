# Brief 220 — Hard-tier wall classification survey

**Brief:** 220 (scaffolder, research-only). Map the 7,911 hard-tier
unmatched picks to wall families so brain can scope decomper drains
for the next 5-10 rounds.

## Headline

Of **7,911 hard-tier unmatched picks**:

- **5,702 (72.1%)** fire at least one wall prediction. Most fire
  multiple — 68.4% of the classified picks fire 2+ walls (mean
  1.51 walls per pick).
- **2,209 (27.9%)** are **unclassified** (no `predict_walls.py`
  detector fires). Breakdown below — the biggest single
  recognisable pattern in this slice is a non-leaf C-37 variant
  (`lsl #31; lsr #31` bit-extract wrapped in helper-call code,
  ~454 picks, 20.6% of unclassified) which is a candidate **C-39**
  classification.
- **C-1 + C-23 co-dominate** the hard tier — 2,933 picks fire
  BOTH (37% of all hard-tier picks). These are large MMIO /
  predicated-execution helpers; recipes exist
  (`.legacy.c` routing) but byte-matching is iterative.
- **StyleA + C-33 small-function cluster** — 530 picks fire
  both, median 60-140 B. Brief 216's C-38 recipes apply to a
  big chunk of these.
- **Hard-tier size distribution**: 87% are 64 B or larger;
  median size 168 B; long tail to 7,832 B (mega-function).

## Hard-tier wall histogram (top 13 families)

The "% of picks" column is the per-family hit rate against the
7,911 hard-tier unmatched picks — picks firing multiple walls
are counted in each family's row.

| Family | Hits | % of picks | Solo% | Size p25 / med / p75 | Top co-occurrences |
|--------|-----:|-----------:|------:|---------------------:|-------------------|
| C-1     | 3780 | 47.8% | 11.7% | 152 / 256 / 472 | C-23, C-36, C-15 |
| C-23    | 3357 | 42.4% |  8.2% | 168 / 276 / 508 | C-1, C-36, C-15 |
| C-36    | 1223 | 15.5% | 21.7% | 140 / 244 / 424 | C-1, C-23, C-15 |
| StyleA  | 1157 | 14.6% | 30.7% |  60 /  84 / 140 | C-33, C-1, C-38 |
| C-15    |  826 | 10.4% | 11.0% | 144 / 292 / 632 | C-1, C-23, C-33 |
| C-33    |  774 |  9.8% |  0.0% | 116 / 168 / 300 | StyleA, C-1, C-15 |
| C-22    |  270 |  3.4% | 12.2% | 332 / 636 / 1176 | C-1, C-23, C-15 |
| C-38    |  222 |  2.8% |  0.0% |  48 /  68 / 100 | StyleA (always), C-33 |
| P-9     |  211 |  2.7% | 12.8% | 108 / 240 / 608 | C-1, C-23, C-15 |
| P-11    |  132 |  1.7% | 38.6% | 100 / 108 / 112 | C-33, C-1, C-15 |
| C-32    |   18 |  0.2% |   …   |   —             | —                |
| C-24    |    5 |  0.1% |   …   |   —             | —                |
| C-34    |    1 | <0.1% |   …   |   —             | —                |

C-37, C-31, C-35 don't appear in hard-tier — they're easy-tier
shapes already drained (brief 217's wave + brief 214/204/192
worked examples).

## Compositeness — walls per function

| Walls/function | Picks | % |
|----------------|------:|--:|
| 0 (unclassified) | 2209 | 27.9% |
| 1 | 1550 | 19.6% |
| 2 | 2517 | 31.8% |
| 3 | 1216 | 15.4% |
| 4 |  355 |  4.5% |
| 5 |   60 |  0.8% |
| 6 |    4 | <0.1% |

Most hard-tier picks fire multiple walls. This means brain can't
budget by-family — the decomper has to handle the COMPOSITE
shape, which is what makes hard tier hard.

The 2-wall picks (2,517, 31.8%) are mostly **C-1 + C-23** stacks
— large MMIO-touching functions with predicated execution. The
recipe is "ship via `.legacy.c` + retry iteration" — same as
brief 203's E-07 worked example.

## Size distribution

| Band | Picks | % |
|------|------:|--:|
| tiny (<32B) | 4 | 0.1% |
| small (32–64B) | 1109 | 14.0% |
| mid (64–128B) | 2157 | 27.3% |
| large (128–256B) | 2268 | 28.7% |
| huge (256–512B) | 1428 | 18.1% |
| mega (≥512B) | 945 | 11.9% |

**74% of hard-tier picks are mid-or-larger** (64+ B). This is the
opposite of the easy tier which was dominated by tiny leaves.
The mid/large bucket is where C-1 + C-23 + C-15 + C-33 stacks
live; the mega bucket is mostly large dispatch / state-machine
functions.

## Per-family profiles

### C-1 — Predicated-execution chain (3780 picks, 47.8%)

The single biggest wall in hard tier. Functions where mwcc 2.0
emits predicated execution (`movne r0, #1; moveq r0, #0; bxeq
lr; ...`) for early-return-equivalent C source. Recipe documented
extensively (codegen-walls.md § C-1) — explicit `goto` to force
branch form, or restructured `if/else` chains.

**Sub-pattern variations to note:**

- Often co-occurs with C-23 (2933 of 3780 — 77.6%): the same
  large functions touch both MMIO and have predicated chains.
  Recipe-stack: `.legacy.c` + matching `if/else` shape.
- 444 picks (11.7%) are solo C-1 — pure predicated-execution
  functions with no MMIO. Cleanest C-1 worked examples likely
  live here.

**Recommendation:** **brief 222+ should batch-attempt solo C-1**
(444 picks) first to refine the recipe before tackling the
C-1+C-23 stacks. Decomp.me-style permuter assistance may help
for the iterative shape-coercion.

### C-23 — MMIO base-folding + ANDS→TST peepholes (3357 picks, 42.4%)

The "touches I/O registers via a base pointer" wall. mwcc 2.0
folds `*(base + offset)` patterns into MMIO-direct loads and
collapses `(x & N) != 0` into TST peepholes. Recipe: route
through `.legacy.c` (mwcc 1.2/sp2p3) which lacks the folding /
peephole. Documented in codegen-walls.md § C-23.

**Sub-pattern variations to note:**

- Heavy overlap with C-1 (2933 picks): when functions touch MMIO
  AND have predicated execution, you need BOTH recipes
  simultaneously. Brief 203's `OSi_PostIrqEvent.legacy.c` is
  the canonical worked example.
- 276 picks (8.2%) are solo C-23 — pure MMIO toucher with no
  predication. Recipe is just `.legacy.c`.

**Recommendation:** **brief 222+ should drain solo C-23 first**
(276 picks) — these are mechanical `.legacy.c` ships, similar
to brief 199's pick #5. Likely the largest single-recipe drain
opportunity in hard tier.

### C-36 — Literal-tail trim trap (1223 picks, 15.5%)

⚠️ **C-36 is a build-system fix indicator, not a source-side
recipe.** Brief 208 shipped the patcher fix; C-36 now flags
picks where the orig has a small-literal pool tail (`.word
0x7fff` and similar). For `.s` ships, the brief 208 patcher
guards against trim corruption. For `.c` ships, the literal
becomes part of the natural pool layout — usually irrelevant.

**Sub-pattern variations to note:**

- 265 picks (21.7%) are solo C-36 — these are picks where ONLY
  the trim-trap is the issue. If the rest of the codegen is
  natural, plain `.c` should work directly.
- 784 picks co-occur with C-1; 747 with C-23. The compound is
  "C-1/C-23 stack + literal pool tail" — the C-36 component is
  the build-system fix; the source-side wall is C-1/C-23.

**Recommendation:** **C-36 is informational** for the decomper;
don't drain C-36 as its own bucket. Drain by primary wall
(C-1/C-23) and C-36's build-system handling kicks in
automatically.

### StyleA — Style A epilogue routing (1157 picks, 14.6%)

The `ldmfd sp!, {regs}; bx lr` (vs Style B `pop {regs, pc}`)
epilogue shape that mwcc 2.0/sp1p5 doesn't emit. Recipe: route
through `.legacy.c` (mwcc 1.2/sp2p3). Documented in
codegen-walls.md § StyleA.

**Sub-pattern variations to note:**

- 530 picks co-occur with C-33 (`.legacy.c` cascade risk) —
  these are small `src/main/` functions where `.legacy.c`
  routing might cascade-shift ov004. Brief 194's patcher fix
  unblocks the build; byte-match may still need iteration.
- 222 picks co-occur with C-38 (Wall 2 leaf-no-pool reg-alloc)
  — brief 216 documented these. C-38 recipes work but only on
  the 4 brief-216 sub-shapes; the rest may need new recipe
  research (see "Brief 216 deferred canaries" note below).
- 355 picks (30.7%) are solo StyleA — these are clean
  `.legacy.c` candidates without further codegen issues.

**Recommendation:** **brief 222+ should batch the 355 solo StyleA
picks** for a clean `.legacy.c` drain. Size-cluster around 60-
140 B median; many are leaf or near-leaf helpers.

### C-15 — Constant-pair derivation (826 picks, 10.4%)

The `mvn r1, #0` (orig) vs `sub r1, r0, #1` (mwcc 2.0) shape on
flat-thunk arg setup. Recipe: route through `.legacy.c`
(mwcc 1.2/sp2p3) or `.legacy_sp3.c` (mwcc 1.2/sp3). Brief 044's
3-tier routing decision handles this.

**Sub-pattern variations to note:**

- Heavy overlap with C-1 (529 picks) and C-23 (474 picks) —
  C-15 is rarely solo (11.0%). The recipe-stack for the typical
  C-15 pick is "C-15 routing decision + C-1/C-23 source-shape
  iteration."

**Recommendation:** **don't drain C-15 in isolation** — it's a
routing-decision compound layered over C-1/C-23. When drainin
C-1 or C-23 picks, C-15 just dictates which mwcc tier to use.

### C-33 — `.legacy.c` cascade risk (774 picks, 9.8%)

Composite over StyleA + C-15 — flags `src/main/` picks where
`.legacy.c` routing would trigger Cluster F's ov004 cascade
(brief 193). Brief 194's per-section modal-deviation cap fixed
the cap; this classifier flags risk.

**Recommendation:** **C-33 is informational** like C-36. Don't
drain C-33 directly; it'll be handled when its co-occurring
wall (StyleA or C-15) is drained.

### C-22 — Adjacent bitfield write (270 picks, 3.4%)

`(v & ~mask) | (a<<8) | (b<<12)` patterns where mwcc 2.0 emits
2+ adjacent `bic; orr` pairs. Recipe: declare as a C bitfield
struct and use the bitfield syntax. Recipe documented in
codegen-walls.md § C-22.

**Sub-pattern variations to note:**

- These are LARGE functions (med 636 B, max 7832 B) — typically
  state-update routines with many bitfield manipulations.
- 33 picks (12.2%) are solo C-22 — these may be the cleanest
  starting points.

**Recommendation:** **C-22 drain needs careful struct work** —
each pick requires the right bitfield struct declaration to
match orig's bit-positions. Brief 222+ could profile the
~33 solo picks for a recipe-refinement wave.

### C-38 — Leaf-no-pool reg-alloc (222 picks, 2.8%)

Brief 216 shipped 4 recipes (A: re-deref+char-cast,
B: substruct-ptr, C: ldrh-orr packing, D: volatile loads).
ALWAYS co-occurs with StyleA. Median size 68 B.

**Sub-pattern variations to note:**

- Brief 216 deferred 3 canaries (`func_0207d304`, `_02078ed8`,
  `_02078eec`) — sub-pattern variations the 4 recipes didn't
  cover. Predict_walls fires StyleA + C-38 on all 3.
  Variant-matrix work on these could extend C-38 (candidate
  for brief 223+ scaffolder follow-on).

**Recommendation:** **brief 222 can drain the 222 C-38 picks
mechanically** via brief 216's 4 recipes. The 3 deferred
sub-patterns are brief 223+ scaffolder territory.

### P-9 — Conditional mvn-write (211 picks, 2.7%)

`mvn{cond} rN, #0` peephole absent from mwcc 2.0. Permanent
under current tools (codegen-walls.md § P-9). Documented as
permanent; ship affected picks as `.s`.

**Recommendation:** **P-9 picks ship as `.s`** — no source
recipe found. Brief 222+ should NOT prioritize P-9 drain
(low-yield iteration); ship mechanically as `.s` when they
surface.

### P-11 — mwcc 2.0 reg-allocator plateau (132 picks, 1.7%)

Brief 200 classified — mwcc 2.0/sp1p5 reg-allocator plateau on
mid-size helper-call functions (100-120 B). 38.6% solo. Brief
200 ruled out all source-form interventions for the 5 brief-
198 picks. Permanent under current tools.

**Sub-pattern variations to note:**

- Tight size cluster (med 108, p25=100, p75=112) — these are
  100-120 B helper functions with helper-call-in-body.
- High solo rate (38.6%) — these are pure P-11, not stacked
  with other walls.

**Recommendation:** **P-11 picks ship as `.s`** — same as P-9.
Brief 222+ should NOT attempt P-11 source recipes; the brief
200 falsification is comprehensive.

## Unclassified slice (2,209 picks, 27.9%)

Picks where `predict_walls.py` fires zero detectors. Pattern
buckets:

| Pattern | Count | % of unclassified | Candidate classification |
|---------|------:|------------------:|------------------------|
| OTHER-2-3bl (generic helper-call wrapper, 2–3 bl) | 568 | 25.7% | _(varied; no single signature)_ |
| **bit-extract `<<31` (in non-leaf shape)** | 376 + 78 composites = **454** | **20.6%** | **C-39 candidate** (non-leaf C-37) |
| OTHER-1bl (single helper call, otherwise straight code) | 425 | 19.2% | _(varied)_ |
| OTHER-many-bl (4+ helper calls) | 395 | 17.9% | _(varied)_ |
| **multiply-accumulate (`mla` insn)** | 150 + 50 composites = **200** | **9.1%** | indexed struct access |
| OTHER-leaf (no helper calls, no recognised pattern) | 116 | 5.3% | _(varied)_ |
| bitfield-extract (`lsl 17-19; lsr 21-27`) | 87 | 3.9% | partial-byte field extract |
| blx-indirect (function-table dispatch) | 50 | 2.3% | dispatch table calls |
| byte-extract (`lsl 24; lsrs 24`) | 23 | 1.0% | C-37 Shape B non-leaf variant |
| ldm-stm-loop (block copy) | 1 | 0.0% | memcpy-equivalent |

### Candidate C-39 — non-leaf C-37 (bit-extract + helper wrapper)

The 454 picks containing `lsl #31; lsr #31` bit-extract in a
non-leaf context (with `bl` calls before/after) are
structurally similar to the C-37 Shape A pattern (brief 214)
but wrapped in helper-call code. Example shape:

```asm
push  {regs, lr}
mov   r4, r0                          ; save self
ldrh  r1, [r0, #N]                     ; load halfword field
lsl   r1, r1, #31                      ; bit-extract (C-37 pattern)
lsr   r1, r1, #31
bl    helper_func                      ; call with extracted bit
[cmp r0, #0; movXX r0, #1/#0]         ; sometimes
pop   {regs, pc}
```

Current C-37 detector fires only on the LEAF form (lsl/lsr
right before `bx lr`). The non-leaf variant doesn't trigger
the existing detector because the lsl/lsr sequence is mid-
function.

**Candidate recipe**: brief 218's bitfield struct read (Shape
B recipe) likely applies — the bitfield extract emits the
explicit lsl/lsr pair under mwcc 2.0. If the wrapper code is
natural-C-compileable, the whole non-leaf function should
reach orig.

**Recommendation:** **brief 223+ scaffolder** — pilot 5 picks
from this slice with the bitfield-struct recipe. If 3+ ship,
extend C-37 detector to recognise the non-leaf shape and
classify as C-39.

### Candidate "indexed-struct-access" — MLA-emitting (200 picks, 9.1%)

The 200 picks containing `mla rD, rN, rM, rA` (multiply-
accumulate) are typically indexed struct array accesses:
`struct[idx].field` where mwcc emits `mla` to compute
`base + idx * stride`. Common in state-machine functions
with table-driven dispatch.

**Recommendation:** **lower priority** — these are usually
NOT a wall (mwcc and orig both emit `mla`); they ended up
unclassified because the function has no other distinctive
wall. Ship as plain `.c` and most should work. Worth running
a small wave to confirm.

### Other patterns

- **bitfield-extract `lsl 17-19; lsr 21-27`** (87 picks) —
  partial-byte field extraction (e.g., extract bits 8:15).
  Brief 218's bitfield recipe likely applies; could be a
  C-39 sub-shape.
- **blx-indirect** (50 picks) — function-pointer table
  dispatch. Often C-24 in spirit but doesn't trigger the
  detector (different code surrounding).
- **byte-extract `lsl 24; lsrs 24`** (23 picks) — these are
  the NON-LEAF C-37 Shape B variant. Brief 218's bitfield
  recipe applies.
- **ldm-stm-loop** (1 pick) — single block-copy function
  (`func_02012418`). Probably needs `memcpy` or a specific
  loop-copy idiom.

## Brief 222+ scoping recommendations

Based on the histogram + size distribution, the highest-yield
drains for the next 5-10 brain rounds:

1. **C-23 solo drain** (276 picks, mechanical `.legacy.c`) —
   biggest single-recipe drain opportunity in hard tier.
2. **C-1 solo drain** (444 picks, source-restructure +
   `.legacy.c` per case) — second biggest, but more iterative
   per pick.
3. **StyleA solo drain** (355 picks, mechanical `.legacy.c`,
   small functions med 84 B) — fast yield.
4. **C-38 brief 216 recipes** (222 picks) — already-locked
   recipe set; mostly mechanical drain.
5. **C-22 solo drain** (33 picks) — small high-quality batch
   for bitfield recipe refinement.
6. **C-39 pilot (non-leaf C-37 via bitfield)** (~454
   candidates if recipe holds) — scaffolder research first
   (brief 223+), then drain.
7. **Unclassified MLA picks** (~150 solo) — likely no wall,
   try plain `.c`.

**Don't prioritize:**

- C-1 + C-23 + C-15 + C-33 compound stacks (~2,500 picks) —
  these are the iterative core; budget 2-5 picks per round
  rather than batch drains.
- P-9 + P-11 picks (~340 total) — permanent under current
  tools; ship as `.s` mechanically.
- C-36 / C-33 standalone — informational compound classifiers;
  no source-side recipe.

## Methodology notes

- `tools/predict_walls.py` full scan on EUR (`mwcc 2.0/sp1p5`
  default tier) produced `build/eur/analysis/wall_predictions.json`
  in ~3 min on the scaffolder host (9,849 functions).
- `tools/next_targets.py` filtered to hard-tier unmatched
  (7,911 picks).
- Histogram script at `/tmp/brief220/histogram.py` (development
  scaffold, not committed); pattern-bucketer at `/tmp/brief220/`
  similarly.
- Unclassified pattern characterization sampled 20 picks for
  manual inspection; full 2,209-pick pattern bucketing via
  disasm + regex.

## Cross-references

- `docs/research/codegen-walls.md` — full wall taxonomy.
- `docs/research/wall-2-leaf-no-pool-reg-alloc.md` — C-38
  recipes (brief 216).
- `docs/research/bit-test-0-or-1-idiom.md` — C-37 Shape A
  + Shape B (brief 214 + 218 bitfield recipe).
- `docs/research/brief-218-wall-1-broader-and-shape-b.md` —
  P-4 extension + Shape B bitfield recipe.
- `build/eur/analysis/wall_predictions.json` — raw predict_walls
  output (regenerable via `python3.13 tools/predict_walls.py
  --version eur`).
- `build/eur/analysis/next_targets.json` — raw worklist
  (regenerable via `python3.13 tools/next_targets.py --version
  eur`).
