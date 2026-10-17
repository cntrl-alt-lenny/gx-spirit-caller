typedef unsigned short u16;
typedef long long s64;

int func_0208c2e0(int *v)
{
    s64 s = (s64)v[0] * v[0];
    s += (s64)v[1] * v[1];
    s += (s64)v[2] * v[2];
    *(volatile u16 *)0x040002b0 = 1;
    *(volatile s64 *)0x040002b8 = s << 2;
    while (*(volatile u16 *)0x040002b0 & 0x8000) {
    }
    return (*(volatile int *)0x040002b4 + 1) >> 1;
}
