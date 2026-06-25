/* CAMPAIGN-PREP candidate for func_0206280c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     if/else selector with two tail-call dispatch returns
 *   risk:       frame epilogue (stmfd{lr}+sub#4, bl-not-b tail) may want legacy_sp3 compiler; helpers take 3 args
 *   confidence: med
 */
/* func_0206280c: select on the 4th arg, tail-dispatch (both targets
 * ignore the selector). args r0-r2 pass through untouched. */

extern int func_02062df8(void *p, int a, int b);
extern int func_02062a20(void *p, int a, int b);

int func_0206280c(void *p, int a, int b, int sel) {
    if (sel)
        return func_02062df8(p, a, b);
    return func_02062a20(p, a, b);
}
