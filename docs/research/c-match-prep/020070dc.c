/* CAMPAIGN-PREP candidate for func_020070dc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     strlen counted loop with signed char (ldrsb)
 *   risk:       do-while vs while first-iteration peeling may differ; ldrsb requires signed char.
 *   confidence: high
 */
/* func_020070dc: textbook strlen over signed char (ldrsb post-increment).
 *   ldrsb r1,[r0],#1; cmp; beq end
 * loop: ldrsb r1,[r0],#1; add r2,#1; cmp; bne loop
 * Counts bytes before the terminating NUL.
 */
int func_020070dc(signed char *s) {
    int n = 0;
    while (*s++ != 0) {
        n++;
    }
    return n;
}
