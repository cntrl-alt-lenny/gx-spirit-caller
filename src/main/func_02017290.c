/* func_02017290: read pointer field at offset 0xbb8 of `data_021040ac`.
 *
 * Sibling of func_020085d4 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0xbb8).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0xbb8]
 *     bx  lr
 * .L_xxxx: .word data_021040ac
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_021040ac[];

void *func_02017290(void) {
    return *(void **)(data_021040ac + 0xbb8);
}
