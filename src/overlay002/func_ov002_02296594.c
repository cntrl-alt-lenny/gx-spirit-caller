/* func_ov002_02296594: brief 228 C-39 wave 3 — helper(self, 1-bit0, 1); bool tail.
 *
 * Variant V9b, size 0x2c. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F02296594_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02296594_Self {
    unsigned short f0;
    struct F02296594_F2 f2;
};

extern int func_ov002_02281760(struct F02296594_Self *self, unsigned int v, unsigned int k);

int func_ov002_02296594(struct F02296594_Self *self) {
    return func_ov002_02281760(self, 1 - self->f2.bit0, 1) != 0;
}
