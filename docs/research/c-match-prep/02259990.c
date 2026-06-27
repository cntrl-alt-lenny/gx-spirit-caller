/* CAMPAIGN-PREP candidate for func_02259990 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla (a&1)*0x868 + 0x260; bitfield extract shifts; no halfword trunc
 *   risk:       struct-guessed: 0x868 stride and 0x260 offset inferred; confirm struct. Reshape-able otherwise; the early movlt r0,#0 / ldmltia return is exactly `if(res<0)return 0;` so low codegen risk on the guard.
 *   confidence: med
 */
/* func_ov002_02259990: class D, clone-pair with 022599e8.
 * call 021ba294(); if <0 return 0. Index data_022cf16c + (a&1)*0x868
 * + 0x260, load word at [base + result*4], extract bitfield, call
 * 0226f4dc(a, extract). Note: no &0xffff truncation on r1 here (the
 * asm ends the bitfield build at the add, no lsl/lsr#0x10 pair).
 */
struct StateRow02259990 {
    char pad[0x260];
    int  tbl[1];
};
extern struct StateRow02259990 data_ov002_022cf16c[2];   /* stride 0x868 */
extern int func_ov002_021ba294(void);
extern int func_ov002_0226f4dc(int a, unsigned int extract);

int func_ov002_02259990(int a)
{
    int res = func_ov002_021ba294();
    if (res < 0)
        return 0;
    {
        unsigned int v = (unsigned int)data_ov002_022cf16c[a & 1].tbl[res];
        unsigned int ext = (((v << 2) >> 24) << 1) + (v >> 31);
        return func_ov002_0226f4dc(a, ext);
    }
}
