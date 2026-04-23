/* func_ov006_021c6bd4: u32 getter at offset 0x10.
 *
 *     ldr r0, [r0, #0x10]
 *     bx  lr
 */

int func_ov006_021c6bd4(void *p) {
    return *(int *)((char *)p + 0x10);
}
