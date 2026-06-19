typedef int OSIntrMode;
extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode);
extern void func_0207d044(void *g, int a0);
extern char data_021a5764[];
void func_0208a59c(int a0) {
    OSIntrMode old = OS_DisableIrq();
    func_0207d044(data_021a5764, a0);
    OS_RestoreIrq(old);
}
