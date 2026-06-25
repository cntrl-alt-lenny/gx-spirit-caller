/* CAMPAIGN-PREP candidate for func_02054d14 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg-forward wrapper + stacked-arg + tail call
 *   risk:       reg-alloc of forwarded r0-r3 / stack-slot ordering of p5 store may differ; arg5/arg6 split a guess
 *   confidence: low
 */
/* func_02054d14: 6-arg thin wrapper. r0-r3 = a1..a4 forwarded; arg5(sp+0)=u8* p5, arg6(sp+4)=int* p6.
 *   *p5 = (u8)*p6; func_0206ed7c(a1,a2,a3,a4,p5); *p6 = (u8)*p5; func_02054ea8(<ret>, -1);
 */

extern int func_0206ed7c(int a1, int a2, int a3, int a4, unsigned char *p5);
extern int func_02054ea8(int handle, int v);

int func_02054d14(int a1, int a2, int a3, int a4, unsigned char *p5, int *p6) {
    int r;
    *p5 = (unsigned char)*p6;
    r = func_0206ed7c(a1, a2, a3, a4, p5);
    *p6 = (unsigned char)*p5;
    return func_02054ea8(r, -1);
}
