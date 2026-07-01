/* CAMPAIGN-PREP candidate for func_020870c4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Clean call sequence; pool-literal reuse (0xffff x3); result cached across call
 *   risk:       mwcc may load 0xffff per-use or reorder mov r1/r2; result-cache reg (r4) alloc could differ
 *   confidence: med
 */
/* func_020870c4: clean boot/init call sequence with constant args.
 * The 0xffff literal is pool-loaded once and reused for the first three
 * args of func_02094f3c (r0=r1=r2=0xffff, r3=0). func_020954b4's return
 * is cached in a callee-saved reg, func_02095584(1) is called, then the
 * cached value is passed to func_020954f4.
 */

extern void func_02087dfc(int a);
extern void func_0208a924(int a);
extern void func_0208878c(void);
extern void func_02094bf8(int a);
extern void func_02094f3c(int a, int b, int c, int d);
extern int  func_020954b4(void);
extern void func_020954f4(int a);
extern void func_02095584(int a);

void func_020870c4(void) {
    int x;
    func_02087dfc(0);
    func_0208a924(0);
    func_0208878c();
    func_02094bf8(0);
    func_02094f3c(0xffff, 0xffff, 0xffff, 0);
    x = func_020954b4();
    func_02095584(1);
    func_020954f4(x);
}
