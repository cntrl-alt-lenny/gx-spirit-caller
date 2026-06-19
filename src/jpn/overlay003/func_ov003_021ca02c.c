/* func_ov003_021ca02c: full scene teardown — blank both engines' display mode,
 * release the layout, stop both channel pairs, run the four fixed shutdown calls,
 * drop the 2D engines, clear both BGxCNT blocks and reset both blend regs, mix
 * the page seed into the RNG, and re-register the default vblank handler.
 * Returns 1. (ov003_core.h) */
extern void func_ov003_021cba28(void *);
extern void func_02005c44(int);
extern void func_02001b84(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_020068fc(void);
extern void func_0208c7e4(int, int, int);
extern void func_0208c7c8(int);
extern void func_0208e2f4(int, int, int);
extern void func_020057c0(void (*)(void));
extern void func_020125e8(void);
extern char data_ov003_021cf5ec[];
extern char data_02103fcc[];
extern char data_ov003_021cf580[];
int func_ov003_021ca02c(void) {
    volatile unsigned long *disp = (volatile unsigned long *)0x04000000;
    *disp &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;
    func_ov003_021cba28(data_ov003_021cf5ec);
    func_02005c44(1);
    func_02005c44(2);
    func_02001b84();
    func_0202c158();
    func_0202aeec();
    func_020068fc();
    func_0208c7e4(1, 0, 1);
    func_0208c7c8(0);
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
    *(int *)(data_02103fcc + 0xc48) =
        *(int *)(data_02103fcc + 0xc3c) ^ *(int *)(data_ov003_021cf580 + 0x4c);
    func_020057c0(func_020125e8);
    return 1;
}
