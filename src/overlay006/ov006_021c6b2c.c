/* func_ov006_021c6b2c: u32 getter at offset 0x8.
 *
 *     ldr r0, [r0, #0x8]
 *     bx  lr
 */

int func_ov006_021c6b2c(void *p) {
    return *(int *)((char *)p + 0x8);
}
