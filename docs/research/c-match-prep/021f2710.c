/* CAMPAIGN-PREP candidate for func_021f2710 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r4=obj held; lr=parity*0x868,ip=slot*0x14 shared 2 tables; :13 bitfield; byte-extract h6
 *   risk:       struct field offsets +0x6 (h6, masked 0xFF via lsl16/lsr24) and +0x8 (h8) guessed; also lr/ip share-base reuse across both tables. struct-guessed
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern int func_ov002_021c8470(int p, int s);

int func_ov002_021f2710(void *a, int p, int s)
{
    int off_parity;
    int off_slot;
    u16 h6;
    u16 h8;

    if (s >= 5)
        return 0;
    off_parity = (p & 1) * 0x868;
    off_slot = s * 0x14;
    if (((*(u32 *)(&data_ov002_022cf16c[off_parity + off_slot + 0x30]) << 0x13) >> 0x13) == 0)
        return 0;
    if (*(u16 *)(&data_ov002_022cf1a4[off_parity + off_slot]) == 0)
        return 0;
    h6 = ((u16 *)a)[3];
    if (((u32)(h6 << 0x10) >> 0x18) == 0)
        return 1;
    h8 = ((u16 *)a)[4];
    if (h8 == func_ov002_021c8470(p, s))
        return 1;
    return 0;
}
