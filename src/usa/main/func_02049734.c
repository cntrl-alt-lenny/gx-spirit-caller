extern int func_02048880(int, void *);
extern int func_02045a74(void *, void *, void *, int);
extern unsigned char func_020acbac(void *, int, int);
extern void func_020aad04(int, void *);
extern unsigned char data_020ff880;
extern unsigned char data_020ff884;

unsigned char func_02049734(int arg0, char *out1, char *out2, int arg3)
{
    unsigned char buf[0x218];

    if (func_02048880(arg0, buf + 4) != 0) {
        if (*(int *)(buf + 8) == 6) {
            if (out1 != 0) {
                if (func_02045a74(&data_020ff880, buf, buf + 0xc, 0x2f) <= 0) {
                    *out1 = 0;
                } else {
                    *out1 = func_020acbac(buf, 0, 0xa);
                }
            }
            if (out2 != 0) {
                if (func_02045a74(&data_020ff884, buf, buf + 0xc, 0x2f) <= 0) {
                    *out2 = 0;
                } else {
                    *out2 = func_020acbac(buf, 0, 0xa);
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
            func_020aad04(arg3, buf + 0x10c);
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
