typedef unsigned short u16;

struct Self0 {
    u16 f0;
    u16 bit0 : 1;
    u16 _rest0 : 11;
    u16 f2_1213 : 2;
    u16 _rest1 : 2;
    u16 f4lo6 : 6;
    u16 b6_14 : 9;
    u16 f4b15 : 1;
};

extern int func_ov002_021ff14c(int bit0, int a, int bits, int c, int d);

int func_ov002_02203290(struct Self0 *self) {
    if (func_ov002_021ff14c(self->bit0, 1, self->b6_14, 0, 1) != 0) return 2;
    return self->f2_1213 == 0;
}
