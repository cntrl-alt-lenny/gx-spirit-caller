/* func_ov002_022081d4: C-39d 021ca2b8 predicate with a 0x868-indexed read —
 * require 021ca2b8(bit0), then report (cf17c[(bit0&1)] + 021ff2c8(self, bit0))
 * nonzero. */

struct Func022082c4F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func022082c4Self {
    unsigned short pad0;
    struct Func022082c4F2 f2;
};

extern int func_ov002_021ca1d8(unsigned int bit);
extern int func_ov002_021ff1d8(struct Func022082c4Self *self, unsigned int bit);
extern char data_ov002_022cf09c[];

int func_ov002_022081d4(struct Func022082c4Self *self) {
    if (func_ov002_021ca1d8(self->f2.bit0) != 0) {
        return (*(int *)(data_ov002_022cf09c + (self->f2.bit0 & 1) * 0x868)
                + func_ov002_021ff1d8(self, self->f2.bit0)) != 0;
    }
    return 0;
}
