struct Ov002S2840 {
    char _pad0[2];
    unsigned short b0 : 1;
    unsigned short : 5;
    unsigned short kind : 6;
    unsigned short : 4;
    unsigned short f4_lo : 6;
    unsigned short f4_idx : 9;
    unsigned short : 1;
};

extern int func_ov002_021ff3bc(struct Ov002S2840 *self, int arg1);
extern int func_ov002_021b99b4(unsigned bit, unsigned field9);

int func_ov002_02202840(struct Ov002S2840 *self, int arg1) {
    unsigned k = self->kind;
    if (k == 0x16) return 1;
    if (k == 2) {
        if (func_ov002_021ff3bc(self, arg1) == 0) return 0;
        return func_ov002_021b99b4(self->b0, self->f4_idx) >= 0;
    }
    return 0;
}
