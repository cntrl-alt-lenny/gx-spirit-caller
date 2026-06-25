/* CAMPAIGN-PREP candidate for func_0209d5e4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     void fn; r=1 default before blx fn-ptr; store flag between fp-load and test; nested early-returns
 *   risk:       reshape-able/permuter-class: 3 conditional-epilogue early-returns (cmp;bxne). mwcc may share one exit vs orig's per-site predicated ldm/bx. Control-flow shaping, scheduling-sensitive.
 *   confidence: med
 */
/* func_0209d5e4 — class C: blx through fn-ptr, flag set; early-return shaping.
 * r1 low 6 bits == 0x11 gates a once-only init guarded by data_021a8d20. */

extern void func_02093bfc(void);
extern int  func_0209d55c(void);

extern int data_021a8d20;
extern int (*data_021a8d24)(void);

void func_0209d5e4(int a, int code) {
    if ((code & 0x3f) != 0x11) {
        func_02093bfc();
        return;
    }
    if (data_021a8d20 != 0) {
        return;
    }
    {
        int r = 1;
        int (*fp)(void) = data_021a8d24;
        data_021a8d20 = 1;
        if (fp != 0) {
            r = fp();
        }
        if (r == 0) {
            return;
        }
        func_0209d55c();
    }
}
