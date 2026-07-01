/* CAMPAIGN-PREP candidate for func_02087144 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Poll-until-zero while loop; stable arg in callee-saved reg; tail call sequence
 *   risk:       mwcc may pass #0 immediate instead of caching 0 in r4, dropping the mov r4 setup
 *   confidence: med
 */
/* func_02087144: poll func_02095828(0) until it returns 0, then run a
 * fixed call sequence. The poll arg is a stable 0 held in a callee-saved
 * reg (mov r4,#0; mov r0,r4 each iteration), so keep it as a local that
 * never changes rather than an immediate.
 */

extern int  func_02095828(int a);
extern void func_020879cc(void);
extern void func_02088bd8(void);
extern void func_0208a810(void);
extern void func_02095584(int a);

void func_02087144(void) {
    int i = 0;
    while (func_02095828(i) != 0) {
    }
    func_020879cc();
    func_02088bd8();
    func_0208a810();
    func_02095584(0);
}
