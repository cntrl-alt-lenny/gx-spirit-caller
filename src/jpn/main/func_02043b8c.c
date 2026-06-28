/* CAMPAIGN-PREP candidate for func_02043b8c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: preserve arg0/2/3 across first call; arg order a1,a2,a3 then a0,a3,a2
 *   risk:       reshape-able: param-preservation — orig copies a0->r6,a2->r5,a3->r4 before call1 so they survive. If mwcc picks a different callee-saved assignment the mov shuffle reorders; pure register rotation, may need permuter.
 *   confidence: med
 */
/* func_02043b8c - main - class C
 * arg shuffle + two calls; r6=arg0, r5=arg2, r4=arg3 held across first call
 */
extern int func_02043c54(void *a, void *b, void *c);
extern int func_020a734c(void *a, void *b, void *c); /* memcmp-like */

int func_02043b8c(void *a0, void *a1, void *a2, void *a3)
{
    if (func_02043c54(a1, a2, a3) == 0)
        return 0;
    if (func_020a734c(a0, a3, a2) == 0)
        return 1;
    return 0;
}
