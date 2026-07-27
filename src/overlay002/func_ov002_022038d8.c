/* func_ov002_022038d8: Guard (b6_11==0x23 || global==2), then
 * return 021bc0d4(1-bit0, 1, 0) > 0. */
typedef unsigned short u16;

struct S022038d8 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_11 : 6;
    u16 b12_15 : 4;
};

extern char data_ov002_022d016c[];
extern int func_ov002_021bc0d4(unsigned int bit, unsigned int k1, unsigned int k2);

int func_ov002_022038d8(struct S022038d8 *self) {
    if (self->b6_11 != 0x23 && *(int *)(data_ov002_022d016c + 0xcf8) != 2)
        return 0;
    return func_ov002_021bc0d4(1 - self->bit0, 1, 0) > 0;
}
