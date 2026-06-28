/* CAMPAIGN-PREP candidate for func_02020870 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain, call dispatch, duplicated teardown tails
 *   risk:       _LIT0=func_0202080c address passed as r0 ptr; the two identical teardown blocks must not be CSE-merged; ldrh from arg at 0x2
 *   confidence: med
 */
struct State { unsigned short f0; unsigned short f2; };
extern void func_0201f0e4(int);
extern void func_0201f148(void);
extern int func_0202080c(void);
extern int func_0209e7dc(void *p);

void func_02020870(struct State *p)
{
    if (p->f2 != 0) {
        func_0201f148();
        func_0201f0e4(10);
        return;
    }
    if (func_0209e7dc(func_0202080c) != 0) {
        func_0201f148();
        func_0201f0e4(10);
        return;
    }
    func_0201f0e4(1);
    return;
}
