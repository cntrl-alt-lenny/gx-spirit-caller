/* CAMPAIGN-PREP candidate for func_02054840 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tail-forward with inserted constant arg (stack-arg shuffle)
 *   risk:       arg widths assumed int; outgoing-stack slot ordering should match mwcc default
 *   confidence: high
 */
/* func_02054840: stack-arg shuffle wrapper. Forwards (a0,a1,4,a2,a3,a4)
 * to func_02054700 - inserts a constant 4 as the 3rd arg, pushing a2,a3
 * and the 5th incoming arg out to the stack. */

extern void func_02054700(int a0, int a1, int a2, int a3, int a4, int a5);

void func_02054840(int a0, int a1, int a2, int a3, int a4) {
    func_02054700(a0, a1, 4, a2, a3, a4);
}
