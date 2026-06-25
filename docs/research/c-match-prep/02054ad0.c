/* CAMPAIGN-PREP candidate for func_02054ad0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ptr-diff early-eq-return then divmod-by-name, add base back
 *   risk:       BUG: r0 into func_020b3870 comes from func_02054b1c's return (r0 preserved), not a dummy — should be func_020b3870(func_02054b1c(), d)+r5; placeholder name will not compile, fix to single call.
 *   confidence: low
 */
extern int func_02054b1c(void);
extern int func_020b3870(int a, int b);

int func_02054ad0(char *r5, char *r1) {
    int d = r1 - r5;
    if (d == 0) {
        return (int)r5;
    }
    func_02054b1c();
    return func_020b3870(func_02054b1c_dummy(), d) + (int)r5;
}
