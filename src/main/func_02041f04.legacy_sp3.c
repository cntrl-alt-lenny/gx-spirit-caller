extern int data_0219d9ec;
extern void func_02092844(void *p);
extern int func_02091ae0(void *p);
extern void func_02091d24(void *p0, void (*fn)(void), void *p2, void *p3, int a4, int a5);
extern void func_020919d8(void *p);
extern void func_02041978(void);

void func_02041f04(void *self, int a1) {
    *(int *)((char *)self + 0x1c0c) = 0;
    func_02092844((char *)self + 0x1bf4);
    func_02092844((char *)self + 0x1a14);
    if (*(int *)((char *)self + 0x1018) == 1) {
        data_0219d9ec = 1;
    } else {
        data_0219d9ec = 0;
    }
    if (*(int *)((char *)self + 0x1ba0) != 0) {
        if (func_02091ae0((char *)self + 0x1b34) == 0) {
            return;
        }
    }
    func_02091d24((char *)self + 0x1b34, func_02041978, self, (char *)self + 0x1000, 0x1000, a1);
    func_020919d8((void *)((unsigned int)self + 0x1b34));
}
