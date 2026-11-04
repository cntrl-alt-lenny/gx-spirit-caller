typedef signed short s16;
typedef unsigned short u16;
typedef long long s64;

struct Src { char pad[0x18]; int f18; int f1c; s16 f20; s16 f22; int f24; int f28; u16 f2c; u16 f2e; };
struct Dst { int f0; int f4; char padc[8]; int f10; int f14; char pad18[0x18]; int f30; int f34; };

extern void func_0208be38(int a0, int a1);
extern int func_0208bed8(void);

void func_02086d70(struct Dst *d, struct Src *s)
{
    int w = s->f2c << 12;
    int h = s->f2e << 12;
    int a, b, c, sn;
    int ac, asn, bc, bsn;
    func_0208be38(h, w);
    c = s->f22;
    a = s->f18;
    sn = s->f20;
    b = s->f1c;
    ac = (int)(((s64)a * c) >> 12);
    asn = (int)(((s64)a * sn) >> 12);
    bc = (int)(((s64)b * c) >> 12);
    bsn = (int)(((s64)b * sn) >> 12);
    d->f0 = ac;
    d->f14 = bc;
    d->f4 = (bsn * func_0208bed8()) >> 12;
    func_0208be38(w, h);
    d->f30 = s->f2c * asn * 16;
    d->f34 = (0 - s->f2e) * (bc - 0x1000) * 16;
    d->f10 = ((0 - asn) * func_0208bed8()) >> 12;
}



