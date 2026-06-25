/* CAMPAIGN-PREP candidate for func_020aaec0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual loop; copy then zero-fill; signed-char read-back via mov ip,lr; post-index
 *   risk:       orig copies then RE-READS the just-stored byte (mov ip,lr; ldrsb r3,[ip]) to test — a load-after-store of the same location, not the register c. If mwcc tests the loaded value directly (no reload), the ldrsb r3,[ip] vanishes. reshape-able: read back via `*d` after the store (as written) to force the second ldrsb.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020aaec0 (main, class C) - brief p_0053.
 * UNVERIFIED build-free draft.
 *   recipe:     strncpy dual-loop; bind dst base in lr; ldrsb signed-char loads; post-index
 *   confidence: med
 */
/* strncpy(dst=r0, src=r1, n=r2): copy until NUL, then zero-fill remainder.
 * Holds dst running ptr in lr; uses signed-byte loads (-char signed default). */

char *func_020aaec0(char *dst, const char *src, unsigned int n)
{
    char *d = dst;            /* lr */
    const char *s = src;
    unsigned int k = n;

    if (k == 0) return dst;
    do {
        signed char c = *s++;
        *d = c;
        c = *d++;
        if (c != 0) { if (--k == 0) return dst; continue; }
        if (--k == 0) return dst;
        do { *d++ = 0; } while (--k != 0);
        return dst;
    } while (1);
}
