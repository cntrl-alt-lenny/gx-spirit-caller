typedef unsigned short u16;

struct Src { char pad[0x24]; int f24; int f28; u16 f2c; u16 f2e; };
struct Dst { int f0; int f4; char padc[8]; int f10; int f14; char pad18[0x18]; int f30; int f34; };

void func_02085a74(struct Dst *d, struct Src *s)
{
    d->f0 = 0x1000;
    d->f14 = 0x1000;
    d->f4 = 0;
    d->f30 = (0 - s->f24 * s->f2c) * 16;
    d->f34 = s->f28 * s->f2e * 16;
    d->f10 = 0;
}
