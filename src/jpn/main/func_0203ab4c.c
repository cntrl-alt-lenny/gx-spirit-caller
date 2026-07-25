/* CAMPAIGN-PREP candidate for func_0203ab4c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     lock/call/unlock wrapper, identical shape, different inner
 *   risk:       inner result discarded -> void; same scheduling caveat as func_0203a848
 *   confidence: high
 */
/* func_0203ab4c - identical wrapper to func_0203a848 around func_0203aa98 */

extern int  data_0219b248;
extern int  data_0219b2a4;
extern int  func_0203aa98(int a0);
extern void func_020926d0(int *lock);
extern void func_02092660(int *lock);

void func_0203ab4c(int a0)
{
    data_0219b248 = 1;
    func_020926d0(&data_0219b2a4);
    func_0203aa98(a0);
    func_02092660(&data_0219b2a4);
    data_0219b248 = 0;
}
