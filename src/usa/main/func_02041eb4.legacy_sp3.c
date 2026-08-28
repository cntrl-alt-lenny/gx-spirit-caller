extern int data_0219d90c;
extern void func_0209275c(void *p);
extern int func_020919f8(void *p);
extern void func_02091c3c(void *p0, void (*fn)(void), void *p2, void *p3, int a4, int a5);
extern void func_020918f0(void *p);
extern void func_02041928(void);

void func_02041eb4(void *self, int a1) {
    *(int *)((char *)self + 0x1c0c) = 0;
    func_0209275c((char *)self + 0x1bf4);
    func_0209275c((char *)self + 0x1a14);
    if (*(int *)((char *)self + 0x1018) == 1) {
        data_0219d90c = 1;
    } else {
        data_0219d90c = 0;
    }
    if (*(int *)((char *)self + 0x1ba0) != 0) {
        if (func_020919f8((char *)self + 0x1b34) == 0) {
            return;
        }
    }
    func_02091c3c((char *)self + 0x1b34, func_02041928, self, (char *)self + 0x1000, 0x1000, a1);
    func_020918f0((void *)((unsigned int)self + 0x1b34));
}
