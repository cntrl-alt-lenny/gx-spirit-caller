/* CAMPAIGN-PREP candidate for func_020201b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     simple guard, two-call tail, cmp;moveq early-return
 *   risk:       void return type (no explicit r0 set on the p->f2 path); ldrh from arg r0 at 0x2
 *   confidence: high
 */
struct State { unsigned short f0; unsigned short f2; };
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern int func_020201ec(void);
extern void func_02020ba0(void);

void func_020201b8(struct State *p)
{
    if (p->f2 != 0) {
        func_0201f19c();
        func_02020ba0();
        return;
    }
    if (func_020201ec() != 0)
        return;
    func_0201f138(9);
    return;
}
