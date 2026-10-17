typedef unsigned short u16;
typedef long long s64;

int func_0208bfc4(int *a, int *b)
{
    int dy = a[1] - b[1];
    int dx = a[0] - b[0];
    int dz;
    s64 s = (s64)dy * dy;
    s += (s64)dx * dx;
    dz = a[2] - b[2];
    s += (s64)dz * dz;
    *(volatile u16 *)0x040002b0 = 1;
    *(volatile s64 *)0x040002b8 = s << 2;
    while (*(volatile u16 *)0x040002b0 & 0x8000) {
    }
    return (*(volatile int *)0x040002b4 + 1) >> 1;
}
