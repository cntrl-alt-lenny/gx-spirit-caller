/* func_020937e4: replace the IRQ+FIQ mask bits (6, 7) of CPSR with the
 * bits passed in r0; return the previous mask bits as r0. Companion to
 * func_020937d0 — restores whatever the caller passes (typically that
 * function's saved-mask result), mirroring the OS_DisableIrq/
 * OS_RestoreIrq pairing (likely OS_RestoreIrqFiq's real NitroSDK
 * identity, but not renamed here — see func_02093790.c for why).
 *
 * mrs/msr are privileged CPSR-access instructions with no C equivalent
 * — ships as `asm void` + `nofralloc`, same technique as
 * src/main/OS_DisableIrq.c (see codegen-walls.md C-12).
 */

asm void func_020937e4(void) {
    nofralloc
    mrs     r1, cpsr
    bic     r2, r1, #0xc0
    orr     r2, r2, r0
    msr     cpsr_c, r2
    and     r0, r1, #0xc0
    bx      lr
}
