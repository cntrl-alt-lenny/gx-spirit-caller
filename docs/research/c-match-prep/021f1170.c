/* CAMPAIGN-PREP candidate for func_021f1170 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: owner :1 guard call; mla index (+0x30 baked); explicit packed compare, single field read
 *   risk:       021bc8c8 is called here with ONE arg (r0=owner) — only r0 is set, so the per-TU extern must be 1-arg even though sibling callers use 3-arg func(owner,side,state). struct-guessed/signature: campaign must reconcile the extern arity at integration.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f1170 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. Drop into src/, ninja+objdiff, tweak per risk.
 *   mla index + packed field-compare vs *(u16*)(obj+4), gated by a single 021bc8c8(owner) call.
 *   obj saved in r5, side->r6, state->r4; field read once (r1) and used across the compare.
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern u8  data_ov002_022cf16c[];
extern int func_ov002_021bc8c8(int owner);

int func_ov002_021f1170(void *obj, int side, int state)
{
    u32 field;
    u16 h;
    u32 op1, op2;

    if (func_ov002_021bc8c8((int)(((u32)*(u16 *)((u8 *)obj + 2) << 31) >> 31)) == 0)
        return 0;

    field = *(u32 *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + state * 0x14);
    h     = *(u16 *)((u8 *)obj + 4);

    op1 = ((((u32)field << 2) >> 24) << 1) + (((u32)field << 18) >> 31);
    op2 = ((u32)h << 17) >> 23;
    return op1 != op2 ? 1 : 0;
}
