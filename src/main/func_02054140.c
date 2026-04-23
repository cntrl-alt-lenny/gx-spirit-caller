/* func_02054140: u32 getter at offset 0x0 (first-field accessor).
 *
 *     ldr r0, [r0, #0x0]
 *     bx  lr
 */

int func_02054140(void *p) {
    return *(int *)p;
}
