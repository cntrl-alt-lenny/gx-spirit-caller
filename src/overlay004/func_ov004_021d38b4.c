/* func_ov004_021d38b4: getter — read pointer from data_ov004_0229159c.
 * Already referenced by func_ov004_021d3dc8.c with this exact signature.
 *
 *     ldr r0, .L_021d38c0
 *     ldr r0, [r0, #0x0]
 *     bx  lr
 *  .L_021d38c0: .word data_ov004_0229159c
 */

extern char *data_ov004_0229159c;

char *func_ov004_021d38b4(void) {
    return data_ov004_0229159c;
}
