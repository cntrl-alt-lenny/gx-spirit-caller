struct F022081b0_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F022081b0_Self {
    unsigned short f0;
    struct F022081b0_F2 f2;
};

extern char data_ov002_022cf17c[];
extern int func_ov002_021bcd80(unsigned int bit0, int mask);

int func_ov002_022081b0(struct F022081b0_Self *self) {
    if (self->f2.tag6 != 0x23) {
        if (func_ov002_021bcd80(self->f2.bit0, ~0) == 0) {
            return 0;
        }
    }
    if (*(int *)(data_ov002_022cf17c + (self->f2.bit0 & 1) * 0x868) == 0) {
        return 0;
    }
    return 1;
}
