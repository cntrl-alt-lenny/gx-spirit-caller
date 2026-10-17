struct Ov002S {
    char _pad0[2];
    unsigned short bit0 : 1;
    unsigned short : 5;
    unsigned short kind : 6;
    unsigned short : 4;
    char _pad1[16];
    unsigned int f14_lo : 9;
    unsigned int : 23;
};

extern int func_ov002_021b99b4(unsigned int bit, unsigned int field9);
extern void func_ov002_021d7268(unsigned int bit, unsigned int field9, unsigned int k);

int func_ov002_02225420(struct Ov002S *self) {
    if (self->kind == 0x16) {
        if (func_ov002_021b99b4(1 - self->bit0, self->f14_lo) >= 0) {
            func_ov002_021d7268(1 - self->bit0, self->f14_lo, 1);
        }
    }
    return 0;
}
