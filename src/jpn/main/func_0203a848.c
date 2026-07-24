/* CAMPAIGN-PREP candidate for func_0203a848 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     lock/call/unlock wrapper, 1-arg, void (inner result discarded)
 *   risk:       inner result genuinely discarded (no mov r4,r0) - void return must hold; otherwise textbook
 *   confidence: high
 */
/* func_0203a848 - set guard flag, lock, call inner (discard), unlock, clear flag */

extern int  data_0219b248;
extern int  data_0219b2a4;
extern int  func_0203a88c(int a0);
extern void func_020926d0(int *lock);
extern void func_02092660(int *lock);

void func_0203a848(int a0)
{
    data_0219b248 = 1;
    func_020926d0(&data_0219b2a4);
    func_0203a88c(a0);
    func_02092660(&data_0219b2a4);
    data_0219b248 = 0;
}
