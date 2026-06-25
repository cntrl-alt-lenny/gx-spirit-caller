/* CAMPAIGN-PREP candidate for func_020871ac (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Clean call sequence; pool-literal reuse (0xffff x3); result cached across call
 *   risk:       mwcc may load 0xffff per-use or reorder mov r1/r2; result-cache reg (r4) alloc could differ
 *   confidence: med
 */
/* func_020871ac: clean boot/init call sequence with constant args.
 * The 0xffff literal is pool-loaded once and reused for the first three
 * args of func_02095030 (r0=r1=r2=0xffff, r3=0). func_020955a8's return
 * is cached in a callee-saved reg, func_02095678(1) is called, then the
 * cached value is passed to func_020955e8.
 */

extern void func_02087ee4(int a);
extern void func_0208aa0c(int a);
extern void func_02088874(void);
extern void func_02094cec(int a);
extern void func_02095030(int a, int b, int c, int d);
extern int  func_020955a8(void);
extern void func_020955e8(int a);
extern void func_02095678(int a);

void func_020871ac(void) {
    int x;
    func_02087ee4(0);
    func_0208aa0c(0);
    func_02088874();
    func_02094cec(0);
    func_02095030(0xffff, 0xffff, 0xffff, 0);
    x = func_020955a8();
    func_02095678(1);
    func_020955e8(x);
}
