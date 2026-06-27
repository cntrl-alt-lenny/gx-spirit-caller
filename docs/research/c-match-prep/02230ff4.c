/* CAMPAIGN-PREP candidate for func_02230ff4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload self[1] each use (orig re-ldrh); mla bit*0x868; +0x3a0+r*4 word index
 *   risk:       ldrh [r5,#8] is self[4] passed as 2nd arg to first call - offset guessed; orig RELOADS self[1] before every guard (3 ldrh) - if mwcc binds it once, 3 ldrh collapse to 1. reshape-able (reload, already written).
 *   confidence: med
 */
/* func_ov002_02230ff4 : cls C - mla struct base + bind; reg-reuse recipe */

extern unsigned char data_ov002_022cf16c[2][0x868];
extern int  func_ov002_021ba310(int side, int b);
extern int  func_ov002_021bc618(int side);
extern int  func_ov002_021ca2b8(int side);
extern void func_ov002_0227adb8(void *p, int idx, int one, int zero);

int func_ov002_02230ff4(unsigned short *self)
{
    int r;

    r = func_ov002_021ba310(self[1] & 1, self[4]);
    if (func_ov002_021ca2b8(self[1] & 1) == 0)
        return 0;
    if (func_ov002_021bc618(self[1] & 1) == 0)
        return 0;
    if (r >= 0)
        func_ov002_0227adb8(
            (void *)(data_ov002_022cf16c[self[1] & 1] + 0x3a0 + r * 4),
            1, 0, 0);
    return 0;
}
