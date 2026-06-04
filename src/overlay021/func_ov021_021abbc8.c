/* func_ov021_021abbc8: arm the MAIN-engine display-capture path and load the two
 * border layers — program the capture control reg, clear its offset, bind the
 * capture bank, then for each of the two layers set the screen base, route the
 * active channel, and register the surface (tile bases 0x580 / 0x45). Returns 1.
 * Main-engine sibling of the sub-engine capture-arm 021aadbc. (ov021_core.h) */
extern int  func_0208e014(void);
extern void func_02094504(int, int, int);
extern void func_0208ffec(void *, int, int);
extern void func_02001d0c(void *, int, int);
extern void func_02001d68(int);
extern void func_02001e94(void *, int, int, int);
extern char data_020b4728[];
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
int func_ov021_021abbc8(void *o) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400000e;
    *reg &= ~3;
    *reg = (*reg & 0x43) | 0x204 | 0x400;
    *(volatile unsigned long *)((char *)reg + 0xe) = 0;
    {
        int h = func_0208e014();
        func_02094504(0, h, 0x800);
    }
    func_0208ffec(data_020b4728, 0x20, 0x20);
    func_02001d0c((char *)o + 0x4, 0x20, 2);
    func_02001d68(data_02104f4c.chan);
    func_02001e94((char *)o + 0x4, func_0208e014() + 0x580, 5, 1);
    func_02001d0c((char *)o + 0x4, 0x20, 3);
    func_02001d68(data_02104f4c.chan);
    func_02001e94((char *)o + 0x4, func_0208e014(), 0x45, 1);
    return 1;
}
