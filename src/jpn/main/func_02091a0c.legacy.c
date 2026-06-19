typedef int OSIntrMode;
extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode);
extern void func_020919a4(void *p);
void func_02091a0c(char *self) {
    OSIntrMode old = OS_DisableIrq();
    if (*(int *)(self + 0x64) != 2) func_020919a4(self + 0x9c);
    OS_RestoreIrq(old);
}
