typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 d : 1;
    u16 c : 5;
    u16 b : 6;
    u16 a : 4;
    u32 pad4[4];
    u32 g : 9;
    u32 f : 1;
    u32 e : 22;
} Obj;

int func_ov002_02201e38(Obj *p) {
    if (p->b == 0x1d) {
        return p->f == p->d;
    }
    return 0;
}
