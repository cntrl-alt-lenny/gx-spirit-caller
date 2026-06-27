/* CAMPAIGN-PREP candidate for func_0220498c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     opt arg1-ptr id-cmp; code.c==0xe; f14.bit16 vs (1-a), f14.bit21 vs a; f14.low16>=0x7d0 unsigned
 *   risk:       struct-guessed: f14 is one int holding bit16, bit21 and a u16 low half — offsets inferred from shift widths. cmp operand order (bit16 vs 1-a, then bit21 vs a) is load-bearing; reshape-able once f14 layout is confirmed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0220498c (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     opt arg1-ptr id-compare; code.c==0xe guard; f14 bit16/bit21 vs a/(1-a); f14 low16>=0x7d0 unsigned
 *   risk:       struct-guessed: f14 is one int carrying bit16, bit21 and a u16 low half — offsets inferred from lsl/lsr widths. cmp ORDER (bit16 vs 1-a, then bit21 vs a) must match; reshape-able once the f14 bitfield layout is confirmed.
 *   confidence: med
 */
#include "types.h"

typedef struct Code_498c {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_498c;

typedef struct F14_498c {
    u16 low16;        /* bits 0..15 (lsl#0x10;lsr#0x10) */
    u16 b0  : 1;      /* bit 16 (lsl#0xf;lsr#0x1f) */
    u16 m   : 4;
    u16 b5  : 1;      /* bit 21 (lsl#0xa;lsr#0x1f) */
    u16 top : 10;
} F14_498c;

typedef struct Obj_498c {
    u16 id;           /* +0x0 */
    Code_498c code;   /* +0x2 */
    u8 pad4[0x10];
    F14_498c f14;     /* +0x14 */
} Obj_498c;

int func_ov002_0220498c(Obj_498c *obj, u16 *arg1) {
    if (arg1 != 0 && *arg1 != obj->id) {
        return 0;
    }
    if (obj->code.c != 0xe) {
        return 0;
    }
    if (obj->f14.b0 != 1 - obj->code.a) {
        return 0;
    }
    if (obj->f14.b5 != obj->code.a) {
        return 0;
    }
    return obj->f14.low16 >= 0x7d0 ? 1 : 0;
}
