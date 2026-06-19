/* func_ov002_02206ef4: brief 228 C-39 wave 3 — helper(bit0, self->f0, 0); bool tail.
 *
 * Variant V5, size 0x2c. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F02206fe4_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02206fe4_Self {
    unsigned short f0;
    struct F02206fe4_F2 f2;
};

extern int func_ov002_02253600(unsigned int bit0, unsigned int f0, unsigned int zero);

int func_ov002_02206ef4(struct F02206fe4_Self *self) {
    return func_ov002_02253600(self->f2.bit0, self->f0, 0) >= 2;
}
