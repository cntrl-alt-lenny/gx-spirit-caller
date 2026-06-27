/* CAMPAIGN-PREP candidate for func_02080cdc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: divmod — (tag<<6)/8 via asr#3-with-rounding magic; conditional nibble vs byte replicate; mul chain order
 *   risk:       reshape-able: the (tag*0x40) signed /8 lowers to asr#2;+lsr29;asr3 (the magic). Plain '/8' on a known-nonneg may emit a bare asr#3 instead — if so cast/keep signed to force the rounding add. orr replicate order matches.
 *   confidence: med
 */
/* func_02080cdc: expand a fill byte (4-bit or 8-bit replicate by tag s->fc),
 * compute count = (s->f4 * s->f8) * ((tag*0x40)/8) then call func_02094504. */
extern void func_02094504(unsigned int fill, void *p, int n);

typedef struct {
    int f0;          /* +0x00 ptr */
    int f4;          /* +0x04 */
    int f8;          /* +0x08 */
    unsigned char fc;/* +0x0c tag */
} FillCtx;

void func_02080cdc(FillCtx *s, unsigned int v) {
    unsigned char tag = s->fc;
    int stride = s->f4;
    unsigned int fill;
    int area, n;
    if (tag == 4) {
        v = v | (v << 4);
        v = v | (v << 8);
        fill = v | (v << 16);
    } else {
        v = v | (v << 8);
        fill = v | (v << 16);
    }
    area = stride * s->f8;
    n = area * ((tag << 6) / 8);
    func_02094504(fill, (void *)s->f0, n);
}
