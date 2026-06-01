/* func_ov002_02205d20: for a high f2-field5 lacking 021b3ecc(0x15D3), return 2;
 * else forward to 022059d8. */
struct Func02205d20F2 {
    unsigned short bit0 : 1;
    unsigned short field5 : 5;
    unsigned short rest : 10;
};
struct Func02205d20Self {
    unsigned short pad0;
    struct Func02205d20F2 f2;
};
extern int func_ov002_021b3ecc(unsigned int bit, unsigned int field5, int code);
extern int func_ov002_022059d8(struct Func02205d20Self *self, int arg1);

int func_ov002_02205d20(struct Func02205d20Self *self, int arg1) {
    if (self->f2.field5 >= 5
        && func_ov002_021b3ecc(self->f2.bit0, self->f2.field5, 0x15D3) == 0)
        return 2;
    return func_ov002_022059d8(self, arg1);
}
