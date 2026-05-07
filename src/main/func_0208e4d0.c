/* func_0208e4d0: store `(arg >> 9) & 0x7fff` to halfword at 0x04000610.
 *
 *     ldr  r1, .L_0208e4e4
 *     ldr  r2, .L_0208e4e8
 *     and  r0, r1, r0, asr #0x9
 *     strh r0, [r2, #0x0]
 *     bx   lr
 *  .L_0208e4e4: .word 0x7fff
 *  .L_0208e4e8: .word 0x4000610
 *
 * Two pool-words (mask + addr); the asr-shift is folded into the AND
 * via ARM's barrel shifter.
 */

void func_0208e4d0(int arg) {
    *(volatile unsigned short *)0x04000610 = (arg >> 9) & 0x7fff;
}
