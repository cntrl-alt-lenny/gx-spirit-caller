typedef int OSIntrMode;
extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode);
extern void func_02094688(int a, int b, int c);
int func_02032efc(char *self, int a1, int a2) {
    OSIntrMode old = OS_DisableIrq();
    func_02094688((int)(a2), (int)(*(char **)(self + 0xe7c) + a1 * 12), 12);
    OS_RestoreIrq(old);
    return 0;
}
