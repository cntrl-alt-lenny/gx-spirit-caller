# 021ceebc — func_ov011_021ceebc (ov011, class C, 232B)

## Recipe + Risk
**Recipe:** CLASS C: multi-field loop; stride computed per iter; reload bound
**Risk:** per-iter stride: compute stride each iteration. reload: bound not cached.

> NOTE: The batch metadata describes this as class C, but the prep file header
> marks it class D (low confidence). The ov011_core.h wave-4 summary explicitly
> names 021ceebc as a WALL case: "predication-vs-branch on dual-assignment if/else".
> Filed here as class C per the campaign index; escalate to .s if predication
> cannot be coerced.

## Prep draft
```c
/* CAMPAIGN-PREP candidate for func_021ceebc (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base403c; conditional-lsl + shared-lsr (not bitfield); exact store-order
 *   risk:       permuter-class: orig shares ONE ldr+lsr#28 with a conditional lsl(23/19); mwcc likely splits into two per-branch loads/shifts. Also tbl/x/y reg rotation across 6 stores.
 *   confidence: low
 */
/* func_ov011_021ceebc (ov011, cls D): pick a short[] pair-table by a
 * bitfield of base403c+0x268, conditioned on base4000+0x2a0==1. The orig
 * loads +0x268 ONCE then uses a CONDITIONAL shift amount (lsl#23 vs lsl#19)
 * with a SHARED lsr#28 -- so this is NOT two bitfields; it is one word with
 * ternary-selected shift. Table entry = 4 bytes = 2 shorts (x,y); both <<12.
 * Store order EXACT: 0x21c,0x220,0x218,0x270,0x230,0x234. base403c bound. */

extern char data_ov011_021d300c[];
extern char data_ov011_021d3034[];
extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];

void func_ov011_021ceebc(void) {
    char         *b   = data_ov011_021d403c;
    unsigned int  v   = *(unsigned int *)(b + 0x268);
    short        *tbl;
    unsigned int  idx;
    int           x, y;
    unsigned int  m;

    if (*(int *)(data_ov011_021d4000 + 0x2a0) == 1) {
        tbl = (short *)data_ov011_021d300c;
        idx = (v << 0x17) >> 0x1c;   /* bits [8:5] */
    } else {
        tbl = (short *)data_ov011_021d3034;
        idx = (v << 0x13) >> 0x1c;   /* bits [12:9] */
    }
    idx -= 1;

    x = tbl[idx * 2] << 0xc;
    m = *(unsigned int *)(b + 0x270);
    *(int *)(b + 0x21c) = x;
    y = tbl[idx * 2 + 1] << 0xc;
    m &= ~0x20000;
    *(int *)(b + 0x220) = y;
    *(int *)(b + 0x218) = 0x1000;
    *(int *)(b + 0x270) = m;
    *(int *)(b + 0x230) = x;
    *(int *)(b + 0x234) = y;
}
```

## Struct context
Touches two ov011 state globals from ov011_core.h:

| field | offset | type | purpose |
|-------|--------|------|---------|
| data_ov011_021d4000 | base | char[] | primary camera/view state |
| +0x2a0 | 0x2a0 | int | mode word (0/1 switch discriminant) — byte-verified |
| data_ov011_021d403c | base | char[] | secondary view state |
| +0x268 | 0x268 | unsigned int | packed bitfield (bits [12:5]) |
| +0x21c | 0x21c | int | view coord X store |
| +0x220 | 0x220 | int | view coord Y store |
| +0x218 | 0x218 | int | view coord Z / depth (stores 0x1000) |
| +0x270 | 0x270 | unsigned int | blend flags word (bit 17 cleared) |
| +0x230 | 0x230 | int | output X mirror |
| +0x234 | 0x234 | int | output Y mirror |

data_ov011_021d300c and data_ov011_021d3034 are short[] lookup tables (4-byte entries, x and y shorts).

## Closest matched example
**Path:** src/overlay011/func_ov011_021cc9b4.c
**Why similar:** 2-arm if/switch on `data_ov011_021d4000 + 0x2a0 == 1`, bound base403c, then cross-struct field stores in prescribed order.
**Key lesson from that file:** The 2-arm switch on mode-0x2a0 compiles to a cmp chain (NOT a jump table); no default case is needed. The base pointer `s = data_ov011_021d403c` must be declared before the switch and bound into a callee-saved register. Store order of the 3-word block is preserved exactly as written in C.

## Try this
1. Build as-is. The prep draft captures the right store sequence and the conditional-shift pattern. The key risk is that `idx = (v << 0x17) >> 0x1c` in the if-branch and `idx = (v << 0x13) >> 0x1c` in the else-branch — mwcc may reload `v` per branch rather than keeping a single load. If the asm shows two `ldr r?, [base, #0x268]` instructions (one per branch), move `v = *(unsigned int *)(b + 0x268);` into each branch body instead of hoisting it.
2. In objdiff, check that `idx * 2` compiles to `lsl #1` (not a mul). If the branch where `v` is loaded and the branch where `tbl` and `idx` are set do not share the same register, try declaring `idx` before the if and assigning `v` inside each branch separately.
3. ov011_core.h wave-4 explicitly names this as a WALL (predication-vs-branch). If predication coercion fails after 3 attempts, park as .s — do not spend permuter budget on it.
