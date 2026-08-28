extern void *func_02070f54(void);
extern unsigned long long func_02092fc8(void);
extern void func_020722b0(void *self, int status, int n);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int data_0219ee3c;
extern void func_020919a4(int extra);

int func_02070ca8(void *self) {
    unsigned int retry;
    void *h = func_02070f54();

    for (retry = 0; retry < 3; retry++) {
        int irq;

        *(void **)((char *)self + 0x28) = h;
        *(unsigned char *)((char *)self + 0x8) = 2;

        *(unsigned int *)((char *)self + 0x10) = (unsigned int)(func_02092fc8() >> 16);
        func_020722b0(self, 2, 0x18);

        irq = OS_DisableIrq();
        if (data_0219ee3c != 0) {
            *(int *)((char *)self + 0x4) = 1;
            func_020919a4(0);
        }
        OS_RestoreIrq(irq);

        if (*(unsigned char *)((char *)self + 0x8) == 4) {
            return 0;
        }
        if (data_0219ee3c == 0) {
            break;
        }
    }
    return 1;
}
