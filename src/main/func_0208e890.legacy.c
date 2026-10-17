typedef unsigned short u16;
typedef unsigned int u32;
extern void func_0208e700(void);

void func_0208e890(void)
{
    while (*(volatile u32 *)0x04000600 & 0x08000000) {
    }
    *(volatile u32 *)0x04000600 |= 0x8000;
    *(volatile u16 *)0x04000060 |= 0x2000;
    *(volatile u16 *)0x04000060 |= 0x1000;
    func_0208e700();
    *(volatile u32 *)0x040004a4 = 0x1f0080;
    *(volatile u32 *)0x040004a8 = 0;
    *(volatile u32 *)0x040004ac = 0;
}
