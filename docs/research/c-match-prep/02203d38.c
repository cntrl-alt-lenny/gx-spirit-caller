/* CAMPAIGN-PREP candidate for func_02203d38 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     b6_11:6 branch picks threshold; two 022536e8 calls; f0 passed as u16
 *   risk:       reshape-able(inline-vs-branch): orig shares the lsl#31 + L_f8 (mov#1) epilogue for both true cases; mwcc may inline movge#1 instead of branching to a shared return.
 *   confidence: med
 */
/* func_ov002_02203d38: cls D. Gate on 021ca63c(bit0,1); then a threshold on
 * 022536e8(bit0,f0,0) that is 3 when b6_11==0x23 else 5. self held in r4. */
typedef unsigned short u16;

struct S02203d38 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_11 : 6;
    u16 b12_15 : 4;
};

extern int func_ov002_021ca63c(unsigned int bit, int k);
extern int func_ov002_022536e8(unsigned int bit, u16 a, int b);

int func_ov002_02203d38(struct S02203d38 *self) {
    if (func_ov002_021ca63c(self->bit0, 1) == 0) return 0;
    if (self->b6_11 == 0x23)
        return func_ov002_022536e8(self->bit0, self->f0, 0) >= 3;
    return func_ov002_022536e8(self->bit0, self->f0, 0) >= 5;
}
