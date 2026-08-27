extern int func_0209e404(void);
extern void func_0201f148(int arg);
extern int func_0201f0e4(int x);
extern int func_02020664(void *fn, int n);
extern void func_02020598(void);

int func_020204fc(int n) {
    int v = func_0209e404();

    if (v == 0x8000) {
        func_0201f148(3);
        func_0201f0e4(9);
        return 3;
    }
    if (v == 0) {
        func_0201f148(0x16);
        func_0201f0e4(9);
        return 0x18;
    }

    while (!(v & (1 << (n - 1)))) {
        n = (unsigned short)(n + 1);
        if ((unsigned int)n > 0x10) {
            return 0x18;
        }
    }

    return (unsigned short)func_02020664((void *)func_02020598, n);
}
