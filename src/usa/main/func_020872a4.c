/* func_020872a4: clear bits in `*data_021a4770` matching the bit-mask in arg.
 *
 *     ldr r1, .L_020873a4
 *     mvn r0, r0                   ; r0 = ~arg
 *     ldr r2, [r1, #0x0]
 *     and r0, r2, r0
 *     str r0, [r1, #0x0]
 *     bx  lr
 */

extern unsigned int data_021a4770;

void func_020872a4(unsigned int mask) {
    data_021a4770 &= ~mask;
}
