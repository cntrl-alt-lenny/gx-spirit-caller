/* func_020937fc: read the CPSR I-bit (IRQ disable bit). Returns 0x80
 * if IRQs are currently disabled, 0 if enabled — the standard NitroSDK
 * query counterpart to OS_DisableIrq's mutating pair (likely
 * OS_GetIrqDisableState's real NitroSDK identity, but not renamed here
 * — see func_02093790.c for why).
 *
 * mrs is a privileged CPSR-access instruction with no C equivalent —
 * ships as `asm void` + `nofralloc`, same technique as
 * src/main/OS_DisableIrq.c (see codegen-walls.md C-12).
 */

asm void func_020937fc(void) {
    nofralloc
    mrs     r0, cpsr
    and     r0, r0, #0x80
    bx      lr
}
