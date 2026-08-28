extern void *data_021a9840;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_020a5770(void *p);
extern void func_02091c3c(void *a, void *fn, void *b, void *c, int d, int e);
extern void func_020918f0(void *a);
extern void func_020a5828(void);

void func_020a57a0(char *a0, char *a1) {
    int saved;
    int aligned;

    saved = OS_DisableIrq();
    if (data_021a9840 == 0) {
        data_021a9840 = a0;
        func_020a5770(a0 + 0xc4);
        *(int *)(a0 + 0xc0) = 0;
        aligned = (int)(a1 - 0xe4) & ~3;
        func_02091c3c(a0, func_020a5828, a0, a0 + 0xe4 + aligned, aligned, 0);
        func_020918f0(a0);
    }
    OS_RestoreIrq(saved);
}
