/* CAMPAIGN-PREP candidate for func_0201a4fc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     discard GetSystemWork; switch case1 / case2,3 fall-through; unsigned /5000 magic 0xd1b71759>>0xc
 *   risk:       reshape-able: the compare-chain (cmp#1 beq; cmp#2 cmpne#3 beq; b default) requires case 2 and 3 share a body via fall-through; if mwcc emits a different branch shape, reorder/merge cases. Divisor 5000 verified.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201a4fc (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. switch(func_0201a4a8()) with two unsigned /5000
 * (magic 0xd1b71759, highword >>0xc). GetSystemWork() called for side effect, result unused.
 */
extern char data_02105e6c[];
extern char *GetSystemWork(void);
extern int func_0201a4a8(void);

int func_0201a4fc(void) {
    GetSystemWork();
    switch (func_0201a4a8()) {
    case 1:
        return *(unsigned int *)(data_02105e6c + 0x854) / 5000U;
    case 2:
    case 3:
        return *(unsigned int *)(data_02105e6c + 0x858) / 5000U;
    default:
        return 0;
    }
}
