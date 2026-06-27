/* CAMPAIGN-PREP candidate for func_0226ce8c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D state switch; u16 hi/lo byte split; find-first-set bit-scan loop
 *   risk:       reshape-able: decl-order is state,hi,lo (G->d9c read first, then arg2 split before the switch); the bit-scan must be do{i++;}while(!(v&(1<<i))) with i preset 1 (mov r0,r2 = shift base 1). struct field +0xd44/+0xd9c guessed.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed int s32;

extern s32 data_ov002_022cd744[];  /* int[] indexed by arg0 */
extern u8 data_ov002_022d016c[];   /* global G: s32 +0xd44, s32 +0xd9c */
extern u8 data_ov002_022d0e6c[];   /* u16 +0xb0, u16 +0xb2 */

extern s32 func_ov002_021ae60c(s32 a, s32 b, s32 c);
extern s32 func_ov002_0228300c(s32 a);

s32 func_ov002_0226ce8c(s32 arg0, s32 arg1, s32 arg2) {
    s32 state;
    s32 lo;
    s32 hi;
    s32 v;
    s32 i;

    state = *(s32 *)(data_ov002_022d016c + 0xd9c);
    hi = (((u16)arg2) >> 8) & 0xff;
    lo = arg2 & 0xff;

    switch (state) {
    case 0:
        if (data_ov002_022cd744[arg0] == 1) {
            *(s32 *)(data_ov002_022d016c + 0xd44) = func_ov002_0228300c(arg0);
        } else {
            func_ov002_021ae60c(0xf2, lo, hi);
        }
        *(s32 *)(data_ov002_022d016c + 0xd9c) += 1;
        return 0;
    case 1:
        v = *(s32 *)(data_ov002_022d016c + 0xd44);
        i = 1;
        if (!(v & 0x2)) {
            do {
                i++;
            } while (!(v & (1 << i)));
        }
        *(u16 *)(data_ov002_022d0e6c + 0xb0) = (u16)v;
        *(u16 *)(data_ov002_022d0e6c + 0xb2) = (u16)i;
        return 1;
    default:
        return 1;
    }
}
