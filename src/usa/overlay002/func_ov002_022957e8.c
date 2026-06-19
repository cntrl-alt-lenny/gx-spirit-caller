/* func_ov002_022957e8: brief 228 C-39 wave 3 — single-arg helper, signed bool.
 *
 * Variant V0, size 0x24. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F022958f8_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F022958f8_Self {
    unsigned short f0;
    struct F022958f8_F2 f2;
};

extern int func_ov002_02280870(unsigned int bit0);

int func_ov002_022957e8(struct F022958f8_Self *self) {
    return func_ov002_02280870(self->f2.bit0) <= 0;
}
