typedef unsigned short u16;

extern char data_ov006_021cb6f8[];
extern char data_ov006_021cb778[];
extern char data_ov006_021cb798[];

extern int func_02001d0c(void *p, int a, int b);
extern int func_02001e94(void *p, int a, int b, int c);
extern int func_0208dd9c(void);
extern int func_0208df94(void);
extern int func_0208ff84(void *p, int a, int b);
extern int func_02094504(int a, int b, int c);

int func_ov006_021c4574(char *self) {
    volatile u16 *reg = (volatile u16 *)0x0400100e;
    int base;

    *reg = (*reg & ~3) | 2;
    *reg = (*reg & 0x43) | 0x218 | 0x400;
    *(int *)((char *)reg + 0xe) = 0;

    base = func_0208df94();
    func_02094504(0, base, 0x800);

    func_02001d0c(self + 0x10, 0xd, 3);

    base = func_0208df94();
    func_02001e94(self + 0x10, base, 2, 4);

    func_02001d0c(self + 0x10, 0x13, 3);

    base = func_0208df94();
    func_02001e94(self + 0x10, base + 0x1a, 0x29, 5);

    func_02001d0c(self + 0x10, 0x20, 3);

    base = func_0208df94();
    func_02001e94(self + 0x10, base + 0x540, 0x62, 6);

    base = func_0208dd9c();
    func_02094504(0, base + 0x40, 0x4e0);

    base = func_0208dd9c();
    func_02094504(0, base + 0x520, 0x720);

    base = func_0208dd9c();
    func_02094504(0, base + 0xc40, 0xc00);

    func_0208ff84(data_ov006_021cb778, 0x80, 0x20);
    func_0208ff84(data_ov006_021cb798, 0xa0, 0x20);
    func_0208ff84(data_ov006_021cb6f8, 0xc0, 0x20);

    return 1;
}
