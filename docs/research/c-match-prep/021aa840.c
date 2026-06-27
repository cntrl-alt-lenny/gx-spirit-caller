/* CAMPAIGN-PREP candidate for func_021aa840 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: strh trio in asm order; cmp-chain == 1||2||3; rsb=-x
 *   risk:       struct-guessed/reshape-able: facing read as `cmp #1;cmpne #2;cmpne #3` -> keep the explicit `t==1||t==2||t==3` (an `(unsigned)(t-1)<=2` rewrite emits sub/cmp instead). sx/sy/sz offsets inferred -- confirm +0x12c/0x12e/0x130.
 *   confidence: med
 */
/* func_ov000_021aa840: write three shorts into the active object's sub-struct
 * at +0x100 {+0x2c,+0x2e,+0x30}; if facing is 1/2/3 negate the first two.
 *   ip = *data_ov000_021c73e0
 *   t  = ip->facing (+0x140 signed :4)
 *   if (t==1||t==2||t==3) { p=ip+0x100; p[0x2c]=-a0; p[0x2e]=-a1; p[0x30]=a2; }
 *   else                  { p=ip+0x100; p[0x2c]= a0; p[0x2e]= a1; p[0x30]=a2; }
 * Struct shape confirmed by neighbour func_ov000_021aa7e0 (facing :4 @ +0x140). */
struct Ov000ObjF {
    char pad[0x100];        /* +0x000 */
    char sub[0x2c];         /* +0x100 */
    short sx;               /* +0x12c */
    short sy;               /* +0x12e */
    short sz;               /* +0x130 */
    char pad2[0x140 - 0x132];
    int facing : 4;         /* +0x140 signed :4 */
};
extern struct Ov000ObjF *data_ov000_021c73e0;
void func_ov000_021aa840(int a0, int a1, int a2) {
    struct Ov000ObjF *obj = data_ov000_021c73e0;
    int t = obj->facing;
    if (t == 1 || t == 2 || t == 3) {
        obj->sx = (short)-a0;
        obj->sy = (short)-a1;
        obj->sz = (short)a2;
    } else {
        obj->sx = (short)a0;
        obj->sy = (short)a1;
        obj->sz = (short)a2;
    }
}
