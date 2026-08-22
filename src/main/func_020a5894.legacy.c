extern void *data_021a9920;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_020a5864(void *p);
extern void func_02091d24(void *a, void *fn, void *b, void *c, int d, int e);
extern void func_020919d8(void *a);
extern void func_020a591c(void);

void func_020a5894(char *a0, char *a1) {
    int saved;
    int aligned;

    saved = OS_DisableIrq();
    if (data_021a9920 == 0) {
        data_021a9920 = a0;
        func_020a5864(a0 + 0xc4);
        *(int *)(a0 + 0xc0) = 0;
        aligned = (int)(a1 - 0xe4) & ~3;
        func_02091d24(a0, func_020a591c, a0, a0 + 0xe4 + aligned, aligned, 0);
        func_020919d8(a0);
    }
    OS_RestoreIrq(saved);
}
