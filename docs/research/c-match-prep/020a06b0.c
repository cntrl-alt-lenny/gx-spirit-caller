/* CAMPAIGN-PREP candidate for func_020a06b0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dc30 guard + de5c + dd30 varargs (reg+stack args)
 *   risk:       dd30 vararg stack layout (str r4 [sp], ldrh [sp,#0x20] 5th-arg, str ip [sp,#4]) order/alloc may differ; arg permutation r2=p2,r3=p1 fragile.
 *   confidence: low
 */
/* func_020a06b0: dd30-family. dc30(p0) guard; de5c(0x1d,p0);
 * dd30(0x1d, 4, p2, p1, p3, p5)  (r2=p2,r3=p1, stack: p3 then p5-halfword). */

extern int  func_0209dc30(int a0);
extern void func_0209de5c(int code, int handle);
extern int  func_0209dd30(int code, int count, ...);

int func_020a06b0(int p0, int p1, int p2, int p3, int p5) {
    int r = func_0209dc30(p0);
    if (r != 0) return r;
    func_0209de5c(0x1d, p0);
    r = func_0209dd30(0x1d, 4, p2, p1, p3, (unsigned short)p5);
    return r == 0 ? 2 : r;
}
