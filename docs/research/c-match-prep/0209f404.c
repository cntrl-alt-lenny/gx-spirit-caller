/* CAMPAIGN-PREP candidate for func_0209f404 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: Fill32 zero, store int then 2 halfwords, forward &rec + u16 stack arg
 *   risk:       reshape-able/struct-guessed: function is void in orig (no explicit return) - drop `return 0;` if it adds a `mov r0`. f514's stack-param order (e before &rec) and the u16 widths are inferred from the str/strh sequence.
 *   confidence: med
 */
/* func_0209f404: zero a 0x1c stack record, set int tag + two halfwords from
 * the 6th stack arg, then forward (a,b,c,d, (u16)arg5, &record) to f514.
 * class D store-order + stack-arg forwarding. arg5/arg6 arrive on the stack;
 * each is read u16. record: [0]=3 (int), [+4]=u16 arg6, [+6]=u16 arg6.
 */

extern void Fill32(int v, void *dst, int size);
extern void func_0209f514(int a, int b, int c, int d, int e, void *rec);

struct Rec0f404 {
    int tag;                /* +0 */
    unsigned short h4;      /* +4 */
    unsigned short h6;      /* +6 */
    unsigned char pad[0x14];/* +8 .. 0x1b (zeroed, total 0x1c) */
};

int func_0209f404(int a, int b, int c, int d, int arg5, int arg6) {
    struct Rec0f404 rec;
    Fill32(0, &rec, 0x1c);
    rec.tag = 3;
    rec.h4  = (unsigned short)arg6;
    rec.h6  = (unsigned short)arg6;
    func_0209f514(a, b, c, d, (unsigned short)arg5, &rec);
    return 0;
}
