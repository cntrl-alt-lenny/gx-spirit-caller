/* CAMPAIGN-PREP candidate for func_02062b48 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param probe with distinct const args, bool short-circuit tail
 *   risk:       out-local frame (sub#8) and r4 reg-alloc; helper signatures assumed
 *   confidence: high
 */
/* func_02062b48: clone of 02062aec with constant args 6,7 (distinct,
 * so emitted as separate mov r1,#6 / mov r2,#7). */

extern int func_02062eec(void *p, int a, int b, int *out);
extern int func_02062e6c(void *p);

int func_02062b48(void *p) {
    int out;
    if (!func_02062eec(p, 6, 7, &out))
        return 0;
    if (out)
        return 1;
    return func_02062e6c(p) ? 1 : 0;
}
