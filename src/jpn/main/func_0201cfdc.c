/* func_0201cfdc: read pointer field at offset 0x8 of `data_0218fddc`.
 *
 * Sibling of func_020085b8 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0x8).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0x8]
 *     bx  lr
 * .L_xxxx: .word data_0218fddc
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_0218fddc[];

void *func_0201cfdc(void) {
    return *(void **)(data_0218fddc + 0x8);
}
