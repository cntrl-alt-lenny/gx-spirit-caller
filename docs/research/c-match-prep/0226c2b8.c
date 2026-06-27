/* CAMPAIGN-PREP candidate for func_0226c2b8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl sum then t; byte-pack (u8) compare; (u16)>>8&0xff (asr via int-promote); 1<<sum tst
 *   risk:       Reg-alloc: sum=r4,arg0=r5,t=r6 must stay callee-saved across two calls; the t!=0 block fallthrough into the bitmask test must not branch. Mostly reshape-able; residual coloring permuter-class.
 *   confidence: med
 */
/* func_ov002_0226c2b8 (ov002, cls C) — sum guard, accessor gate, dup-check,
 * optional confirm call, then a bitmask occupancy test.
 *   sum = arg1+arg2;  if (sum > 4) return 0;
 *   if (func_021bc8c8(*(int*)(d016c+0xd94), arg0, sum) == 0) return 0;
 *   if (*(u16*)(d0e6c+0xa0) == (u16)((u8)arg0|((u8)sum<<8))) return 0;
 *   t = (*(u16*)(d0e6c+0xa2) >> 8) & 0xff;
 *   if (t != 0) { if (t != func_021c8940(arg0, sum)) return 0; }
 *   return (((u16*)d0f1c)[arg0+1] & (1<<sum)) ? 0 : 0x800;
 * BYTE-PACK LEVER on the compare; sum=r4 & arg0=r5 held across the calls;
 * t=r6 held across func_021c8940; (u16)>>8 promotes to int hence asr. */
typedef unsigned char  u8;
typedef unsigned short u16;
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern char data_ov002_022d0f1c[];
extern int  func_ov002_021bc8c8(int a, int b, int c);
extern int  func_ov002_021c8940(int a, int b);
int func_ov002_0226c2b8(int arg0, int arg1, int arg2) {
    int sum;
    int t;
    sum = arg1 + arg2;
    if (sum > 4)
        return 0;
    if (func_ov002_021bc8c8(*(int *)(data_ov002_022d016c + 0xd94), arg0, sum) == 0)
        return 0;
    if (*(u16 *)(data_ov002_022d0e6c + 0xa0) ==
        (u16)((u8)arg0 | ((u8)sum << 8)))
        return 0;
    t = (*(u16 *)(data_ov002_022d0e6c + 0xa2) >> 8) & 0xff;
    if (t != 0) {
        if (t != func_ov002_021c8940(arg0, sum))
            return 0;
    }
    if (((u16 *)data_ov002_022d0f1c)[arg0 + 1] & (1 << sum))
        return 0;
    return 0x800;
}
