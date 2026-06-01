/* func_ov002_02205278: C-39d 021ca2b8 predicate — three guards on self->f2.bit0:
 * require 021ca2b8(bit0), require 021bc618(bit0) >= 2, then report
 * 022536e8(bit0, self->f0, 0) >= 2. */

struct Func02205278F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func02205278Self {
    unsigned short f0;
    struct Func02205278F2 f2;
};

extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_021bc618(unsigned int bit);
extern int func_ov002_022536e8(unsigned int bit, unsigned int a, int b);

int func_ov002_02205278(struct Func02205278Self *self) {
    if (func_ov002_021ca2b8(self->f2.bit0) == 0)
        return 0;
    if (func_ov002_021bc618(self->f2.bit0) < 2)
        return 0;
    return func_ov002_022536e8(self->f2.bit0, self->f0, 0) >= 2;
}
