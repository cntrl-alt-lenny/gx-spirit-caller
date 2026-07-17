/* func_0204f3c0: context initializer/reset, gated by mode. Common fields
 * are always zeroed first (each field re-fetches the singleton context
 * via func_020498f0() fresh, matching the original's own redundant
 * per-store re-fetch — ground truth: func_020498f0.c). mode==2 sets one
 * field from another context's byte and dispatches func_020498dc(1 or
 * 0xa) depending on two more context byte checks. Non-2 modes zero a
 * second common block plus a handful of Fill32/func_0209448c/
 * func_020945f4 bulk-zero calls. mode==1 (checked after that second
 * block) dispatches func_020498dc(3 or 4) or returns bare depending on
 * a context byte; any other mode zeroes a final block and returns.
 */

extern void *func_020498f0(void);
extern void func_020498dc(int mode);
extern int func_020459f0(int a);
extern void Fill32(int val, void *dest, unsigned int size);
extern void func_0209448c(int val, void *dest, unsigned int size);
extern void func_020945f4(void *p, int b, int c);

void func_0204f3c0(int mode) {
    *(char *)((char *)func_020498f0() + 0xc) = 0;
    *(char *)((char *)func_020498f0() + 0x17c) = 0;
    *(short *)((char *)func_020498f0() + 0x100 + 0x7e) = (short)func_020459f0(0x10000);
    *(int *)((char *)func_020498f0() + 0x180) = 0;
    {
        char *p = (char *)func_020498f0();
        *(int *)(p + 0x184) = 0;
        *(int *)(p + 0x188) = 0;
    }
    {
        char *p = (char *)func_020498f0();
        *(int *)(p + 0x18c) = 0;
        *(int *)(p + 0x190) = 0;
    }
    *(char *)((char *)func_020498f0() + 0x1a4) = 0;
    *(char *)((char *)func_020498f0() + 0x1a9) = 0;
    *(char *)((char *)func_020498f0() + 0x1aa) = 0;
    *(char *)((char *)func_020498f0() + 0x1ab) = 0;
    *(char *)((char *)func_020498f0() + 0x1ac) = 0;
    *(char *)((char *)func_020498f0() + 0x1a7) = 0;
    *(char *)((char *)func_020498f0() + 0x1a8) = 0;
    *(short *)((char *)func_020498f0() + 0x100 + 0xb2) = 0;
    *(short *)((char *)func_020498f0() + 0x100 + 0xb4) = 0;
    *(int *)((char *)func_020498f0() + 0x1b8) = 0;
    {
        char *p = (char *)func_020498f0();
        *(int *)(p + 0x1e0) = 0;
        *(int *)(p + 0x1e4) = 0;
    }
    {
        char *p = (char *)func_020498f0();
        *(int *)(p + 0x1f0) = 0;
        *(int *)(p + 0x1f4) = 0;
    }
    Fill32(0, (char *)func_020498f0() + 0x3cc, 0x98);

    if (mode == 2) {
        unsigned char *dst = (unsigned char *)func_020498f0();
        unsigned char *src = (unsigned char *)func_020498f0();
        dst[0x14] = src[0xd];
        if (((unsigned char *)func_020498f0())[0x15] == 3) {
            func_020498dc(1);
            return;
        }
        if (((unsigned char *)func_020498f0())[0x15] != 2) {
            return;
        }
        func_020498dc(0xa);
        return;
    }

    *(char *)((char *)func_020498f0() + 0xd) = 0;
    *(char *)((char *)func_020498f0() + 0xe) = 0;
    *(char *)((char *)func_020498f0() + 0x14) = 0;
    *(char *)((char *)func_020498f0() + 0x17) = 0;
    *(int *)((char *)func_020498f0() + 0x20) = 0;
    *(int *)((char *)func_020498f0() + 0xe8) = 0;
    *(char *)((char *)func_020498f0() + 0x1a5) = 0;
    *(short *)((char *)func_020498f0() + 0x100 + 0xb0) = 0;
    *(int *)((char *)func_020498f0() + 0x1bc) = 0;
    {
        char *p = (char *)func_020498f0();
        *(int *)(p + 0x1c0) = 0;
        *(int *)(p + 0x1c4) = 0;
    }
    *(int *)((char *)func_020498f0() + 0x1c8) = 0;
    {
        char *p = (char *)func_020498f0();
        *(int *)(p + 0x1cc) = 0;
        *(int *)(p + 0x1d0) = 0;
    }
    *(int *)((char *)func_020498f0() + 0x1d4) = 0;
    *(int *)((char *)func_020498f0() + 0x204) = 0;
    *(int *)((char *)func_020498f0() + 0x208) = 0;
    *(int *)((char *)func_020498f0() + 0x2f0) = 0;
    Fill32(0, (char *)func_020498f0() + 0x24, 0x80);
    func_0209448c(0, (char *)func_020498f0() + 0xa4, 0x40);
    Fill32(0, (char *)func_020498f0() + 0xf4, 0x80);
    Fill32(0, (char *)func_020498f0() + 0x194, 0xc);
    Fill32(0, (char *)func_020498f0() + 0x210, 0x80);
    func_0209448c(0, (char *)func_020498f0() + 0x290, 0x40);
    func_020945f4((char *)func_020498f0() + 0x2d0, 0, 0x20);
    Fill32(0, (char *)func_020498f0() + 0x348, 0x84);

    if (mode == 1) {
        if (((unsigned char *)func_020498f0())[0x15] == 0) {
            func_020498dc(3);
            return;
        }
        if (((unsigned char *)func_020498f0())[0x15] != 1) {
            return;
        }
        func_020498dc(4);
        return;
    }

    *(char *)((char *)func_020498f0() + 0x15) = 0;
    *(char *)((char *)func_020498f0() + 0x16) = 0;
    *(char *)((char *)func_020498f0() + 0x18) = 0;
    *(int *)((char *)func_020498f0() + 0x20c) = 0;
    *(char *)((char *)func_020498f0() + 0x1a6) = 0;
    *(char *)((char *)func_020498f0() + 0x1ae) = 0;
    *(char *)((char *)func_020498f0() + 0x1ad) = 0;
    {
        char *p = (char *)func_020498f0();
        *(int *)(p + 0x1f8) = 0;
        *(int *)(p + 0x1fc) = 0;
    }
    *(int *)((char *)func_020498f0() + 0x46c) = 0;
    *(int *)((char *)func_020498f0() + 0x470) = 0;
}
