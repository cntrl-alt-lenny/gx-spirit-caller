/* func_020258bc: u32 getter at offset 0xa4.
 *
 *     ldr r0, [r0, #0xa4]
 *     bx  lr
 */

int func_020258bc(void *p) {
    return *(int *)((char *)p + 0xa4);
}
