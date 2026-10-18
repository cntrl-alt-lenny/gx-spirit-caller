#include <nitro/types.h>
extern char data_ov004_02200e00[];
extern void *func_02005dac(int, int);
extern void func_020944a4();
typedef struct { unsigned int y:8; unsigned int a:8; unsigned int x:9; unsigned int b:7; unsigned short attr; } Sprite;
typedef struct { unsigned int v[4]; } Four;
void func_ov004_021d9ef0(int x, int y, int w, int h) {
    Four table;
    Sprite s;
    int i;
    *(unsigned int *)&s = 0x40000000;
    s.attr = 0x1818;
    table = *(Four *)(data_ov004_02200e00 + 0xb8);
    w -= 10;
    y -= 3;
    h -= 10;
    x -= 3;
    for (i=0; i<4; i++) {
        int row;
        int py, px;
        if (i > 1) row = 1;
        else row = 0;
        py = y + h * row;
        px = x + w * (i & 1);
        *(unsigned int *)&s = ((*(unsigned int *)&s & 0xfe00ff00) | (unsigned char)py | ((px & 0x1ff) << 16)) & 0xc1fffcff | table.v[i];
        func_020944a4(&s, func_02005dac(2,0), 6);
    }
}



