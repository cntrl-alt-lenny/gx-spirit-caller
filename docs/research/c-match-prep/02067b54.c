/* CAMPAIGN-PREP candidate for func_02067b54 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guarded call early-return (addne/ldmne) + tail call
 *   risk:       first call's r1 source ambiguous (arg1 reused live); the 'return 1' actually returns the call's r0 — early-return value/codegen may differ
 *   confidence: low
 */
/* func_02067b54 — two guarded calls into func_02068380.
 * r5=p, r4=arg1. add r0,r5,#8 -> func_02068380(&p[8-region], arg?);
 * the first call is invoked with r1 still = caller's r1 (arg1 cached
 * in r4 but NOT moved into r1 before call 1 — mwcc passes the live
 * r1). If nonzero, early-return; else call again with p+0x14 and
 * r1=arg1. Model both as func_02068380(base, arg1) where the FIRST
 * call happens to receive arg1 already in r1.
 */
extern int func_02068380(void *base, void *key);

int func_02067b54(char *p, void *key) {
    if (func_02068380(p + 0x8, key) != 0) {
        return 1; /* value left in r0 from the call (nonzero) */
    }
    return func_02068380(p + 0x14, key);
}
