/* func_ov002_022477d8: read pointer field at offset 0x5ac of `data_ov002_022ce288`.
 *
 * Sibling of func_020085d4 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0x5ac).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0x5ac]
 *     bx  lr
 * .L_xxxx: .word data_ov002_022ce288
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_ov002_022ce288[];

void *func_ov002_022477d8(void) {
    return *(void **)(data_ov002_022ce288 + 0x5ac);
}
