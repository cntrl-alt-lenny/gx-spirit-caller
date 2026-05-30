/* func_0208ccf4: C-41 MMIO bit-clear + tail-call (brief 235 recipe). */
extern int func_0208cd64(void *data);
extern char data_021a6314[];
int func_0208ccf4(void) {
    *(volatile unsigned int *)0x04000000 &= ~0x80000000u;
    return func_0208cd64(data_021a6314);
}
