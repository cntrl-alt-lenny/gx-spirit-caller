/* func_0208e420: write 0x17 to MMIO 0x4000400, tail-call
 * GX_SendFifo48B. Twin of func_0208e404.
 */

extern void GX_SendFifo48B(void *src, void *dst);

void func_0208e420(void *m) {
    *(volatile int *)0x4000400 = 0x17;
    GX_SendFifo48B(m, (void *)0x4000400);
}
