/* func_0208b0f0: struct-zero-init helper — writes a, 0, 0, b to p[0..3].
 *
 * Disassembly (12B, Thumb):
 *
 *     stmia r0!, {r1}     ; *p++ = a
 *     mov r1, #0
 *     str r2, [r0, #8]    ; old_p[3] = b (= *(p+8) since p has advanced 4)
 *     mov r2, #0
 *     stmia r0!, {r1, r2} ; *p++ = 0; *p++ = 0
 *     bx lr
 *
 * Net memory layout at original r0: [a, 0, 0, b].
 *
 * Shipped as `asm void` Thumb (same pattern as src/main/CpuSet.c) —
 * no callers found in relocs (likely a CodeWarrior runtime helper).
 */

#pragma thumb on

asm void func_0208b0f0(void) {
    nofralloc
    stmia r0!, {r1}
    mov r1, #0
    str r2, [r0, #8]
    mov r2, #0
    stmia r0!, {r1, r2}
    bx lr
}

#pragma thumb reset
