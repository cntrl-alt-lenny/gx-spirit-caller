/* CAMPAIGN-PREP candidate for func_0207d274 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind data_021a08d4 to r4 (held across call, reused as default); conditional +0xc via if-assign not ternary
 *   risk:       Reshape-able: orig keeps data_021a08d4 in r4 across the bl and reuses it as the null-return value; if mwcc reloads the literal instead of preserving r4, one ldr diverges — bind/reload flip.
 *   confidence: high
 */
extern char data_021a08d4[];
extern char *func_0207d29c(char *root, int key);

char *func_0207d274(int key)
{
    char *r;

    r = func_0207d29c(data_021a08d4, key);
    if (r != 0)
        r = r + 0xc;
    else
        r = data_021a08d4;
    return r;
}
