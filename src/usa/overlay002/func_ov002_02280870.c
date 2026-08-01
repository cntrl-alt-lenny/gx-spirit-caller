extern void func_ov002_0228090c(int a, int *out1, int *out2, int d);
extern int func_ov002_0227afc8(int a, int b, int c);

int func_ov002_02280870(int arg0) {
    int notArg0;
    int c1a, c1b, c2a, c2b;
    int m;
    int result;
    notArg0 = 1 - arg0;
    func_ov002_0228090c(notArg0, &c1a, &c1b, 0);
    func_ov002_0228090c(arg0, &c2a, &c2b, 0);
    m = c1b;
    if (c1a > m) {
        m = c1a;
    }
    if (c2a > m) {
        return 2;
    }
    m = c2a;
    if (c2a <= c2b) {
        m = c2b;
    }
    if (c1a > m) {
        return -2;
    }
    result = func_ov002_0227afc8(notArg0, -1, 0);
    if (result >= 0x7d0) {
        return -4;
    }
    return 0;
}
