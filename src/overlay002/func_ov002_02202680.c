/* func_ov002_02202680: 021ff3bc-query predicate — bail if 021b4204(f4, f0)
 * fires, require the query, then report 021b99b4(bit0, f4) >= 0. */

struct Func02202680F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func02202680F4 {
    unsigned short pad : 6;
    unsigned short field9 : 9;
    unsigned short rest : 1;
};

struct Func02202680Self {
    unsigned short f0;
    struct Func02202680F2 f2;
    struct Func02202680F4 f4;
};

extern int func_ov002_021b4204(unsigned int f4, unsigned int f0);
extern int func_ov002_021ff3bc(struct Func02202680Self *self, int arg1);
extern int func_ov002_021b99b4(unsigned int bit, unsigned int f4);

int func_ov002_02202680(struct Func02202680Self *self, int arg1) {
    if (func_ov002_021b4204(self->f4.field9, self->f0) != 0)
        return 0;
    if (func_ov002_021ff3bc(self, arg1) == 0)
        return 0;
    return func_ov002_021b99b4(self->f2.bit0, self->f4.field9) >= 0;
}
