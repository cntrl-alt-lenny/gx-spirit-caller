/* CAMPAIGN-PREP candidate for func_021cf3a4 (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/early-return + OR-compare chain (cmp;cmpne); arg cached in r4
 *   risk:       Should match the shipped .s closely; minor risk mwcc emits a single shared epilogue vs the two ldmia exits, or reorders the cmpne chain.
 *   confidence: high
 */
/* func_ov011_021cf3a4: predicate. True iff func_021d0ffc(arg)==1 AND
 * func_021d1028(arg) in {1,3}. The r==1||r==3 test yields cmp;cmpne. */
extern unsigned int func_ov011_021d0ffc(int arg0);
extern int func_ov011_021d1028(int arg0);

int func_ov011_021cf3a4(int arg0) {
    int r;
    if (func_ov011_021d0ffc(arg0) != 1)
        return 0;
    r = func_ov011_021d1028(arg0);
    if (r == 1 || r == 3)
        return 1;
    return 0;
}
