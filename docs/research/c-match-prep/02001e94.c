/* CAMPAIGN-PREP candidate for func_02001e94 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload f_0/f_4 in loop tests; orr accumulator(val)-first; post-inc strh
 *   risk:       orig reloads p->f_0 (r6) inside inner loop and reuses last r6 for rsb (0x20-inner); decl-order of outer(r5) vs inner(r4=0 seed) may rotate registers — reshape-able by decl-order swap, but loop-induction reg-alloc could be permuter-class. Struct dims guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02001e94 (main, class C) — front-load.
 *   recipe: nested clear; orr pack val|(shift<<12) accumulator-first; reload counts
 * outer count p->f_4, inner count p->f_0 (both reloaded in loops);
 * strh (val|(shift<<12)) post-inc; advance dst by (0x20-inner)*2 each outer row.
 */
typedef struct {
    int f_0;
    int f_4;
} dims_t;

void func_02001e94(dims_t *p, unsigned short *dst, int val, int shift) {
    int outer;
    int j;
    if (p->f_4 == 0)
        return;
    for (outer = 0; outer < p->f_4; outer++) {
        for (j = 0; j < p->f_0; j++) {
            *dst++ = (unsigned short)(val | (shift << 12));
            val++;
        }
        dst += 0x20 - p->f_0;
    }
}
