typedef signed short s16;
typedef unsigned short u16;
typedef long long s64;
struct Src { char pad[0x18]; int f18; int f1c; s16 f20; s16 f22; int f24; int f28; u16 f2c; u16 f2e; };
struct Dst { int f0; int f4; char padc[8]; int f10; int f14; char pad18[0x18]; int f30; int f34; };
extern void func_0208be38(int a0, int a1);
extern int func_0208bed8(void);
void func_02085c10(struct Dst *d, struct Src *s)
{
    int w = s->f2c << 12;
    int h = s->f2e << 12;

    func_0208be38(h, w);
    int b = (int)(((s64)s->f18 * s->f20) >> 12);
    int a = (int)(((s64)s->f18 * s->f22) >> 12);
    int c = (int)(((s64)s->f1c * s->f20) >> 12);
    int e = (int)(((s64)s->f1c * s->f22) >> 12);
    d->f0 = a;
    d->f14 = e;
    d->f4 = (-c * func_0208bed8()) >> 12;
    func_0208be38(w, h);
    d->f30 = s->f2c * (s->f18 - (b + a)) * 8 - s->f2c * (int)(((s64)s->f18 * s->f24) >> 8);
    d->f34 = s->f2e * (c - e - s->f1c + 0x2000) * 8 + s->f2e * (int)(((s64)s->f1c * s->f28) >> 8);
    d->f10 = (b * func_0208bed8()) >> 12;
}





