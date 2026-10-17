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

void func_02086d70(Out *o, In *p)
{
    int x = p->w << 12;
    int y = p->h << 12;
    int a;
    int b;
    int c;
    int d;
    int r4;
    int r6;
    func_0208be38(y, x);
    b = p->b;
    c = p->f18;
    a = p->a;
    d = p->f1c;
    o->f0 = (int)(((s64)c * b) >> 12);
    r4 = (int)(((s64)d * b) >> 12);
    r6 = (int)(((s64)c * a) >> 12);
    o->f14 = r4;
    o->f4 = ((int)(((s64)d * a) >> 12) * func_0208bed8()) >> 12;
    func_0208be38(x, y);
    o->f30 = p->w * r6 * 16;
    o->f34 = (0 - p->h) * (r4 - 0x1000) * 16;
    o->f10 = ((0 - r6) * func_0208bed8()) >> 12;
}
