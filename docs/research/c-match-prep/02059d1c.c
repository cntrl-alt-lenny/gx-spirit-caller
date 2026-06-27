/* CAMPAIGN-PREP candidate for func_02059d1c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod %62 -> umull magic 0x08421085 + lsr#5 + umull*62 + sub remainder; ble guards n<=0
 *   risk:       magic 0x08421085 verified =/62 so % reproduces the umull/sub/lsr#1/lsr#5/umull/sub chain; only risk is hoisting the 3 LITs into r4/r5/r6. reshape-able.
 *   confidence: high
 */
/* func_02059d1c (D): write n base-62 digit bytes from func_020a991c()%62. */
extern int func_020a991c(void);
extern signed char data_02100740[];
int func_02059d1c(unsigned char *out, int n) {
    int i;
    for (i = 0; i < n; i++)
        out[i] = (unsigned char)data_02100740[func_020a991c() % 62];
    out[i] = 0;
    return 0;
}
