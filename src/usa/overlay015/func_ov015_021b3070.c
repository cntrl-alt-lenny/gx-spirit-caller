/* func_ov015_021b3070: construct the scroller — open the stream, bind it to the
 * window with the supplied bounds, set the 0x1000 mode, then seed the default
 * window geometry (0..0x100 x 0..0xc0, step 0x10) and the derived +0x64 row
 * count. (ov015) */
extern int  func_0207e2d4(int, int);
extern void func_0207fc78(void *, int, int);
extern void func_0207fbf8(void *, int);
extern int  func_020b377c(int, int);
void func_ov015_021b3070(void *o, int src, int arg) {
    func_0207fc78(o, func_0207e2d4(src, 0), arg);
    func_0207fbf8(o, 0x1000);
    *(int *)((char *)o + 0x8) = 1;
    *(int *)((char *)o + 0x5c) = 0;
    *(short *)((char *)o + 0x6c) = 0x10;
    *(int *)((char *)o + 0x68) = 1;
    *(short *)((char *)o + 0x54) = 0;
    *(short *)((char *)o + 0x56) = 0;
    *(short *)((char *)o + 0x58) = 0x100;
    *(short *)((char *)o + 0x5a) = 0xc0;
    *(int *)((char *)o + 0x60) = 0;
    *(int *)((char *)o + 0x64) =
        func_020b377c(0xc0, *(short *)((char *)o + 0x6c)) - 1;
}
