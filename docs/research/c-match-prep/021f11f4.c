/* CAMPAIGN-PREP candidate for func_021f11f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Bind nothing extra; mul row + mla parity base, ldrh [row, global]; pass-result temp t
 *   risk:       ldrh uses (a2*0x14) as base reg and global as index (ldrh [r1,r0]); mwcc may pick global as base, swapping the two add operands. reshape-able (swap operand order in the address add).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf1a4[];
extern int func_0202b890(int h);
extern int func_ov002_021c93cc(int a, int b, int c);
extern int func_ov002_021e7868(int a, int b, int c);

int func_ov002_021f11f4(u16 *a0, int a1, int a2)
{
    int t;

    if (func_ov002_021e7868((int)a0, a1, a2) == 0)
        return 0;
    if (*(u16 *)((char *)(unsigned)(a2 * 0x14) + (int)(data_ov002_022cf1a4 + (a1 & 1) * 0x868)) == 0)
        return 0;
    t = func_0202b890(*a0);
    if (func_ov002_021c93cc(a1, a2, t) != 0)
        return 1;
    return 0;
}
