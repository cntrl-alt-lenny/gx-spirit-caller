/* func_02068ca0: u32 getter at offset 0x4ec.
 *
 *     ldr r0, [r0, #0x4ec]
 *     bx  lr
 */

int func_02068ca0(void *p) {
    return *(int *)((char *)p + 0x4ec);
}
