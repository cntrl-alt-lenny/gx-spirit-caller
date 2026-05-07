/* func_020908f8: set bit 11 (0x800) of REG_IME at 0x04000204.
 *
 *     ldr  r1, .L_0209090c
 *     ldrh r0, [r1, #0x0]
 *     orr  r0, r0, #0x800
 *     strh r0, [r1, #0x0]
 *     bx   lr
 *  .L_0209090c: .word 0x4000204
 */

void func_020908f8(void) {
    volatile unsigned short *p = (volatile unsigned short *)0x04000204;
    *p |= 0x800;
}
