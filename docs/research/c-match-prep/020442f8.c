/* CAMPAIGN-PREP candidate for func_020442f8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     COMMUTATIVE eor operand-order + parallel induction-var loop
 *   risk:       strength reduction: mwcc may emit i<<3 instead of the separate sh accumulator the asm keeps
 *   confidence: med
 */
/* func_020442f8: build a top-n-bits mask, then write its 4 bytes MSB-first
 * into out[0..3]. mask = ~0 ^ (~0 >> n) (unshifted operand first -> eor A,B lsr).
 * Parallel shift accumulator sh: 0,8,16,24 with 0x18 - sh -> rsb r0,r2,#0x18. */

void func_020442f8(int n, unsigned char *out) {
    unsigned int mask = ~0u ^ (~0u >> n);
    int i;
    int sh;

    for (i = 0, sh = 0; i < 4; i++, sh += 8) {
        out[i] = (unsigned char)(mask >> (0x18 - sh));
    }
}
