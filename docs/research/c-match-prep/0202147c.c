/* CAMPAIGN-PREP candidate for func_0202147c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD early-return + bit-clear (bic) + global store
 *   risk:       moveq/bxeq early-return path may be emitted as a forward branch; field offsets f4/f0 are guessed
 *   confidence: high
 */
/* func_0202147c: guard on p->f4; if zero return 0, else clear bit0
 * of p->f0, set *(int*)data_02194340 = 1, return 1. */
extern char data_02194340[];

int func_0202147c(int *p) {
    if (p[1] == 0) return 0;
    p[0] &= ~1;
    *(int *)data_02194340 = 1;
    return 1;
}
