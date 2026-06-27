/* CAMPAIGN-PREP candidate for func_020659ac (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ordered sig+tag stores; htonl/htons term-order; status bool; post-call field stamps
 *   risk:       `ldr r0,[r4,#4]; cmp r0,r1(=-1); ldreq r0,[r4]` is a conditional reload I modelled as if-assign — mwcc may instead keep r0 and not reload; reshape-able. Plus htonl grouping permuter-class; struct-guessed.
 *   confidence: low
 */
/* func_020659ac: build a larger packet header (6-byte sig + tag bytes 2,7),
 * byteswap self+0x8 (htonl), copy self+0x2c, htons self+0x30, byte self+0x32,
 * a status byte = (self+0x10 != 2), a sentinel-or-fallback word, emit via
 * func_02065dc0, then stamp self+0x28/0x24 and a conditional self+0x33. */

extern unsigned char data_02101598[];
extern int func_02055330(void);
extern int func_02065dc0(int a, int b, int c, int d);

typedef struct {
    int  word0;     /* +0x00 */
    int  word4;     /* +0x04 */
    unsigned int word8; /* +0x08 */
    char _padc[0x10 - 0xc];
    int  word10;    /* +0x10 */
    char _pad14[0x24 - 0x14];
    int  word24;    /* +0x24 */
    int  word28;    /* +0x28 */
    int  word2c;    /* +0x2c */
    short half30;   /* +0x30 */
    unsigned char byte32; /* +0x32 */
    unsigned char byte33; /* +0x33 */
} Self;

int func_020659ac(Self *self)
{
    unsigned char hdr[0x18];
    unsigned int w;
    int hh;
    int body0;

    hdr[0] = data_02101598[0];
    hdr[1] = data_02101598[1];
    hdr[2] = data_02101598[2];
    hdr[3] = data_02101598[3];
    hdr[4] = data_02101598[4];
    hdr[5] = data_02101598[5];
    hdr[6] = 2;
    hdr[7] = 7;

    w = self->word8;
    *(unsigned int *)(hdr + 8) = ((w >> 24) & 0xff) | ((w >> 8) & 0xff00) |
                                 ((w << 8) & 0xff0000) | ((w << 24) & 0xff000000);
    *(int *)(hdr + 0xc) = self->word2c;

    hh = self->half30;
    *(short *)(hdr + 0x10) = (short)(((hh >> 8) & 0xff) | ((hh << 8) & 0xff00));
    hdr[0x12] = self->byte32;
    hdr[0x13] = (self->word10 != 2);

    body0 = self->word0;
    if (self->word4 == -1) body0 = self->word0;   /* ldreq r0,[r4] */

    func_02065dc0(body0, self->word2c, self->half30, 0x14);

    self->word28 = func_02055330() + 0x2bc;
    self->word24 = 0xc;
    if (self->byte32 != 0) self->byte33 = 1;
}
