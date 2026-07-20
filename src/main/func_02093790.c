/* func_02093790: clear the IRQ mask bit (CPSR bit 7), re-enabling
 * IRQs; return the previous value of that bit as r0. Sibling of the
 * OS_DisableIrq/OS_RestoreIrq pair — the unconditional enable
 * counterpart to OS_DisableIrq's unconditional disable (likely
 * OS_EnableIrq's real NitroSDK identity, but not renamed here — this
 * brief converts .s -> .c only; renaming a function with existing
 * callers needs every `extern` declaration updated too, out of scope
 * for a single-function conversion).
 *
 * mrs/msr are privileged CPSR-access instructions with no C equivalent
 * — ships as `asm void` + `nofralloc`, same technique as
 * src/main/OS_DisableIrq.c (see codegen-walls.md C-12).
 */

asm void func_02093790(void) {
    nofralloc
    mrs     r0, cpsr
    bic     r1, r0, #0x80
    msr     cpsr_c, r1
    and     r0, r0, #0x80
    bx      lr
}
