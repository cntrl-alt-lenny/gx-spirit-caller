struct F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 15;
};

struct F4 {
    unsigned short pad    : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};

struct Self {
    unsigned short f0;
    struct F2 f2;
    struct F4 f4;
};

extern void func_ov002_021e276c(unsigned int bit0, unsigned int f0, unsigned int c, unsigned short field9);

int func_ov002_02220f00(struct Self *self) {
    unsigned int v = 0;
    if (self->f0 == 0x14e2) {
        v = self->f4.field9;
    }
    func_ov002_021e276c(self->f2.bit0, self->f0, 1, v);
    return 0;
}
