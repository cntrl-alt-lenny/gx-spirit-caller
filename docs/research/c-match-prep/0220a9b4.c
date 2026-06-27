/* CAMPAIGN-PREP candidate for func_0220a9b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: eor of two :1 bitfields (bit14^bit0) as table index, strided *0x868
 *   risk:       bit14 position (lsl#0x11) inferred; eor operand order r2^(r3>>31) sets dest — if mwcc swaps, eor src order flips (reshape-able: swap xor operands). mov r1,#1 hoist hints structure.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

struct Obj_0220a9b4 {
    u16 h0;          /* +0 */
    u16 f0 : 1;      /* +2 bit0 */
    u16 p2a : 13;
    u16 fe : 1;      /* +2 bit14 */
    u16 p2b : 1;
};

extern u8 data_ov002_022cf17c[];
extern s32 func_ov002_021ca63c(u32 a);

s32 func_ov002_0220a9b4(struct Obj_0220a9b4 *p) {
    s32 r;
    s32 t;
    u32 idx;
    r = func_ov002_021ca63c(p->f0);
    if (r == 0) return 0;
    idx = (u32)p->fe ^ (u32)p->f0;
    t = *(s32 *)(data_ov002_022cf17c + (idx & 1) * 0x868);
    return t != 0;
}
