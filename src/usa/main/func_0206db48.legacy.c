extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_0206dc40(void);
extern int data_0219ec6c;

void func_0206db48(void) {
    int state = OS_DisableIrq();
    while (data_0219ec6c != 0) {
        func_0206dc40();
    }
    OS_RestoreIrq(state);
}
