extern void func_0206ba4c(void);
extern void func_0206b96c(void);
extern void func_0206b8fc(void);
extern void func_0206b88c(void);
extern void *data_0219ecd4;
extern void func_02053ddc(void *a, void *fn);

void func_0206b814(void *self, int param2, int param3, int selector) {
    void *fnPtr;
    switch (selector) {
        case 0: fnPtr = (void *)func_0206ba4c; break;
        case 1: fnPtr = (void *)func_0206b96c; break;
        case 2: fnPtr = (void *)func_0206b8fc; break;
        case 3: fnPtr = (void *)func_0206b88c; break;
        default: fnPtr = (void *)func_0206b88c; break;
    }
    *(int *)((char *)self + 0x498) = param3;
    *(int *)((char *)self + 0x49c) = param2;
    data_0219ecd4 = self;
    func_02053ddc(*(void **)((char *)self + 4), fnPtr);
}
