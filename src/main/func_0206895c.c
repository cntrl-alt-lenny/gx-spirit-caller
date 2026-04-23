/* func_0206895c: u32 getter at offset 0x20.
 *
 *     ldr r0, [r0, #0x20]
 *     bx  lr
 */

int func_0206895c(void *p) {
    return *(int *)((char *)p + 0x20);
}
