typedef unsigned short u16;
typedef long long s64;

int func_0208bed8(void)
{
    while (*(volatile u16 *)0x04000280 & 0x8000) {
    }
    return (int)((*(volatile s64 *)0x040002a0 + 0x80000) >> 20);
}
