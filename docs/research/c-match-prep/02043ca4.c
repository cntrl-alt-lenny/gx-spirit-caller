/* CAMPAIGN-PREP candidate for func_02043ca4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 cast (lsl16/lsr16) on b not bitfield; c used-first; unprototyped 1- vs 2-arg func_020928cc
 *   risk:       permuter-class: asm allocates c->r4, a->r6, b->r5 (b in LOWER reg than a); mwcc may swap a/b between r5/r6 — decl/use-order reshape may not pin it.
 *   confidence: med
 */
extern int WaitByLoop(int cycles);
extern int func_02043b38();
extern int func_02043d3c(int sel, int a, int b, int c);
extern int func_020928cc();
extern int func_0209640c(int a, int b);
extern void func_02096434(int a, int (*cb)());

int func_02043ca4(int a, int b, void *c)
{
    func_020928cc(c);
    while (func_0209640c(4, 1) == 0)
        ;
    func_02096434(4, func_02043b38);
    while (func_02043d3c(1, a, (unsigned short)b, (int)c) != 1)
        WaitByLoop(0x40000);
    func_020928cc(c, b);
    return 1;
}
