extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_0206dcb4(void);
extern int data_0219ed4c;

void func_0206dbbc(void) {
    int state = OS_DisableIrq();
    while (data_0219ed4c != 0) {
        func_0206dcb4();
    }
    OS_RestoreIrq(state);
}
