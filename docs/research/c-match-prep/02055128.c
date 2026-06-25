/* CAMPAIGN-PREP candidate for func_02055128 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack marshalling, literal args, !=-1 guard, return out
 *   risk:       the unconditional ldrne/mov r0 (out left uninitialised on -1 path) and &len passed both stacked+r3 are hard to force; low
 *   confidence: low
 */
/* func_02055128: marshals into stack and calls func_02054c78(0xffff, 0x1001, &out, &len4)
 * with stack[0] = &len4 cell holding 4. Returns out if result != -1, else garbage(out unset).
 *   len = 4 (at sp+8); call(0xffff,0x1001,&out,&len) with stacked &len; if ret!=-1 return out.
 */

extern int func_02054c78(int a, int b, int *out, int *plen);

int func_02055128(void) {
    int out;
    int len = 4;
    if (func_02054c78(0xffff, 0x1001, &out, &len) != -1)
        return out;
    return out;
}
