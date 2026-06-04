/* func_ov003_021ca10c: full scene teardown — blank both engines' display mode,
 * release the layout, stop both channel pairs, run the four fixed shutdown calls,
 * drop the 2D engines, clear both BGxCNT blocks and reset both blend regs, mix
 * the page seed into the RNG, and re-register the default vblank handler.
 * Returns 1. (ov003_core.h) */
extern void func_ov003_021cbb78(void *);
extern void func_02005c60(int);
extern void func_02001ba4(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02006918(void);
extern void func_0208c8cc(int, int, int);
extern void func_0208c8b0(int);
extern void func_0208e2f4(int, int, int);
extern void func_020057dc(void (*)(void));
extern void func_0201261c(void);
extern char data_ov003_021cf72c[];
extern char data_021040ac[];
extern char data_ov003_021cf6c0[];
int func_ov003_021ca10c(void) {
    volatile unsigned long *disp = (volatile unsigned long *)0x04000000;
    *disp &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;
    func_ov003_021cbb78(data_ov003_021cf72c);
    func_02005c60(1);
    func_02005c60(2);
    func_02001ba4();
    func_0202c1ac();
    func_0202af40();
    func_02006918();
    func_0208c8cc(1, 0, 1);
    func_0208c8b0(0);
    {
        volatile unsigned long *a = (volatile unsigned long *)0x04000014;
        volatile unsigned long *b = (volatile unsigned long *)0x04001010;
        a[0] = 0;
        a[1] = 0;
        a[2] = 0;
        b[0] = 0;
        b[1] = 0;
        b[2] = 0;
        b[3] = 0;
        func_0208e2f4((int)b - 0xfc0, 0x3f, -0x10);
    }
    func_0208e2f4(0x04001050, 0x3f, -0x10);
    *(int *)(data_021040ac + 0xc48) =
        *(int *)(data_021040ac + 0xc3c) ^ *(int *)(data_ov003_021cf6c0 + 0x4c);
    func_020057dc(func_0201261c);
    return 1;
}
