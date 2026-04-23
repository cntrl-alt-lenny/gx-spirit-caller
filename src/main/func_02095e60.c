/* func_02095e60: u32 getter at offset 0x38.
 *
 *     ldr r0, [r0, #0x38]
 *     bx  lr
 */

int func_02095e60(void *p) {
    return *(int *)((char *)p + 0x38);
}
