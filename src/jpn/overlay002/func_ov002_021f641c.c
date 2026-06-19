/* func_ov002_021f641c: brief 236 — tag6 != 0x23 → helper(bit0, 1, 1, 0); return 1. */

struct F021f650c_F2 {
    unsigned short bit0 : 1;
    unsigned short pad5 : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};
struct F021f650c_Self {
    unsigned short pad0;
    struct F021f650c_F2 f2;
};

extern int func_ov002_0226ad40(unsigned int bit, unsigned int one, unsigned int one2, unsigned int z);

int func_ov002_021f641c(struct F021f650c_Self *self) {
    if (self->f2.tag6 != 0x23) {
        func_ov002_0226ad40(self->f2.bit0, 1, 1, 0);
    }
    return 1;
}
