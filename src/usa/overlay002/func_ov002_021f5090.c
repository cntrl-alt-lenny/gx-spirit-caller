/* func_ov002_021f5090: brief 236 — tag6 != 0x23 → helper(bit0, 0xffff, 1); return 1. */

struct F021f5180_F2 {
    unsigned short bit0 : 1;
    unsigned short pad5 : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};
struct F021f5180_Self {
    unsigned short pad0;
    struct F021f5180_F2 f2;
};

extern int func_ov002_0226af00(unsigned int bit, unsigned int mask, unsigned int one);

int func_ov002_021f5090(struct F021f5180_Self *self) {
    if (self->f2.tag6 != 0x23) {
        func_ov002_0226af00(self->f2.bit0, 0xffff, 1);
    }
    return 1;
}
