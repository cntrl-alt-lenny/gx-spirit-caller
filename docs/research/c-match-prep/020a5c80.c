/* CAMPAIGN-PREP candidate for func_020a5c80 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 0-based 7-wide table; mask-then-shift high byte (and;asr); store-order low/high
 *   risk:       reshape-able: src->tag is re-loaded (orig does ldrb twice); if mwcc keeps it in a reg the second ldrb vanishes -> bind/reload flip. asr-vs-lsr hinges on the masked-int >>; struct-guessed offsets (h2@+2,h4@+4).
 *   confidence: med
 */
/* func_020a5c80: copy src[0] to dst[0], then 0-based switch(src[0]) cmp #6.
 * case0/default ->0; case4 unpacks two u16 LE pairs (4 bytes); else dst+1.
 * high byte via (x & 0xff00)>>8 -> and #0xff00; asr #8 (masked int >> is asr). */
struct Rec5c80 { unsigned char tag; unsigned char _p1; unsigned short h2; unsigned short h4; };

unsigned char *func_020a5c80(struct Rec5c80 *src, unsigned char *dst) {
    unsigned char *q;

    dst[0] = src->tag;
    q = dst + 1;
    switch (src->tag) {
    case 0:
        return 0;
    case 4:
        q[0] = (unsigned char)src->h2;
        q[1] = (unsigned char)((src->h2 & 0xff00) >> 8);
        q[2] = (unsigned char)src->h4;
        q[3] = (unsigned char)((src->h4 & 0xff00) >> 8);
        return q + 4;
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
        return q;
    default:
        return 0;
    }
}
