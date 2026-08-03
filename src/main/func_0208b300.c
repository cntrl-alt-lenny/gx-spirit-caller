/* func_0208b300: transposes a 3x3 matrix into the top-left of a 4x3
 * output, zeroing the translation row. Ships as asm -- mwcc's
 * per-element load/store from array indexing (23 words) never
 * reaches the original's ldm/stm block-transfer form (11 words); no
 * standard C idiom requests register-block transfers on this
 * toolchain.
 */

asm void func_0208b300(int *in, int *out) {
    nofralloc
    stmdb sp!, {r4, r5, r6, r7, r8, r9}
    ldmia r0, {r2, r3, r4, r5, r6, r7, r8, r9, ip}
    stmia r1!, {r2, r5, r8}
    stmia r1!, {r3, r6, r9}
    stmia r1!, {r4, r7, ip}
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    str r0, [r1, #0x8]
    ldmia sp!, {r4, r5, r6, r7, r8, r9}
    bx lr
}
