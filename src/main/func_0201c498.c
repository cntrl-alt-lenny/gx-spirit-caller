extern char data_020b59e0[];
extern int func_020097a4(int n);
extern int func_02009758(int n);
extern int func_020195b8(int a0, int a1);

int func_0201c498(void) {
    unsigned char buf[13];
    int r;

    r = func_020097a4(0xb);
    if (r != 0) {
        return r;
    }

    {
        unsigned int n = 6;
        unsigned char *dst = buf;
        unsigned char *src = (unsigned char *)(data_020b59e0 + 0x54);
        do {
            dst[0] = src[0];
            dst[1] = src[1];
            src += 2;
            dst += 2;
        } while (--n != 0);
        dst[0] = src[0];
    }

    {
        unsigned int j;
        int byte;
        int kind0 = 0;
        unsigned char *p = buf;
        for (j = 0; j < 13; j++, p++) {
            byte = *p;
            int a = func_020195b8(byte, 2);
            int b = func_020195b8(byte, kind0);
            int c = func_020195b8(byte, 1);
            int sum = a + (b + c);
            if (sum == 0) {
                return sum;
            }
        }
    }

    return func_02009758(0xb);
}
