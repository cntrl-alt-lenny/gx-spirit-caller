/* func_ov002_021f84d4: brief 236 — helper(bit0, 0x16be, 1, field9); return 1. */

struct F021f85c4_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F021f85c4_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F021f85c4_Self {
    unsigned short pad0;
    struct F021f85c4_F2 f2;
    struct F021f85c4_F4 f4;
};

extern int func_ov002_021e267c(unsigned int bit, unsigned int lit, unsigned int one, unsigned int fld);

int func_ov002_021f84d4(struct F021f85c4_Self *self) {
    func_ov002_021e267c(self->f2.bit0, 0x16be, 1, self->f4.field9);
    return 1;
}
