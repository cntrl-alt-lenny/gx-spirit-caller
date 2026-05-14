/* func_0200cf64: conditional shift count, write to mmio.
 *
 *     cmp   r1, #0x2
 *     moveq r1, #0x1
 *     movne r1, #0x0
 *     rsb   r1, r1, #0x4
 *     lsr   r1, r0, r1
 *     ldr   r0, .L_0200cf84       ; r0 = 0x40004ac
 *     str   r1, [r0, #0x0]
 *     bx    lr
 */

void func_0200cf64(unsigned int x, int mode) {
    int shift = 4 - (mode == 2 ? 1 : 0);
    *(volatile unsigned int *)0x040004ac = x >> shift;
}
