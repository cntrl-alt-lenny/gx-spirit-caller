/* func_ov004_021d37d4: getter — read pointer from data_ov004_0229133c.
 * Already referenced by func_ov004_021d3ce8.c with this exact signature.
 *
 *     ldr r0, .L_021d38c0
 *     ldr r0, [r0, #0x0]
 *     bx  lr
 *  .L_021d38c0: .word data_ov004_0229133c
 */

extern char *data_ov004_0229133c;

char *func_ov004_021d37d4(void) {
    return data_ov004_0229133c;
}
