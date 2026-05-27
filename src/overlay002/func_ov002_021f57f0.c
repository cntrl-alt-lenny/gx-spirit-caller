/* func_ov002_021f57f0: brief 236 — if (tag6 == 2) helper(bit0, fld5); return 1. */

struct F021f57f0_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};
struct F021f57f0_Self {
    unsigned short pad0;
    struct F021f57f0_F2 f2;
};

extern int func_ov002_021deb28(unsigned int bit, unsigned int fld);

int func_ov002_021f57f0(struct F021f57f0_Self *self) {
    if (self->f2.tag6 == 2) {
        func_ov002_021deb28(self->f2.bit0, self->f2.fld5);
    }
    return 1;
}
