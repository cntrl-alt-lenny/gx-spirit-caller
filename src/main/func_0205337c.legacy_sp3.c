extern unsigned long long func_02053728(void);
extern unsigned int func_02053720(void *a0);
extern void func_0205340c(unsigned long long v, int code, char *buf);
extern int OS_SNPrintf(char *dst, int maxlen, const char *fmt, ...);
extern char data_020ffa9c[];

void func_0205337c(void *a0, unsigned int a1, char *a2) {
    char buf[0x2c];

    func_0205340c(func_02053728(), 0x2b, buf + 0x0);
    func_0205340c((unsigned long long)func_02053720(a0), 0x20, buf + 0x15);

    OS_SNPrintf(a2, 0x15, data_020ffa9c, buf + 0x0,
                (a1 >> 24) & 0xff, (a1 >> 16) & 0xff,
                (a1 >> 8) & 0xff, a1 & 0xff,
                buf + 0x15);
}
