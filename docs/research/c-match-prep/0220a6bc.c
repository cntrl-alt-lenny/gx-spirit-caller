/* CAMPAIGN-PREP candidate for func_0220a6bc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :1 and :9 bitfields, u16-trunc then >>8 mask, eq-guards return early
 *   risk:       arg order/const 0xb,0x16be of func_021b3fd8 inferred from reg setup; mwcc may reorder r1/r3 fills (permuter-class) or extract field via and not lsl;lsr if not a true bitfield.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

struct Obj_0220a6bc {
    u16 h0;          /* +0 */
    u16 f0 : 1;      /* +2 bit0 */
    u16 p2 : 15;
    u16 q4lo : 6;    /* +4 bits0..5 */
    u16 f4 : 9;      /* +4 bits6..14 */
    u16 q4hi : 1;
};

extern s32 func_ov002_021ca2b8(u32 a);
extern s32 func_ov002_021b947c(u32 a);
extern s32 func_ov002_021b3fd8(u32 a, s32 b, s32 c, u32 d);

s32 func_ov002_0220a6bc(struct Obj_0220a6bc *p) {
    s32 r;
    r = func_ov002_021ca2b8(p->f0);
    if (r == 0) return 0;
    r = func_ov002_021b947c(p->f4);
    if ((((u32)(u16)r >> 8) & 0xff) != 0xf) return 0;
    return func_ov002_021b3fd8(p->f0, 0xb, 0x16be, p->f4) == 0;
}
