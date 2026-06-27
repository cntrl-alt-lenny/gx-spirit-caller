/* CAMPAIGN-PREP candidate for func_021ef9c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: mla-fused index (+0x30 baked into base); inline :13 shift guard; explicit packed compare
 *   risk:       orig fuses base as mla r3,(side&1),0x868,cf16c then adds #0x30 and indexes by state*0x14 with field held in r3 across the :13 guard AND the compare (single read). If decl-order makes mwcc reload field, one ldr diverges. reshape-able (one field local).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ef9c4 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. Drop into src/, ninja+objdiff, tweak per risk.
 *   Leaf: mla index (mla r3,r1,r3,ip then +0x30, mul state*0x14) + :13 guard + packed field compare
 *   vs *(u16*)(obj+4). No calls. Twin of 021eef88 without the cf1a4 guard, single field read.
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern u8 data_ov002_022cf16c[];

int func_ov002_021ef9c4(void *obj, int side, int state)
{
    u32 field;
    u16 h;
    u32 op1, op2;

    if (state > 4)
        return 0;

    field = *(u32 *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + state * 0x14);
    if (((field << 19) >> 19) == 0)
        return 0;

    h = *(u16 *)((u8 *)obj + 4);
    op1 = ((((u32)field << 2) >> 24) << 1) + (((u32)field << 18) >> 31);
    op2 = ((u32)h << 17) >> 23;
    return op1 != op2 ? 1 : 0;
}
