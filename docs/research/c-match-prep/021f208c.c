/* CAMPAIGN-PREP candidate for func_021f208c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hold r3=parity*0x868 + ip=slot*0x14 across 3 tables; mul; :13 bitfield; parity bit guard
 *   risk:       orig computes r3(parity*0x868) and ip(slot*0x14) once, reuses for all 3 tables via add lr,tbl,r3; ldrh [ip,lr]. mwcc may refold per use. reshape-able via shared off temps
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a2[];
extern u8 data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(void);

int func_ov002_021f208c(void *a, int p, int s)
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
    if (func_ov002_021c1ef0() != 0)
        return 1;
    return 0;
}
