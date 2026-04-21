/* func_ov011_021d2d3c: 32-bit getter at offset 0x24 of struct r0.
 *
 *     ldr r0, [r0, #0x24]
 *     bx  lr
 */

int func_ov011_021d2d3c(void *p) {
    return *(int *)((char *)p + 0x24);
}
