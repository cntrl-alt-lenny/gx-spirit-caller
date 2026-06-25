/* CAMPAIGN-PREP candidate for func_0209f1b0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4=arg0; const 3 reused (sel & 2nd arg via mov r1,r0); marshal in store-order
 *   risk:       reshape-able: orig sets r1 via 'mov r1,r0' (reuses the literal 3); if mwcc rematerializes '#3' instead of reusing the sel reg, one mov diverges. Stacked 5th arg (f_10) order must hold (store-order).
 *   confidence: med
 */
/* func_0209f1b0 (main, class C): sibling of 0209f070. Guard via
 * func_0209db88(1,0); then marshal the same singleton's f0/f4/f10 into a
 * varargs call with selector 3. r4 holds arg0 across the first call.
 * Note the orig reuses the constant 3: func_0209de5c(3,..),
 * func_0209dd30 sel=3 AND its 2nd arg = sel (mov r1,r0 => also 3).
 */

typedef struct {
    int f_0;
    int f_4;
    char _pad8[0x10 - 0x8];
    int f_10;
} pkt_0209f1b0_t;

extern int  func_0209db88(int a, int b);
extern void *func_0209dca8(void);
extern int  func_0209dd30(int sel, int b, int c, int d, int e);
extern void func_0209de5c(int idx, int b);

int func_0209f1b0(int arg0) {
    pkt_0209f1b0_t *p;
    int r0;

    if (func_0209db88(1, 0) != 0) return 0;
    func_0209de5c(3, arg0);
    p = (pkt_0209f1b0_t *)func_0209dca8();
    r0 = func_0209dd30(3, 3, p->f_0, p->f_4, p->f_10);
    if (r0 == 0) return 2;
    return r0;
}
