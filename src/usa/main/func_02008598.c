/* func_02008598: read pointer field at offset 0x8 of `data_02104e5c`.
 *
 * Sibling of func_020085b8 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0x8).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0x8]
 *     bx  lr
 * .L_xxxx: .word data_02104e5c
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_02104e5c[];

void *func_02008598(void) {
    return *(void **)(data_02104e5c + 0x8);
}
