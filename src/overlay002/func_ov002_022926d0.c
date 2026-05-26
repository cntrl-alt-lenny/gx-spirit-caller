/* func_ov002_022926d0: brief 228 C-39 wave 3 — helper(bit0, 0); bool tail.
 *
 * Variant V3, size 0x28. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F022926d0_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F022926d0_Self {
    unsigned short f0;
    struct F022926d0_F2 f2;
};

extern int func_ov002_0227d660(unsigned int bit0, unsigned int k);

int func_ov002_022926d0(struct F022926d0_Self *self) {
    return func_ov002_0227d660(self->f2.bit0, 0) >= 0;
}
