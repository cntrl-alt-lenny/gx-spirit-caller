extern char data_0219f0b8[];
extern int data_0219ef10;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_02091ae0(void *p);
extern void func_020919d8(void *p);

int func_02074134(void) {
    int saved = OS_DisableIrq();
    int result = func_02091ae0(data_0219f0b8);
    if (result == 0) {
        if (data_0219ef10 == 0) {
            data_0219ef10 = 1;
            func_020919d8(data_0219f0b8);
        }
    }
    OS_RestoreIrq(saved);
    return result;
}
