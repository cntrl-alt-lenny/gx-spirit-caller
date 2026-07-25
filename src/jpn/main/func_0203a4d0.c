/* CAMPAIGN-PREP candidate for func_0203a4d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     lock-flag set; call helper around inner; reload flag to clear; 2-arg
 *   risk:       scheduling of the two literal-pool loads vs the flag store before the bl may differ slightly
 *   confidence: high
 */
/* func_0203a4d0 - set guard flag, lock, call inner, unlock, clear flag, return inner result */

extern int  data_0219b248;
extern int  data_0219b2a4;
extern int  func_0203a320(int a, int b, int c);
extern void func_020926d0(int *lock);
extern void func_02092660(int *lock);

int func_0203a4d0(int a0, int a1)
{
    int r;

    data_0219b248 = 1;
    func_020926d0(&data_0219b2a4);
    r = func_0203a320(a0, a1, 0);
    func_02092660(&data_0219b2a4);
    data_0219b248 = 0;
    return r;
}
