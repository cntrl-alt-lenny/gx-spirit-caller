/* func_ov010_021b2480: 32-bit getter at offset 0x60 of struct r0.
 *
 *     ldr r0, [r0, #0x60]
 *     bx  lr
 *
 * Disassembly is byte-identical to func_ov015_021b2480 (overlay-swap
 * sibling, same base address). The two live at the same physical
 * address but in different overlays' copies of the region — dsd
 * treats them as separate symbols, and so must we.
 */

int func_ov010_021b2480(void *p) {
    return *(int *)((char *)p + 0x60);
}
