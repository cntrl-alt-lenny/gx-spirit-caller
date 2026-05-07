/* func_02090910: clear bit 11 (0x800) of REG_IME at 0x04000204.
 * Sibling of func_020908f8 with `bic` instead of `orr`.
 *
 *     ldr  r1, .L_02090924
 *     ldrh r0, [r1, #0x0]
 *     bic  r0, r0, #0x800
 *     strh r0, [r1, #0x0]
 *     bx   lr
 *  .L_02090924: .word 0x4000204
 */

void func_02090910(void) {
    volatile unsigned short *p = (volatile unsigned short *)0x04000204;
    *p &= ~0x800u;
}
