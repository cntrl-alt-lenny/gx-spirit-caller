/* func_ov015_021b2480: 32-bit getter at offset 0x60 of struct r0.
 *
 *     ldr r0, [r0, #0x60]
 *     bx  lr
 *
 * Caller: func_ov015_021b4574. Role unknown; keep func_ov015_ prefix.
 */

int func_ov015_021b2480(void *p) {
    return *(int *)((char *)p + 0x60);
}
