/* func_ov002_021f6068: brief 236 — helper(bit0, 11, 0x12a1, field9); return 1. */

struct F021f6068_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F021f6068_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F021f6068_Self {
    unsigned short pad0;
    struct F021f6068_F2 f2;
    struct F021f6068_F4 f4;
};

extern int func_ov002_021d5c50(unsigned int bit, unsigned int k, unsigned int lit, unsigned int fld);

int func_ov002_021f6068(struct F021f6068_Self *self) {
    func_ov002_021d5c50(self->f2.bit0, 11, 0x12a1, self->f4.field9);
    return 1;
}
