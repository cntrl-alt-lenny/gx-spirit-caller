/* func_ov002_02209728: gate arg1 (null, field1_5<=10, field12_13==0,
 * bit0==self->b0, func_0202b878==0x16, func_0202b8c0==0), then
 * func_ov002_021ff2c8 + func_ov002_021ff170 gate on self, then defer to
 * func_ov002_021ff354(self, arg1) for the final 0/2 result. */

struct Arg02209728_F2 {
    unsigned short bit0 : 1;
    unsigned short field1_5 : 5;
    unsigned short _pad6_11 : 6;
    unsigned short field12_13 : 2;
    unsigned short _pad14_15 : 2;
};
struct Arg02209728 {
    unsigned short f0;
    struct Arg02209728_F2 f2;
};

struct Self02209728_F2 {
    unsigned short b0 : 1;
    unsigned short _rest : 15;
};
struct Self02209728_F4 {
    unsigned short _pad0_5 : 6;
    unsigned short field9 : 9;
    unsigned short _top : 1;
};
struct Self02209728 {
    unsigned short f0;
    struct Self02209728_F2 f2;
    struct Self02209728_F4 f4;
};

extern int func_0202b878(int id);
extern int func_0202b8c0(int id);
extern int func_ov002_021ff2c8(void *self, int b0);
extern int func_ov002_021ff170(unsigned int bit, int n, unsigned int field9,
                                unsigned int z0, unsigned int z1);
extern int func_ov002_021ff354(void *self, void *arg1);

int func_ov002_02209728(struct Self02209728 *self, struct Arg02209728 *arg1) {
    int n;

    if (arg1 == 0) return 0;
    if (arg1->f2.field1_5 > 10) return 0;
    if (arg1->f2.field12_13 != 0) return 0;
    if (arg1->f2.bit0 != self->f2.b0) return 0;
    if (func_0202b878(arg1->f0) != 0x16) return 0;
    if (func_0202b8c0(arg1->f0) != 0) return 0;

    n = func_ov002_021ff2c8(self, self->f2.b0);
    if (func_ov002_021ff170(self->f2.b0, n, self->f4.field9, 0, 0) == 0) return 0;

    if (func_ov002_021ff354(self, arg1) != 0) return 2;
    return 0;
}
