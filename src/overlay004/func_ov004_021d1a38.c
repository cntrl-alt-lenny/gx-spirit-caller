extern unsigned char data_ov004_02200e00[];
extern void *func_02005dac(int a, int b);
extern void func_020944a4();
typedef struct { unsigned int a, b, c, d; } Four;
typedef struct { unsigned int attr; unsigned short tile; } Sprite;
static inline void setpos(Sprite *obj, int x, int y) {
    obj->attr = (obj->attr & 0xfe00ff00) | (y & 0xff) | ((x & 0x1ff) << 16);
}
void func_ov004_021d1a38(int x, int y, int w, int h) {
    Sprite obj;
    Four values;
    int i, row;
    obj.attr = 0x40000000;
    obj.tile = 0x1000;
    values = *(Four *)(data_ov004_02200e00 + 0x30);
    w -= 10;
    y -= 3;
    h -= 10;
    x -= 3;
    for (i = 0; i < 4; i++) {
        if (i > 1) row = 1; else row = 0;
        setpos(&obj, x + w * (i & 1), y + h * row);
        obj.attr = (obj.attr & 0xc1fffcff) | ((unsigned int *)&values)[i];
        func_020944a4(&obj, func_02005dac(2, 0), 6);
    }
}



