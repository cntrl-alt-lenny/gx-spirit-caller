extern void func_02008c10(void);
extern void func_02008c84(int a, int b, int c);
extern int func_02008fb8(int a, int b);

int func_020091f4(int which, int a, int b) {
    func_02008c10();
    switch (which) {
    case 0:
        return func_02008fb8(a, b);
    case 1:
        func_02008c84(1, a, 1);
        return 1;
    }
    return 0;
}
