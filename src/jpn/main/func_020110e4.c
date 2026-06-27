/* CAMPAIGN-PREP candidate for func_020110e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (n<=0 return) + 9 unrolled in-place left-shifts
 *   risk:       mwcc could roll the 9 shifts into a loop instead of unrolling; bxle vs bxlt on the guard
 *   confidence: high
 */
/* func_020110e4: if shift<=0 return; else left-shift each of 9 words
 * (offsets 0..0x20) in place by `shift`. Leaf. */

void func_020110e4(int *p, int shift) {
    if (shift <= 0) return;
    p[0] <<= shift;
    p[1] <<= shift;
    p[2] <<= shift;
    p[3] <<= shift;
    p[4] <<= shift;
    p[5] <<= shift;
    p[6] <<= shift;
    p[7] <<= shift;
    p[8] <<= shift;
}
