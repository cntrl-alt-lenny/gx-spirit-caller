/* CAMPAIGN-PREP candidate for func_02078ed8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     volatile side-effect ldrh + orr-shift pack (operand-order)
 *   risk:       discarded p[0] load scheduling and r1 dest may flip; otherwise byte-stable
 *   confidence: med
 */
/* func_02078ed8: side-effect read p[0], then return p[-2]|(p[-1]<<16).
 * Same Recipe D volatile discard as func_02078ec8; the kept value is
 * built from p[-1]/p[-2] with the unshifted operand (p[-2]) first so
 * the result lands in r0.
 */

unsigned int func_02078ed8(volatile unsigned short *p) {
    (void)p[0];
    return (unsigned int)p[-2] | ((unsigned int)p[-1] << 16);
}
