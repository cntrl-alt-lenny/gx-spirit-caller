/* CAMPAIGN-PREP candidate for func_0226df90 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     declare cnt=0 first (shared early-return-0 reg); >>17&1 bit-test on u32; counting loop; cnt>=2
 *   risk:       the loop counter and accumulator are both callee-saved (orig reuses r4 as counter, r5 as cnt); 'if(call) cnt++' must give cmp;add(counter);addne(cnt). Risk mwcc orders counter-inc after the conditional add or recolours -> 1-2 insn drift. reshape-able (decl cnt before other/i).
 *   confidence: med
 */
/* func_ov002_0226df90: three guards then a counting loop. Guard1: bit17 of
 * *(u32*)(cf288 + (arg0&1)*0x868) clear. Guard2/3: 021b3ecc(arg0,0xb,0x12f3)==0
 * and 021bb068(0x13f2)<=0. Then for i:0..4 count 021bc8c8(1-arg0,1-arg0,i)
 * truthy; return count>=2. cnt(=0) is live from the top (also the early
 * return-0 value). */
#include "ov002_core.h"

extern char data_ov002_022cf288[];
extern int  func_ov002_021b3ecc(int a, int b, int c);
extern int  func_ov002_021bb068(int a);
extern int  func_ov002_021bc8c8(int a, int b, int c);

int func_ov002_0226df90(int arg0) {
    int cnt = 0;
    int other;
    int i;
    if ((*(u32 *)(data_ov002_022cf288 + (arg0 & 1) * 0x868) >> 17) & 1)
        return 0;
    if (func_ov002_021b3ecc(arg0, 0xb, 0x12f3) != 0) return 0;
    if (func_ov002_021bb068(0x13f2) > 0) return 0;
    other = 1 - arg0;
    for (i = 0; i <= 4; i++)
        if (func_ov002_021bc8c8(other, other, i)) cnt++;
    return cnt >= 2;
}
