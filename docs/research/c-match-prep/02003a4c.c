/* CAMPAIGN-PREP candidate for func_02003a4c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: signed fork (a1<0x80), asr#1 = a5/2, two marshal tail calls
 *   risk:       permuter-class: already .s-shipped. a5 is hoisted to r4 before the branch and held across the call; r5/r6/r7 are the callee-saved arg cache. The exact stmdb set + which args land in regs vs stack is a register-allocation coin-flip a C reshape likely won't pin.
 *   confidence: low
 */
/* func_02003a4c: sign fork on a1, two arg-marshal tail calls, asr#1 divide.
 *   if (a1 < 0x80) func_020037d0(a0,a1,a2,a3,a4,a5);
 *   else { t=func_020038c0(a1,a5);
 *          func_02001f18(t, a3, a4, a5, *(int*)a0, a2, a5/2); }
 * NOTE: already ships as src/main/func_02003a4c.s (brief 302). Best-effort.
 * Class D divmod: `add ip,r4,r4,lsr#31; asr#1` == signed a5/2 -> plain `a5/2`.
 * a4=[sp+0x20], a5=[sp+0x24]; a5 (r4) is hoisted (loaded before the branch,
 * used in both arms). The else-arm's first call return reuses r0 as 1st arg
 * to func_02001f18 (no reload of a0). */

extern void func_020037d0(void *a0, int a1, int a2, int a3, int a4, int a5);
extern int  func_020038c0(int a1, int a5);
extern void func_02001f18(int p0, int a3, int a4, int a5,
                          int s0, int a2, int half);

void func_02003a4c(void *a0, int a1, int a2, int a3, int a4, int a5) {
    if (a1 < 0x80) {
        func_020037d0(a0, a1, a2, a3, a4, a5);
    } else {
        int t = func_020038c0(a1, a5);
        func_02001f18(t, a3, a4, a5, *(int *)a0, a2, a5 / 2);
    }
}
