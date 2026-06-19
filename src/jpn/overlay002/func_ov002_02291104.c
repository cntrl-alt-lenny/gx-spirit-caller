/* func_ov002_02291104: brief 228 C-39 wave 3 — int n = helper1(self); helper2(bit0, f0, n) <CMP> N.
 *
 * Variant Shape_alpha, size 0x34. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F02291214_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02291214_Self {
    unsigned short f0;
    struct F02291214_F2 f2;
};

extern int func_ov002_0223f5dc(struct F02291214_Self *self);
extern int func_ov002_02253600(unsigned int bit0, unsigned int f0, int n);

int func_ov002_02291104(struct F02291214_Self *self) {
    int n = func_ov002_0223f5dc(self);
    return func_ov002_02253600(self->f2.bit0, self->f0, n) > 0;
}
