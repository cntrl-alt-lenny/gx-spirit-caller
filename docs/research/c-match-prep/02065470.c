/* CAMPAIGN-PREP candidate for func_02065470 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     6 ordered sig stores; constant tag bytes; htonl term-order; signed htons via asr
 *   risk:       the htons uses asr (signed) and result is masked back to halfword via lsl#16/lsr#16 — if mwcc keeps it in a word the final shift pair vanishes; struct-guessed offsets + permuter-class orr grouping. Arg slot (r2=0x15) order tentative.
 *   confidence: low
 */
/* func_02065470: assemble a fixed packet header on the stack — copy a
 * 6-byte signature, stamp two constant tag bytes (2,6) and a status byte
 * from self+0xc, byteswap self+0x8 (htonl) into the body and a halfword
 * from arg+0x2 (signed htons) — then emit via func_02065dc0. */

extern unsigned char data_02101598[];   /* 6-byte signature literal */
extern int func_02065dc0(int a, int b, int c, int d);

typedef struct {
    int  word0;     /* +0x00 */
    char _pad4[0x8 - 0x4];
    unsigned int word8; /* +0x08 */
    int  wordc;     /* +0x0c */
} Self;

int func_02065470(Self *self, short *arg)
{
    unsigned char hdr[0x20];
    unsigned int w;
    int hh;

    hdr[0] = data_02101598[0];
    hdr[1] = data_02101598[1];
    hdr[2] = data_02101598[2];
    hdr[3] = data_02101598[3];
    hdr[4] = data_02101598[4];
    hdr[5] = data_02101598[5];
    hdr[6] = 2;
    hdr[7] = 6;
    hdr[0xd] = (unsigned char)self->wordc;

    w = self->word8;
    *(unsigned int *)(hdr + 8) = ((w >> 24) & 0xff) | ((w >> 8) & 0xff00) |
                                 ((w << 8) & 0xff0000) | ((w << 24) & 0xff000000);

    hh = arg[1];   /* ldrh [r1,#0x2], signed asr swap */
    hh = (((hh >> 8) & 0xff) | ((hh << 8) & 0xff00));

    return func_02065dc0(self->word0, arg[2], (hh << 16) >> 16, 0x15);
}
