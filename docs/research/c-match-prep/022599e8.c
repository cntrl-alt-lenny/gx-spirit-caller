/* CAMPAIGN-PREP candidate for func_022599e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of 02259990 with +0x3a0 offset; bitfield extract shifts
 *   risk:       struct-guessed: same 0x868/offset inference. Crack-once-propagate: whatever flips 02259990 flips this; if 02259990 matches first-build this should too (reshape-able).
 *   confidence: med
 */
/* func_ov002_022599e8: class D, clone-pair sibling of 02259990.
 * Identical shape: differs only in callee (021ba310 vs 021ba294),
 * the +0x3a0 table offset (vs +0x260), and 0226f4dc shared.
 */
struct StateRow022599e8 {
    char pad[0x3a0];
    int  tbl[1];
};
extern struct StateRow022599e8 data_ov002_022cf16c[2];   /* stride 0x868 */
extern int func_ov002_021ba310(void);
extern int func_ov002_0226f4dc(int a, unsigned int extract);

int func_ov002_022599e8(int a)
{
    int res = func_ov002_021ba310();
    if (res < 0)
        return 0;
    {
        unsigned int v = (unsigned int)data_ov002_022cf16c[a & 1].tbl[res];
        unsigned int ext = (((v << 2) >> 24) << 1) + (v >> 31);
        return func_ov002_0226f4dc(a, ext);
    }
}
