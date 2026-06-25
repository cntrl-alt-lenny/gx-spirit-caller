/* CAMPAIGN-PREP candidate for func_02054d68 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     wrapper, mov-to-callee-save args, byte copy, tail call
 *   risk:       r4/r5 assignment to p3/p2 and the sub sp,#4 scratch frame may not reproduce; clone-of-02054c30 shape
 *   confidence: low
 */
/* func_02054d68: 3-arg wrapper. r1=u8* p2, r2=int* p3 (r0=a1 forwarded).
 *   *p2 = (u8)*p3; func_0206ea00(a1,p2); *p3 = (u8)*p2; func_02054ea8(<ret>, -1);
 */

extern int func_0206ea00(int a1, unsigned char *p2);
extern int func_02054ea8(int handle, int v);

int func_02054d68(int a1, unsigned char *p2, int *p3) {
    int r;
    *p2 = (unsigned char)*p3;
    r = func_0206ea00(a1, p2);
    *p3 = (unsigned char)*p2;
    return func_02054ea8(r, -1);
}
