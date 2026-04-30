/* func_02007230: read pointer field at offset 0x4 of `data_02104f3c`.
 *
 * Sibling of func_020085d4 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0x4).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0x4]
 *     bx  lr
 * .L_xxxx: .word data_02104f3c
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_02104f3c[];

void *func_02007230(void) {
    return *(void **)(data_02104f3c + 0x4);
}
