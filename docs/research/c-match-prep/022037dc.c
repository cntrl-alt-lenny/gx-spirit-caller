/* CAMPAIGN-PREP candidate for func_022037dc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :2/:1/:9 fields; if-return guards; held bit0 (no reload)
 *   risk:       permuter-class: orig interleaves the two field extracts before 021b99b4 (mov lsl,lsl,lsr,lsr); mwcc likely emits them sequentially -> instruction-order diff.
 *   confidence: med
 */
/* func_ov002_022037dc: cls D. b12_13 must be 2, then 021bd030(bit0)>=0,
 * then return 021b99b4(bit0, f4.b6_14) >= 0. self held in r4 across calls. */
typedef unsigned short u16;

struct S022037dc {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_11 : 6;
    u16 b12_13 : 2;
    u16 b14_15 : 2;
    u16 f4lo6 : 6;
    u16 f4b6_14 : 9;
    u16 f4b15 : 1;
};

extern int func_ov002_021bd030(unsigned int bit);
extern int func_ov002_021b99b4(unsigned int bit, unsigned int field9);

int func_ov002_022037dc(struct S022037dc *self) {
    if (self->b12_13 != 2) return 0;
    if (func_ov002_021bd030(self->bit0) < 0) return 0;
    return func_ov002_021b99b4(self->bit0, self->f4b6_14) >= 0;
}
