/* CAMPAIGN-PREP candidate for func_0203a898 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     lock/call/unlock wrapper, 1-arg, void (inner result discarded)
 *   risk:       inner result genuinely discarded (no mov r4,r0) - void return must hold; otherwise textbook
 *   confidence: high
 */
/* func_0203a898 - set guard flag, lock, call inner (discard), unlock, clear flag */

extern int  data_0219b328;
extern int  data_0219b384;
extern int  func_0203a8dc(int a0);
extern void func_020927b8(int *lock);
extern void func_02092748(int *lock);

void func_0203a898(int a0)
{
    data_0219b328 = 1;
    func_020927b8(&data_0219b384);
    func_0203a8dc(a0);
    func_02092748(&data_0219b384);
    data_0219b328 = 0;
}
