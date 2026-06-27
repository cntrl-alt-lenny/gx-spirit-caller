/* CAMPAIGN-PREP candidate for func_02203e2c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (bit0&1)*0x868 mla table; b1_5*20 mul; asymmetric-shift unpack; !=0xffff
 *   risk:       permuter-class(reg-alloc): orig BINDS bit0(r0)+b1_5(r1) across the ldr and reuses them for 021b3618 with no reload; mwcc may re-extract or recolor.
 *   confidence: low
 */
/* func_ov002_02203e2c: cls D. Read rec = cf16c[bit0*0x868 + b1_5*20 + 0x30];
 * its packed (byte@22<<1 | bit@13) must equal f4.b6_14, then
 * 021b3618(bit0, b1_5) != 0xffff. */
typedef unsigned short u16;

struct S02203e2c {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_11 : 6;
    u16 b12_15 : 4;
    u16 f4lo6 : 6;
    u16 f4b6_14 : 9;
    u16 f4b15 : 1;
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021b3618(unsigned int bit, unsigned int fld);

int func_ov002_02203e2c(struct S02203e2c *self) {
    int rec = *(int *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868 +
                       self->b1_5 * 20 + 0x30);
    if (self->f4b6_14 !=
        ((((unsigned int)(rec << 2) >> 24) << 1) + ((unsigned int)(rec << 18) >> 31)))
        return 0;
    return func_ov002_021b3618(self->bit0, self->b1_5) != 0xffff;
}
