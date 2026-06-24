; func_02096264 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_02096264
        .arm
func_02096264:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [sp]
    and r0, r0, #0x1f
    bic r3, r3, #0x1f
    orr ip, r3, r0
    bic r3, ip, #0x20
    and r0, r2, #0x1
    orr r3, r3, r0, lsl #0x5
    str ip, [sp]
    and r2, r3, #0x3f
    bic r0, r1, #-67108864
    orr r0, r2, r0, lsl #0x6
    str r3, [sp]
    ldr r2, _LIT0
    str r0, [sp]
    ldrh r0, [r2]
    ands r0, r0, #0x4000
    ldrneh r1, [r2]
    addne sp, sp, #0x4
    mvnne r0, #0x0
    orrne r1, r1, #0xc000
    strneh r1, [r2]
    ldmnefd sp!, {lr}
    bxne lr
    bl OS_DisableIrq
    ldr r1, _LIT0
    ldrh r1, [r1]
    ands r1, r1, #0x2
    beq .L_1b0
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mvn r0, #0x1
    ldmfd sp!, {lr}
    bx lr
.L_1b0:
    ldr r2, [sp]
    ldr r1, _LIT1
    str r2, [r1]
    bl OS_RestoreIrq
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x04000184
_LIT1: .word 0x04000188
