/* CAMPAIGN-PREP candidate for func_0206df54 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     negative-guard (movs/bmi) + two-call early-return chain
 *   risk:       final moveq/return-1 path: reg-alloc on r4 stable; low risk
 *   confidence: high
 */
/* func_0206df54: signed guard + 2-call validation chain.
 *   movs r4,r0; bmi fail         ; if (h < 0) return 0
 *   if (func_0206e4a4(h) == 0) return 0;
 *   if (func_0206e474(h) == 0) return 1;   ; moveq r0,#1; bxeq
 *   return 0;
 */

extern int func_0206e4a4(int h);
extern int func_0206e474(int h);

int func_0206df54(int h) {
    if (h < 0) return 0;
    if (func_0206e4a4(h) == 0) return 0;
    if (func_0206e474(h) == 0) return 1;
    return 0;
}
