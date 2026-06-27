/* CAMPAIGN-PREP candidate for func_02082fcc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: byte-assemble LE word in asm order; blx via fn-ptr; store-order
 *   risk:       reshape-able: the orr interleave (r3,ip,r6 then r1) must match the asm's exact byte-merge order; if mwcc schedules the `ldrb`/`orr` pairs differently the word-build diverges. Keep r[1]|r[2]<<8|... left-to-right.
 *   confidence: med
 */
/* func_02082fcc: stream-advance over a 9-byte record. s->0x34 = optional
 * callback (blx), s->0x96 = a mode byte, s->8 = flags. When not busy (flag
 * 0x100) and not gated, assemble two LE 32-bit words from record bytes [1..8]
 * and dispatch func_02084efc(rec+word0, word1). Always advance s->0 by 9. */

extern void func_02084efc(unsigned char *p, unsigned int w);

struct strm {
    unsigned char *cur;  /* +0x0 */
    int            pad1; /* +0x4 */
    unsigned int   flags;/* +0x8 */
    /* ... */
};

void func_02082fcc(unsigned char *s)
{
    unsigned char *recp;
    void (*cb)(unsigned char *);
    int mode;
    int gate;

    cb = *(void (**)(unsigned char *))(s + 0x34);
    mode = cb ? *(unsigned char *)(s + 0x96) : 0;

    if (mode == 1) {
        *(unsigned int *)(s + 0x8) &= ~0x40;
        (*(void (**)(unsigned char *))(s + 0x34))(s);
        cb = *(void (**)(unsigned char *))(s + 0x34);
        mode = cb ? *(unsigned char *)(s + 0x96) : 0;
        gate = *(unsigned int *)(s + 0x8) & 0x40;
    } else {
        gate = 0;
    }

    if (!(*(unsigned int *)(s + 0x8) & 0x100) && gate == 0) {
        unsigned char *r = *(unsigned char **)s;
        unsigned int w0 = r[1] | (r[2] << 8) | (r[3] << 16) | (r[4] << 24);
        unsigned int w1 = r[5] | (r[6] << 8) | (r[7] << 16) | (r[8] << 24);
        func_02084efc(r + w0, w1);
    }

    if (mode == 3) {
        *(unsigned int *)(s + 0x8) &= ~0x40;
        (*(void (**)(unsigned char *))(s + 0x34))(s);
    }

    recp = *(unsigned char **)s;
    *(unsigned char **)s = recp + 9;
}
