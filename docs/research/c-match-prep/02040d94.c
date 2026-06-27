/* CAMPAIGN-PREP candidate for func_02040d94 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: bind de8 result to one local; result-first reg-alloc; unsigned bound cmp
 *   risk:       reshape-able: func_02043728 arg eval order — orig computes func_020aaddc(p) inline before the call; if mwcc spills p across it, r4/r0 shuffle diverges (decl-order/operand-order fix).
 *   confidence: med
 */
/* func_02040d94 - main - class C
 * bounds-checked store; reg-alloc on call results
 * r4=de8 result (kept across aaddc+43728), r6=arg2 buf, r5=arg3 bound
 */
extern void *func_02040de8(void *a, void *b);
extern int   func_020aaddc(void *s);          /* strlen-like */
extern int   func_02043728(void *p, int n, unsigned char *buf, int bound);

int func_02040d94(void *a, void *b, unsigned char *buf, int bound)
{
    void *p;
    int idx;

    p = func_02040de8(a, b);
    if (p == 0)
        return 0;
    idx = func_02043728(p, func_020aaddc(p), buf, bound);
    if (idx == -1)
        return idx;
    if ((unsigned int)idx >= (unsigned int)bound)
        return idx;
    buf[idx] = 0;
    return idx;
}
