/* func_0208cc0c: C-41 MMIO bit-clear + tail-call (brief 235 recipe). */
extern int func_0208cc7c(void *data);
extern char data_021a6234[];
int func_0208cc0c(void) {
    *(volatile unsigned int *)0x04000000 &= ~0x80000000u;
    return func_0208cc7c(data_021a6234);
}
