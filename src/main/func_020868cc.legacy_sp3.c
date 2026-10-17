typedef unsigned short u16;
typedef short s16;
typedef long long s64;
typedef struct Out {
    int f0;
    int f4;
    int pad8[2];
    int f10;
    int f14;
    int pad18[6];
    int f30;
    int f34;
} Out;
typedef struct In {
    char pad0[0x18];
    int f18;
    int f1c;
    s16 a;
    s16 b;
    int f24;
    int f28;
    u16 w;
    u16 h;
} In;

extern void func_0208be38(int a, int b);
extern int func_0208bed8(void);

void func_020868cc(Out *o, In *p)
{
    int x = p->w << 12;
    int y = p->h << 12;
    int t;
    int u;
    int w;
    int h;
    func_0208be38(y, x);
    o->f0 = p->b;
    o->f14 = p->b;
    o->f4 = (p->a * func_0208bed8()) >> 12;
    func_0208be38(x, y);
    w = p->w;
    h = p->h;
    u = p->f28 * h + ((0 - h) << 11);
    t = ((0 - w) << 11) - p->f24 * w;
    o->f30 = (int)(((s64)p->b * t - (s64)p->a * u) >> 8) + (w << 15);
    o->f34 = (int)(((s64)p->a * t + (s64)p->b * u) >> 8) + (p->h << 15);
    o->f10 = ((0 - p->a) * func_0208bed8()) >> 12;
}
