extern int func_0209db3c(void);
extern void func_02092800(int a, int b);
extern void func_0209dd68(int idx, int b);
extern int func_0209dc3c(int a0, int a1, int a2, int a3);

int func_020a0800(int a0, int a1, int a2) {
    int r;

    r = func_0209db3c();
    if (r != 0) {
        return r;
    }
    if ((unsigned int)a1 > 3) {
        return 6;
    }
    if (a1 != 0) {
        if (a2 == 0) {
            return 6;
        }
        func_02092800(a2, 0x50);
    }
    func_0209dd68(0x14, a0);
    r = func_0209dc3c(0x14, 2, a1, a2);
    if (r == 0) {
        r = 2;
    }
    return r;
}
