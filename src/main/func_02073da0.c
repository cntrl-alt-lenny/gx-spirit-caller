/* CAMPAIGN-PREP candidate for func_02073da0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     fixed 3-iter u16 memcmp, post-inc walk, 1-on-mismatch (leaf, default .c)
 *   risk:       Loop may peel/reorder the first iteration vs orig's check-first shape; ip counter reg choice; very low risk overall.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_02073da0 (main, class A).
 * UNVERIFIED build-free draft. Drop into src/main/ as a DEFAULT .c
 * (mwcc 2.0/sp1p5): pure leaf, no push/no frame, just bx lr.
 *   recipe:     fixed 3-iteration halfword memcmp with post-increment
 *               pointer walk; return 1 on first mismatch else 0
 */
/* func_02073da0(a, b): for i in 0..2 if (a[i]!=b[i]) return 1; return 0.
 * u16 elements, *p++ post-increment addressing. */

int func_02073da0(const unsigned short *a, const unsigned short *b) {
    int i;
    for (i = 0; i < 3; i++) {
        if (*a++ != *b++)
            return 1;
    }
    return 0;
}
