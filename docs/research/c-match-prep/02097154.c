/* CAMPAIGN-PREP candidate for func_02097154 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     case-fold byte compare; index in lr; sub0x41/cmp0x19 fold; mismatch early-out
 *   risk:       the lowercase-fold is two sub#0x41/cmp#0x19/addls steps interleaved (a then b) before the compare; if mwcc fully evaluates a's fold then b's instead of interleaving, instruction scheduling reorders - permuter-class (scheduling), bytes likely close
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02097154 (main, class C) - p_0044.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     case-insensitive byte compare; index in lr; sub#0x41/cmp#0x19 fold; early-out on mismatch; return 0
 *   risk:       see risk note
 *   confidence: med
 */
/* func_02097154(a,b,n): for i in 0..n-1: ca=a[i]-0x41; if(ca<=0x19) ca+=0x20; cb=b[i]-0x41;
 * if(cb<=0x19) cb+=0x20; if(ca!=cb) return ca-cb; return 0. n is unsigned (bls/bcc). */

int func_02097154(const unsigned char *a, const unsigned char *b, unsigned int n)
{
    unsigned int i;
    int ca;
    int cb;

    for (i = 0; i < n; i++) {
        ca = a[i] - 0x41;
        if ((unsigned int)ca <= 0x19) ca += 0x20;
        cb = b[i] - 0x41;
        if ((unsigned int)cb <= 0x19) cb += 0x20;
        if (ca != cb) {
            return ca - cb;
        }
    }
    return 0;
}
