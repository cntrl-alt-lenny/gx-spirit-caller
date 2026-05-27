/* func_ov002_02209ea0: brief 236 — int n = helper(bit0, fld5); self->fc = n; return n > 0. */

struct F02209ea0_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F02209ea0_Self {
    unsigned short pad0;
    struct F02209ea0_F2 f2;
    unsigned short f4;
    unsigned short f6;
    unsigned short f8;
    unsigned short fa;
    unsigned short fc;
};

extern int func_ov002_021b9e00(unsigned int bit, unsigned int fld);

int func_ov002_02209ea0(struct F02209ea0_Self *self) {
    int n = func_ov002_021b9e00(self->f2.bit0, self->f2.fld5);
    self->fc = (unsigned short)n;
    return n > 0;
}
