/* CAMPAIGN-PREP candidate for func_02244cd8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: asymmetric (x<<26)>>27 as raw unsigned shift (not mask/bitfield); ==f-1||==f+1 -> cmp;cmpne; ldrh self->f2
 *   risk:       reshape-able: final result map emits moveq#0;movne#1 (ternary) vs if-form mov#0;movne#1 — operand order coin-flip; written as ternary to match. Mild struct-guessed on f2 offset.
 *   confidence: med
 */
/* func_ov002_02244cd8 — neighbor-index gate then predicate.
 * self->f2 holds a 5-bit field at bit1 ((x<<26)>>27, asymmetric -> raw shift);
 * accept arg2 only if it neighbors that field (+-1). */
typedef unsigned short u16;

struct Self02244cd8 { u16 f0; u16 f2; };

extern int func_ov002_021bc55c(int a, int b);

int func_ov002_02244cd8(struct Self02244cd8 *self, int arg1, int arg2) {
    unsigned int field;
    if (arg2 > 4)
        return 0;
    field = ((unsigned int)self->f2 << 26) >> 27;
    if (arg2 == (int)field - 1 || arg2 == (int)field + 1) {
        if (func_ov002_021bc55c(arg1, arg2) != 0)
            return 1;
        return 0;
    }
    return 0;
}
