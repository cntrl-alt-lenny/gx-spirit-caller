/* CAMPAIGN-PREP candidate for func_020b4248 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind-count-then-counted-loop, per-element call, return 0
 *   risk:       r0 (1st) param is unused/dead — drop or keep may shift the prototype; loop index vs pointer-increment form could flip add r0,r6,r4 to a walking pointer
 *   confidence: med
 */
/* func_020b4248 (main, A) — counted loop calling a per-element helper.
 * asm: r5 = *third_arg (count, loaded as a word); for (i=0; i<count; ++i)
 *   func_020b41c0(base + i);  return 0.
 * The count is read once from [r2] before the loop (bind, not reload). The bls
 * after `cmp r5,#0` is the unsigned do-nothing guard for count==0. Index `i`
 * is added to the byte pointer each iteration (add r0,r6,r4). Returns 0. */
extern int func_020b41c0(unsigned char *p);

int func_020b4248(int unused, unsigned char *base, unsigned int *count)
{
    unsigned int n = *count;
    unsigned int i;
    for (i = 0; i < n; i++) {
        func_020b41c0(base + i);
    }
    return 0;
}
