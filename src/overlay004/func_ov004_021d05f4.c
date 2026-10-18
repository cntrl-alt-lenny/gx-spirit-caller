#include <nitro/types.h>
extern char data_ov004_0220b500[];
extern void func_0208e2f4(volatile u16 *ptr, fx32 a, fx32 brightness);
void func_ov004_021d05f4(int enable) {
    char *base = data_ov004_0220b500;
    if (enable) {
        *(volatile u16 *)0x04001048 = (*(volatile u16 *)0x04001048 & ~0x3f) | 0x3f;
        *(volatile u16 *)0x0400104a = (*(volatile u16 *)0x0400104a & ~0x3f) | 0x1f;
        if (*(int *)(base + 0x3c84) == 0) {
            *(volatile u16 *)0x04001040 = 0x1ff;
            *(volatile u16 *)0x04001044 = 0x64c0;
        } else {
            *(volatile u16 *)0x04001040 = 0x1ff;
            *(volatile u16 *)0x04001044 = 0x4c;
        }
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0xe000) | 0x2000;
        func_0208e2f4((volatile u16 *)0x04001050, 6, -8);
    } else {
        *(volatile u32 *)0x04001000 &= ~0xe000;
        *(volatile u16 *)0x04001050 = 0;
    }
}

