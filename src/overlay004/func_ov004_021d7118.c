typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 a,b,c,d; } Quad;
typedef struct { u32 bits; u16 attr; } Obj;
extern unsigned char data_ov004_02200e00[];
extern void *func_02005dac(int, int);
extern void func_020944a4();
static inline void setpos(Obj *obj, int x, int y) {
    obj->bits = (obj->bits & 0xfe00ff00) | (y & 0xff) | ((x & 0x1ff) << 16);
}
void func_ov004_021d7118(int x, int y, int w, int h) {
    u32 flags[4];
    Obj obj;
    int i;
    obj.bits = 0x40000000;
    obj.attr = 0x1818;
    *(Quad *)flags = *(Quad *)(data_ov004_02200e00 + 0xa4);
    for (i = 0; i < 4; i++) {
        setpos(&obj, x - 3 + (w - 10) * (i & 1), y - 3 + (h - 10) * (i > 1 ? 1 : 0));
        obj.bits = (obj.bits & 0xc1fffcff) | flags[i];
        func_020944a4(&obj, func_02005dac(2, 0), 6);
    }
}
