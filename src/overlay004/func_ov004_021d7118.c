typedef struct { int f0; int f4; short next; short f0a; } Node;
extern Node *func_02005dac(int which, int slot_i);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern unsigned char data_ov004_02200e00[];
typedef struct { unsigned int v[4]; } Corners;
typedef struct { unsigned int attr; unsigned short tile; } Sprite;
void func_ov004_021d7118(int x, int y, int width, int height) {
    Sprite sprite;
    Corners corners;
    int i, side, px, py;
    sprite.attr = 0x40000000;
    sprite.tile = 0x1818;
    corners = *(Corners *)(data_ov004_02200e00 + 0xa4);
    width -= 10;
    y -= 3;
    height -= 10;
    x -= 3;
    for (i = 0; i < 4; i++) {
        side = i > 1 ? 1 : 0;
        py = (y + height * side) & 0xff;
        px = x + width * (i & 1);
        sprite.attr = (((sprite.attr & 0xfe00ff00) | py | (((unsigned int)px << 23) >> 7)) & 0xc1fffcff) | corners.v[i];
        func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 6);
    }
}




