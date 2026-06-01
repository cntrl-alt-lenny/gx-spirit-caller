[//]: # (markdownlint-disable MD013 MD041)

# Brief 292 — consolidate the `.s` generators + characterize the hard bucket

**Status:** consolidated + mapped. decomp.me / research / tools only — no
SHA1, no `.c`/`.s` shipped. Fetched content as data. **Headline: the two
wave-9 `.s` generators are now one (`tools/asm_escape.py`, REFUSE-guarded +
self-verifying; `gen_asm_tu.py` retired). The hard bucket is mapped: of the
remaining unmatched ov002 (3156 funcs / 1.05 MB), the current toolkit
(hand-drain + `.s` hatch) reaches ~50 % of bytes (non-loop shape); ~46 % is
reg-alloc-walled (the 85 %-call-in-loop loop cohort + big call-heavy
functions) and needs a future tool. The permuter helps scheduling but not
reg-alloc, even on the larger functions where it has slack.**

## (A) Consolidation — one `.s` generator

Wave 9 produced two `.s` escape-hatch generators in parallel:
`tools/asm_escape.py` (brief 290 — REFUSE-guarded + self-verifying, from
byte-near C) and the decomper's `tools/gen_asm_tu.py` (brief 291 — a
straight m2c-GAS→mwasm converter, no guard/verify). Standardised on
`asm_escape.py`:

- **Folded in** the syntax coverage `gen_asm_tu.py` had that `asm_escape.py`
  lacked: **conditional shifts** (`lsleq r0,r0,#1` → `moveq r0,r0,lsl #1`)
  and **`b`/`blx`** external-call symbol substitution (not just `bl`).
- **Retired** `tools/gen_asm_tu.py` + `tests/test_gen_asm_tu.py` (the 83
  wave-9 `.s` already shipped are static mwasm TUs — generator-independent).
- Tool index regenerated; `asm_escape.py` tests now 18 (CI-safe, no build).
- **Regression:** the residue picks still generate byte-identical `.s`
  through the consolidated tool (`021ec094`, `021f15a8` re-verified ✅).

Brief 293 points the decomper at `asm_escape.py`, so the retire is
collision-free.

## (B1) The loop cohort — 85 % is call-in-loop reg-alloc-walled

Sub-classified the **576** ov002 `<0x100` loop functions (the brief-284
"permuter" class) by loop-body structure (back-edges, calls-in-loop,
register pressure):

| sub-class | count | % | hand-matchable? |
|---|---:|---:|---|
| simple-leaf (1 back-edge, no call, ≤5 regs) | 15 | 3 % | ✅ counted-loop (e.g. string copy) |
| borderline-leaf (1 back-edge, no call, ≤7 regs) | 42 | 7 % | maybe (per-func) |
| **call-in-loop** | **490** | **85 %** | ❌ reg-alloc-walled |
| nested / multi back-edge | 16 | 3 % | ❌ |
| high-pressure leaf (>7 regs) | 13 | 2 % | ❌ |

**The dominant waller is a call inside the loop** (85 %): a `bl` in the loop
body forces callee-saved spills + clobbers across the back-edge, and mwcc's
register allocation across that almost never matches by-construction. Only
the **15 simple-leaf** loops (single back-edge, no call, ≤5 live regs — e.g.
`func_ov002_021aeb00`, a `ldrsb`/`strb` counted string copy) are reliably
hand-matchable; ~42 borderline are per-function. So the loop cohort is
**~10 % hand-reachable, ~90 % reg-alloc-walled**.

## (B2) Permuter pilot on `>0x200` functions

Brief 288 found the permuter plateaus on the *tight* accessors (no
scheduling slack). The opposite test — does it crack the **larger** funcs
where it has slack? Piloted (`decomp-permuter`, `-j 4`, ~200 s each) on two
`>0x200` no-loop funcs with the brief-276 m2c seeds:

| func | size | divergence | base → best (iters, ~200 s `-j 4`) | match? |
|---|---|---|---|---|
| `021d91e0` | 0x200 | scheduling-type | **1775 → 1115** (1139) — 37 % better | ❌ no |
| `021b05d0` | 0x28c | reg-alloc-type | **690 → 690** (839) — 0 improvements | ❌ hard plateau |

The larger functions **do** give the permuter the reschedulable slack the
tight accessors lacked (brief 288): on `021d91e0` it cut the score 37 %
(1775→1115) — real scheduling progress. But it reached **0 matches** on
either, and `021b05d0` (the reg-alloc-dominated pick) is a **hard plateau**
(0 improvements over 839 iterations), reproducing brief 276 exactly.

This matches brief 276 (it ran the same two earlier): the permuter **helps
the scheduling-type divergence** (it has the reschedulable slack on larger
funcs that the tight accessors lacked) **but plateaus on the reg-alloc-type
divergence** that dominates the band. **Size/slack is necessary but not
sufficient — the wall is reg-allocation, the same wall as the loop cohort
and the tight accessors, just a different manifestation.** The permuter does
not, on its own, close a `>0x200` reg-alloc gap to byte-exact.

## (B3) Completion-ceiling estimate

Remaining unmatched ov002: **3156 funcs / 1,045,476 bytes**
(`<0x100` 2041 / 274 KB, `0x100-0x200` 695 / 244 KB, `>0x200` 420 / 527 KB —
the `>0x200` band is **50 %** of remaining bytes). Reachability by the
current toolkit (hand-drain + `.s` hatch):

| reach | funcs | bytes | % bytes | note |
|---|---:|---:|---:|---|
| hand / `.s` (non-loop shape) | 2066 | 518,540 | **49.6 %** | the proven zone is the `<0x100` slice (1465 funcs / 183 KB); the `>0x200` non-loop (197) is the same shape but high-effort |
| permuter-slack (leaf loop) | 144 | 45,240 | 4.3 % | the permuter *may* help (B2: scheduling yes, reg-alloc no) |
| **walled** (call-in-loop / nested) | **946** | **481,696** | **46.1 %** | needs a future tool |

**Ceiling: the current toolkit can in-principle reach ~50 % of remaining
ov002 bytes** (the non-loop shape — hand-drain for the simple `<0x100`,
`.s` hatch for the canonicalisation residue, hand-RE for the larger
straight-line funcs). **~46 % is reg-alloc-walled** — the call-in-loop loop
cohort plus the call-heavy `>0x200` functions — and is the floor the current
toolkit cannot cross. The ~4 % permuter-slack leaf loops are a marginal
add that the permuter only partly unlocks (scheduling, not reg-alloc).

**What's left for a future tool:** the ~46 % walled remainder is a single
problem — **matching mwcc's register allocation across calls / loops**.
Neither hand-RE (the allocation isn't source-expressible), the `.s` hatch
(it's not a one-instruction canonicalisation; the whole allocation
differs), nor the permuter (mutates source, can't steer allocation) crosses
it. A future tool would need to model or search mwcc's allocator directly
(a reg-alloc-aware super-permuter, or an mwcc-allocation oracle) — a
materially different capability than the current shape-and-schedule toolkit.

## Falsification

- "85 % call-in-loop": loop-body scan over the 576 `<0x100` loops
  (back-edge detection + `bl` in body) — re-runnable from the gap disasm.
- "permuter doesn't cross reg-alloc on `>0x200`": the B2 pilot (best score
  never reaches 0; reg-alloc pick plateaus), consistent with brief 276.
- "~50 % reachable / ~46 % walled": the reachability split by func shape +
  bytes; flips iff a future tool cracks the call-in-loop reg-alloc class.

## Scope

Tooling + research: `asm_escape.py` consolidation (committed) + this
characterization. No `.c`/`.s` shipped, no SHA1. The loop/cohort scan is
inlined + re-derivable from the committed config + gap disasm; the permuter
scratches are in the gitignored vendor.

## Cross-references

- `docs/research/brief-290-asm-escape-hatch.md` — the surviving generator.
- `docs/research/brief-288-wave7-addorder-residue.md` — the permuter's
  tight-accessor plateau (the slack-deficit case B2 contrasts).
- `docs/research/brief-276-permuter-standup-pilot.md` — the original
  `>0x200` permuter pilot (scheduling-helps / reg-alloc-plateaus).
- `docs/research/brief-284-ov002-family-mining.md` — the shape census (the
  576 loop count) this sub-classifies.
- `tools/asm_escape.py` — the consolidated `.s` generator.
