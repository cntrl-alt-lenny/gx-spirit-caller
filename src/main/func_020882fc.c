struct Obj { char pad0[8]; char sub8[0xc]; char sub14[0x10]; int f24; char pad28[0x18]; int f40; int f44; };

extern void func_020950a0(int a, int b, int c, int d);
extern void func_0209a83c(void *p);
extern void func_0209a824(void *p);

int func_020882fc(struct Obj *o)
{
    int t;
    func_020950a0(o->f44, 0, 1 << o->f40, 0);
    t = (o->f24 << 30) >> 31;
    if (t != 0) {
        return t;
    }
    func_0209a83c(o->sub8);
    func_0209a824(o->sub14);
    t = o->f24 | 2;
    o->f24 = t;
    return t;
}
