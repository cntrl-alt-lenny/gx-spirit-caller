/* CAMPAIGN-PREP candidate for func_0200925c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/DISPATCH switch + TAIL CALL (case0 returns callee)
 *   risk:       callee-saved reg slot for saved args may differ; func arg types guessed
 *   confidence: high
 */
/* func_0200925c — small dispatch switch on arg0, two cases (Style A) */

extern void func_02008bf4(void);
extern int  func_02008c68(int a, int b, int c);
extern int  func_02009230(int a);

int func_0200925c(int sel, int a)
{
    func_02008bf4();
    if (sel == 0)
        return func_02009230(a);
    if (sel == 1) {
        func_02008c68(1, a, 0);
        return 1;
    }
    return 0;
}
