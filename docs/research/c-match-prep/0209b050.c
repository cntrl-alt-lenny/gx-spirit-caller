/* CAMPAIGN-PREP candidate for func_0209b050 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dispatch switch returning constants (compare chain); guarded tail call
 *   risk:       mwcc may emit a jump table instead of the cmp r0,#1/#2/#3 chain, or omit the spurious sub sp,#4 frame slot the original has.
 *   confidence: med
 */
/* func_0209b050: selector remap then guarded tail-call. Maps 1->1, 2->3,
 * 3->2, anything else ->0 (note 2 and 3 swap). If the mapped value is 0,
 * return 0xffff; otherwise tail into func_0209b16c(mapped) and return it.
 */

extern int func_0209b16c(int v);

int func_0209b050(int sel) {
    int v;

    switch (sel) {
    case 1:  v = 1; break;
    case 2:  v = 3; break;
    case 3:  v = 2; break;
    default: v = 0; break;
    }
    if (v == 0) return 0xffff;
    return func_0209b16c(v);
}
