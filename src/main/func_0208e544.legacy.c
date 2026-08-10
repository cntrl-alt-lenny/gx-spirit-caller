/* func_0208e544: zero 2 hardware register ranges (0x04000330 len 0x10,
 * 0x04000360 len 0x60) via the subsystem-aware func_02093ee0/
 * func_020940ac helpers when data_0210249c is initialized (!=-1), or
 * via plain Fill32 otherwise. Then pulses 0x040004d0 with 32 zero
 * writes (volatile: the target keeps all 32, not just the last). */

extern int data_0210249c;

extern void Fill32(unsigned int value, void *dest, unsigned int count);
extern void func_02093ee0(int a, void *dest, unsigned int val, unsigned int count,
                           unsigned int extra1, unsigned int extra2);
extern void func_020940ac(int a, void *dest, unsigned int val, unsigned int count);

void func_0208e544(void)
{
    int i;

    if (data_0210249c != -1) {
        func_02093ee0(data_0210249c, (void *)0x04000330, 0, 0x10, 0, 0);
        func_020940ac(data_0210249c, (void *)0x04000360, 0, 0x60);
    } else {
        Fill32(0, (void *)0x04000330, 0x10);
        Fill32(0, (void *)0x04000360, 0x60);
    }

    for (i = 0; i < 0x20; i++)
        *(volatile unsigned int *)0x040004d0 = 0;
}
