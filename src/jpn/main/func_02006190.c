/* func_02006190: read pointer field at offset 0x24 of `data_02103c94`.
 *
 * Sibling of func_020085b8 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0x24).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0x24]
 *     bx  lr
 * .L_xxxx: .word data_02103c94
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_02103c94[];

void *func_02006190(void) {
    return *(void **)(data_02103c94 + 0x24);
}
