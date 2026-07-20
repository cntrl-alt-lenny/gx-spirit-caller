/* func_020b41c0: SVC #0x123456 with arg in r1, code 3 in r0 — dispatches
 * to a debugger/kernel hook. swi is privileged, no C equivalent.
 */

asm void func_020b41c0(void) {
    nofralloc
    str     lr, [sp, #-0x4]!
    mov     r1, r0
    mov     r0, #0x3
    swi     0x123456
    ldr     pc, [sp], #0x4
}
