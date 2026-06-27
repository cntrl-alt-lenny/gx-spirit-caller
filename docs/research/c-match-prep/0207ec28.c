/* CAMPAIGN-PREP candidate for func_0207ec28 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 locals: first cmp signed (h8<=h6+1 -> bgt), second unsigned cast ((unsigned)h4<=h6 -> movls); materialised && then ternary predicate
 *   risk:       second compare is movls (unsigned) while first is bgt (signed) on same h6 — driven by the (unsigned)h4 cast; if mwcc emits signed movle the byte diverges. reshape-able: tune cast / nested-if vs && form.
 *   confidence: low
 */
/* func_0207ec28: range-test then u16 wrap-subtract, ternary select. */
typedef struct {
    char           _pad00[0x4]; /* 0x0 */
    unsigned short h4;          /* 0x4 */
    unsigned short h6;          /* 0x6 */
    unsigned short h8;          /* 0x8 */
} rng_t;

unsigned short func_0207ec28(rng_t *p) {
    unsigned short h6 = p->h6;
    unsigned short h8 = p->h8;
    int flag = (h8 <= h6 + 1) && ((unsigned)p->h4 <= h6);
    return flag ? (unsigned short)(h6 - h8 + 1) : 0;
}
