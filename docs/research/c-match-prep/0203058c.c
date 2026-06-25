/* CAMPAIGN-PREP candidate for func_0203058c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call + dispatch (|| eq) + min/max if-assign tail
 *   risk:       case 2||3 may fold to a sub/range check; tail movgt/movle ordering may flip; r4 save assumed
 *   confidence: med
 */
/* func_0203058c: classify the result of func_0202de9c, fall through to
 * a boolean over func_020300bc on the original arg.
 *
 *     mov r4,r0; bl func_0202de9c; cmp r0,#0; beq -> return 0
 *     cmp r0,#2; cmpne r0,#3; beq -> return 1   (r0==2 || r0==3)
 *     mov r0,r4; bl func_020300bc; cmp r0,#0; movgt r0,#1; movle r0,#0
 */

extern int func_0202de9c(void);
extern int func_020300bc(int a);

int func_0203058c(int arg0) {
    int r = func_0202de9c();
    if (r == 0) return 0;
    if (r == 2 || r == 3) return 1;
    return func_020300bc(arg0) > 0;
}
