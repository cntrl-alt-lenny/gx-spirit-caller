/* func_ov002_021b1c00: read pointer field at offset 0xd10 of `data_ov002_022d008c`.
 *
 * Sibling of func_020085b8 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0xd10).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0xd10]
 *     bx  lr
 * .L_xxxx: .word data_ov002_022d008c
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_ov002_022d008c[];

void *func_ov002_021b1c00(void) {
    return *(void **)(data_ov002_022d008c + 0xd10);
}
