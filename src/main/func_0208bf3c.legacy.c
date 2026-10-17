typedef unsigned short u16;
typedef long long s64;

extern int func_0208be70(void);

int func_0208bf3c(int x)
{
    if (x > 0) {
        *(volatile u16 *)0x040002b0 = 1;
        *(volatile s64 *)0x040002b8 = (s64)x << 32;
        return func_0208be70();
    }
    return 0;
}
