/* CAMPAIGN-PREP candidate for func_02062aec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param probe, two-stage bool short-circuit, bool-normalize tail
 *   risk:       equal-constant args (7,7) reused as `mov r2,r1` may instead emit `mov r2,#7`; out frame size
 *   confidence: med
 */
/* func_02062aec: probe func_02062eec(p, 7, 7, &out); short-circuit on
 * its bool and on out; else normalize func_02062e6c(p) to 0/1.
 * The two equal args (7,7) are CSE'd into r1 then copied (mov r2,r1). */

extern int func_02062eec(void *p, int a, int b, int *out);
extern int func_02062e6c(void *p);

int func_02062aec(void *p) {
    int out;
    if (!func_02062eec(p, 7, 7, &out))
        return 0;
    if (out)
        return 1;
    return func_02062e6c(p) ? 1 : 0;
}
