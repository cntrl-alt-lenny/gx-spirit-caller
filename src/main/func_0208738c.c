/* func_0208738c: clear bits in `*data_021a4850` matching the bit-mask in arg.
 *
 *     ldr r1, .L_020873a4
 *     mvn r0, r0                   ; r0 = ~arg
 *     ldr r2, [r1, #0x0]
 *     and r0, r2, r0
 *     str r0, [r1, #0x0]
 *     bx  lr
 */

extern unsigned int data_021a4850;

void func_0208738c(unsigned int mask) {
    data_021a4850 &= ~mask;
}
