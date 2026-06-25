/* CAMPAIGN-PREP candidate for func_02095418 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     retry loop; hoist invariant consts 0x64/7/1 into callee-saved regs (class C bind)
 *   risk:       orig hoists 0x64/7/1 into r6/r5/r4 across the do-while; if mwcc rematerializes movs inside the loop the body diverges. reshape-able (lift consts to locals before loop).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02095418 (main, class C) — MED tier.
 * UNVERIFIED build-free draft. Campaign drops into src/, runs ninja+objdiff,
 * tweaks per risk note if <100%.
 *   recipe:  retry loop; hoist loop-invariant consts 0x64/7/1 into callee-saved regs
 *   class C: decl-order + bind-vs-reload of the three small int constants
 */
/* func_02095418: register a callback (func_02095484) on slot 7, two guarded
 * early-returns, then spin calling func_02093814(0x64) until func_0209640c(7,1)
 * reports done. Returns nothing; early-return paths fall straight out. */

extern void func_02093814(int a);
extern int  func_02095344(void);
extern void func_02095484(void);
extern int  func_0209640c(int a, int b);
extern void func_02096434(int slot, int value);

void func_02095418(void)
{
    if (func_02096434(7, (int)func_02095484), func_02095344() != 0)
        return;
    if (func_0209640c(7, 1) != 0)
        return;
    do {
        func_02093814(0x64);
    } while (func_0209640c(7, 1) == 0);
}
