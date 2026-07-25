extern void func_02008bf4(int, void *);
extern int func_02009230(void *);
extern void func_02008c68(int, void *, int);

int func_0200925c(int arg0, void *arg1) {
    func_02008bf4(arg0, arg1);
    switch (arg0) {
    case 0:
        return func_02009230(arg1);
    case 1:
        func_02008c68(1, arg1, 0);
        return 1;
    default:
        return 0;
    }
}
