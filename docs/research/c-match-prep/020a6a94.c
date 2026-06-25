/* CAMPAIGN-PREP candidate for func_020a6a94 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload *src twice (paired ldrsb); src++ after NUL-break test; full-fill-only terminator
 *   risk:       reshape-able: orig re-reads *src for the strb and the NUL test (two ldrsb); if mwcc CSE-folds them to one load, keep both `*src` reads uncached (as written) to force the pair.
 *   confidence: med
 */
/* func_020a6a94 — strncpy-ish bounded copy then tail-call func_020a6a00.
 *
 *   lim = n - 1;  k = 0;
 *   if (lim > 0) {
 *       do {
 *           dst[k] = *src;            // strb
 *           if (*src == 0) break;      // RE-READ *src (orig ldrsb twice)
 *           k++; src++;                // src++ before the k<lim test
 *       } while (k < lim);
 *   }
 *   if (k >= n - 1 && n != 0) dst[k] = 0;   // terminate only if filled full
 *   func_020a6a00(src);
 *
 * Class-D store/reload: *src is read TWICE (don't cache it) to get the
 * paired ldrsb. NUL break precedes k++/src++.
 */

extern void func_020a6a00(signed char *src);

void func_020a6a94(char *dst, signed char *src, int n) {
    int k   = 0;
    int lim = n - 1;

    if (lim > 0) {
        do {
            dst[k] = (char)*src;
            if (*src == 0) break;
            k++;
            src++;
        } while (k < lim);
    }

    if (k >= n - 1) {
        if (n != 0) {
            dst[k] = 0;
        }
    }

    func_020a6a00(src);
}
