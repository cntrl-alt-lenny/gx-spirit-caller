/* CAMPAIGN-PREP candidate for func_0209393c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: halfword guard early-return; do/while poll with constants 0xc,1 hoisted (r5,r4)
 *   risk:       mwcc may not pre-load the loop-invariant constants 0xc(r5) and 1(r4) into callee-saved regs before the loop — if it remats mov each iter, codegen differs but is small. reshape-able (none reliable) → permuter-class.
 *   confidence: med
 */
// func_0209393c — one-shot init guard, then poll func_0209640c(0xc,1) until nonzero, register cb
// r5=0xc, r4=1 held across loop

extern unsigned short data_021a66f0;   // init flag (halfword)
extern void func_020938f8(void);       // callback registered
extern void func_02096228(void);
extern int  func_0209640c(int a, int b);
extern void func_02096434(int id, void *cb);

void func_0209393c(void) {
    if (data_021a66f0 != 0)
        return;
    data_021a66f0 = 1;
    func_02096228();
    do {
    } while (func_0209640c(0xc, 1) == 0);
    func_02096434(0xc, func_020938f8);
}
