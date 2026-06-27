/* CAMPAIGN-PREP candidate for func_021b9d98 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     load full int, (short) cast = lsl16;asr16 sign-extend; two cmp form (gt early-return, then lt negate); not ldrsh
 *   risk:       reshape-able: must load *a/*b as int and cast (short) so codegen uses lsl;lsr;asr shift-chains, not ldrsh; the `return -(x<y)` reproduces movlt#1/movge#0/rsb#0 better than a ternary.
 *   confidence: med
 */
/* func_ov006_021b9d98: 3-way compare of two sign-extended 16-bit halves loaded as
 * full ints: a.lo (low half of *a) vs b.hi (high half of *b).
 *
 *   r3 = (short)(*a)        ; sign-extend low half (lsl16;asr16 chain)
 *   cmp vs (short)(*b>>16)  ; high half of *b
 *   if (a.lo >  b.hi) return  1
 *   if (a.lo <  b.hi) return -1  else 0   (movlt 1 / movge 0 ; rsb #0)
 */

int func_ov006_021b9d98(int *a, int *b) {
    short x = (short)*a;
    short y = (short)(*b >> 16);
    if (x > y) return 1;
    return -(x < y);
}
