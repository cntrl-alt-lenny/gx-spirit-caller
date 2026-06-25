/* CAMPAIGN-PREP candidate for func_0226ae30 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     if-form value-map (v=0;if(x)v=1;) + override + tail call
 *   risk:       Value-map order: orig sets r2 via mov#0/movne#1 then movne#7; the two-stage if-form must keep r2 the dest; tail-call ldr ip;bx ip assumed; 0226ae50 arity guessed.
 *   confidence: med
 */
/* func_ov002_0226ae30: remap arg2 to a flag (0/1, or 7 if arg3!=0) then
 * tail-call 0226ae50(arg0, arg1, flag, arg3). */

extern int func_ov002_0226ae50(int a, int b, int c, int d);

int func_ov002_0226ae30(int arg0, int arg1, int arg2, int arg3) {
    int c = 0;
    if (arg2 != 0)
        c = 1;
    if (arg3 != 0)
        c = 7;
    return func_ov002_0226ae50(arg0, arg1, c, arg3);
}
