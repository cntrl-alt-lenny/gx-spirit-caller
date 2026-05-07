/* func_02090978: clear bit 7 (0x80) of REG_IME at 0x04000204.
 *
 *     ldr  r1, .L_0209098c
 *     ldrh r0, [r1, #0x0]
 *     bic  r0, r0, #0x80
 *     strh r0, [r1, #0x0]
 *     bx   lr
 *  .L_0209098c: .word 0x4000204
 */

void func_02090978(void) {
    volatile unsigned short *p = (volatile unsigned short *)0x04000204;
    *p &= ~0x80u;
}
