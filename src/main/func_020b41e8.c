/* func_020b41e8: SVC #0x123456 with selector 0x18 + arg 0. Sibling of
 * func_020b41c0/d4 with a different selector; no stack frame — uses
 * `mov pc, lr` for return rather than the str lr/ldr pc pair.
 */

asm void func_020b41e8(void) {
    nofralloc
    mov     r1, #0x0
    mov     r0, #0x18
    swi     0x123456
    mov     pc, lr
}
