typedef unsigned short u16;

extern char data_ov006_021cb5ec[];
extern char data_ov006_021cb66c[];
extern char data_ov006_021cb68c[];

extern int func_02001cec(void *p, int a, int b);
extern int func_02001e74(void *p, int a, int b, int c);
extern int func_0208dcb4(void);
extern int func_0208deac(void);
extern int func_0208fe9c(void *p, int a, int b);
extern int func_02094410(int a, int b, int c);

int func_ov006_021c4468(char *self) {
    volatile u16 *reg = (volatile u16 *)0x0400100e;
    int base;

    *reg = (*reg & ~3) | 2;
    *reg = (*reg & 0x43) | 0x218 | 0x400;
    *(int *)((char *)reg + 0xe) = 0;

    base = func_0208deac();
    func_02094410(0, base, 0x800);

    func_02001cec(self + 0x10, 0xd, 3);

    base = func_0208deac();
    func_02001e74(self + 0x10, base, 2, 4);

    func_02001cec(self + 0x10, 0x13, 3);

    base = func_0208deac();
    func_02001e74(self + 0x10, base + 0x1a, 0x29, 5);

    func_02001cec(self + 0x10, 0x20, 3);

    base = func_0208deac();
    func_02001e74(self + 0x10, base + 0x540, 0x62, 6);

    base = func_0208dcb4();
    func_02094410(0, base + 0x40, 0x4e0);

    base = func_0208dcb4();
    func_02094410(0, base + 0x520, 0x720);

    base = func_0208dcb4();
    func_02094410(0, base + 0xc40, 0xc00);

    func_0208fe9c(data_ov006_021cb66c, 0x80, 0x20);
    func_0208fe9c(data_ov006_021cb68c, 0xa0, 0x20);
    func_0208fe9c(data_ov006_021cb5ec, 0xc0, 0x20);

    return 1;
}
