/* CAMPAIGN-PREP candidate for func_02023d88 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: stack struct-copy save/restore; ordered u16 RMW at +0xce; i*0x10 indexed clear
 *   risk:       struct-guessed: the 0x68 copy must unroll to ldmia!/stmia! (6x4+2) not memcpy call — relies on fixed-size struct assign. Tail loop uses TWO bases (self+i*0x10 for the halfword, separate `r3` walking +0xa7 with str[],#0x10 post-inc); if mwcc shares one base, the add/strb scheduling diverges (permuter-class).
 *   confidence: low
 */
/* func_02023d88: save a 0x68-byte prefix of *self to a stack copy, zero the
 * whole 0xd0 struct (Fill32), restore the saved prefix, set flag bits at
 * +0xce (clear bit0 then set bit0; then set bit1), run three init helpers,
 * and clear a 3-entry sub-array (stride 0x10): s16 at +0xa4 = -1 and bit0 of
 * the byte at +0xa7 cleared. Returns 1.
 *
 * The 0x68 save/restore are struct copies (mwcc unrolls to a 6x4+2 word
 * ldmia!/stmia! loop, matching .L_18 / .L_4c). Field stores at +0xce are
 * RMW on a u16; emit in source order. The tail loop indexes self+i*0x10.
 */

typedef struct { unsigned int w[26]; } blob68_t;   /* 0x68 bytes */

typedef struct {
    char  _pad0[0xa4];
    short f_a4;          /* +0xa4 (per 0x10-stride entry) */
    char  _pad1[0x01];   /* +0xa6 */
    unsigned char f_a7;  /* +0xa7 flag byte */
    char  _pad2[0x26];
    unsigned short f_ce; /* +0xce */
} obj_02023d88_t;

extern void Fill32(int v, void *dst, int size);
extern void func_02023eb8(void *self);
extern void func_02023f28(void *self);
extern void func_02023f4c(void *self);

int func_02023d88(obj_02023d88_t *self) {
    blob68_t saved;
    obj_02023d88_t *p;
    int i;

    saved = *(blob68_t *)self;
    Fill32(0, self, 0xd0);
    *(blob68_t *)self = saved;

    self->f_ce = (self->f_ce & ~1u) | 1u;
    self->f_ce |= 2u;

    func_02023eb8(self);
    func_02023f28(self);
    func_02023f4c(self);

    p = self;
    for (i = 0; i < 3; i++) {
        *(short *)((char *)self + i * 0x10 + 0xa4) = -1;
        p->f_a7 &= ~1u;
        p = (obj_02023d88_t *)((char *)p + 0x10);
    }
    return 1;
}
