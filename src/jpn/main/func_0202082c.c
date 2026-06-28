/* CAMPAIGN-PREP candidate for func_0202082c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear calls, cmp #2;moveq early-return
 *   risk:       _LIT0=data ptr (r0), _LIT1=func_02020870 addr (r1); cmp #0x2; literal pool order of the two .words
 *   confidence: high
 */
extern unsigned char data_02193360[];
extern void func_0201f0e4(int);
extern void func_0201f148(void);
extern int func_02020870(void);
extern int func_0209ef7c(void *a, void *b, int c);

int func_0202082c(void)
{
    func_0201f0e4(3);
    if (func_0209ef7c(data_02193360, func_02020870, 0) == 2)
        return 1;
    func_0201f148();
    func_0201f0e4(10);
    return 0;
}
