extern void func_0207d100(void *self, unsigned int tag, void *ctx, int a1, int a2);
extern void *func_0207d8ac(void *buf, int tag);

void *func_0207d82c(char *self, int a1, int a2) {
    char *sub = self + 0x24;
    int stackArg = a2;

    func_0207d100(self, 0x45585048u, sub + 0x14, a1, stackArg);

    *(short *)(sub + 0x10) = 0;
    *(short *)(sub + 0x12) = 0;
    *(short *)(sub + 0x12) = (short)(*(unsigned short *)(sub + 0x12) & ~1);

    struct {
        int a;
        int b;
    } buf2;
    buf2.a = *(int *)(self + 0x18);
    buf2.b = *(int *)(self + 0x1c);

    void *result = func_0207d8ac(&buf2, 0x4652);

    *(void **)(self + 0x24) = result;
    *(void **)(sub + 0x4) = result;
    *(int *)(sub + 0x8) = 0;
    *(int *)(sub + 0xc) = 0;
    return self;
}
