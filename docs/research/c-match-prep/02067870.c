/* CAMPAIGN-PREP candidate for func_02067870 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     pre-guarded counted loop; ldrb/call/strb; cache args
 *   risk:       which callee-saved reg holds ctx/buf/n may rotate vs r7/r6/r5; ldrb may be u8 vs s8 (assumed u8 from ldrb)
 *   confidence: med
 */
/* func_02067870 — counted byte-transform loop.
 * for i in [0,n): b[i] = func_020678b8(a, b[i]);  with the loop
 * pre-guarded (n<=0 skips). r7=a (callee-saved across the call),
 * r6=b, r5=n, r4=i. The 'sub sp,#4' + r4-r7 save frame is what mwcc
 * emits for this 4-callee-saved-locals shape; reproduce the cached
 * arg order (a,b,n) so the same regs are chosen.
 */
extern int func_020678b8(void *ctx, int byte);

void func_02067870(void *ctx, unsigned char *buf, int n) {
    int i;
    for (i = 0; i < n; i++) {
        buf[i] = (unsigned char)func_020678b8(ctx, buf[i]);
    }
}
