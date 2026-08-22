extern int func_0209dc30(void);
extern void func_020928e8(int a, int b);
extern void func_0209de5c(int idx, int b);
extern int func_0209dd30(int a0, int a1, int a2, int a3);

int func_020a08f4(int a0, int a1, int a2) {
    int r;

    r = func_0209dc30();
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
        func_020928e8(a2, 0x50);
    }
    func_0209de5c(0x14, a0);
    r = func_0209dd30(0x14, 2, a1, a2);
    if (r == 0) {
        r = 2;
    }
    return r;
}
