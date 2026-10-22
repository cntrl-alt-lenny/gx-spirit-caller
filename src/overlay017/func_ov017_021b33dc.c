typedef struct {
    int f_0;
    int f_4;
    int f_8;
    int f_c;
} Self;
extern int func_02037208(int a0, int r1, int r2, int r3);
extern void func_0208c884(unsigned short *a0, int a1);
extern int func_ov017_021b3ca8(Self *self);

int func_ov017_021b33dc(Self *self) {
    int result = 0;
    switch (self->f_0) {
    case 0:
        self->f_8++;
        func_0208c884((unsigned short *)0x0400006c, self->f_8 - 16);
        func_0208c884((unsigned short *)0x0400106c, self->f_8 - 16);
        if (self->f_8 >= 16) {
            self->f_0 = 1;
            self->f_8 = 0;
        }
        break;
    case 1:
        if (func_ov017_021b3ca8(self) != 0) {
            self->f_8 = 0;
            self->f_0 = 2;
            func_02037208(0x42, -1, 0, 1);
        }
        break;
    case 2:
        self->f_8++;
        func_0208c884((unsigned short *)0x0400006c, -self->f_8);
        func_0208c884((unsigned short *)0x0400106c, -self->f_8);
        if (self->f_8 >= 16) result = 1;
        break;
    }
    return result;
}
