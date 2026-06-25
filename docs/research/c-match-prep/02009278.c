/* CAMPAIGN-PREP candidate for func_02009278 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/DISPATCH switch + TAIL CALL (case0 returns callee)
 *   risk:       callee-saved reg slot for saved args may differ; func arg types guessed
 *   confidence: high
 */
/* func_02009278 — small dispatch switch on arg0, two cases (Style A) */

extern void func_02008c10(void);
extern int  func_02008c84(int a, int b, int c);
extern int  func_0200924c(int a);

int func_02009278(int sel, int a)
{
    func_02008c10();
    if (sel == 0)
        return func_0200924c(a);
    if (sel == 1) {
        func_02008c84(1, a, 0);
        return 1;
    }
    return 0;
}
