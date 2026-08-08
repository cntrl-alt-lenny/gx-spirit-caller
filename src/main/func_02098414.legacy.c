extern int data_021a8320;
extern int data_021a8334;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_020972d4(int *p);
extern void func_02097258(int *p);

int func_02098414(int newval) {
    int saved = OS_DisableIrq();
    int old = data_021a8320;
    int result = func_020972d4(&data_021a8334);
    data_021a8320 = newval;
    if (result != 0) {
        func_02097258(&data_021a8334);
    }
    OS_RestoreIrq(saved);
    return old;
}
