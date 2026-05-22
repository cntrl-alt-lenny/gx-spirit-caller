/* func_0208b0fc: 4-store helper — writes b, a, -a, b to p[0..3].
 *
 * Disassembly (12B, Thumb):
 *
 *     str r2, [r0, #0]    ; p[0] = b
 *     str r1, [r0, #4]    ; p[1] = a
 *     neg r1, r1         ; r1 = -a (in-place)
 *     str r1, [r0, #8]    ; p[2] = -a
 *     str r2, [r0, #12]   ; p[3] = b
 *     bx lr
 *
 * Shipped as `asm void` Thumb (same pattern as src/main/CpuSet.c) —
 * no callers found in relocs (likely a CodeWarrior runtime helper
 * reachable via a function-pointer table or unwind path). Direct
 * source-level write reproduces the orig 12 bytes verbatim.
 */

#pragma thumb on

asm void func_0208b0fc(void) {
    nofralloc
    str r2, [r0, #0]
    str r1, [r0, #4]
    neg r1, r1
    str r1, [r0, #8]
    str r2, [r0, #12]
    bx lr
}

#pragma thumb reset
