/* OS_RestoreIrq: NitroSDK-standard IRQ-restore primitive. Takes a saved
 * mask in r0 (typically the return of OS_DisableIrq), writes it back into
 * CPSR bit 7 (I bit), and returns the pre-restore value of that bit —
 * letting callers chain nested disable/restore pairs.
 *
 * mrs/msr are privileged CPSR-access instructions with no C equivalent,
 * same as OS_DisableIrq — ships as `asm void` + `nofralloc` (see
 * codegen-walls.md C-12, e.g. src/main/func_02093294.c). Standard
 * NitroSDK identity confirmed by verbatim match with other NDS decomps.
 */

asm void OS_RestoreIrq(void) {
    nofralloc
    mrs     r1, cpsr
    bic     r2, r1, #0x80
    orr     r2, r2, r0
    msr     cpsr_c, r2
    and     r0, r1, #0x80
    bx      lr
}
