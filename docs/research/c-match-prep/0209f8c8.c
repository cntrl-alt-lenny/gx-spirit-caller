/* CAMPAIGN-PREP candidate for func_0209f8c8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl a(r5)/c(r4) in alloc order; mask=(1<<sh)-1; mla = field*ret+c
 *   risk:       reshape-able: orig builds mask via 'mov ip,#1; lsl; sub #1' and keeps a/c in callee-saved across the bl. If mwcc spills differently or forms the mask via rsb, a mov/sub pattern diverges (reg-alloc).
 *   confidence: med
 */
/* func_0209f8c8 (main, class C): mask b by ((1<<sh)-1), call helper on it,
 * then index = field*helper_ret + c. Decl-order: a(r5) saved first, then
 * c(r4); the masked b goes straight into r0 for the call.
 * args: r0=a (base for the u16 field at +0x810), r1=b, r2=c, r3=sh.
 */

extern int func_020a66a4(int v);

int func_0209f8c8(char *a, int b, int c, int sh) {
    int idx = b & ((1 << sh) - 1);
    int ret = func_020a66a4(idx);
    unsigned short field = *(unsigned short *)(a + 0x810);
    return field * ret + c;
}
