/* CAMPAIGN-PREP candidate for func_02062c18 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param probe with distinct const args, bool short-circuit tail
 *   risk:       out-local frame (sub#8) and r4 reg-alloc; helper signatures assumed
 *   confidence: high
 */
/* func_02062c18: clone family, constant args 4,7. */

extern int func_02062eec(void *p, int a, int b, int *out);
extern int func_02062e6c(void *p);

int func_02062c18(void *p) {
    int out;
    if (!func_02062eec(p, 4, 7, &out))
        return 0;
    if (out)
        return 1;
    return func_02062e6c(p) ? 1 : 0;
}
