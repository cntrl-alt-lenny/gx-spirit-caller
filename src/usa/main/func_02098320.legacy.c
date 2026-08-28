extern int data_021a8240;
extern int data_021a8254;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_020971e0(int *p);
extern void func_02097164(int *p);

int func_02098320(int newval) {
    int saved = OS_DisableIrq();
    int old = data_021a8240;
    int result = func_020971e0(&data_021a8254);
    data_021a8240 = newval;
    if (result != 0) {
        func_02097164(&data_021a8254);
    }
    OS_RestoreIrq(saved);
    return old;
}
