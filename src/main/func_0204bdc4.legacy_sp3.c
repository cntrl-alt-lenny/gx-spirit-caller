extern char *func_020498f0(void);
extern int *func_02046770(int a, int b);
extern void func_0206255c(int a);
extern void func_0204fc38(int a, int b);

int func_0204bdc4(int a0) {
    char *h = func_020498f0();
    *(int *)(h + 0x20c) = a0;
    h = func_020498f0();
    int b = *(unsigned char *)(h + 0xd) + 1;
    int *p = func_02046770(a0, b);
    if (p != 0) {
        h = func_020498f0();
        *(unsigned char *)(h + 0x1a8) = 2;
        func_0206255c(*p);
        h = func_020498f0();
        *(unsigned char *)(h + 0x1a8) = 0;
        return 1;
    }
    h = func_020498f0();
    b = *(unsigned char *)(h + 0xd) + 1;
    func_0204fc38(a0, b);
    return 0;
}
