typedef unsigned char u8;

struct Obj {
    char pad0[0x20];
    int f20;
    int pad24;
    int f28;
    int f2c;
    void (*f30)(void *a, int n, int *tab, int t, int p, int q);
    int f34;
    int f38;
    char pad3c[0xc];
    int f48;
    u8 f4c[1];
};
struct Pair { int v; int w; };

extern int data_021a5144[];
extern struct Pair data_021a5184[];
extern int func_020b3a7c(int a, int b);

void func_020880bc(struct Obj *o, void *arg)
{
    int t = func_020b3a7c(o->f28, o->f2c);
    int base = t * o->f38;
    int i;
    for (i = 0; i < o->f48; i++) {
        int v = data_021a5184[o->f4c[i]].v; data_021a5144[i] = v + base;
    }
    o->f30(arg, o->f48, data_021a5144, t, o->f20, o->f34);
    o->f38 = o->f38 + 1;
    if (o->f38 >= o->f2c) {
        o->f38 = 0;
    }
}
