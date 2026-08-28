extern char *data_021a9840;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_020a5784(void);
extern void func_020a55c8(void *a, int b, void *c, int d);

void func_020a5574(void *p) {
    int saved = OS_DisableIrq();
    if (func_020a5784()) {
        func_020a55c8(data_021a9840 + 0xc4, 0, p, 0);
    }
    OS_RestoreIrq(saved);
}
