/* CAMPAIGN-PREP candidate for func_0220aad0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bind loaded v (reused 3x), 2D mla index *0x868+*0x14, signed/unsigned cmps vs v
 *   risk:       func_021ca698 2nd arg is reused r0(bitfield)=mov r1,r0; if mwcc recomputes f0 instead of reusing the reg, an extra ldrh/shift appears (reshape-able: pass same local twice). field f5 stride 0x14 struct-guessed.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

struct Obj_0220aad0 {
    u16 h0;          /* +0 */
    u16 f0 : 1;      /* +2 bit0 */
    u16 f1 : 4;      /* +2 bits1..4 */
    u16 f5 : 6;      /* +2 bits5..10 */
    u16 p2 : 5;
};

extern u8 data_ov002_022cf180[];
extern u8 data_ov002_022cf1a8[];
extern s32 func_ov002_021ca698(u32 a, u32 b);
extern s32 func_ov002_022577dc(struct Obj_0220aad0 *p);

s32 func_ov002_0220aad0(struct Obj_0220aad0 *p) {
    s32 v;
    s32 r;
    s32 t;
    v = *(s32 *)(data_ov002_022cf1a8 + p->f0 * 0x868 + p->f5 * 0x14);
    if (v == 0) return 0;
    r = func_ov002_021ca698(p->f0, p->f0);
    if (r == 0) return 0;
    t = *(s32 *)(data_ov002_022cf180 + p->f0 * 0x868);
    if ((u32)t < (u32)v) return 0;
    r = func_ov002_022577dc(p);
    if (r < v) return 0;
    return 2;
}
