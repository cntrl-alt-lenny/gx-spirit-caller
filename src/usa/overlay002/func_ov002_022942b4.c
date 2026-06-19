/* func_ov002_022942b4: brief 228 C-39 wave 3 — helper(self, bit0, -1, 0); bool tail.
 *
 * Variant V7, size 0x2c. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F022943c4_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F022943c4_Self {
    unsigned short f0;
    struct F022943c4_F2 f2;
};

extern int func_ov002_02280ce4(struct F022943c4_Self *self, unsigned int bit0, int mask, unsigned int zero);

int func_ov002_022942b4(struct F022943c4_Self *self) {
    return func_ov002_02280ce4(self, self->f2.bit0, ~0, 0) >= 0;
}
