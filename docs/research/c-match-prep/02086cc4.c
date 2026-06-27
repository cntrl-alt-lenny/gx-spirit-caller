/* CAMPAIGN-PREP candidate for func_02086cc4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl x/y first-used order; reload m22 (no bind); -a then *(>>12 asr) sincos pair
 *   risk:       mul/asr operand order around the two bed8 results may schedule differently (post-blx reg rotation); permuter-class. Sibling 02086f24 shipped as .s for exactly this.
 *   confidence: low
 */
/* func_02086cc4: transform builder. sincos pair func_0208be38(y,x)/func_0208bed8().
 * Sibling of func_02086f24/02086d70 (both ship as .s, reg-alloc-walled). */

typedef struct {
    char           _pad_0[0x20];
    short          m20;      /* +0x20 */
    short          m22;      /* +0x22 */
    char           _pad_24[0x8];
    unsigned short a2c;      /* +0x2c */
    unsigned short a2e;      /* +0x2e */
} mtxsrc_t;

extern void func_0208be38(int y, int x);
extern int  func_0208bed8(void);

void func_02086cc4(int *out, mtxsrc_t *s) {
    int x = s->a2c << 12;
    int y = s->a2e << 12;
    int c, sn;

    func_0208be38(y, x);
    out[0]    = s->m22;
    out[0x14/4] = s->m22;
    c = func_0208bed8();
    out[0x4/4]  = (s->m20 * c) >> 12;

    func_0208be38(x, y);
    out[0x30/4] = (s->a2c * s->m20) << 4;
    out[0x34/4] = (-s->a2e * (s->m22 - 0x1000)) << 4;
    sn = func_0208bed8();
    out[0x10/4] = (-s->m20 * sn) >> 12;
}
