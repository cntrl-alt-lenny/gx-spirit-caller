typedef signed short s16;
typedef unsigned short u16;

struct Src { char pad[0x20]; s16 f20; s16 f22; int f24; int f28; u16 f2c; u16 f2e; };
struct Dst { int f0; int f4; char padc[8]; int f10; int f14; char pad18[0x18]; int f30; int f34; };

extern void func_0208be38(int a, int b);
extern int func_0208bed8(void);

void func_02085b38(struct Dst *d, struct Src *s)
{
    int w = s->f2c << 12;
    int h = s->f2e << 12;
    func_0208be38(h, w);
    d->f0 = s->f22;
    d->f14 = s->f22;
    d->f4 = ((0 - s->f20) * func_0208bed8()) >> 12;
    func_0208be38(w, h);
    int t = s->f20 + s->f22;
    t = -t;
    d->f30 = s->f2c * (t + 0x1000) * 8 - s->f24 * s->f2c * 16;
    d->f34 = s->f2e * ((s->f20 - s->f22) + 0x1000) * 8 + s->f28 * s->f2e * 16;
    d->f10 = (s->f20 * func_0208bed8()) >> 12;
}
