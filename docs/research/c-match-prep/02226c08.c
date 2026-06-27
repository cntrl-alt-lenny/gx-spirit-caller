/* CAMPAIGN-PREP candidate for func_02226c08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0/5-bit bitfields + asym 9-bit raw shift; symmetric slot-word extracts; reload base
 *   risk:       permuter-class: post-call unpack r1&0xff / ((int)(u16)got>>8) reg-alloc + asr-vs-lsr; if mwcc colours r0/r1 differently the 2 and/mov diverge
 *   confidence: med
 */
/* func_ov002_02226c08: cls D. self at r0. If self->mode(+0xc)!=2, tail to
 * 02226268(self). Else validate the per-player slot record (bit0 + 5-bit row
 * select a 0x868/0x14 strided slot in cf16c; compare its packed word field vs
 * self->f4 9-bit field); on mismatch return 0. On match, query 021b3618 and
 * forward (lo byte, hi byte) to 021d6808. */
typedef unsigned char  u8;
typedef unsigned short u16;

/* self->f2: bit0 player flag + 5-bit row index (symmetric shifts => bitfields) */
struct Self {
    u16 f0;            /* +0x0 */
    u16 b0 : 1;        /* +0x2 bit0  (lsl#31;lsr#31)            */
    u16 row : 5;       /* +0x2 bits1..5 (lsl#26;lsr#27)         */
    u16 f4;            /* +0x4 packed field (asym 9-bit at b6)  */
    u16 f6;
    u16 f8;
    u16 fa;
    u16 fc;            /* +0xc mode                              */
};

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b3618(void);
extern int  func_ov002_021d6808(struct Self *self, int a, int b, int c, int d);
extern int  func_ov002_02226268(struct Self *self);

int func_ov002_02226c08(struct Self *self) {
    char *slot;
    unsigned int w;
    int got;
    if (self->fc != 2)
        return func_ov002_02226268(self);
    slot = data_ov002_022cf16c + (self->b0 & 1) * 0x868 + self->row * 0x14 + 0x30;
    w = *(unsigned int *)slot;
    if ((unsigned)(self->f4 << 17) >> 23 !=
        (((w << 2) >> 24) << 1) + ((w << 18) >> 31))
        return 0;
    got = func_ov002_021b3618();
    func_ov002_021d6808(self, got & 0xff, ((int)(u16)got >> 8) & 0xff, 0, 0);
    return 0;
}
