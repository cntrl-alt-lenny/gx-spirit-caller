/* func_02018b14: returns 1 if r0 != 2, otherwise leaves the result of
 * `cmp r1, #7` in the flags for the CALLER to branch on directly --
 * no C return value carries this (C has no way to "return flags"),
 * so this can't be expressed in portable C at all.
 */

asm void func_02018b14(void) {
    nofralloc
    cmp     r0, #0x2
    mov     r0, #0x1
    bxne    lr
    cmp     r1, #0x7
    bx      lr
}
