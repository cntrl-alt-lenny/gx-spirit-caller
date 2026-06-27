/* CAMPAIGN-PREP candidate for func_0201f164 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear call seq + one cmp/early-return (==2 -> 1)
 *   risk:       low-med; func_0209edec arg types cosmetic; func_0201f0e4 return-type vs void must not add a mov
 *   confidence: high
 */
/* func_0201f164: linear sequence with one early return. func_0201f0e4(3);
 * then if func_0209edec(&func_0201f1a4, data_02191f00) == 2 return 1; else
 * func_0201f148(); func_0201f0e4(9); return 0. Mirrors house style of
 * func_0201f6d0. func_0201f148 is called with no args (r0 left as-is). */

extern int func_0201f0e4(int n);
extern void func_0201f148(void);
extern int func_0201f1a4(void *p);
extern int func_0209edec(int (*fn)(void *), void *data);
extern char data_02191f00[];

int func_0201f164(void) {
    func_0201f0e4(3);
    if (func_0209edec(func_0201f1a4, data_02191f00) == 2) {
        return 1;
    }
    func_0201f148();
    func_0201f0e4(9);
    return 0;
}
