/* CAMPAIGN-PREP candidate for func_02020880 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear calls, cmp #2;moveq early-return
 *   risk:       _LIT0=data ptr (r0), _LIT1=func_020208c4 addr (r1); cmp #0x2; literal pool order of the two .words
 *   confidence: high
 */
extern unsigned char data_02193440[];
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern int func_020208c4(void);
extern int func_0209f070(void *a, void *b, int c);

int func_02020880(void)
{
    func_0201f138(3);
    if (func_0209f070(data_02193440, func_020208c4, 0) == 2)
        return 1;
    func_0201f19c();
    func_0201f138(10);
    return 0;
}
