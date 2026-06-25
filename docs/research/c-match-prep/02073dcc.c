/* CAMPAIGN-PREP candidate for func_02073dcc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind global once (single ldr); 4-group || returning bool, climbing accumulator regs
 *   risk:       mwcc may lower || as branch-to-common-return instead of the default-1/conditional-clear (movne r0,#0) idiom the asm uses. reshape-able (keep bool-returning ||).
 *   confidence: med
 */
/* func_02073dcc: short-circuit OR chain returning a 0/1 bool.
 * asm climbs accumulator regs r0->r2->r4->r5 (one per OR-group),
 * each defaulted to 1 and conditionally cleared to 0; return = r5.
 * data_0219ef1c is bound once (single ldr,[r1]) and used twice.
 * 0x7f000001 == 127.0.0.1 (loopback) -> this is a network address check. */
extern int data_0219ef1c;
extern int func_02073e54(int param);
extern int func_02073e68(int param);

int func_02073dcc(int param) {
    int g = data_0219ef1c;
    return (g == 0 || param == g) ||
           param == 0x7f000001 ||
           func_02073e68(param) != 0 ||
           func_02073e54(param) != 0;
}
