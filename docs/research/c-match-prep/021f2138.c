/* CAMPAIGN-PREP candidate for func_021f2138 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r6=obj,r5=p,r4=s held; r3=parity*0x868,r2=slot*0x14 shared; :13 bitfield
 *   risk:       orig reuses r3=parity*0x868 and r2=slot*0x14 for both tables (add r0,tbl,r3; ldrh [r2,r0]); decl-order of off temps must keep them live. reshape-able
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern int func_ov002_021c1e44(void *a, int p, int s);
extern int func_ov002_021c8940(int p, int s);

int func_ov002_021f2138(void *a, int p, int s)
{
    int off_parity;
    int off_slot;
    u16 h;

    if (s >= 5)
        return 0;
    h = ((u16 *)a)[1];
    if (p == ((u32)(h << 0x1f) >> 0x1f))
        return 0;
    off_parity = (p & 1) * 0x868;
    off_slot = s * 0x14;
    if (((*(u32 *)(&data_ov002_022cf16c[off_parity + off_slot + 0x30]) << 0x13) >> 0x13) == 0)
        return 0;
    if (*(u16 *)(&data_ov002_022cf1a4[off_parity + off_slot]) == 0)
        return 0;
    if (func_ov002_021c8940(p, s) != 7)
        return 0;
    if (func_ov002_021c1e44(a, p, s) == 0)
        return 1;
    return 0;
}
