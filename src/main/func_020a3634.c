/* func_020a3634: returns 1 iff `data_021a98f8.p->byte_50d == 1`.
 *
 *     ldr r0, .L_020a3650
 *     ldr r0, [r0, #0x0]
 *     ldrb r0, [r0, #0x50d]
 *     cmp r0, #0x1
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

extern unsigned char *data_021a98f8;

int func_020a3634(void) {
    return data_021a98f8[0x50d] == 1;
}
