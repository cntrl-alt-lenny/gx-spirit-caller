/* CAMPAIGN-PREP candidate for func_0203ab9c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     lock/call/unlock wrapper, identical shape, different inner
 *   risk:       inner result discarded -> void; same scheduling caveat as func_0203a898
 *   confidence: high
 */
/* func_0203ab9c - identical wrapper to func_0203a898 around func_0203aae8 */

extern int  data_0219b328;
extern int  data_0219b384;
extern int  func_0203aae8(int a0);
extern void func_020927b8(int *lock);
extern void func_02092748(int *lock);

void func_0203ab9c(int a0)
{
    data_0219b328 = 1;
    func_020927b8(&data_0219b384);
    func_0203aae8(a0);
    func_02092748(&data_0219b384);
    data_0219b328 = 0;
}
