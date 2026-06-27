/* CAMPAIGN-PREP candidate for func_021f0624 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: double-mla index, :13 guard, short-circuit &&-chain -> cmpeq...moveq#1/movne#0
 *   risk:       orig loads w=*(u32*)(obj+0x14) into r0 ONLY inside the ==0xf branch (ldreq) and reuses r0 for both sub-compares; if mwcc hoists w or splits it into two loads, the predicated ldreq/cmpeq layout diverges. reshape-able (guard the w read with the &&).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f0624 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. Drop into src/, ninja+objdiff, tweak per risk.
 *   Leaf: double-mla index + :13 guard, then a short-circuit cmpeq predicate over obj fields.
 *   Tail is moveq#1/movne#0 at a join: (k6==0xf && side==w_bit16 && state==w_bits[17:20]).
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern u8 data_ov002_022cf16c[];

int func_ov002_021f0624(void *obj, int side, int state)
{
    u32 field;
    u16 flags;
    u32 w;

    if (state >= 5)
        return 0;

    field = *(u32 *)(data_ov002_022cf16c + (side & 1) * 0x868 + state * 0x14 + 0x30);
    if (((field << 19) >> 19) == 0)
        return 0;

    flags = *(u16 *)((u8 *)obj + 2);
    w = *(u32 *)((u8 *)obj + 0x14);
    if (((u32)((u32)flags << 20) >> 26) == 0xf &&
        (u32)side  == (((u32)w << 15) >> 31) &&
        (u32)state == (((u32)w << 11) >> 28))
        return 1;
    return 0;
}
