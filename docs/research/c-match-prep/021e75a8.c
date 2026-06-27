/* CAMPAIGN-PREP candidate for func_021e75a8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base/off once; field&0x1fff (non-imm mask => lsl19;lsr19); field13 held in r4 across ladder
 *   risk:       field13 must survive 4 calls in one callee-saved reg (orig r4) and `& 0x1fff` must compile to lsl#19;lsr#19 (0x1fff is not an ARM immediate, so it should). reshape-able (force a :13 bitfield if mwcc emits two ANDs).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021e75a8 (ov002, class C) — MED tier.
 *   recipe: cell base (a1&1)*0x868 + a2*0x14 reused 3x; low13 field guard; call ladder
 * func_021e75a8(a0,a1,a2): field13=*(int*)(cf16c+base+0x30)&0x1fff; if 0 ret 0;
 *   guard ladder (021b8fcc/021c1ef0/021c2084 + flag bits); final 0202b878(field13)==0x17.
 */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int  func_0202b878(int x);
extern int  func_ov002_021b8fcc(int a1, int a2);
extern int  func_ov002_021c1ef0(int a0, int a1, int a2);
extern int  func_ov002_021c2084(int a0, int a1, int a2, int a3);

int func_ov002_021e75a8(int a0, int a1, int a2)
{
    int base = (a1 & 1) * 0x868;
    int off  = a2 * 0x14;
    int field13;

    field13 = *(int *)(data_ov002_022cf16c + base + off + 0x30) & 0x1fff;
    if (field13 == 0)
        return 0;

    if (a2 < 5) {
        if (func_ov002_021b8fcc(a1, a2) == 0)
            return 0;
    }
    if (a2 == 0xa)
        return 0;
    if (func_ov002_021c1ef0(a0, a1, a2) == 0)
        return 0;
    if (func_ov002_021c2084(a0, a1, a2, 1) == 0)
        return 0;

    if ((*(int *)(data_ov002_022cf1ac + base + off) >> 9) & 1)
        return 0;

    if (*(unsigned short *)(data_ov002_022cf1a4 + base + off) == 0)
        return 1;

    return func_0202b878(field13) == 0x17 ? 1 : 0;
}
