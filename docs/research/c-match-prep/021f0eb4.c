/* CAMPAIGN-PREP candidate for func_021f0eb4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     no owner-check; side*0x868 mla-fused; locals state/obj/side r4/r6/r5 order
 *   risk:       asm saves r4=state,r6=obj,r5=side in that exact stm/mov order before the state branch. mwcc's argument-save order may differ (r4=side first), flipping which callee regs hold side/state. reshape-able by decl/use order; else permuter-class on the 3 movs saves.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int side, int state);
extern int func_ov002_021c1ef0(void *obj, int side, int state);
extern int func_ov002_021c2084(void *obj, int side, int state, int flag);

int func_ov002_021f0eb4(void *obj, int side, int state)
{
    u32 field;

    if (state < 5) {
        if (func_ov002_021b8fcc(side, state) == 0)
            return 0;
    }

    field = *(u32 *)(data_ov002_022cf16c + (side & 1) * 0x868 + state * 0x14 + 0x30);
    if (((field << 0x13) >> 0x13) == 0)
        return 0;

    if (func_ov002_021c1ef0(obj, side, state) == 0)
        return 0;

    return func_ov002_021c2084(obj, side, state, 1) != 0 ? 1 : 0;
}
