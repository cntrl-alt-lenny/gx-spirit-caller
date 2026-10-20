typedef unsigned short u16;
typedef unsigned int u32;
extern void func_0208e85c(void);
extern void func_0208e7ac(void);
extern void func_0208e544(void);
void func_0208e918(void)
{
    func_0208e85c();
    *(volatile u32 *)0x04000504 = 0;
    while (*(volatile u32 *)0x04000600 & 0x08000000) {}
    *(volatile u16 *)0x04000060 = 0;
    *(volatile u32 *)0x04000600 = 0;
    *(volatile u32 *)0x04000010 = 0;
    *(volatile u16 *)0x04000060 |= 0x2000;
    *(volatile u16 *)0x04000060 |= 0x1000;
    *(volatile u16 *)0x04000060 &= 0xffffcffd;
    *(volatile u16 *)0x04000060 = (*(volatile u16 *)0x04000060 & ~0x3000) | 0x10;
    *(volatile u16 *)0x04000060 &= 0xcffb;
    *(volatile u32 *)0x04000600 |= 0x8000;
    *(volatile u32 *)0x04000600 = (*(volatile u32 *)0x04000600 & ~0xc0000000) | 0x80000000;
    func_0208e7ac();
    *(volatile u32 *)0x04000350 = 0;
    *(volatile u16 *)0x04000354 = 0x7fff;
    *(volatile u16 *)0x04000356 = 0;
    *(volatile u32 *)0x04000358 = 0;
    *(volatile u16 *)0x0400035c = 0;
    *(volatile u16 *)0x04000008 &= ~3;
    func_0208e544();
    *(volatile u32 *)0x040004a4 = 0x1f0080;
    *(volatile u32 *)0x040004a8 = 0;
    *(volatile u32 *)0x040004ac = 0;
}

