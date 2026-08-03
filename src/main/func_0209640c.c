/* func_0209640c: tests bit `bit` of a word from a fixed table indexed
 * by `idx`, at a fixed sub-offset. Returns the mask if set, 0 if not.
 * Ships as asm -- mwcc folded the 3-term address expression
 * differently than the original's two-step add+ldr shape.
 */

asm int func_0209640c(int bit, int idx) {
    nofralloc
    ldr r2, =0x027ffc00
    mov r3, #0x1
    add r1, r2, r1, lsl #0x2
    mov r2, r3, lsl r0
    ldr r0, [r1, #0x388]
    ands r0, r2, r0
    moveq r3, #0x0
    mov r0, r3
    bx lr
}
