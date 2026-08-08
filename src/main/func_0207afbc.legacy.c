extern void *data_021a088c;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020933bc(void *p);
extern int func_02093454(void *a, int b, int c, void *d, int e);
extern void func_0207afa0(void);

void func_0207afbc(void) {
    int saved = OS_DisableIrq();
    func_020933bc((char *)data_021a088c + 0x22cc);
    if (*(int *)((char *)data_021a088c + 0x2000 + 0x260) == 9) {
        func_02093454((char *)data_021a088c + 0x22cc, 0x022f5341, 0, (void *)func_0207afa0, 0);
    }
    OS_RestoreIrq(saved);
}
