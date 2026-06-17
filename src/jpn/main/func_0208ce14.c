/* func_0208ce14: C-41 MMIO bit-clear + tail-call (brief 235 recipe). */
extern int func_0208ce84(void *data);
extern char data_021a6234[];
int func_0208ce14(void) {
    *(volatile unsigned int *)0x04000000 &= ~0x80000000u;
    return func_0208ce84(data_021a6234);
}
