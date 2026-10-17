typedef unsigned short u16;
typedef unsigned int u32;
extern int func_0208be70(int a);

int func_0208bf3c(int a)
{
    volatile u32 *p;
    if (a <= 0) {
        return 0;
    }
    *(volatile u16 *)0x040002b0 = 1;
    p = (volatile u32 *)0x040002b8;
    p[0] = 0;
    p[1] = a;
    return func_0208be70(a);
}
