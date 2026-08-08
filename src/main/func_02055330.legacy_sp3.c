extern char data_020ffbd8;
extern char data_020ffbf8;
extern int        func_020931e8(void);
extern void       func_020a6d54(void *file, void *msg, int zero, int line);
extern long long  func_020930b0(void);
extern int        func_020b3808(int lo, int hi, unsigned int c, int d);

int func_02055330(void) {
    long long v;

    if (func_020931e8() != 1) {
        func_020a6d54(&data_020ffbd8, &data_020ffbf8, 0, 0x109);
    }

    v = func_020930b0();
    v <<= 6;
    return func_020b3808((int)v, (int)(v >> 32), 0x82ea, 0);
}
