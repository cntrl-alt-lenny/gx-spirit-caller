typedef struct { char pad[0x1c]; int f1c; } Inner;
typedef struct {
    char pad0[4];
    Inner *p;
    char pad8[0x24];
    char f2c;
    char pad2d[2];
    char f2f;
    int f30;
    char pad34[8];
    unsigned char f3c;
} Obj;
extern void func_02095270(int a);
extern void func_020950d4(int a, int b, int c);
extern void func_0208787c(Obj *o);
extern int func_020955a8(void);

void func_020879a4(Obj *o)
{
    Inner *p = o->p;
    func_02095270(o->f3c);
    if (p->f1c != 0) {
        func_020950d4(o->f3c, 0xffff, p->f1c);
    }
    func_0208787c(o);
    o->f30 = func_020955a8();
    o->f2f = 1;
    o->f2c = 1;
}
