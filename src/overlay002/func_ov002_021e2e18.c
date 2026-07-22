/* func_ov002_021e2e18: mwcc always collapses this shape (2 constant
 * returns gated by one comparison) to a single shared epilogue with
 * predicated register selection, regardless of C-level restructuring
 * (plain expression, if/else, early-return all compile identically) —
 * the original keeps 2 separate `bx lr` epilogues. Shipped as asm void
 * to match exactly; not a reg-alloc wall (values/registers agree, only
 * the epilogue-sharing choice differs).
 */
asm int func_ov002_021e2e18(int a) {
    nofralloc
    ldr r1, =0x18ec
    cmp r0, r1
    bne lbl_ne
    mov r0, #0x0
    bx lr
lbl_ne:
    mov r0, #0x1
    bx lr
}
