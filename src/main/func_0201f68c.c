/* CAMPAIGN-PREP candidate for func_0201f68c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard/branch-tail, cmp;moveq early-return, void tail call
 *   risk:       data_021922e0 may need &data[0] vs data; literal pool ordering for the one .word should match
 *   confidence: high
 */
extern unsigned char data_021922e0[];
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern int func_020a0604(void *p, int n);

int func_0201f68c(void)
{
    func_0201f138(6);
    if (func_020a0604(data_021922e0, 0xd) == 0)
        return 1;
    func_0201f19c();
    return 0;
}
