typedef unsigned short u16;
extern void func_0208cb88(void);
extern int func_02090868(void);
extern void func_02093bfc(void);
extern void func_020940ac(int channel, void *dst, int value, unsigned int size);
/* The assembly-only definition has no C parameters; its ABI takes three. */
extern void Fill32();
extern u16 data_021a62fc;
extern int data_0210249c;

void func_0208ca04(void)
{
    int result;
    *(volatile u16 *)0x04000304 |= 0x8000;
    *(volatile u16 *)0x04000304 = (*(volatile u16 *)0x04000304 & 0xfffffdf1) | 0x20e;
    *(volatile u16 *)0x04000304 |= 1;
    func_0208cb88();
    while (data_021a62fc == 0) {
        result = func_02090868();
        if (result == -3) func_02093bfc();
        data_021a62fc = result;
    }
    *(volatile u16 *)0x04000004 = 0;
    *(volatile unsigned int *)0x04000000 = 0;
    if (data_0210249c != -1) {
        func_020940ac(data_0210249c, (void *)0x04000008, 0, 0x60);
        *(volatile u16 *)0x0400006c = 0;
        func_020940ac(data_0210249c, (void *)0x04001000, 0, 0x70);
    } else {
        Fill32(0, (void *)0x04000008, 0x60);
        *(volatile u16 *)0x0400006c = 0;
        Fill32(0, (void *)0x04001000, 0x70);
    }
    *(volatile u16 *)0x04000020 = 0x100;
    *(volatile u16 *)0x04000026 = 0x100;
    *(volatile u16 *)0x04000030 = 0x100;
    *(volatile u16 *)0x04000036 = 0x100;
    *(volatile u16 *)0x04001020 = 0x100;
    *(volatile u16 *)0x04001026 = 0x100;
    *(volatile u16 *)0x04001030 = 0x100;
    *(volatile u16 *)0x04001036 = 0x100;
}
