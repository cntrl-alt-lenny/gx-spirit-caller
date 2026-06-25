/* CAMPAIGN-PREP candidate for func_0208a574 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed if(x<0) default-load (ldrlt) order p3,p2,p1; reuse c(r0) and s5 into stack slots
 *   risk:       orig keeps the ctx ptr in r0 and stores it to [sp] while reloading s5 from incoming stack into ip. If mwcc moves ctx to a callee reg before the call, the str r0,[sp] + arg regs diverge. reshape-able (decl/operand order).
 *   confidence: med
 */
// func_0208a574 — fetch ctx, fill negative args from defaults, tail-marshal (simpler twin)
extern void *func_0208938c(int a);
extern int   func_0208a344(int a0, int a1, int a2, int a3, void *s4, int s5);

int func_0208a574(int p0, int p1, int p2, int p3, int s5)
{
    void *c;
    c = func_0208938c(s5);
    if (c == 0) {
        return 0;
    }
    if (p3 < 0) p3 = *(unsigned char  *)((char *)c + 0x8);
    if (p2 < 0) p2 = *(unsigned short *)((char *)c + 0x4);
    if (p1 < 0) p1 = *(unsigned char  *)((char *)c + 0x9);
    return func_0208a344(p0, p1, p2, p3, c, s5);
}
