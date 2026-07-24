/* func_0208e420: write 0x17 to MMIO 0x4000400, tail-call
 * GX_SendFifo48B. Twin of func_0208e404.
 */

extern int GX_SendFifo48B(int x);

int func_0208e420(int x) {
    *(volatile int *)0x4000400 = 0x17;
    return GX_SendFifo48B(x);
}
