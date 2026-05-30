typedef int OSIntrMode;
extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode);
extern void func_02091a8c(void *p);
void func_02091af4(char *self) {
    OSIntrMode old = OS_DisableIrq();
    if (*(int *)(self + 0x64) != 2) func_02091a8c(self + 0x9c);
    OS_RestoreIrq(old);
}
