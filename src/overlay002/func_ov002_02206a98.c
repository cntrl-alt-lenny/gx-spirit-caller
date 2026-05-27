/* func_ov002_02206a98: brief 234 C-39b — sibling of 021ff354 (different helpers).
 *
 * Same shape as func_ov002_021ff354.c — tag6 != 0x23 → helper-chain.
 */

struct F02206a98_F2 {
    unsigned short bit0 : 1;
    unsigned short pad6 : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};
struct F02206a98_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F02206a98_Self {
    unsigned short pad0;
    struct F02206a98_F2 f2;
    struct F02206a98_F4 f4;
};

extern int func_ov002_021f40f4(struct F02206a98_Self *self);
extern int func_ov002_021ff170(unsigned int bit, int n, unsigned int field9,
                                unsigned int z0, unsigned int z1);

int func_ov002_02206a98(struct F02206a98_Self *self) {
    if (self->f2.tag6 != 0x23) {
        int n = func_ov002_021f40f4(self);
        if (func_ov002_021ff170(self->f2.bit0, n, self->f4.field9, 0, 0) == 0) return 0;
    }
    return 1;
}
