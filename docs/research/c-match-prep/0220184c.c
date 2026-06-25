/* CAMPAIGN-PREP candidate for func_0220184c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     5-arg call (1 stacked) preserves sub sp #4 frame; field6 eq early-exit ->1
 *   risk:       the str r3,[sp] stacked 0 arg + r3=0 arg5/arg4 shape is struct/proto-guessed; if 021ff14c arity differs the stack store/frame won't match. struct-guessed
 *   confidence: med
 */
/* func_ov002_0220184c (ov002, class C) — batch p_0081.
 * 021bb068(0x135d)!=0 ->0; field6==0x23 ->1; else stack-arg call 021ff14c(b0,2,field9,0,0).
 * Stack frame: sub sp,#4; one stacked 5th arg (0) + r3 4th arg (0).
 */
typedef unsigned short u16;
struct Ov002Self {
    u16 f0;
    u16 b0     : 1;
    u16        : 5;
    u16 field6 : 6;
    u16        : 4;
    u16 a4     : 6;
    u16 field9 : 9;   /* +4 bits 6..14 */
};

extern int func_ov002_021bb068(int code);
extern int func_ov002_021ff14c(int b0, int two, int field9, int z3, int z4);

int func_ov002_0220184c(struct Ov002Self *self) {
    if (func_ov002_021bb068(0x135d) != 0) return 0;
    if (self->field6 == 0x23) return 1;
    if (func_ov002_021ff14c(self->b0, 2, self->field9, 0, 0) == 0) return 0;
    return 1;
}
