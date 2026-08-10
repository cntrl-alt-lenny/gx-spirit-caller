extern void *func_020498f0(void);
extern void func_0204bd8c(void);
extern void func_02050054(int a, int b);
extern void func_02065788(int a);
extern void func_0204bf00(void);
extern void func_020498dc(int a);
extern int func_0204ce90(int a);

int func_0204cb54(void) {
    int ret = 1;
    void *p;

    if (*(unsigned char *)((char *)func_020498f0() + 0x15) != 3) {
        goto mainwork;
    }

    if (*(unsigned char *)((char *)func_020498f0() + 0xd) != 0) {
        func_0204bd8c();
    }
    func_02050054(6, 0xfffec5d2);
    return 0;

mainwork:
    p = func_020498f0();
    *(unsigned char *)((char *)p + 0x14) = *(unsigned char *)((char *)func_020498f0() + 0xd);
    *(int *)((char *)func_020498f0() + 0x208) = 0;
    if (*(int *)((char *)func_020498f0() + 0x19c) != 0) {
        func_02065788(*(int *)((char *)func_020498f0() + 0x19c));
        *(int *)((char *)func_020498f0() + 0x19c) = 0;
    }
    if (*(unsigned char *)((char *)func_020498f0() + 0xd) != 0) {
        func_0204bf00();
    } else {
        func_020498dc(4);
        ret = func_0204ce90(0);
    }
    return ret;
}
