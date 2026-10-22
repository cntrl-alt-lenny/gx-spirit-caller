typedef unsigned int u32;
typedef struct { u32 v[4]; } Four;
typedef union { u32 bits; struct { u32 y:8; u32 p:8; u32 x:9; u32 q:7; } b; } Attr;
typedef struct { Attr a; unsigned short tile; } Obj;
extern unsigned char data_ov004_02200e00[];
extern void *func_02005dac(int, int);
extern void func_020944a4(int, int, int);
void func_ov004_021d1a38(int x, int y, int w, int h) {
    Obj obj;
    Four table;
    int i;
    obj.a.bits = 0x40000000;
    obj.tile = 0x1000;
    table = *(Four *)(data_ov004_02200e00 + 0x30);
    w -= 10;
    y -= 3;
    h -= 10;
    x -= 3;
    for (i=0;i<4;i++) {
        int bottom = i > 1 ? 1 : 0;
        int xx = x + w * (i & 1);
        int yy = y + h * bottom;
        obj.a.bits = (obj.a.bits & 0xfe00ff00) | (unsigned char)yy | ((u32)(xx << 23) >> 7);
        obj.a.bits = (obj.a.bits & 0xc1fffcff) | table.v[i];
        func_020944a4((int)&obj, (int)func_02005dac(2,0),6);
    }
}



