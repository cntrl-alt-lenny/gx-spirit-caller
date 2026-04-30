/* func_ov002_021afbc4: read pointer field at offset 0xc of `data_ov002_022cdc78`.
 *
 * Sibling of func_020085d4 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0xc).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0xc]
 *     bx  lr
 * .L_xxxx: .word data_ov002_022cdc78
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_ov002_022cdc78[];

void *func_ov002_021afbc4(void) {
    return *(void **)(data_ov002_022cdc78 + 0xc);
}
