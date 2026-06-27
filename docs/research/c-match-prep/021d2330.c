/* CAMPAIGN-PREP candidate for func_021d2330 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order: ldrsh args, each <<12 to Q12, forward to distance fn
 *   risk:       permuter-class: orig homes the 4 s16 args to stack then re-packs into 2 ldmia-loaded pairs in a fixed strh/str order (sp+8,sp+c,sp+4,sp+0); direct C arg-passing won't reproduce the stack-pack shuffle.
 *   confidence: low
 */
/* func_ov011_021d2330: read 4 sign-extended s16 args (homed to stack), shift
 * each <<12 (int->Q12), pack into two 2-int stack pairs in a SPECIFIC store
 * order, load them back as (x0,y0)/(x1,y1) and tail-call func_ov011_021d22d4.
 * Store order from asm: sp+8=a<<12, sp+c=b<<12, sp+4=d<<12, sp+0=c<<12;
 * then args = {sp+8,sp+c}=(?, ?) and {sp+0,sp+4}. */
extern int func_ov011_021d22d4(int x0, int y0, int x1, int y1);

int func_ov011_021d2330(short a, short b, short c, short d) {
    int p0 = (int)a << 12;
    int p1 = (int)b << 12;
    int p2 = (int)c << 12;
    int p3 = (int)d << 12;
    return func_ov011_021d22d4(p0, p1, p2, p3);
}
