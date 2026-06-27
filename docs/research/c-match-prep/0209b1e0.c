/* CAMPAIGN-PREP candidate for func_0209b1e0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload d83d0 base after call (caller-clobber); spin while!=0; orr operand-first mask|imm
 *   risk:       orig reloads data_021a83d0 address into r1 after func_0209adb4 and again after the spin (does not bind across the call). If mwcc keeps the base in a callee-saved reg, ldr count drops. reshape-able only via -O level; else permuter-class.
 *   confidence: med
 */
/* func_0209b1e0: spin-wait on flag, then config stores with masks/orr. */

extern int data_021a83d0;
extern int data_021a83d4;

extern int  func_0209b4e4(void);
extern void func_0209adb4(unsigned int arg);
extern void func_0209aa84(int a, int b, int c, int d);

int func_0209b1e0(unsigned int a, unsigned int b) {
    if (func_0209b4e4() == 0)
        return 1;
    data_021a83d0 = 0;
    func_0209adb4(0x03006000);
    while (data_021a83d0 != 0)
        ;
    data_021a83d0 = 0;
    data_021a83d4 = 0;
    func_0209aa84(0, 2, 0, 0);
    func_0209adb4((a & 0xff) | 0x02006100);
    func_0209adb4((b & 0x0000ffff) | 0x01010000);
    return 0;
}
