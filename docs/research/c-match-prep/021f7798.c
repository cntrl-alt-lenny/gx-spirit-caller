/* CAMPAIGN-PREP candidate for func_021f7798 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual-bitfield single load (:2 b12 + :6 b6) via &&; f0 != 0x1503 guard; tail-call returns result
 *   risk:       orig loads [+2] ONCE and predicates (cmp;moveq cmpeq) the b12==1&&b6==5 test. mwcc may reload or branch the && instead of predicating. reshape-able (single read), borderline.
 *   confidence: med
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Self {
    u16 f0;
    u16 b0  : 1;
    u16 b1  : 5;
    u16 b6  : 6;
    u16 b12 : 2;
};

extern int func_ov002_021f4a84(struct Self *self);

int func_ov002_021f7798(struct Self *self) {
    if (self->b12 == 1 && self->b6 == 5) return 1;
    if (self->f0 != 0x1503) return 1;
    return func_ov002_021f4a84(self);
}
