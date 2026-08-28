extern char data_0219efd8[];
extern int data_0219ee30;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_020919f8(void *p);
extern void func_020918f0(void *p);

int func_0207404c(void) {
    int saved = OS_DisableIrq();
    int result = func_020919f8(data_0219efd8);
    if (result == 0) {
        if (data_0219ee30 == 0) {
            data_0219ee30 = 1;
            func_020918f0(data_0219efd8);
        }
    }
    OS_RestoreIrq(saved);
    return result;
}
