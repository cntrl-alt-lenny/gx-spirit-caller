struct F04b08Self {
    char _pad0[2];
    unsigned short f2_b0 : 1;
    unsigned short : 5;
    unsigned short kind : 6;
    unsigned short : 4;
    unsigned short f_4;
};

extern int func_ov002_021ff3bc(struct F04b08Self *self, int a1);
extern int func_ov002_021b99b4(unsigned bit, unsigned field9);

int func_ov002_02204b08(struct F04b08Self *self, int a1) {
    if (self->kind == 2) {
        if (func_ov002_021ff3bc(self, a1) == 0)
            return 0;
        return func_ov002_021b99b4(self->f2_b0, ((unsigned)(self->f_4 << 17)) >> 23) >= 0;
    }
    return 0;
}
