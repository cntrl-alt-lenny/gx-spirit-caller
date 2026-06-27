/* CAMPAIGN-PREP candidate for func_0206adfc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist constants z=0(r5)/two=2(r4)/retry=1(r6); mid-body decrement; break on rc>0 / retry<0; tail movle 3/movgt 0
 *   risk:       orig pins constants 0,1,2 in callee-saved r5/r6/r4 for the whole loop; declaring z/two/retry in this order should mirror that, but the 4-deep callee-saved set (r5..r9,sl,fp) may permute. permuter-class.
 *   confidence: low
 */
/* func_0206adfc (main, class C) — retry loop with stack-arg call; reg-alloc */
extern int   func_02054cf8(void *h, void *a, void *b, int c);
extern void  func_0206aa68(void *ctx);
extern void *func_0206ab88(void *ctx, int a, int b, int c, int d);
extern void  func_0206b258(void *ctx);

int func_0206adfc(unsigned char *ctx, void *a, void *b) {
    int   retry;
    int   z;
    int   two;
    int   rc;
    void *r;

    retry = 1;
    z     = 0;
    two   = 2;

    do {
        rc = func_02054cf8(*(void **)(ctx + 0x4b0), a, b, z);
        retry = retry - 1;
        if (rc > 0) break;
        if (retry < 0) break;

        func_0206aa68(ctx);
        r = func_0206ab88(ctx, z, z, two, z);
        if (r != 0) {
            func_0206b258(ctx);
            return (int)r;
        }
    } while (retry >= 0);

    return (rc <= 0) ? 3 : 0;
}
