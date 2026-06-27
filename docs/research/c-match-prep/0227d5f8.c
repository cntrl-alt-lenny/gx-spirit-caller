/* CAMPAIGN-PREP candidate for func_0227d5f8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: result accumulator-first, base bound to one reg, 1<<(j+base) order
 *   risk:       orig computes `r0=j+base` then `1<<r0` only on the ne path; mwcc may hoist the add or pick a different scratch reg for the shift amount. reshape-able (operand/decl-order).
 *   confidence: med
 */
extern int func_ov002_0227d5dc(int a, int b, int c, int d);

int func_ov002_0227d5f8(int a, int b)
{
    int result;
    int i;
    int j;
    int shift;
    int base;

    result = 0;
    base = 0;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 4; j++) {
            if (func_ov002_0227d5dc(a, i, j, b) != 0) {
                result |= 1 << (j + base);
            }
        }
        base += 0x10;
    }
    return result;
}
