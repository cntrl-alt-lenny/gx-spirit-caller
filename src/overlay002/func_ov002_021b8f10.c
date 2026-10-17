typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned char u8;

typedef struct Obj {
    u16 pad[3];
    u16 kind : 8;
    u16 rest : 8;
} Obj;

extern u32 func_ov002_0223de94(Obj *o, int a);
extern int func_ov002_021b8fcc(u32 a);

int func_ov002_021b8f10(Obj *o) {
    u32 v = func_ov002_0223de94(o, 0);
    u16 t = v;
    u32 lo = v & 0xff;
    int hi = (t >> 8) & 0xff;
    if (o->kind != 1) {
        return 0;
    }
    if (hi >= 5 && hi <= 10) {
        return 1;
    }
    if (hi < 5 && func_ov002_021b8fcc(lo) != 0) {
        return 1;
    }
    return 0;
}
