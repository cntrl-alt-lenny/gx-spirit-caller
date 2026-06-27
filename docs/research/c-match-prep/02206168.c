/* CAMPAIGN-PREP candidate for func_02206168 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two predicate calls compared (if-assign) + :6 guard + W14 bit-compare
 *   risk:       permuter-class: the trailing f6==6 + moveq#1;movne#0 bit-compare is the same wall family as 02205dc8 (named .s in core.h). Body is right but mwcc predicates the const-return tail; expect a 1-2 line near-miss -> permuter/.s.
 *   confidence: low
 */
/* func_ov002_02206168 (ov002, D) — compare two slot-count predicates, then a
 * bitfield-bit compare tail.
 *   a = 021bbf50(1 - b0)   (b0 = [r4,#2] lsl#0x1f;lsr#0x1f; rsb #1)
 *   b = 021bbf50(b0)       ([r4,#2] RELOADED for the 2nd extract)
 *   if a <= b return 0  (movle).
 *   then: f6(:6)==6 ? compare (word+0x14 bit9 == b0) -> 1/0 : 0.
 *     f6 = [r4,#2] lsl#0x14;lsr#0x1a ; w14b9 = [r4,#0x14] lsl#0x16;lsr#0x1f */
typedef unsigned short u16;
struct S02206168 {
    u16 f0;
    struct { u16 b0 : 1; u16 f1 : 5; u16 f6 : 6; u16 rest : 4; } f2;
};
struct W14 { unsigned int : 9; unsigned int b9 : 1; unsigned int : 22; };

extern int func_ov002_021bbf50(int side);

int func_ov002_02206168(struct S02206168 *self) {
    int a = func_ov002_021bbf50(1 - self->f2.b0);
    int b = func_ov002_021bbf50(self->f2.b0);
    if (a <= b)
        return 0;
    if (self->f2.f6 != 6)
        return 0;
    return ((struct W14 *)((char *)self + 0x14))->b9 == self->f2.b0;
}
