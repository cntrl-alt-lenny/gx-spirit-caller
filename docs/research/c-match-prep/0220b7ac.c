/* CAMPAIGN-PREP candidate for func_0220b7ac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :1 bitfield arg reused, repeated guarded bl chain, signed lt/ge tails
 *   risk:       final movge#1/movlt#0 maps to (r>=1); if mwcc emits cmp #1/movlt vs cmp #0 the const may shift (reshape-able). 022536e8 3rd-arg consts 0x194f/0x1950 inferred from _LIT order.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

struct Obj_0220b7ac {
    u16 h0;          /* +0 */
    u16 f0 : 1;      /* +2 bit0 */
    u16 p2 : 15;
};

extern s32 func_ov002_021ca2b8(u32 a);
extern s32 func_ov002_021ff2b8(u32 a);
extern s32 func_ov002_022536e8(u32 a, u16 b, s32 c);

s32 func_ov002_0220b7ac(struct Obj_0220b7ac *p) {
    s32 r;
    r = func_ov002_021ff2b8(p->f0);
    if (r < 3) return 0;
    r = func_ov002_021ca2b8(p->f0);
    if (r == 0) return 0;
    r = func_ov002_022536e8(p->f0, p->h0, 0x194f);
    if (r < 2) return 0;
    r = func_ov002_022536e8(p->f0, p->h0, 0x1950);
    return r >= 1;
}
