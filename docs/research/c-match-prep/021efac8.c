/* CAMPAIGN-PREP candidate for func_021efac8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     side*0x868 mla-fused; :1 and :13 lsl/lsr; eq-zero->1 boolean tail
 *   risk:       tail is moveq#1/movne#0 (return ==0); if mwcc inverts the compare sense the two mov order flips. reshape-able via explicit (x==0)?1:0 ordering. Also obj uses r0 not saved (single-call) so reg pressure differs.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c1e44(void *obj);

int func_ov002_021efac8(void *obj, int side, int state)
{
    u32 field;

    if ((u32)((*(u16 *)((u8 *)obj + 2) << 31) >> 31) != (u32)side)
        return 0;
    if (state >= 5)
        return 0;

    field = *(u32 *)(data_ov002_022cf16c + (side & 1) * 0x868 + state * 0x14 + 0x30);
    if (((field << 0x13) >> 0x13) == 0)
        return 0;

    return func_ov002_021c1e44(obj) == 0 ? 1 : 0;
}
