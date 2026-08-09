extern void func_020927b8(void *p);
extern void func_02070f78(unsigned short a, unsigned short b, int c);
extern int func_02070d34(void);
extern void func_02092748(void *p);

int func_0206c7c0(void *self) {
    void *inner = *(void **)((char *)self + 0x4);
    void *p = *(void **)((char *)inner + 0x64);
    int result = 0;

    func_020927b8((char *)p + 0xe0);
    func_02070f78(*(unsigned short *)((char *)self + 0x10),
                  *(unsigned short *)((char *)self + 0x12),
                  *(int *)((char *)self + 0x14));
    *(int *)((char *)p + 0xf8) = 0;

    if (*(signed char *)((char *)self + 0xc) == 0 || *(signed char *)((char *)self + 0xc) == 4) {
        result = func_02070d34();
    }
    func_02092748((char *)p + 0xe0);

    if (result != 0) {
        *(short *)((char *)inner + 0x70) |= 0x40;
        return -0x4c;
    } else {
        *(short *)((char *)inner + 0x70) |= 0x4;
        return 0;
    }
}
