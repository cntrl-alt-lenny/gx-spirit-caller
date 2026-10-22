extern char data_ov004_02200e00[];
extern int func_02005dac(int, int);
extern void func_020944a4(int unused0, int unused1, int unused2);
typedef struct { unsigned int bits; unsigned short attr; } Sprite;
void func_ov004_021d9ef0(int x, int y, int w, int h) {
    Sprite sprite;
    unsigned int flags[4];
    int i;
    sprite.bits = 0x40000000;
    sprite.attr = 0x1818;
    *(struct Four { unsigned int a,b,c,d; } *)flags = *(struct Four *)(data_ov004_02200e00 + 0xb8);
    w -= 10;
    y -= 3;
    h -= 10;
    x -= 3;
    for (i = 0; i < 4; i++) {
        int yy = (y + h * (i > 1 ? 1 : 0)) & 0xff;
        int xx = x + w * (i & 1);
        sprite.bits = (((sprite.bits & 0xfe00ff00) | yy | ((xx & 0x1ff) << 16)) & 0xc1fffcff) | flags[i];
        func_020944a4((int)&sprite, func_02005dac(2, 0), 6);
    }
}



