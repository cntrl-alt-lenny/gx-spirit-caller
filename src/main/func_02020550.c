extern int func_0209e4f8(void);
extern void func_0201f19c(int arg);
extern int func_0201f138(int x);
extern int func_020206b8(void *fn, int n);
extern void func_020205ec(void);

int func_02020550(int n) {
    int v = func_0209e4f8();

    if (v == 0x8000) {
        func_0201f19c(3);
        func_0201f138(9);
        return 3;
    }
    if (v == 0) {
        func_0201f19c(0x16);
        func_0201f138(9);
        return 0x18;
    }

    while (!(v & (1 << (n - 1)))) {
        n = (unsigned short)(n + 1);
        if ((unsigned int)n > 0x10) {
            return 0x18;
        }
    }

    return (unsigned short)func_020206b8((void *)func_020205ec, n);
}
