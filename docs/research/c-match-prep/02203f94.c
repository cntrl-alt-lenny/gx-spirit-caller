/* CAMPAIGN-PREP candidate for func_02203f94 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     b6_11:6 guard; cd3f4 field cmps fold bit0>>31 into cmp; ==3 dual path
 *   risk:       reshape-able(bitfield-fold): cmp must fold self->bit0 as cmp r0,r2,lsr#31 (per header lever). cd3f4 +0x1c/+0x20 offsets are struct-guessed but value-equal regardless.
 *   confidence: med
 */
/* func_ov002_02203f94: cls D. Require b6_11==0x14 and cd3f4.f8==0; then for
 * each side (f0/f4 == bit0), 021c8940(side, partner)==3 returns 1; else 0.
 * self held in r4. */
typedef unsigned short u16;

struct S02203f94 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_11 : 6;
    u16 b12_15 : 4;
};

struct Cd3f4 {
    int f0;
    int f4;
    int f8;
    int pad_c[4];     /* +0x0c .. +0x18 */
    int f1c;          /* +0x1c */
    int f20;          /* +0x20 */
};

extern struct Cd3f4 data_ov002_022cd3f4;
extern int func_ov002_021c8940(int a, int b);

int func_ov002_02203f94(struct S02203f94 *self) {
    if (self->b6_11 != 0x14) return 0;
    if (data_ov002_022cd3f4.f8 != 0) return 0;
    if (data_ov002_022cd3f4.f0 == self->bit0) {
        if (func_ov002_021c8940(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c) == 3)
            return 1;
    }
    if (data_ov002_022cd3f4.f4 == self->bit0) {
        if (func_ov002_021c8940(data_ov002_022cd3f4.f4, data_ov002_022cd3f4.f20) == 3)
            return 1;
    }
    return 0;
}
