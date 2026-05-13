/* func_0201cfec: read pointer field at offset 0xc of `data_0218fddc`.
 *
 * Sibling of func_020085b8 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0xc).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0xc]
 *     bx  lr
 * .L_xxxx: .word data_0218fddc
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_0218fddc[];

void *func_0201cfec(void) {
    return *(void **)(data_0218fddc + 0xc);
}
