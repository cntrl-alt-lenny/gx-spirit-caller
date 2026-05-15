/* func_02045230: returns 1 iff `*data_0219d9e0` is non-zero.
 *
 *     ldr r0, .L_02045298
 *     ldr r0, [r0, #0x0]
 *     cmp r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx  lr
 */

extern int data_0219d9e0;

int func_02045230(void) {
    return data_0219d9e0 != 0;
}
