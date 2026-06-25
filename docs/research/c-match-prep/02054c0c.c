/* CAMPAIGN-PREP candidate for func_02054c0c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param call + conditional select on result (mvneq/ldrne)
 *   risk:       minimal; out local must stay at sp+0 (single 4-byte frame)
 *   confidence: high
 */
/* func_02054c0c: call func_0206e720(a0, &out) writing an int to a stack
 * local; if it returns 0 return -1 (mvneq), else return out (ldrne). */

extern int func_0206e720(int a0, int *out);

int func_02054c0c(int a0) {
    int out;

    if (func_0206e720(a0, &out) == 0)
        return -1;
    return out;
}
