extern void func_02008c10(int, void *);
extern int func_0200924c(void *);
extern void func_02008c84(int, void *, int);

int func_02009278(int arg0, void *arg1) {
    func_02008c10(arg0, arg1);
    switch (arg0) {
    case 0:
        return func_0200924c(arg1);
    case 1:
        func_02008c84(1, arg1, 0);
        return 1;
    default:
        return 0;
    }
}
