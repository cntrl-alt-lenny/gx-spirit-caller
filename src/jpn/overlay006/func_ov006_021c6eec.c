extern char data_020b4634[];
extern void func_02001cec(void *p, int a, int b);
extern void func_02001e74(void *p, int a, int b, int c);
extern int  func_0208df2c(void);
extern int  func_0208e038(void);
extern void func_0208ff04(void *p, int a, int b);
extern int  func_02094410(int a, int b, int c);

int func_ov006_021c6eec(char *obj) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400000c;
    reg[0] = reg[0] & ~3;
    reg[0] = (reg[0] & 0x43) | 0xe00;
    reg[1] = reg[1] & ~3;
    reg[1] = (reg[1] & 0x43) | 0xf00;
    func_02094410(0, func_0208e038(), 0x800);
    func_02094410(0, func_0208df2c(), 0x800);
    func_02001cec(obj + 4, 0x20, 3);
    func_02001e74(obj + 4, func_0208e038(), 1, 1);
    func_02001cec(obj + 4, 0x20, 2);
    func_02001e74(obj + 4, func_0208df2c() + 0x580, 0x61, 2);
    func_02001cec(obj + 4, 0x13, 0x13);
    func_02001e74(obj + 4, func_0208df2c() + 0xd8, 0xa1, 2);
    func_0208ff04(data_020b4634, 0x20, 0x20);
    func_0208ff04(data_020b4634, 0x40, 0x20);
    return 1;
}
