/* func_02000cb4: read pointer field at offset 0xb64 of `data_02103fcc`.
 *
 * Sibling of func_020085b8 — same `return *(data + N)` shape with a
 * non-zero offset. Brief 017 cluster-propagation surfaced this as a
 * candidate; the literal-substitution rule from brief 016 PR applies
 * (template has offset 0; this sibling has offset 0xb64).
 *
 *     ldr r0, .L_02000cc0
 *     ldr r0, [r0, #0xb64]
 *     bx  lr
 * .L_02000cc0: .word data_02103fcc
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_02103fcc[];

void *func_02000cb4(void) {
    return *(void **)(data_02103fcc + 0xb64);
}
