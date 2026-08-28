extern void *data_021a07ac;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020933bc(void *p);
extern int func_0209336c(void *a, int b, int c, void *d, int e);
extern void func_0207aeb8(void);

void func_0207aed4(void) {
    int saved = OS_DisableIrq();
    func_020933bc((char *)data_021a07ac + 0x22cc);
    if (*(int *)((char *)data_021a07ac + 0x2000 + 0x260) == 9) {
        func_0209336c((char *)data_021a07ac + 0x22cc, 0x022f5341, 0, (void *)func_0207aeb8, 0);
    }
    OS_RestoreIrq(saved);
}
