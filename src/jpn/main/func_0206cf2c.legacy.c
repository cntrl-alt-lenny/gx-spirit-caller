typedef signed char s8;
typedef unsigned short u16;

struct Inner0206 {
    char _pad0[0xf8];
    int f_f8;
    char _pad1[0xfe - 0xfc];
    s8 f_fe;
};

struct S0206cf {
    char _pad0[0x64];
    struct Inner0206 *f_64;
    char _pad1[0x70 - 0x68];
    short f_70;
    char _pad2[0x73 - 0x72];
    s8 f_73;
    u16 f_74;
};

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_0206ce9c(struct S0206cf *a, int *out8, u16 *out4, u16 *out6, int *outC);
extern void func_02094688(int a, int b, int c);

int func_0206cf2c(struct S0206cf *a, int b, int c, u16 *d, int *e) {
    int local8, localC;
    u16 local4, local6;
    int saved = OS_DisableIrq();
    int status = func_0206ce9c(a, &local8, &local4, &local6, &localC);
    int r4;

    if (status != 0) {
        if (local8 == 0) {
            r4 = ~5;
        } else {
            int flag = 1;
            s8 byte73 = a->f_73;
            r4 = local8;
            if (c > local8) c = local8;
            if (byte73 == 0) {
            } else if (byte73 != 4) {
                flag = 0;
            }
            if (flag != 0) r4 = c;
            func_02094688(status, b, c);
            if (a->f_64->f_fe == 0) {
                a->f_64->f_f8 += r4;
            }
        }
    } else {
        if (local8 == 0) {
            r4 = 0;
        } else {
            r4 = ~0x1b;
        }
        a->f_70 &= ~6;
    }

    if (r4 >= 0) {
        if (d != 0) {
            if (e != 0) {
                *d = local6;
                *e = localC;
            }
        }
        if (a->f_74 == 0) {
            a->f_74 = local4;
        }
    }
    OS_RestoreIrq(saved);
    return r4;
}
