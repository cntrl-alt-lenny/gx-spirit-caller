[//]: # (markdownlint-disable MD013 MD041)

# Brief 338 — ov018 clean-C wave 2 (medium clone-sibling tier)

**Brief:** 338 (decomper, Windows lane). Continue draining ov018 after wave 1's
12. Continue the clone families (func_0207f934 cell-draw, bind-base OAM-flag,
BG-config builder) + the ov017 metrics recipes. Full recipe library + the 5 new
wave-1 levers. Reshape register-CHOICE inline; defer scheduling/allocator. Flag
if ov018 thins below ~4. Target ~8.

## Headline — 5 matched; ov018 hit its tier transition

**5 shipped (all `.c`), EUR objdiff fuzzy 100%, EUR `ninja sha1` OK.** Wave 1
drained the easy clone tier (12); wave 2 mopped up the **medium clone-sibling
tier** — the dispatcher sibling, the two-loop RGB twins, the metrics-draw, and
the input-handler sibling. That tier is now drained too: the `<0x100` residue is
the permuter-class trio (021aa9b8/ace14/aaa3c), and the rest of the gap is HSV
color math, 99–153-instruction MMIO/touch handlers, and an unrolled packer.
Recommend the next clean-C wave pivot to a fresh overlay (ov019 / ov009).

## The 5 picks

| func | size | shape | recipe |
|---|---|---|---|
| `021aabd8` | 0x10c | gauge-row dispatcher sibling of `021aaaf0` + per-cell OAM mask loop + bit0 early-out | OamCtl guard, switch, **decl-order swap** |
| `021ad118` | 0xdc | two-loop RGB555 min-reduce + rescale over `021ace68`/`021acf80` | min-if-assign, **decl-order reorder**, unsigned-lsr |
| `021aa880` | 0xa0 | 2-layer label draw | mode-getter + `[mode][a0]` table + alloc/draw/free |
| `021ad1f4` | 0xf0 | brighten twin of `021ad118` (min vs 0x200, clamp 0x1ff) | **register-clamp-temp** |
| `021ab13c` | 0x88 | shoulder-button handler, sibling of `021ab054` | bind-base flag op, const-reuse `-1`, op-order |

`021aa880`, `021ab13c`, and `021aabd8`'s dispatch matched on the **first** real
attempt — the wave-1 recipes (metrics/draw family, the input-handler levers, the
OamCtl bitfield + switch-for-layout) transferred wholesale.

## New levers harvested (generalise the wave-1 reg-choice levers)

1. **DECLARATION-ORDER controls callee-saved register numbering.** The order
   locals are declared steers which callee-saved register each receives.
   - `021aabd8` (80→100): an r4/r5 swap (`st` vs `cell`) fixed by declaring `st`
     first.
   - `021ad118` (76→100): a **4-register permutation** (count/loop-i/prod/loop2-i)
     fixed by reordering the declarations to `i, min, count`. The structure was
     already 100%; only the register *numbers* were permuted — exactly the case
     a permuter flips, here cracked from source.

2. **REGISTER-CLAMP-TEMP.** Clamping an *address-taken* variable in place
   (`if (v > hi) v = hi;`) compiles to a conditional STORE (`strgt`) plus a
   reload before the next use. Compute into a register temp, clamp the temp, then
   assign once — matching the orig's `cmp; movgt; str` (`021ad1f4` 85→100).

3. **UNSIGNED for lsr-not-asr.** `(unsigned short)(packed >> 16)` on a *signed*
   `int` shifts with `asr`; make the parameter `unsigned` so the high-half
   extract is `lsr` (`021ad118`). Corollary: declare the address-taken locals
   FIRST so their `&`-passed stack slots land in the orig order.

## Tier transition — the gap residue (deferred to Mac/permuter + long-tail)

| func | size | why |
|---|---|---|
| `021ace14` | 0x54 | fn-ptr dispatcher; mwcc pools `data_021040ac+0xb6c` (3 forms tried) |
| `021aaa3c` | 0x4c | cell-attr forwarder; +0x66/+0x900 split interleaved by scheduling |
| `021aa9b8` | 0x84 | magic-multiply signed div (/60 then /17) — permuter-class |
| `021ace68` | 0x118 | RGB555→HSV decompose; min/max chains + 3× divmod + hue dispatch |
| `021acf80` | 0x198 | HSV→RGB recombine; magic-multiply divisions + 6-way sextant switch |
| `021aaddc` | 0x278 | touch sprite-position builder, 153 insns, repetitive block-per-case |
| `021ab4f4` | 0x1a0 | MMIO screen/blend setup, 99 insns straight-line |
| `021aa4a0` | 0x15c | RGB555-pack to scattered MMIO, 8× unrolled, uncertain shift codegen |
| `021ab694` | 0x1634 | huge controller |

The 99–153-instruction MMIO/touch/sprite builders (`021ab4f4`, `021aaddc`,
`021aa4a0`) are mechanically reconstructable but long-tail (single-instruction
miss risk over ~100 insns); the color pair (`021ace68`/`021acf80`) is
arithmetic/magic-multiply. None are Windows-reshape wins.

**Recommendation:** ov018 is drained of clean/medium clones (waves 1+2 = 17).
Pivot the next clean-C wave to a fresh overlay (ov019 = 20 funcs, ov009 = 15);
route the color pair + the permuter-class trio to the Mac permuter.

## Gotcha re-confirmed

The `<0x100` gap-size estimate (next-*gap*-func − this-func) over-counts when an
already-matched function sits in the span — `021aa880` looked 0x138 but the real
next boundary was the matched `021aa920` (size 0xa0); `021aace4`-style overlap
errors from `ninja sha1` flag it. Always clamp the delinks `end` to the next
*boundary*, matched or not.
