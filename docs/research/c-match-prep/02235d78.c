/* CAMPAIGN-PREP candidate for func_02235d78 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind parityOff=b0*0x868 once (orig keeps r2 mul live); record+0x30+col*20; mask cf1a4+parityOff
 *   risk:       struct-guessed/reshape-able: orig BINDS the 0x868 product in r2 across record + mask reads — keep it one local (don't recompute); record coord-bit widths inferred. Confirm struct + cf1a4 stride.
 *   confidence: med
 */
/* func_ov002_02235d78 (ov002, class D, 'clean' per note): validate the packed
 * coord (offset2 col -> cf16c 0x868 record, offset4 coord) and the cf1a4 mask,
 * then tail func_02212c64. Closest matched analogue: JPN 021e770c + 021b8fc8. */
typedef unsigned short u16;

struct Self02235d78 {
    u16 f0;            /* +0 */
    u16 packed2;       /* +2: bit0 (<<0x1f>>0x1f &1), col=bits[6:2] (<<0x1a>>0x1b) */
    u16 packed4;       /* +4: coord bits via <<0x11>>0x17 */
};

extern char data_ov002_022cf16c[];   /* _LIT1 record base */
extern char data_ov002_022cf1a4[];   /* _LIT2 mask table base */
extern int  func_ov002_02212c64(struct Self02235d78 *self);

int func_ov002_02235d78(struct Self02235d78 *self) {
    int b0 = (self->packed2 << 31) >> 31 & 1;          /* r3 = &1 */
    int col = (unsigned int)(self->packed2 << 26) >> 27; /* lr>>0x1b */
    int parityOff = b0 * 0x868;                          /* r2 = mul 0x868 */
    char *recBase = data_ov002_022cf16c + parityOff + 0x30;
    int w = *(int *)(recBase + col * 20);
    int qcoord = (unsigned int)(self->packed4 << 17) >> 23;   /* r4 */
    int cellY = ((unsigned int)(w << 2) >> 24 << 1) + ((unsigned int)(w << 18) >> 31);
    if (qcoord != cellY) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + parityOff) == 0) return 0;
    return func_ov002_02212c64(self);
}
