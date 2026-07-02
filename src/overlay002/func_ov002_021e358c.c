/* CAMPAIGN-PREP candidate for func_021e358c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tail-call arg-shuffle (insert leading 0, push args right)
 *   risk:       low-med; the r0->r3->r1 routing + double-zero (r0 then r3) is the exact mov sequence, could reorder
 *   confidence: med
 */
/* func_ov002_021e358c: arg-shuffle trampoline -> func_021e2e80(0, arg0, arg1, 0).
 * arg0 routes r0->r3->r1 while r0 is reloaded to 0; r3 then re-zeroed. */
extern int func_ov002_021e2e80(int a, int b, int c, int d);

int func_ov002_021e358c(int arg0, int arg1) {
    return func_ov002_021e2e80(0, arg0, arg1, 0);
}
