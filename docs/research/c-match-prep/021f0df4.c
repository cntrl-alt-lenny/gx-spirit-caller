/* CAMPAIGN-PREP candidate for func_021f0df4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind row=side*0x868 (reused 3x) -> mul;mul;add;add; v held in r6
 *   risk:       asm computes v(=field<<19>>19) into r6 BEFORE the cmp r2,#5 and holds it across 3 calls. If mwcc recomputes v after the state guard or doesn't keep r6, the early mla block reorders. reshape-able: compute v before the state-branch (done). struct-guessed strides.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern u8 data_ov002_022cf1ac[];
extern int func_0202b878(u32 v);
extern int func_0202b8c0(u32 v);
extern int func_ov002_021b8fcc(int side, int state);

int func_ov002_021f0df4(void *obj, int side, int state)
{
    int row;
    u32 v;

    row = (side & 1) * 0x868;
    v = (*(u32 *)(data_ov002_022cf16c + row + state * 0x14 + 0x30) << 0x13) >> 0x13;

    if (state < 5) {
        if (func_ov002_021b8fcc(side, state) == 0)
            return 0;
    }
    if (func_0202b878(v) != 0x17)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + row + state * 0x14) == 0)
        return 0;
    if (func_0202b8c0(v) != 4)
        return 0;
    return ((*(u32 *)(data_ov002_022cf1ac + row + state * 0x14) >> 9) & 1) == 0 ? 1 : 0;
}
