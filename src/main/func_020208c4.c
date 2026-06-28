/* CAMPAIGN-PREP candidate for func_020208c4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain, call dispatch, duplicated teardown tails
 *   risk:       _LIT0=func_02020860 address passed as r0 ptr; the two identical teardown blocks must not be CSE-merged; ldrh from arg at 0x2
 *   confidence: med
 */
struct State { unsigned short f0; unsigned short f2; };
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern int func_02020860(void);
extern int func_0209e8d0(void *p);

void func_020208c4(struct State *p)
{
    if (p->f2 != 0) {
        func_0201f19c();
        func_0201f138(10);
        return;
    }
    if (func_0209e8d0(func_02020860) != 0) {
        func_0201f19c();
        func_0201f138(10);
        return;
    }
    func_0201f138(1);
    return;
}
