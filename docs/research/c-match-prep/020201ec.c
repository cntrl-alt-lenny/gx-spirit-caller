/* CAMPAIGN-PREP candidate for func_020201ec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear calls, cmp #2;moveq early-return, void tail calls
 *   risk:       _LIT0 holds func_02020224 address passed as r0 pointer; cmp #0x2 specific; literal pool layout
 *   confidence: high
 */
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern int func_02020224(void);
extern void func_02020b84(void);
extern int func_0209e91c(void *p, int n);

int func_020201ec(void)
{
    func_0201f138(3);
    if (func_0209e91c(func_02020224, 0) == 2)
        return 1;
    func_0201f19c();
    func_02020b84();
    return 0;
}
