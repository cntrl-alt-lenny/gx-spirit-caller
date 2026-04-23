/* func_02091814: u32 getter at offset 0x70.
 *
 *     ldr r0, [r0, #0x70]
 *     bx  lr
 */

int func_02091814(void *p) {
    return *(int *)((char *)p + 0x70);
}
