/* func_0202047c: read pointer field at offset 0x40 of `data_02191f40`.
 *
 * Sibling of func_020085d4 (offset 0). Brief 017 cluster propagation +
 * literal-substitution exception (offset = 0x40).
 *
 *     ldr r0, .L_xxxx
 *     ldr r0, [r0, #0x40]
 *     bx  lr
 * .L_xxxx: .word data_02191f40
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_02191f40[];

void *func_0202047c(void) {
    return *(void **)(data_02191f40 + 0x40);
}
