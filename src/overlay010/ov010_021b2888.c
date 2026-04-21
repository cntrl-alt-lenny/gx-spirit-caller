/* func_ov010_021b2888: 32-bit setter at offset 0x8 of struct r0.
 *
 *     str r1, [r0, #0x8]
 *     bx  lr
 *
 * Overlay-swap sibling of func_ov015_021b2888.
 */

void func_ov010_021b2888(void *p, int v) {
    *(int *)((char *)p + 0x8) = v;
}
