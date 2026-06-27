/* CAMPAIGN-PREP candidate for func_02020164 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     simple guard, two-call tail, cmp;moveq early-return
 *   risk:       void return type (no explicit r0 set on the p->f2 path); ldrh from arg r0 at 0x2
 *   confidence: high
 */
struct State { unsigned short f0; unsigned short f2; };
extern void func_0201f0e4(int);
extern void func_0201f148(void);
extern int func_02020198(void);
extern void func_02020b4c(void);

void func_02020164(struct State *p)
{
    if (p->f2 != 0) {
        func_0201f148();
        func_02020b4c();
        return;
    }
    if (func_02020198() != 0)
        return;
    func_0201f0e4(9);
    return;
}
