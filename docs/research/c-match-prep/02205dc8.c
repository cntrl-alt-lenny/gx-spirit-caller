/* CAMPAIGN-PREP candidate for func_02205dc8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf :6 guard + (1-b0) vs W14 :1 bit-compare, no calls
 *   risk:       permuter-class: ALREADY shipped as .s and named in ov002_core.h (brief 354/358) as the bitfield-bit-compare wall — mwcc holds the ldrh and the moveq#1;movne#0 tail resists C-form. Likely needs permuter/.s; this C is the seed.
 *   confidence: low
 */
/* func_ov002_02205dc8 (ov002, D, leaf) — if f2.f6(:6)==0x16, return
 * ((1 - f2.b0) == word+0x14 bit9); else 0.
 *   f6    = [r0,#2] lsl#0x14;lsr#0x1a  (:6 after b0:1 + :5)
 *   b0    = [r0,#2] lsl#0x1f;lsr#0x1f ; rsb #1 -> (1 - b0)
 *   w14b9 = [r0,#0x14] lsl#0x16;lsr#0x1f
 *   eq -> 1, ne -> 0.  Note: the ldrh r1 is held and re-shifted (NOT reloaded). */
typedef unsigned short u16;
struct S02205dc8 {
    u16 f0;
    struct { u16 b0 : 1; u16 f1 : 5; u16 f6 : 6; u16 rest : 4; } f2;
};
struct W14 { unsigned int : 9; unsigned int b9 : 1; unsigned int : 22; };

int func_ov002_02205dc8(struct S02205dc8 *self) {
    if (self->f2.f6 != 0x16)
        return 0;
    return (1 - self->f2.b0) == ((struct W14 *)((char *)self + 0x14))->b9;
}
