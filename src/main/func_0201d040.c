/* func_0201d040: read pointer field at offset 0xc of `data_0218febc`.
 *
 * Sibling of func_020085d4 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0xc).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0xc]
 *     bx  lr
 * .L_xxxx: .word data_0218febc
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_0218febc[];

void *func_0201d040(void) {
    return *(void **)(data_0218febc + 0xc);
}
