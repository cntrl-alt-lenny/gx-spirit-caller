typedef unsigned char u8;
typedef unsigned short u16;

struct Obj { char pad0[0x1c]; char sub[0x11]; u8 f2d; u8 f2e; u8 f2f; char pad30[4]; u16 f34; char pad36[8]; u16 f3e; u8 f40; u8 f41; };

extern void func_0208b0d0(void *p);
extern void func_0208b0a4(void *p, int a, int b);

void func_0208787c(struct Obj *o)
{
    o->f2e = 0;
    o->f2d = 0;
    o->f2f = 0;
    o->f34 = 0;
    o->f3e = 0;
    o->f40 = 0x7f;
    o->f41 = 0x7f;
    func_0208b0d0(o->sub);
    func_0208b0a4(o->sub, 0x7f00, 1);
}
