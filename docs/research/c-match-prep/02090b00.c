/* CAMPAIGN-PREP candidate for func_02090b00 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD early-return + do-while poll; double-eval helper; callee-saved args
 *   risk:       WaitByLoop is declared void(void) elsewhere — the (unsigned) param decl forces `mov r0,#0x400` but signature mismatch is benign at link; helper arg-save register assignment may reorder. Med-high.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02090b00 (main, class A).
 * recipe:  poll-retry: call helper once; if <=0 bail; else loop
 *          { WaitByLoop(0x400); } while (helper(...) > 0). The 4 args are
 *          referenced in BOTH call sites so mwcc parks them in callee-saved
 *          r8/r7/r6/r5 (matching the orig's mov r8..r5 saves). r4 holds 0x400.
 *          Both the early guard and the loop condition re-evaluate the helper
 *          (two `bl func_020909d0` sites).
 */
extern int func_020909d0(int a, int b, int c, int d);
extern void WaitByLoop(unsigned int count);  /* r0 = loop count */

void func_02090b00(int a, int b, int c, int d) {
    if (func_020909d0(a, b, c, d) <= 0)
        return;
    do {
        WaitByLoop(0x400);
    } while (func_020909d0(a, b, c, d) > 0);
}
