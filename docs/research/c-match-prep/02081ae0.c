/* CAMPAIGN-PREP candidate for func_02081ae0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: store-order s->src/acc/cnt; shift-select branch; mask via >>
 *   risk:       reshape-able: the mask `0xff>>(8-n)` must fold to `mov #0xff` + `and r0,r5,r1,asr r0`; if mwcc emits `lsr` or a precomputed mask the final `and` diverges (try signed-char mask base).
 *   confidence: med
 */
/* func_02081ae0: MSB bit-reader with byte refill (recursion). s->0 = source
 * byte pointer, s->4 = signed bit-count remaining in s->5 accumulator,
 * s->5 = current byte. Reads `n` bits, refilling 8 bits at a time from *s->0
 * (post-increment). Returns the low n bits: (acc shifted) & (0xff >> (8-n)). */

struct bitreader {
    unsigned char *src; /* +0x0 */
    signed char    cnt; /* +0x4 */
    unsigned char  acc; /* +0x5 */
};

int func_02081ae0(struct bitreader *s, int n)
{
    int cnt = s->cnt;
    unsigned int acc = s->acc;
    int v;

    if (cnt >= n) {
        int rem = cnt - n;
        v = acc >> rem;
        s->cnt = rem;
    } else {
        unsigned char *p = s->src;
        int need = n - cnt;
        s->src = p + 1;
        s->acc = *p;
        v = acc << need;
        s->cnt = 8;
        v = func_02081ae0(s, need) | v;
    }
    return v & (0xff >> (8 - n));
}
