/* CAMPAIGN-PREP candidate for func_021f10d0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base then add #0x30 before mul-row ldr; 13-bit lo (lsl19;lsr19) + bit13 (lsl18;lsr31)
 *   risk:       orig forms (base+0x30) then ldr [r1,row]; mwcc may fold +0x30 into ldr offset or reorder the two shift-extracts of f (lo then bit13). reshape-able (extract lo first, keep f live).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c1a2c(int a, int b, int c);
extern int func_ov002_021c1e44(int a, int b, int c);

int func_ov002_021f10d0(u16 *a0, int a1, int a2)
{
    int po;
    u32 f;
    int lo;

    if (a2 >= 5)
        return 0;
    po = (a1 & 1) * 0x868;
    f  = *(u32 *)((char *)(data_ov002_022cf16c + po + 0x30) + a2 * 0x14);
    lo = (f << 0x13) >> 0x13;
    if (lo == 0)
        return 0;
    if (a1 != (int)((f << 0x12) >> 0x1f))
        return 0;
    if (func_ov002_021c1a2c(a1, a2, *a0) == 0)
        return 0;
    if (func_ov002_021c1e44((int)a0, a1, a2) != 0)
        return 0;
    return 1;
}
