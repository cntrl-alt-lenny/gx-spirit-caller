/* CAMPAIGN-PREP candidate for func_021efa38 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     side*0x868 mla-fused; :1 and :13 via lsl/lsr; if-assign boolean tails
 *   risk:       mwcc may emit AND not LSL;LSR for the (h<<31)>>31 :1 read; reshape-able by using a u16 :1 bitfield struct member instead.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_0202e2f8(u32 field);
extern int func_ov002_021c23ac(int side, int state);

int func_ov002_021efa38(void *obj, int side, int state)
{
    u32 field;

    if ((u32)((*(u16 *)((u8 *)obj + 2) << 31) >> 31) != (u32)side)
        return 0;
    if (state >= 5)
        return 0;

    field = *(u32 *)(data_ov002_022cf16c + (side & 1) * 0x868 + state * 0x14 + 0x30);
    if (((field << 0x13) >> 0x13) == 0)
        return 0;

    if (func_0202e2f8(field) != 0)
        return 1;
    return func_ov002_021c23ac(side, state) != 0 ? 1 : 0;
}
