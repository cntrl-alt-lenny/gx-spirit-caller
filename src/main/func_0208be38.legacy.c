/* func_0208be38: C-23 MMIO base-fold (DS divider setup, .legacy.c). Keep
 * each MMIO base separate (volatile) so mwcc 1.2/sp2p3 emits per-base loads. */
void func_0208be38(int a0, int a1) {
    *(volatile unsigned short *)0x04000280 = 1;
    {
        volatile int *p = (volatile int *)0x04000290;
        p[0] = 0;
        p[1] = a0;
    }
    {
        volatile int *q = (volatile int *)0x04000298;
        q[0] = a1;
        q[1] = 0;
    }
}
