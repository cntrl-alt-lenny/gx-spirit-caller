/* CAMPAIGN-PREP candidate for func_02060958 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order a/b/c/d/h; reuse b after early-return; -1 sentinel via mvn; opt+6/0 cmov
 *   risk:       reg reuse: r5 holds d across the b84 call then is overwritten by 4th value (r2=r5 saved first). If mwcc spills/renames the live d, the post-b84 mov chain diverges. permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02060958 (main, class C) — brief 496.
 * UNVERIFIED build-free draft. MED tier: byte-match not expected first build.
 *   recipe: decl-order r7/r6/r5/r8; each lookup = read(p,&lit) then resolve(); -1 early-return
 */
/* func_02060958: gather four config values via the read+resolve pair
 * (func_02060c9c stages a key, func_020ace00 returns the resolved int), open
 * a record (func_02060b84) keyed by them, bail on -1, fetch one more value
 * plus an optional pointer (func_020ab0c4 -> +6 or NULL), then commit
 * (func_02060604) with the spare value pushed as a 5th arg. */

extern int data_021013b4, data_021013b8, data_021013bc, data_021013c0;
extern int data_021013c8;
extern int data_021013d0;
extern char data_021013d8[];

extern void func_02060c9c(void *p, int key);
extern int  func_020ace00(void);
extern int  func_02060b84(int mode, int a, int b, int c);
extern int  func_020ab0c4(void *p, int key);
extern int  func_02060604(int handle, int a, int b, void *opt, int extra);

int func_02060958(void *p) {
    int a, b, c, d, h;
    func_02060c9c(p, data_021013c0); a = func_020ace00();
    func_02060c9c(p, data_021013b8); b = func_020ace00();
    func_02060c9c(p, data_021013b4); c = func_020ace00();
    func_02060c9c(p, data_021013bc); d = func_020ace00();
    h = func_02060b84(1, b, c, d);
    if (h == -1) return -1;
    func_02060c9c(p, data_021013c8); b = func_020ace00();
    {
        int r = func_020ab0c4(p, data_021013d0);
        int opt = r ? (r + 6) : 0;
        return func_02060604(h, a, d, (void *)opt, opt);
    }
}
