/* CAMPAIGN-PREP candidate for func_0221669c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     out-param via &local; byte-split lo=&0xff hi=((u16)>>8)&0xff; 6-arg sink, 2 stacked
 *   risk:       stacked args: orig emits str#2;str#0 BEFORE ldrh r3(*self); mwcc arg-eval order may interleave the ldrh, reordering the two str/one ldrh. reshape-able (split temps) but maybe permuter-class.
 *   confidence: med
 */
/* func_ov002_0221669c: 0223df38 out-param unpack -> lo/byte1 -> 0225764c guard
 * -> 021d5a08(self,lo,hi,*self,2,0). Returns 0. Twin of 0223a87c shape. */
#include "ov002_core.h"
extern int func_ov002_0223df38(void *a, int b, int *out);
extern int func_ov002_0225764c(int a, int b, int c);
extern int func_ov002_021d5a08(struct Ov002Self *self, int lo, int hi, int f0, u16 k2, u16 k0);

int func_ov002_0221669c(struct Ov002Self *arg0) {
    int out;
    int lo, hi;
    if (func_ov002_0223df38(arg0, 0, &out) == 0) return 0;
    lo = out & 0xff;
    hi = ((u16)out >> 8) & 0xff;
    if (func_ov002_0225764c((int)arg0, lo, hi) == 0) return 0;
    func_ov002_021d5a08(arg0, lo, hi, *(u16 *)arg0, 2, 0);
    return 0;
}
