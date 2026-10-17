typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 a : 1;
    u16 b : 5;
    u16 kind : 6;
    u16 c : 4;
    u32 pad4[4];
    u32 d : 9;
    u32 e : 1;
    u32 f : 22;
} Obj;

int func_ov002_02205dc8(Obj *p) {
    if (p->kind == 0x16) {
        return p->e == 1 - p->a;
    }
    return 0;
}
