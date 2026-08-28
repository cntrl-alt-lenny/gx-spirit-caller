extern unsigned long long func_020536b4(void);
extern unsigned int func_020536ac(void *a0);
extern void func_02053398(unsigned long long v, int code, char *buf);
extern int OS_SNPrintf(char *dst, int maxlen, const char *fmt, ...);
extern char data_020ff9bc[];

void func_02053308(void *a0, unsigned int a1, char *a2) {
    char buf[0x2c];

    func_02053398(func_020536b4(), 0x2b, buf + 0x0);
    func_02053398((unsigned long long)func_020536ac(a0), 0x20, buf + 0x15);

    OS_SNPrintf(a2, 0x15, data_020ff9bc, buf + 0x0,
                (a1 >> 24) & 0xff, (a1 >> 16) & 0xff,
                (a1 >> 8) & 0xff, a1 & 0xff,
                buf + 0x15);
}
