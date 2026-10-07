typedef unsigned char u8;

struct Obj { char pad0[0x3c]; int f3c; char pad40[8]; int f48; u8 f4c[1]; };
struct Pair { int v; int w; };

extern struct Pair data_021a5184[];
extern int func_02095d6c(int a);
extern void func_02094f14(int mask, int lo, int hi);

void func_02088268(struct Obj *o, int base)
{
    int i;
    o->f3c = base;
    for (i = 0; i < o->f48; i++) {
        u8 idx = o->f4c[i];
        int v = func_02095d6c(o->f3c + data_021a5184[idx].w);
        func_02094f14(1 << idx, v & 0xff, v >> 8);
    }
}
