/* func_020a5878: returns 1 iff `*data_021a9920` is non-zero.
 * Same shape as func_02045280 on a different data global.
 *
 *     ldr r0, .L_020a5890
 *     ldr r0, [r0, #0x0]
 *     cmp r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx  lr
 */

extern int data_021a9920;

int func_020a5878(void) {
    return data_021a9920 != 0;
}
