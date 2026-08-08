extern char *func_020498f0(void);
extern int func_02045280(void);
extern int func_02068cc8(int a, int b);
extern int func_02068a20(int a, int b, int c);

int func_02051ab0(int a0, int a1, int a2) {
    if (func_020498f0() == 0 || func_02045280() != 0) {
        return a2;
    }
    {
        char *h = func_020498f0();
        int r = func_02068cc8(*(int *)(h + 0xe4), a0);
        if (r != 0) {
            a2 = func_02068a20(r, a1, a2);
        }
    }
    return a2;
}
