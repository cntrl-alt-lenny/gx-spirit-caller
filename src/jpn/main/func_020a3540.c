/* func_020a3540: returns 1 iff `data_021a9818.p->byte_50d == 1`.
 *
 *     ldr r0, .L_020a3650
 *     ldr r0, [r0, #0x0]
 *     ldrb r0, [r0, #0x50d]
 *     cmp r0, #0x1
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

extern unsigned char *data_021a9818;

int func_020a3540(void) {
    return data_021a9818[0x50d] == 1;
}
