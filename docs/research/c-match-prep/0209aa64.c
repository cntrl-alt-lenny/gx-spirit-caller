/* CAMPAIGN-PREP candidate for func_0209aa64 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     if-assign normalize (cmp;movne, no moveq); far tail call (bx ip)
 *   risk:       scheduling of the constant args (mov r1,#0 before the cmp) may reorder; if func_0209aa84 is actually void the bx ip still matches.
 *   confidence: med
 */
/* func_0209aa64: tail-call thunk. Clamps the selector to {0,1} (if it isn't
 * exactly 1, force 0 -- no else, so just cmp;movne) then tail-calls
 * func_0209aa84(sel, 0, 0, 1) via bx ip.
 */

extern int func_0209aa84(int sel, int b, int c, int d);

int func_0209aa64(int sel) {
    if (sel != 1) sel = 0;
    return func_0209aa84(sel, 0, 0, 1);
}
