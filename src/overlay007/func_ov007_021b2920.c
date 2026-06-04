/* func_ov007_021b2920: bring up the sub-screen BG3 for the board. Program its
 * BGCNT at 0x0400100e (priority 2; then char/screen-base + 256-color + mosaic),
 * clear its scroll, load the font cell config (func_02001d0c) and a VRAM bank
 * (func_0208df94 -> func_02001e94), and DMA the default palette
 * (func_0208ff84). Returns 1.
 */

extern void func_02001d0c(int a, int b, int c);
extern int func_0208df94(void);
extern void func_02001e94(int a, int b, int c, int d);
extern void func_0208ff84(void *a, int b, int c);
extern char data_020b4728[];

int func_ov007_021b2920(int a0) {
    volatile unsigned short *p = (volatile unsigned short *)0x400100e;
    *p = (*p & ~3) | 2;
    *p = (*p & 0x43) | 0x204 | 0x400;
    *(int *)((char *)p + 0xe) = 0;
    func_02001d0c(a0, 0x20, 0x18);
    func_02001e94(a0, func_0208df94(), 0, 0xf);
    func_0208ff84(data_020b4728, 0x1e0, 0x20);
    return 1;
}
