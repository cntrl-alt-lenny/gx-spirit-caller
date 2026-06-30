/* CAMPAIGN-PREP candidate for func_0208708c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     clean call sequence + save/reuse retval (r4)
 *   risk:       Relies on mwcc keeping the func_020954b4 result in r4 across func_02095584(1); if it reorders or omits r4 save the epilogue regs change.
 *   confidence: high
 */
/* func_0208708c: straight call sequence; save one retval, reuse it last. */
extern void func_02088734(void);
extern void func_02094f3c(int a, int b, int c, int d);
extern int func_020954b4(void);
extern void func_02095584(int a);
extern void func_020954f4(int a);

void func_0208708c(void) {
    int saved;
    func_02088734();
    func_02094f3c(0, 0, 0, 0);
    saved = func_020954b4();
    func_02095584(1);
    func_020954f4(saved);
}
