typedef struct { int f0, f4, f8, fc, f10, f14; } SelfT;
extern unsigned short data_02104bac[];
extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_0200617c(void);
extern int func_02037208(int a0, int r1, int r2, int r3);
int func_ov014_021b484c(SelfT *self) {
    int top = (0xc0 - self->fc) / 2 - 8;
    int distance = self->fc + (0xc0 - self->fc) / 2 - 8;
    unsigned short keys = data_02104bac[0x2a];
    int x, y, hitTop;
    switch (self->f0) {
    case 0:
        self->f14++;
        *(int *)0x04001010 = ((self->fc - distance * self->f14 / 8) << 16) & 0x01ff0000;
        *(int *)0x04001014 = ((self->fc - distance * self->f14 / 8) << 16) & 0x01ff0000;
        if (self->f14 >= 8) self->f0 = 1;
        break;
    case 1:
        if (keys != 0) {
            if (keys & 1) {
                func_02037208(0x3a, -1, 0, 1);
                self->f0 = 2;
            } else if (keys & 2) {
                func_02037208(0x43, -1, 0, 1);
                self->f8 = 1;
                self->f0 = 2;
            } else if (keys & 0x30) {
                func_02037208(0x38, -1, 0, 1);
                self->f8 = 1 - self->f8;
            }
        } else {
            hitTop = self->f10 + top + 5;
            func_02006110(&x, &y);
            if (x >= 0x30 && y >= hitTop && x < 0x60 && y < hitTop + 0x12) {
                self->f4 = 1;
                self->f8 = 0;
            } else if (x >= 0xa0 && y >= hitTop && x < 0xd0 && y < hitTop + 0x12) {
                self->f4 = 1;
                self->f8 = 1;
            } else self->f4 = 0;
            if (func_0200617c() != 0 && self->f4 != 0) {
                func_02037208(0x3a, -1, 0, 1);
                self->f0 = 2;
            }
        }
        break;
    case 2:
        self->f14--;
        *(int *)0x04001010 = ((self->fc - distance * self->f14 / 8) << 16) & 0x01ff0000;
        *(int *)0x04001014 = ((self->fc - distance * self->f14 / 8) << 16) & 0x01ff0000;
        if (self->f14 <= 0) return 1;
        break;
    }
    return 0;
}
