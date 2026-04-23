/* func_02053720: u32 getter at offset 0x8.
 *
 *     ldr r0, [r0, #0x8]
 *     bx  lr
 */

int func_02053720(void *p) {
    return *(int *)((char *)p + 0x8);
}
