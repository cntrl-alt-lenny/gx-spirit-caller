/* CAMPAIGN-PREP candidate for func_021d6808 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Ov002Self b0:1 bitfield; ternary flag; pass-through stack args
 *   risk:       reshape-able(scheduling): orig interleaves `movne#1; str f0,[sp]; moveq#0; str flag,[sp+4]` — mwcc may order the [sp]/[sp+4] stores or the movne/moveq differently. If so it's a store-scheduling near-miss (permuter), not a logic error.
 *   confidence: med
 */
/* func_ov002_021d6808: guard 021c1e44(self,arg1,arg2); else marshal a 6-arg
 * call to 021d6870 — (arg1, arg2, arg3, arg4, self->f0, arg1!=self->b0). The
 * two trailing args are pushed [sp+0]=self->f0 then [sp+4]=flag, in that order
 * (cls C, store-order sensitive). */
#include "ov002_core.h"

extern int func_ov002_021c1e44(struct Ov002Self *self, int a, int b);
extern int func_ov002_021d6870(int a, int b, int c, int d, int e, int f);

int func_ov002_021d6808(struct Ov002Self *arg0, int arg1, int arg2, int arg3,
                        int arg4) {
    int flag;
    if (func_ov002_021c1e44(arg0, arg1, arg2) != 0)
        return 0;
    flag = (arg1 != arg0->b0) ? 1 : 0;
    return func_ov002_021d6870(arg1, arg2, arg3, arg4, arg0->f0, flag);
}
