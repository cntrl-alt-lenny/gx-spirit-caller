/* CAMPAIGN-PREP candidate for func_0209d55c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reuse loop call result in post-test (while not do-while); single-stmt if -> moveq; flag set early
 *   risk:       reshape-able: orig does `mov r1,r0` (reuse 1) for func_0209d488(1,1); mwcc may emit `mov r1,#1`. Pass one shared `int one=1` if it diverges.
 *   confidence: med
 */
/* func_0209d55c — class C: flag-test plus retry loop, reg-alloc.
 * reads halfword flag at 0x027fffa8, bit15; retries while func_0209ae5c()==4. */

extern void func_02093814(int arg);
extern void func_02093bfc(void);
extern int  func_0209ae5c(void);
extern void func_0209d488(int a, int b);

int func_0209d55c(void) {
    int ok = 1;

    if (((*(unsigned short *)0x027fffa8) & 0x8000) >> 15) {
        int s = func_0209ae5c();
        while (s == 4) {
            func_02093814(0x000a3a47);
            s = func_0209ae5c();
        }
        if (s == 0) {
            ok = 0;
        }
    }
    if (ok) {
        func_0209d488(1, 1);
    }
    func_02093bfc();
    return 0;
}
