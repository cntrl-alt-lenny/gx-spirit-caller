extern char *data_021a9920;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_020a5878(void);
extern void func_020a56bc(void *a, int b, void *c, int d);

void func_020a5668(void *p) {
    int saved = OS_DisableIrq();
    if (func_020a5878()) {
        func_020a56bc(data_021a9920 + 0xc4, 0, p, 0);
    }
    OS_RestoreIrq(saved);
}
