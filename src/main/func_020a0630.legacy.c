extern void func_0209dca8(void);
extern int func_0209db88(int a, int b);
extern void func_0209de5c(int idx, int b);
extern int func_0209dcb8(void *buf, int size);

int func_020a0630(int a0, int a1, int a2, int a3, unsigned short a4) {
    int r;
    unsigned short buf[5];

    func_0209dca8();
    r = func_0209db88(1, 2);
    if (r != 0) {
        return r;
    }
    func_0209de5c(0x1e, a0);
    buf[0] = 0x1e;
    buf[1] = (unsigned short)a1;
    buf[2] = (unsigned short)a2;
    buf[3] = (unsigned short)a3;
    buf[4] = a4;
    r = func_0209dcb8(buf, 0xa);
    if (r == 0) {
        r = 2;
    }
    return r;
}
