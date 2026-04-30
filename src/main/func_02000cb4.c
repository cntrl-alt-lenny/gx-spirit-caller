/* func_02000cb4: read pointer field at offset 0xb64 of `data_021040ac`.
 *
 * Sibling of func_020085d4 — same `return *(data + N)` shape with a
 * non-zero offset. Brief 017 cluster-propagation surfaced this as a
 * candidate; the literal-substitution rule from brief 016 PR applies
 * (template has offset 0; this sibling has offset 0xb64).
 *
 *     ldr r0, .L_02000cc0
 *     ldr r0, [r0, #0xb64]
 *     bx  lr
 * .L_02000cc0: .word data_021040ac
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern char data_021040ac[];

void *func_02000cb4(void) {
    return *(void **)(data_021040ac + 0xb64);
}
