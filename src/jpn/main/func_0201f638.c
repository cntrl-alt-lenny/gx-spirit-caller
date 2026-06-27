/* CAMPAIGN-PREP candidate for func_0201f638 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard/branch-tail, cmp;moveq early-return, void tail call
 *   risk:       data_02192200 may need &data[0] vs data; literal pool ordering for the one .word should match
 *   confidence: high
 */
extern unsigned char data_02192200[];
extern void func_0201f0e4(int);
extern void func_0201f148(void);
extern int func_020a0510(void *p, int n);

int func_0201f638(void)
{
    func_0201f0e4(6);
    if (func_020a0510(data_02192200, 0xd) == 0)
        return 1;
    func_0201f148();
    return 0;
}
