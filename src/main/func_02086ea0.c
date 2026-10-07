typedef unsigned short u16;
typedef long long s64;

struct Src { char pad[0x18]; int f18; int f1c; char pad20[4]; int f24; int f28; u16 f2c; u16 f2e; };
struct Dst { int f0; int f4; char padc[8]; int f10; int f14; char pad18[0x18]; int f30; int f34; };

void func_02086ea0(struct Dst *d, struct Src *s)
{
    int p, q, nb;
    d->f0 = s->f18;
    d->f14 = s->f1c;
    d->f4 = 0;
    nb = 0 - s->f28;
    p = (int)(((s64)s->f24 * s->f18) >> 12);
    q = (int)(((s64)nb * s->f1c) >> 12);
    d->f30 = s->f2c * (0 - p) * 16;
    d->f34 = (0 - s->f2e) * ((s->f1c + q) - 0x1000) * 16;
    d->f10 = 0;
}
