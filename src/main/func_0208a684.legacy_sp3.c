typedef int OSIntrMode;
extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode);
extern void func_0207d12c(void *g, int a0);
extern char data_021a5844[];
void func_0208a684(int a0) {
    OSIntrMode old = OS_DisableIrq();
    func_0207d12c(data_021a5844, a0);
    OS_RestoreIrq(old);
}
