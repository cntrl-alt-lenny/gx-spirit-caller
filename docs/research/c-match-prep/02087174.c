/* CAMPAIGN-PREP candidate for func_02087174 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     clean call sequence + save/reuse retval (r4)
 *   risk:       Relies on mwcc keeping the func_020955a8 result in r4 across func_02095678(1); if it reorders or omits r4 save the epilogue regs change.
 *   confidence: high
 */
/* func_02087174: straight call sequence; save one retval, reuse it last. */
extern void func_0208881c(void);
extern void func_02095030(int a, int b, int c, int d);
extern int func_020955a8(void);
extern void func_02095678(int a);
extern void func_020955e8(int a);

void func_02087174(void) {
    int saved;
    func_0208881c();
    func_02095030(0, 0, 0, 0);
    saved = func_020955a8();
    func_02095678(1);
    func_020955e8(saved);
}
