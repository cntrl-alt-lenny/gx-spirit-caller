/* CAMPAIGN-PREP candidate for func_0226c584 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-as-conditional-return guard; mul sum*0x14 + mla (arg0&1)*0x868; ldrh register-offset
 *   risk:       Addressing: orig sums the two products in the load (ldrh [r1,r0]); mwcc may instead add into one reg then ldrh[#0], swapping mul/mla ordering. reshape-able-ish but possibly permuter-class (operand-order coin-flip).
 *   confidence: med
 */
/* func_ov002_0226c584 (ov002, cls C) — sum guard, accessor gate, then read a
 * u16 occupancy cell from a 2D (0x868 outer, 0x14 inner) table.
 *   sum = arg1+arg2;  if (sum > 4) return 0;
 *   if (func_021bc8c8(*(int*)(d016c+0xcec), arg0, sum) == 0) return 0;
 *   return *(u16*)(cf1a4 + (arg0&1)*0x868 + sum*0x14) ? 0x800 : 0;
 * Strides 0x868 and 0x14 are incommensurate so the orig keeps them as TWO
 * independent index ops (mul sum*0x14 + mla (arg0&1)*0x868) summed in a
 * register-offset ldrh [r1,r0] — do NOT model as a nested array. */
typedef unsigned char  u8;
typedef unsigned short u16;
extern char data_ov002_022cf1a4[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021bc8c8(int a, int b, int c);
int func_ov002_0226c584(int arg0, int arg1, int arg2) {
    int sum;
    sum = arg1 + arg2;
    if (sum > 4)
        return 0;
    if (func_ov002_021bc8c8(*(int *)(data_ov002_022d016c + 0xcec), arg0, sum) == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (arg0 & 1) * 0x868 + sum * 0x14))
        return 0x800;
    return 0;
}
