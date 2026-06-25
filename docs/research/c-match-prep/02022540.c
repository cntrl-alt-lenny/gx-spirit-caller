/* CAMPAIGN-PREP candidate for func_02022540 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: scan from 1; signed f48>=0 continue; -1 via ~0; reuse a0 (r0) as stored value
 *   risk:       orig is fully predicated (mvnge/addlt/strlt/movlt) with the loaded value in r1 leaving a0 untouched in r0 to store. mwcc may emit a real branch+merge for the if instead of predication. reshape-able (single-return ternary) but likely permuter-class on the cmp-coin-flip
 *   confidence: med
 */
/* func_02022540: linear scan (stride 0x10) for first f48<0 slot in
 * [1,0x100); claim it with a0 and return index, else return -1. */

extern char data_02197434[];

int func_02022540(int a0) {
    int i = 1;
    while (i < 0x100 && *(int *)(data_02197434 + (i << 4) + 0x48) >= 0) {
        i++;
    }
    if (i >= 0x100) return -1;
    *(int *)(data_02197434 + (i << 4) + 0x48) = a0;
    return i;
}
