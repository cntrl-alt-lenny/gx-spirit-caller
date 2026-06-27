/* CAMPAIGN-PREP candidate for func_0208a864 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: signed (x<<30)>>31 bit-extract; two separate early returns; orr|=8; store-order
 *   risk:       reshape-able: keep the two if() early-returns separate (asm has two distinct .L_1d0/.L_1e0 tail calls), not `||`; a `||` merge would emit one branch instead of two. Bit-extract via shifts should match.
 *   confidence: med
 */
/* func_0208a864 (main, class D): test bit1 of field110 via lsl#0x1e;
 * asr#0x1f (sign-extract bit1). If clear OR arg1==0 -> tail call A.
 * Else: subobj op, set bit3 of field110, clear field150.
 *   mov r1,r3,lsl#0x1e; movs r1,r1,asr#0x1f => signed (field110<<30)>>31
 *   i.e. ((field110>>1)&1) as a sign — use signed :2 bitfield, test <0. */
typedef struct {
    char _pad_000[0xe8];
    char sub[0x28];     /* +0xe8 */
    char _pad_110[0x110 - 0xe8 - 0x28];
    int  flags;         /* +0x110 */
    char _pad_114[0x150 - 0x114];
    int  field150;      /* +0x150 */
} Obj_0208a864;

extern void func_0208a7c8(Obj_0208a864 *o);
extern void func_0208b0a4(void *sub, int v);

void func_0208a864(Obj_0208a864 *o, int arg1) {
    int bit1 = (o->flags << 30) >> 31;
    if (bit1 == 0) {
        func_0208a7c8(o);
        return;
    }
    if (arg1 == 0) {
        func_0208a7c8(o);
        return;
    }
    func_0208b0a4((char *)o + 0xe8, 0);
    o->flags |= 8;
    o->field150 = 0;
}
