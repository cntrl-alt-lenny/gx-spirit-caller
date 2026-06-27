/* CAMPAIGN-PREP candidate for func_02081648 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order, flag if-chain, (v+1)/2 signed round, fixed stack-arg order
 *   risk:       reshape-able: outgoing-stack-arg slot order for the two calls (z/flags/arg6) may permute; if mwcc reorders the str-to-sp, swap C arg positions.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02081648 (main, class C) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: decl-order r8/r7/r6/r5/r4; flag-test if-chain; (v+1)/2 signed round; outgoing-stack-arg order fixed
 */
/* func_02081648: helper computes a 4-int delta buffer from s->{4,8,c};
 * flags word (5th stack arg) selects how x(r7)/y(r6) are nudged, then a
 * second helper is called with the adjusted coords. */

extern void func_0207feec(int *out, int a, int b, int c, int arg4);
extern void func_020816f4(void *s, int x, int y, int d, int z, int flags, int arg6);

void func_02081648(void *s, int x, int y, int z, int flags, int arg6) {
    int out[4];
    int *sp = (int *)s;
    func_0207feec(out, sp[1], sp[2], sp[3], arg6);
    if (flags & 0x10) {
        x -= (out[0] + 1) / 2;
    } else if (flags & 0x20) {
        x -= out[0];
    }
    if (flags & 0x2) {
        y -= (out[1] + 1) / 2;
    } else if (flags & 0x4) {
        y -= out[1];
    }
    func_020816f4(s, x, y, out[0], z, flags, arg6);
}
