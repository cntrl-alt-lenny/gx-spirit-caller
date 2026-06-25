/* CAMPAIGN-PREP candidate for func_02053650 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD early-return + AND-mask bit-test bool
 *   risk:       (x&4)==4 may compile via tst/movne differently than cmp #4; otherwise clean leaf — low risk
 *   confidence: high
 */
/* func_02053650: guard on a getter, then test a bit.
 *   if (func_02053688(self) != 3) return 0;
 *   return (func_020536a0(self) & 4) == 4;
 * r4 holds self across both calls; second arm is moveq/movne bool. */

extern int func_02053688(void *self);
extern int func_020536a0(void *self);

int func_02053650(void *self) {
    if (func_02053688(self) != 3) return 0;
    return (func_020536a0(self) & 4) == 4;
}
