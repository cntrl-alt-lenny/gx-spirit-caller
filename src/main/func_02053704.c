/* func_02053704: u32 getter at offset 0x4.
 *
 *     ldr r0, [r0, #0x4]
 *     bx  lr
 */

int func_02053704(void *p) {
    return *(int *)((char *)p + 0x4);
}
