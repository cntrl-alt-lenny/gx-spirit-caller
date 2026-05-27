/* func_ov002_0220d398: brief 236 — helper(bit0, fld5) == 0xffff. */

struct F0220d398_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F0220d398_Self {
    unsigned short pad0;
    struct F0220d398_F2 f2;
};

extern int func_ov002_021b3618(unsigned int bit, unsigned int fld);

int func_ov002_0220d398(struct F0220d398_Self *self) {
    return func_ov002_021b3618(self->f2.bit0, self->f2.fld5) == 0xffff;
}
