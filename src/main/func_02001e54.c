/* func_02001e54: u32 getter at offset 0x28.
 *
 *     ldr r0, [r0, #0x28]
 *     bx  lr
 */

int func_02001e54(void *p) {
    return *(int *)((char *)p + 0x28);
}
