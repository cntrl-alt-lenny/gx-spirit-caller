typedef unsigned short u16;
typedef long long s64;

void func_0208c1a0(int *v, int *out)
{
    s64 s = (s64)v[0] * v[0];
    s += (s64)v[1] * v[1];
    s += (s64)v[2] * v[2];
    s64 scale;
    int root;
    *(volatile u16 *)0x04000280 = 2;
    *(volatile s64 *)0x04000290 = 0x100000000000000LL;
    *(volatile s64 *)0x04000298 = s;
    *(volatile u16 *)0x040002b0 = 1;
    *(volatile s64 *)0x040002b8 = s << 2;
    while (*(volatile u16 *)0x040002b0 & 0x8000) {}
    root = *(volatile int *)0x040002b4;
    while (*(volatile u16 *)0x04000280 & 0x8000) {}
    scale = *(volatile s64 *)0x040002a0 * root;
    out[0] = (scale * v[0] + 0x100000000000LL) >> 45;
    out[1] = (scale * v[1] + 0x100000000000LL) >> 45;
    out[2] = (scale * v[2] + 0x100000000000LL) >> 45;
}



