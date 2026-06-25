/* CAMPAIGN-PREP candidate for func_02055170 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack marshalling, literal args, !=-1 guard, return out
 *   risk:       same as 02055128: out-on-failure-path uninitialised + dual &len passing; clone, so matches iff 02055128 does
 *   confidence: low
 */
/* func_02055170: clone of 02055128 with second literal 0x1002 instead of 0x1001. */

extern int func_02054c78(int a, int b, int *out, int *plen);

int func_02055170(void) {
    int out;
    int len = 4;
    if (func_02054c78(0xffff, 0x1002, &out, &len) != -1)
        return out;
    return out;
}
