/* CAMPAIGN-PREP candidate for func_02073f28 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod/carry: end-around carry fold (ands 0x10000; +1; &0xffff); compare != 0xffff
 *   risk:       reshape-able: the `& 0xffff` mask is the same pooled 0xffff reused by the final cmp (ldr _LIT0 once); mwcc may load 0xffff twice or place movne/moveq for the 0/1 in swapped order — operand/branch-order tweak should close it
 *   confidence: med
 */
/* func_02073f28: ones-complement checksum fold + compare to 0xffff.
 *   a = func_02073fc8(arg1, arg2, arg3)
 *   b = func_02073fc8(arg2+0xc, 8, a)
 *   s = b + arg1lo                         ; r5 holds first arg
 *   if (s & 0x10000) s = (s + 1) & 0xffff   ; end-around carry
 *   return s != 0xffff ? 1 : 0
 */

extern int func_02073fc8(int a, int b, int c);

int func_02073f28(int a0, int a1, int a2, int a3) {
    int a = func_02073fc8(a1, a2, a3);
    int b = func_02073fc8(a2 + 0xc, 8, a);
    int s = b + a1;
    if (s & 0x10000) {
        s = (s + 1) & 0xffff;
    }
    return s != 0xffff ? 1 : 0;
}
