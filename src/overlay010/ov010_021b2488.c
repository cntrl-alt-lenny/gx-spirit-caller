/* func_ov010_021b2488: 32-bit getter at offset 0x5c of struct r0.
 *
 *     ldr r0, [r0, #0x5c]
 *     bx  lr
 *
 * Overlay-swap sibling of func_ov015_021b2488.
 */

int func_ov010_021b2488(void *p) {
    return *(int *)((char *)p + 0x5c);
}
