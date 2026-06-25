/* CAMPAIGN-PREP candidate for func_022410f0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     call 0223de94 TWICE (no cache); (u8) byte-pack; r5/r6 hold a/b across calls
 *   risk:       orig keeps arg0->r9, arg1->r8, arg2->r7, a->r5, b->r6 all callee-saved across 3 calls; mwcc must reproduce that exact 6-reg allocation (r3 saved => 8-reg stm). High chance of one-reg rotation. permuter-class (reg-alloc).
 *   confidence: low
 */
/* func_ov002_022410f0: decode (bit0 -> a, field -> b) via two separate
 * 0223de94(self,0) calls, map to id4 = 021b3618(a,b). Require 021c1ef0;
 * then if id4 is neither 0xffff nor the (arg1,arg2) byte-pack, return
 * 021b3ac0(a,b,arg1,arg2)!=0. Else 0. Class C: reg-alloc heavy, two decode
 * calls, (u8) byte-pack. */
#include "ov002_core.h"
extern u16 func_ov002_0223de94(void *node, int idx);
extern int func_ov002_021b3618(int a, int b);
extern int func_ov002_021b3ac0(int a, int b, int c, int d);

int func_ov002_022410f0(void *arg0, int arg1, int arg2) {
    int a, b, id4;
    a = func_ov002_0223de94(arg0, 0) & 0xff;
    b = ((u16)func_ov002_0223de94(arg0, 0) >> 8) & 0xff;
    id4 = func_ov002_021b3618(a, b);
    if (func_ov002_021c1ef0((struct Ov002Self *)arg0, arg1, arg2) == 0) return 0;
    if (id4 == 0xffff) return 0;
    if (id4 == (int)(u16)((u8)arg1 | ((u8)arg2 << 8))) return 0;
    return func_ov002_021b3ac0(a, b, arg1, arg2) != 0;
}
