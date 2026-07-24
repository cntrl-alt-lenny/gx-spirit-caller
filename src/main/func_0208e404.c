/* func_0208e404: write 0x19 to MMIO 0x4000400, tail-call
 * GX_SendFifo48B. Twin of func_0208e3e8.
 */

extern int GX_SendFifo48B(int x);

int func_0208e404(int x) {
    *(volatile int *)0x4000400 = 0x19;
    return GX_SendFifo48B(x);
}
