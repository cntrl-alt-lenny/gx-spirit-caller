/* CAMPAIGN-PREP candidate for func_02089f60 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD chain (==0 return 0) + 4-arg call (stack slot) + compare-return
 *   risk:       p4 is the incoming 5th arg at [sp+0x20]; func_020897fc 4th arg p3 via [sp]. `a+0x20` is byte offset on int — confirm pointer type. Multiple movne early-returns must fold.
 *   confidence: med
 */
/* func_02089f60: linear call chain with repeated `==0 -> return 0`
 * early-outs and a 5th stack arg.
 *
 *   r8=p0, r7=p1, r6=p2, r4=p3, [sp+0x20]=p4 (5th arg)
 *   r5 = func_020890e4(p0);            if (r5==0) return 0
 *   if (p4 == 0) return 0
 *   r4 = func_020897fc(r5+0x20, p1, p2, p3 via [sp]);  if (r4==0) return 0
 *   if (r5 != func_0208906c(p0, r4, r5, 0)) return 0
 *   func_020928e8(r4, r5)
 *   return r4
 */

extern int func_020890e4(int a);
extern int func_020897fc(int a, int b, int c, int d);
extern int func_0208906c(int a, int b, int c, int d);
extern void func_020928e8(int a, int b);

int func_02089f60(int p0, int p1, int p2, int p3, int p4) {
    int a;
    int b;

    a = func_020890e4(p0);
    if (a == 0) return 0;
    if (p4 == 0) return 0;

    b = func_020897fc(a + 0x20, p1, p2, p3);
    if (b == 0) return 0;

    if (a != func_0208906c(p0, b, a, 0)) return 0;

    func_020928e8(b, a);
    return b;
}
