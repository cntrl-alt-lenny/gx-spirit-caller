/* func_0208e45c: zero 2 hardware register ranges (0x04000330 len 0x10,
 * 0x04000360 len 0x60) via the subsystem-aware func_02093dec/
 * func_02093fb8 helpers when data_021023bc is initialized (!=-1), or
 * via plain Fill32 otherwise. Then pulses 0x040004d0 with 32 zero
 * writes (volatile: the target keeps all 32, not just the last). */

extern int data_021023bc;

extern void Fill32(unsigned int value, void *dest, unsigned int count);
extern void func_02093dec(int a, void *dest, unsigned int val, unsigned int count,
                           unsigned int extra1, unsigned int extra2);
extern void func_02093fb8(int a, void *dest, unsigned int val, unsigned int count);

void func_0208e45c(void)
{
    int i;

    if (data_021023bc != -1) {
        func_02093dec(data_021023bc, (void *)0x04000330, 0, 0x10, 0, 0);
        func_02093fb8(data_021023bc, (void *)0x04000360, 0, 0x60);
    } else {
        Fill32(0, (void *)0x04000330, 0x10);
        Fill32(0, (void *)0x04000360, 0x60);
    }

    for (i = 0; i < 0x20; i++)
        *(volatile unsigned int *)0x040004d0 = 0;
}
