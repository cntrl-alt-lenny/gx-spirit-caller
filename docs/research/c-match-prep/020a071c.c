/* CAMPAIGN-PREP candidate for func_020a071c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dc30 guard + range guard + de5c + dd30 stub
 *   risk:       The p1==0/p1==1 two-cmp guard (beq to fallthrough, else !=1 returns 6) may codegen as a different branch shape; otherwise close.
 *   confidence: med
 */
/* func_020a071c: dc30(p0) guard; require p1 in {0,1} else return 6;
 * de5c(0x19,p0); dd30(0x19, 1, p1). */

extern int  func_0209dc30(int a0);
extern void func_0209de5c(int code, int handle);
extern int  func_0209dd30(int code, int count, ...);

int func_020a071c(int p0, int p1) {
    int r = func_0209dc30(p0);
    if (r != 0) return r;
    if (p1 != 0 && p1 != 1) return 6;
    func_0209de5c(0x19, p0);
    r = func_0209dd30(0x19, 1, p1);
    return r == 0 ? 2 : r;
}
