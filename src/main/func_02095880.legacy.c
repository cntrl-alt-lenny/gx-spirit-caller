extern int func_02095344(int a);
extern int func_0209538c(void);
extern int func_020954b4(int x);
extern int func_0209591c(int x);
extern void func_02095678(int x);
extern void func_020953e4(void);

int func_02095880(int a) {
    int r;

    if (func_02095344(a) == 0) return 0;

    r = func_0209538c();
    if (r != 0) return r;

    if ((a & 1) == 0) return 0;

    if (func_020954b4(a & 1) > 0) {
        a = 0;
        while (func_0209591c(a) != 0) { }
        r = func_0209538c();
        if (r != 0) return r;
    } else {
        func_02095678(1);
    }

    func_020953e4();
    a = 1;
    do {
        func_0209591c(a);
        r = func_0209538c();
    } while (r == 0);

    return r;
}
