/* CAMPAIGN-PREP candidate for func_02098734 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-call bool wrapper with guard (A)
 *   risk:       0x2c frame from tmp[] size; the AND-of-two-bools split into two cmp branches may merge differently
 *   confidence: med
 */
/* func_02098734: success iff func_02098a4c(&tmp, a) is truthy AND then
 * func_02098788(&tmp) is truthy; returns 1/0. Guarded two-call boolean wrapper
 * over a ~0x2c stack scratch. */

extern int func_02098a4c(void *tmp, void *a);
extern int func_02098788(void *tmp);

int func_02098734(void *a, void *b) {
    char tmp[0x2c];
    if (func_02098a4c(tmp, a) == 0)
        return 0;
    if (func_02098788(tmp) != 0)
        return 1;
    return 0;
}
