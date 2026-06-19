/* func_ov006_021b4fb0: per-state "full init" — bind the four VRAM banks, reset
 * the engines, then configure the 2D engines one of two ways per the arg, blank
 * the main display mode, switch the sub engine into its display mode, prime the
 * two render flags, and arm the frame/HBlank IRQs; finally stash the arg in the
 * state struct's +8 word. Returns 1. 0x220 "full init" family — 7 members
 * differing ONLY in the trailing per-state struct pointer (ov006_core.h). */
extern void func_02094410(int, int, int);
extern void func_02005910(void);
extern void func_0208d0fc(int);
extern void func_0208cba8(void);
extern void func_0208d944(int);
extern void func_0208d408(int);
extern void func_0208d314(int);
extern void func_0208d050(int);
extern void func_0208cfd4(int);
extern void func_0208cf48(int);
extern void func_0208cebc(int);
extern void func_0208c7e4(int, int, int);
extern void func_0208c7c8(int);
extern void func_0208d7d8(int);
extern void func_0208d6c4(int);
extern void func_0208d60c(int);
extern void func_0208c858(void);
extern void func_02021010(void);
extern void func_0202113c(int, int);
extern void func_02021160(int, int);
extern void func_0200acf0(int);
extern void func_0200f838(int, int, int, int, int);
extern void func_020057ac(int, int);
extern int  data_02103cc0[];
extern int  data_020c3d68[];
extern int  data_ov006_0224f210[];

int func_ov006_021b4fb0(int a) {
    func_02094410(0xc0, 0x7000000, 0x400);
    func_02094410(0xc0, 0x7000400, 0x400);
    func_02094410(0, 0x5000000, 0x400);
    func_02094410(0, 0x5000400, 0x400);
    func_02005910();
    func_0208d0fc(0x1ff);
    func_02094410(0, 0x6800000, 0xa4000);
    func_0208cba8();
    if (a != 0) {
        func_0208d944(0x60);
        func_0208d408(3);
        func_0208d314(0x10);
        func_0208d050(4);
        func_0208cfd4(8);
        func_0208cf48(0x80);
        func_0208cebc(0x100);
        func_0208c7e4(1, 0, 1);
        func_0208c7c8(0);
    } else {
        func_0208d944(1);
        func_0208d7d8(2);
        func_0208d6c4(0x20);
        func_0208d60c(0x40);
        func_0208d050(4);
        func_0208cfd4(8);
        func_0208cf48(0x80);
        func_0208cebc(0x100);
        func_0208c7e4(1, 0, 0);
        func_0208c7c8(0);
    }
    *(volatile unsigned short *)0x04000304 |= 0x8000;
    *(volatile unsigned long *)0x04000000 &= ~0x1f00;
    func_0208c858();
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 |= 0x10000;
    data_02103cc0[0] = 1;
    data_020c3d68[0] = 0;
    func_02021010();
    func_0202113c(0, 1);
    func_0202113c(1, a == 0 ? 1 : 0);
    func_02021160(3, 8);
    func_02021160(5, 0xa8);
    if (a != 0) {
        func_0200acf0(8);
        func_0200f838(3, 0x10, 0x18000, 0, 0x3000);
    }
    func_020057ac(0x14, 1);
    data_ov006_0224f210[2] = a;
    return 1;
}
