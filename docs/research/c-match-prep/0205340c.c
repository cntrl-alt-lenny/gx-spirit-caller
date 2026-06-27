/* CAMPAIGN-PREP candidate for func_0205340c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     constant /5 -> '/'; signed-char charset; reverse digit fill
 *   risk:       reshape-able: (width+4)/5 must stay signed to emit smull 0x66666667+asr#1 (orig signed); the 64-bit v>>=5 (lsr#5;orr lsl#27) is canonical. If /5 mis-codes, force int width. p[-i] decl after n>0.
 *   confidence: med
 */
/* func_0205340c (main, class D) — render a 64-bit value as base-32 using the
 * charset at data_020ffaac, into buf, most-significant digit first.
 *   n = (width + 4) / 5   (signed /5 via 0x66666667 magic, asr 1)
 *   write n digits filling buf[n-1] down to buf[0] from the value's low 5 bits,
 *   shifting the 64-bit value right by 5 each step; buf[n] = 0.
 * DIVMOD recipe: constant /5 -> plain C '/'. Charset load is ldrsb (signed char).
 */

extern signed char data_020ffaac[];               /* base-32 charset */

void func_0205340c(unsigned long long v, int width, char *buf) {
    int n = (width + 4) / 5;
    int i;

    if (n > 0) {
        char *p = buf + n - 1;
        for (i = 0; i < n; i++) {
            p[-i] = data_020ffaac[(int)(v & 0x1f)];
            v >>= 5;
        }
    }
    buf[n] = 0;
}
