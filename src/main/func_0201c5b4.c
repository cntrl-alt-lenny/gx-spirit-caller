extern char *GetSystemWork(void);
extern char data_020b59e0[];
extern int func_020097a4(int n);
extern void func_02009758(int n);
extern int func_0201934c(int a);
extern int func_020195b8(int a0, int a1);

void func_0201c5b4(void) {
    unsigned char buf[38];
    unsigned int i;
    GetSystemWork();
    {
        unsigned int n = 19;
        unsigned char *dst = buf;
        unsigned char *src = (unsigned char *)(data_020b59e0 + 0x86);
        do {
            dst[0] = src[0];
            dst[1] = src[1];
            src += 2;
            dst += 2;
        } while (--n != 0);
    }
    if (func_020097a4(0x18) != 0) return;
    {
        int kind = 0;
        unsigned char *p = buf;
        for (i = 0; i < 38; i++, p++) {
            if (func_020195b8(func_0201934c(*p), kind) == 0) return;
        }
    }
    func_02009758(0x18);
}
