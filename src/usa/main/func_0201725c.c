/* func_0201725c: read pointer field at offset 0xbb8 of `data_02103fcc`.
 *
 * Sibling of func_020085b8 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0xbb8).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0xbb8]
 *     bx  lr
 * .L_xxxx: .word data_02103fcc
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_02103fcc[];

void *func_0201725c(void) {
    return *(void **)(data_02103fcc + 0xbb8);
}
