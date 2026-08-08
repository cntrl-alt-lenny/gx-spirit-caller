/* func_0208c9d4: set/clear bit 3 of a hardware I/O register, return old bit.
 *
 *     ldr r2, _LIT0            ; r2 = 0x04000004
 *     cmp r0, #0x0
 *     ldrh r0, [r2]
 *     ldrneh r1, [r2]
 *     and r0, r0, #0x8
 *     orrne r1, r1, #0x8
 *     strneh r1, [r2]
 *     ldreqh r1, [r2]
 *     biceq r1, r1, #0x8
 *     streqh r1, [r2]
 *     bx lr
 *
 * Leaf, no stack frame. 0x04000004 is an NDS hardware I/O register
 * (DISPSTAT); genuinely volatile.
 */

int func_0208c9d4(int enable) {
    volatile unsigned short *reg = (volatile unsigned short *)0x04000004;
    int old = *reg & 8;
    if (enable) {
        *reg = *reg | 8;
    } else {
        *reg = *reg & ~8;
    }
    return old;
}
