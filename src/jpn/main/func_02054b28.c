extern char data_020ffaf8;
extern char data_020ffb18;
extern int       func_02093100(void);
extern void       func_020a6c60(void *file, void *msg, int zero, int line);
extern long long  func_02092fc8(void);
extern int        func_020b3714(int lo, int hi, unsigned int c, int d);

void func_02054b28(int *out) {
    long long v;
    int result;

    if (func_02093100() != 1) {
        func_020a6c60(&data_020ffaf8, &data_020ffb18, 0, 0x667);
    }

    v = func_02092fc8();
    v <<= 6;
    result = func_020b3714((int)v, (int)(v >> 32), 0x01ff6210, 0);

    if (out != 0) {
        *out = result;
    }
}
