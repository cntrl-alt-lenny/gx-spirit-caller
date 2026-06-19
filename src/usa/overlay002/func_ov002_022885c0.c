/* func_ov002_022885c0: brief 236 — helper(bit0, 11, 0x14e2, 2) > 0. */

struct F022886d0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022886d0_Self {
    unsigned short pad0;
    struct F022886d0_F2 f2;
};

extern int func_ov002_021b3d7c(unsigned int bit, unsigned int k, unsigned int lit, unsigned int two);

int func_ov002_022885c0(struct F022886d0_Self *self) {
    return func_ov002_021b3d7c(self->f2.bit0, 11, 0x14e2, 2) > 0;
}
