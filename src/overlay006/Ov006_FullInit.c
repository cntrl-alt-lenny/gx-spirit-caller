/* Ov006_FullInit: per-state "full init" — bind the four VRAM banks, reset
 * the engines, then configure the 2D engines one of two ways per the arg, blank
 * the main display mode, switch the sub engine into its display mode, prime the
 * two render flags, and arm the frame/HBlank IRQs; finally stash the arg in the
 * state struct's +8 word. Returns 1. 0x220 "full init" family — 7 members
 * differing ONLY in the trailing per-state struct pointer (ov006_core.h). */
extern void func_02094504(int, int, int);
extern void func_0200592c(void);
extern void func_0208d1e4(int);
extern void func_0208cc90(void);
extern void func_0208da2c(int);
extern void func_0208d4f0(int);
extern void func_0208d3fc(int);
extern void func_0208d138(int);
extern void func_0208d0bc(int);
extern void func_0208d030(int);
extern void func_0208cfa4(int);
extern void func_0208c8cc(int, int, int);
extern void func_0208c8b0(int);
extern void func_0208d8c0(int);
extern void func_0208d7ac(int);
extern void func_0208d6f4(int);
extern void func_0208c940(void);
extern void func_02021064(void);
extern void func_02021190(int, int);
extern void func_020211b4(int, int);
extern void func_0200ad0c(int);
extern void func_0200f854(int, int, int, int, int);
extern void func_020057c8(int, int);
extern int  data_02103da0[];
extern int  data_020c3e48[];
extern int  data_ov006_0224f2e8[];

int Ov006_FullInit(int a) {
    func_02094504(0xc0, 0x7000000, 0x400);
    func_02094504(0xc0, 0x7000400, 0x400);
    func_02094504(0, 0x5000000, 0x400);
    func_02094504(0, 0x5000400, 0x400);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0, 0x6800000, 0xa4000);
    func_0208cc90();
    if (a != 0) {
        func_0208da2c(0x60);
        func_0208d4f0(3);
        func_0208d3fc(0x10);
        func_0208d138(4);
        func_0208d0bc(8);
        func_0208d030(0x80);
        func_0208cfa4(0x100);
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
    *(volatile unsigned short *)0x04000304 |= 0x8000;
    *(volatile unsigned long *)0x04000000 &= ~0x1f00;
    func_0208c940();
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 |= 0x10000;
    data_02103da0[0] = 1;
    data_020c3e48[0] = 0;
    func_02021064();
    func_02021190(0, 1);
    func_02021190(1, a == 0 ? 1 : 0);
    func_020211b4(3, 8);
    func_020211b4(5, 0xa8);
    if (a != 0) {
        func_0200ad0c(8);
        func_0200f854(3, 0x10, 0x18000, 0, 0x3000);
    }
    func_020057c8(0x14, 1);
    data_ov006_0224f2e8[2] = a;
    return 1;
}
