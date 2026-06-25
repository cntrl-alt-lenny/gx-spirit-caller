/* CAMPAIGN-PREP candidate for func_02200448 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     021ff2c8(bit0); (bit0&1)*0x868 cf17c unsigned<r; rsb complement (1-bit0)&1 cf178 gate
 *   risk:       reshape-able: bit0 is re-read via a 2nd ldrh before the 2nd index (orig reloads, does not CSE) — keep self->f2.bit0 expressed inline at each use (don't bind to one local) or the second `mul` collapses; `movcc` => unsigned `<` cast must stay.
 *   confidence: med
 */
/* func_ov002_02200448 (ov002, class C) — discriminant mul-table index twice + rsb.
 * r = 021ff2c8(bit0); idx0 = (bit0&1)*0x868; if (cf17c[idx0] < r) return 0;
 * if (r != 0) return 1; idx1 = ((1-bit0)&1)*0x868; return cf178[idx1] != 0. */
typedef unsigned short u16;

struct F02200448_F2 {
    u16 bit0 : 1;
    u16 rest : 15;
};
struct F02200448_Self {
    u16 f0;
    struct F02200448_F2 f2;
};

extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
extern int func_ov002_021ff2c8(int bit);

int func_ov002_02200448(struct F02200448_Self *self) {
    int r = func_ov002_021ff2c8(self->f2.bit0);
    if ((unsigned)*(int *)(data_ov002_022cf17c + (self->f2.bit0 & 1) * 0x868) < (unsigned)r)
        return 0;
    if (r != 0) return 1;
    return *(int *)(data_ov002_022cf178 + ((1 - self->f2.bit0) & 1) * 0x868) != 0;
}
