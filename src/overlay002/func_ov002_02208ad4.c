struct F2208ad4_F2 {
    unsigned short bit0 : 1;
    unsigned short pad : 5;
    unsigned short kind : 6;
    unsigned short rest : 4;
};
struct F2208ad4_F14 {
    unsigned int lo : 16;
    unsigned int mid : 5;
    unsigned int bit21 : 1;
    unsigned int rest : 10;
};
struct F2208ad4_Self {
    unsigned short f0;
    struct F2208ad4_F2 f2;
    unsigned char pad[16];
    struct F2208ad4_F14 f14;
};
extern int func_ov002_021ca698(unsigned int a, unsigned int b);

int func_ov002_02208ad4(struct F2208ad4_Self *self) {
    if (self->f2.kind == 0xf) {
        if (self->f14.bit21 != self->f2.bit0) {
            return 0;
        }
        if (0xbb8 > self->f14.lo) {
            return 0;
        }
        if (func_ov002_021ca698(self->f2.bit0, 0) == 0) {
            return 0;
        }
        if (func_ov002_021ca698(self->f2.bit0, 1) != 0) {
            return 1;
        }
        return 0;
    }
    return 0;
}
