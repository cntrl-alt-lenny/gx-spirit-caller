/* CAMPAIGN-PREP candidate for func_021f02b0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind row=side*0x868 (reused by cf1a4) -> mul;mul;add;add not mla
 *   risk:       row=side*0x868 reused for cf1a4 forces mul r5,mul r4,add,add; bind is correct. Risk: the field<<19>>19 is passed straight to func_0202e2f8 (no movs guard) -- mwcc must keep lsl;lsr in args. permuter-class on the r5/r4/r8 callee-saved assignment around 3 calls.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern int func_0202e2f8(u32 field);
extern int func_ov002_021b90a8(int side, int state);
extern int func_ov002_021bc8c8(u32 owner, int side, int state);

int func_ov002_021f02b0(void *obj, int side, int state)
{
    int row;
    u32 field;
    u32 owner;

    row = (side & 1) * 0x868;
    field = *(u32 *)(data_ov002_022cf16c + row + state * 0x14 + 0x30);

    if (func_0202e2f8((field << 0x13) >> 0x13) != 0)
        return 0;
    if (func_ov002_021b90a8(side, state) == 0)
        return 0;

    owner = (*(u16 *)((u8 *)obj + 2) << 31) >> 31;
    if (func_ov002_021bc8c8(owner, side, state) == 0)
        return 0;

    if (((*(u16 *)((u8 *)obj + 2) << 31) >> 31) != (u32)side) {
        if (*(u16 *)(data_ov002_022cf1a4 + row + state * 0x14) == 0)
            return 0;
    }
    return 1;
}
