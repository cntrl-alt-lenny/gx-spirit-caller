/* func_02084fc8: spin while data_021a4824 is non-zero.
 *
 *     ldr r0, .L_02084fdc
 *  .L_02084fcc:
 *     ldr r1, [r0, #0x0]
 *     cmp r1, #0x0
 *     bne .L_02084fcc
 *     bx  lr
 *  .L_02084fdc: .word data_021a4824
 */

extern volatile int data_021a4824;

void func_02084fc8(void) {
    while (data_021a4824 != 0) { }
}
