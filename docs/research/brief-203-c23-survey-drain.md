# Brief 203 — C-23 candidate drain (variable-index extension)

**Brief:** 203 (decomper). Drain 3 C-23 candidates surfaced by
brief 199's expanded classifier (clustered-pool / duplicate-ref
signals beyond the original 0x04000xxx MMIO range), using the
locked recipe from brief 199's pick #5 worked example.

## Headline

**2 of 3 picks closed byte-match.** Meets the brief's success
threshold (≥ 2 of 3). The two that closed (`OSi_PostIrqEvent` +
`func_02093dc8`) required EXTENDING the brief 199 recipe with
new source-shape rules for variable-index MMIO access. The
third (`func_02021b38`) ships as an un-wired artifact stub —
the duplicate-pool C-23 wall combined with mwcc's push-set +
loop-strength-reduction choices that aren't source-coercible.

| Pick | Addr | Size | Routing | Outcome |
|---|---|---:|---|:---:|
| **OSi_PostIrqEvent** | 0x020904d4 | 0x9c | `.legacy.c` | **✓ MATCH** |
| **func_02093dc8** | 0x02093dc8 | 0x70 | `.legacy.c` | **✓ MATCH** |
| **func_02021b38** | 0x02021b38 | 0x74 | `.legacy.c` | wall (un-wired stub) |

`matched_functions` +2 (3-region SHA1 PASS preserved).

## Brief 199 recipe — extensions surfaced

Brief 199's recipe was empirically validated on a CONSTANT-index
MMIO access:

```c
volatile int *block = (volatile int *)0x027ffc00;
block[226] = block[226] | (1U << slot);   /* 226 * 4 = 0x388 */
```

Brief 203's three picks all use VARIABLE-index access. Two new
source-shape rules were needed to extend the recipe:

### Extension 1 — `int x = expr_inline;` anchors callee-saved reg

For values that should live in a callee-saved register from the
START of the function (e.g. `mask = 1 << shift`), the C source
MUST use the inline-expression form:

```c
int mask = 1 << data_021024a0[idx];   /* ✓ allocates r5 immediately */
```

NOT the two-statement form:

```c
int mask = 1;
mask <<= data_021024a0[idx];          /* ✗ allocates scratch r2 for the 1 */
```

mwcc's reg-allocator commits to a callee-saved slot at the FIRST
USE of a value. With the two-statement form, the `1` is materialised
into a scratch register first; the shift result then becomes the
"first use" of `mask`, allocated late.

This rule unlocked **pick 1 (`OSi_PostIrqEvent`)** — the diff
collapsed from "5 reg-allocation divergences" to byte-match.

### Extension 2 — `&base[expr]` forces pool-load for variable-index

For variable-index MMIO access where the orig has the base loaded
from a pool word (not inlined as an imm + offset), the C source
MUST use the address-of-array-element form to take a real pointer:

```c
volatile int *dma_base = (volatile int *)0x040000b0;
volatile int *dma_ctrl = &dma_base[ch * 3 + 2];        /* ✓ pool load + scaled add */
while (*dma_ctrl & 0x80000000) {}
```

NOT the direct array-subscript form:

```c
volatile int *dma_base = (volatile int *)0x040000b0;
while (dma_base[ch * 3 + 2] & 0x80000000) {}          /* ✗ mwcc inlines base as imm */
```

The difference: `dma_base[idx]` lets mwcc constant-fold `dma_base`
back into a literal address, then choose the imm-decomposition route
(`add rN, rN, #0x04000000; ldr [rN, #0xb0]`). `&dma_base[idx]` is a
REAL pointer computation — mwcc must materialise `dma_base` in a
register, which forces the pool load.

For stores where the orig reuses a previously-loaded base register
(via `add r2, ip, r1` pattern, where r1 holds the pool-loaded base),
use byte-offset pointer arithmetic:

```c
volatile int *dma_base = (volatile int *)0x040000b0;
*(volatile int *)((char *)dma_base + ch * 12 + 4) = 0;
*(volatile int *)((char *)dma_base + ch * 12 + 8) = 0x81400001;
```

This rule unlocked **pick 3 (`func_02093dc8`)** — wait-loop and
inner-block bases both materialise correctly.

### What didn't unlock pick 2

`func_02021b38` has three stacked walls:

1. **Push-set divergence** — orig uses `push {r3, r4, r5, lr}`
   (compact, r3 as alignment pad); `.legacy.c` emits `push {r4, r5,
   lr} + sub sp, #4` (explicit). Routing to `.c` (mwcc 2.0)
   produces the compact push BUT loses the duplicate-pool ref
   (mwcc 2.0 CSEs the second `data_02197434` load via `mov r1, r4`).
2. **Loop strength-reduction** — orig keeps `i*16` recomputed per
   iter (`add r0, r4, r2, lsl #4`); mwcc 1.2/sp2p3 strength-reduces
   to `r3 += 16` (extra reg + insn).
3. **Duplicate pool ref + push set conflict** — no single routing
   tier produces both the compact push AND the duplicate pool ref.

Stays un-wired in delinks.txt; ships as an artifact stub at
`src/main/func_02021b38.legacy.c` for future iteration.

## Per-pick mechanical details

### Pick 1: OSi_PostIrqEvent (✓ matched)

5 pool entries (clustered triple `0x021a6354 / 8 / c` + DTCM
`0x027e0000` + shift table `0x021024a0`). Recipe applied:

- Each clustered symbol declared as its own `extern unsigned char []`
- Byte-offset indexing: `&data_021a6354[idx * 12]`
- DTCM access via brief 199's `volatile int *block` + large constant
  index (`block[0xffe]` for byte offset 0x3ff8)
- Inline-shift trigger: `int mask = 1 << data_021024a0[idx];`
- Predicated return `addne; ldmneia; bxne` from `if (v != 0) return v;`

### Pick 3: func_02093dc8 (✓ matched)

2 pool entries (`0x040000b0` duplicate-loaded + `0x81400001`
control value). Recipe applied:

- Wait-loop base via `&dma_base[ch * 3 + 2]` (address-of pattern)
- First inner write via I/O-register-base form
  `(volatile int *)(0x04000000 + ch * 12 + 0xb0)` — orig's
  `add r2, ip, #0x04000000; str [r2, #0xb0]`
- Next two writes via byte-offset arithmetic
  `*(volatile int *)((char *)dma_base + ch * 12 + N)` — orig's
  `add r2, ip, r1; str [r2, #N]` where r1 is pool-loaded base

### Pick 2: func_02021b38 (wall, un-wired stub)

5 pool entries with one duplicate (`data_02197434` × 2 + `0x34a8`
+ `data_021040ac` + `data_02198434`). Stuck on the routing trilemma
described above. Stub preserved at
`src/main/func_02021b38.legacy.c` with full residual disasm + analysis.

## Worked-example regression check

To verify the brief 199 recipe still holds for constant-index
MMIO, the worked example `func_02096434.legacy.c` was re-checked
at the start of this brief — bytes match orig (modulo BL
relocations). The recipe itself is sound; brief 203's two wins
extend it to variable-index access via two new source-shape
rules.

## Recommendation for brief 204+

1. **Extend `docs/research/codegen-walls.md` § C-23** with the two
   new source-shape rules (inline-shift for callee-saved anchor,
   address-of-array for variable-index pool load).

2. **Survey more variable-index C-23 candidates** with
   `tools/predict_walls.py`. Now that the recipe extension is
   proven on 2/3 picks, the previously-deferred candidates may
   yield to the same approach.

3. **func_02021b38 needs scaffolder research** — the
   push-set/duplicate-pool conflict suggests an older mwcc tier
   (1.0 / pre-sp2) may produce the orig shape. A targeted
   empirical sweep similar to brief 088's 5×15 grid could
   identify the right tier.

4. **Loop strength-reduction is a separate wall.** If pick 2's
   strength-reduction also appears in other picks, it may
   deserve its own C-NN entry in the wall taxonomy with a
   scaffolder-level recipe.

## Cross-references

- `docs/research/first-wave-wall-mmio-base-folding.md` — brief 199
  research note (constant-index recipe; pick #5 worked example)
- `src/main/func_02096434.legacy.c` — brief 199's constant-index
  worked example
- `src/main/OSi_PostIrqEvent.legacy.c` — brief 203 pick 1 (extension 1 + 2)
- `src/main/func_02093dc8.legacy.c` — brief 203 pick 3 (extension 2)
- `src/main/func_02021b38.legacy.c` — brief 203 pick 2 stub (wall)
- Brief 086 PR #478 — original C-23 discovery (constant-index)
- Brief 088 — 5×15 empirical SP sweep methodology
