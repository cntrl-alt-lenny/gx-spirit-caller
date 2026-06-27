/* CAMPAIGN-PREP candidate for func_020091d8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/DISPATCH switch + TAIL CALL (case0 returns callee)
 *   risk:       case1 third-arg may emit mov r2,#1 vs orig's mov r2,r0; func arg types guessed
 *   confidence: high
 */
/* func_020091d8 — small dispatch switch on arg0, two cases (Style A) */

extern void func_02008bf4(void);
extern int  func_02008c68(int a, int b, int c);
extern int  func_02008f9c(int a, int b);

int func_020091d8(int sel, int a, int b)
{
    func_02008bf4();
    if (sel == 0)
        return func_02008f9c(a, b);
    if (sel == 1) {
        func_02008c68(1, a, 1);
        return 1;
    }
    return 0;
}
