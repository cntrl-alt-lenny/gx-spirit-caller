typedef struct { int f0, f4; short next, f0a; } Node;
typedef struct { unsigned int a,b,c,d; } Four;
typedef struct { unsigned int attr; unsigned short tile; } Sprite;
extern Node *func_02005dac(int which, int slot_i);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern unsigned char data_ov004_02200e00[];
void func_ov004_021d9ef0(int x, int y, int width, int height) {
    Sprite sprite;
    unsigned int values[4];
    int i;
    sprite.attr = 0x40000000;
    sprite.tile = 0x1818;
    *(Four *)values = *(Four *)(data_ov004_02200e00 + 0xb8);
    for (i=0; i<4; i++) {
        int row = i > 1 ? 1 : 0;
        int xx = x - 3 + (width - 10) * (i & 1);
        int yy = y - 3 + (height - 10) * row;
        sprite.attr = (sprite.attr & 0xfe00ff00) | (yy & 0xff) | ((unsigned int)xx << 23 >> 7);
        sprite.attr = values[i] | (sprite.attr & 0xc1fffcff);
        func_020944a4((int)&sprite, (int)func_02005dac(2,0), 6);
    }
}


