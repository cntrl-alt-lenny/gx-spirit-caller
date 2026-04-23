/* func_02068578: u32 getter at offset 0x1c.
 *
 *     ldr r0, [r0, #0x1c]
 *     bx  lr
 */

int func_02068578(void *p) {
    return *(int *)((char *)p + 0x1c);
}
