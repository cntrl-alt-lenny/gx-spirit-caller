extern void *func_0207103c(void);
extern unsigned long long func_020930b0(void);
extern void func_02072398(void *self, int status, int n);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int data_0219ef1c;
extern void func_02091a8c(int extra);

int func_02070d90(void *self) {
    unsigned int retry;
    void *h = func_0207103c();

    for (retry = 0; retry < 3; retry++) {
        int irq;

        *(void **)((char *)self + 0x28) = h;
        *(unsigned char *)((char *)self + 0x8) = 2;

        *(unsigned int *)((char *)self + 0x10) = (unsigned int)(func_020930b0() >> 16);
        func_02072398(self, 2, 0x18);

        irq = OS_DisableIrq();
        if (data_0219ef1c != 0) {
            *(int *)((char *)self + 0x4) = 1;
            func_02091a8c(0);
        }
        OS_RestoreIrq(irq);

        if (*(unsigned char *)((char *)self + 0x8) == 4) {
            return 0;
        }
        if (data_0219ef1c == 0) {
            break;
        }
    }
    return 1;
}
