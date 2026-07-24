typedef unsigned short u16;

struct S02229a40 {
    u16 f0;        /* +0 */
    u16 b0 : 1;    /* +2 bit0 */
    u16 _r2 : 15;
    u16 _lo6 : 6;  /* +4 bits[5:0] */
    u16 f4mid : 9; /* +4 bits[14:6] */
    u16 _hi1 : 1;
};

extern int func_ov002_021d7268(int a, int b, int c);
extern void func_ov002_021e286c(int a);

int func_ov002_02229a40(struct S02229a40 *self) {
    if (func_ov002_021d7268(self->b0, self->f4mid, 1))
        func_ov002_021e286c(self->b0);
    return 0;
}
