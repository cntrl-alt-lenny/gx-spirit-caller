extern int func_020488f4(int, void *);
extern int func_02045b1c(void *, void *, void *, int);
extern unsigned char func_020acca0(void *, int, int);
extern void func_020aadf8(int, void *);
extern unsigned char data_020ff960;
extern unsigned char data_020ff964;

unsigned char func_020497a8(int arg0, char *out1, char *out2, int arg3)
{
    unsigned char buf[0x218];

    if (func_020488f4(arg0, buf + 4) != 0) {
        if (*(int *)(buf + 8) == 6) {
            if (out1 != 0) {
                if (func_02045b1c(&data_020ff960, buf, buf + 0xc, 0x2f) <= 0) {
                    *out1 = 0;
                } else {
                    *out1 = func_020acca0(buf, 0, 0xa);
                }
            }
            if (out2 != 0) {
                if (func_02045b1c(&data_020ff964, buf, buf + 0xc, 0x2f) <= 0) {
                    *out2 = 0;
                } else {
                    *out2 = func_020acca0(buf, 0, 0xa);
                }
            }
        } else {
            if (out1 != 0) {
                *out1 = 0;
            }
            if (out2 != 0) {
                *out2 = 0;
            }
        }
        if (arg3 != 0) {
            func_020aadf8(arg3, buf + 0x10c);
        }
        return (unsigned char)*(int *)(buf + 8);
    }
    if (out1 != 0) {
        *out1 = 0;
    }
    if (out2 != 0) {
        *out2 = 0;
    }
    return 0;
}
