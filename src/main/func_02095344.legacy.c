extern int func_02092380(void);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);

int func_02095344(void) {
    int saved;
    int val;
    if (func_02092380() == 0) {
        return 1;
    }
    saved = OS_DisableIrq();
    *(volatile int *)0x04fff200 = 0x10;
    val = *(volatile int *)0x04fff200;
    OS_RestoreIrq(saved);
    return val != 0;
}
