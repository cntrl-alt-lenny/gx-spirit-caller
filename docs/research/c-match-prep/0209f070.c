/* CAMPAIGN-PREP candidate for func_0209f070 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4=arg1 across call; marshal p->f0/f4/f10 in store-order; 5th arg on stack
 *   risk:       reshape-able: varargs prototype must put f_10 as the stacked 5th arg (str [sp]); if mwcc reorders the f_0/f_4/f_10 loads or stacks a different arg, the marshalling sequence diverges (store-order).
 *   confidence: med
 */
/* func_0209f070 (main, class C): guard via func_0209e0f0, then marshal
 * three fields of a singleton struct into a varargs-style call. r4 holds
 * arg1 across the first call. The 5th argument is passed on the stack
 * (str r1,[sp]) before the bl.
 * args: r0 (unused after?), r1=arg1, r2=arg2.
 */

typedef struct {
    int f_0;
    int f_4;
    char _pad8[0x10 - 0x8];
    int f_10;
} pkt_0209f070_t;

extern void *func_0209dca8(void);
extern int  func_0209dd30(int sel, int b, int c, int d, int e);
extern void func_0209de5c(int idx, int b);
extern int  func_0209e0f0(int a, int b);

int func_0209f070(int a0, int arg1, int arg2) {
    pkt_0209f070_t *p;
    int r0;

    if (func_0209e0f0(a0, arg2) != 0) return 0;
    func_0209de5c(0, arg1);
    p = (pkt_0209f070_t *)func_0209dca8();
    r0 = func_0209dd30(0, 3, p->f_0, p->f_4, p->f_10);
    if (r0 == 0) return 2;
    return r0;
}
