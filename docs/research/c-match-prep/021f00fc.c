/* CAMPAIGN-PREP candidate for func_021f00fc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cmp side,(bit) operand order (side first); :13 tail movne#1
 *   risk:       first cmp is 'cmp r5,r0lsr#31' (side is first operand, eq->return0) -- operand order picks which side is the shifted form. If mwcc swaps to cmp bit,side the movcc condition inverts. reshape-able by writing side==bitfield (side on left).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int side, int state);

int func_ov002_021f00fc(void *obj, int side, int state)
{
    u32 field;

    if ((u32)side == (u32)((*(u16 *)((u8 *)obj + 2) << 31) >> 31))
        return 0;
    if (state < 5) {
        if (func_ov002_021b8fcc(side, state) == 0)
            return 0;
    }

    field = *(u32 *)(data_ov002_022cf16c + (side & 1) * 0x868 + state * 0x14 + 0x30);
    return ((field << 0x13) >> 0x13) != 0 ? 1 : 0;
}
