/* CAMPAIGN-PREP candidate for func_021f2ac8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r6=obj,r5=p,r4=s held; r3=parity*0x868,ip=slot*0x14 shared 3 tables; :13 bitfield
 *   risk:       orig holds r3=parity*0x868 + ip=slot*0x14 live across 3 table loads + 3 calls (caller-saved spill pattern); mwcc reg-alloc across the call chain may rotate. permuter-class
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a2[];
extern u8 data_ov002_022cf1a4[];
extern int func_ov002_021c1e44(void *a, int p, int s);
extern int func_ov002_021c1ef0(void);
extern int func_ov002_021c2084(void *a, int p, int s, int f);

int func_ov002_021f2ac8(void *a, int p, int s)
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
    if (*(u16 *)(&data_ov002_022cf1a2[off_parity + off_slot]) != 0)
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    if (func_ov002_021c1e44(a, p, s) != 0)
        return 0;
    if (func_ov002_021c2084(a, p, s, 1) != 0)
        return 1;
    return 0;
}
