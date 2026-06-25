/* CAMPAIGN-PREP candidate for func_021e30b4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs a1>>1 guard; sign-bit arg via &0x80000000>>31; reuse 021fd81c result as 021e2e80 arg0
 *   risk:       (a0&0x80000000)>>31 must emit and #-2147483648 + lsr#31; if mwcc folds to a bare lsr#31 (no and) the sign-extract arg diverges. reshape-able (try ((unsigned)a0>>31) vs masked form).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021e30b4 (ov002, class C) — MED tier.
 *   recipe: decl r6/r5/r4=args; if((a1>>1)==0) v=021b97d4(sign(a0),(u16)a0); guard then 2 calls
 * func_021e30b4(a0,a1,a2): v=(u16)a1; if(a1>>1==0) v=(u16)021b97d4((a0&0x80000000)>>31,(u16)a0);
 *   if(021fd81c(a0,v,a2)==0) return 0; 021e2e80(ret,a0,v,a2); return 1.
 */

typedef unsigned short u16;

extern int func_ov002_021b97d4(int sign, u16 lo);
extern int func_ov002_021fd81c(int a0, int v, int a2);
extern int func_ov002_021e2e80(int r, int a0, int v, int a2);

int func_ov002_021e30b4(int a0, int a1, int a2)
{
    int v = a1;
    int r;

    if ((a1 >> 1) == 0)
        v = (u16)func_ov002_021b97d4((a0 & 0x80000000) >> 31, (u16)a0);

    r = func_ov002_021fd81c(a0, v, a2);
    if (r == 0)
        return 0;

    func_ov002_021e2e80(r, a0, v, a2);
    return 1;
}
