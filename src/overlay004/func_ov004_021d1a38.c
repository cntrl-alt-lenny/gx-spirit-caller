typedef struct { int f0; int f4; short next; short f0a; } Node;
extern Node *func_02005dac(int which, int slot_i);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern unsigned int data_ov004_02200e00[];
struct Four { unsigned int v[4]; };
typedef struct { unsigned int bits; unsigned short attr2; } Obj;
static inline void setPos(Obj *obj, int x, int y) {
    obj->bits = (obj->bits & 0xfe00ff00) | (y & 0xff) | (((unsigned int)x << 23) >> 7);
}
void func_ov004_021d1a38(int x, int y, int width, int height) {
    unsigned int attrs[4];
    Obj obj;
    int i;
    obj.bits = 0x40000000;
    obj.attr2 = 0x1000;
    *(struct Four *)attrs = *(struct Four *)(data_ov004_02200e00 + 12);
    width -= 10; y -= 3; height -= 10; x -= 3;
    for (i=0; i<4; i++) {
        setPos(&obj, x+width*(i&1), y+height*(i>1 ? 1 : 0));
        obj.bits = (obj.bits & 0xc1fffcff) | attrs[i];
        func_020944a4((int)&obj, (int)func_02005dac(2,0), 6);
    }
}

