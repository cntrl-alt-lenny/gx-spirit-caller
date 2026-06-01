/* func_ov002_022059d8: 021ff3bc/021ff320 predicate — require 021ff320, then
 * for a low f2 field report 021bd030(bit0) >= 0, else return 2 if the
 * 021ff3bc(self, arg1) query fires. */

struct Func022059d8F2 {
    unsigned short bit0 : 1;
    unsigned short field5 : 5;
    unsigned short rest : 10;
};

struct Func022059d8Self {
    unsigned short pad0;
    struct Func022059d8F2 f2;
};

extern int func_ov002_021ff320(struct Func022059d8Self *self);
extern int func_ov002_021bd030(unsigned int bit);
extern int func_ov002_021ff3bc(struct Func022059d8Self *self, int arg1);

int func_ov002_022059d8(struct Func022059d8Self *self, int arg1) {
    if (func_ov002_021ff320(self) == 0)
        return 0;
    if (self->f2.field5 <= 4)
        return func_ov002_021bd030(self->f2.bit0) >= 0;
    if (func_ov002_021ff3bc(self, arg1) != 0)
        return 2;
    return 0;
}
