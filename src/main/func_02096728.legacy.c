extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02091a0c(void *self);

void func_02096728(void *self, int param2) {
    int irqState = OS_DisableIrq();
    void *f0 = *(void **)((char *)self + 0x0);
    void *f4 = *(void **)((char *)self + 0x4);
    if (f0 != 0) {
        *(void **)((char *)f0 + 0x4) = f4;
    }
    if (f4 != 0) {
        *(void **)((char *)f4 + 0x0) = f0;
    }
    *(void **)((char *)self + 0x0) = 0;
    *(void **)((char *)self + 0x4) = *(void **)((char *)self + 0x0);
    *(int *)((char *)self + 0xc) &= ~0x4f;
    *(int *)((char *)self + 0x14) = param2;
    func_02091a0c((char *)self + 0x18);
    OS_RestoreIrq(irqState);
}
