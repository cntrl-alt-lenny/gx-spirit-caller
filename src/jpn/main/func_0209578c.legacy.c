extern int func_02095250(int a);
extern int func_02095298(void);
extern int func_020953c0(int x);
extern int func_02095828(int x);
extern void func_02095584(int x);
extern void func_020952f0(void);

int func_0209578c(int a) {
    int r;

    if (func_02095250(a) == 0) return 0;

    r = func_02095298();
    if (r != 0) return r;

    if ((a & 1) == 0) return 0;

    if (func_020953c0(a & 1) > 0) {
        a = 0;
        while (func_02095828(a) != 0) { }
        r = func_02095298();
        if (r != 0) return r;
    } else {
        func_02095584(1);
    }

    func_020952f0();
    a = 1;
    do {
        func_02095828(a);
        r = func_02095298();
    } while (r == 0);

    return r;
}
