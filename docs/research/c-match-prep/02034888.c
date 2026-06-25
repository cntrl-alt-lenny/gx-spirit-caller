/* CAMPAIGN-PREP candidate for func_02034888 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order r7,r4,r6=a,b,c; (u16)a via lsl/lsr; stack-arg marshalling; tail-call case1
 *   risk:       struct-guessed/reshape-able: intermediate call-result threading (r0 of func_02031eac into func_02032028, r0 of func_02046ac4 into func_020320f8 r0) is reconstructed from reg moves; the exact dataflow ordering and which call feeds which arg likely diverges until the call graph is confirmed.
 *   confidence: low
 */
extern int func_0201cd1c(int a, int b, int c);
extern int func_02031eac(void);
extern int func_02032028(int a, int b);
extern int func_020320f8(int a, int b, int c, int d, int e, int f, int g);
extern int func_02032634(void);
extern void func_02034884(void);
extern int func_02094688(int a, int b, int c);
extern int func_02046ac4(int a);

int func_02034888(int a, int b, int c) {
    int mode = func_02032634();
    if (mode == 1) {
        return func_0201cd1c(a, b, c);
    }
    if (mode == 2) {
        int t;
        int u;
        func_02031eac();
        t = func_02032028(0 /*placeholder r0*/, c);
        func_02094688(b, t, c);
        u = func_02031eac();
        return func_020320f8(func_02046ac4(u), (unsigned short)a, /*r2 from r0 of 46ac4? */ 0, 0, c, t, (int)func_02034884) != -1 ? 1 : 0;
    }
    return 0;
}
