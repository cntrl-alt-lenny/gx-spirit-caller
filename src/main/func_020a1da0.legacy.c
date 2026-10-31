extern int OS_DisableIrq(void);
extern int OS_RestoreIrq(int mask);
extern char *data_021a98fc;
extern int func_020a099c(unsigned int x);
extern void func_02094688(const void *src, void *dst, unsigned int size);

char *func_020a1da0(unsigned int x) {
    int saved = OS_DisableIrq();
    if (data_021a98fc && func_020a099c(x)) {
        func_02094688(data_021a98fc + 0x1340 + (x - 1) * 0x16,
                      data_021a98fc + 0x1772, 0x16);
        OS_RestoreIrq(saved);
        return data_021a98fc + 0x1772;
    }
    OS_RestoreIrq(saved);
    return 0;
}
