/* CAMPAIGN-PREP candidate for func_021efefc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     index computed before obj load to match r4=side,r5=state,r6=obj order
 *   risk:       asm allocates side->r4,state->r5,obj->r6 and computes the mla BEFORE saving obj (mov r6,r0 late). If mwcc loads obj first, r4/r5/r6 assignment and ldr-pool ordering diverge. reshape-able by declaring/using side&state before obj.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_0202e2f8(u32 field);
extern int func_ov002_021c1e44(void *obj, int side, int state);

int func_ov002_021efefc(void *obj, int side, int state)
{
    u32 field;

    field = *(u32 *)(data_ov002_022cf16c + (side & 1) * 0x868 + state * 0x14 + 0x30);
    if (((field << 0x13) >> 0x13) == 0)
        return 0;

    if (func_0202e2f8(field) == 0)
        return 0;

    return func_ov002_021c1e44(obj, side, state) == 0 ? 1 : 0;
}
