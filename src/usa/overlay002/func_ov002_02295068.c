/* func_ov002_02295068: brief 228 C-39 wave 3 — helper(bit0, 11, self->f0); bool tail.
 *
 * Variant V8, size 0x2c. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F02295178_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02295178_Self {
    unsigned short f0;
    struct F02295178_F2 f2;
};

extern int func_ov002_021b3dec(unsigned int bit0, unsigned int k, unsigned int f0);

int func_ov002_02295068(struct F02295178_Self *self) {
    return func_ov002_021b3dec(self->f2.bit0, 11, self->f0) == 0;
}
