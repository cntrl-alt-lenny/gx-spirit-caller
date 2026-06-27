/* CAMPAIGN-PREP candidate for func_02066650 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reordered sig stores (2,3,0,1,4,5); compare loop with bool flag; htonl; blx via fn ptr
 *   risk:       asm guards on [r3+0xa0]/[r3+0xa4] AFTER computing match — if mwcc hoists the null-check before the byteswap/body copy, scheduling diverges. permuter-class; struct-guessed offsets + htonl grouping. Note odd sig store order 2,3,0,1.
 *   confidence: low
 */
/* func_02066650: copy a 6-byte signature to the stack, compare it byte-wise
 * against the caller's buffer (len>=10 required), then either invoke the
 * match handler at +0xa0 (with a byteswapped dword from buf+6) or the
 * mismatch handler at +0xa4, both via function pointers; +0x10c is a ctx. */

extern unsigned char data_020bee6c[];   /* 6-byte signature literal */

typedef int (*MatchFn)(unsigned int v, int ctx);
typedef int (*MissFn)(unsigned char *buf, int rest, int ctx);

typedef struct {
    char _pad0[0xa0];
    MatchFn fn_a0;   /* +0xa0 */
    MissFn  fn_a4;   /* +0xa4 */
    char _pada8[0x10c - 0xa8];
    int ctx10c;      /* +0x10c */
} Self;

int func_02066650(Self *self, unsigned char *buf, int len)
{
    unsigned char sig[6];
    unsigned char body[4];
    int i;
    int match;
    unsigned int w;

    sig[2] = data_020bee6c[2];
    sig[3] = data_020bee6c[3];
    sig[0] = data_020bee6c[0];
    sig[1] = data_020bee6c[1];
    sig[4] = data_020bee6c[4];
    sig[5] = data_020bee6c[5];

    match = 1;
    if (len < 0xa) {
        match = 0;
    } else {
        for (i = 0; i < 6; i++) {
            if (sig[i] != buf[i]) { match = 0; break; }
        }
    }

    if (match) {
        body[0] = buf[6];
        body[1] = buf[7];
        body[2] = buf[8];
        body[3] = buf[9];
        if (self->fn_a0 == 0) return 0;     /* [r3,#0xa0]==0 guard */
        w = *(unsigned int *)body;
        w = ((w >> 24) & 0xff) | ((w >> 8) & 0xff00) |
            ((w << 8) & 0xff0000) | ((w << 24) & 0xff000000);
        return self->fn_a0(w, self->ctx10c);
    }

    if (self->fn_a4 == 0) return 0;          /* [r3,#0xa4]==0 guard */
    return self->fn_a4(buf, len, self->ctx10c);
}
