typedef unsigned short u16;
typedef long long s64;

int func_0208bfc4(int *a, int *b)
{
    s64 s = (s64)(a[0] - b[0]) * (a[0] - b[0]);
    s += (s64)(a[1] - b[1]) * (a[1] - b[1]);
    s += (s64)(a[2] - b[2]) * (a[2] - b[2]);
    *(volatile u16 *)0x040002b0 = 1;
    *(volatile s64 *)0x040002b8 = s << 2;
    while (*(volatile u16 *)0x040002b0 & 0x8000) {
    }
    return (*(volatile int *)0x040002b4 + 1) >> 1;
}
