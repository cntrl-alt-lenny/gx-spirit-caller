/* func_ov021_021aacdc: arm the display-capture path — program the capture
 * control reg (mode + size), set the capture offset from -(o+0x50), bind the
 * capture VRAM bank, load the border tiles/palette, and register the window
 * surface. Returns 1. (ov021_core.h) */
extern int  func_0208deac(void);
extern void func_02094410(int, int, int);
extern void func_0208fe9c(void *, int, int);
extern void func_02001cec(void *, int, int);
extern void func_02001d48(int);
extern void func_02001e74(void *, int, int, int);
extern char data_020b4634[];
int func_ov021_021aacdc(void *o) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400100e;
    *reg &= ~3;
    *reg = (*reg & 0x43) | 0x204 | 0x400;
    *(volatile unsigned long *)((char *)reg + 0xe) =
        (0x1ff0000 & (-*(int *)((char *)o + 0x50) << 16)) | 0x1f8;
    {
        int h = func_0208deac();
        func_02094410(0, h, 0x800);
    }
    func_0208fe9c(data_020b4634, 0x20, 0x20);
    func_02001cec((char *)o + 0x4, 0x1e, 0x20);
    func_02001d48(0);
    {
        int h2 = func_0208deac();
        func_02001e74((char *)o + 0x4, h2, 2, 1);
    }
    return 1;
}
