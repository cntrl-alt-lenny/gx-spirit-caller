typedef unsigned short u16;
typedef unsigned int u32;
extern void func_02094504(int value, void *dst, unsigned int size);
extern void func_0200592c(void);
extern void func_0208d1e4(int a0);
extern int func_0208cc90(void);
extern void func_0208da2c(int v);
extern void func_0208d8c0(u16 v);
extern void func_0208d4f0(u16 v);
extern void func_0208d3fc(u16 v);
extern void func_0208d138(u16 v);
extern void func_0208d030(int v);
extern void func_0208c8cc(u32 a, u32 b, u32 c);
extern void func_0208c8b0(unsigned int v);
extern void func_0208d7ac(u16 v);
extern void func_0208d6f4(u16 v);
extern void func_0208d0bc(u16 v);
extern void func_0208cfa4(int v);
extern void func_0208c940(void);
extern int func_02021064(void);
extern int func_02021190(int idx, int b);
extern int func_020211b4(int idx, int b);
extern void func_0200ad0c(int id);
extern int func_0200f854(int a, int b, int c, int d, int e);
extern void func_020057c8(int a, int b);
extern int data_02103da0;
extern int data_020c3e48;
extern int data_ov021_021ace80[];

int func_ov021_021aa5cc(int mode)
{
    func_02094504(0xc0, (void *)0x07000000, 0x400);
    func_02094504(0xc0, (void *)0x07000400, 0x400);
    func_02094504(0, (void *)0x05000000, 0x400);
    func_02094504(0, (void *)0x05000400, 0x400);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0, (void *)0x06800000, 0xa4000);
    func_0208cc90();
    if (mode != 0) {
        func_0208da2c(0x60);
        func_0208d8c0(2);
        func_0208d4f0(9);
        func_0208d3fc(0x10);
        func_0208d138(4);
        func_0208d030(0x80);
        func_0208c8cc(1, 0, 1);
        func_0208c8b0(0);
    } else {
        func_0208da2c(1);
        func_0208d8c0(2);
        func_0208d7ac(0x20);
        func_0208d6f4(0x40);
        func_0208d138(4);
        func_0208d0bc(8);
        func_0208d030(0x80);
        func_0208cfa4(0x100);
        func_0208c8cc(1, 0, 0);
        func_0208c8b0(0);
    }
    *(u16 *)0x04000304 &= ~0x8000;
    *(u32 *)0x04000000 &= ~0x1f00;
    func_0208c940();
    *(volatile u32 *)0x04001000 &= ~0x1f00;
    *(volatile u32 *)0x04001000 |= 0x10000;
    data_02103da0 = 1;
    data_020c3e48 = 0;
    func_02021064();
    func_02021190(0, 1);
    func_02021190(1, mode == 0 ? 1 : 0);
    func_020211b4(3, 0x20);
    if (mode != 0) {
        func_0200ad0c(0x20);
        func_0200f854(9, 0x10, 0x18000, 0, 0x3000);
    }
    func_020057c8(0x14, 1);
    data_ov021_021ace80[2] = mode;
    return 1;
}

