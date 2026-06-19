/* func_ov002_021f76f4: brief 236 — helper(bit0, fld5, 0x152a, 1, 0); return 1. 5-arg w/ stack-spill. */

struct F021f77e4_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F021f77e4_Self {
    unsigned short pad0;
    struct F021f77e4_F2 f2;
};

extern int func_ov002_021d58dc(unsigned int bit, unsigned int fld, unsigned int lit, unsigned int one, unsigned int z);

int func_ov002_021f76f4(struct F021f77e4_Self *self) {
    func_ov002_021d58dc(self->f2.bit0, self->f2.fld5, 0x152a, 1, 0);
    return 1;
}
