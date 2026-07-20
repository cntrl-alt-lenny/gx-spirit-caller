/* func_020937d0: set both the IRQ (bit 7) and FIQ (bit 6) mask bits of
 * CPSR, disabling both interrupt classes atomically. Returns the
 * previous values of bits 6+7 as r0. Companion to OS_DisableIrq, which
 * only touches the IRQ bit (likely OS_DisableIrqFiq's real NitroSDK
 * identity, but not renamed here — see func_02093790.c for why a bare
 * .s -> .c conversion doesn't also rename).
 *
 * mrs/msr are privileged CPSR-access instructions with no C equivalent
 * — ships as `asm void` + `nofralloc`, same technique as
 * src/main/OS_DisableIrq.c (see codegen-walls.md C-12).
 */

asm void func_020937d0(void) {
    nofralloc
    mrs     r0, cpsr
    orr     r1, r0, #0xc0
    msr     cpsr_c, r1
    and     r0, r0, #0xc0
    bx      lr
}
