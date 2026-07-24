/* CAMPAIGN-PREP candidate for func_0203a528 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     lock/call/unlock wrapper, 3-arg passthrough
 *   risk:       literal-load vs flag-store scheduling before the bl may reorder; otherwise textbook
 *   confidence: high
 */
/* func_0203a528 - sibling of func_0203a4d0, forwards all three args to the inner */

extern int  data_0219b248;
extern int  data_0219b2a4;
extern int  func_0203a320(int a, int b, int c);
extern void func_020926d0(int *lock);
extern void func_02092660(int *lock);

int func_0203a528(int a0, int a1, int a2)
{
    int r;

    data_0219b248 = 1;
    func_020926d0(&data_0219b2a4);
    r = func_0203a320(a0, a1, a2);
    func_02092660(&data_0219b2a4);
    data_0219b248 = 0;
    return r;
}
