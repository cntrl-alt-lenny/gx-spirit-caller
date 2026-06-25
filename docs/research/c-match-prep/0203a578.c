/* CAMPAIGN-PREP candidate for func_0203a578 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     lock/call/unlock wrapper, 3-arg passthrough
 *   risk:       literal-load vs flag-store scheduling before the bl may reorder; otherwise textbook
 *   confidence: high
 */
/* func_0203a578 - sibling of func_0203a520, forwards all three args to the inner */

extern int  data_0219b328;
extern int  data_0219b384;
extern int  func_0203a370(int a, int b, int c);
extern void func_020927b8(int *lock);
extern void func_02092748(int *lock);

int func_0203a578(int a0, int a1, int a2)
{
    int r;

    data_0219b328 = 1;
    func_020927b8(&data_0219b384);
    r = func_0203a370(a0, a1, a2);
    func_02092748(&data_0219b384);
    data_0219b328 = 0;
    return r;
}
