/* CAMPAIGN-PREP candidate for func_021f1504 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Bind po(r5) and row(r4) once, both reused for ldrh; mul-mul-add base, 13-bit field guard
 *   risk:       orig holds po in r5 and row in r4 across 2 uses (mul r5 / mul r4 then add, later ldrh [r4,r0]); if mwcc rematerializes either offset the index regs and ldrh form diverge. reshape-able (separate po/row locals, used as-is).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern int func_0202e2c8(void);
extern int func_ov002_021c1e44(int a, int b, int c);

int func_ov002_021f1504(int a0, int a1, int a2)
{
    int po;
    int row;

    if (a2 >= 5)
        return 0;
    po  = (a1 & 1) * 0x868;
    row = a2 * 0x14;
    if (((*(u32 *)(data_ov002_022cf16c + po + row + 0x30) << 0x13) >> 0x13) == 0)
        return 0;
    if (func_0202e2c8() == 0)
        return 0;
    if (*(u16 *)((char *)(unsigned)row + (int)(data_ov002_022cf1a4 + po)) == 0)
        return 0;
    if (func_ov002_021c1e44(a0, a1, a2) != 0)
        return 0;
    return 1;
}
