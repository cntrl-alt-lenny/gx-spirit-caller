/* func_0208cefc: C-41 MMIO bit-clear + tail-call (brief 235 recipe). */
extern int func_0208cf6c(void *data);
extern char data_021a6314[];
int func_0208cefc(void) {
    *(volatile unsigned int *)0x04000000 &= ~0x80000000u;
    return func_0208cf6c(data_021a6314);
}
