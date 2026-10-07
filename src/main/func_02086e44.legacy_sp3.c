typedef unsigned short u16;

struct Src { char pad[0x24]; int f24; int f28; u16 f2c; u16 f2e; };
struct Dst { int f0; int f4; char padc[8]; int f10; int f14; char pad18[0x18]; int f30; int f34; };

void func_02086e44(struct Dst *d, struct Src *s)
{
    int a, b;
    u16 w, h;
    d->f0 = 0x1000;
    d->f14 = 0x1000;
    d->f4 = 0;
    a = s->f24;
    w = s->f2c;
    b = s->f28;
    d->f30 = w * (0 - a) * 16;
    h = s->f2e; b = -b;
    d->f34 = (0 - h) * b * 16;
    d->f10 = 0;
}
