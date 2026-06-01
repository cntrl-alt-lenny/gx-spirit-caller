/* func_ov002_02202e98: C-39d 021ca2b8 predicate — bail if the f2 6-bit field
 * is 0x23 or 021bb068(0x13f2) is positive, else report 021ca2b8(bit0). */

struct Func02202e98F2 {
    unsigned short bit0 : 1;
    unsigned short pad1 : 5;
    unsigned short field6 : 6;
    unsigned short rest : 4;
};

struct Func02202e98Self {
    unsigned short pad0;
    struct Func02202e98F2 f2;
};

extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_021bb068(int code);

int func_ov002_02202e98(struct Func02202e98Self *self) {
    if (self->f2.field6 == 0x23)
        return 0;
    if (func_ov002_021bb068(0x13f2) > 0)
        return 0;
    return func_ov002_021ca2b8(self->f2.bit0) != 0;
}
