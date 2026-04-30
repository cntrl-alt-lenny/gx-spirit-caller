/* func_0201d030: read pointer field at offset 0x8 of `data_0218febc`.
 *
 * Sibling of func_020085d4 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0x8).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0x8]
 *     bx  lr
 * .L_xxxx: .word data_0218febc
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_0218febc[];

void *func_0201d030(void) {
    return *(void **)(data_0218febc + 0x8);
}
