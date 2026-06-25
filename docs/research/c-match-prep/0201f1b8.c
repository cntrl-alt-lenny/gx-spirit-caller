/* CAMPAIGN-PREP candidate for func_0201f1b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear call seq + one cmp/early-return (==2 -> 1)
 *   risk:       low-med; func_0209eee0 arg types cosmetic; func_0201f138 return-type vs void must not add a mov
 *   confidence: high
 */
/* func_0201f1b8: linear sequence with one early return. func_0201f138(3);
 * then if func_0209eee0(&func_0201f1f8, data_02191fe0) == 2 return 1; else
 * func_0201f19c(); func_0201f138(9); return 0. Mirrors house style of
 * func_0201f724. func_0201f19c is called with no args (r0 left as-is). */

extern int func_0201f138(int n);
extern void func_0201f19c(void);
extern int func_0201f1f8(void *p);
extern int func_0209eee0(int (*fn)(void *), void *data);
extern char data_02191fe0[];

int func_0201f1b8(void) {
    func_0201f138(3);
    if (func_0209eee0(func_0201f1f8, data_02191fe0) == 2) {
        return 1;
    }
    func_0201f19c();
    func_0201f138(9);
    return 0;
}
