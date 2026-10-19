typedef struct { int f0, f4, f8, fc, f10; } SelfT;
extern void func_02006110(int *out_a, int *out_b);
extern void *func_020061ac(void);
extern void *func_02005dac(int, int);
extern void func_020944a4(int, int, int);
int func_ov014_021b4ac4(SelfT *self) {
    int y, bottom, i, tile, top, over, selected, offset;
    unsigned int attr;
    y = self->f10 + ((0xc0 - self->fc) / 2 - 8);
    if (self->f0 == 1) {
        selected = self->f8;
        int xTouch, yTouch;
        top = y + 5;




        func_02006110(&xTouch, &yTouch);
        attr = ((y - 2) & 0xff) | 0xc0004000;
        i = 0;
        offset = 0;

        bottom = top + 0x12;
        for (; i < 2; i++) {
            over = 0;

            int x;
            struct { unsigned int a; unsigned short b; } sprite;
            if (selected != 0) {
                if (xTouch >= 0xa0 && yTouch >= top && xTouch < 0xd0 && yTouch < bottom) over = 1;
                tile = 0x68 - offset;
                if (func_020061ac() != 0 && over != 0) tile = 0x70;
                x = 0x9c;
            } else {
                if (xTouch >= 0x30 && yTouch >= top && xTouch < 0x60 && yTouch < bottom) over = 1;
                tile = 0x68 - offset;
                if (func_020061ac() != 0 && over != 0) tile = 0x70;
                x = 0x2c;
            }
            sprite.a = attr | (((unsigned int)(x - 4) << 23) >> 7);
            sprite.b = tile | 0x1400;
            func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 6);
            selected = 1 - selected;
            offset += 8;
        }
    }
    return 1;
}





