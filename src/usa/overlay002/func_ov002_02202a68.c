/* func_ov002_02202a68: 021ff3bc-query predicate — require the query and
 * 021ca3f0(bit0, 0x1422); for f2-field6 == 0x23 gate on 021ff2b8(self, bit0)
 * (2 if >= 2, else 0), otherwise accept. */

struct Func02202b58F2 {
    unsigned short bit0 : 1;
    unsigned short pad1 : 5;
    unsigned short field6 : 6;
    unsigned short rest : 4;
};

struct Func02202b58Self {
    unsigned short pad0;
    struct Func02202b58F2 f2;
};

extern int func_ov002_021ff2cc(struct Func02202b58Self *self);
extern int func_ov002_021ca310(unsigned int bit, int code);
extern int func_ov002_021ff1c8(struct Func02202b58Self *self, unsigned int bit);

int func_ov002_02202a68(struct Func02202b58Self *self) {
    if (func_ov002_021ff2cc(self) == 0)
        return 0;
    if (func_ov002_021ca310(self->f2.bit0, 0x1422) == 0)
        return 0;
    if (self->f2.field6 == 0x23) {
        if (func_ov002_021ff1c8(self, self->f2.bit0) < 2)
            return 0;
        return 2;
    }
    return 1;
}
