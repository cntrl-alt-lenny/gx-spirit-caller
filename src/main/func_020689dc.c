/* func_020689dc: u32 getter at offset 0x0.
 *
 *     ldr r0, [r0, #0x0]
 *     bx  lr
 */

int func_020689dc(void *p) {
    return *(int *)p;
}
