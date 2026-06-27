/* CAMPAIGN-PREP candidate for func_021dec2c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: clone of 021dea48.s; mask=1<<(arg1+arg0*16); eor->bitfield; store-order; tst tail
 *   risk:       reg-alloc: orig holds mask in r4 across the call + uses ip/lr as zero/base regs (its sibling 021dea48 already shipped .s). mwcc reg coloring of the 4-arg+mask+struct frame likely diverges. permuter-class.
 *   confidence: low
 */
/* func_ov002_021dec2c (cluster-39 clone of func_ov002_021dea48, kind 14): build a
 * zeroed 0x18 self-struct, f0 = arg3, f2 bit0 = (arg0 ^ arg2) & 1; mask =
 * 1 << (arg1 + arg0*16). Dispatch func_ov002_021de134(self, mask, 14, 0) and
 * return (result & mask) != 0. */
#include "ov002_core.h"

extern int func_ov002_021de134(void *self, int mask, int kind, int d);

struct Ov002SelfArg2 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short : 15;
    unsigned int w1;
    unsigned int w2;
    unsigned int w3;
    unsigned int w4;
    unsigned int w5;
};

int func_ov002_021dec2c(int arg0, int arg1, int arg2, int arg3) {
    struct Ov002SelfArg2 s;
    int mask = 1 << (arg1 + arg0 * 16);
    s.f0 = (unsigned short)arg3;
    s.b0 = (unsigned short)(arg0 ^ arg2) & 1;
    s.w1 = 0;
    s.w2 = 0;
    s.w3 = 0;
    s.w4 = 0;
    s.w5 = 0;
    return (func_ov002_021de134(&s, mask, 14, 0) & mask) != 0;
}
