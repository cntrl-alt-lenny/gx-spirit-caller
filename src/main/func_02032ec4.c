typedef int OSIntrMode;
extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode);
extern void func_02094688(int a, int b, int c);
int func_02032ec4(char *self, int a1) {
    OSIntrMode old = OS_DisableIrq();
    func_02094688((int)((char *)self + 0xe3c), (int)(a1), 64);
    OS_RestoreIrq(old);
    return 0;
}
