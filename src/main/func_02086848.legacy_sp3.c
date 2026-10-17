typedef unsigned short u16;
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
    char pad20[4];
    int f24;
    int f28;
    u16 w;
    u16 h;
} In;

void func_02086848(Out *o, In *p)
{
    int t;
    int u;
    u16 w;
    u16 h;
    o->f0 = p->f18;
    o->f14 = p->f1c;
    o->f4 = 0;
    w = p->w;
    h = p->h;
    t = ((0 - w) << 11) - p->f24 * w;
    u = p->f28 * h + ((0 - h) << 11);
    o->f30 = (int)(((s64)p->f18 * t) >> 8) + (w << 15);
    o->f34 = (int)(((s64)p->f1c * u) >> 8) + (p->h << 15);
    o->f10 = 0;
}
