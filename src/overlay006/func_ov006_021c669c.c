extern char data_ov006_021cb7e0[];
extern char data_ov006_021cb800[];
extern void func_02001d0c(void *p, int a, int b);
extern void func_02001e94(void *p, int a, int b, int c);
extern int func_0208dd9c(void);
extern int func_0208df94(void);
extern void func_0208ff84(void *p, int a, int b);
extern int func_02094504(int a, int b, int c);

int func_ov006_021c669c(char *obj) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400100e;
    *reg = (*reg & ~3) | 2;
    *reg = (*reg & 0x43) | 0x218 | 0x400;
    *(volatile unsigned int *)(0x0400100e + 0xe) = 0;
    func_02094504(0, func_0208df94(), 0x800);
    func_02001d0c(obj + 8, 0x20, 3);
    func_02001e94(obj + 8, func_0208df94(), 2, 4);
    func_02001d0c(obj + 8, 0x20, 0x12);
    func_02001e94(obj + 8, func_0208df94() + 0xc0, 0x62, 5);
    func_02094504(0, func_0208dd9c() + 0x40, 0xc00);
    func_02094504(0, func_0208dd9c() + 0xc40, 0x4800);
    func_0208ff84(data_ov006_021cb7e0, 0x80, 0x20);
    func_0208ff84(data_ov006_021cb800, 0xa0, 0x20);
    return 1;
}
