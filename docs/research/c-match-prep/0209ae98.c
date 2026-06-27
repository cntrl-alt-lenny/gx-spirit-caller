/* CAMPAIGN-PREP candidate for func_0209ae98 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order a before b (sp0/sp4 out-params); retry-loop const 0x996a00/1 held in r5/r4; if-not-1 guard
 *   risk:       Two stack out-params at [sp,#0] and [sp,#4]: a must be declared first to take the lower slot; swapped decls flip the &a/&b addressing. reshape-able (decl-order).
 *   confidence: med
 */
/* func_0209ae98: init sequence + guarded calls + retry loop. */

extern void func_02093814(int arg);
extern int  func_0209aa48(void);
extern void func_0209ade4(int *out0, int *out1);
extern void func_0209af48(int a, int b);
extern int  func_0209aa64(int arg);
extern int  func_0209b16c(int a, int b, int c);

int func_0209ae98(int p0, int p1) {
    int a;
    int b;
    func_02093814(0x00996a00);
    if (func_0209aa48() != 1) {
        func_0209ade4(&a, &b);
        if (a != 0)
            func_0209af48(0, 0);
        if (b != 0)
            func_0209af48(1, 0);
        if (func_0209aa64(1) == 0) {
            do {
                func_02093814(0x00996a00);
            } while (func_0209aa64(1) == 0);
        }
    }
    return func_0209b16c(0xe, p0, p1);
}
