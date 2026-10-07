typedef unsigned char u8;

struct Obj { char pad0[0x2e]; u8 f2e; char pad2f[0xd]; u8 f3c; };

extern void func_02095218(int a, int b);

void func_02087918(struct Obj *o, int v)
{
    if (o == 0) {
        return;
    }
    if (v == o->f2e) {
        return;
    }
    func_02095218(o->f3c, v);
    o->f2e = v;
}
