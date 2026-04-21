/* func_ov006_021c1678: field getter at offset 0x18.
 *     ldr r0, [r0, #0x18]
 *     bx  lr
 */

int func_ov006_021c1678(void *p) {
    return *(int *)((char *)p + 0x18);
}
