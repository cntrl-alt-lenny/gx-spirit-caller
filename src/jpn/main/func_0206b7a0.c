extern void func_0206b9d8(void);
extern void func_0206b8f8(void);
extern void func_0206b888(void);
extern void func_0206b818(void);
extern void *data_0219ebf4;
extern void func_02053d68(void *a, void *fn);

void func_0206b7a0(void *self, int param2, int param3, int selector) {
    void *fnPtr;
    switch (selector) {
        case 0: fnPtr = (void *)func_0206b9d8; break;
        case 1: fnPtr = (void *)func_0206b8f8; break;
        case 2: fnPtr = (void *)func_0206b888; break;
        case 3: fnPtr = (void *)func_0206b818; break;
        default: fnPtr = (void *)func_0206b818; break;
    }
    *(int *)((char *)self + 0x498) = param3;
    *(int *)((char *)self + 0x49c) = param2;
    data_0219ebf4 = self;
    func_02053d68(*(void **)((char *)self + 4), fnPtr);
}
