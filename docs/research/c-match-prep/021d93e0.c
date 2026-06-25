/* CAMPAIGN-PREP candidate for func_021d93e0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order args; bind cell once; duplicate both pack arms; (short)a2 for asr+lsr
 *   risk:       (short)a2 must yield lsl;asr;lsl;lsr (s16 then u16); if proto-narrowing collapses to one lsl;lsr the 3rd arg diverges. reshape-able (drop/keep the short cast).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021d93e0 (ov002, class C) — MED tier.
 *   recipe: decl r6/r5/r4=args; v=021b9ecc(a0); if(020312a0(v)==0)ret; mirror arms
 * Two arms (arg2>0 vs <=0) pack identically and tail-call 021d479c(0x803c|0x3c,...).
 */

typedef unsigned short u16;

extern char data_ov002_022cf1a8[];
extern int  func_020312a0(int x);
extern int  func_ov002_021b9ecc(int a);
extern int  func_ov002_021d479c(u16 a, u16 b, u16 c, int d);

int func_ov002_021d93e0(int a0, int a1, int a2)
{
    int cell;

    if (func_020312a0(func_ov002_021b9ecc(a0)) == 0)
        return 0;

    cell = *(int *)(data_ov002_022cf1a8 + a1 * 0x14 + (a0 & 1) * 0x868);

    if (a2 > 0) {
        return func_ov002_021d479c((a0 != 0 ? 0x8000 : 0) | 0x3c, a1, (short)a2, 1);
    }
    if (cell <= 0)
        return cell;
    return func_ov002_021d479c((a0 != 0 ? 0x8000 : 0) | 0x3c, a1, (short)a2, 1);
}
