/* func_020b41d4: SVC #0x123456 with arg-1 = 0, code 7. Sibling of
 * func_020b41c0 with a different selector + zero arg.
 */

asm void func_020b41d4(void) {
    nofralloc
    str     lr, [sp, #-0x4]!
    mov     r1, #0x0
    mov     r0, #0x7
    swi     0x123456
    ldr     pc, [sp], #0x4
}
