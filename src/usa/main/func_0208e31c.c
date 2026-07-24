/* func_0208e31c: write 0x19 to MMIO 0x4000400, tail-call
 * GX_SendFifo48B. Twin of func_0208e300.
 */

extern int GX_SendFifo48B(int x);

int func_0208e31c(int x) {
    *(volatile int *)0x4000400 = 0x19;
    return GX_SendFifo48B(x);
}
