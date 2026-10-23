typedef struct { int f0; int f4; short next; short f0a; } Node;
extern Node *func_02005dac(int which, int slot_i);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern unsigned char data_ov004_02200e00[];
typedef struct { unsigned int v[4]; } Four;
typedef union {
    unsigned int raw;
    struct { unsigned int y:8; unsigned int a:8; unsigned int x:9; unsigned int b:7; } bits;
} Attr;
void func_ov004_021d1a38(int x, int y, int width, int height) {
    struct { Attr attr; unsigned short tile; } obj;
    Four flags;
    int i;
    obj.attr.raw = 0x40000000;
    obj.tile = 0x1000;
    flags = *(Four *)(data_ov004_02200e00 + 0x30);
    width -= 10;
    y -= 3;
    height -= 10;
    x -= 3;
    for (i = 0; i < 4; i++) {
        obj.attr.raw = (((x + width * (i & 1)) & 0x1ff) << 16) | ((obj.attr.raw & 0xfe00ff00) | ((y + height * (i > 1 ? 1 : 0)) & 0xff));
        obj.attr.raw = flags.v[i] | (obj.attr.raw & 0xc1fffcff);
        func_020944a4((int)&obj, (int)func_02005dac(2, 0), 6);
    }
}




