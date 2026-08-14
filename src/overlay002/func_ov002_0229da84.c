/* func_ov002_0229da84: push a new entry into self's ring buffer.
 *
 * Ground truth for the surrounding family (func_ov002_0229da1c/60) already
 * shows the entry table lives AT self+0 (stride 0x14), self->fa8 (+0xa8) is
 * the base index, self->count (+0xa4) the running counter, and self+0xbc a
 * bit-per-slot "used" array cleared by absolute slot index (count-1).
 */

struct Ov002DaSelf {
    char pad0[0xa4];
    int count; /* +0xa4 */
    int fa8;   /* +0xa8 */
};

struct Ov002DaEntry {
    signed char b0;
    signed char b1;
    signed char b2;
    signed char b3;
    short h4;
    short h6;
    short h8;
    unsigned short ha;
    int wc;
    int w10;
};

extern int func_ov002_0229da1c(struct Ov002DaSelf *self, int arg1);

void func_ov002_0229da84(struct Ov002DaSelf *self, struct Ov002DaEntry *src) {
    struct Ov002DaEntry *dst;
    unsigned int *bitmaskBase;
    int idx, idx2, wordIdx, bitPos;
    int n = self->count + 1;

    self->count = n;
    func_ov002_0229da1c(self, n - 1);

    idx = self->count - 1 - self->fa8;
    dst = (struct Ov002DaEntry *)((char *)self + idx * 0x14);
    bitmaskBase = (unsigned int *)((char *)self + 0xbc);

    dst->b0 = src->b0;
    dst->b1 = src->b1;
    dst->b2 = src->b2;
    dst->b3 = src->b3;
    dst->h4 = src->h4;
    dst->h6 = src->h6;
    dst->h8 = src->h8;
    dst->ha = src->ha;
    dst->wc = src->wc;
    dst->w10 = src->w10;

    idx2 = self->count - 1;
    wordIdx = idx2 / 32;
    bitPos = idx2 & 0x1f;
    bitmaskBase[wordIdx] &= ~(1u << bitPos);
}
