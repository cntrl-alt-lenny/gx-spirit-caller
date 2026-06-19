/* func_ov002_02204b98: brief 236 — helper(bit0, 11, 0x1846) != 0.
 */

struct F02204c88_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02204c88_Self {
    unsigned short pad0;
    struct F02204c88_F2 f2;
};

extern int func_ov002_021b3dec(unsigned int bit, unsigned int k, unsigned int lit);

int func_ov002_02204b98(struct F02204c88_Self *self) {
    return func_ov002_021b3dec(self->f2.bit0, 11, 0x1846) != 0;
}
