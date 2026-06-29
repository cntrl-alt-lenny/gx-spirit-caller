/* CAMPAIGN-PREP candidate for func_02060f30 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global-compare bool return (-1 via mvn; != gives movne-first)
 *   risk:       movne/moveq order should match != ; data_02101354 type (int) guessed
 *   confidence: high
 */
/* func_02060f30: returns (data_02101354 != -1) as a 0/1 bool. */

extern int data_02101354;

int func_02060f30(void) {
    return data_02101354 != -1;
}
