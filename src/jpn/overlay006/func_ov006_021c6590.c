extern char data_ov006_021cb6d4[];
extern char data_ov006_021cb6f4[];
extern void func_02001cec(void *p, int a, int b);
extern void func_02001e74(void *p, int a, int b, int c);
extern int func_0208dcb4(void);
extern int func_0208deac(void);
extern void func_0208fe9c(void *p, int a, int b);
extern int func_02094410(int a, int b, int c);

int func_ov006_021c6590(char *obj) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400100e;
    *reg = (*reg & ~3) | 2;
    *reg = (*reg & 0x43) | 0x218 | 0x400;
    *(volatile unsigned int *)(0x0400100e + 0xe) = 0;
    func_02094410(0, func_0208deac(), 0x800);
    func_02001cec(obj + 8, 0x20, 3);
    func_02001e74(obj + 8, func_0208deac(), 2, 4);
    func_02001cec(obj + 8, 0x20, 0x12);
    func_02001e74(obj + 8, func_0208deac() + 0xc0, 0x62, 5);
    func_02094410(0, func_0208dcb4() + 0x40, 0xc00);
    func_02094410(0, func_0208dcb4() + 0xc40, 0x4800);
    func_0208fe9c(data_ov006_021cb6d4, 0x80, 0x20);
    func_0208fe9c(data_ov006_021cb6f4, 0xa0, 0x20);
    return 1;
}
