/* CAMPAIGN-PREP candidate for func_020373cc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call-forwarding wrapper; nested call result as arg; tail return
 *   risk:       callee-saved caching r4-r7 of a/b/c/d should follow from 6-arg call; arg-eval order of nested call could differ
 *   confidence: high
 */
/* func_020373cc: forward call. Compute func_02037378(a, -1), then
 * tail into func_02037780(a, that, b, c, d, 1) with d and 1 on stack.
 *
 *   mvn r1,#0; bl func_02037378        -> func_02037378(a, -1)
 *   mov r1,r0 (result); r0=a; r2=b; r3=c
 *   str r4(d),[sp]; mov ip,#1; str ip,[sp,#4]
 *   bl func_02037780                    -> tail, value preserved
 */

extern int func_02037378(int a, int x);
extern int func_02037780(int a, int b, int c, int d, int e, int f);

int func_020373cc(int a, int b, int c, int d) {
    return func_02037780(a, func_02037378(a, -1), b, c, d, 1);
}
