/* func_ov002_02209e00: C-39d 021ca2b8 predicate — require 021ca2b8(bit0),
 * then report 021bc8c8(bit0, bit0, field5) nonzero (field5 = bits 5..9). */

struct Func02209e00F2 {
    unsigned short bit0 : 1;
    unsigned short field5 : 5;
    unsigned short rest : 10;
};

struct Func02209e00Self {
    unsigned short pad0;
    struct Func02209e00F2 f2;
};

extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_021bc8c8(unsigned int bit, unsigned int bit2, unsigned int field5);

int func_ov002_02209e00(struct Func02209e00Self *self) {
    if (func_ov002_021ca2b8(self->f2.bit0) == 0)
        return 0;
    return func_ov002_021bc8c8(self->f2.bit0, self->f2.bit0, self->f2.field5) != 0;
}
