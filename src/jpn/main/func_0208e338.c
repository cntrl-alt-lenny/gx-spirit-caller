/* func_0208e338: write 0x17 to MMIO 0x4000400, tail-call
 * GX_SendFifo48B. Twin of func_0208e31c.
 */

extern int GX_SendFifo48B(int x);

int func_0208e338(int x) {
    *(volatile int *)0x4000400 = 0x17;
    return GX_SendFifo48B(x);
}
