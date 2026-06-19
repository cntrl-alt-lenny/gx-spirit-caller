/* func_ov002_021afae4: read pointer field at offset 0xc of `data_ov002_022cdb98`.
 *
 * Sibling of func_020085b8 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0xc).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0xc]
 *     bx  lr
 * .L_xxxx: .word data_ov002_022cdb98
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_ov002_022cdb98[];

void *func_ov002_021afae4(void) {
    return *(void **)(data_ov002_022cdb98 + 0xc);
}
