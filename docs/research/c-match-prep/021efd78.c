/* CAMPAIGN-PREP candidate for func_021efd78 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     raw lsl/lsr to mirror multi-field bit extracts; field reload kept once
 *   risk:       the compound a=((field<<2>>24)<<1)+(field<<18>>31) vs b=(h<<17>>23): mwcc's shift folding/scheduling of these 5 shifts likely reorders -> permuter-class (shift sequence + add fusion coin-flip).
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int side, int state);
extern int func_ov002_021c2084(void *obj, int side, int state, int flag);

int func_ov002_021efd78(void *obj, int side, int state)
{
    u32 field;
    u32 a;
    u32 b;

    if ((u32)((*(u16 *)((u8 *)obj + 2) << 31) >> 31) != (u32)side)
        return 0;
    if (state < 5) {
        if (func_ov002_021b8fcc(side, state) == 0)
            return 0;
    }

    field = *(u32 *)(data_ov002_022cf16c + (side & 1) * 0x868 + state * 0x14 + 0x30);
    if (((field << 0x13) >> 0x13) == 0)
        return 0;

    a = (((field << 2) >> 0x18) << 1) + ((field << 0x12) >> 0x1f);
    b = (*(u16 *)((u8 *)obj + 4) << 0x11) >> 0x17;
    if (a == b)
        return 0;

    return func_ov002_021c2084(obj, side, state, 1) != 0 ? 1 : 0;
}
