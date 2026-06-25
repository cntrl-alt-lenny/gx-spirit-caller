/* CAMPAIGN-PREP candidate for func_0226e038 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D :1 bit0-only header (bic;orr RMW) NOT :15; >>17&1 guard; loop sink(1-arg0,i,0)
 *   risk:       header here is bit0-only so the :1 bitfield RMW (bic ~1;orr) should match cleanly; the live risk is the const-0 3rd arg held in a callee-saved reg (r5) by the orig vs mwcc re-mov'ing #0 each call. reshape-able-leaning-permuter (bind a 0 local; residue -> permuter).
 *   confidence: med
 */
/* func_ov002_0226e038: two guards (bit17 of *(u32*)(cf288+(arg0&1)*0x868)
 * clear; 021bb068(0x13f2)<=0) then a bit0-ONLY header write into data_022cd300
 * (b0=arg0; no :15 field here) + set +0x16 bit1 + zero +8; then loop i:0..4
 * calling sink(1-arg0,i,0). const-0 3rd arg is loop-invariant in a saved reg. */
#include "ov002_core.h"

extern char data_ov002_022cf288[];
extern int  func_ov002_021bb068(int a);
extern int  func_ov002_02271608(int a, int b, int c);

struct Hdr300b0 { u32 b0 : 1; u32 _r : 31; };
struct F30016 { u16 _b0 : 1; u16 b1 : 1; u16 _r : 14; };

int func_ov002_0226e038(int arg0) {
    int other;
    int i;
    if ((*(u32 *)(data_ov002_022cf288 + (arg0 & 1) * 0x868) >> 17) & 1)
        return 0;
    if (func_ov002_021bb068(0x13f2) > 0) return 0;
    ((struct Hdr300b0 *)data_ov002_022cd300)->b0 = arg0;
    ((struct F30016 *)(data_ov002_022cd300 + 0x16))->b1 = 1;
    data_ov002_022cd300[8] = 0;
    other = 1 - arg0;
    for (i = 0; i <= 4; i++)
        if (func_ov002_02271608(other, i, 0)) return 1;
    return 0;
}
