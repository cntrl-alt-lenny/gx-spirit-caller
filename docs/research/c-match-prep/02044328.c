/* CAMPAIGN-PREP candidate for func_02044328 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     nested counted loop + bit-test-and-count idiom (ands;addne)
 *   risk:       inner shift base/counter reg-alloc may flip; loop may not keep the zero-held outer shift origin
 *   confidence: med
 */
/* func_02044328: popcount over 4 bytes of p, masked to 8 bits.
 * Inner (b >> j) & 1 with b promoted from unsigned char (positive) -> asr;
 * `if(... &1) count++` -> ands;addne. Return count & 0xff -> and r0,r4,#0xff. */

int func_02044328(unsigned char *p) {
    int count = 0;
    int i;

    for (i = 0; i < 4; i++) {
        unsigned char b = p[i];
        int j;
        for (j = 0; j < 8; j++) {
            if ((b >> j) & 1) count++;
        }
    }
    return count & 0xff;
}
