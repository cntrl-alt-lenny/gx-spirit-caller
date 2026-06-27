/* CAMPAIGN-PREP candidate for func_0220b85c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :6/:1 bitfields, strh hc store-order preserved, branch on ==0x23, shared tail .L_84
 *   risk:       the two return-2 paths share epilogue (.L_84); mwcc may not coalesce, emitting two mov#2 (reshape-able via single tail var) — or branch-order of the 0x23 test flips (permuter-class). hc offset 0xc struct-guessed.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

struct Obj_0220b85c {
    u16 h0;          /* +0 */
    u16 f0 : 1;      /* +2 bit0 */
    u16 p2a : 5;
    u16 f6 : 6;      /* +2 bits6..11 */
    u16 p2b : 4;
    u8  pad4[6];     /* +4..+0xb */
    u16 hc;          /* +0xc */
};

extern s32 func_ov002_021ff2b8(u32 a);
extern s32 func_ov002_02207b3c(struct Obj_0220b85c *p);
extern s32 func_ov002_022577dc(struct Obj_0220b85c *p);

s32 func_ov002_0220b85c(struct Obj_0220b85c *p) {
    s32 r;
    r = func_ov002_02207b3c(p);
    if (r == 0) return 0;
    if (p->f6 == 0x23) {
        r = func_ov002_021ff2b8(p->f0);
        if (r == 0) return 0;
        return 2;
    }
    p->hc = 0;
    r = func_ov002_022577dc(p);
    if (r < 2) return 0;
    p->hc = 2;
    r = func_ov002_022577dc(p);
    if (r == 0) return 0;
    return 2;
}
