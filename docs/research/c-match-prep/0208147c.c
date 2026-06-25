/* CAMPAIGN-PREP candidate for func_0208147c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ACCESSOR 2D table; ldrb indices; row-then-col eval order
 *   risk:       Table row width assumed 4 ints; p[1] (row) must be evaluated before p[0].
 *   confidence: high
 */
/* func_0208147c: 2D table lookup data_020beefc[p[1]][p[0]] (int[][4]).
 * row stride 16 (lsl#4), col stride 4 (lsl#2). */

extern int data_020beefc[][4];

int func_0208147c(unsigned char *p) {
    return data_020beefc[p[1]][p[0]];
}
