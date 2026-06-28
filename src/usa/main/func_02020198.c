/* CAMPAIGN-PREP candidate for func_02020198 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear calls, cmp #2;moveq early-return, void tail calls
 *   risk:       _LIT0 holds func_020201d0 address passed as r0 pointer; cmp #0x2 specific; literal pool layout
 *   confidence: high
 */
extern void func_0201f0e4(int);
extern void func_0201f148(void);
extern int func_020201d0(void);
extern void func_02020b30(void);
extern int func_0209e828(void *p, int n);

int func_02020198(void)
{
    func_0201f0e4(3);
    if (func_0209e828(func_020201d0, 0) == 2)
        return 1;
    func_0201f148();
    func_02020b30();
    return 0;
}
