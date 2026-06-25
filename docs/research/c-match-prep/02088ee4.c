/* CAMPAIGN-PREP candidate for func_02088ee4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order r5/r4/r7/r6 callee-saved; bind+reuse call result as arg0; len>>1 inlined twice
 *   risk:       orig leaves func_02092904 result in r0 and passes it as arg0 unmoved; if mwcc spills/moves r, the arg0 mov + 15-arg stack layout diverge. reshape-able (bind result to single temp, keep adjacent to call).
 *   confidence: med
 */
// func_02088ee4 — stack-arg marshalling, callee-saved param holds, reused call result as arg0
// data_021a524c: global int gate flag.
extern int data_021a524c;
extern void Fill32(int value, void *dst, unsigned int nbytes);
extern void func_02088ea8(void);
extern int  func_02092904(void *buf, unsigned int len);
extern int  func_02088968(int a0, void *a1, void *a2, unsigned int a3,
                          int s4, int s5, int s6, int s7, int s8, int s9,
                          int s10, int s11, int s12, int s13, int s14);

int func_02088ee4(void *buf, unsigned int len, int p2, int p3,
                  int s5, int s6, int s7)
{
    int r;
    func_02088ea8();
    if (data_021a524c != 0) {
        return 0;
    }
    Fill32(0, buf, len);
    r = func_02092904(buf, len);
    return func_02088968(r, buf, (char *)buf + (len >> 1), len >> 1,
                         p2, 0, 0, 1, p3, 0x7f, 0, 0x7f, s5, s6, s7);
}
