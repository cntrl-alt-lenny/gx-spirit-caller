/* func_0208ce38: C-41 MMIO bit-clear + tail-call (brief 235 recipe). */
extern int func_0208ce84(void *data);
extern char data_021a6232[];
int func_0208ce38(void) {
    *(volatile unsigned int *)0x04000000 &= ~0x40000000u;
    return func_0208ce84(data_021a6232);
}
