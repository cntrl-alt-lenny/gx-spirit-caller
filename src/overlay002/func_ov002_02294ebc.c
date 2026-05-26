/* func_ov002_02294ebc: brief 228 C-39 wave 3 — helper(bit0, 5); bool tail.
 *
 * Variant V3, size 0x28. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F02294ebc_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02294ebc_Self {
    unsigned short f0;
    struct F02294ebc_F2 f2;
};

extern int func_ov002_021c3c50(unsigned int bit0, unsigned int k);

int func_ov002_02294ebc(struct F02294ebc_Self *self) {
    return func_ov002_021c3c50(self->f2.bit0, 5) > 0;
}
