/* func_02007214: read pointer field at offset 0x4 of `data_02104e5c`.
 *
 * Sibling of func_020085b8 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0x4).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0x4]
 *     bx  lr
 * .L_xxxx: .word data_02104e5c
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_02104e5c[];

void *func_02007214(void) {
    return *(void **)(data_02104e5c + 0x4);
}
