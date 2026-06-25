/* CAMPAIGN-PREP candidate for func_02056b38 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cache a0..a3 in r7/r6/r5/r4; movs r8=result reused as r1 in tail dispatch; stack &rec out-param
 *   risk:       The L_154/L_1a0 fall-through edges into shared L_1b8 don't map cleanly to structured C (two `addne...ldmne` early-returns guarding the same tail). My goto skeleton likely mis-orders blocks. permuter-class (block placement) + struct-guessed.
 *   confidence: low
 */
#include "nitro/types.h"

extern s32  func_02056c34(void *a, void *b, void *c, void *d);
extern s32  func_0205c3c0(void *a, void *r, void *c, void *d);
extern s32  func_0205c54c(void *a, void *r);
extern s32  func_0205c6e4(void *a, void *r);
extern s32  func_0205c748(void *a, void *b, s32 one);
extern s32  func_0205c7f4(void *a);
extern s32  func_0205d6bc(void *a, void *b, void **out);

typedef struct Rec {
    u8   _pad0[0x8];
    s32  f8;             /* 0x8 -> sub */
    u8   _pad0c[0x14 - 0xc];
    s32  f14;            /* 0x14 */
    u8   _pad18[0x18 - 0x18];
    s32  f18;            /* 0x18 */
} Rec;

s32 func_02056b38(void *a0, void *a1, void *a2, void *a3)
{
    Rec *rec;
    s32 r;

    r = func_0205c7f4(a0);
    if (r != 0) {
        goto fail;
    }
    if (func_0205d6bc(a0, a1, (void *)&rec) != 0) {
        s32 *sub = (s32 *)((Rec *)rec)->f8;
        if (sub != 0 && sub[0x14 / 4] != 0) {
            r = func_0205c748(a0, a1, 1);
            if (r == 0) {
                return 1;
            }
            if (((Rec *)rec)->f18 != 0) {
                if (func_0205c54c(a0, (void *)r) != 0) {
                    return 0; /* falls to L_1b8 only if ==0 */
                }
                goto fail; /* unreachable form; see risk */
            }
            if (func_0205c6e4(a0, (void *)r) != 0) {
                return 0;
            }
            goto fail;
        }
    }
    return func_02056c34(a0, a1, a2, a3);

fail:
    if (func_0205c3c0(a0, (void *)r, a2, a3) == 0) {
        return 0;
    }
    return 0; /* r0 passthrough; see risk */
}
