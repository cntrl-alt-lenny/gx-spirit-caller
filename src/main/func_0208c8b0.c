/* func_0208c8b0: bitfield insert at hardware reg 0x04001000 — replace
 * low 3 bits of `*0x04001000` with `arg`.
 *
 *     ldr r2, .L_0208c8c8
 *     ldr r1, [r2, #0x0]
 *     bic r1, r1, #0x7
 *     orr r0, r1, r0
 *     str r0, [r2, #0x0]
 *     bx  lr
 *  .L_0208c8c8: .word 0x4001000
 */

void func_0208c8b0(unsigned int v) {
    volatile unsigned int *p = (volatile unsigned int *)0x04001000;
    *p = (*p & ~0x7u) | v;
}
