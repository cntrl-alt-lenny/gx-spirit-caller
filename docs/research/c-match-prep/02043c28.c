/* CAMPAIGN-PREP candidate for func_02043c28 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order a,b,c=r8,r7,r6; loop-invariant immediates held; mid-test while-loops
 *   risk:       reshape-able: poll-loop constants 4/1 and 0x40000/2 must hoist into callee-saved r5/r4 (asm holds them); if mwcc re-movs each iter the two loops diverge.
 *   confidence: med
 */
extern int WaitByLoop(int cycles);
extern int func_02043b38();
extern int func_02043d3c(int sel, int a, int b, int c);
extern void func_020928e8(int a, int b);
extern int func_0209640c(int a, int b);
extern void func_02096434(int a, int (*cb)());

int func_02043c28(int a, int b, void *c)
{
    while (func_0209640c(4, 1) == 0)
        ;
    func_02096434(4, func_02043b38);
    func_020928e8((int)c, b);
    while (func_02043d3c(2, a, b, (int)c) != 1)
        WaitByLoop(0x40000);
    return 1;
}
