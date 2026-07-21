/* func_ov002_021ae70c: Packs three small bitfields into a word (nibble | nibble<<4 | byte<<8, shifted) and forwards to func_ov002_0229ade0 with two fixed leading constants (49, 10).
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_0229ade0(void);

asm void func_ov002_021ae70c(void) {
    nofralloc
    stmdb sp!, {r3, lr}
    ldr ip, [sp, #8]
    and lr, r2, #15
    and r2, ip, #15
    orr r2, lr, r2, lsl #4
    and r3, r3, #255
    and r2, r2, #255
    orr r2, r2, r3, lsl #8
    mov r2, r2, lsl #16
    mov r2, r2, lsr #16
    mov r3, r2, lsl #16
    mov r1, r1, lsl #16
    mov r2, r0
    orr r3, r3, r1, lsr #16
    mov r0, #49
    mov r1, #10
    bl  func_ov002_0229ade0
    ldmia sp!, {r3, pc}
}
