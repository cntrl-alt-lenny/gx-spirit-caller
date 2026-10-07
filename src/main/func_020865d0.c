typedef unsigned short u16;

struct Src { char pad[0x18]; int f18; int f1c; char pad20[0xc]; u16 f2c; u16 f2e; };
struct Dst { int f0; int f4; char padc[8]; int f10; int f14; char pad18[0x18]; int f30; int f34; };

void func_020865d0(struct Dst *d, struct Src *s)
{
    d->f0 = s->f18;
    d->f14 = s->f1c;
    d->f4 = 0;
    d->f30 = (0x1000 - s->f18) * s->f2c * 8;
    d->f34 = (0x1000 - s->f1c) * s->f2e * 8;
    d->f10 = 0;
}
