/* CAMPAIGN-PREP candidate for func_020986c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-arg call w/ stack marshaling, return constant (A)
 *   risk:       reg-alloc-walled (ships as .s): `lr` reused as a temp + exact stack-arg push order unlikely from C
 *   confidence: low
 */
/* func_020986c0: marshal a 6-arg call and return the constant 6. The call is
 *   func_0209cb68(*data_021a8320, c, b, func_0209870c, a, 1)
 * with the last three passed on the stack ([sp]=func_0209870c, [sp+4]=a,
 * [sp+8]=1). r0,r1,r2 in regs hold *data_021a8320, orig r2, orig r1.
 * (Currently ships as hand .s -- the lr-as-temp + stack push order is the wall.) */

extern void *data_021a8320;
extern void  func_0209870c(void);
extern int   func_0209cb68(void *obj, int c, int b, void *cb, int a, int one);

int func_020986c0(int a, int b, int c) {
    func_0209cb68(data_021a8320, c, b, (void *)func_0209870c, a, 1);
    return 6;
}
