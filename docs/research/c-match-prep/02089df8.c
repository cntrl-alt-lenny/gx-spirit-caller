/* CAMPAIGN-PREP candidate for func_02089df8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD chain + if/else + 5-arg call (stack slot) + && tail-guard
 *   risk:       func_02089f60 5th arg passed via [sp]; signature arity/order guessed. &func ref must hit the literal pool. p1 stored once.
 *   confidence: med
 */
/* func_02089df8: guard chain (cluster-33). Returns handle r4.
 *
 *   r7=p0, r6=p1, r5=p2
 *   r4 = func_02089024(p0); if (r4 != 0) goto end
 *   if (p2 == 0) arg2 = 0; else arg2 = func_020893f0()
 *   r4 = func_02089f60(p0, &func_02089bd4, arg2, p0, [sp]=p1)
 *   if (p2 != 0 && r4 != 0) func_02089008(p0, r4)
 *   return r4
 */

extern int  func_02089024(int a);
extern int  func_020893f0(void);
extern int  func_02089f60(int a, void *b, int c, int d, int e);
extern void func_02089008(int a, int b);
extern void func_02089bd4(void);

int func_02089df8(int p0, int p1, int p2) {
    int r;
    int arg2;

    r = func_02089024(p0);
    if (r != 0) return r;

    if (p2 == 0) {
        arg2 = 0;
    } else {
        arg2 = func_020893f0();
    }

    r = func_02089f60(p0, (void *)&func_02089bd4, arg2, p0, p1);
    if (p2 != 0 && r != 0) {
        func_02089008(p0, r);
    }
    return r;
}
