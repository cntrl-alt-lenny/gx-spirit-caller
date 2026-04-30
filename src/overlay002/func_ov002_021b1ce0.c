/* func_ov002_021b1ce0: read pointer field at offset 0xd10 of `data_ov002_022d016c`.
 *
 * Sibling of func_020085d4 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0xd10).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0xd10]
 *     bx  lr
 * .L_xxxx: .word data_ov002_022d016c
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_ov002_022d016c[];

void *func_ov002_021b1ce0(void) {
    return *(void **)(data_ov002_022d016c + 0xd10);
}
