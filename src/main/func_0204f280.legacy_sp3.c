extern void *func_020498f0(void);
extern void func_02068f54(int x);
extern void func_02065e40(void);
extern void func_020498dc(int x);
extern void func_0204548c(int a, int b, int c);
extern void func_0204b370(void);
extern int data_0219dc90;

void func_0204f280(void) {
    int tmp;

    if (func_020498f0() == 0) {
        return;
    }

    if (*(int *)((char *)func_020498f0() + 0xe4) != 0) {
        func_02068f54(*(int *)((char *)func_020498f0() + 0xe4));
        *(int *)((char *)func_020498f0() + 0xe4) = 0;
    }

    func_02065e40();
    func_020498dc(0);

    tmp = data_0219dc90;
    if (tmp != 0) {
        func_0204548c(4, tmp, 0);
        data_0219dc90 = 0;
    }

    func_0204b370();
    *(unsigned char *)((char *)func_020498f0() + 0x18) = 1;
}
