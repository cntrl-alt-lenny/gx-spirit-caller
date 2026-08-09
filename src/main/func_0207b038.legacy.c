extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020933bc(void *p);
extern void func_02093454(void *p, unsigned int magic, int zero1, void *fn, int zero2);
extern void func_0207afa0(void);

extern void *data_021a088c;

void func_0207b038(int a0) {
    int irq = OS_DisableIrq();
    char *base = (char *)data_021a088c;

    if (*(int *)(base + 0x2000 + 0x260) == 9 && a0 != 9) {
        func_020933bc(base + 0x22cc);
    }

    base = (char *)data_021a088c;
    if (*(int *)(base + 0x2000 + 0x260) != 0xb) {
        *(int *)(base + 0x2000 + 0x260) = a0;
    }

    if (a0 == 9) {
        base = (char *)data_021a088c;
        func_02093454(base + 0x22cc, 0x022f5341, 0, (void *)func_0207afa0, 0);
    }

    OS_RestoreIrq(irq);
}
