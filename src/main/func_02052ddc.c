/* func_02052ddc: register-reshuffling tail call into func_0205337c
 * (itself still unmatched -- its real signature isn't known from a
 * converted sibling, so this ships as asm rather than guess it).
 * new_r0 = old_r1; new_r1 = *(old_r0 + 0x24); tail-call via pool-
 * loaded address + bx (not bl -- no return to this frame).
 */

extern void func_0205337c(void);

asm void func_02052ddc(void) {
    nofralloc
    ldr     ip, =func_0205337c
    mov     r3, r0
    mov     r0, r1
    ldr     r1, [r3, #0x24]
    bx      ip
}
