/* CAMPAIGN-PREP candidate for func_0207cf78 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     byte-compare leaf loop, early-exit (no unroll); default tier
 *   risk:       mwcc could unroll 6 iters or pick a different index reg than ip; counter signedness fixed to blt
 *   confidence: high
 */
/* func_0207cf78: 6-byte equality compare, clean leaf (no frame). Returns 1
 * if first 6 bytes equal, else 0. Early-return-in-loop prevents unrolling;
 * mwcc uses ip(r12) as the index with register-offset ldrb. Signed counter
 * -> blt. No prologue/epilogue -> tier-neutral; default `.c` (2.0/sp1p5). */

int func_0207cf78(const unsigned char *a, const unsigned char *b) {
    int i;
    for (i = 0; i < 6; i++) {
        if (a[i] != b[i]) {
            return 0;
        }
    }
    return 1;
}
