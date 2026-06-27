/* CAMPAIGN-PREP candidate for func_021e2d94 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla cell base; field>>a2 &1 if-equal early-return; void tail pack with 4 u16 args
 *   risk:       Modeled void so early-out leaves r0=a0 with no fixup; if 021d479c/this actually returns int, the equal-path return value diverges. reshape-able (switch to int + explicit return).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021e2d94 (ov002, class C) — MED tier.
 *   recipe: cell base mla; (field>>a2)&1 == a3 guard; else 021c9b80(); tail 021d479c pack
 * func_021e2d94(a0,a1,a2,a3): field=*(int*)(cf1ac+(a0&1)*0x868+a1*0x14);
 *   if (((field>>a2)&1)==a3) return; 021c9b80(); 021d479c((a0?0x8000:0)|0x2a, a1,a2,a3).
 */

typedef unsigned short u16;

extern char data_ov002_022cf1ac[];
extern void func_ov002_021c9b80(void);
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);

void func_ov002_021e2d94(int a0, int a1, int a2, int a3)
{
    int field = *(int *)(data_ov002_022cf1ac + (a0 & 1) * 0x868 + a1 * 0x14);

    if (a3 == ((field >> a2) & 1))
        return;

    func_ov002_021c9b80();
    func_ov002_021d479c((a0 != 0 ? 0x8000 : 0) | 0x2a, a1, a2, a3);
}
