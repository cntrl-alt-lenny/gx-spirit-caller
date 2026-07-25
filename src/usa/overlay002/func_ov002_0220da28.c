/* func_ov002_0220da28: forward self->b0 + a 5-bit sub-field (bits1-5 of
 * self->f_2) to func_ov002_021b3878; 0xffff result short-circuits to 0. */
struct Ov002Self3 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short field5 : 5;
    unsigned short pad : 10;
};

extern int func_ov002_021b3878(int a, int b);
extern int func_ov002_02208b0c(struct Ov002Self3 *self, int arg1);

int func_ov002_0220da28(struct Ov002Self3 *self, int arg1) {
    int r = func_ov002_021b3878(self->b0, self->field5);
    if (r == 0xffff)
        return 0;
    return func_ov002_02208b0c(self, arg1);
}
