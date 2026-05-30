/* func_0208cd18: C-41 MMIO bit-clear + tail-call (brief 235 recipe). */
extern int func_0208cd64(void *data);
extern char data_021a6312[];
int func_0208cd18(void) {
    *(volatile unsigned int *)0x04000000 &= ~0x40000000u;
    return func_0208cd64(data_021a6312);
}
