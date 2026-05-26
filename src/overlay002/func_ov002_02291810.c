/* func_ov002_02291810: brief 228 C-39 wave 3 — helper(1-bit0, 1); bool tail.
 *
 * Variant V9a, size 0x2c. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F02291810_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02291810_Self {
    unsigned short f0;
    struct F02291810_F2 f2;
};

extern int func_ov002_021bc22c(unsigned int v, unsigned int k);

int func_ov002_02291810(struct F02291810_Self *self) {
    return func_ov002_021bc22c(1 - self->f2.bit0, 1) != 0;
}
